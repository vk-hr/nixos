{ config, lib, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  boot.loader.limine.style = {
    wallpapers = lib.mkForce [ ];
    graphicalTerminal.font.scale = "2x2";
    interface = {
      branding = "NixOS";
      brandingColor = colors.base0B;
      helpHidden = false;
      helpColor = colors.base0B;
      helpColorBright = colors.base0A;
      resolution = "2880x1800";
    };
  };
}
