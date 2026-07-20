{ config, ... }:

{
  users.users.vkhr = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets.password.path;
    extraGroups = [
      "wheel"
      "docker"
      "libvirtd"
      "kvm"
      "video"
    ];
  };
}
