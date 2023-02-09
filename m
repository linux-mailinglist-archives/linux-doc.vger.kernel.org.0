Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D19690048
	for <lists+linux-doc@lfdr.de>; Thu,  9 Feb 2023 07:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjBIGU6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-doc@lfdr.de>); Thu, 9 Feb 2023 01:20:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjBIGU5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 01:20:57 -0500
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4385227D5A;
        Wed,  8 Feb 2023 22:20:50 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id E491A24E236;
        Thu,  9 Feb 2023 14:20:41 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Feb
 2023 14:20:41 +0800
Received: from [192.168.125.110] (183.27.96.33) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Feb
 2023 14:20:40 +0800
Message-ID: <2c424d39-3a1d-3c91-d049-c0b941359bc3@starfivetech.com>
Date:   Thu, 9 Feb 2023 14:20:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 2/4] hwmon: (sfctemp) Add StarFive JH71x0 temperature
 sensor
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        <linux-kernel@vger.kernel.org>
References: <20230103013145.9570-1-hal.feng@starfivetech.com>
 <20230103013145.9570-3-hal.feng@starfivetech.com>
 <20230103221017.GA217155@roeck-us.net>
 <ddb197c3-9c77-c8c2-1d41-1691de05847e@starfivetech.com>
 <7580df6b-e97f-0036-8f7f-63acde8cd42a@roeck-us.net>
 <629e070a-5138-8754-e86c-3458ae5d7a16@starfivetech.com>
 <7c375ccf-509a-aea3-62a3-d4f43d6b6c8a@roeck-us.net>
