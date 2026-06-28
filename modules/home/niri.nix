{ ... }:

{
  xdg.configFile."niri/config.kdl".text = ''
    input {
      keyboard {
        xkb {
          layout "us"
        }
      }
      touchpad {
        tap
        natural-scroll
      }
    }

    layout {
      gaps 8
      center-focused-column "never"
      preset-column-widths {
        proportion 0.33333
        proportion 0.5
        proportion 0.66667
      }
    }

    output "eDP-1" {
      scale 1.0
    }

    binds {
      Mod+Return { spawn "foot"; }
      Mod+D { spawn "fuzzel"; }
      Mod+Q { close-window; }

      Mod+Left { focus-column-left; }
      Mod+Right { focus-column-right; }
      Mod+Up { focus-window-up; }
      Mod+Down { focus-window-down; }

      Mod+Shift+Left { move-column-left; }
      Mod+Shift+Right { move-column-right; }

      Mod+Comma { consume-window-into-column; }
      Mod+Period { expel-window-from-column; }

      Mod+R { switch-preset-column-width; }
      Mod+Shift+R { switch-preset-window-height; }

      Mod+1 { focus-workspace 1; }
      Mod+2 { focus-workspace 2; }
      Mod+3 { focus-workspace 3; }
      Mod+4 { focus-workspace 4; }
      Mod+5 { focus-workspace 5; }

      Mod+Shift+1 { move-column-to-workspace 1; }
      Mod+Shift+2 { move-column-to-workspace 2; }
      Mod+Shift+3 { move-column-to-workspace 3; }
      Mod+Shift+4 { move-column-to-workspace 4; }
      Mod+Shift+5 { move-column-to-workspace 5; }

      Mod+Shift+E { quit; }
      Mod+Shift+Slash { show-workspace-overview; }
    }

    environment {
      QT_QPA_PLATFORM "wayland"
      SDL_VIDEODRIVER "wayland"
      _JAVA_AWT_WM_NONREPARENTING "1"
    }
  '';

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
