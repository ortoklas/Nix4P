{ config, pkgs, ... }:

{
  ####################################################################
  # Nix4P Reference System Configuration
  #
  # This is the system-level configuration used alongside the
  # Nix4P Home Manager configuration.
  #
  # It is included as a reference and backup. Most desktop
  # customization lives in Home Manager.
  ####################################################################

  imports = [
    ./hardware-configuration.nix
  ];

  ####################################################
  # Boot
  ####################################################

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ####################################################
  # Networking
  ####################################################

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  ####################################################
  # Locale & Time
  ####################################################

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  ####################################################
  # Display Server & Graphics
  ####################################################

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  ####################################################
  # Desktop Environment
  ####################################################

  services.displayManager.sddm.enable = true;

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    qrca
  ];

  ####################################################
  # Hyprland
  #
  # The desktop itself is configured through
  # Home Manager.
  ####################################################

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  ####################################################
  # Keyboard
  ####################################################

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  ####################################################
  # Storage
  ####################################################

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  ####################################################
  # Printing
  ####################################################

  services.printing.enable = true;

  ####################################################
  # Audio
  ####################################################

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ####################################################
  # Security
  ####################################################

  security.polkit.enable = true;
  security.polkit.enablePkexecWrapper = true;

  ####################################################
  # User
  ####################################################

  users.users.highv = {
    isNormalUser = true;
    description = "highv";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  users.defaultUserShell = pkgs.zsh;

  ####################################################
  # Nixpkgs
  ####################################################

  nixpkgs.config.allowUnfree = true;

  ####################################################
  # System Packages
  ####################################################

  environment.systemPackages = with pkgs; [

    # CLI Utilities
    cowsay
    duf
    fastfetch
    git
    inxi
    lshw
    micro
    ncdu
    nh
    nil
    ripgrep
    tree
    unzip
    unrar
    wget

    # Terminal / Shell
    oh-my-zsh
    zplug
    zsh
    zsh-nix-shell
    zsh-powerlevel10k

    # Wayland / Hyprland
    hyprpicker
    wl-clipboard
    yad

    # Development
    appimage-run
    neovim
    neovide
    ninja

    # Media
    audacious
    ffmpeg
    glaxnimate
    imv
    obs-studio
    swayimg
    vlc

    # Hardware
    corectrl
    v4l-utils

    # Applications
    brave
    discord
    elephant
    gparted
    packagekit
    qalculate-qt

    # Wine
    wineWowPackages.minimal
    wineWowPackages.yabridge
    winetricks

    # File Managers
    kdePackages.dolphin
    xfce.thunar

    # KDE Applications
    kdePackages.kate
    kdePackages.kdenlive
    kdePackages.qtmultimedia
    kdePackages.yakuake

    # PolicyKit
    lxqt.lxqt-policykit

    # GStreamer
    gst_all_1.gst-plugins-good

    # X11 Utilities
    xorg.xrandr
  ];

  ####################################################
  # ZSH
  ####################################################

  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    zsh-autoenv.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "agnoster";

      plugins = [
        "git"
        "history"
        "node"
        "npm"
        "rust"
        "deno"
        "sudo"
      ];
    };
  };

  ####################################################
  # Garbage Collection
  ####################################################

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  ####################################################
  # Do not change after installation
  ####################################################

  system.stateVersion = "24.05";
}
