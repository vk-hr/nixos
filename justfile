# show available commands
default:
    @just --list

# format all nix files
fmt:
    nix fmt .

# lint nix files
lint:
    statix check .

# validate flake
check:
    nix flake check

# update all flake inputs
update:
    nix flake update

# update a specific input (e.g. `just update-input nixpkgs`)
update-input input:
    nix flake update {{input}}

# build the system without switching
build:
    sudo nixos-rebuild build --flake .#nixos

# build and switch immediately
switch:
    sudo nixos-rebuild switch --flake .#nixos

# try the configuration without making it default
test:
    sudo nixos-rebuild test --flake .#nixos

# edit an agenix secret (e.g. `just secret-edit ssh-github`)
secret-edit name:
    agenix -e secrets/{{name}}.age

# re-encrypt all secrets after changing keys
secret-rekey:
    agenix -r

# show why a package is in the system closure (e.g. `just why firefox`)
why package:
    nix why-depends .#nixosConfigurations.nixos.config.system.build.toplevel nixpkgs#{{package}}

# list recent system generations
history:
    nix-env --list-generations --profile /nix/var/nix/profiles/system

# rollback to previous generation
rollback:
    sudo nixos-rebuild rollback --flake .#nixos

# show diff between current and previous generation
diff:
    nvd diff /run/current-system result

# garbage collect old generations (keep last 7 days)
gc:
    sudo nix-collect-garbage --delete-older-than 7d

# commit all changes (e.g. `just commit "add feature"`)
commit msg:
    git add -A && git commit -m "{{msg}}"
