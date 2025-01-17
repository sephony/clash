# clash

这里记录一下我的clash多平台配置步骤，具体目录如下
<img align="right" src="https://github.com/jskherman/jskherman/assets/68434444/6d0eeb9f-cf5f-407b-8e2f-da0c2ffc79a3" alt="programming GIF" height=300 />
<a href="https://github.com/jskherman" target="_blank"><img src="https://skillicons.dev/icons?i=github" alt="github" /></a>

- [clash](#clash)
  - [clash for windows](#clash-for-windows)
    - [安装 clash for windows](#安装-clash-for-windows)
    - [配置 clash for windows](#配置-clash-for-windows)
  - [clash for linux](#clash-for-linux)
    - [安装 clash for linux](#安装-clash-for-linux)
      - [下载clash以及相关工具](#下载clash以及相关工具)
        - [文件说明](#文件说明)
        - [快速安装](#快速安装)
        - [分步安装](#分步安装)
    - [配置 clash for linux](#配置-clash-for-linux)
      - [导入clash for linux配置文件](#导入clash-for-linux配置文件)
      - [控制台设置](#控制台设置)
    - [配置 linux 系统代理](#配置-linux-系统代理)

## clash for windows

### 安装 clash for windows

[clash 仓库链接](https://github.com/sephony/clash/blob/main/clash-for-windows-v0.20.39.exe)

### 配置 clash for windows

## clash for linux

- [安装](#安装-clash-for-linux)
- [配置](#配置-clash-for-linux)

### 安装 clash for linux

#### 下载clash以及相关工具

##### 文件说明

- **客户端，可执行程序**:clash
- **配置文件**:~/.config/clash/config.yaml
  里面放着clash的接口,控制参数，链接信息等
- **ip数据库**~/.config/clash/Country.mmdb

以下两种方式采用其中一种即可，终端输入以下命令

##### 快速安装

```bash
if command -v curl >/dev/null 2>&1; then
    bash -c "$(curl -fsSL https://github.com/sephony/clash/blob/main/install.sh)"
else
    bash -c "$(wget -O- <https://github.com/sephony/clash/blob/main/install.sh>)"
fi
```

##### 分步安装

```bash
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
mkdir -p ~/.config/clash
cp -vr Country.mmdb ~/.config/clash
# 删除文件夹
rm -rf clash-linux-amd64
```

如果上面下载失效，可以从下面的链接分别下载clash和mmdb文件

[clash 网盘链接](https://wwi.lanzouy.com/iFWQ9hoalyb)
[clash 仓库链接](https://github.com/sephony/clash/blob/main/clash-linux-amd64-v1.2.0.gz)
[mmdb github链接](https://github.com/Dreamacro/maxmind-geoip/releases/download/20231212/Country.mmdb)
[mmdb 仓库链接](https://github.com/sephony/clash/blob/main/Country.mmdb)

如果你的clash和mmdb文件是从上面的链接下载的并且**放在同一目录下**（比如 `~/Downloads`），那么**请在当前路径**执行以下命令

```bash
# 解压文件
gzip -d clash-linux-amd64-v1.2.0.gz
# 修改文件名
mv clash-linux-amd64-v1.2.0 clash
# 修改文件权限
chmod +x clash
# 复制文件
sudo cp -vr clash /usr/local/bin/
mkdir -p ~/.config/clash
cp -vr Country.mmdb ~/.config/clash
```

### 配置 clash for linux

执行clash命令，会在`~/.config/clash`路径下生成配置文件`config.yaml`

```bash
clash
```

输出信息可能如下

```bash
INFO[0000] Can't find config, create a initial config file
INFO[0000] HTTP proxy listening at: 127.0.0.1:7890
```

修改 **`~/.config/clash/config.yaml`** 文件，默认生成的内容只有port一个参数:
`port: 7890`

然后配置的具体内容，如各种服务器，需要从代理提供商那边获取，通常会给一个url，比如 <https://efanyun.me/clash/11629/3xNXXXXX/> ，用浏览器访问这个地址将文件下载下来，将里面的服务器配置信息复制到上面的配置文件中。下面是一个示例：

```yaml
#http代理
# port: 7890
#socks代理
# socks-port: 7891
# redir-port: 7892
# tproxy-port: 7893

mixed-port: 7890
allow-lan: true
bind-address: "*"
#运行模式: 规则Rule,全局Global,直连Direct
mode: rule
#log-level: silent
log-level: info
#管理ip和端口
external-controller: '127.0.0.1:9090'
#管理密码
secret: '12345678'
dns:
  enable: true
  # listen: 0.0.0.0:53
  ipv6: false

  default-nameserver:
    - 223.5.5.5
    - 119.29.29.29
    - 114.114.114.114
  enhanced-mode: redir-host
  fake-ip-range: 198.18.0.1/16
  use-hosts: true
  nameserver:
    - https://dns.alidns.com/dns-query
    - https://dns.rubyfish.cn/dns-query
    - https://223.5.5.5/dns-query
    - https://dns.pub/dns-query
  fallback:
    - tls://8.8.8.8:853
    - tls://dns.rubyfish.cn:853
    - https://1.0.0.1/dns-query
    - https://public.dns.iij.jp/dns-query
    - https://dns.twnic.tw/dns-query
  fallback-filter:
    geoip: true
    ipcidr:
      - 240.0.0.0/4
      - 0.0.0.0/32

proxies:
- name: 香港1
```

然后启动clash，从日志可能看到如下信息：

```bash
$ clash
INFO[0000] Start initial compatible provider 故障转移
INFO[0000] Start initial compatible provider 自动选择
INFO[0000] Start initial compatible provider 节点选择
INFO[0000] Mixed(http+socks5) proxy listening at: :7890
INFO[0000] RESTful API listening at: 127.0.0.1:9090
```

到这步就要马上成功啦！

#### 控制台设置

接下来浏览器打开[clash控制台](http://clash.razord.top/)

在控制台页面，点击 `设置` -> `外部控制设置`，填入地址：(要和配置文件中的外部监听地址`external-controller`一致)

> Host：127.0.0.1
> 端口： 9090

之后就可以通过控制台页面(DashBoard)进行操作了，控制台页面操作的结果不会影响配置文件。
只会影响当前clash的运行策略（比如更换当前线路等操作）。
