kind: stack

description: |
  Unified XDG Desktop Portal stack for Umbriel + GTK.

depends:
- junction: junctions/freedesktop-sdk.bst
  filename: components/xdg-desktop-portal.bst
- desktop/xdg-desktop-portal-umbriel.bst
- desktop/xdg-desktop-portal-gtk.bst
