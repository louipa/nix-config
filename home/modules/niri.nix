{ pkgs, ... }:
{
  home.file.".config/niri/config.kdl".text = ''
    prefer-no-csd

    input {
        keyboard {
            xkb {
                layout "fr"
                variant "azerty"
            }
        }
        touchpad {
            tap
            natural-scroll
            dwt
        }
    }

    spawn-at-startup "noctalia-shell"

    binds {
        // Applications
        Mod+Return { spawn "ghostty"; }
        Mod+Space { spawn "noctalia-shell" "ipc" "call" "launcher" "toggle"; }

        // Noctalia controls
        Mod+Shift+L { spawn "noctalia-shell" "ipc" "call" "lockScreen" "lock"; }
        Mod+Shift+E { spawn "noctalia-shell" "ipc" "call" "sessionMenu" "toggle"; }
        Mod+N { spawn "noctalia-shell" "ipc" "call" "controlCenter" "toggle"; }

        // Media / brightness keys
        XF86AudioRaiseVolume { spawn "noctalia-shell" "ipc" "call" "volume" "increase"; }
        XF86AudioLowerVolume { spawn "noctalia-shell" "ipc" "call" "volume" "decrease"; }
        XF86AudioMute { spawn "noctalia-shell" "ipc" "call" "volume" "muteOutput"; }
        XF86MonBrightnessUp { spawn "noctalia-shell" "ipc" "call" "brightness" "increase"; }
        XF86MonBrightnessDown { spawn "noctalia-shell" "ipc" "call" "brightness" "decrease"; }

        // Window management
        Mod+Q { close-window; }
        Mod+F { fullscreen-window; }
        Mod+Shift+F { toggle-window-floating; }

        // Focus
        Mod+Left { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Up { focus-window-up; }
        Mod+Down { focus-window-down; }
        Mod+H { focus-column-left; }
        Mod+L { focus-column-right; }
        Mod+K { focus-window-up; }
        Mod+J { focus-window-down; }

        // Move columns
        Mod+Ctrl+Left { move-column-left; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+H { move-column-left; }
        Mod+Ctrl+L { move-column-right; }

        // Workspaces
        Mod+ampersand { focus-workspace 1; }
        Mod+eacute { focus-workspace 2; }
        Mod+quotedbl { focus-workspace 3; }
        Mod+apostrophe { focus-workspace 4; }
        Mod+parenleft { focus-workspace 5; }
        Mod+Shift+ampersand { move-window-to-workspace 1; }
        Mod+Shift+eacute { move-window-to-workspace 2; }
        Mod+Shift+quotedbl { move-window-to-workspace 3; }
        Mod+Shift+apostrophe { move-window-to-workspace 4; }
        Mod+Shift+parenleft { move-window-to-workspace 5; }
    }
  '';

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
