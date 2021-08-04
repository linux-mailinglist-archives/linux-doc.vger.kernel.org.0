Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049A23E06CC
	for <lists+linux-doc@lfdr.de>; Wed,  4 Aug 2021 19:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237773AbhHDRdy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 Aug 2021 13:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhHDRdx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 13:33:53 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FCAC0613D5;
        Wed,  4 Aug 2021 10:33:40 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 21so3707277oin.8;
        Wed, 04 Aug 2021 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=boQtfMOkZY9hdjBQivOx+8/FvLGtf9v8PYVfUON6vUQ=;
        b=GvZ1SBNr2DcgJSQTR+uzl4H3+WJD0SNH7HsHspqb1BuouaZcwWSbrOHZ+5+HQweU3Q
         SMGyUIijwEnz1zocHU2f3X51iEnbnHYb6QNZS6+L/bmhDL0udvq2jZEDzJH7QCPZfg6i
         TSj6sC7jX/J/xEmLLGkIcmArcjjT5iYMeGXdZ/mc0ExqIXdG//pYUjIRR4bvfgwI0qHT
         T/d6z23Qsjstwvy5CdR74maXQ0BkfvtzjvpFPE2vVilXNhN3ERNBCO9oxlBk/9Cx8lR8
         ilnua+8hAP85QWI+qlaF3Mk4b7tWWscPH5SgzvMC6B8M/2AuGqyrdFUJrgrxe+Nzu0WV
         G/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=boQtfMOkZY9hdjBQivOx+8/FvLGtf9v8PYVfUON6vUQ=;
        b=uUwhrf86WznfE6V/d0WgXiaZJY89boIkbKjMXgre9Z69gZ/5RtRj4uqiFCtm45XKaz
         ZO7rRsEDhUWng/QXB9WtRX3glmrTW6F4zVyiC+G2aZTeKXz4+RQVpIq00k8+mg0U75gj
         EVxhOAIp7oQeRLbNP049MKZ9ytov5wZYMj5GA/Sh9Q4a5pd2lNObTjRolsjb20gWzgY7
         +6uS7khRxAL/8b5kIMiVy4AnfS08NCo2+75TNT+eu3PPeSCPqD5b1zlKR7ojZYY8om7I
         ISwcuPtDypMs7d5FDvjgDD1/q5xkIJjq0kuqHdh+sFKJI3DO9KVYSbOfP4id/97AAYGH
         RaXw==
X-Gm-Message-State: AOAM533ahJ8AeZRKijwFMUTW7tllvlQzBkgFKkf4i5SSgtwdiRxa/pGi
        eclW42LgfGhucQR5hl4FIGI=
X-Google-Smtp-Source: ABdhPJzPmtomHiFQRHu0Frnwj19U5U9ieIGCtt/9GmfJnQQrdsF77jcXTd2yPxviTb/mGRTxwKZmwA==
X-Received: by 2002:aca:39c6:: with SMTP id g189mr2259435oia.47.1628098419381;
        Wed, 04 Aug 2021 10:33:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c21sm560538oiw.16.2021.08.04.10.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 10:33:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
        "Williams, Dan J" <dan.j.williams@intel.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "Luck, Tony" <tony.luck@intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "olof@lixom.net" <olof@lixom.net>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
        "zweiss@equinix.com" <zweiss@equinix.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "d.mueller@elsoft.ch" <d.mueller@elsoft.ch>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-14-iwona.winiarska@intel.com>
 <20210803153937.GA337938@roeck-us.net>
 <a576f7075625a476c613b5feb2c4c7033d6c0375.camel@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 13/15] hwmon: peci: Add dimmtemp driver
