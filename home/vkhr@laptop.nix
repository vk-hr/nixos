{ pkgs, lib, ... }:

{
  home = {
    username = "vkhr";
    homeDirectory = "/home/vkhr";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;

  stylix.base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/black-metal-immortal.yaml";
}
