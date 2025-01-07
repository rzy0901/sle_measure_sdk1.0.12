#!/bin/bash

# ~/fbb_ws63-master/src
# ./build_client.sh --recv-cnt 1000 --smac-byte1 0x11 --smac-byte2 0x22 --smac-byte3 0x33 --smac-byte4 0x44 --smac-byte5 0x55 --smac-byte6 0x66

config_file="./build/config/target_config/ws63/menuconfig/acore/ws63_liteos_app.config"

update_config() {
    local param_name=$1
    local param_value=$2
    sed -i "s/^$param_name=.*/$param_name=$param_value/" $config_file
    echo "Updated $param_name to $param_value"
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --recv-cnt) recv_cnt="$2"; shift ;;
        --smac-byte1) smac_byte1="$2"; shift ;;
        --smac-byte2) smac_byte2="$2"; shift ;;
        --smac-byte3) smac_byte3="$2"; shift ;;
        --smac-byte4) smac_byte4="$2"; shift ;;
        --smac-byte5) smac_byte5="$2"; shift ;;
        --smac-byte6) smac_byte6="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

[ ! -z "$recv_cnt" ] && update_config "CONFIG_RECV_PKT_CNT" "$recv_cnt"
[ ! -z "$smac_byte1" ] && update_config "CONFIG_SCANNED_SLE_MAC_ADDR_1ST_BYTE" "$smac_byte1"
[ ! -z "$smac_byte2" ] && update_config "CONFIG_SCANNED_SLE_MAC_ADDR_2ND_BYTE" "$smac_byte2"
[ ! -z "$smac_byte3" ] && update_config "CONFIG_SCANNED_SLE_MAC_ADDR_3RD_BYTE" "$smac_byte3"
[ ! -z "$smac_byte4" ] && update_config "CONFIG_SCANNED_SLE_MAC_ADDR_4TH_BYTE" "$smac_byte4"
[ ! -z "$smac_byte5" ] && update_config "CONFIG_SCANNED_SLE_MAC_ADDR_5TH_BYTE" "$smac_byte5"
[ ! -z "$smac_byte6" ] && update_config "CONFIG_SCANNED_SLE_MAC_ADDR_6TH_BYTE" "$smac_byte6"

# Read parameters from config file
recv_cnt=$(grep "^CONFIG_RECV_PKT_CNT=" $config_file | cut -d'=' -f2)
smac_byte1=$(grep "^CONFIG_SCANNED_SLE_MAC_ADDR_1ST_BYTE=" $config_file | cut -d'=' -f2)
smac_byte2=$(grep "^CONFIG_SCANNED_SLE_MAC_ADDR_2ND_BYTE=" $config_file | cut -d'=' -f2)
smac_byte3=$(grep "^CONFIG_SCANNED_SLE_MAC_ADDR_3RD_BYTE=" $config_file | cut -d'=' -f2)
smac_byte4=$(grep "^CONFIG_SCANNED_SLE_MAC_ADDR_4TH_BYTE=" $config_file | cut -d'=' -f2)
smac_byte5=$(grep "^CONFIG_SCANNED_SLE_MAC_ADDR_5TH_BYTE=" $config_file | cut -d'=' -f2)
smac_byte6=$(grep "^CONFIG_SCANNED_SLE_MAC_ADDR_6TH_BYTE=" $config_file | cut -d'=' -f2)

# Generate the firmware file name
firmware_name="RC${recv_cnt}-SMAC${smac_byte1}${smac_byte2}${smac_byte3}${smac_byte4}${smac_byte5}${smac_byte6}.fwpkg"

echo "Firmware file name: $firmware_name"

# build
rm -rf output/
./build.py ws63-liteos-app

cp ./output/ws63/fwpkg/ws63-liteos-app/ws63-liteos-app_all.fwpkg "./firmwares_client/$firmware_name"