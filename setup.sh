#!/bin/bash

# Nama file repositori yang akan ditambahkan
SOURCE_LIST="/etc/apt/sources.list.d/security-repo.list"

# URL repositori, distribusi, dan komponen
REPO_URL="http://security.ubuntu.com/ubuntu"
DISTRIBUTION="jammy-security"
COMPONENT="main"

# Nama paket yang akan diinstal
PACKAGE="libc6"

echo "Menambahkan repositori baru ke APT sources..."

# Tambahkan repositori ke file .list di /etc/apt/sources.list.d/
if ! grep -q "^deb $REPO_URL $DISTRIBUTION $COMPONENT" $SOURCE_LIST 2>/dev/null; then
  echo "deb $REPO_URL $DISTRIBUTION $COMPONENT" | sudo tee $SOURCE_LIST
  echo "Repositori telah ditambahkan."
else
  echo "Repositori sudah ada di $SOURCE_LIST."
fi

# Perbarui daftar paket
echo "Memperbarui daftar paket..."
sudo apt update

# Instal paket
echo "Menginstal paket $PACKAGE..."
sudo apt install -y $PACKAGE

echo "Proses selesai!"
