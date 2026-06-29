{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
    ];
  };

  security.sudo.wheelNeedsPassword = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    pciutils
    usbutils
    nvme-cli
    smartmontools
    powertop
    alsa-utils
    sof-tools
    pipewire
    pavucontrol
  ];
}
