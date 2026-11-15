kind: meson

description: |
  xdg-desktop-portal-gtk backend for FileChooser, Settings, and AppChooser dialogs.

sources:
- kind: git_repo
  url: github:flatpak/xdg-desktop-portal-gtk.git
  track: "1.15.*"
  ref: 1.15.3-0-g2b91e0c4d772

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/gtk3.bst

runtime-depends:
- core/base-platform.bst
- desktop/adw-gtk3.bst
