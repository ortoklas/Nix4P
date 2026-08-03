{ config, ... }:

{
  home.file.".config/waypaper/config.ini".text = ''
    [Settings]
    language = en
    backend = awww
    folder = ~/.config/home-manager/wallpapers
    monitors = All
    wallpaper = ~/.config/home-manager/wallpapers/the-last-light.png
    show_path_in_tooltip = True
    fill = fill
    sort = name
    color = #ffffff
    subfolders = False
    all_subfolders = False
    show_hidden = False
    show_gifs_only = False
    zen_mode = False
    post_command = ${config.home.homeDirectory}/.config/home-manager/scripts/update-theme.sh "$wallpaper"
    number_of_columns = 3
    swww_transition_type = any
    swww_transition_step = 63
    swww_transition_angle = 0
    swww_transition_duration = 2
    swww_transition_fps = 60
    mpvpaper_sound = False
    mpvpaper_options =
    use_xdg_state = False
    stylesheet = ${config.home.homeDirectory}/.config/waypaper/style.css
    keybindings = ~/.config/waypaper/keybindings.ini
  '';

  home.file.".config/waypaper/keybindings.ini".text = "";
}
