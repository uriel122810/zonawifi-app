# 2026-08-04 20:21:03 by RouterOS 7.18.2
# software id = 33ZX-QSFJ
#
# model = L009UiGS
# serial number = HK70ARJ2RCK
/interface bridge
add name=bridge1 port-cost-mode=short
/interface ethernet
set [ find default-name=ether8 ] comment=ether8 mac-address=78:9A:18:C3:5F:6D \
    name=ANTENA poe-out=off
set [ find default-name=ether2 ] comment="ether2 (salida de Internet)" \
    mac-address=78:9A:18:C3:5F:67 name=LAN
set [ find default-name=ether5 ] comment=ether5 mac-address=78:9A:18:C3:5F:6A \
    name=VLAN1
set [ find default-name=sfp1 ] comment=sfp1 mac-address=78:9A:18:C3:5F:6E \
    name=VLANS2
set [ find default-name=ether1 ] comment="ether1 (entrada Internet)" \
    mac-address=78:9A:18:C3:5F:66 name=WAN
set [ find default-name=ether3 ] mac-address=78:9A:18:C3:5F:68
set [ find default-name=ether4 ] mac-address=78:9A:18:C3:5F:69
set [ find default-name=ether6 ] mac-address=78:9A:18:C3:5F:6B
set [ find default-name=ether7 ] mac-address=78:9A:18:C3:5F:6C
/interface vlan
add interface=VLANS2 name=2vlan1 vlan-id=21
add interface=VLANS2 name=2vlan2 vlan-id=22
add interface=VLANS2 name=2vlan3 vlan-id=23
add interface=VLANS2 name=2vlan4 vlan-id=24
add interface=VLANS2 name=2vlan5 vlan-id=25
add interface=VLANS2 name=2vlan6 vlan-id=26
add interface=VLANS2 name=2vlan7 vlan-id=27
add interface=VLAN1 name=vlan1 vlan-id=11
add interface=VLAN1 name=vlan2 vlan-id=12
add interface=VLAN1 name=vlan3 vlan-id=13
add interface=VLAN1 name=vlan4 vlan-id=14
add interface=VLAN1 name=vlan5 vlan-id=15
add interface=VLAN1 name=vlan6 vlan-id=16
add interface=VLAN1 name=vlan7 vlan-id=17
/ip hotspot profile
set [ find default=yes ] http-cookie-lifetime=12h login-by=\
    cookie,http-chap,http-pap
add dns-name=zonawifi.com hotspot-address=10.10.110.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof1
add dns-name=zonawifi.com hotspot-address=10.10.120.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof2
add dns-name=zonawifi.com hotspot-address=10.10.130.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof3
add dns-name=zonawifi.com hotspot-address=10.10.140.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof4
add dns-name=zonawifi.com hotspot-address=10.10.150.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof5
add dns-name=zonawifi.com hotspot-address=10.10.160.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof6
add dns-name=zonawifi.com hotspot-address=10.10.170.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof7
add dns-name=zonawifi.com hotspot-address=10.10.180.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof8
add dns-name=zonawifi.com hotspot-address=10.10.201.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof9
add dns-name=zonawifi.com hotspot-address=10.10.202.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof10
add dns-name=zonawifi.com hotspot-address=10.10.203.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof11
add dns-name=zonawifi.com hotspot-address=10.10.204.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof12
add dns-name=zonawifi.com hotspot-address=10.10.205.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof13
add dns-name=zonawifi.com hotspot-address=10.10.206.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof14
add dns-name=zonawifi.com hotspot-address=10.10.207.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof15
add dns-name=zonawifi.com hotspot-address=10.10.208.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof16
add dns-name=zonawifi.com hotspot-address=10.10.100.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof17
add dns-name=zonawifi.com hotspot-address=10.10.100.1 http-cookie-lifetime=\
    12h login-by=cookie,http-chap,http-pap name=hsprof18
/ip hotspot user profile
set [ find default=yes ] keepalive-timeout=30s on-login=\
    "/ip hotspot user set [find name=\$user] mac-address=\$mac-address" \
    shared-users=2
add keepalive-timeout=30s name=12-hora on-login=notificacion5pesos \
    shared-users=2 status-autorefresh=2m
add keepalive-timeout=30s name=5-dia on-login=notificacion20pesos \
    shared-users=2
add keepalive-timeout=30s name=prueba30m on-login=scripts5juntos \
    shared-users=2
