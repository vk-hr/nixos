{
  lib,
  pkgs,
  config,
  ...
}:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu.verbatimConfig = ''
      namespaces = []
      cgroup_device_acl = [
        "/dev/null", "/dev/full", "/dev/zero",
        "/dev/random", "/dev/urandom",
        "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
        "/dev/rtc", "/dev/hpet", "/dev/vfio/vfio",
        "/dev/kvmfr0"
      ]
    '';
  };

  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  boot = {
    extraModulePackages = [ config.boot.kernelPackages.kvmfr ];
    initrd.kernelModules = [ "kvmfr" ];
    kernelParams = [ "kvmfr.static_size_mb=64" ];
  };

  services.udev.packages = lib.singleton (
    pkgs.writeTextFile {
      name = "kvmfr";
      text = ''
        SUBSYSTEM=="kvmfr", GROUP="kvm", MODE="0660", TAG+="uaccess"
      '';
      destination = "/etc/udev/rules.d/70-kvmfr.rules";
    }
  );

  environment.systemPackages = with pkgs; [
    qemu
    virt-viewer
    looking-glass-client
  ];
}
