# show available commands
default:
    @just --list

# format all nix files
fmt:
    nix fmt .

# lint nix files
lint:
    statix check .

# check for dead code (unused bindings)
dead-code:
    nix run nixpkgs#deadnix -- --fail .

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
    nh os build .

# build and switch immediately
switch:
    nh os switch .

# try the configuration without making it default
test:
    nh os test .

# switch home configuration
home:
    nh home switch .

# edit a ragenix secret (e.g. `just secret-edit ssh-github`)
secret-edit name:
    ragenix -e secrets/{{name}}.age

# re-encrypt all secrets after changing keys
secret-rekey:
    ragenix -r

# show why a package is in the system closure (e.g. `just why firefox`)
why package:
    nix why-depends .#nixosConfigurations.laptop.config.system.build.toplevel nixpkgs#{{package}}

# list recent system generations
history:
    nix-env --list-generations --profile /nix/var/nix/profiles/system

# rollback to previous generation
rollback:
    sudo nixos-rebuild switch --rollback --flake .#laptop

# show diff between current and previous generation
diff:
    nvd diff /run/current-system result

# garbage collect old generations (keep last 7 days)
gc:
    nh clean all -k 7

# commit all changes (e.g. `just commit "add feature"`)
commit msg:
    git add -A && git commit -m "{{msg}}"
