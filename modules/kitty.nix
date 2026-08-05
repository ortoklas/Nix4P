{ ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "Geist Mono NF";
      font_size = 11;

     #background = "#2b2b44";
      background = "#1b1b2b";
     #background = "#1e1e1e";
      foreground = "#ffffff";

      background_opacity = "0.85";

      allow_remote_control = "yes";

      tab_bar_style = "fade";
      tab_fade = "1";

      active_tab_font_style = "bold";
      inactive_tab_font_style = "bold";
    };

    keybindings = {
      "ctrl+plus" = "change_font_size all +2.0";
      "ctrl+minus" = "change_font_size all -2.0";
      "ctrl+0" = "change_font_size all 0";
    };
  };
}