/ip pool
add name=dhcp_pool0 ranges=10.10.100.2-10.10.100.254
add name=hs-pool-10 ranges=10.10.110.2-10.10.110.254
add name=hs-pool-11 ranges=10.10.120.2-10.10.120.254
add name=hs-pool-12 ranges=10.10.130.2-10.10.130.254
add name=dhcp_pool4 ranges=10.10.140.2-10.10.140.254
add name=hs-pool-13 ranges=10.10.150.2-10.10.150.254
add name=hs-pool-14 ranges=10.10.160.2-10.10.160.254
add name=hs-pool-15 ranges=10.10.170.2-10.10.170.254
add name=hs-pool-17 ranges=10.10.201.2-10.10.201.254
add name=hs-pool-18 ranges=10.10.202.2-10.10.202.254
add name=hs-pool-19 ranges=10.10.203.2-10.10.203.254
add name=hs-pool-20 ranges=10.10.204.2-10.10.204.254
add name=hs-pool-21 ranges=10.10.205.2-10.10.205.254
add name=hs-pool-22 ranges=10.10.206.2-10.10.206.254
add name=hs-pool-23 ranges=10.10.207.2-10.10.207.254
add name=hs-pool-24 ranges=10.10.208.2-10.10.208.254
/ip dhcp-server
# DHCP server can not run on slave interface!
add address-pool=dhcp_pool0 interface=LAN name=dhcp1
add address-pool=hs-pool-10 interface=vlan1 name=dhcp2
add address-pool=hs-pool-11 interface=vlan2 name=dhcp3
add address-pool=hs-pool-12 interface=vlan3 name=dhcp4
# DHCP server can not run on slave interface!
add address-pool=dhcp_pool4 interface=ANTENA name=dhcp5
add address-pool=hs-pool-13 interface=vlan4 name=dhcp6
add address-pool=hs-pool-14 interface=vlan5 name=dhcp7
add address-pool=hs-pool-15 interface=vlan6 name=dhcp8
add address-pool=hs-pool-17 interface=2vlan1 name=dhcp9
add address-pool=hs-pool-18 interface=2vlan2 name=dhcp10
add address-pool=hs-pool-19 interface=2vlan3 name=dhcp11
add address-pool=hs-pool-20 interface=2vlan4 name=dhcp12
add address-pool=hs-pool-21 interface=2vlan5 name=dhcp13
add address-pool=hs-pool-22 interface=2vlan6 name=dhcp14
add address-pool=hs-pool-23 interface=2vlan7 name=dhcp15
add address-pool=dhcp_pool0 interface=bridge1 name=dhcp17
/ip hotspot
add address-pool=hs-pool-10 disabled=no interface=vlan1 name=hotspot1 \
    profile=hsprof1
add address-pool=hs-pool-11 disabled=no interface=vlan2 name=hotspot2 \
    profile=hsprof2
add address-pool=hs-pool-12 disabled=no interface=vlan3 name=hotspot3 \
    profile=hsprof3
add address-pool=hs-pool-13 disabled=no interface=vlan4 name=hotspot4 \
    profile=hsprof5
add address-pool=hs-pool-14 disabled=no interface=vlan5 name=hotspot5 \
    profile=hsprof6
add address-pool=hs-pool-15 disabled=no interface=vlan6 name=hotspot6 \
    profile=hsprof8
add address-pool=hs-pool-17 disabled=no interface=2vlan1 name=hs-2vlan1 \
    profile=hsprof9
add address-pool=hs-pool-18 disabled=no interface=2vlan2 name=hs-2vlan2 \
    profile=hsprof10
add address-pool=hs-pool-19 disabled=no interface=2vlan3 name=hs-2vlan3 \
    profile=hsprof11
add address-pool=hs-pool-20 disabled=no interface=2vlan4 name=hs-2vlan4 \
    profile=hsprof12
add address-pool=hs-pool-21 disabled=no interface=2vlan5 name=hs-2vlan5 \
    profile=hsprof13
add address-pool=hs-pool-22 disabled=no interface=2vlan6 name=hs-2vlan6 \
    profile=hsprof14
add address-pool=hs-pool-23 disabled=no interface=2vlan7 name=hs-2vlan7 \
    profile=hsprof15
add address-pool=dhcp_pool0 disabled=no interface=bridge1 name=hotspot7 \
    profile=hsprof18
