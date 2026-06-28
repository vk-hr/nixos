{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "mem_sleep_default=s2idle"
    "intel_idle.max_cstate=9"
  ];

  boot.kernelModules = [
    "dell-laptop"
    "dell-wmi"
    "dell-smbios"
    "dell-smm-hwmon"
    "dell-wmi-ddv"
    "dell-wmi-sysman"
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.empty = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
    ];
  };

  security.sudo.wheelNeedsPassword = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

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
