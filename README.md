1. Prepare codes:

```bash
git clone https://gitee.com/HiSpark/fbb_ws63.git
cd fbb_ws63/src
mv application/samples/bt/ application/samples/bt_bak
cd application/samples/
git clone https://github.com/rzy0901/sle_measure_sdk1.0.12.git bt
cd ../../
```

2. Set menuconfig and build (e.g., sle server for throughput test)

```bash
./build.py ws63-liteos-app menuconfig # only once for client or server
```

```bash
(Top) → Application → Enable Sample. → Enable the Sample of BT. → Sample → Support SLE Sample. → SLE Sample
                                                                Configuration
( ) Support SLE UUID Server Sample.
( ) Support SLE UUID Client Sample.
(X) Support SLE Throughput Server Sample.
        SLE speed server sample configuration  --->
( ) Support SLE Throughput Client Sample.
( ) Support SLE Latency Client Sample.
( ) Support SLE Latency Server Sample.
( ) Support SLE Latency GPIO Observer.
( ) Support SLE Device Discovery (DD) Client Sample.
( ) Support SLE Device Discovery (DD) Server Sample.
( ) Support SLE Connection Establishment (CE) Client Sample.
( ) Support SLE Connection Establishment (CE) Server Sample.
( ) Support SLE Throughput Client 1 vs N Sample.
( ) Support SLE Device Discovery Client 1 vs N Sample.
```

3. Copy `build_server.sh` and `build_servers.sh` in `application/samples/bt/scripts` to `src` folder.

4. Example build:

```bash
mkdir firmwares_server # output folder for server firmwares
```

```bash
# 0:SLE_RADIO_FRAME_1, 1:SLE_RADIO_FRAME_2
# 0:SLE_PHY_1M, 1:SLE_PHY_1M, 2:SLE_PHY_4M

# SLE_RADIO_FRAME_2, SLE_PHY_4M, CI = 20 (2.5ms), 4 pairs
./build_server.sh --conn-interval 20 --pkt-data-len 1370 --frame-format 1 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x33
./build_server.sh --conn-interval 20 --pkt-data-len 1370 --frame-format 1 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x44
./build_server.sh --conn-interval 20 --pkt-data-len 1370 --frame-format 1 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x55
./build_server.sh --conn-interval 20 --pkt-data-len 1370 --frame-format 1 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x66
```

5. Repeat that procedure (2--4) again for client build (Please find client build scripts in `application/samples/bt/scripts`).