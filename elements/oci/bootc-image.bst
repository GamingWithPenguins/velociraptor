kind: oci

description: |
  Packages system/os-compose.bst into a bootc-compliant OCI container image via bst-plugins-community oci plugin.

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
        org.opencontainers.image.base.name: "freedesktop-sdk-25.08"
