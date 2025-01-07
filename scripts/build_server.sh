#!/bin/bash

# ~/fbb_ws63-master/src
# ./build_server.sh --conn-interval 20 --pkt-data-len 1370 --frame-format 1 --phy 2 --mcs 6 --tx-power-level 7 --mac-byte1 0x11 --mac-byte2 0x22 --mac-byte3 0x33 --mac-byte4 0x44 --mac-byte5 0x55 --mac-byte6 0x66

config_file="./build/config/target_config/ws63/menuconfig/acore/ws63_liteos_app.config"

update_config() {
    local param_name=$1
    local param_value=$2
    sed -i "s/^$param_name=.*/$param_name=$param_value/" $config_file
    echo "Updated $param_name to $param_value"
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --conn-interval) conn_interval="$2"; shift ;;
        --pkt-data-len) pkt_data_len="$2"; shift ;;
        --frame-format) frame_format="$2"; shift ;;
        --phy) phy="$2"; shift ;;
        --mcs) mcs="$2"; shift ;;
        --tx-power-level) tx_power_level="$2"; shift ;;
        --mac-byte1) mac_byte1="$2"; shift ;;
        --mac-byte2) mac_byte2="$2"; shift ;;
        --mac-byte3) mac_byte3="$2"; shift ;;
        --mac-byte4) mac_byte4="$2"; shift ;;
        --mac-byte5) mac_byte5="$2"; shift ;;
        --mac-byte6) mac_byte6="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

[ ! -z "$conn_interval" ] && update_config "CONFIG_SPEED_DEFAULT_CONN_INTERVAL" "$conn_interval"
[ ! -z "$pkt_data_len" ] && update_config "CONFIG_PKT_DATA_LEN" "$pkt_data_len"
[ ! -z "$frame_format" ] && update_config "CONFIG_FRAME_FORMAT" "$frame_format"
[ ! -z "$phy" ] && update_config "CONFIG_PHY" "$phy"
[ ! -z "$mcs" ] && update_config "CONFIG_MCS" "$mcs"
[ ! -z "$tx_power_level" ] && update_config "CONFIG_MAX_TX_POWER_LEVEL" "$tx_power_level"
[ ! -z "$mac_byte1" ] && update_config "CONFIG_SLE_MAC_ADDR_1ST_BYTE" "$mac_byte1"
[ ! -z "$mac_byte2" ] && update_config "CONFIG_SLE_MAC_ADDR_2ND_BYTE" "$mac_byte2"
[ ! -z "$mac_byte3" ] && update_config "CONFIG_SLE_MAC_ADDR_3RD_BYTE" "$mac_byte3"
[ ! -z "$mac_byte4" ] && update_config "CONFIG_SLE_MAC_ADDR_4TH_BYTE" "$mac_byte4"
[ ! -z "$mac_byte5" ] && update_config "CONFIG_SLE_MAC_ADDR_5TH_BYTE" "$mac_byte5"
[ ! -z "$mac_byte6" ] && update_config "CONFIG_SLE_MAC_ADDR_6TH_BYTE" "$mac_byte6"

# Read parameters from config file
conn_interval=$(grep "^CONFIG_SPEED_DEFAULT_CONN_INTERVAL=" $config_file | cut -d'=' -f2)
pkt_data_len=$(grep "^CONFIG_PKT_DATA_LEN=" $config_file | cut -d'=' -f2)
frame_format=$(grep "^CONFIG_FRAME_FORMAT=" $config_file | cut -d'=' -f2)
phy=$(grep "^CONFIG_PHY=" $config_file | cut -d'=' -f2)
mcs=$(grep "^CONFIG_MCS=" $config_file | cut -d'=' -f2)
tx_power_level=$(grep "^CONFIG_MAX_TX_POWER_LEVEL=" $config_file | cut -d'=' -f2)
mac_byte1=$(grep "^CONFIG_SLE_MAC_ADDR_1ST_BYTE=" $config_file | cut -d'=' -f2)
mac_byte2=$(grep "^CONFIG_SLE_MAC_ADDR_2ND_BYTE=" $config_file | cut -d'=' -f2)
mac_byte3=$(grep "^CONFIG_SLE_MAC_ADDR_3RD_BYTE=" $config_file | cut -d'=' -f2)
mac_byte4=$(grep "^CONFIG_SLE_MAC_ADDR_4TH_BYTE=" $config_file | cut -d'=' -f2)
mac_byte5=$(grep "^CONFIG_SLE_MAC_ADDR_5TH_BYTE=" $config_file | cut -d'=' -f2)
mac_byte6=$(grep "^CONFIG_SLE_MAC_ADDR_6TH_BYTE=" $config_file | cut -d'=' -f2)

# Generate the firmware file name
firmware_name="CI${conn_interval}-LEN${pkt_data_len}-FF${frame_format}-PHY${phy}-MCS${mcs}-MP${tx_power_level}-MAC${mac_byte1}${mac_byte2}${mac_byte3}${mac_byte4}${mac_byte5}${mac_byte6}.fwpkg"

echo "Firmware file name: $firmware_name"

# build
rm -rf output/
./build.py ws63-liteos-app

cp ./output/ws63/fwpkg/ws63-liteos-app/ws63-liteos-app_all.fwpkg "./firmwares_server/$firmware_name"

