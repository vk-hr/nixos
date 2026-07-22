_:

{
  services.flatpak = {
    enable = true;
    packages = [
      "com.spotify.Client"
      "com.valvesoftware.Steam"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    overrides = {
      global.Context.sockets = [
        "wayland"
        "!x11"
        "!fallback-x11"
      ];
      "com.valvesoftware.Steam".Context.sockets = [ "x11" ];
    };
  };
}
