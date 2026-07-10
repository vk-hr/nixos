{ pkgs, config, ... }:

{
  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ config.stylix.fonts.monospace.name ];
  };
}
