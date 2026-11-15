kind: manual

description: |
  Default Flathub application suite for velociraptor (Paperwork, Spotify, Heroic, Popsicle, Bitwarden, GIMP, mpv, Discord, Zed, Collabora Office).

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
    mkdir -p "%{install-root}%{datadir}/flatpak/preinstall.d"
    mkdir -p "%{install-root}%{sysconfdir}/flatpak"
    mkdir -p "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants"
    cat << 'EOF' > "%{install-root}%{sysconfdir}/flatpak/default-flatpaks.list"
    work.openpaper.Paperwork
    com.spotify.Client
    com.heroicgameslauncher.hgl
    com.system76.Popsicle
    com.bitwarden.desktop
    org.gimp.GIMP
    io.mpv.Mpv
    com.discordapp.Discord
    dev.zed.Zed
    com.collaboraoffice.Office
    EOF
    cat << 'EOF' > "%{install-root}%{datadir}/flatpak/preinstall.d/velociraptor-default.preinstall"
    [Flatpak Preinstall work.openpaper.Paperwork]
    Branch=stable
    IsRuntime=false

    [Flatpak Preinstall com.spotify.Client]
    Branch=stable
    IsRuntime=false

    [Flatpak Preinstall com.heroicgameslauncher.hgl]
    Branch=stable
    IsRuntime=false

    [Flatpak Preinstall com.system76.Popsicle]
    Branch=stable
    IsRuntime=false

    [Flatpak Preinstall com.bitwarden.desktop]
    Branch=stable
    IsRuntime=false

    [Flatpak Preinstall org.gimp.GIMP]
    Branch=stable
    IsRuntime=false

    [Flatpak Preinstall io.mpv.Mpv]
    Branch=stable
    IsRuntime=false

    [Flatpak Preinstall com.discordapp.Discord]
    Branch=stable
    IsRuntime=false

    [Flatpak Preinstall dev.zed.Zed]
    Branch=stable
    IsRuntime=false

    [Flatpak Preinstall com.collaboraoffice.Office]
    Branch=stable
    IsRuntime=false
    EOF
    cat << 'EOF' > "%{install-root}%{indep-libdir}/systemd/system/velociraptor-flatpak-sync.service"
    [Unit]
    Description=Install default Flathub application suite for velociraptor
    After=network-online.target velociraptor-flathub-remote.service
    Wants=network-online.target velociraptor-flathub-remote.service
    ConditionPathExists=!/var/lib/flatpak/.velociraptor-defaults-installed

    [Service]
    Type=oneshot
    RemainAfterExit=yes
    ExecStart=/bin/sh -c 'xargs -r /usr/bin/flatpak install --system --noninteractive --or-update flathub < /etc/flatpak/default-flatpaks.list && touch /var/lib/flatpak/.velociraptor-defaults-installed'

    [Install]
    WantedBy=multi-user.target
    EOF
    ln -sf ../velociraptor-flatpak-sync.service \
      "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants/velociraptor-flatpak-sync.service"
