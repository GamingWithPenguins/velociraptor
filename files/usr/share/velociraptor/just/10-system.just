default:
  @just --justfile /usr/share/velociraptor/just/10-system.just --list

update:
  sudo bootc upgrade
  flatpak update --system -y
  if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then /home/linuxbrew/.linuxbrew/bin/brew update && /home/linuxbrew/.linuxbrew/bin/brew upgrade; fi

enroll-secure-boot-key:
  @if [ -f /etc/pki/velociraptor/MOK.der ]; then sudo mokutil --import /etc/pki/velociraptor/MOK.der; else echo "No MOK.der staged; run gen-dev-keys first."; fi

report:
  @echo "=== velociraptor Hardware & Boot Diagnostics ==="
  @cat /usr/lib/os-release
  @bootc status || true
  @uname -a
  @umbriel --version || true

verify:
  systemctl --failed
  bootc status --booted

clean-system:
  flatpak uninstall --unused -y
  if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then /home/linuxbrew/.linuxbrew/bin/brew cleanup -s; fi
