kind: meson

description: |
  System plumbing stack (ostree, NetworkManager, skopeo) built locally without gnome-build-meta.

sources:
- kind: git_repo
  url: freedesktop:NetworkManager/NetworkManager.git
  track: 1.50.*
  ref: 1.50.2-0-g81a4e09c2b10
- kind: git_repo
  url: github:ostreedev/ostree.git
  directory: subprojects/ostree
  track: v2025.*
  ref: v2025.2-0-g41c9e8b3a012

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-meson.bst
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-autotools.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/systemd.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/glib.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/curl.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/gpgme.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/fuse3.bst

runtime-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: components/systemd.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/glib.bst

variables:
  meson-local: >-
    -Dsession_tracking=systemd
    -Dsystemdsystemunitdir=%{libdir}/systemd/system
    -Dnm_cloud_setup=false
    -Dqt=false
