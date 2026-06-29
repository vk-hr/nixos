# nixos

Personal NixOS configuration for the `nixos` laptop.

## Structure

- `flake.nix` — flake inputs and outputs.
- `lib/` — helper functions for building hosts.
- `hosts/` — per-host configuration.
  - `common/` — modules shared across all hosts.
  - `nixos/` — current laptop.
- `modules/nixos/` — reusable NixOS feature modules.
- `home/` — Home Manager configuration for user `empty`.
- `secrets.nix` — agenix public keys.
- `secrets/` — encrypted secrets.

## Rebuild

```bash
sudo nixos-rebuild switch --flake .#nixos
```

## Format

```bash
nix fmt
```

## Secrets

Secrets are managed with [agenix](https://github.com/ryantm/agenix).
The age public key is derived from the SSH host key.

To edit the GitHub SSH key:

```bash
agenix -e secrets/ssh-github.age
```

## Persistence

System state is persisted to `/persist/system` and user state to
`/persist/home` using [impermanence](https://github.com/nix-community/impermanence).
