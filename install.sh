#!/usr/bin/env bash

# 下载文件
wget https://github.com/sephony/clash/releases/download/linux/clash-linux-amd64.tar.gz

# 解压文件
tar -xzvf clash-linux-amd64.tar.gz

# 进入文件夹
cd clash-linux-amd64

# 修改文件权限
chmod +x clash

# 复制文件
sudo cp -vr clash /usr/local/bin/
mkdir -p ~/.config
cp -vr Country.mmdb ~/.config

# 删除文件夹
rm -rf clash-linux-amd64
