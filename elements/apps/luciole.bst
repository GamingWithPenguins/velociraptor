kind: meson

description: |
  Noctalia Luciole C++23 native Wayland file manager (noctalia-dev/luciole) replacing Nautilus.

sources:
- kind: git_repo
  url: github:noctalia-dev/luciole.git
  track: main
  ref: 0.4.0-0-g6d2e19a4f810

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst
- deps/cpp-libs.bst
- deps/desktop-libs.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland-protocols.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxkbcommon.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/cairo.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/pango.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/librsvg.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxml2.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/mesa-headers.bst

runtime-depends:
- core/base-platform.bst
- deps/cpp-libs.bst
- deps/desktop-libs.bst
- desktop/papirus-icon-theme.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxkbcommon.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/cairo.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/pango.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/librsvg.bst

variables:
  meson-local: >-
    -Dcpp_std=c++23
