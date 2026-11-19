# velociraptor

Pure `freedesktop-sdk` (25.08) BuildStream v2 desktop gaming OS forked from Bluefin Dakota with two deliberate breaks:

1. **Pure Freedesktop + Noctalia Stack**: Replaces all GNOME OS / `gnome-build-meta` components with clean `freedesktop-sdk`, `greetd` + Noctalia Greeter, Umbriel + Noctalia Shell v5, Luciole, WezTerm, imv, Zen Browser, native Steam, Homebrew CLI tools (`git`, `fish`, `neovim`, `lazygit`), CUPS printing, and an 11-app Flathub suite (Paperwork, File Roller, Spotify, Heroic, Popsicle, Bitwarden, GIMP, mpv, Discord, Zed, Collabora Office).
2. **One Unified Gaming Image Only**: No non-gaming edition and no NVIDIA driver variant—ships a single open-source Mesa/Vulkan gaming image combining the Open Gaming Collective (OGC) kernel, `i686` Steam compat, `steam-devices`, and Feral GameMode.

## Quick Start (Build & Test)
```bash
just validate        # Verify BuildStream 2 graph & closure
just track           # Pin upstream git_repo, tar, and cargo2 refs
just build           # Build the single gaming oci/bootc-image.bst
just rechunk         # Slice ~120 OCI layers & run bootc container lint
just boot-test       # Boot & smoke-test in ephemeral VM
```

## End-User Commands (`ujust`)
```bash
ujust update                  # Stage bootc upgrade + Flatpak & Brew updates
ujust enroll-secure-boot-key  # Enroll Secure Boot MOK key
ujust report                  # Gather OS & hardware state for issue reports
```
![Please do not resize this app](https://img.shields.io/badge/don't%20resize-1920x1080_only-blue) 
