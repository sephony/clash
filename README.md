# linux-clash

## 离线下载

### 离线下载clash以及相关工具

[clash 网盘链接](https://wwi.lanzouy.com/iFWQ9hoalyb)
[clash 仓库链接](https://github.com/sephony/clash/blob/main/clash-linux-amd64-v1.2.0.gz)
[mmdb github链接](https://github.com/Dreamacro/maxmind-geoip/releases/download/20231212/Country.mmdb)
[mmdb 仓库链接](https://github.com/sephony/clash/blob/main/Country.mmdb)

### 安装clash

```bash
mv clash-linux-amd64-v1.2.0 clash
tar -xzvf clash.tar.gz
```

## 在线下载

### 在线下载clash以及相关工具

```bash
wget https://github.com/sephony/clash/releases/download/linux/clash-linux-amd64.tar.gz
tar -xzvf clash-linux-amd64.tar.gz
if [ ! -d "~/clash" ]; then
    mkdir ~/clash
    cp -vr clash-linux-amd64/* ~/clash
    rm -rf clash-linux-amd64
fi
mv ~/clash/clash-linux-amd64 ~/clash/clash
```

### 赋予文件执行权限

```bash
chmod +x ~/clash/clash
```