/port
set 0 name=serial0
/interface bridge port
add bridge=bridge1 interface=LAN internal-path-cost=10 path-cost=10
add bridge=bridge1 interface=ANTENA internal-path-cost=10 path-cost=10
/ip firewall connection tracking
set udp-timeout=10s
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/ip settings
set max-neighbor-entries=14336
/ipv6 settings
set max-neighbor-entries=7168
/interface ovpn-server server
add mac-address=FE:76:85:7B:9E:EE name=ovpn-server1
/ip address
add address=10.10.100.1/24 interface=bridge1 network=10.10.100.0
add address=10.10.110.1/24 interface=vlan1 network=10.10.110.0
add address=10.10.120.1/24 interface=vlan2 network=10.10.120.0
add address=10.10.130.1/24 interface=vlan3 network=10.10.130.0
add address=10.10.150.1/24 interface=vlan4 network=10.10.150.0
add address=10.10.160.1/24 interface=vlan5 network=10.10.160.0
add address=10.10.170.1/24 interface=vlan6 network=10.10.170.0
add address=10.10.180.1/24 interface=vlan7 network=10.10.180.0
add address=10.10.201.1/24 interface=2vlan1 network=10.10.201.0
add address=10.10.202.1/24 interface=2vlan2 network=10.10.202.0
add address=10.10.203.1/24 interface=2vlan3 network=10.10.203.0
add address=10.10.204.1/24 interface=2vlan4 network=10.10.204.0
add address=10.10.205.1/24 interface=2vlan5 network=10.10.205.0
add address=10.10.206.1/24 interface=2vlan6 network=10.10.206.0
add address=10.10.207.1/24 interface=2vlan7 network=10.10.207.0
/ip cloud
set ddns-enabled=yes ddns-update-interval=1m
/ip dhcp-client
add interface=WAN
/ip dhcp-server
add address-pool=hs-pool-24 interface=*18 name=dhcp16
/ip dhcp-server network
add address=10.10.100.0/24 gateway=10.10.100.1
add address=10.10.110.0/24 comment="hotspot network" gateway=10.10.110.1
add address=10.10.120.0/24 comment="hotspot network" gateway=10.10.120.1
add address=10.10.130.0/24 comment="hotspot network" gateway=10.10.130.1
add address=10.10.140.0/24 gateway=10.10.140.1
add address=10.10.150.0/24 comment="hotspot network" gateway=10.10.150.1
add address=10.10.160.0/24 comment="hotspot network" gateway=10.10.160.1
add address=10.10.170.0/24 comment="hotspot network" gateway=10.10.170.1
add address=10.10.201.0/24 comment="hotspot network" gateway=10.10.201.1
add address=10.10.202.0/24 comment="hotspot network" gateway=10.10.202.1
add address=10.10.203.0/24 comment="hotspot network" gateway=10.10.203.1
add address=10.10.204.0/24 comment="hotspot network" gateway=10.10.204.1
add address=10.10.205.0/24 comment="hotspot network" gateway=10.10.205.1
add address=10.10.206.0/24 comment="hotspot network" gateway=10.10.206.1
add address=10.10.207.0/24 comment="hotspot network" gateway=10.10.207.1
add address=10.10.208.0/24 comment="hotspot network" gateway=10.10.208.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8,8.8.4.4
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=WAN
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.110.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.120.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.130.0/24
add action=masquerade chain=srcnat out-interface=bridge1
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.140.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.150.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.160.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.170.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.170.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.201.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.202.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.203.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.204.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.205.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.206.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.207.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.100.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.208.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.100.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.100.0/24
/ip hotspot user
add name=admin
add name=12345
add name=220900
add name=12345678 profile=12-hora
/ip hotspot walled-garden
add comment="place hotspot rules here"
add dst-host=http://zonawifi.com
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/system clock
set time-zone-name=America/Mexico_City
/system identity
set name=Archuit
/system logging
add action=disk prefix=-> topics=hotspot,info,debug
/system note
set show-at-login=no
/system ntp client
set enabled=yes
/system ntp client servers
add address=mx.pool.ntp.org
add address=north-america.pool.ntp.org
add address=.north-america.pool.ntp.org
/system routerboard settings
set enter-setup-on=delete-key
/system scheduler
add interval=10s name=MONITOR-MIKRO-ZAMBAD-PARA-TODOS-LOS-TIEMPOS on-event=":l\
    ocal dateint do={\r\
    \n  :local days [:pick \$d 8 10];\r\
    \n  :local month [:pick \$d 5 7];\r\
    \n  :local year [:pick \$d 0 4];\r\
    \n  :return ([:tonum (\$year.\$month.\$days)]);\r\
    \n};\r\
    \n\r\
    \n:local timeint do={\r\
    \n  :local hours [:pick \$t 0 2];  \r\
    \n  :local minutes [:pick \$t 3 5];  \r\
    \n  :return (\$hours * 60 + \$minutes);\r\
    \n};\r\
    \n\r\
    \n:local date [ /system clock get date ];\r\
    \n:local time [ /system clock get time ];\r\
    \n:local today [\$dateint d=\$date];\r\
    \n:local curtime [\$timeint t=\$time];\r\
    \n\r\
    \n:foreach i in=[ /ip hotspot user find where ] do={\r\
    \n  :local comment [ /ip hotspot user get \$i comment];\r\
    \n  :local name [ /ip hotspot user get \$i name];\r\
    \n  :local getdate [:pick \$comment 0 10];\r\
    \n  :local gettime [:pick \$comment 11 19];\r\
    \n\r\
    \n  :if ([:pick \$getdate 4] = \"-\" and [:pick \$getdate 7] = \"-\") do={\
    \r\
    \n    :local expd [\$dateint d=\$getdate];\r\
    \n    :local expt [\$timeint t=\$gettime];\r\
    \n\r\
    \n    :if ((\$expd < \$today and \$expt < \$curtime) or (\$expd < \$today \
    and \$expt > \$curtime) or (\$expd = \$today and \$expt < \$curtime)) do={\
    \r\
    \n      /ip hotspot user remove \$i;\r\
    \n      /ip hotspot active remove [find where user=\$name];\r\
    \n    }\r\
    \n  }\r\
    \n}\r\
    \n\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2024-01-25 start-time=17:05:21
