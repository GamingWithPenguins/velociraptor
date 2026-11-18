kind: compose

description: |
  Immutable velociraptor root filesystem composition (Umbriel + Noctalia v5 + Luciole + CUPS + Homebrew + ujust + Native Steam + Flathub Suite).

build-depends:
- core/base-platform.bst
- core/homebrew.bst
- core/flathub.bst
- core/ujust.bst
- core/kernel.bst
- core/bootloader.bst
- core/bootc.bst
- login/greetd.bst
- login/noctalia-greeter.bst
- desktop/umbriel.bst
- desktop/xwayland-satellite.bst
- desktop/noctalia-shell.bst
- desktop/adw-gtk3.bst
- desktop/papirus-icon-theme.bst
- desktop/portals-stack.bst
- apps/wezterm.bst
- apps/luciole.bst
- apps/imv.bst
- apps/zen-browser.bst
- apps/steam.bst
- overlay/desktop-overlay.bst
- flatpaks/default-flatpaks.bst
- flatpaks/flatpak-theme-bridge.bst

config:
  include:
  - runtime
  - extra
  exclude:
  - devel
  - doc
  include-orphans: true
