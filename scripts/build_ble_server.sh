#!/bin/bash

# ~/fbb_ws63-master/src
# ./build_ble_server.sh --conn-interval 10  --pkt-data-len 244 --phy 1 --tx-power-level 0

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
        --phy) phy="$2"; shift ;;
        --tx-power-level) tx_power_level="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

[ ! -z "$conn_interval" ] && update_config "CONFIG_SPEED_DEFAULT_CONN_INTERVAL" "$conn_interval"
[ ! -z "$pkt_data_len" ] && update_config "CONFIG_PKT_DATA_LEN" "$pkt_data_len"
[ ! -z "$phy" ] && update_config "CONFIG_PHY" "$phy"
[ ! -z "$tx_power_level" ] && update_config "CONFIG_MAX_TX_POWER_LEVEL" "$tx_power_level"

# Read parameters from config file
conn_interval=$(grep "^CONFIG_SPEED_DEFAULT_CONN_INTERVAL=" $config_file | cut -d'=' -f2)
pkt_data_len=$(grep "^CONFIG_PKT_DATA_LEN=" $config_file | cut -d'=' -f2)
phy=$(grep "^CONFIG_PHY=" $config_file | cut -d'=' -f2)
tx_power_level=$(grep "^CONFIG_MAX_TX_POWER_LEVEL=" $config_file | cut -d'=' -f2)

# Generate the firmware file name
firmware_name="CI${conn_interval}-LEN${pkt_data_len}-PHY${phy}-MP${tx_power_level}.fwpkg"

echo "Firmware file name: $firmware_name"

# build
rm -rf output/
./build.py ws63-liteos-app

cp ./output/ws63/fwpkg/ws63-liteos-app/ws63-liteos-app_all.fwpkg "./firmwares_ble_server/$firmware_name"