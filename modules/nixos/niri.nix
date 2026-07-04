{ pkgs, ... }:

{
  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-termfilechooser
    ];
    config.common = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
    };
  };

  programs.dconf.enable = true;
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;
  programs.xwayland.enable = true;
}
