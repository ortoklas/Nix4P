{
  programs.fastfetch = {
    enable = true;

    settings = {

      logo = {
        type = "kitty-icat";
        source = "/home/highv/.config/home-manager/assets/nixos.svg";
        width = 29;
        height = 9;
        preserveAspectRatio = true;

        # Reduce empty space around logo
        padding = {
          left = 1;
          right = 2;
        };
      };

      display = {
        separator = "  ";
      };

      modules = [

        # Top border (auto width, prevents bleeding)
        {
          type = "custom";
          format = "╭{#}╮";
        }

        # Title
        {
          type = "title";
          format = "│ ❯ {user-name}@{host-name}";
        }

        # Middle separator
        {
          type = "custom";
          format = "├{#}┤";
        }

        # OS (new)
        {
          type = "os";
          key = "│ ";
          keyColor = "cyan";
        }

        # Kernel
        {
          type = "kernel";
          key = "│ 󰌢";
          keyColor = "cyan";
        }

        # Packages
        {
          type = "packages";
          key = "│ 󰏖";
          keyColor = "yellow";
        }

        # Shell
        {
          type = "shell";
          key = "│ 󰆍";
          keyColor = "magenta";
        }

        # Terminal
        {
          type = "terminal";
          key = "│ 󰍹";
          keyColor = "blue";
        }

        # WM
        {
          type = "wm";
          key = "│ ";
          keyColor = "cyan";
        }

        # Disk (replaces memory)
        {
          type = "disk";
          key = "│ 󰋊";
          keyColor = "yellow";
          folders = [ "/" ];
        }

        # Bottom border (auto width)
        {
          type = "custom";
          format = "╰{#}╯";
        }
      ];
    };
  };
}
