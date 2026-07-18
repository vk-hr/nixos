{ config, lib, ... }:
{
  boot.loader.limine.style = {
    wallpapers = lib.mkForce [ ];
    backdrop = config.lib.stylix.colors.base00;
    interface = {
      branding = "";
      helpHidden = true;
      resolution = "2880x1800x32";
    };
  };
}
