# velociraptor

Non-GNOME fork of Jorge Castro's Dakotaraptor (Bluefin) built on pure `freedesktop-sdk` (25.08) with BuildStream v2 and `bootc` OCI output (zero `rpm-ostree`, zero `gnome-build-meta`).

## Stack Highlights
- **Kernel (`core/kernel.bst`)**: Open Gaming Collective (OGC) Kernel (`OpenGamingCollective/linux`, `sched_ext`, `ntsync`) for Release 1 (isolated for future CachyOS kernel swap)
- **Bootloader (`core/bootloader.bst`)**: `systemd-boot` + `bootupd` + `efibootmgr` for Release 1 (isolated for future `rEFInd` swap)
- **Shell & CLI Tools**: `fish` 4.x, `neovim` (with global `vi` and `vim` symlinks/aliases; zero `nano`/`vi`/`vim`), `git`, `lazygit`, `sudo`, `openssh`
- **Compositor**: Noctalia Umbriel (`noctalia-dev/umbriel`, C++23 / Meson / `wlroots 0.20.x` + in-tree `umbrielfx`) + `xwayland-satellite`
- **Login**: `greetd` + Noctalia Greeter (`noctalia-dev/noctalia-greeter`, C++20 / C bundled `wlroots 0.20`)
- **Desktop Shell**: Noctalia Shell v5 (`noctalia-dev/noctalia`, C++23 / Meson) with built-in idle manager, Polkit agent, lockscreen & first-login theme picker
- **Portals**: `xdg-desktop-portal-umbriel` + `xdg-desktop-portal-gtk`
- **Theming & Base Apps**: `adw-gtk3-dark`, Papirus Icon Theme, WezTerm (Wayland + `/usr/bin/fish`, zero `libadwaita`), Nemo (`linuxmint/nemo`), Engrampa (`mate-desktop/engrampa`), Atril (`mate-desktop/atril`), imv (`~exec64/imv`), Zen Browser
- **Dakota Native Steam Stack (`apps/steam.bst` + `deps/steam-compat-i686.bst` + `junctions/freedesktop-sdk-i686.bst`)**: Native Valve Steam launcher paired with cross-arch `i686` 32-bit Mesa/Vulkan/glibc runtime, Valve `steam-devices` controller udev rules, Feral `gamemode`, and the OGC kernel
- **Flathub & Default Flatpak Suite (`core/flathub.bst` + `flatpaks/*.bst`)**: Pre-configured Flathub remote + Paperwork, Spotify, Heroic Games Launcher, Popsicle, Bitwarden, GIMP, mpv, Discord, Zed, and Collabora Office, with Noctalia v5 GTK3 & GTK4 Flatpak theme bridge (`xdg-config/gtk-3.0:ro` & `xdg-config/gtk-4.0:ro`)
- **Bootc & Rust Packaging**: `bootc`, `bootupd`, `fish`, `greetd`, `xwayland-satellite`, and `wezterm` use `freedesktop-sdk` `components/rust.bst` + `cargo2` offline crate vendoring (`dakota-cargo2`)

## Pre-Publish Tracking & Build
```bash
chmod +x scripts/bootstrap-track.sh scripts/build-oci.sh

# 1. Track and pin live upstream Git & Cargo.lock refs
./scripts/bootstrap-track.sh

# 2. Build the OCI bootc image
./scripts/build-oci.sh latest
```
