kind: stack

description: |
  Pure freedesktop-sdk core system stack (systemd, git, sudo, openssh, PipeWire, Flatpak) + local system-plumbing.

depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/runtime-minimal.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/systemd.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/git.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/sudo.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/openssh.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/dbus.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/polkit.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/flatpak.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/pipewire.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/wireplumber.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/xdg-utils.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/ca-certificates.bst
- deps/system-plumbing.bst
