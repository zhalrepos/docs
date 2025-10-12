# oct/12/2025 12:10:21 by RouterOS 6.49.19
# software id = ZE7E-NXDP
#
# model = RB750Gr3
# serial number = 8AFF0B1AD66E
# Version 0.1 alpha
#
/ip firewall address-list
add address=172.20.1.0/24 list=lokal
add address=192.168.2.0/24 list=lokal
add address=192.168.100.0/24 list=kecuali
add address=192.168.100.1 list=kecuali
add address=172.20.1.0/24 list=kecuali
add address=192.168.2.0/24 list=kecuali
