{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [
      "kvm-intel"
      "dell-laptop"
      "dell-wmi"
      "dell-smbios"
      "dell-smm-hwmon"
      "dell-wmi-ddv"
    ];
    blacklistedKernelModules = [ "dell_wmi_sysman" ];
    extraModulePackages = [ ];
  };

  fileSystems."/nix".neededForBoot = lib.mkDefault true;
  fileSystems."/persist".neededForBoot = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.npu.enable = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
