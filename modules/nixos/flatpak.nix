{ ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "com.spotify.Client"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    overrides.global.Context.sockets = [ "wayland" "!x11" "!fallback-x11" ];
  };
}
