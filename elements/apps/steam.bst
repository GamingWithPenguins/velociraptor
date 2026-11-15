kind: manual

description: |
  Valve Steam native launcher packaged using Project Bluefin Dakota's i686 compat + steam-devices pattern.

sources:
- kind: tar
  url: steam:steam_1.0.0.81.tar.gz
  ref: 9d42e81b60c7a5f32910e48b51d7c920a1f4e8b3c291076a5d4e3f21b8c90a12

build-depends:
- core/base-platform.bst
- deps/steam-compat-i686.bst

runtime-depends:
- core/base-platform.bst
- core/kernel.bst
- deps/steam-compat-i686.bst
- desktop/xwayland-satellite.bst
- desktop/portals-stack.bst
- desktop/papirus-icon-theme.bst

config:
  install-commands:
  - |
    make install DESTDIR="%{install-root}" PREFIX="%{prefix}"
    ln -sf ../lib/steam/bin_steam.sh "%{install-root}%{bindir}/steam"
