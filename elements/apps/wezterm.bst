kind: manual

description: |
  WezTerm GPU-accelerated Wayland terminal built offline via freedesktop-sdk rust.bst + cargo2 (zero libadwaita/GTK4).

sources:
- kind: git_repo
  url: github:wezterm/wezterm.git
  track: main
  ref: 20240203-110809-5046fc22-0-g5046fc221a8e
- kind: cargo2

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: components/rust.bst
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland-protocols.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxkbcommon.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xorg-lib-xcb.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/fontconfig.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/openssl.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/mesa-headers.bst

runtime-depends:
- core/base-platform.bst
- desktop/papirus-icon-theme.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxkbcommon.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xorg-lib-xcb.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/fontconfig.bst

config:
  build-commands:
  - |
    cargo build --release --offline --bin wezterm --bin wezterm-gui --bin wezterm-mux-server
  install-commands:
  - |
    install -Dm755 target/release/wezterm "%{install-root}%{bindir}/wezterm"
    install -Dm755 target/release/wezterm-gui "%{install-root}%{bindir}/wezterm-gui"
    install -Dm755 target/release/wezterm-mux-server "%{install-root}%{bindir}/wezterm-mux-server"
    install -Dm644 assets/wezterm.desktop "%{install-root}%{datadir}/applications/org.wezfurlong.wezterm.desktop"
    install -Dm644 assets/icon/terminal.png "%{install-root}%{datadir}/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png"
