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
      file_manager = "dolphin";
      terminal = "kitty";
    };
  };
};

xdg.mimeApps = {
enable = true;
defaultApplications = {
"inode/directory" = [ "org.kde.dolphin.desktop" ];
};
};

programs.kitty = {
enable = true;
settings = {
confirm_os_window_close = 0;
};
};

programs.home-manager.enable = true;
}
