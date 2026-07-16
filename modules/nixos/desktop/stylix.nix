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
      plymouth = {
        logo = pkgs.runCommand "transparent-1x1.png" { } ''
          ${pkgs.imagemagick}/bin/convert -size 1x1 xc:transparent $out
        '';
        logoAnimated = false;
      };
    };
  };
}
