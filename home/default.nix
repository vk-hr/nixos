{ inputs, ... }:
let
  lib = inputs.self.lib;
in
{
  flake.homeConfigurations = {
    "vkhr@laptop" = lib.mkHome {
      system = "x86_64-linux";
      homeModule = ./vkhr + "@laptop.nix";
    };
  };
}
