{
  config,
  pkgs,
  lib,
  ...
}:
let
  colors = config.lib.stylix.colors;
in
{
  services.displayManager = {
    ly = {
      enable = true;
      settings = {
        animation = "none";
        bg = "0x00${colors.base00}";
        fg = "0x00${colors.base05}";
        border_fg = "0x00${colors.base0B}";
        error_fg = "0x01${colors.base08}";
        error_bg = "0x00${colors.base00}";
        hide_version_string = true;
        hide_key_hints = true;
        hide_keyboard_locks = true;
        text_in_center = true;
      };
    };
    sessionPackages = lib.mkForce [ config.programs.niri.package ];
  };

  console = {
    font = "ter-u32n";
    packages = [ pkgs.terminus_font ];
  };

  systemd.services.display-manager.serviceConfig.ExecStartPre = [
    "-${pkgs.kbd}/bin/setfont ${config.console.font} -C /dev/tty1"
  ];
}
