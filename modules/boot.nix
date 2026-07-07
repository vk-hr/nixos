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
}
