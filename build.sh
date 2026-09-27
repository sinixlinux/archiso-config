#!/bin/bash

set -e

PROFILE_DIR="/tmp/archiso-sinix"
WORK_DIR="/tmp/archiso-work"
OUT_DIR="./out"

echo "[-+] Replacing old build artifacts..."
sudo rm -rf "${WORK_DIR}"
mkdir -p "${OUT_DIR}"

echo "[-+] Copying baseline Archiso profile..."
sudo rm -rf "${PROFILE_DIR}"
# Copies the official baseline profile to our temporary compilation path
cp -r /usr/share/archiso/configs/releng/ "${PROFILE_DIR}"

echo "[+] Injecting Sinix Linux's package list..."
# Append or overwrite the packages.x86_64 to include calamares and your WMs
cp packages.x86_64 "${PROFILE_DIR}/packages.x86_64"

echo "[+] Overlaying custom filesystem and Calamares configs..."
# Copies everything from your repo's airootfs directly into the build profile
cp -r airootfs/* "${PROFILE_DIR}/airootfs/"

echo "[!] Finally, running mkarchiso..."
# Execute the official build command
sudo mkarchiso -v -w "${WORK_DIR}" -o "${OUT_DIR}" "${PROFILE_DIR}"

echo "=== Build Complete! Your ISO is in the ${OUT_DIR} directory."
