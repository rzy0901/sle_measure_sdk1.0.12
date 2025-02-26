# e.g. ./build_dd_client.sh --test-count 200 --test-scan-interval 260 --test-scan-window 26

# 10% 占空比, scan_windows = 24 25 26 27 28 slots, scan_windows = 3 3.125 3.25 3.375 3.5 ms
# 实际：3.25/32.36 = 0.1005
scan_windows=(24 25 26 27 28)
for scan_window in ${scan_windows[@]}; do
    scan_interval=$((10 * scan_window))
    ./build_dd_client.sh --test-count 200 --test-scan-interval $scan_interval --test-scan-window $scan_window
done


# 25% 占空比, scan_windows = 46 47 48 49 50 slots, scan_windows = 5.75 5.875 6 6.125 6.25 ms
# 实际：6/25.83 = 0.2321
scan_windows=(46 47 48 49 50)
for scan_window in ${scan_windows[@]}; do
    scan_interval=$((4 * scan_window))
    ./build_dd_client.sh --test-count 200 --test-scan-interval $scan_interval --test-scan-window $scan_window
done

# 100% 占空比, scan_windows =  190 191 192 193 194 slots, scan_windows = 23.75 23.875 24 24.125 24.25 ms
# 实际：24/(24+3) 0.8889
scan_windows=(190 191 192 193 194)
for scan_window in ${scan_windows[@]}; do
    scan_interval=$((1 * scan_window))
    ./build_dd_client.sh --test-count 200 --test-scan-interval $scan_interval --test-scan-window $scan_window
done