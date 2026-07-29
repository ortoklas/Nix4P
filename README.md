
# Nix4P



> A simple Hyprland + Quickshell starting point for NixOS using Home Manager.



---
<img width="3840" height="2160" alt="FINAL 11" src="https://github.com/user-attachments/assets/2cdd60b0-182f-48f5-9fb4-18f07321bbfb" />

## Welcome

Nix4P is my personal Home Manager configuration that I'm sharing with the community...

This repository is my personal Home Manager configuration that I'm sharing with the community. It was built as a clean starting point for anyone interested in trying **Hyprland** and **Quickshell** on **NixOS** without having to build everything from scratch.

The goal isn't to provide hundreds of features or endless customization options. Instead, Nix4P focuses on providing a simple, organized configuration that is easy to understand, modify, and expand as you learn.

Whether this is your first Hyprland installation or you're simply looking for ideas, I hope this project gives you a solid foundation to build your own desktop.

---

# Before You Begin

You'll need:

* NixOS
* Home Manager
* Git
* An internet connection

If you don't already have Home Manager installed, complete that first before using this repository.

---

# Installation

Clone the repository into your Home Manager configuration directory.

```bash
git clone https://github.com/ortoklas/Nix4P.git ~/.config/home-manager
```

Move into the project directory.

```bash
cd ~/.config/home-manager
```

Build and activate the configuration.

```bash
home-manager switch
```

Home Manager will build the configuration and install everything defined by Nix4P.

After the build finishes, log out and start a **Hyprland** session.

---

# Repository Layout

```text
.
├── home.nix
├── modules/
├── quickshell/
├── wallpapers/
├── assets/
└── README.md
```

---

# Where Do I Edit Things?

One of the biggest advantages of Home Manager is knowing where everything lives.

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

After editing any configuration file:

Save the file.

Then rebuild your Home Manager configuration.

```bash
home-manager switch
```

Most changes will be applied automatically.

If you're working on Quickshell, use the Quickshell reload keyboard shortcut from the cheat sheet after making changes.

---

# Useful Git Commands

Check your changes.

```bash
git status
```

Download updates.

```bash
git pull
```

Commit your own work.

```bash
git add .
git commit -m "Describe your changes"
git push
```

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

After each change, rebuild using:

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

## Acknowledgements

A sincere thank you to the developers and communities behind:

* NixOS
* Home Manager
* Hyprland
* Quickshell

Their work made this project possible.
