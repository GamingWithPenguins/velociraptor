kind: manual

description: |
  Papirus SVG icon theme with Noctalia dynamic folder-recoloring compatibility.

sources:
- kind: git_repo
  url: github:PapirusDevelopmentTeam/papirus-icon-theme.git
  track: master
  ref: 20250501-0-g3a8e190b7d21

build-depends:
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/gtk3.bst

runtime-depends:
- core/base-platform.bst

config:
  install-commands:
  - |
    make install DESTDIR="%{install-root}" PREFIX="%{prefix}"
    gtk-update-icon-cache -f -t "%{install-root}%{datadir}/icons/Papirus"
    gtk-update-icon-cache -f -t "%{install-root}%{datadir}/icons/Papirus-Dark"
