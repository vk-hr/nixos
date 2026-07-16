{ pkgs, config, ... }:

{
  fonts.packages = [ pkgs.nerd-fonts.iosevka-term ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ config.stylix.fonts.monospace.name ];
  };
}
