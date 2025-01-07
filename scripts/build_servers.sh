# 0:SLE_RADIO_FRAME_1, 1:SLE_RADIO_FRAME_2
# 0:SLE_PHY_1M, 1:SLE_PHY_1M, 2:SLE_PHY_4M

# SLE_RADIO_FRAME_2, SLE_PHY_4M, CI = 20 (2.5ms), 4 pairs
./build_server.sh --conn-interval 20 --pkt-data-len 1370 --frame-format 1 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x33
./build_server.sh --conn-interval 20 --pkt-data-len 1370 --frame-format 1 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x44
./build_server.sh --conn-interval 20 --pkt-data-len 1370 --frame-format 1 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x55
./build_server.sh --conn-interval 20 --pkt-data-len 1370 --frame-format 1 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x66

# SLE_RADIO_FRAME_2, SLE_PHY_2M, CI = 36 (4.5ms), 4 pairs
./build_server.sh --conn-interval 36 --pkt-data-len 1370 --frame-format 1 --phy 1 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x33
./build_server.sh --conn-interval 36 --pkt-data-len 1370 --frame-format 1 --phy 1 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x44
./build_server.sh --conn-interval 36 --pkt-data-len 1370 --frame-format 1 --phy 1 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x55
./build_server.sh --conn-interval 36 --pkt-data-len 1370 --frame-format 1 --phy 1 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x66

# SLE_RADIO_FRAME_2, SLE_PHY_1M, CI = 68 (8.5ms), 4 pairs
./build_server.sh --conn-interval 68 --pkt-data-len 1370 --frame-format 1 --phy 0 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x33
./build_server.sh --conn-interval 68 --pkt-data-len 1370 --frame-format 1 --phy 0 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x44
./build_server.sh --conn-interval 68 --pkt-data-len 1370 --frame-format 1 --phy 0 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x55
./build_server.sh --conn-interval 68 --pkt-data-len 1370 --frame-format 1 --phy 0 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x66

# SLE_RADIO_FRAME_1, SLE_PHY_4M, CI = 27 (3.375ms), 4 pairs
./build_server.sh --conn-interval 27 --pkt-data-len 1370 --frame-format 0 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x33
./build_server.sh --conn-interval 27 --pkt-data-len 1370 --frame-format 0 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x44
./build_server.sh --conn-interval 27 --pkt-data-len 1370 --frame-format 0 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x55
./build_server.sh --conn-interval 27 --pkt-data-len 1370 --frame-format 0 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x66

# SLE_RADIO_FRAME_1, SLE_PHY_2M, CI = 49 (6.125ms), 4 pairs
./build_server.sh --conn-interval 49 --pkt-data-len 1370 --frame-format 0 --phy 1 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x33
./build_server.sh --conn-interval 49 --pkt-data-len 1370 --frame-format 0 --phy 1 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x44
./build_server.sh --conn-interval 49 --pkt-data-len 1370 --frame-format 0 --phy 1 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x55
./build_server.sh --conn-interval 49 --pkt-data-len 1370 --frame-format 0 --phy 1 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x66

# SLE_RADIO_FRAME_1, SLE_PHY_1M, CI = 94 (11.75ms), 4 pairs
./build_server.sh --conn-interval 94 --pkt-data-len 1370 --frame-format 0 --phy 0 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x33
./build_server.sh --conn-interval 94 --pkt-data-len 1370 --frame-format 0 --phy 0 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x44
./build_server.sh --conn-interval 94 --pkt-data-len 1370 --frame-format 0 --phy 0 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x55
./build_server.sh --conn-interval 94 --pkt-data-len 1370 --frame-format 0 --phy 0 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x66