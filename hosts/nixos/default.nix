{ ... }:

{
  imports = [
    ./hardware.nix
    ../common
  ];

  networking.hostName = "nixos";
  system.stateVersion = "26.05";
}
