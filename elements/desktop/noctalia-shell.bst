kind: meson

description: |
  Noctalia Shell v5 (native C++23 / Meson desktop shell from noctalia-dev/noctalia).

sources:
- kind: git_repo
  url: github:noctalia-dev/noctalia.git
  track: main
  ref: v5.0.0-0-g4f90c3e8b12a

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst
- deps/cpp-libs.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland-protocols.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/cairo.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/pango.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/librsvg.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxml2.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libwebp.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/linux-pam.bst

runtime-depends:
- desktop/umbriel.bst
- deps/cpp-libs.bst
- desktop/adw-gtk3.bst
- desktop/papirus-icon-theme.bst
- desktop/portals-stack.bst

variables:
  meson-local: >-
    -Dcpp_std=c++23
    -Dbuildtype=release
