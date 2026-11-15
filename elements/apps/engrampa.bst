kind: meson

description: |
  Engrampa GTK3 archive manager (mate-desktop/engrampa) replacing GNOME File Roller.

sources:
- kind: git_repo
  url: github:mate-desktop/engrampa.git
  track: v1.28.*
  ref: v1.28.2-0-g7a41c9d0e812

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst
- deps/gtk3-companions.bst

runtime-depends:
- core/base-platform.bst
- deps/gtk3-companions.bst
- desktop/adw-gtk3.bst
- desktop/papirus-icon-theme.bst

variables:
  meson-local: >-
    -Dcaja-actions=false
    -Dmagic=true
    -Dpackagekit=false
