kind: meson

description: |
  wlroots 0.20.x Wayland compositor library required by Umbriel + umbrielfx and Noctalia Greeter.

sources:
- kind: git_repo
  url: freedesktop:wlroots/wlroots.git
  track: "0.20.*"
  ref: 0.20.1-0-g6d491c8f2b14
- kind: patch
  path: patches/common/wlroots-umbriel-quirks.patch

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland-protocols.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/mesa-headers.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libdrm.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libinput.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxkbcommon.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xorg-lib-xcb.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/seatd.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xwayland.bst

runtime-depends:
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxkbcommon.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xorg-lib-xcb.bst

variables:
  meson-local: >-
    -Dexamples=false
    -Dxwayland=enabled
    -Dbackends=drm,libinput
