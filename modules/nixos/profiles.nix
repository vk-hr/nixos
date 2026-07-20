{ lib, ... }:
{
  options.profiles = {
    gaming.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable gaming support (Steam, gamescope, gamemode).";
    };

    libvirt.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable libvirtd/QEMU virtualization support.";
    };
  };
}
