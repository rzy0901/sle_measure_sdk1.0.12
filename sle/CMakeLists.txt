#===============================================================================
# @brief    cmake file
# Copyright (c) HiSilicon (Shanghai) Technologies Co., Ltd. 2023-2023. All rights reserved.
#===============================================================================
if(DEFINED CONFIG_SAMPLE_SUPPORT_SLE_UUID_SERVER_SAMPLE)
    add_subdirectory_if_exist(sle_uuid_server)
endif()

if(DEFINED CONFIG_SAMPLE_SUPPORT_SLE_UUID_CLIENT_SAMPLE)
    add_subdirectory_if_exist(sle_uuid_client)
endif()

if(DEFINED CONFIG_SAMPLE_SUPPORT_SLE_SPEED_SERVER_SAMPLE)
    add_subdirectory_if_exist(sle_speed_server)
endif()

if(DEFINED CONFIG_SAMPLE_SUPPORT_SLE_SPEED_CLIENT_SAMPLE)
    add_subdirectory_if_exist(sle_speed_client)
endif()

if(DEFINED CONFIG_SAMPLE_SLE_LATENCY_CLIENT_SAMPLE)
    add_subdirectory_if_exist(sle_latency_client)
endif()

if(DEFINED CONFIG_SAMPLE_SLE_LATENCY_SERVER_SAMPLE)
    add_subdirectory_if_exist(sle_latency_server)
endif()

if(DEFINED CONFIG_SAMPLE_SLE_LATENCY_GPIO_OBSERVER_SAMPLE)
    add_subdirectory_if_exist(sle_latency_gpio_observer)
endif()

set(SOURCES "${SOURCES}" PARENT_SCOPE)
set(PUBLIC_HEADER "${PUBLIC_HEADER}" PARENT_SCOPE)