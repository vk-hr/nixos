{ font, ... }:

{
  programs.waybar = {
    enable = true;
    style = ''
      * {
          font-family: "JetBrainsMono Nerd Font";
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
          format-wifi = "󰖩  {essid} ({signalStrength}%)";
          format-ethernet = "󰈀  {ipaddr}/{cidr}";
          format-disconnected = "󰖪  offline";
          tooltip-format = "Connected to {essid}\nSignal: {signalStrength}%\nIP: {ipaddr}";
        };

        battery = {
          format = "{icon}  {capacity}%";
          format-charging = "󰂄  {capacity}%";
          format-plugged = "󰚥  {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
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
