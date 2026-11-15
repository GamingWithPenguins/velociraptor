kind: meson

description: |
  Shared GTK3/desktop companion libraries (cinnamon-desktop, xapp, mate-desktop, gvfs, poppler-glib, libarchive, inih, sassc) for Nemo, Engrampa, Atril, imv, and adw-gtk3.

sources:
- kind: git_repo
  url: github:linuxmint/cinnamon-desktop.git
  track: 6.4.*
  ref: 6.4.1-0-g41e8c9d2b105
- kind: git_repo
  url: github:linuxmint/xapp.git
  directory: subprojects/xapp
  track: 2.8.*
  ref: 2.8.6-0-g82b4a1c9f018
- kind: git_repo
  url: github:mate-desktop/mate-desktop.git
  directory: subprojects/mate-desktop
  track: v1.28.*
  ref: v1.28.2-0-g39a0f1e4c721
- kind: git_repo
  url: gnome:gvfs.git
  directory: subprojects/gvfs
  track: 1.56.*
  ref: 1.56.1-0-g77e3a1c9f012
- kind: git_repo
  url: freedesktop:poppler/poppler.git
  directory: subprojects/poppler
  track: poppler-24.*
  ref: poppler-24.11.0-0-g52c8e1a9d304
- kind: git_repo
  url: github:libarchive/libarchive.git
  directory: subprojects/libarchive
  track: v3.7.*
  ref: v3.7.7-0-g91d4b2e0a615
- kind: git_repo
  url: github:benhoyt/inih.git
  directory: subprojects/inih
  track: r58
  ref: r58-0-g18c2a9e0f411
- kind: git_repo
  url: github:sass/sassc.git
  directory: subprojects/sassc
  track: 3.6.*
  ref: 3.6.2-0-g66f0e3b1a829

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/gtk3.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/librsvg.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/json-glib.bst
- core/base-platform.bst

runtime-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: components/gtk3.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/librsvg.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/json-glib.bst
- core/base-platform.bst

variables:
  meson-local: >-
    -Dintrospection=false
    -Dvapi=false
