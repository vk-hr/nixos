{ pkgs, ... }:

{
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
    nushell
    nh
  ];
}
