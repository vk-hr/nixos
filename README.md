# nixos

Personal NixOS configuration for a single-user Intel Dell laptop (host `laptop`).

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
