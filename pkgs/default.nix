{ inputs, ... }:
{
  perSystem =
    {
      pkgs,
      ...
    }:
    let
      treefmt = inputs.treefmt-nix.lib.evalModule pkgs {
        programs = {
          nixfmt.enable = true;
          gofmt.enable = true;
          rustfmt.enable = true;
          biome.enable = true;
          ruff-format.enable = true;
          clang-format.enable = true;
          shfmt.enable = true;
        };
      };
    in
    {
      formatter = treefmt.config.build.wrapper;
      checks = {
        formatting = treefmt.config.build.check inputs.self;
      };
    };
}
