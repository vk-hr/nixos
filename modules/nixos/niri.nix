{ pkgs, ... }:

{
  programs.dconf.enable = true;

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;
  programs.xwayland.enable = true;
}
