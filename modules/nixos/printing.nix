{
  services.fstrim.enable = true;

  services.hardware.bolt.enable = true;

  services.libinput.enable = true;

  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.thermald.enable = true;
}
