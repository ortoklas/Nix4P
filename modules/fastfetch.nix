{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "builtin";
        source = "NixOS2";
      };

      display = {
        separator = " │ ";
      };

      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "terminal"
        "wm"
        "cpu"
        "gpu"
        "memory"
        #"disk"
      ];
    };
  };
}
