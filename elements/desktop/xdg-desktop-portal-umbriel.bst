kind: meson

description: |
  Native C++23 XDG Desktop Portal backend for Noctalia's Umbriel compositor.

sources:
- kind: git_repo
  url: github:noctalia-dev/xdg-desktop-portal-umbriel.git
  track: main
  ref: v0.3.1-0-g71d2e84a90b3

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst
- desktop/umbriel.bst
- deps/cpp-libs.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/gtk4.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland-protocols.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libdrm.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/mesa-headers.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/cairo.bst

runtime-depends:
- desktop/umbriel.bst
- core/base-platform.bst
- deps/cpp-libs.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/gtk4.bst

variables:
  meson-local: >-
    -Dcpp_std=c++23
    -Dbuildtype=release
