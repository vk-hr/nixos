{ ... }:

{
  imports = [
    ./hardware.nix
    ./disko.nix
    ../../modules/nixos
  ];

  networking.hostName = "laptop";
  system.stateVersion = "26.05";
}
