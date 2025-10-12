# oct/12/2025 12:10:49 by RouterOS 6.49.19
# software id = ZE7E-NXDP
#
# model = RB750Gr3
# serial number = 8AFF0B1AD66E
# Version 0.1 alpha
#
/queue tree
add name="GLOBAL ALL" parent=global queue=default
add max-limit=80M name=DOWNLOAD parent="GLOBAL ALL" queue=\
    pcq-download-default
add max-limit=30M name=UPLOAD parent="GLOBAL ALL" queue=pcq-upload-default
add limit-at=60M max-limit=60M name="4.ALL TRAFIC DOWN" parent=DOWNLOAD \
    priority=3 queue=pcq-download-default
add limit-at=20M max-limit=20M name="4.ALL TRAFIC UP" parent=UPLOAD priority=\
    3 queue=pcq-upload-default
add name="2. ICMP DOWN" packet-mark="ICMP DOWN" parent=DOWNLOAD priority=2 \
    queue=pcq-download-default
add name="2. ICMP UP" packet-mark="ICMP UP" parent=UPLOAD priority=2 queue=\
    pcq-upload-default
add max-limit=64k name="w. berat down" packet-mark="BERAT DOWN" parent=\
    "4.ALL TRAFIC DOWN" queue=pcq-download-default
add max-limit=64k name="w. berat up" packet-mark="BERAT UP" parent=\
    "4.ALL TRAFIC UP" queue=pcq-upload-default
add name="v. sedang down" packet-mark="SEDANG DOWN" parent=\
    "4.ALL TRAFIC DOWN" priority=3 queue=pcq-download-default
add name="v. sedang up" packet-mark="SEDANG UP" parent="4.ALL TRAFIC UP" \
    priority=3 queue=pcq-upload-default
add name="u. ringan down" packet-mark="RINGAN DOWN" parent=\
    "4.ALL TRAFIC DOWN" priority=3 queue=pcq-download-default
add name="u. ringan up" packet-mark="RINGAN UP" parent="4.ALL TRAFIC UP" \
    priority=3 queue=pcq-upload-default
