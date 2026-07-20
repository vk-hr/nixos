{ pkgs, lib, ... }:

{
  home = {
    username = "vkhr";
    homeDirectory = "/home/vkhr";
    stateVersion = "26.05";
    pointerCursor = {
      enable = true;
      name = lib.mkDefault "Adwaita";
      package = lib.mkDefault pkgs.adwaita-icon-theme;
      size = lib.mkDefault 24;
    };
  };

  programs.home-manager.enable = true;
}
