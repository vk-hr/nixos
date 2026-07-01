{
  font,
  colors,
  ...
}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "${font.mono}:size=12";
        prompt = ">> ";
        lines = 10;
        width = 40;
        horizontal-pad = 8;
        vertical-pad = 4;
        inner-pad = 4;
      };
      colors =
        let
          argb = c: "${builtins.substring 1 6 c}ff";
        in
        {
          background = argb colors.background;
          text = argb colors.foreground;
          match = argb colors.accent;
          selection = argb colors.selection_background;
          selection-text = argb colors.selection_foreground;
          border = argb colors.accent;
        };
    };
  };
}
