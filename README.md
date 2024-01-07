# linux-clash

- [安装](#安装)
- [配置](#配置clash)

## 安装

### 下载clash以及相关工具

#### 文件说明

- **客户端，可执行程序**:clash
- **配置文件**:~/.config/clash/config.yaml
  里面放着clash的接口,控制参数，链接信息等
- **ip数据库**~/.config/clash/Country.mmdb

以下两种方式采用其中一种即可

#### 快速安装

```bash
if command -v curl >/dev/null 2>&1; then
    bash -c "$(curl -fsSL https://github.com/sephony/clash/blob/main/install.sh)"
else
    bash -c "$(wget -O- <https://github.com/sephony/clash/blob/main/install.sh>)"
fi
```

#### 分步安装

```bash
wget https://github.com/sephony/clash/releases/download/linux/clash-linux-amd64.tar.gz
tar -xzvf clash-linux-amd64.tar.gz
mv clash-linux-amd64 clash
chmod +x clash
sudo mv clash-linux-amd64/clash /usr/local/bin/
cp -vr clash-linux-amd64/Country ~/.config
rm -rf clash-linux-amd64
```

如果上面下载失效，可以从下面的链接下载

[clash 网盘链接](https://wwi.lanzouy.com/iFWQ9hoalyb)
[clash 仓库链接](https://github.com/sephony/clash/blob/main/clash-linux-amd64-v1.2.0.gz)
[mmdb github链接](https://github.com/Dreamacro/maxmind-geoip/releases/download/20231212/Country.mmdb)
[mmdb 仓库链接](https://github.com/sephony/clash/blob/main/Country.mmdb)

## 配置clash

执行clash命令，生成配置文件

```bash
clash
```

输出信息可能如下

```bash
INFO[0000] Can't find config, create a initial config file
INFO[0000] HTTP proxy listening at: 127.0.0.1:7890
```

修改 ~/.config/clash/config.yaml 文件，默认生成的内容只有port一个参数:
`port: 7890`

退出clash，修改配置文件为：

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
external-controller: '0.0.0.0:9090'
#管理密码
secret: '12345678'
```

然后配置的其他内容，如各种服务器，需要从代理提供商那边获取，通常会给一个url，比如 <https://efanyun.me/clash/11629/3xNXXXXX/> ，用浏览器访问这个地址将文件下载下来，将里面的服务器配置信息复制到上面的配置文件中。

```yaml
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
INFO[0000] RESTful API listening at: 0.0.0.0:9090
```

浏览器打开[控制台地址](http://clash.razord.top/ )

在控制台页面，点击 “设置” -> “外部控制设置”，填入地址：

> Host：127.0.0.1
> 端口： 9090
> 密钥： 12345678
> 之后就可以通过控制台页面进行配置了，但要注意的是：控制台页面操作的结果并不会保存到配置文件，只能是临时生效。