From:   Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <7c375ccf-509a-aea3-62a3-d4f43d6b6c8a@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [183.27.96.33]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 8 Feb 2023 07:16:52 -0800, Guenter Roeck wrote:
> On 2/8/23 04:40, Hal Feng wrote:
>> On Mon, 6 Feb 2023 11:21:38 -0800, Guenter Roeck wrote:
>>> On 2/6/23 09:12, Hal Feng wrote:
>>>> On Tue, 3 Jan 2023 14:10:17 -0800, Guenter Roeck wrote:
>>>>> On Tue, Jan 03, 2023 at 09:31:43AM +0800, Hal Feng wrote:
>> [...]
>>>>>> diff --git a/drivers/hwmon/sfctemp.c b/drivers/hwmon/sfctemp.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..e56716ad9587
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/hwmon/sfctemp.c
>>>>>> @@ -0,0 +1,350 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +/*
>>>>>> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
>>>>>> + * Copyright (C) 2021 Samin Guo <samin.guo@starfivetech.com>
>>>>>> + */
>>>>>> +#include <linux/clk.h>
>>>>>> +#include <linux/completion.h>
>>>>>> +#include <linux/delay.h>
>>>>>> +#include <linux/hwmon.h>
>>>>>> +#include <linux/interrupt.h>
>>>>>> +#include <linux/io.h>
>>>>>> +#include <linux/module.h>
>>>>>> +#include <linux/mutex.h>
>>>>>> +#include <linux/of.h>
>>>>>> +#include <linux/platform_device.h>
>>>>>> +#include <linux/reset.h>
>>>>>> +
>>>>>> +/*
>>>>>> + * TempSensor reset. The RSTN can be de-asserted once the analog core has
>>>>>> + * powered up. Trst(min 100ns)
>>>>>> + * 0:reset  1:de-assert
>>>>>> + */
>>>>>> +#define SFCTEMP_RSTN    BIT(0)
>>>>>
>>>>> Missing include of linux/bits.h
>>>>
>>>> Will add it. Thanks.
>>>>
>>>>>
>>>>>> +
>>>>>> +/*
>>>>>> + * TempSensor analog core power down. The analog core will be powered up
>>>>>> + * Tpu(min 50us) after PD is de-asserted. RSTN should be held low until the
>>>>>> + * analog core is powered up.
>>>>>> + * 0:power up  1:power down
>>>>>> + */
>>>>>> +#define SFCTEMP_PD    BIT(1)
>>>>>> +
>>>>>> +/*
>>>>>> + * TempSensor start conversion enable.
>>>>>> + * 0:disable  1:enable
>>>>>> + */
>>>>>> +#define SFCTEMP_RUN    BIT(2)
>>>>>> +
>>>>>> +/*
>>>>>> + * TempSensor conversion value output.
>>>>>> + * Temp(C)=DOUT*Y/4094 - K
>>>>>> + */
>>>>>> +#define SFCTEMP_DOUT_POS    16
>>>>>> +#define SFCTEMP_DOUT_MSK    GENMASK(27, 16)
>>>>>> +
>>>>>> +/* DOUT to Celcius conversion constants */
>>>>>> +#define SFCTEMP_Y1000    237500L
>>>>>> +#define SFCTEMP_Z    4094L
>>>>>> +#define SFCTEMP_K1000    81100L
>>>>>> +
>>>>>> +struct sfctemp {
>>>>>> +    /* serialize access to hardware register and enabled below */
>>>>>> +    struct mutex lock;
>>>>>> +    struct completion conversion_done;
>>>>>> +    void __iomem *regs;
>>>>>> +    struct clk *clk_sense;
>>>>>> +    struct clk *clk_bus;
>>>>>> +    struct reset_control *rst_sense;
>>>>>> +    struct reset_control *rst_bus;
>>>>>> +    bool enabled;
>>>>>> +};
>>>>>> +
>>>>>> +static irqreturn_t sfctemp_isr(int irq, void *data)
>>>>>> +{
>>>>>> +    struct sfctemp *sfctemp = data;
>>>>>> +
>>>>>> +    complete(&sfctemp->conversion_done);
>>>>>> +    return IRQ_HANDLED;
>>>>>> +}
>>>>>> +
>>>>>> +static void sfctemp_power_up(struct sfctemp *sfctemp)
>>>>>> +{
>>>>>> +    /* make sure we're powered down first */
>>>>>> +    writel(SFCTEMP_PD, sfctemp->regs);
>>>>>> +    udelay(1);
>>>>>> +
>>>>>> +    writel(0, sfctemp->regs);
>>>>>> +    /* wait t_pu(50us) + t_rst(100ns) */
>>>>>> +    usleep_range(60, 200);
>>>>>> +
>>>>>> +    /* de-assert reset */
>>>>>> +    writel(SFCTEMP_RSTN, sfctemp->regs);
>>>>>> +    udelay(1); /* wait t_su(500ps) */
>>>>>> +}
>>>>>> +
>>>>>> +static void sfctemp_power_down(struct sfctemp *sfctemp)
>>>>>> +{
>>>>>> +    writel(SFCTEMP_PD, sfctemp->regs);
>>>>>> +}
>>>>>> +
>>>>>> +static void sfctemp_run_single(struct sfctemp *sfctemp)
>>>>>> +{
>>>>>> +    writel(SFCTEMP_RSTN | SFCTEMP_RUN, sfctemp->regs);
>>>>>> +    udelay(1);
>>>>>> +    writel(SFCTEMP_RSTN, sfctemp->regs);
>>>>>
>>>>> The datasheet (or, rather, programming manual) does not appear
>>>>> to be public, so I have to guess here.
>>>>>
>>>>> The code suggests that running a single conversion may be a choice,
>>>>> not a requirement. If it is indeed a choice, the reasoning needs to be
>>>>> explained since it adds a lot of complexity and dependencies to the
>>>>> driver (for example, interrupt support is only mandatory or even needed
>>>>> due to this choice). It also adds a significant delay to temperature
>>>>> read operations, which may have practical impact on thermal control
>>>>> software.
>>>>>
>>>>> If the chip only supports single temperature readings, that needs to be
>>>>> explained as well (and why SFCTEMP_RUN has to be reset in that case).
>>>>
>>>> The chip supports continuous conversion. When you set SFCTEMP_RUN, the
>>>> temperature raw data will be generated all the time. However, it will
>>>> also generate interrupts all the time when the conversion is finished,
>>>> because of the hardware limitation. So in this driver, we just support
>>>> the single conversion.
>>>>
>>>
>>> Sorry, I don't follow the logic. The interrupt is, for all practical
>>> purposes, useless because there are no limits and exceeding any such
>>> limits is therefore not supported. The only reason to have and enable
>>> to interrupt is because continuous mode is disabled.
>>>
>>> The code could be simplified a lot if interrupt support would be
>>> dropped and continuous mode would be enabled.
>>
>> If we enable continuous mode, which means SFCTEMP_RUN remains asserted,
>> the conversion finished interrupt will be raised after each sample
>> time (8.192 ms). Within a few minutes, a lot of interrupts are raised,
>> as showed below.
>>
>> # cat /proc/interrupts
>>             CPU0       CPU1       CPU2       CPU3
>>    1:          0          0          0          0  SiFive PLIC   1 Edge      ccache_ecc
>>    2:          1          0          0          0  SiFive PLIC   3 Edge      ccache_ecc
>>    3:          1          0          0          0  SiFive PLIC   4 Edge      ccache_ecc
>>    4:          0          0          0          0  SiFive PLIC   2 Edge      ccache_ecc
>>    5:       1116       1670        411       1466  RISC-V INTC   5 Edge      riscv-timer
>>    6:      32093          0          0          0  SiFive PLIC  81 Edge      120e0000.temperature-sensor
>>   10:       1233          0          0          0  SiFive PLIC  32 Edge      ttyS0
>> IPI0:       117         62        123        117  Rescheduling interrupts
>> IPI1:       278        353        105        273  Function call interrupts
>> IPI2:         0          0          0          0  CPU stop interrupts
>> IPI3:         0          0          0          0  CPU stop (for crash dump) interrupts
>> IPI4:         0          0          0          0  IRQ work interrupts
>> IPI5:         0          0          0          0  Timer broadcast interrupts
>>
>> If we enable continuous mode and drop the interrupt support in the
>> driver, the kernel will not know the interrupts but a lot of interrupts
>> are still raised in hardware. Can we do such like that?
> 
> Why not ? It just stays raised. That happens a lot.

OK, I see. Thanks.

> 
>> Without the interrupt support, the temperature we read may be the value
>> generated in the last cycle.
> 
> That would be highly unusual and should be documented.

Because without the interrupt, there is no flag pointing out when the
conversion is finished, and the temperature we read is the data generated
before. With further consideration, the error is no more than one sample
time (8.192 ms) in continuous mode while the error is no less than one sample
time in single mode. In this respect, continuous mode is better than single
mode.

> 
> 
>>
>> I think the temperature has its value only when we read it, so we start
> 
> "may be" ? "I think" ? That means you don't know ? Maybe test it, or ask
> the chip designers.

Sorry for my inexact statement. I means the temperature data is useful to us
only when we read it. If we don't read it, the temperature data will just be
discarded every sample time.

> 
>> conversion only when we read the temperature. Further more, it will
>> consume more power if we enable continuous mode.
>>
> 
> Usually that is not a concern, much less so than delaying each reader.

After some test, it's found that there is almost no difference between these
two modes in power consumption.

> 
> Ultimately, sure, you can do whatever you want. I'll still accept the driver.
> I do expect you to explain your reasons (all of them) in the driver, though.
> 
> If you don't _know_ if the temperature is updated in continuous mode,
> please state exactly that in the comments. Also explain how much power
> is saved by not running in continuous mode. I don't want anyone to come
> back later on and change the code because they don't know the reasons
> why it doesn't use continuous mode.

It's OK to run the continuous mode instead and remove the "- interrupts" entry
in "required:" of DT bindings. I will modify in the next version. Thank you
for your suggestions.

Best regards,
Hal
