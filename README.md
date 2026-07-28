# Nix4P

A clean, modular Home Manager configuration for Hyprland on NixOS.

Nix4P is designed around a simple idea: provide a fast, organized, and easy-to-understand desktop without unnecessary complexity. Every component is modular, making it easy to customize while keeping the configuration readable and maintainable.

---

## Features

* 🚀 Hyprland on Wayland
* 🧩 Modular Home Manager configuration
* 🎨 Quickshell top bar
* 🔔 Notification integration
* 📻 Internet radio widget
* 🌤 Weather widget
* ⚡ Fastfetch system information
* 🖼 Wallpaper management
* ⌨️ Clean and practical keybindings
* 💻 Kitty terminal
* 🌐 Brave browser integration
* 📁 Five-workspace layout

---

## Screenshots

> Screenshots will be added before the v1.0 release.

---

## Repository Structure

```text
home.nix
modules/
quickshell/
scripts/
wallpapers/
assets/
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/ortoklas/Nix4P.git
```

Enter the repository:

```bash
cd Nix4P
```

Apply the Home Manager configuration:

```bash
home-manager switch
```

---

## Customization

Most configuration lives inside the `modules/` directory.

Examples:

* Hyprland configuration
* Quickshell widgets
* Wallpapers
* Weather script
* Keybindings
* Packages

The project is intended to be easy to modify without digging through one large configuration file.

---

## Philosophy

Nix4P focuses on:

* Simplicity
* Performance
* Modularity
* Readability

The goal is to provide a desktop that is pleasant to use while remaining easy to understand and extend.

---

## Roadmap

### v1.0

* Stable Hyprland desktop
* Modular Home Manager layout
* Quickshell interface
* Weather widget
* Radio widget
* Notification support

### Future

* Additional widgets
* Optional themes
* Community contributions

---

## Credits

Created by **Jarek Lech**

Development assistance provided through conversations with ChatGPT by OpenAI.

---

## License

Choose a license before the first public release (MIT is a common choice if you want broad reuse).
