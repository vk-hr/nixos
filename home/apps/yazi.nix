{ colors, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;

    extraPackages = with pkgs; [
      poppler-utils
      ffmpegthumbnailer
      unzip
      jq
      imagemagick
      fd
    ];

    settings.manager = {
      ratio = [ 1 3 4 ];
      show_hidden = false;
      sort_by = "alphabetical";
      sort_dir_first = true;
    };

    theme.manager = {
      cwd.fg = colors.accent;
      hovered = {
        bg = colors.selection_background;
        fg = colors.foreground;
      };
      border_style.fg = colors.palette."8";
    };
  };
}
