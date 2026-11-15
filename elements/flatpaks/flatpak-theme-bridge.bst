kind: manual

description: |
  Flatpak GTK3 & GTK4 theme bridge for Noctalia v5 dynamic CSS templates and Papirus-Dark icons.

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
    mkdir -p "%{install-root}%{bindir}"
    mkdir -p "%{install-root}%{datadir}/flatpak/preinstall.d"
    mkdir -p "%{install-root}%{sysconfdir}/flatpak/overrides"
    mkdir -p "%{install-root}%{indep-libdir}/tmpfiles.d"
    cat << 'EOF' > "%{install-root}%{datadir}/flatpak/preinstall.d/adw-gtk3-theme.preinstall"
    [Flatpak Preinstall org.gtk.Gtk3theme.adw-gtk3-dark]
    Branch=3.22
    IsRuntime=true
    EOF
    cat << 'EOF' > "%{install-root}%{sysconfdir}/flatpak/overrides/global"
    [Context]
    filesystems=xdg-config/gtk-3.0:ro;xdg-config/gtk-4.0:ro;xdg-data/themes:ro;xdg-data/icons:ro;/usr/share/themes:ro;/usr/share/icons:ro;

    [Environment]
    GTK_THEME=adw-gtk3-dark
    ICON_THEME=Papirus-Dark
    EOF
    cat << 'EOF' > "%{install-root}%{indep-libdir}/tmpfiles.d/velociraptor-flatpak-themes.conf"
    d /var/lib/flatpak/overrides 0755 root root -
    C /var/lib/flatpak/overrides/global 0644 root root - /etc/flatpak/overrides/global
    EOF
    cat << 'EOF' > "%{install-root}%{bindir}/noctalia-flatpak-theme-sync"
    #!/usr/bin/env bash
    set -euo pipefail
    flatpak override --user \
      --filesystem=xdg-config/gtk-3.0:ro \
      --filesystem=xdg-config/gtk-4.0:ro \
      --filesystem=xdg-data/themes:ro \
      --filesystem=xdg-data/icons:ro \
      --filesystem=/usr/share/themes:ro \
      --filesystem=/usr/share/icons:ro \
      --env=GTK_THEME=adw-gtk3-dark \
      --env=ICON_THEME=Papirus-Dark
    EOF
    chmod 0755 "%{install-root}%{bindir}/noctalia-flatpak-theme-sync"
