kind: meson

description: |
  Dakota 32-bit (i686) compatibility layer (glibc, Mesa/Vulkan, ALSA, PipeWire) + Valve steam-devices udev rules & Feral GameMode.

sources:
- kind: git_repo
  url: github:FeralInteractive/gamemode.git
  track: 1.8.*
  ref: 1.8.2-0-g39c8e1a2b407
- kind: git_repo
  url: github:ValveSoftware/steam-devices.git
  directory: steam-devices
  track: master
  ref: 20240522-0-g71a9c2e8d104

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst
- junction: junctions/freedesktop-sdk-i686.bst
  filename: public-stacks/runtime-minimal.bst
- junction: junctions/freedesktop-sdk-i686.bst
  filename: components/mesa-headers.bst
- junction: junctions/freedesktop-sdk-i686.bst
  filename: components/libdrm.bst
- junction: junctions/freedesktop-sdk-i686.bst
  filename: components/alsa-lib.bst
- junction: junctions/freedesktop-sdk-i686.bst
  filename: components/pipewire.bst
- junction: junctions/freedesktop-sdk-i686.bst
  filename: components/xorg-lib-x11.bst
- junction: junctions/freedesktop-sdk-i686.bst
  filename: components/xorg-lib-xcb.bst

variables:
  meson-local: >-
    -Dwith-sd-bus-provider=systemd
    -Dwith-examples=false

config:
  install-commands:
    (>):
    - |
      install -Dm644 steam-devices/60-steam-input.rules "%{install-root}%{indep-libdir}/udev/rules.d/60-steam-input.rules"
      install -Dm644 steam-devices/60-steam-vr.rules "%{install-root}%{indep-libdir}/udev/rules.d/60-steam-vr.rules"
