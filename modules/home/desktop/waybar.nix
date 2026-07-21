_:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [ "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "niri/language"
          "tray"
          "network"
          "battery"
          "backlight"
          "pulseaudio"
        ];

        "niri/workspaces".format = "{index}";

        "niri/language" = {
          format = "{short} {variant}";
          format-us = "🇺🇸 US";
          format-ua = "🇺🇦 UA";
        };

        clock.format = "{:%H:%M  %a %b %d}";

        backlight = {
          format = "{icon}  {percent}%";
          format-icons = [
            "󰖨"
            "󰖨"
          ];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖸  muted";
          format-icons = {
            headphone = "󰋋";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pavucontrol";
        };

        network = {
          format-wifi = "󰖩  {essid} ({signalStrength}%)";
          format-ethernet = "󰈀  {ipaddr}/{cidr}";
          format-disconnected = "󰖪  offline";
          tooltip-format = "Connected to {essid}\nSignal: {signalStrength}%\nIP: {ipaddr}";
          on-click = "ghostty -e impala";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
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
