# oct/07/2025 03:32:54 by RouterOS 6.49.19
# software id = ZE7E-NXDP
#
# model = RB750Gr3
# serial number = 8AFF0B1AD66E
/interface ovpn-client
add comment=sg-2.hostddns.us:8065<->8291 connect-to=sg-2.hostddns.us \
    mac-address=FE:E5:33:AE:3F:06 name=aaaaaa@mytunnel.id password=1234 user=\
    aaaaaa@mytunnel.id
add comment=sg-2.hostddns.us:8067<->8728 connect-to=sg-2.hostddns.us \
    mac-address=FE:F6:10:64:A2:7C name=bbbbbb@mytunnel.id password=1234 user=\
    bbbbbb@mytunnel.id
add comment=sg-5.hostddns.us:32064<->8291 connect-to=sg-5.hostddns.us \
    mac-address=FE:76:12:85:A3:34 name=dffkcs@mytunnel.id password=12345 \
    user=dffkcs@mytunnel.id
add comment=sg-9.hostddns.us:31828<->8081 connect-to=sg-9.hostddns.us \
    mac-address=FE:F4:0B:90:0E:31 name=lflrkfg@mytunnel.id password=12345 \
    user=lflrkfg@mytunnel.id
    
    
/interface ethernet
set [ find default-name=ether1 ] name=ether1-internet


/interface bridge
add name=MasterBridge


/interface bridge port
add bridge=MasterBridge interface=ether2
add bridge=MasterBridge interface=ether3
add bridge=MasterBridge interface=ether4

/interface pppoe-server server
add disabled=no interface=MasterBridge service-name=PPPoE
