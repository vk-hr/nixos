{
  services.btrfs.autoScrub.enable = true;

  services.btrbk.instances.local = {
    onCalendar = "daily";
    settings = {
      volume = {
        "/persist" = {
          subvolume = ".";
          snapshot_dir = ".snapshots";
          snapshot_preserve_min = "2d";
          snapshot_preserve = "7d 4w";
        };
      };
    };
  };
}
