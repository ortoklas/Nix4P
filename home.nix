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
    ./modules/waypaper.nix
  ];

  home.username = "highv";
  home.homeDirectory = "/home/highv";

  home.stateVersion = "24.05";

  home.sessionVariables = {
    BROWSER = "brave";
    TERMINAL = "kitty";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

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

  programs.home-manager.enable = true;

  home.file.".local/bin/radio-toggle".source = ./scripts/radio-toggle;
  home.file.".local/bin/radio-next".source = ./scripts/radio-next;
  home.file.".local/bin/radio-prev".source = ./scripts/radio-prev;

  systemd.user.services.elephant = {
    Unit = {
      Description = "Elephant";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.elephant}/bin/elephant";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
  
}
