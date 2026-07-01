{
  font,
  icons,
  ...
}:

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
          format-wifi = "${icons.wifi}  {essid} ({signalStrength}%)";
          format-ethernet = "${icons.ethernet}  {ipaddr}/{cidr}";
          format-disconnected = "${icons.wifiOff}  offline";
          tooltip-format = "Connected to {essid}\nSignal: {signalStrength}%\nIP: {ipaddr}";
        };

        battery = {
          format = "{icon}  {capacity}%";
          format-charging = "${icons.batteryCharging}  {capacity}%";
          format-plugged = "${icons.powerPlug}  {capacity}%";
          format-icons = {
            "10" = icons.battery10;
            "20" = icons.battery20;
            "30" = icons.battery30;
            "40" = icons.battery40;
            "50" = icons.battery50;
            "60" = icons.battery60;
            "70" = icons.battery70;
            "80" = icons.battery80;
            "90" = icons.battery90;
            "default" = [
              icons.battery10
              icons.battery20
              icons.battery30
              icons.battery50
              icons.battery80
            ];
          };
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
