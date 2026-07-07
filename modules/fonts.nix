{
  pkgs,
  font,
  ...
}:

{
  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "${font.mono}" ];
  };
}
