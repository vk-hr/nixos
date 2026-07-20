{ config, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ config.stylix.fonts.monospace.name ];
  };
}