add interval=10m name=Tarea_Limpieza_Diaria on-event=\
    "/ip hotspot user remove [find where profile=\"prueba30m\"]" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2026-04-14 start-time=20:20:47
add interval=1d name=Tarea_Limpieza_Diaria1 on-event=\
    "/ip hotspot user remove [find where profile=\"12-hora\"]" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2026-04-14 start-time=06:10:47
add interval=1w name=Tarea_Limpieza_semana on-event=\
    "/ip hotspot user remove [find where profile=\"5-dia\"]" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2026-04-20 start-time=06:09:47
add interval=1m name=run_chek_uptime on-event=Telegram_ policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2026-04-14 start-time=20:51:49
add interval=1d name=Limpieza_Diaria_5AM on-event="/ip hotspot cookie remove [\
    find]\
    \n/ip hotspot active remove [find]\
    \n/ip hotspot user disable [find uptime>0s]" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2026-08-04 start-time=05:00:00
/system script
add comment=mikhmon dont-require-permissions=no name="2025-01-06-|-19:47:42-|-\
    12345-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-12h-|-1-dia-|-vc" owner=\
    202-06 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-06
add comment=mikhmon dont-require-permissions=no name="2025-01-06-|-19:52:07-|-\
    54321-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-12h-|-1-dia-|-vc" owner=\
    202-06 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-06
add comment=mikhmon dont-require-permissions=no name="2025-01-06-|-19:59:42-|-\
    54321-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-12h-|-1-dia-|-vc-vc" \
    owner=202-06 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-06
add comment=mikhmon dont-require-permissions=no name="2025-01-07-|-09:18:39-|-\
    12345-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-12h-|-12-hora-|-vc-ene" \
    owner=202-07 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-07
add comment=mikhmon dont-require-permissions=no name="2025-01-07-|-09:29:31-|-\
    12345-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-12h-|-12-hora-|-vc" \
    owner=202-07 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-07
add comment=mikhmon dont-require-permissions=no name="2025-01-07-|-13:01:30-|-\
    23456-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-10m-|-prueba-|-vc-prueva" \
    owner=202-07 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-07
add comment=mikhmon dont-require-permissions=no name="2025-01-07-|-14:10:58-|-\
    12345-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-10m-|-prueba-|-up" owner=\
    202-07 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-07
add comment=mikhmon dont-require-permissions=no name="2025-01-07-|-20:22:18-|-\
    54321-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-10m-|-prueba-|-up-611-12.1\
    8.24" owner=202-07 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-07
add comment=mikhmon dont-require-permissions=no name="2025-01-07-|-22:01:12-|-\
    123456-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-30m-|-prueba-|-vc-prueba" \
    owner=202-07 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-07
