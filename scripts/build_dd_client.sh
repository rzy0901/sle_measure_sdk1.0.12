#!/bin/bash

# ~/fbb_ws63-master/src
# ./build_dd_client.sh --test-count 200 --test-scan-interval 260 --test-scan-window 26

config_file="./build/config/target_config/ws63/menuconfig/acore/ws63_liteos_app.config"

update_config() {
    local param_name=$1
    local param_value=$2
    sed -i "s/^$param_name=.*/$param_name=$param_value/" $config_file
    echo "Updated $param_name to $param_value"
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --test-count) test_count="$2"; shift ;;
        --test-scan-interval) test_scan_interval="$2"; shift ;;
        --test-scan-window) test_scan_window="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

[ ! -z "$test_count" ] && update_config "CONFIG_TEST_COUNT" "$test_count"
[ ! -z "$test_scan_interval" ] && update_config "CONFIG_TEST_SCAN_INTERVAL" "$test_scan_interval"
[ ! -z "$test_scan_window" ] && update_config "CONFIG_TEST_SCAN_WINDOW" "$test_scan_window"

# Read parameters from config file
test_count=$(grep "^CONFIG_TEST_COUNT=" $config_file | cut -d'=' -f2)
test_scan_interval=$(grep "^CONFIG_TEST_SCAN_INTERVAL=" $config_file | cut -d'=' -f2)
test_scan_window=$(grep "^CONFIG_TEST_SCAN_WINDOW=" $config_file | cut -d'=' -f2)

# Generate the firmware file name
firmware_name="TC${test_count}-SI${test_scan_interval}-SW${test_scan_window}.fwpkg"

echo "Firmware file name: $firmware_name"

# build
rm -rf output/
./build.py ws63-liteos-app

cp ./output/ws63/fwpkg/ws63-liteos-app/ws63-liteos-app_all.fwpkg "./firmwares_dd/$firmware_name"