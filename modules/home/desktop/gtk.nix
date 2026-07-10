{ pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Yaru-red";
      package = pkgs.yaru-theme;
    };
  };
}
