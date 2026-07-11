{ ... }:

{
  imports = [
    ./hardware.nix
    ./disko.nix
    ../../modules/nixos
  ];

  boot.resumeDevice = "/dev/mapper/cryptroot";
  boot.kernelParams = [
    "resume_offset=TODO"
  ];

  networking.hostName = "laptop";
  system.stateVersion = "26.05";
}
