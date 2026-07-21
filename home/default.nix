{ inputs, ... }:
let
  lib = inputs.self.lib;
in
{
  flake.homeConfigurations = {
    "vkhr@laptop" = lib.mkHome {
      system = "x86_64-linux";
      homeModule = ./. + "/laptop@vkhr.nix";
      username = "vkhr";
    };
  };
}
