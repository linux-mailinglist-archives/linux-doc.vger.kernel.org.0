Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E54B124E58
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2019 17:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfLRQvQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Dec 2019 11:51:16 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45303 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbfLRQvQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Dec 2019 11:51:16 -0500
Received: by mail-pl1-f193.google.com with SMTP id b22so1211285pls.12;
        Wed, 18 Dec 2019 08:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SVDRkfi2EqcbbBfGfFNli3KkJdNZr3LBn0VWaW3s4p8=;
        b=gO/1nXjOWHSEtRWLSpiCBaz7XgB7SW2L4HY6lRwf0H+aupPaP228rmcsaIihcb/DhK
         zThgRMI4Vhg2GdZp8Bg1ZI5kQdf5evKp/JOQXk6FPov9lIGU4w1FnLIyXUo3/ErolfdY
         ZfqpVW/czSHxk36OcSIhjrQvy8BbQv/A1LJR6mKMVwRv+R1HpNM8r/PkDdRbI/Y56vNz
         qC2hxWaT9a79YOYH8cCK+6ox9m2m0Bbeu87Zllhxq5jk6DrllACO0f5h/ECYPU/o6FXX
         dsIciPC6mweS81D0AURk5Ta54wZIhGWq+fypHfPlGDrcFV/0uBau6vflzeMlk2ExmhwP
         xGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SVDRkfi2EqcbbBfGfFNli3KkJdNZr3LBn0VWaW3s4p8=;
        b=E2STKo/XgFCNoTO4v3Uk4MUA4RauN6lz804CsMphw9b6PMGuBr64M4mgELBbrdRCZE
         4+MjX4/lZ90D6q/aBw9BUANgr7HOGU4AQHV1nCroHFIlq9ZiKwFtp7BhiUWWc0+PM6W3
         /Tj/EINEp7l3ij6XG1vn/8Su4F9TyKxMSJG0meX3CfWNAaRTui5B7WjVZb2aRBlmJBrZ
         GDz7z4lUPYrvkj/va4ypIlkjweTf8IypmYQ1wMOVzloJ1lN/k5ON2+/ttcNgCDs0+TLM
         YCnjA1byo5bIg8KSn/XmcIW1Tw6oJTTgmAPWJDehOKLBss1pbWFSc5V7lDSy5RBwIbbk
         8x0g==
X-Gm-Message-State: APjAAAXuIgzBkUxl9PULeK410pjdy1EhrFScjHYGaAgkVPn2uzsuu62I
        Prux1vTUvDoJlPvrPgI6Wb49k2WwR0qzHAfVKZY=
X-Google-Smtp-Source: APXvYqwWXCG//5s7QVt0pqG+DqAjMPwqrgLIQ0l1ARVD4k/R2kJotLOym1fK7sWvUICiejcR0q4DapENvfjABx9HmAQ=
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr3975047pjb.30.1576687874991;
 Wed, 18 Dec 2019 08:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20191214001408.4878-1-srinivas.pandruvada@linux.intel.com>
In-Reply-To: <20191214001408.4878-1-srinivas.pandruvada@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 18 Dec 2019 18:51:05 +0200
Message-ID: <CAHp75VfS-cxvKshw4M3KggU8HWTtU0B1CEcGFEzxhb4V=Hak5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: Add support for Uncore frequency control
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Len Brown <lenb@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Dec 14, 2019 at 2:15 AM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> Some server users set limits on the uncore frequency using MSR 620H, while
> running latency sensitive workloads. Here uncore frequency controls
> RING/LLC(last-level cache) clocks.
>
> But MSR control is not always possible from the user space, so this driver
> provides a sysfs interface to set max and min frequency limits. This MSR
> 620H is a die scoped in multi-die system or package scoped in non multi-die
> systems.
>
> When this driver is loaded, a new directory is created under
>  /sys/devices/system/cpu.
>
> For example on a two package Skylake server:
> $cd /sys/devices/system/cpu/intel_uncore_frequency
>
> $ls
> package_00_die_00 package_01_die_00
>
> $ls package_00_die_00
> max_freq_khz  min_freq_khz  power_up_max_freq_khz
> power_up_min_freq_khz
>
> $grep . *
>     max_freq_khz:2400000
>     min_freq_khz:1200000
>     power_up_max_freq_khz:2400000
>     power_up_min_freq_khz:1200000
>
> Here, power_up_max_freq_khz and power_up_min_freq_khz are read only
> attributes to show power up values of max and min frequencies respectively.
> Other attributes are read-write, so that users can modify.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
in case it goes thru different (doc?) tree.

> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/platform/x86/Kconfig                  |  11 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel-uncore-frequency.c | 434 ++++++++++++++++++
>  3 files changed, 446 insertions(+)
>  create mode 100644 drivers/platform/x86/intel-uncore-frequency.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 27d5b40fb717..6013c3b96cfd 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1337,6 +1337,17 @@ config PCENGINES_APU2
>           To compile this driver as a module, choose M here: the module
>           will be called pcengines-apuv2.
>
> +config INTEL_UNCORE_FREQ_CONTROL
> +       tristate "Intel Uncore frequency control driver"
> +       depends on X86_64
> +       help
> +         This driver allows control of uncore frequency limits on
> +         supported server platforms.
> +         Uncore frequency controls RING/LLC (last-level cache) clocks.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called intel-uncore-frequency.
> +
>  source "drivers/platform/x86/intel_speed_select_if/Kconfig"
>
>  config SYSTEM76_ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 42d85a00be4e..3747b1f07cf1 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -105,3 +105,4 @@ obj-$(CONFIG_INTEL_ATOMISP2_PM)     += intel_atomisp2_pm.o
>  obj-$(CONFIG_PCENGINES_APU2)   += pcengines-apuv2.o
>  obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE) += intel_speed_select_if/
>  obj-$(CONFIG_SYSTEM76_ACPI)    += system76_acpi.o
> +obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)        += intel-uncore-frequency.o
> diff --git a/drivers/platform/x86/intel-uncore-frequency.c b/drivers/platform/x86/intel-uncore-frequency.c
> new file mode 100644
> index 000000000000..82ee5a3107cf
> --- /dev/null
> +++ b/drivers/platform/x86/intel-uncore-frequency.c
> @@ -0,0 +1,434 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intel Uncore Frequency Setting
> + * Copyright (c) 2019, Intel Corporation.
> + * All rights reserved.
> + *
> + * Provide interface to set MSR 620 at a granularity of per die. On CPU online,
> + * one control CPU is identified per die to read/write limit. This control CPU
> + * is changed, if the CPU state is changed to offline. When the last CPU is
> + * offline in a die then remove the sysfs object for that die.
> + * The majority of actual code is related to sysfs create and read/write
> + * attributes.
> + *
> + * Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> + */
> +
> +#include <linux/cpu.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/suspend.h>
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
> +#define MSR_UNCORE_RATIO_LIMIT                 0x620
> +#define UNCORE_FREQ_KHZ_MULTIPLIER             100000
> +
> +/**
> + * struct uncore_data -        Encapsulate all uncore data
> + * @stored_uncore_data:        Last user changed MSR 620 value, which will be restored
> + *                     on system resume.
> + * @power_up_min_freq_khz: Sampled minimum uncore frequency at driver init
> + * @power_up_max_freq_khz: Sampled maximum uncore frequency at driver init
> + * @control_cpu:       Designated CPU for a die to read/write
> + * @valid:             Mark the data valid/invalid
> + *
> + * This structure is used to encapsulate all data related to uncore sysfs
> + * settings for a die/package.
> + */
> +struct uncore_data {
> +       struct kobject kobj;
> +       u64 stored_uncore_data;
> +       u32 power_up_min_freq_khz;
> +       u32 power_up_max_freq_khz;
> +       int control_cpu;
> +       bool valid;
> +};
> +
> +#define to_uncore_data(a) container_of(a, struct uncore_data, kobj)
> +
> +/* Max instances for uncore data, one for each die */
> +static int uncore_max_entries __read_mostly;
> +/* Storage for uncore data for all instances */
> +static struct uncore_data *uncore_instances;
> +/* Root of the all uncore sysfs kobjs */
> +struct kobject uncore_root_kobj;
> +/* Stores the CPU mask of the target CPUs to use during uncore read/write */
> +static cpumask_t uncore_cpu_mask;
> +/* CPU online callback register instance */
> +static enum cpuhp_state uncore_hp_state __read_mostly;
> +/* Mutex to control all mutual exclusions */
> +static DEFINE_MUTEX(uncore_lock);
> +
> +struct uncore_attr {
> +       struct attribute attr;
> +       ssize_t (*show)(struct kobject *kobj,
> +                       struct attribute *attr, char *buf);
> +       ssize_t (*store)(struct kobject *kobj,
> +                        struct attribute *attr, const char *c, ssize_t count);
> +};
> +
> +#define define_one_uncore_ro(_name) \
> +static struct uncore_attr _name = \
> +__ATTR(_name, 0444, show_##_name, NULL)
> +
> +#define define_one_uncore_rw(_name) \
> +static struct uncore_attr _name = \
> +__ATTR(_name, 0644, show_##_name, store_##_name)
> +
> +#define show_uncore_data(member_name)                                  \
> +       static ssize_t show_##member_name(struct kobject *kobj,         \
> +                                         struct attribute *attr,       \
> +                                         char *buf)                    \
> +       {                                                               \
> +               struct uncore_data *data = to_uncore_data(kobj);        \
> +               return scnprintf(buf, PAGE_SIZE, "%u\n",                \
> +                                data->member_name);                    \
> +       }                                                               \
> +       define_one_uncore_ro(member_name)
> +
> +show_uncore_data(power_up_min_freq_khz);
> +show_uncore_data(power_up_max_freq_khz);
> +
> +/* Common function to read MSR 0x620 and read min/max */
> +static int uncore_read_ratio(struct uncore_data *data, unsigned int *min,
> +                            unsigned int *max)
> +{
> +       u64 cap;
> +       int ret;
> +
> +       ret = rdmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, &cap);
> +       if (ret)
> +               return ret;
> +
> +       *max = (cap & 0x7F) * UNCORE_FREQ_KHZ_MULTIPLIER;
> +       *min = ((cap & GENMASK(14, 8)) >> 8) * UNCORE_FREQ_KHZ_MULTIPLIER;
> +
> +       return 0;
> +}
> +
> +/* Common function to set min/max ratios to be used by sysfs callbacks */
> +static int uncore_write_ratio(struct uncore_data *data, unsigned int input,
> +                             int set_max)
> +{
> +       int ret;
> +       u64 cap;
> +
> +       mutex_lock(&uncore_lock);
> +
> +       input /= UNCORE_FREQ_KHZ_MULTIPLIER;
> +       if (!input || input > 0x7F) {
> +               ret = -EINVAL;
> +               goto finish_write;
> +       }
> +
> +       rdmsrl(MSR_UNCORE_RATIO_LIMIT, cap);
> +       if (set_max) {
> +               cap &= ~0x7F;
> +               cap |= input;
> +       } else  {
> +               cap &= ~GENMASK(14, 8);
> +               cap |= (input << 8);
> +       }
> +
> +       ret = wrmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, cap);
> +       if (ret)
> +               goto finish_write;
> +
> +       data->stored_uncore_data = cap;
> +
> +finish_write:
> +       mutex_unlock(&uncore_lock);
> +
> +       return ret;
> +}
> +
> +static ssize_t store_min_max_freq_khz(struct kobject *kobj,
> +                                     struct attribute *attr,
> +                                     const char *buf, ssize_t count,
> +                                     int min_max)
> +{
> +       struct uncore_data *data = to_uncore_data(kobj);
> +       unsigned int input;
> +
> +       if (kstrtouint(buf, 10, &input))
> +               return -EINVAL;
> +
> +       uncore_write_ratio(data, input, min_max);
> +
> +       return count;
> +}
> +
> +static ssize_t show_min_max_freq_khz(struct kobject *kobj,
> +                                    struct attribute *attr,
> +                                    char *buf, int min_max)
> +{
> +       struct uncore_data *data = to_uncore_data(kobj);
> +       unsigned int min, max;
> +       int ret;
> +
> +       mutex_lock(&uncore_lock);
> +       ret = uncore_read_ratio(data, &min, &max);
> +       mutex_unlock(&uncore_lock);
> +       if (ret)
> +               return ret;
> +
> +       if (min_max)
> +               return sprintf(buf, "%u\n", max);
> +
> +       return sprintf(buf, "%u\n", min);
> +}
> +
> +#define store_uncore_min_max(name, min_max)                            \
> +       static ssize_t store_##name(struct kobject *kobj,               \
> +                                   struct attribute *attr,             \
> +                                   const char *buf, ssize_t count)     \
> +       {                                                               \
> +                                                                       \
> +               return store_min_max_freq_khz(kobj, attr, buf, count,   \
> +                                             min_max);                 \
> +       }
> +
> +#define show_uncore_min_max(name, min_max)                             \
> +       static ssize_t show_##name(struct kobject *kobj,                \
> +                                  struct attribute *attr, char *buf)   \
> +       {                                                               \
> +                                                                       \
> +               return show_min_max_freq_khz(kobj, attr, buf, min_max); \
> +       }
> +
> +store_uncore_min_max(min_freq_khz, 0);
> +store_uncore_min_max(max_freq_khz, 1);
> +
> +show_uncore_min_max(min_freq_khz, 0);
> +show_uncore_min_max(max_freq_khz, 1);
> +
> +define_one_uncore_rw(min_freq_khz);
> +define_one_uncore_rw(max_freq_khz);
> +
> +static struct attribute *uncore_attrs[] = {
> +       &power_up_min_freq_khz.attr,
> +       &power_up_max_freq_khz.attr,
> +       &max_freq_khz.attr,
> +       &min_freq_khz.attr,
> +       NULL
> +};
> +
> +static struct kobj_type uncore_ktype = {
> +       .sysfs_ops = &kobj_sysfs_ops,
> +       .default_attrs = uncore_attrs,
> +};
> +
> +static struct kobj_type uncore_root_ktype = {
> +       .sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +/* Caller provides protection */
> +static struct uncore_data *uncore_get_instance(unsigned int cpu)
> +{
> +       int id = topology_logical_die_id(cpu);
> +
> +       if (id >= 0 && id < uncore_max_entries)
> +               return &uncore_instances[id];
> +
> +       return NULL;
> +}
> +
> +static void uncore_add_die_entry(int cpu)
> +{
> +       struct uncore_data *data;
> +
> +       mutex_lock(&uncore_lock);
> +       data = uncore_get_instance(cpu);
> +       if (!data) {
> +               mutex_unlock(&uncore_lock);
> +               return;
> +       }
> +
> +       if (data->valid) {
> +               /* control cpu changed */
> +               data->control_cpu = cpu;
> +       } else {
> +               char str[64];
> +               int ret;
> +
> +               memset(data, 0, sizeof(*data));
> +               sprintf(str, "package_%02d_die_%02d",
> +                       topology_physical_package_id(cpu),
> +                       topology_die_id(cpu));
> +
> +               uncore_read_ratio(data, &data->power_up_min_freq_khz,
> +                                 &data->power_up_max_freq_khz);
> +
> +               ret = kobject_init_and_add(&data->kobj, &uncore_ktype,
> +                                          &uncore_root_kobj, str);
> +               if (!ret) {
> +                       data->control_cpu = cpu;
> +                       data->valid = true;
> +               }
> +       }
> +       mutex_unlock(&uncore_lock);
> +}
> +
> +/* Last CPU in this die is offline, so remove sysfs entries */
> +static void uncore_remove_die_entry(int cpu)
> +{
> +       struct uncore_data *data;
> +
> +       mutex_lock(&uncore_lock);
> +       data = uncore_get_instance(cpu);
> +       if (data) {
> +               kobject_put(&data->kobj);
> +               data->control_cpu = -1;
> +               data->valid = false;
> +       }
> +       mutex_unlock(&uncore_lock);
> +}
> +
> +static int uncore_event_cpu_online(unsigned int cpu)
> +{
> +       int target;
> +
> +       /* Check if there is an online cpu in the package for uncore MSR */
> +       target = cpumask_any_and(&uncore_cpu_mask, topology_die_cpumask(cpu));
> +       if (target < nr_cpu_ids)
> +               return 0;
> +
> +       /* Use this CPU on this die as a control CPU */
> +       cpumask_set_cpu(cpu, &uncore_cpu_mask);
> +       uncore_add_die_entry(cpu);
> +
> +       return 0;
> +}
> +
> +static int uncore_event_cpu_offline(unsigned int cpu)
> +{
> +       int target;
> +
> +       /* Check if existing cpu is used for uncore MSRs */
> +       if (!cpumask_test_and_clear_cpu(cpu, &uncore_cpu_mask))
> +               return 0;
> +
> +       /* Find a new cpu to set uncore MSR */
> +       target = cpumask_any_but(topology_die_cpumask(cpu), cpu);
> +
> +       if (target < nr_cpu_ids) {
> +               cpumask_set_cpu(target, &uncore_cpu_mask);
> +               uncore_add_die_entry(target);
> +       } else {
> +               uncore_remove_die_entry(cpu);
> +       }
> +
> +       return 0;
> +}
> +
> +static int uncore_pm_notify(struct notifier_block *nb, unsigned long mode,
> +                           void *_unused)
> +{
> +       int cpu;
> +
> +       switch (mode) {
> +       case PM_POST_HIBERNATION:
> +       case PM_POST_RESTORE:
> +       case PM_POST_SUSPEND:
> +               for_each_cpu(cpu, &uncore_cpu_mask) {
> +                       struct uncore_data *data;
> +                       int ret;
> +
> +                       data = uncore_get_instance(cpu);
> +                       if (!data || !data->valid || !data->stored_uncore_data)
> +                               continue;
> +
> +                       ret = wrmsrl_on_cpu(cpu, MSR_UNCORE_RATIO_LIMIT,
> +                                           data->stored_uncore_data);
> +                       if (ret)
> +                               return ret;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static struct notifier_block uncore_pm_nb = {
> +       .notifier_call = uncore_pm_notify,
> +};
> +
> +#define ICPU(model)     { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> +
> +static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
> +       ICPU(INTEL_FAM6_BROADWELL_G),
> +       ICPU(INTEL_FAM6_BROADWELL_X),
> +       ICPU(INTEL_FAM6_BROADWELL_D),
> +       ICPU(INTEL_FAM6_SKYLAKE_X),
> +       ICPU(INTEL_FAM6_ICELAKE_X),
> +       ICPU(INTEL_FAM6_ICELAKE_D),
> +       {}
> +};
> +
> +static int __init intel_uncore_init(void)
> +{
> +       const struct x86_cpu_id *id;
> +       int ret;
> +
> +       id = x86_match_cpu(intel_uncore_cpu_ids);
> +       if (!id)
> +               return -ENODEV;
> +
> +       uncore_max_entries = topology_max_packages() *
> +                                       topology_max_die_per_package();
> +       uncore_instances = kcalloc(uncore_max_entries,
> +                                  sizeof(*uncore_instances), GFP_KERNEL);
> +       if (!uncore_instances)
> +               return -ENOMEM;
> +
> +       ret = kobject_init_and_add(&uncore_root_kobj, &uncore_root_ktype,
> +                                  &cpu_subsys.dev_root->kobj,
> +                                  "intel_uncore_frequency");
> +       if (ret)
> +               goto err_free;
> +
> +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +                               "platform/x86/uncore-freq:online",
> +                               uncore_event_cpu_online,
> +                               uncore_event_cpu_offline);
> +       if (ret < 0)
> +               goto err_rem_kobj;
> +
> +       uncore_hp_state = ret;
> +
> +       ret = register_pm_notifier(&uncore_pm_nb);
> +       if (ret)
> +               goto err_rem_state;
> +
> +       return 0;
> +
> +err_rem_state:
> +       cpuhp_remove_state(uncore_hp_state);
> +err_rem_kobj:
> +       kobject_put(&uncore_root_kobj);
> +err_free:
> +       kfree(uncore_instances);
> +
> +       return ret;
> +}
> +module_init(intel_uncore_init)
> +
> +static void __exit intel_uncore_exit(void)
> +{
> +       int i;
> +
> +       unregister_pm_notifier(&uncore_pm_nb);
> +       cpuhp_remove_state(uncore_hp_state);
> +       for (i = 0; i < uncore_max_entries; ++i) {
> +               if (uncore_instances[i].valid)
> +                       kobject_put(&uncore_instances[i].kobj);
> +       }
> +       kobject_put(&uncore_root_kobj);
> +       kfree(uncore_instances);
> +}
> +module_exit(intel_uncore_exit)
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Intel Uncore Frequency Limits Driver");
> --
> 2.17.2
>


-- 
With Best Regards,
Andy Shevchenko
