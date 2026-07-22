{
  lib,
  pkgs,
  config,
  ...
}:

let
  colors = config.lib.stylix.colors;
in
{
  programs.niri = {
    settings = {
      prefer-no-csd = true;

      xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

      spawn-at-startup = [
        { sh = "waybar"; }
      ];

      input = {
        keyboard.xkb = {
          layout = "us,ua";
          options = "grp:caps_toggle,caps:shift";
        };
        touchpad = {
          tap = true;
          natural-scroll = true;
        };
        mouse = {
          accel-speed = 0.75;
          accel-profile = "flat";
        };
      };

      layout = {
        gaps = 8;
        center-focused-column = "never";
        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];
        focus-ring = {
          enable = true;
          width = 1;
          active.color = colors.base0D;
          inactive.color = colors.base02;
        };
      };

      outputs = {
        "eDP-1" = {
          scale = 1.5;
        };
        "DP-1" = {
          scale = 1.5;
          mode = {
            width = 3840;
            height = 2160;
            refresh = 60.0;
          };
          position = {
            x = 1920;
            y = 0;
          };
        };
      };

      binds = {
        "Mod+Return".action.spawn = "ghostty";
        "Mod+Space".action.spawn = "fuzzel";
        "Mod+Q".action.close-window = [ ];

        "Mod+Left".action.focus-column-or-monitor-left = [ ];
        "Mod+Right".action.focus-column-or-monitor-right = [ ];
        "Mod+Up".action.focus-window-up = [ ];
        "Mod+Down".action.focus-window-down = [ ];

        "Mod+Shift+Left".action.move-column-left-or-to-monitor-left = [ ];
        "Mod+Shift+Right".action.move-column-right-or-to-monitor-right = [ ];

        "Mod+Comma".action.consume-window-into-column = [ ];
        "Mod+Period".action.expel-window-from-column = [ ];

        "Mod+R".action.switch-preset-column-width = [ ];
        "Mod+Shift+R".action.switch-preset-window-height = [ ];

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;

        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;

        "Mod+F".action.maximize-column = [ ];

        "Mod+Shift+E".action.quit = [ ];
        "Mod+Shift+Slash".action.toggle-overview = [ ];

        "XF86AudioMute".action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "5%-"
        ];
        "XF86AudioRaiseVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "-l"
          "1.5"
          "@DEFAULT_AUDIO_SINK@"
          "5%+"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          "brightnessctl"
          "set"
          "5%-"
        ];
        "XF86MonBrightnessUp".action.spawn = [
          "brightnessctl"
          "set"
          "+5%"
        ];
      };

      environment = {
        XDG_CURRENT_DESKTOP = "niri";
        QT_QPA_PLATFORM = "wayland";
        SDL_VIDEODRIVER = "wayland,x11";
        _JAVA_AWT_WM_NONREPARENTING = "1";
        GTK_USE_PORTAL = "1";
        NIXOS_OZONE_WL = "1";
      };
    };
  };
}
