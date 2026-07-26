{ ... }:

{
  wayland.windowManager.hyprland.settings = {

    "$mod" = "SUPER";

    bind = [

      # Screenshot
      "$mod, semicolon, exec, grim -g \"$(slurp)\" - | swappy -f -"

      # Walker launcher
      "$mod, SPACE, exec, walker"

      # Terminal
      "$mod, RETURN, exec, kitty"

      # Browser
      "$mod, B, exec, brave"

      # File Manager
      "$mod, E, exec, nemo"

      # Close window
      "$mod, Q, killactive"

      # Fullscreen
      "$mod, F, fullscreen"

      # Toggle floating
      "$mod, T, togglefloating"

      # Exit Hyprland
      "$mod SHIFT, Q, exit"

      # Workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"

      # Move window to workspace
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"

      # Focus windows
      "$mod, LEFT, movefocus, l"
      "$mod, RIGHT, movefocus, r"
      "$mod, UP, movefocus, u"
      "$mod, DOWN, movefocus, d"

      # Move windows
      "$mod SHIFT, LEFT, movewindow, l"
      "$mod SHIFT, RIGHT, movewindow, r"
      "$mod SHIFT, UP, movewindow, u"
      "$mod SHIFT, DOWN, movewindow, d"
      
    ];

  

    # Mouse window controls
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

  };
}
