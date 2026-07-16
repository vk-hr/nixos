{
  pkgs,
  lib,
  ...
}:

{
  boot = {
    initrd.systemd.enable = true;

    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;

      limine = {
        enable = true;
        efiSupport = true;
        enableEditor = false;
        secureBoot.enable = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "mem_sleep_default=s2idle"
      "intel_idle.max_cstate=9"
    ];

    kernelModules = [
      "dell-laptop"
      "dell-wmi"
      "dell-smbios"
      "dell-smm-hwmon"
      "dell-wmi-ddv"
      "dell-wmi-sysman"
    ];
  };

  environment.systemPackages = [ pkgs.sbctl ];
}
