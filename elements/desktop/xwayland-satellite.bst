kind: manual

description: |
  xwayland-satellite rootless X11 bridge for Umbriel built via freedesktop-sdk rust.bst + cargo2.

sources:
- kind: git_repo
  url: github:Supreeeme/xwayland-satellite.git
  track: v0.7.*
  ref: v0.7.1-0-g51fa83c20d7e
- kind: cargo2

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: components/rust.bst
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xwayland.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xorg-lib-xcb.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xcb-util-cursor.bst

runtime-depends:
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xwayland.bst

config:
  build-commands:
  - |
    cargo build --release --offline
  install-commands:
  - |
    install -Dm755 target/release/xwayland-satellite "%{install-root}%{bindir}/xwayland-satellite"
