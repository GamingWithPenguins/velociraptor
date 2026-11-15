kind: cmake

description: |
  Neovim (nvim) text editor with system-wide vi and vim symlinks (zero nano/vi/vim).

sources:
- kind: git_repo
  url: github:neovim/neovim.git
  track: v0.10.*
  ref: v0.10.4-0-g62e1a9d4c812

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-cmake.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/ncurses.bst
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/ncurses.bst

variables:
  cmake-local: >-
    -DCMAKE_BUILD_TYPE=Release

config:
  install-commands:
    (>):
    - |
      ln -sf nvim "%{install-root}%{bindir}/vi"
      ln -sf nvim "%{install-root}%{bindir}/vim"
