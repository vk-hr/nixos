{
  font,
  colors,
  ...
}:

{
  programs.ghostty = {
    enable = true;
    settings = {
      background = colors.background;
      foreground = colors.foreground;
      selection-background = colors.selection_background;
      selection-foreground = colors.selection_foreground;
      palette = [
        "0=${colors.palette."0"}"
        "1=${colors.palette."1"}"
        "2=${colors.palette."2"}"
        "3=${colors.palette."3"}"
        "4=${colors.palette."4"}"
        "5=${colors.palette."5"}"
        "6=${colors.palette."6"}"
        "7=${colors.palette."7"}"
        "8=${colors.palette."8"}"
        "9=${colors.palette."9"}"
        "10=${colors.palette."10"}"
        "11=${colors.palette."11"}"
        "12=${colors.palette."12"}"
        "13=${colors.palette."13"}"
        "14=${colors.palette."14"}"
        "15=${colors.palette."15"}"
      ];
      font-family = font.mono;
      font-size = 12;
      window-padding-x = 8;
      window-padding-y = 4;
      window-decoration = false;
    };
  };
}
