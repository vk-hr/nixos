{ pkgs, ... }:

{
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-immortal.yaml";

    fonts = {
      monospace = {
        name = "IosevkaTerm Nerd Font";
        package = pkgs.nerd-fonts.iosevka-term;
      };
      sansSerif = {
        name = "Iosevka Aile";
        package = pkgs.iosevka-bin.override { variant = "Aile"; };
      };
      serif = {
        name = "Iosevka Etoile";
        package = pkgs.iosevka-bin.override { variant = "Etoile"; };
      };
    };

    cursor = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };

    polarity = "dark";

    targets = {
      chromium.enable = false;
    };
  };
}
