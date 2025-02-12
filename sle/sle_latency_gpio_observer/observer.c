/**
 * Copyright (c) HiSilicon (Shanghai) Technologies Co., Ltd. 2023-2023. All rights reserved.
 *
 * Description: Blinky Sample Source. \n
 *
 * History: \n
 * 2023-04-03, Create file. \n
 */

/* 无法检测到gpio的上升沿，但是示波器可以，可能是100us的高电平太短了，后续再修改 */

#include "pinctrl.h"
#include "gpio.h"
#include "soc_osal.h"
#include "app_init.h"
#include "tcxo.h"

#define OBSERVER_TASK_PRIO          24
#define OBSERVER_TASK_STACK_SIZE    0x1000

#define GPIO_PIN_SERVER GPIO_01
#define GPIO_PIN_CLIENT GPIO_02

// static uint64_t g_count_before_get_us;
// static uint64_t g_count_after_get_us;

// static uint64_t g_count_server_us;
// static uint64_t g_count_client_us;

void gpio_callback_func_server(pin_t pin, uintptr_t param) {
    unused(pin);
    unused(param);
    // print tcxo
    // g_count_server_us = uapi_tcxo_get_us();
    osal_printk("server gpio_callback_func_server: %llu\n",  uapi_tcxo_get_us());
}

void gpio_callback_func_client(pin_t pin, uintptr_t param) {
    unused(pin);
    unused(param);
    // print tcxo
    // g_count_client_us = uapi_tcxo_get_us();
    osal_printk("client gpio_callback_func_client: %llu\n",  uapi_tcxo_get_us());
}

static int observer_task(const char *arg)
{
    unused(arg);

    uapi_pin_set_mode(GPIO_PIN_SERVER, HAL_PIO_FUNC_GPIO);
    uapi_gpio_set_dir(GPIO_PIN_SERVER, GPIO_DIRECTION_INPUT);
    uapi_gpio_set_val(GPIO_PIN_SERVER, GPIO_LEVEL_LOW);
    uapi_gpio_enable_interrupt(GPIO_PIN_SERVER);
    osal_msleep(1000);  /* sleep 1000ms */

    uapi_pin_set_mode(GPIO_PIN_CLIENT, HAL_PIO_FUNC_GPIO);
    uapi_gpio_set_dir(GPIO_PIN_CLIENT, GPIO_DIRECTION_INPUT);
    uapi_gpio_set_val(GPIO_PIN_CLIENT, GPIO_LEVEL_LOW);
    uapi_gpio_enable_interrupt(GPIO_PIN_CLIENT);
    osal_msleep(1000);  /* sleep 1000ms */

    // 注册 GPIO 上升沿中断
    if (uapi_gpio_register_isr_func(GPIO_PIN_SERVER, GPIO_INTERRUPT_RISING_EDGE, gpio_callback_func_server) != ERRCODE_SUCC)
    {
        uapi_gpio_unregister_isr_func(GPIO_PIN_SERVER); /* 清理残留 */  
        osal_printk("register gpio_callback_func_server failed\n");
    }

    if (uapi_gpio_register_isr_func(GPIO_PIN_CLIENT, GPIO_INTERRUPT_RISING_EDGE, gpio_callback_func_client) != ERRCODE_SUCC)
    {
        uapi_gpio_unregister_isr_func(GPIO_PIN_CLIENT); /* 清理残留 */
        osal_printk("register gpio_callback_func_client failed\n");
    }

    return 0;
}

static void observer_entry(void)
{
    osal_task *task_handle = NULL;
    osal_kthread_lock();
    task_handle = osal_kthread_create((osal_kthread_handler)observer_task, 0, "BlinkyTask", OBSERVER_TASK_STACK_SIZE);
    if (task_handle != NULL) {
        osal_kthread_set_priority(task_handle, OBSERVER_TASK_PRIO);
        osal_kfree(task_handle);
    }
    osal_kthread_unlock();
}

app_run(observer_entry);