# Nix4P

> A simple Hyprland + Quickshell starting point for NixOS using Home Manager.


![Nix4P Screenshot](assets/screenshot.png)

---

---

# Welcome

Nix4P is my personal Home Manager configuration that I'm sharing with the community.

It was built as a clean starting point for anyone interested in trying **Hyprland** and **Quickshell** on **NixOS** without having to build everything from scratch.

The goal isn't to provide hundreds of features or endless customization options. Instead, Nix4P focuses on providing a simple, organized configuration that is easy to understand, modify, and expand as you learn.

Whether this is your first Hyprland installation or you're simply looking for ideas, I hope this project gives you a solid foundation to build your own desktop.

---

# Features

* Hyprland desktop configuration
* Quickshell top bar
* Wallpaper-based color customization
* Kitty terminal setup
* Custom keyboard shortcuts
* Built-in keybind cheat sheet
* Wayland screenshot workflow
* Wallpaper management through Home Manager and Waypaper
* Radio integration
* Elephant service integration
* Easy Home Manager customization

---

# Before You Begin

Nix4P is a **Home Manager configuration for NixOS**.

## Requirements

You'll need:

* NixOS
* Home Manager
* Git
* An internet connection

If you don't already have Home Manager installed, complete that first before using this repository.

---

## Check Your Nix Versions

Nix4P has been tested on both stable and unstable NixOS channels.

The important part is keeping **Nixpkgs** and **Home Manager** versions compatible.

Check your current channels:

```bash
nix-channel --list
```

Example stable configuration:

```text
nixpkgs       https://nixos.org/channels/nixos-26.05
home-manager  https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz
```

Example unstable configuration:

```text
nixpkgs       https://nixos.org/channels/nixos-unstable
home-manager  https://github.com/nix-community/home-manager/archive/master.tar.gz
```

After changing channels, update them:

```bash
nix-channel --update
```

---

## Check Your Username

Before building, make sure the username in Nix4P matches your system user.

Edit:

```text
home.nix
```

Example:

```nix
home.username = "your-user";
home.homeDirectory = "/home/your-user";
```

Your NixOS system configuration should use the same username:

```nix
users.users.your-user = {
  ...
};
```

A mismatch between these values can cause Home Manager to build successfully but apply the configuration to the wrong user.

---

# Installation

If you already have an existing Home Manager configuration, make sure it is backed up before continuing.

Clone Nix4P:

```bash
cd ~/.config

rm -rf ~/.config/home-manager

git clone https://github.com/ortoklas/Nix4P.git ~/.config/home-manager

cd ~/.config/home-manager
```

Edit `home.nix` and update the username if needed.

Build and activate:

```bash
home-manager switch
```

After the build finishes, log out and start a **Hyprland** session.

---

# Reference Configuration

Nix4P is primarily a **Home Manager** configuration.

A reference `configuration.nix` is included in the `reference/` directory.

It shows the NixOS system configuration used during testing and provides an example of the system-level setup that works well with Nix4P.

It is provided as a reference and backup, and is **not required** to use Nix4P.

---

# Repository Layout

```text
.
├── home.nix
├── modules/
├── quickshell/
├── scripts/
├── radio/
├── reference/
├── wallpapers/
├── assets/
├── docs/
└── README.md
```

---

# Where Do I Edit Things?

| I want to...               | Edit this file                 |
| -------------------------- | ------------------------------ |
| Install or remove packages | `modules/packages.nix`         |
| Configure Hyprland         | `modules/hyprland.nix`         |
| Change keyboard shortcuts  | `modules/keybindings.nix`      |
| Configure Kitty            | `modules/kitty.nix`            |
| Change fonts               | `modules/fonts.nix`            |
| Customize the top bar      | `quickshell/panels/TopBar.qml` |
| Modify widgets             | `quickshell/widgets/`          |
| Change colors              | `quickshell/theme/`            |
| Add wallpapers             | `wallpapers/`                  |

---

# Applying Changes

After editing configuration files:

```bash
home-manager switch
```

Most Home Manager changes will be applied after rebuilding.

Some graphical components, such as Quickshell, may require a restart.

---

# Updating Nix4P

Download the latest changes:

```bash
cd ~/.config/home-manager
git pull
```

Apply the updates:

```bash
home-manager switch
```

---

# Troubleshooting

If something does not work after installation, check:

* Your username in `home.nix` matches your actual user.
* Your NixOS and Home Manager versions are compatible.
* Your channels are updated.
* You rebuilt Home Manager after making changes.
* You are using the correct branch (`main`) when cloning the repository.

For Quickshell changes, restart Quickshell or use the reload shortcut from the built-in keybind cheat sheet.

---

# Keyboard Shortcuts

A selection of commonly used shortcuts is included in the built-in cheat sheet.

The complete list is located in:

```text
modules/keybindings.nix
```

---

# First Steps

If you're new to NixOS or Hyprland, don't try to customize everything at once.

Start small.

Try changing:

* your wallpaper
* a keyboard shortcut
* your terminal settings
* the Quickshell top bar
* installed packages

After each change:

```bash
home-manager switch
```

Learning one piece at a time is the easiest way to understand how everything fits together.

---

# Philosophy

Nix4P is intentionally simple.

It isn't meant to be a complete desktop environment or a framework.

It's a foundation.

Something you can read, understand, modify, and gradually turn into your own desktop.

Experiment.

Break things.

Learn from them.

Most importantly...

Have fun.

---

# Acknowledgements

A sincere thank you to the developers and communities behind:

* NixOS
* Home Manager
* Hyprland
* Quickshell

Their work made this project possible.
