kind: manual

description: |
  System-wide Flathub repository configuration and systemd remote bootstrap for Flatpak.

sources:
- kind: local
  path: files/etc/flatpak/remotes.d/flathub.flatpakrepo
- kind: local
  path: files/usr/lib/systemd/system/velociraptor-flathub-remote.service

build-depends:
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst

config:
  install-commands:
  - |
    install -Dm644 flathub.flatpakrepo "%{install-root}%{sysconfdir}/flatpak/remotes.d/flathub.flatpakrepo"
    install -Dm644 velociraptor-flathub-remote.service "%{install-root}%{indep-libdir}/systemd/system/velociraptor-flathub-remote.service"
    mkdir -p "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants"
    ln -sf ../velociraptor-flathub-remote.service \
      "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants/velociraptor-flathub-remote.service"
