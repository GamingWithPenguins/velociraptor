kind: compose

description: |
  Immutable velociraptor root filesystem composition (Umbriel + Noctalia v5 + Native Steam + Flathub Suite).

build-depends:
- core/base-platform.bst
- core/flathub.bst
- core/fish.bst
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
- apps/neovim.bst
- apps/lazygit.bst
- apps/nemo.bst
- apps/engrampa.bst
- apps/atril.bst
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
