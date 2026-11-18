kind: manual

description: |
  Default Flathub application suite for velociraptor (Paperwork, File Roller, Spotify, Heroic, Popsicle, Bitwarden, GIMP, mpv, Discord, Zed, Collabora Office).

sources:
- kind: local
  path: files/etc/flatpak/default-flatpaks.list
- kind: local
  path: files/usr/lib/systemd/system/velociraptor-flatpak-sync.service
- kind: local
  path: files/usr/lib/systemd/system/velociraptor-flatpak-update.service
- kind: local
  path: files/usr/lib/systemd/system/velociraptor-flatpak-update.timer

build-depends:
- core/base-platform.bst
- core/flathub.bst

runtime-depends:
- core/base-platform.bst
- core/flathub.bst
- desktop/portals-stack.bst
- flatpaks/flatpak-theme-bridge.bst

config:
  install-commands:
  - |
    install -Dm644 default-flatpaks.list "%{install-root}%{sysconfdir}/flatpak/default-flatpaks.list"
    install -Dm644 velociraptor-flatpak-sync.service "%{install-root}%{indep-libdir}/systemd/system/velociraptor-flatpak-sync.service"
    install -Dm644 velociraptor-flatpak-update.service "%{install-root}%{indep-libdir}/systemd/system/velociraptor-flatpak-update.service"
    install -Dm644 velociraptor-flatpak-update.timer "%{install-root}%{indep-libdir}/systemd/system/velociraptor-flatpak-update.timer"
    mkdir -p "%{install-root}%{datadir}/flatpak/preinstall.d"
    while IFS= read -r app; do
      [ -n "${app}" ] || continue
      printf '[Flatpak Preinstall %s]\nBranch=stable\nIsRuntime=false\n\n' "${app}"
    done < default-flatpaks.list > "%{install-root}%{datadir}/flatpak/preinstall.d/velociraptor-default.preinstall"
