# oct/12/2025 12:09:31 by RouterOS 6.49.19
# software id = ZE7E-NXDP
#
# model = RB750Gr3
# serial number = 8AFF0B1AD66E
# Version 0.1 alpha
#
/ip firewall mangle
add action=change-ttl chain=postrouting comment="Hotspot Protect" \
    dst-address=172.20.1.0/24 new-ttl=set:1 out-interface=MasterBridge \
    passthrough=no
add action=mark-connection chain=prerouting comment=ICMP new-connection-mark=\
    ICMP passthrough=yes protocol=icmp
add action=mark-connection chain=prerouting dst-port=53,5353,853 \
    new-connection-mark=ICMP passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=53,5353,853 \
    new-connection-mark=ICMP passthrough=yes protocol=udp
add action=mark-packet chain=forward connection-mark=ICMP in-interface=\
    ether1-internet new-packet-mark="ICMP DOWN" passthrough=no
add action=mark-packet chain=forward connection-mark=ICMP new-packet-mark=\
    "ICMP UP" out-interface=ether1-internet passthrough=no
add action=add-dst-to-address-list address-list="IP BERAT" \
    address-list-timeout=2h chain=prerouting comment=BERAT connection-bytes=\
    5242880-943718400 connection-rate=2097152-943718400 dst-address-list=\
    !kecuali dst-port=21,22,23,80,81,443,8000,8008,8080,8081,8090,8443 \
    protocol=tcp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP BERAT" \
    address-list-timeout=2h chain=prerouting connection-bytes=\
    5242880-943718400 connection-rate=2097152-943718400 dst-address-list=\
    !kecuali dst-port=21,22,23,80,81,443,8000,8008,8080,8081,8090,8443 \
    protocol=udp src-address-list=lokal
add action=mark-connection chain=prerouting connection-mark="!KONEKSI STREAM" \
    dst-address-list="IP BERAT" new-connection-mark="KONEKSI BERAT" \
    passthrough=yes src-address-list=lokal
add action=mark-packet chain=forward connection-mark="KONEKSI BERAT" \
    in-interface=ether1-internet new-packet-mark="BERAT DOWN" passthrough=no
add action=mark-packet chain=forward connection-mark="KONEKSI BERAT" \
    new-packet-mark="BERAT UP" out-interface=ether1-internet passthrough=no
add action=add-dst-to-address-list address-list="IP SEDANG" \
    address-list-timeout=1m chain=prerouting comment=SEDANG connection-bytes=\
    786432-5242880 connection-rate=524288-2097152 dst-address-list=!kecuali \
    dst-port=21,22,23,80,81,443,8000,8008,8080,8081,8090,8443 protocol=tcp \
    src-address-list=lokal
add action=add-dst-to-address-list address-list="IP SEDANG" \
    address-list-timeout=1m chain=prerouting connection-bytes=786432-5242880 \
    connection-rate=524288-2097152 dst-address-list=!kecuali dst-port=\
    21,22,23,80,81,443,8000,8008,8080,8081,8090,8443 protocol=udp \
    src-address-list=lokal
add action=mark-connection chain=prerouting connection-mark="!KONEKSI STREAM" \
    dst-address-list="IP SEDANG" new-connection-mark="KONEKSI SEDANG" \
    passthrough=yes src-address-list=lokal
add action=mark-packet chain=forward connection-mark="KONEKSI SEDANG" \
    in-interface=ether1-internet new-packet-mark="SEDANG DOWN" passthrough=no
add action=mark-packet chain=forward connection-mark="KONEKSI SEDANG" \
    new-packet-mark="SEDANG UP" out-interface=ether1-internet passthrough=no
add action=add-dst-to-address-list address-list="IP RINGAN" \
    address-list-timeout=1m chain=prerouting comment=RINGAN connection-bytes=\
    1-786432 connection-rate=1-524288 dst-address-list=!kecuali dst-port=\
    21,22,23,80,81,443,8000,8008,8080,8081,8090,8443 protocol=tcp \
    src-address-list=lokal
add action=add-dst-to-address-list address-list="IP RINGAN" \
    address-list-timeout=1m chain=prerouting connection-bytes=1-786432 \
    connection-rate=1-524288 dst-address-list=!kecuali dst-port=\
    21,22,23,80,81,443,8000,8008,8080,8081,8090,8443 protocol=udp \
    src-address-list=lokal
add action=mark-connection chain=prerouting connection-mark="!KONEKSI STREAM" \
    dst-address-list="IP RINGAN" new-connection-mark="KONEKSI RINGAN" \
    passthrough=yes src-address-list=lokal
add action=mark-packet chain=forward connection-mark="KONEKSI RINGAN" \
    in-interface=ether1-internet new-packet-mark="RINGAN DOWN" passthrough=no
add action=mark-packet chain=forward connection-mark="KONEKSI RINGAN" \
    new-packet-mark="RINGAN UP" out-interface=ether1-internet passthrough=no
