{
  environment.persistence."/persist/system" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/lib/NetworkManager"
      "/var/lib/bluetooth"
      "/var/lib/systemd"
      "/var/lib/nixos"
      "/var/log"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
