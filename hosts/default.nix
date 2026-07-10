{ inputs, ... }:
let
  lib = import ../lib { inherit inputs; };
in
{
  flake.lib = lib;

  flake.nixosConfigurations = {
    laptop = lib.mkHost {
      system = "x86_64-linux";
      hostModule = ./laptop;
      homeModule = ../home + "/vkhr@laptop.nix";
    };
  };
}
