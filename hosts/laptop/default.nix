{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/laptop.nix
  ];

  networking.hostName = "nixos";
  system.stateVersion = "26.05";
}
