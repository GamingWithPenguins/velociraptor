kind: meson

description: |
  adw-gtk3 & adw-gtk3-dark GTK3 port of libadwaita, retained as Noctalia's dynamic GTK target.

sources:
- kind: git_repo
  url: github:lassekongo83/adw-gtk3.git
  track: v5.*
  ref: v5.6-0-g92a4d017c8be

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- deps/desktop-libs.bst

runtime-depends:
- deps/desktop-libs.bst
