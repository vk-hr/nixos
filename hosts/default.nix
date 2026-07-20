{ inputs, ... }:
let
  lib = import ../lib { inherit inputs; };
in
{
  flake = {
    inherit lib;

    nixosModules.default = ../modules/nixos;
    homeModules.default = ../modules/home;

    nixosConfigurations = {
      laptop = lib.mkHost {
        system = "x86_64-linux";
        hostModule = ./laptop;
        homeModule = ../home/laptop-vkhr.nix;
        username = "vkhr";
      };
    };
  };
}
