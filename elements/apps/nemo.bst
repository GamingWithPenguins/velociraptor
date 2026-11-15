kind: meson

description: |
  Nemo GTK3 file manager (linuxmint/nemo) replacing Nautilus for daily-driver reliability.

sources:
- kind: git_repo
  url: github:linuxmint/nemo.git
  track: 6.4.*
  ref: 6.4.3-0-g9c12f48a3e10

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst
- deps/gtk3-companions.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxml2.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libnotify.bst

runtime-depends:
- core/base-platform.bst
- deps/gtk3-companions.bst
- desktop/adw-gtk3.bst
- desktop/papirus-icon-theme.bst

variables:
  meson-local: >-
    -Dtracker=false
    -Dselinux=false
    -Dgtk_doc=false
