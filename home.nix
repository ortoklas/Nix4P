{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/fastfetch.nix
    ./modules/kitty.nix
    ./modules/fonts.nix
    ./modules/hyprland.nix
    ./modules/keybindings.nix
    ./modules/quickshell.nix
    ./modules/swaync.nix
    ./modules/clipboard.nix
  ];

  home.username = "highv";
  home.homeDirectory = "/home/highv";

  home.stateVersion = "24.05";

  home.sessionVariables = {
    BROWSER = "brave";
    TERMINAL = "kitty";
  };

  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "never";

    settings = {
      program_options = {
        file_manager = "nemo";
        terminal = "kitty";
      };
    };
  };

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
    };
  };

  systemd.user.services.weather-updater = {
    Unit = {
      Description = "Nix4P Weather Updater";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      ExecStart = "${config.home.homeDirectory}/.config/home-manager/scripts/weather-updater.sh";
      Restart = "always";
      RestartSec = 10;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.services.quickshell-reload = {
    Unit = {
      Description = "Nix4P Quickshell Reload";
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${config.home.homeDirectory}/.config/home-manager/scripts/quickshell-reload.sh";
    };
  };

  programs.home-manager.enable = true;
}
