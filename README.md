# nixos

Personal NixOS configuration for a single-user Intel Dell laptop.

## structure

- `flake.nix` — entry point; defines inputs, outputs, formatter, and hosts
- `lib/` — helper functions and shared theme (colors, font)
- `hosts/` — host configurations (`hosts/<hostname>/`)
- `hosts/common/` — shared host configuration (modules, secrets, impermanence)
- `modules/` — NixOS system modules
- `home/` — home-manager configuration for user `empty`
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

# update flake inputs
just update

# edit or re-encrypt secrets
just secret-edit ssh-github
just secret-rekey
```

## secrets

Secrets are encrypted with `ragenix` (a Rust reimplementation of `agenix`).
The public key is defined in `secrets.nix`.
The age identity is expected at `/persist/home/empty/.config/age/age.key`.

## notable features

- Impermanent root on Btrfs, persisted under `/persist`
- niri Wayland compositor with xwayland support
- Home-manager as a NixOS module
- Secrets managed with `ragenix`
- Flatpak managed declaratively via `nix-flatpak`
- Rust toolchain via `fenix`
- Multi-format formatting via `treefmt-nix`
