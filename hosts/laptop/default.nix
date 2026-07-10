{ lib, ... }:

{
  imports = [
    ./hardware.nix
    ./disko.nix
    ../../modules/nixos
  ];

  boot.initrd.luks.devices.cryptroot.device = lib.mkForce "/dev/nvme0n1p1";

  fileSystems."/boot".device = lib.mkForce "/dev/nvme0n1p3";
  swapDevices = lib.mkForce [ { device = "/dev/nvme0n1p2"; } ];

  networking.hostName = "laptop";
  system.stateVersion = "26.05";
}
