#!/bin/bash

# 设置策略路由
ip rule add fwmark 1 table 100 
ip route add local 0.0.0.0/0 dev lo table 100

# 代理局域网设备
iptables -t mangle -N V2RAY
# 回环地址
iptables -t mangle -A V2RAY -d 127.0.0.1/32 -j RETURN
# 组播地址
iptables -t mangle -A V2RAY -d 224.0.0.0/4 -j RETURN 
# 广播地址
iptables -t mangle -A V2RAY -d 255.255.255.255/32 -j RETURN
# 直连局域网
iptables -t mangle -A V2RAY -d 10.0.0.0/8 -p tcp -j RETURN
iptables -t mangle -A V2RAY -d 192.168.0.0/16 -p tcp -j RETURN
iptables -t mangle -A V2RAY -d 169.254.0.0/16 -p tcp -j RETURN
iptables -t mangle -A V2RAY -d 172.16.0.0/12 -p tcp -j RETURN
iptables -t mangle -A V2RAY -d 240.0.0.0/4 -p tcp -j RETURN
# 直连局域网，53 端口除外（因为要使用 V2Ray 的 
iptables -t mangle -A V2RAY -d 192.168.0.0/16 -p udp ! --dport 53 -j RETURN
iptables -t mangle -A V2RAY -d 169.254.0.0/16 -p udp ! --dport 53 -j RETURN
iptables -t mangle -A V2RAY -d 172.16.0.0/12 -p udp ! --dport 53 -j RETURN
iptables -t mangle -A V2RAY -d 240.0.0.0/4 -p udp ! --dport 53 -j RETURN
iptables -t mangle -A V2RAY -d 10.0.0.0/8 -p udp ! --dport 53 -j RETURN
# 给 UDP 打标记 1，转发至 1080 端口
iptables -t mangle -A V2RAY -p udp -j TPROXY --on-port 1080 --tproxy-mark 1
# 给 TCP 打标记 1，转发至 1080 端口
iptables -t mangle -A V2RAY -p tcp -j TPROXY --on-port 1080 --tproxy-mark 1
iptables -t mangle -A PREROUTING -j V2RAY # 应用规则

# 代理网关本机
iptables -t mangle -N V2RAY_LOCAL 
iptables -t mangle -A V2RAY_LOCAL -d 224.0.0.0/4 -j RETURN 
iptables -t mangle -A V2RAY_LOCAL -d 255.255.255.255/32 -j RETURN 
# 直连局域网
iptables -t mangle -A V2RAY_LOCAL -d 10.0.0.0/8 -p tcp -j RETURN
iptables -t mangle -A V2RAY_LOCAL -d 192.168.0.0/16 -p tcp -j RETURN
iptables -t mangle -A V2RAY_LOCAL -d 169.254.0.0/16 -p tcp -j RETURN
iptables -t mangle -A V2RAY_LOCAL -d 172.16.0.0/12 -p tcp -j RETURN
iptables -t mangle -A V2RAY_LOCAL -d 240.0.0.0/4 -p tcp -j RETURN
# 直连局域网，53 端口除外（因为要使用 V2Ray 的 DNS）
iptables -t mangle -A V2RAY_LOCAL -d 192.168.0.0/16 -p udp ! --dport 53 -j RETURN
iptables -t mangle -A V2RAY_LOCAL -d 169.254.0.0/16 -p udp ! --dport 53 -j RETURN
iptables -t mangle -A V2RAY_LOCAL -d 172.16.0.0/12 -p udp ! --dport 53 -j RETURN
iptables -t mangle -A V2RAY_LOCAL -d 240.0.0.0/4 -p udp ! --dport 53 -j RETURN
iptables -t mangle -A V2RAY_LOCAL -d 10.0.0.0/8 -p udp ! --dport 53 -j RETURN
# 直连 SO_MARK 为 0xff 的流量(0xff 是 16 进制数，数值上等同与上面V2Ray 配置的 255)，此规则目的是避免代理本机(网关)流量出现回环问题
iptables -t mangle -A V2RAY_LOCAL -j RETURN -m mark --mark 0xff    
# 给 UDP 打标记,重路由
iptables -t mangle -A V2RAY_LOCAL -p udp -j MARK --set-mark 1   
# 给 TCP 打标记，重路由
iptables -t mangle -A V2RAY_LOCAL -p tcp -j MARK --set-mark 1   
iptables -t mangle -A OUTPUT -j V2RAY_LOCAL # 应用规则
