kind: manual

description: |
  Homebrew (Linuxbrew) bootstrap and declarative Brewfile deployment (git, fish, neovim, lazygit) for velociraptor.

sources:
- kind: local
  path: files/etc/brew/Brewfile
- kind: local
  path: files/etc/profile.d/velociraptor-brew.sh
- kind: local
  path: files/usr/lib/systemd/system/velociraptor-brew-sync.service

build-depends:
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst

config:
  install-commands:
  - |
    install -Dm644 Brewfile "%{install-root}%{sysconfdir}/brew/Brewfile"
    install -Dm644 velociraptor-brew.sh "%{install-root}%{sysconfdir}/profile.d/velociraptor-brew.sh"
    install -Dm644 velociraptor-brew-sync.service "%{install-root}%{indep-libdir}/systemd/system/velociraptor-brew-sync.service"
    mkdir -p "%{install-root}%{bindir}" "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants"
    printf '/bin/sh\n/bin/bash\n/home/linuxbrew/.linuxbrew/bin/fish\n' > "%{install-root}%{sysconfdir}/shells"
    printf '#!/bin/sh\nexec /home/linuxbrew/.linuxbrew/bin/nvim "$@"\n' > "%{install-root}%{bindir}/vi"
    printf '#!/bin/sh\nexec /home/linuxbrew/.linuxbrew/bin/nvim "$@"\n' > "%{install-root}%{bindir}/vim"
    chmod 0755 "%{install-root}%{bindir}/vi" "%{install-root}%{bindir}/vim"
    ln -sf ../velociraptor-brew-sync.service \
      "%{install-root}%{indep-libdir}/systemd/system/multi-user.target.wants/velociraptor-brew-sync.service"
