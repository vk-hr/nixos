{
  lib,
  pkgs,
  inputs,
  colors,
  ...
}:

{
  programs.niri = {
    settings = {
      prefer-no-csd = true;

      xwayland-satellite.path =
        lib.getExe
          inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.xwayland-satellite-unstable;

      spawn-at-startup = [
        { sh = "waybar"; }
      ];

      input = {
        keyboard.xkb.layout = "us";
        touchpad = {
          tap = true;
          natural-scroll = true;
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
          width = 2;
          active.color = colors.accent;
          inactive.color = colors.selection_background;
        };
      };

      outputs = {
        "eDP-1" = {
          scale = 1.5;
        };
      };

      binds = {
        "Mod+Return".action.spawn = "ghostty";
        "Mod+Space".action.spawn = "fuzzel";
        "Mod+Q".action.close-window = [ ];

        "Mod+Left".action.focus-column-left = [ ];
        "Mod+Right".action.focus-column-right = [ ];
        "Mod+Up".action.focus-window-up = [ ];
        "Mod+Down".action.focus-window-down = [ ];

        "Mod+Shift+Left".action.move-column-left = [ ];
        "Mod+Shift+Right".action.move-column-right = [ ];

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
