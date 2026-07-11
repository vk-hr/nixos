_: {
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.nix-output-monitor
          pkgs.nix-tree
          pkgs.nix-top
          pkgs.comma
        ];
      };
    };
}
