# recv-cnt: 1000, 4 pairs
./build_client.sh --recv-cnt 1000 --smac-byte1 0x11 --smac-byte2 0x22 --smac-byte3 0x33 --smac-byte4 0x44 --smac-byte5 0x55 --smac-byte6 0x33
./build_client.sh --recv-cnt 1000 --smac-byte1 0x11 --smac-byte2 0x22 --smac-byte3 0x33 --smac-byte4 0x44 --smac-byte5 0x55 --smac-byte6 0x44
./build_client.sh --recv-cnt 1000 --smac-byte1 0x11 --smac-byte2 0x22 --smac-byte3 0x33 --smac-byte4 0x44 --smac-byte5 0x55 --smac-byte6 0x55
./build_client.sh --recv-cnt 1000 --smac-byte1 0x11 --smac-byte2 0x22 --smac-byte3 0x33 --smac-byte4 0x44 --smac-byte5 0x55 --smac-byte6 0x66

# recv-cnt: 36, 4 pairs
./build_client.sh --recv-cnt 36 --smac-byte1 0x11 --smac-byte2 0x22 --smac-byte3 0x33 --smac-byte4 0x44 --smac-byte5 0x55 --smac-byte6 0x33
./build_client.sh --recv-cnt 36 --smac-byte1 0x11 --smac-byte2 0x22 --smac-byte3 0x33 --smac-byte4 0x44 --smac-byte5 0x55 --smac-byte6 0x44
./build_client.sh --recv-cnt 36 --smac-byte1 0x11 --smac-byte2 0x22 --smac-byte3 0x33 --smac-byte4 0x44 --smac-byte5 0x55 --smac-byte6 0x55
./build_client.sh --recv-cnt 36 --smac-byte1 0x11 --smac-byte2 0x22 --smac-byte3 0x33 --smac-byte4 0x44 --smac-byte5 0x55 --smac-byte6 0x66