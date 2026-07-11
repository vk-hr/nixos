{
  pkgs,
  lib,
  ...
}:

{
  boot.initrd.systemd.enable = true;

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

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

  environment.systemPackages = [ pkgs.sbctl ];
}
