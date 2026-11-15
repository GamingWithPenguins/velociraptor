kind: meson

description: |
  Atril GTK3 document viewer (mate-desktop/atril) for PDF, PostScript, DjVu, and comic archives.

sources:
- kind: git_repo
  url: github:mate-desktop/atril.git
  track: v1.28.*
  ref: v1.28.1-0-g3b19e8f4c205

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- core/base-platform.bst
- deps/gtk3-companions.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libsecret.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libxml2.bst

runtime-depends:
- core/base-platform.bst
- deps/gtk3-companions.bst
- desktop/adw-gtk3.bst
- desktop/papirus-icon-theme.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/libsecret.bst

variables:
  meson-local: >-
    -Dcaja=false
    -Dpdf=enabled
    -Dcomics=enabled
    -Ddjvu=disabled
    -Depub=false
    -Dgtk_doc=false
