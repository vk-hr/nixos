{
  pkgs,
  colors,
  ...
}:

{
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.libadwaita;
    };
    iconTheme = {
      name = "Yaru-red";
      package = pkgs.yaru-theme;
    };
    gtk3.extraCss = ''
      @define-color theme_bg_color ${colors.background};
      @define-color theme_fg_color ${colors.foreground};
      @define-color accent_color ${colors.accent};
    '';
    gtk4.extraCss = ''
      @define-color window_bg_color ${colors.background};
      @define-color window_fg_color ${colors.foreground};
      @define-color accent_bg_color ${colors.accent};
    '';
  };
}
