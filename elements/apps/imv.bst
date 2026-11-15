kind: meson

description: |
  imv fast Wayland-native image viewer (~exec64/imv) for tiling Wayland compositors.

sources:
- kind: git_repo
  url: srht:~exec64/imv
  track: v4.*
  ref: v4.5.0-0-g8d2e1a9c4b07

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst
- deps/gtk3-companions.bst
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
  filename: components/libwebp.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libpng.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/jpeg.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/mesa-headers.bst

runtime-depends:
- core/base-platform.bst
- deps/gtk3-companions.bst
- desktop/papirus-icon-theme.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/librsvg.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libwebp.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libpng.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/jpeg.bst

variables:
  meson-local: >-
    -Dwindows=wayland
    -Dlibrsvg=enabled
    -Dlibpng=enabled
    -Dlibjpeg=enabled
    -Dlibwebp=enabled
    -Dman=disabled
    -Dtest=disabled
