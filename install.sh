#!/usr/bin/env bash

# 下载文件
wget https://github.com/sephony/clash/releases/download/linux/clash-linux-amd64.tar.gz

# 解压文件
tar -xzvf clash-linux-amd64.tar.gz

# 重命名文件夹
mv clash-linux-amd64 clash

# 修改文件权限
chmod +x clash

# 移动文件
sudo mv clash/clash /usr/local/bin/

# 复制文件
cp -vr clash/Country ~/.config

# 删除文件夹
rm -rf clash
