# Contributing to velociraptor

1. Respect the two architectural breaks from Bluefin Dakota: keep the OS pure `freedesktop-sdk` + Noctalia (no GNOME OS components) and maintain a **single unified gaming image** (no non-gaming or NVIDIA variants).
2. Run `just validate` before editing or opening a pull request to verify the BuildStream 2 closure.
3. Keep upstream source patches structured under `patches/linux/` or `patches/common/` and place static systemd units, sysusers, tmpfiles, and configs under `files/`.
4. Test bootability locally with `just build`, `just rechunk`, and `just boot-test` (or `just show-me-the-future` for full UEFI QEMU verification).
