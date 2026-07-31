{ config, pkgs, ... }:

{
  xdg.configFile."swaync/config".text = ''
    {
      "positionX": "right",
      "positionY": "top",

      "control-center-positionX": "right",
      "control-center-positionY": "top",

      "layer": "overlay",
      "control-center-layer": "top",
      "layer-shell": true,
      "layer-shell-cover-screen": false,

      "notification-window-width": 360,

      "control-center-width": 360,
      "control-center-height": 250,

      "control-center-margin-top": 70,
      "control-center-margin-right": 10,
      "control-center-margin-bottom": 10,
      "control-center-margin-left": 10,

      "fit-to-screen": false,

      "notification-2fa-action": true,
      "notification-inline-replies": false,

      "timeout": 3,
      "timeout-low": 1,
      "timeout-critical": 0,

      "widgets": [
        "inhibitors",
        "title",
        "dnd",
        "notifications"
      ],

      "widget-config": {
        "title": {
          "text": "Notifications",
          "button-text": "Clear",
          "clear-all-button": true
        }
      }
    }
  '';

  xdg.configFile."swaync/style.css".text = ''
    * {
      font-family: "JetBrainsMono Nerd Font";
    }

    .control-center {
      background: rgba(35, 35, 58, 0.60);
      border: 1px solid #5e81ac;
      border-radius: 24px;
      padding: 14px;
    }

    .notification-row {
      outline: none;
    }

    .notification {
      background: rgba(43, 43, 68, 0.85);
      border-radius: 14px;
      margin: 6px 0;
      padding: 10px;
    }

    .notification-content {
      padding: 4px;
    }

    .summary {
      color: #f2f2f2;
      font-weight: bold;
    }

    .body {
      color: #a0a0a0;
    }

    .close-button {
      background: transparent;
      color: #f2f2f2;
    }

    .close-button:hover {
      background: #5e81ac;
    }

    .widget-title {
      color: #f2f2f2;
      font-size: 16px;
      font-weight: bold;
    }
  '';
}
