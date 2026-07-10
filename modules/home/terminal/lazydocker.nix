{ config, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  programs.lazydocker = {
    enable = true;
    settings = {
      gui.theme = {
        activeBorderColor = [
          colors.base0D
          "bold"
        ];
        inactiveBorderColor = [ colors.base02 ];
      };
    };
  };
}
