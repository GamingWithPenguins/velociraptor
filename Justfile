arch := "x86_64"
registry := "ghcr.io/velociraptor-os/velociraptor"

default:
  @just --list

track:
  ./scripts/bootstrap-track.sh

build:
  ./scripts/build-oci.sh latest

push tag="latest":
  PUSH=1 ./scripts/build-oci.sh {{tag}}

shell element="desktop/umbriel.bst":
  bst -o arch {{arch}} shell {{element}}

show-closure:
  bst show --deps all --format '%{name} (%{kind})' oci/bootc-image.bst
