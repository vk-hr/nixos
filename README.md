# nixos

Personal NixOS configuration for a single-user Intel Dell laptop (host `laptop`).

## structure

- `flake.nix` — entry point; imports `./hosts`, `./home`, `./pkgs`, `./devshells`
- `lib/` — factory functions: `mkHost`, `mkHome`
- `hosts/` — per-machine NixOS configurations (`hosts/<hostname>/`)
- `hosts/<hostname>/disko.nix` — declarative disk layout for that machine
- `modules/nixos/` — NixOS system modules organized by topic
  - `core/` — boot, users, impermanence, btrfs, nix settings
  - `desktop/` — niri, wayland, pipewire, stylix
  - `networking/` — networkmanager, firewall, ssh
  - `hardware/` — bluetooth, printing, power, graphics
  - `services/` — docker, libvirt, flatpak
- `modules/home/` — reusable home-manager modules organized by topic
- `home/` — flake-parts module exporting `flake.homeConfigurations`
- `home/vkhr@laptop.nix` — home-manager entry for user `vkhr` on host `laptop`
- `themes/` — base16 color schemes (Black Metal variants)
- `pkgs/` — perSystem packages and formatter
- `devshells/` — perSystem dev shells
- `secrets/` — age-encrypted secrets managed with `ragenix`
- `justfile` — common tasks (build, switch, fmt, lint, secrets, gc)

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
The age identity is expected at `/persist/home/vkhr/.config/age/age.key`.

## notable features

- Flake-parts architecture
- Explicit imports only (no auto-import loaders)
- Btrfs with LUKS, compression, and snapshots via `btrbk`
- Declarative disk layout with `disko`
- Consistent theming via `stylix` (Black Metal base16 schemes)
- Impermanence for system and selected home state
- niri Wayland compositor with xwayland support
- Home-manager as a NixOS module
- Secrets managed with `ragenix`
- Flatpak managed declaratively via `nix-flatpak`
- Rust toolchain via `fenix`
- Multi-format formatting via `treefmt-nix`