Message-ID: <ff8f8b20-33af-08a0-6036-03429bf69730@roeck-us.net>
Date:   Wed, 4 Aug 2021 10:33:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a576f7075625a476c613b5feb2c4c7033d6c0375.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/4/21 3:46 AM, Winiarska, Iwona wrote:
> On Tue, 2021-08-03 at 08:39 -0700, Guenter Roeck wrote:
>> On Tue, Aug 03, 2021 at 01:31:32PM +0200, Iwona Winiarska wrote:
>>> Add peci-dimmtemp driver for Temperature Sensor on DIMM readings that
>>> are accessible via the processor PECI interface.
>>>
>>> The main use case for the driver (and PECI interface) is out-of-band
>>> management, where we're able to obtain thermal readings from an external
>>> entity connected with PECI, e.g. BMC on server platforms.
>>>
>>> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> ---
>>> Note that the timeout was completely removed - we're going to probe
>>> for detected DIMMs every 5 seconds until we reach "stable" state of
>>> either getting correct DIMM data or getting all -EINVAL (which
>>> suggest that the CPU doesn't have any DIMMs).
>>>
>>>   drivers/hwmon/peci/Kconfig    |  13 +
>>>   drivers/hwmon/peci/Makefile   |   2 +
>>>   drivers/hwmon/peci/dimmtemp.c | 614 ++++++++++++++++++++++++++++++++++
>>>   3 files changed, 629 insertions(+)
>>>   create mode 100644 drivers/hwmon/peci/dimmtemp.c
>>>
>>> diff --git a/drivers/hwmon/peci/Kconfig b/drivers/hwmon/peci/Kconfig
>>> index e10eed68d70a..9d32a57badfe 100644
>>> --- a/drivers/hwmon/peci/Kconfig
>>> +++ b/drivers/hwmon/peci/Kconfig
>>> @@ -14,5 +14,18 @@ config SENSORS_PECI_CPUTEMP
>>>            This driver can also be built as a module. If so, the module
>>>            will be called peci-cputemp.
>>>   
>>> +config SENSORS_PECI_DIMMTEMP
>>> +       tristate "PECI DIMM temperature monitoring client"
>>> +       depends on PECI
>>> +       select SENSORS_PECI
>>> +       select PECI_CPU
>>> +       help
>>> +         If you say yes here you get support for the generic Intel PECI
>>> hwmon
>>> +         driver which provides Temperature Sensor on DIMM readings that are
>>> +         accessible via the processor PECI interface.
>>> +
>>> +         This driver can also be built as a module. If so, the module
>>> +         will be called peci-dimmtemp.
>>> +
>>>   config SENSORS_PECI
>>>          tristate
>>> diff --git a/drivers/hwmon/peci/Makefile b/drivers/hwmon/peci/Makefile
>>> index e8a0ada5ab1f..191cfa0227f3 100644
>>> --- a/drivers/hwmon/peci/Makefile
>>> +++ b/drivers/hwmon/peci/Makefile
>>> @@ -1,5 +1,7 @@
>>>   # SPDX-License-Identifier: GPL-2.0-only
>>>   
>>>   peci-cputemp-y := cputemp.o
>>> +peci-dimmtemp-y := dimmtemp.o
>>>   
>>>   obj-$(CONFIG_SENSORS_PECI_CPUTEMP)     += peci-cputemp.o
>>> +obj-$(CONFIG_SENSORS_PECI_DIMMTEMP)    += peci-dimmtemp.o
>>> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
>>> new file mode 100644
>>> index 000000000000..6264c29bb6c0
>>> --- /dev/null
>>> +++ b/drivers/hwmon/peci/dimmtemp.c
>>> @@ -0,0 +1,614 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +// Copyright (c) 2018-2021 Intel Corporation
>>> +
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/bitops.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/jiffies.h>
>>> +#include <linux/module.h>
>>> +#include <linux/peci.h>
>>> +#include <linux/peci-cpu.h>
>>> +#include <linux/units.h>
>>> +#include <linux/workqueue.h>
>>> +#include <linux/x86/intel-family.h>
>>> +
>>> +#include "common.h"
>>> +
>>> +#define DIMM_MASK_CHECK_DELAY_JIFFIES  msecs_to_jiffies(5000)
>>> +
>>> +/* Max number of channel ranks and DIMM index per channel */
>>> +#define CHAN_RANK_MAX_ON_HSX   8
>>> +#define DIMM_IDX_MAX_ON_HSX    3
>>> +#define CHAN_RANK_MAX_ON_BDX   4
>>> +#define DIMM_IDX_MAX_ON_BDX    3
>>> +#define CHAN_RANK_MAX_ON_BDXD  2
>>> +#define DIMM_IDX_MAX_ON_BDXD   2
>>> +#define CHAN_RANK_MAX_ON_SKX   6
>>> +#define DIMM_IDX_MAX_ON_SKX    2
>>> +#define CHAN_RANK_MAX_ON_ICX   8
>>> +#define DIMM_IDX_MAX_ON_ICX    2
>>> +#define CHAN_RANK_MAX_ON_ICXD  4
>>> +#define DIMM_IDX_MAX_ON_ICXD   2
>>> +
>>> +#define CHAN_RANK_MAX          CHAN_RANK_MAX_ON_HSX
>>> +#define DIMM_IDX_MAX           DIMM_IDX_MAX_ON_HSX
>>> +#define DIMM_NUMS_MAX          (CHAN_RANK_MAX * DIMM_IDX_MAX)
>>> +
>>> +#define CPU_SEG_MASK           GENMASK(23, 16)
>>> +#define GET_CPU_SEG(x)         (((x) & CPU_SEG_MASK) >> 16)
>>> +#define CPU_BUS_MASK           GENMASK(7, 0)
>>> +#define GET_CPU_BUS(x)         ((x) & CPU_BUS_MASK)
>>> +
>>> +#define DIMM_TEMP_MAX          GENMASK(15, 8)
>>> +#define DIMM_TEMP_CRIT         GENMASK(23, 16)
>>> +#define GET_TEMP_MAX(x)                (((x) & DIMM_TEMP_MAX) >> 8)
>>> +#define GET_TEMP_CRIT(x)       (((x) & DIMM_TEMP_CRIT) >> 16)
>>> +
>>> +struct peci_dimmtemp;
>>> +
>>> +struct dimm_info {
>>> +       int chan_rank_max;
>>> +       int dimm_idx_max;
>>> +       u8 min_peci_revision;
>>> +       int (*read_thresholds)(struct peci_dimmtemp *priv, int dimm_order,
>>> +                              int chan_rank, u32 *data);
>>> +};
>>> +
>>> +struct peci_dimm_thresholds {
>>> +       long temp_max;
>>> +       long temp_crit;
>>> +       struct peci_sensor_state state;
>>> +};
>>> +
>>> +enum peci_dimm_threshold_type {
>>> +       temp_max_type,
>>> +       temp_crit_type,
>>> +};
>>> +
>>> +struct peci_dimmtemp {
>>> +       struct peci_device *peci_dev;
>>> +       struct device *dev;
>>> +       const char *name;
>>> +       const struct dimm_info *gen_info;
>>> +       struct delayed_work detect_work;
>>> +       struct {
>>> +               struct peci_sensor_data temp;
>>> +               struct peci_dimm_thresholds thresholds;
>>> +       } dimm[DIMM_NUMS_MAX];
>>> +       char **dimmtemp_label;
>>> +       DECLARE_BITMAP(dimm_mask, DIMM_NUMS_MAX);
>>> +};
>>> +
>>> +static u8 __dimm_temp(u32 reg, int dimm_order)
>>> +{
>>> +       return (reg >> (dimm_order * 8)) & 0xff;
>>> +}
>>> +
>>> +static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no, long
>>> *val)
>>> +{
>>> +       int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
>>> +       int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
>>> +       u32 data;
>>> +       int ret;
>>
>>          int ret = 0;
>>
>>> +
>>> +       mutex_lock(&priv->dimm[dimm_no].temp.state.lock);
>>> +       if (!peci_sensor_need_update(&priv->dimm[dimm_no].temp.state))
>>> +               goto skip_update;
>>> +
>>> +       ret = peci_pcs_read(priv->peci_dev, PECI_PCS_DDR_DIMM_TEMP,
>>> chan_rank, &data);
>>> +       if (ret) {
>>> +               mutex_unlock(&priv->dimm[dimm_no].temp.state.lock);
>>> +               return ret;
>>> +       }
>>
>>          if (ret)
>>                  goto unlock;
>>
>>> +
>>> +       priv->dimm[dimm_no].temp.value = __dimm_temp(data, dimm_order) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +
>>> +       peci_sensor_mark_updated(&priv->dimm[dimm_no].temp.state);
>>> +
>>> +skip_update:
>>> +       *val = priv->dimm[dimm_no].temp.value;
>>
>> unlock:
>>> +       mutex_unlock(&priv->dimm[dimm_no].temp.state.lock);
>>> +       return 0;
>>
>>          return ret;
> 
> Ack.
> 
>>
>>> +}
>>> +
>>> +static int update_thresholds(struct peci_dimmtemp *priv, int dimm_no)
>>> +{
>>> +       int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
>>> +       int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
>>> +       u32 data;
>>> +       int ret;
>>> +
>>> +       if (!peci_sensor_need_update(&priv->dimm[dimm_no].thresholds.state))
>>> +               return 0;
>>> +
>>> +       ret = priv->gen_info->read_thresholds(priv, dimm_order, chan_rank,
>>> &data);
>>> +       if (ret == -ENODATA) /* Use default or previous value */
>>> +               return 0;
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       priv->dimm[dimm_no].thresholds.temp_max = GET_TEMP_MAX(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +       priv->dimm[dimm_no].thresholds.temp_crit = GET_TEMP_CRIT(data) *
>>> MILLIDEGREE_PER_DEGREE;
>>> +
>>> +       peci_sensor_mark_updated(&priv->dimm[dimm_no].thresholds.state);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int get_dimm_thresholds(struct peci_dimmtemp *priv, enum
>>> peci_dimm_threshold_type type,
>>> +                              int dimm_no, long *val)
>>> +{
>>> +       int ret;
>>> +
>>> +       mutex_lock(&priv->dimm[dimm_no].thresholds.state.lock);
>>> +       ret = update_thresholds(priv, dimm_no);
>>> +       if (ret)
>>> +               goto unlock;
>>> +
>>> +       switch (type) {
>>> +       case temp_max_type:
>>> +               *val = priv->dimm[dimm_no].thresholds.temp_max;
>>> +               break;
>>> +       case temp_crit_type:
>>> +               *val = priv->dimm[dimm_no].thresholds.temp_crit;
>>> +               break;
>>> +       default:
>>> +               ret = -EOPNOTSUPP;
>>> +               break;
>>> +       }
>>> +unlock:
>>> +       mutex_unlock(&priv->dimm[dimm_no].thresholds.state.lock);
>>> +
>>> +       return ret;
>>> +}
>>> +
>>> +static int dimmtemp_read_string(struct device *dev,
>>> +                               enum hwmon_sensor_types type,
>>> +                               u32 attr, int channel, const char **str)
>>> +{
>>> +       struct peci_dimmtemp *priv = dev_get_drvdata(dev);
>>> +
>>> +       if (attr != hwmon_temp_label)
>>> +               return -EOPNOTSUPP;
>>> +
>>> +       *str = (const char *)priv->dimmtemp_label[channel];
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int dimmtemp_read(struct device *dev, enum hwmon_sensor_types type,
>>> +                        u32 attr, int channel, long *val)
>>> +{
>>> +       struct peci_dimmtemp *priv = dev_get_drvdata(dev);
>>> +
>>> +       switch (attr) {
>>> +       case hwmon_temp_input:
>>> +               return get_dimm_temp(priv, channel, val);
>>> +       case hwmon_temp_max:
>>> +               return get_dimm_thresholds(priv, temp_max_type, channel,
>>> val);
>>> +       case hwmon_temp_crit:
>>> +               return get_dimm_thresholds(priv, temp_crit_type, channel,
>>> val);
>>> +       default:
>>> +               break;
>>> +       }
>>> +
>>> +       return -EOPNOTSUPP;
>>> +}
>>> +
>>> +static umode_t dimmtemp_is_visible(const void *data, enum
>>> hwmon_sensor_types type,
>>> +                                  u32 attr, int channel)
>>> +{
>>> +       const struct peci_dimmtemp *priv = data;
>>> +
>>> +       if (test_bit(channel, priv->dimm_mask))
>>> +               return 0444;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct hwmon_ops peci_dimmtemp_ops = {
>>> +       .is_visible = dimmtemp_is_visible,
>>> +       .read_string = dimmtemp_read_string,
>>> +       .read = dimmtemp_read,
>>> +};
>>> +
>>> +static int check_populated_dimms(struct peci_dimmtemp *priv)
>>> +{
>>> +       int chan_rank_max = priv->gen_info->chan_rank_max;
>>> +       int dimm_idx_max = priv->gen_info->dimm_idx_max;
>>> +       u32 chan_rank_empty = 0;
>>> +       u64 dimm_mask = 0;
>>> +       int chan_rank, dimm_idx, ret;
>>> +       u32 pcs;
>>> +
>>> +       BUILD_BUG_ON(CHAN_RANK_MAX > 32);
>>> +       BUILD_BUG_ON(DIMM_NUMS_MAX > 64);
>>
>> I don't immediately see the value of those build bugs. What happens if
>> CHAN_RANK_MAX > 32 or DIMM_NUMS_MAX > 64 ? Where do those limits come
>> from ?
> 
> Supported HW doesn't come near the limit for now - it's just an "artificial"
> limit imposed by variables we're using (u64 for dimm_mask and u32 for
> chan_rank_empty).
> 

Please use a value derived from the size of those variables for the check
to clarify and explain the constraints.

Thanks,
Guenter
