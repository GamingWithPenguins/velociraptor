kind: manual

description: |
  UEFI bootloader stack (systemd-boot EFI payloads + bootupd + efibootmgr for Release 1; isolated for future rEFInd replacement).

sources:
- kind: git_repo
  url: github:coreos/bootupd.git
  track: v0.2.*
  ref: v0.2.25-0-g7c81e4a0d912
- kind: cargo2

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: components/rust.bst
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-make.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/systemd.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/efibootmgr.bst
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/systemd.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/efibootmgr.bst

config:
  build-commands:
  - |
    cargo build --release --offline
  install-commands:
  - |
    make install DESTDIR="%{install-root}" PREFIX="%{prefix}"
    EFI_ARCH="x64"
    EFI_UPDATES="%{install-root}%{indep-libdir}/bootupd/updates"
    install -Dm644 "%{indep-libdir}/systemd/boot/efi/systemd-boot${EFI_ARCH}.efi" \
      "${EFI_UPDATES}/EFI/systemd/systemd-boot${EFI_ARCH}.efi"
    install -Dm644 "%{indep-libdir}/systemd/boot/efi/systemd-boot${EFI_ARCH}.efi" \
      "${EFI_UPDATES}/EFI/BOOT/BOOT${EFI_ARCH^^}.EFI"
    bootupctl backend generate-update-metadata "%{install-root}"
