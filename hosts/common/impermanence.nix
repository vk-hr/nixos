{
  environment.persistence."/persist/system" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/etc/machine-id"
      "/etc/ssh"
      "/var/lib/NetworkManager"
      "/var/lib/bluetooth"
      "/var/lib/systemd"
      "/var/lib/nixos"
      "/var/log"
    ];
  };
}
