{ pkgs, ... }:

{
  programs.dconf.enable = true;

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;
  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
