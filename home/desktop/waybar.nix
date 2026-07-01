{ font, ... }:

{
  programs.waybar = {
    enable = true;
    style = ''
      * {
          font-family: "${font.mono}";
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [ "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "network"
          "battery"
        ];

        "niri/workspaces".format = "{index}";

        clock.format = "{:%H:%M  %a %b %d}";

        network = {
          format-wifi = "NET {essid} ({signalStrength}%)";
          format-ethernet = "NET {ipaddr}/{cidr}";
          format-disconnected = "NET offline";
        };

        battery = {
          format = "BAT {capacity}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          states = {
            warning = 30;
            critical = 15;
          };
        };

        tray.spacing = 10;
      };
    };
  };
}
