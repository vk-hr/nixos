{ colors, ... }:

{
  programs.lazydocker = {
    enable = true;
    settings = {
      gui.theme = {
        activeBorderColor = [
          colors.accent
          "bold"
        ];
        inactiveBorderColor = [ colors.selection_background ];
      };
    };
  };
}
