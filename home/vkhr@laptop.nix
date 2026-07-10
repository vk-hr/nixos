{ config, pkgs, ... }:

{
  home.username = "vkhr";
  home.homeDirectory = "/home/vkhr";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ../modules/home/core
    ../modules/home/shell
    ../modules/home/terminal
    ../modules/home/editor
    ../modules/home/desktop
    ../modules/home/apps
    ../modules/home/dev
  ];
}
