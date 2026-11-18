kind: manual

description: |
  Flatpak GTK3 & GTK4 theme bridge for Noctalia v5 dynamic CSS templates and Papirus-Dark icons.

sources:
- kind: local
  path: files/usr/bin/noctalia-flatpak-theme-sync
- kind: local
  path: files/etc/skel/.local/share/flatpak/overrides/global

build-depends:
- core/base-platform.bst
- core/flathub.bst

runtime-depends:
- core/base-platform.bst
- core/flathub.bst
- desktop/noctalia-shell.bst
- desktop/adw-gtk3.bst
- desktop/papirus-icon-theme.bst

config:
  install-commands:
  - |
    install -Dm755 noctalia-flatpak-theme-sync "%{install-root}%{bindir}/noctalia-flatpak-theme-sync"
    install -Dm644 global "%{install-root}%{sysconfdir}/flatpak/overrides/global"
    mkdir -p "%{install-root}%{datadir}/flatpak/preinstall.d"
    printf '[Flatpak Preinstall org.gtk.Gtk3theme.adw-gtk3-dark]\nBranch=3.22\nIsRuntime=true\n' \
      > "%{install-root}%{datadir}/flatpak/preinstall.d/adw-gtk3-theme.preinstall"