add comment=mikhmon dont-require-permissions=no name="2025-01-08-|-06:48:39-|-\
    223344-|-5-|-10.10.140.254-|-00:01:2E:58:24:59-|-12h-|-12-hora-|-vc-1" \
    owner=202-08 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-08
add comment=mikhmon dont-require-permissions=no name="2025-01-08-|-08:58:27-|-\
    prueba-|-2-|-10.10.140.254-|-00:01:2E:58:24:59-|-30m-|-30-minutos-|-vc-q" \
    owner=202-08 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-08
add comment=mikhmon dont-require-permissions=no name="2025-01-08-|-15:39:27-|-\
    54321-|-2-|-10.10.140.254-|-00:01:2E:58:24:59-|-30m-|-30-minutos-|-vc-1" \
    owner=202-08 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-01-08
add dont-require-permissions=no name=notificacion20pesos owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local botToken \"8389409042:AAGBHF4TuJguPmSUSZgKig9B7WC1BNVswE8\";\
    \n\
    \n:local userID \"-4903325771\";\
    \n\
    \n:local comentario1 \" \$user 20 pesos\"; :local SEND do={ :put \$3; /too\
    l fetch url=\"https://api.telegram.org/bot\$1/sendmessage\?chat_id=\$2&tex\
    t=\$3\" output=user; }; \$SEND \$botToken \$userID \$comentario1;"
add dont-require-permissions=no name=notificacion5pesos owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    local botToken \"8389409042:AAGBHF4TuJguPmSUSZgKig9B7WC1BNVswE8\";\
    \n\
    \n:local userID \"-4903325771\";\
    \n:local comentario1 \" \$user 5 pesos\"; :local SEND do={ :put \$3; /tool\
    \_fetch url=\"https://api.telegram.org/bot\$1/sendmessage\?chat_id=\$2&tex\
    t=\$3\" output=user; }; \$SEND \$botToken \$userID \$comentario1;"
add dont-require-permissions=yes name=Telegram_ owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="#\
    \_---- Configuraci\F3n de Telegram (Opcional) ----\
    \n\r\
    \n:local botToken \"8389409042:AAGBHF4TuJguPmSUSZgKig9B7WC1BNVswE8\"\
    \n\r\
    \n:local chatId \"-4903325771\"\r\
    \n\
    \n:local identity [/system identity get name]\r\
    \n\
    \n\
    \n# ---- L\F3gica del Script ----\
    \n\r\
    \n :foreach i in=[/ip hotspot active find] do={\
    \n    :local user [/ip hotspot active get \$i user]\
    \n       :local uptime [/ip hotspot active get \$i uptime]\
    \n   \r\
    \n   :local address [/ip hotspot active get \$i address]\
    \n\
    \n  \r\
    \n\r\
    \n # Verificamos si el uptime es exactamente 1 minuto\
    \n \r\
    \n # Nota: El formato de uptime es \"00:01:00\"\
    \n  \r\
    \n :if (\$uptime >= 00:01:00 && \$uptime <= 00:02:00) do={\r\
    \n       \r\
    \n    :local mensaje (\"Usuario conectado: \" . \$user . \" (IP: \" . \$ad\
    dress . \") en el equipo: \" . \$identity)\
    \n        \
    \n  \r\
    \n  \r\
    \n    # Opci\F3n A: Enviar al Log del MikroTik\
    \n     \r\
    \n        :log info \$mensaje\
    \n       \r\
    \n     # Opci\F3n B: Enviar a Telegram (Descomenta la l\EDnea de abajo si \
    configuraste los datos)\
    \n    \r\
    \n    /tool fetch url=\"https://api.telegram.org/bot\$botToken/sendMessage\
    \?chat_id=\$chatId&text=\$mensaje\" keep-result=no\
    \n    }\
    \n}"
/tool netwatch
add disabled=no down-script="/tool fetch \"https://api.telegram.org/bot8289819\
    741:AAEKj_5TyVBgar3M6Mv9Kz6TFyriWOsPJdo/sendMessage\\\?chat_id=-4842629870\
    &text=La conexion con la maquina se pedio.\" mode=https" host=\
    10.10.100.254 http-codes="" interval=10s test-script="" type=simple \
    up-script="/tool fetch \"https://api.telegram.org/bot8289819741:AAEKj_5TyV\
    Bgar3M6Mv9Kz6TFyriWOsPJdo/sendMessage\\\?chat_id=-4842629870&text=La conex\
    ion con la maquina se restablecio.\" mode=https"
