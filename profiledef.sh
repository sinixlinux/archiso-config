#!/usr/bin/env bash
# encoding: utf-8

iso_name="sinix"
iso_label="SINIX_$(date +%Y%m)"
iso_publisher="tspillow <https://github.com/sinixlinux/sinix>"
iso_application="Sinix Linux Live/Installation CD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('uefi-ia32.systemd-boot.esp' 'uefi-x64.systemd-boot.esp')
arch="x86_64"
pacman_conf="pacman.conf"

file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/passwd"]="0:0:644"
  ["/etc/group"]="0:0:644"
  ["/root"]="0:0:750"
  ["/etc/polkit-1/rules.d"]="0:0:750"
  ["/etc/skel/.config/autostart-scripts/set-wallpaper.sh"]="0:0:755"
  ["/usr/bin/beans"]="0:0:755"
)
