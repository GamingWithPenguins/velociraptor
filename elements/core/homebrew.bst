kind: manual

description: |
  Homebrew (Linuxbrew) bootstrap and declarative Brewfile deployment (git, fish, neovim, lazygit) for velociraptor.

build-depends:
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{bindir}"
    mkdir -p "%{install-root}%{sysconfdir}/brew"
    mkdir -p "%{install-root}%{sysconfdir}/profile.d"
    mkdir -p "%{install-root}%{indep-libdir}/sysusers.d"
    mkdir -p "%{install-root}%{indep-libdir}/tmpfiles.d"
    mkdir -p "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants"

    cat << 'EOF' > "%{install-root}%{indep-libdir}/sysusers.d/linuxbrew.conf"
    u linuxbrew - "Linuxbrew package manager" /var/home/linuxbrew /sbin/nologin
    EOF

    cat << 'EOF' > "%{install-root}%{indep-libdir}/tmpfiles.d/linuxbrew.conf"
    d /var/home/linuxbrew 0775 linuxbrew linuxbrew -
    d /var/home/linuxbrew/.linuxbrew 0775 linuxbrew linuxbrew -
    L+ /home/linuxbrew - - - - /var/home/linuxbrew
    EOF

    cat << 'EOF' > "%{install-root}%{sysconfdir}/brew/Brewfile"
    brew "git"
    brew "fish"
    brew "neovim"
    brew "lazygit"
    EOF

    cat << 'EOF' > "%{install-root}%{sysconfdir}/profile.d/velociraptor-brew.sh"
    if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
    export HOMEBREW_NO_ANALYTICS=1
    export EDITOR=nvim
    export VISUAL=nvim
    EOF

    printf '/bin/sh
/bin/bash
/home/linuxbrew/.linuxbrew/bin/fish
' > "%{install-root}%{sysconfdir}/shells"

    cat << 'EOF' > "%{install-root}%{bindir}/vi"
    #!/bin/sh
    exec /home/linuxbrew/.linuxbrew/bin/nvim "$@"
    EOF
    cat << 'EOF' > "%{install-root}%{bindir}/vim"
    #!/bin/sh
    exec /home/linuxbrew/.linuxbrew/bin/nvim "$@"
    EOF
    chmod 0755 "%{install-root}%{bindir}/vi" "%{install-root}%{bindir}/vim"

    cat << 'EOF' > "%{install-root}%{indep-libdir}/systemd/system/velociraptor-brew-sync.service"
    [Unit]
    Description=Install Homebrew and deploy default Brewfile CLI suite
    After=network-online.target systemd-tmpfiles-setup.service
    Wants=network-online.target
    ConditionPathExists=!/var/home/linuxbrew/.linuxbrew/.velociraptor-brew-ready

    [Service]
    Type=oneshot
    User=linuxbrew
    Environment=NONINTERACTIVE=1
    Environment=HOME=/var/home/linuxbrew
    ExecStart=/bin/bash -c 'if [ ! -x /home/linuxbrew/.linuxbrew/bin/brew ]; then curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash; fi && /home/linuxbrew/.linuxbrew/bin/brew bundle --file=/etc/brew/Brewfile --no-upgrade && ln -sf nvim /home/linuxbrew/.linuxbrew/bin/vi && ln -sf nvim /home/linuxbrew/.linuxbrew/bin/vim && touch /var/home/linuxbrew/.linuxbrew/.velociraptor-brew-ready'

    [Install]
    WantedBy=multi-user.target
    EOF
    ln -sf ../velociraptor-brew-sync.service \
      "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants/velociraptor-brew-sync.service"
