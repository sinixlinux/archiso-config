#!/usr/bin/env bash
# encoding: utf-8

iso_name="sinix"
iso_label="SINIX_$(date +%Y%m)"
iso_publisher="tspillow <https://github.com/sinixlinux/sinix>"
iso_application="Sinix Linux Live/Installation CD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-ia32.grub.esp' 'uefi-x64.grub.esp')
arch="x86_64"
pacman_conf="pacman.conf"

# Define as permissões dentro do sistema de arquivos da ISO
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/etc/polkit-1/rules.d"]="0:0:750"
)
