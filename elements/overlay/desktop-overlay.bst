kind: import

description: |
  System configuration and /etc/skel dotfiles overlay for Umbriel + Noctalia v5.

sources:
- kind: local
  path: files

depends:
- core/base-platform.bst

runtime-depends:
- login/noctalia-greeter.bst
- desktop/umbriel.bst
- desktop/noctalia-shell.bst
- desktop/adw-gtk3.bst
- desktop/papirus-icon-theme.bst
