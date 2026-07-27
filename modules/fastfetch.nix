{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "kitty-icat";
        source = "/home/highv/.config/home-manager/assets/nixos.svg";
        width = 30;
        height = 10;
        preserveAspectRatio = true;
      };

      display = {
        separator = " ";
      };

      modules = [
        {
          type = "custom";
          format = "╭──────────────────────────────────────────────╮";
        }

        {
          type = "title";
          format = "│ ❯ {user-name}@{host-name}";
        }

        {
          type = "custom";
          format = "├──────────────────────────────────────────────┤";
        }

        {
          type = "kernel";
          key = "│ 󰌢";
          keyColor = "cyan";
        }

        {
          type = "uptime";
          key = "│ 󰅐";
          keyColor = "green";
        }

        {
          type = "packages";
          key = "│ 󰏖";
          keyColor = "yellow";
        }

        {
          type = "shell";
          key = "│ 󰆍";
          keyColor = "magenta";
        }

        {
          type = "terminal";
          key = "│ 󰍹";
          keyColor = "blue";
        }

        {
          type = "wm";
          key = "│ ";
          keyColor = "cyan";
        }

        {
          type = "cpu";
          key = "│ 󰍛";
          keyColor = "green";
        }

        {
          type = "memory";
          key = "│ 󰘚";
          keyColor = "yellow";
        }

        {
          type = "custom";
          format = "╰──────────────────────────────────────────────╯";
        }
      ];
    };
  };
}
