kind: cmake

description: |
  Fish interactive command-line shell (fish-shell 4.x Rust + CMake) built offline with cargo2.

sources:
- kind: git_repo
  url: github:fish-shell/fish-shell.git
  track: 4.0.*
  ref: 4.0.1-0-g91c2e8a4b017
- kind: cargo2

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-cmake.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/rust.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/ncurses.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/pcre2.bst
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/ncurses.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/pcre2.bst

variables:
  cmake-local: >-
    -DWITH_GETTEXT=OFF
    -DBUILD_DOCS=OFF
