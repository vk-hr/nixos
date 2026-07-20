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
        maxGenerations = 4;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "mem_sleep_default=s2idle"
      "intel_idle.max_cstate=9"
    ];
  };

  environment.systemPackages = [ pkgs.sbctl ];
}
