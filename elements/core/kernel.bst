kind: manual

description: |
  Open Gaming Collective (OGC) Linux kernel + linux-firmware, dracut bootc initramfs, and UKI (future roadmap: CachyOS kernel swap).

sources:
- kind: git_repo
  url: github:OpenGamingCollective/linux.git
  track: main
  ref: v6.13.7-ogc1-0-g5e81d4c9a203
- kind: patch
  path: patches/linux/0001-velociraptor-desktop-preempt-ntsync.patch
- kind: local
  path: files/usr/lib/kernel/velociraptor-x86_64.config
- kind: local
  path: files/usr/lib/dracut/dracut.conf.d/10-velociraptor-bootc.conf

build-depends:
- junction: junctions/freedesktop-sdk.bst
  filename: public-stacks/buildsystem-make.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/bc.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/bison.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/flex.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/kmod.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/dracut.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/systemd.bst
- core/base-platform.bst

runtime-depends:
- core/base-platform.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/linux-firmware.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/kmod.bst
- junction: junctions/freedesktop-sdk.bst
  filename: components/dracut.bst

config:
  build-commands:
  - |
    make defconfig
    ARCH=x86_64 scripts/kconfig/merge_config.sh -m .config velociraptor-x86_64.config
    make olddefconfig
    make -j"${MAXJOBS}" bzImage modules
  install-commands:
  - |
    KVER=$(make -s kernelrelease)
    install -Dm644 arch/x86/boot/bzImage "%{install-root}%{libdir}/modules/${KVER}/vmlinuz"
    install -Dm644 10-velociraptor-bootc.conf "%{install-root}%{indep-libdir}/dracut/dracut.conf.d/10-velociraptor-bootc.conf"
    make INSTALL_MOD_PATH="%{install-root}%{prefix}" modules_install
    dracut --no-hostonly --conf 10-velociraptor-bootc.conf --kver "${KVER}" \
      "%{install-root}%{libdir}/modules/${KVER}/initramfs.img"
    ukify build \
      --linux="%{install-root}%{libdir}/modules/${KVER}/vmlinuz" \
      --initrd="%{install-root}%{libdir}/modules/${KVER}/initramfs.img" \
      --uname="${KVER}" \
      --cmdline="rw quiet splash systemd.show_status=auto" \
      --output="%{install-root}%{libdir}/modules/${KVER}/uki.efi"
