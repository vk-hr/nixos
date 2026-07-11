# nixos

Personal NixOS configuration for a single-user Intel Dell laptop (host `laptop`).

## features

- **Disk layout**: LUKS-encrypted BTRFS with tmpfs ephemeral root
- **Secure Boot**: via [lanzaboote](https://github.com/nix-community/lanzaboote) with custom keys
- **Hibernation**: 34G swapfile inside LUKS (supports resume)
- **State management**: [preservation](https://github.com/nix-community/preservation) for persistent system and home state
- **Secrets**: [ragenix](https://github.com/yaxitech/ragenix) (age-encrypted)
- **Compositor**: [niri](https://github.com/sodiboo/niri-flake)
- **Home Manager**: declarative user packages and dotfiles

### disk layout

| partition | size | type | content |
|-----------|------|------|---------|
| ESP | 512M | EF00 | vfat, mounted at `/boot` |
| luks | 100% | - | LUKS container (`cryptroot`) |

Inside the LUKS container (BTRFS):

| subvolume | mountpoint | purpose |
|-----------|------------|---------|
| `@nix` | `/nix` | Nix store |
| `@persist` | `/persist` | Persistent state (preservation source) |
| `@swap` | `/.swapvol` | Swapfile (34G) for hibernation |

`/` is tmpfs (ephemeral, 8G max). System and home state are bind-mounted from `/persist` via preservation on each boot.

## installation (fresh system)

### prerequisites

- NixOS live USB (latest minimal or graphical ISO)
- Target disk: `/dev/nvme0n1` (change in `hosts/laptop/disko.nix` if different)

### step 1 — boot live usb

Boot the NixOS live image and open a terminal.

### step 2 — clone the repo

```bash
git clone <repo-url> /tmp/nixos
cd /tmp/nixos
```

### step 3 — format the disk with disko

This destroys all data on `/dev/nvme0n1`.

```bash
sudo nix run github:nix-community/disko -- --mode destroy,format,mount --flake .#laptop
```

After this, filesystems are mounted under `/mnt`.

### step 4 — generate secrets

**Age key** (for ragenix secret decryption):

```bash
sudo mkdir -p /mnt/persist/home/vkhr/.config/age
nix shell nixpkgs#age -c age-keygen -o /mnt/persist/home/vkhr/.config/age/age.key
```

The public key in `secrets.nix` must match this key. If you are setting up a new machine, update the public key in `secrets.nix` and re-encrypt secrets:

```bash
nix shell nixpkgs#ragenix -c ragenix -r
```

**Secure Boot keys** (for lanzaboote):

```bash
# Generate keys on the live system
sudo nix shell nixpkgs#sbctl -c sbctl create-keys

# Copy to persistent storage (survives across reboots via preservation)
sudo cp -r /var/lib/sbctl /mnt/persist/var/lib/sbctl

# Make keys visible during nixos-install (preservation bind-mounts are not active yet)
sudo mkdir -p /mnt/var/lib/sbctl
sudo mount --bind /var/lib/sbctl /mnt/var/lib/sbctl
```

### step 5 — install nixos

```bash
sudo nixos-install --flake .#laptop
```

Set the root password when prompted, then reboot:

```bash
sudo reboot
```

### step 6 — enable secure boot

After first boot, the system runs with lanzaboote-signed binaries but Secure Boot is not yet enforced in firmware.

1. Enter UEFI/BIOS setup (F12 on Dell during boot).
2. Navigate to **Security > Secure Boot**.
3. Set Secure Boot to **enabled**.
4. Select **Reset to Setup Mode** (places firmware in Setup Mode so keys can be enrolled).
5. Save and exit (F10). Boot into NixOS.

Enroll your keys (includes Microsoft keys for hardware compatibility):

```bash
sudo sbctl enroll-keys --microsoft
```

Reboot. Verify Secure Boot is active:

```bash
bootctl status | grep "Secure Boot"
# Should show: enabled (user)
```

### step 7 — enable hibernation

Get the swapfile offset:

```bash
sudo btrfs inspect-internal map-swapfile -r /.swapvol/swapfile
```

Edit `hosts/laptop/default.nix` and replace `TODO` with the number:

```nix
boot.kernelParams = [
  "resume_offset=<number-from-above>"
];
```

Rebuild and switch:

```bash
just switch
```

Test hibernation:

```bash
systemctl hibernate
```

## workflow

```bash
# format and lint all nix files
just fmt
just lint

# build without switching
just build

# switch to the new configuration
just switch

# test the configuration without making it default
just test

# switch home configuration
just home

# update flake inputs
just update

# edit or re-encrypt secrets
just secret-edit ssh-github
just secret-rekey
```

## secrets

Secrets are encrypted with `ragenix` (a Rust reimplementation of `agenix`).
The public key is defined in `secrets.nix`.
The age identity is expected at `/persist/home/vkhr/.config/age/age.key` (persisted via preservation).
