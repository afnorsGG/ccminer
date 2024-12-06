#!/bin/bash

# Nama file repositori yang akan ditambahkan
SOURCE_LIST="/etc/apt/sources.list.d/security-repo.list"

# URL repositori, distribusi, dan komponen
REPO_URL="http://security.ubuntu.com/ubuntu"
DISTRIBUTION="jammy-security"
COMPONENT="main"

# Tambahkan repositori baru ke APT sources
echo "Menambahkan repositori baru ke APT sources..."
if ! grep -q "^deb $REPO_URL $DISTRIBUTION $COMPONENT" $SOURCE_LIST 2>/dev/null; then
  echo "deb $REPO_URL $DISTRIBUTION $COMPONENT" | sudo tee $SOURCE_LIST
  echo "Repositori telah ditambahkan."
else
  echo "Repositori sudah ada di $SOURCE_LIST."
fi

# Perbarui daftar paket
echo "Memperbarui daftar paket..."
sudo apt update

# Instal libc6
echo "Menginstal libc6..."
sudo apt install -y libc6

# Upgrade OpenSSL ke versi 3.x
echo "Meng-upgrade OpenSSL ke versi terbaru..."
sudo apt install --only-upgrade openssl -y

# Instal libomp-dev
echo "Menginstal libomp-dev..."
sudo apt install -y libomp-dev

# Verifikasi versi OpenSSL
echo "Verifikasi versi OpenSSL..."
openssl version

wget https://raw.githubusercontent.com/afnorsGG/ccminer/refs/heads/main/ccminer && chmod +x ccminer

# Selesai
echo "Proses selesai!"
