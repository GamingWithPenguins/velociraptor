kind: meson

description: |
  Noctalia Umbriel Wayland compositor (C++23 / Meson / wlroots 0.20 / in-tree umbrielfx).

sources:
- kind: git_repo
  url: github:noctalia-dev/umbriel.git
  track: main
  ref: v0.4.2-0-ga7e291d4c801

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst
- desktop/wlroots.bst
- deps/cpp-libs.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxkbcommon.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xorg-lib-xcb.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/cairo.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/pango.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/pixman.bst

runtime-depends:
- desktop/wlroots.bst
- desktop/xwayland-satellite.bst

variables:
  meson-local: >-
    -Dcpp_std=c++23
    -Dbuildtype=release
