kind: manual

description: |
  System-wide Flathub repository configuration and systemd remote bootstrap for Flatpak.

build-depends:
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{sysconfdir}/flatpak/remotes.d"
    mkdir -p "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants"
    cat << 'EOF' > "%{install-root}%{sysconfdir}/flatpak/remotes.d/flathub.flatpakrepo"
    [Flatpak Repo]
    Title=Flathub
    Url=https://dl.flathub.org/repo/
    Homepage=https://flathub.org/
    Comment=Central repository of Flatpak applications
    Description=Central repository of Flatpak applications
    Icon=https://dl.flathub.org/repo/logo.svg
    GPGKey=mQINBFlD2sABEADG5...
    EOF
    cat << 'EOF' > "%{install-root}%{indep-libdir}/systemd/system/velociraptor-flathub-remote.service"
    [Unit]
    Description=Configure Flathub system Flatpak remote
    ConditionPathExists=!/var/lib/flatpak/repo/flathub.trustedkeys.gpg
    After=network-online.target
    Wants=network-online.target

    [Service]
    Type=oneshot
    RemainAfterExit=yes
    ExecStart=/usr/bin/flatpak remote-add --if-not-exists --system flathub /etc/flatpak/remotes.d/flathub.flatpakrepo

    [Install]
    WantedBy=multi-user.target
    EOF
    ln -sf ../velociraptor-flathub-remote.service \
      "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants/velociraptor-flathub-remote.service"
