kind: oci

description: |
  Packages system/os-compose.bst into the single unified velociraptor gaming bootc OCI image (no non-gaming, no NVIDIA).

build-depends:
- system/os-compose.bst

config:
  mode: oci
  gzip: true
  images:
  - architecture: "amd64"
    os: linux
    layer:
    - system/os-compose.bst
    config:
      Exec:
      - "/sbin/init"
      Labels:
        containers.bootc: "1"
        ostree.bootable: "1"
        org.opencontainers.image.title: "velociraptor"
        org.opencontainers.image.description: "Pure freedesktop-sdk + Noctalia single gaming bootc image (zero GNOME OS, zero NVIDIA)"
        org.opencontainers.image.base.name: "freedesktop-sdk-25.08"
        velociraptor.variant: "gaming-only"
        velociraptor.nvidia: "none"
