{ ... }:

{
  programs.niri = {
    settings = {
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
      };

      outputs = {
        "eDP-1" = {
          scale = 1.5;
        };
      };

      binds = {
        "Mod+Return".action.spawn = "foot";
        "Mod+D".action.spawn = "fuzzel";
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
        QT_QPA_PLATFORM = "wayland";
        SDL_VIDEODRIVER = "wayland";
        _JAVA_AWT_WM_NONREPARENTING = "1";
        NIXOS_OZONE_WL = "1";
      };
    };
  };

  xdg.configFile."fuzzel/fuzzel.ini".text = ''
    [main]
    font = monospace
    prompt = ">> "
    lines = 10
    width = 40
    horizontal-pad = 8
    vertical-pad = 4
    inner-pad = 4

    [colors]
    background = 1e1e2eff
    text = cdd6f4ff
    match = f38ba8ff
    selection = 585b70ff
    selection-text = cdd6f4ff
    border = 89b4faff
  '';
}
