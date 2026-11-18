kind: import

description: |
  Declarative OS policy, systemd presets/sysusers/tmpfiles, bootc update timers, ujust recipes, and /etc/skel overlay.

sources:
- kind: local
  path: files

depends:
- core/base-platform.bst

runtime-depends:
- core/bootc.bst
- core/ujust.bst
- login/noctalia-greeter.bst
- desktop/umbriel.bst
- desktop/noctalia-shell.bst
- desktop/adw-gtk3.bst
- desktop/papirus-icon-theme.bst
