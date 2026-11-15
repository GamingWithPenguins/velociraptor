kind: manual

description: |
  Zen Browser installed directly into /usr/lib/zen-browser with Noctalia CSS template support.

sources:
- kind: tar
  url: zen:1.12.5b/zen.linux-x86_64.tar.xz
  ref: d4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35

build-depends:
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst
- desktop/papirus-icon-theme.bst
- desktop/portals-stack.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{libdir}/zen-browser" "%{install-root}%{bindir}"
    cp -a . "%{install-root}%{libdir}/zen-browser/"
    ln -s "%{libdir}/zen-browser/zen" "%{install-root}%{bindir}/zen-browser"
