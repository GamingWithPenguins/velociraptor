kind: meson

description: |
  Noctalia Greeter (C++20 client + C bundled wlroots 0.20 session) targeting greetd + Umbriel.

sources:
- kind: git_repo
  url: github:noctalia-dev/noctalia-greeter.git
  track: main
  ref: v5.0.0-0-g1c48b2f09a31

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst
- desktop/wlroots.bst
- deps/cpp-libs.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxml2.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libinput.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wayland-protocols.bst

runtime-depends:
- login/greetd.bst
- desktop/umbriel.bst
- deps/cpp-libs.bst

variables:
  meson-local: >-
    -Dcpp_std=c++20
    -Dbuildtype=release
