{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";

    settings = {

      #########################
      ## AUTOSTART
      #########################

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "awww-daemon"
        "qs --daemonize"
        "lxqt-policykit-agent"
      ];

      #########################
      ## MONITORS
      #########################

      monitor = [
        "DP-3,3840x2160@60,0x0,1.5"
      ];

      #########################
      ## GENERAL
      #########################

      general = {
        gaps_in = 5;
        gaps_out = 8;

        border_size = 3;

        "col.active_border" = "rgba(7851a9ff)";   # Royal Purple
        "col.inactive_border" = "rgba(444444aa)";

        resize_on_border = true;
        allow_tearing = false;

        layout = "dwindle";
      };

      #########################
      ## DECORATION
      #########################

      decoration = {
        rounding = 6;

        blur = {
          enabled = true;
          size = 8;
          passes = 2;
        };

        shadow = {
          enabled = true;
          range = 12;
          render_power = 3;
        };
      };

      #########################
      ## ANIMATIONS
      #########################

      animations = {
        enabled = true;
      };

      #########################
      ## INPUT
      #########################

      input = {
        kb_layout = "us";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0;
      };
    };
  };
}
