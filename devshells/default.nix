{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      pre-commit = inputs.git-hooks.lib.${pkgs.system}.run {
        src = ../.;
        hooks = {
          statix.enable = true;
          deadnix.enable = true;
        };
      };
    in
    {
      checks.pre-commit = pre-commit;
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.nix-output-monitor
          pkgs.nix-tree
          pkgs.nix-top
          pkgs.comma
        ];
        inherit (pre-commit) shellHook;
      };
    };
}
