kind: manual

description: |
  Open Gaming Collective (OGC) Linux kernel + linux-firmware & dracut initramfs (future roadmap: CachyOS kernel swap).

sources:
- kind: git_repo
  url: github:OpenGamingCollective/linux.git
  track: main
  ref: v6.13.7-ogc1-0-g5e81d4c9a203

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
    scripts/config -e CONFIG_SCHED_CLASS_EXT -m CONFIG_NTSYNC -e CONFIG_PREEMPT_DYNAMIC
    make -j"${MAXJOBS}" bzImage modules
  install-commands:
  - |
    KVER=$(make -s kernelrelease)
    install -Dm644 arch/x86/boot/bzImage "%{install-root}%{libdir}/modules/${KVER}/vmlinuz"
    make INSTALL_MOD_PATH="%{install-root}%{prefix}" modules_install
    dracut --no-hostonly --kver "${KVER}" --add "ostree" "%{install-root}%{libdir}/modules/${KVER}/initramfs.img"
