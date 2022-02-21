Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62EF04BDCF9
	for <lists+linux-doc@lfdr.de>; Mon, 21 Feb 2022 18:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348038AbiBUJKi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Feb 2022 04:10:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347942AbiBUJKH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Feb 2022 04:10:07 -0500
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35EA91D30F;
        Mon, 21 Feb 2022 01:02:31 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:105:465:1:3:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4K2GXP552Nz9sQY;
        Mon, 21 Feb 2022 10:02:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1645434147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wEZ76kGSwSq5Wb4rRjccaeTPhaIObqPlN/MOOW3VPhk=;
        b=uZQ8LMcMBT9oxmgLlM7ejy4iHa61SJVdQKomL126T+USo6k9wMltyZIMsdv6RJuSNGYFiM
        S1dDaLLtAAYeps1yeehJYUM9B1b13ztJHt1UVevaGB3FgufO1NXMMpTvBQhyorRgEd2+Lt
        DfL+TufSWx+Tj6Uzk+iX/7Tv2pugG9uoUy2rSPLP1Yfsen8Ek0iHiq228vBMMEwUSB9zf2
        8dUQ33R3D9UOOtB5GO0QZa12hhADkxFx/xK+O/OhgFhdNOhzd+5mcOILWlRAzUsmtigumC
        P5ciVoGn3UwkhyNQhsVw1KsqLZ+oSE4fJ8/aWZHtg+y2qCBBw0hxLN71LCj9kw==
Message-ID: <3c931f2f23546f17ea232346b43550ee42d6d7dc.camel@sylv.io>
Subject: Re: [PATCH v3 3/4] pmbus: Add support for pli1209bc
From:   sylv <sylv@sylv.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-doc@vger.kernel.org
Date:   Mon, 21 Feb 2022 10:02:17 +0100
In-Reply-To: <20220219144110.GA1032070@roeck-us.net>
References: <cover.1644874828.git.sylv@sylv.io>
         <8d44098e7b8ca5d4c13733267836d5a147539277.1644874828.git.sylv@sylv.io>
         <20220219144110.GA1032070@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 2022-02-19 at 06:41 -0800, Guenter Roeck wrote:
> On Mon, Feb 14, 2022 at 10:44:55PM +0100, Marcello Sylvester Bauer
> wrote:
> > PLI1209BC is a Digital Supervisor from Vicor Corporation.
> > 
> > Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> 
> checkpatch says:
> 
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> #82: FILE: Documentation/hwmon/pli1209bc.rst:1:
> +Kernel driver pli1209bc
> 
> I can not accept the patch without license identifier.

oh, sure. I thought it is still optional for documentation entries.

> 
> > ---
> >  Documentation/hwmon/pli1209bc.rst |  73 +++++++++++++++++++
> 
> This needs to be added to Documentation/hwmon/index.rst.
> 
> >  drivers/hwmon/pmbus/Kconfig       |   9 +++
> >  drivers/hwmon/pmbus/Makefile      |   1 +
> >  drivers/hwmon/pmbus/pli1209bc.c   | 115
> > ++++++++++++++++++++++++++++++
> >  4 files changed, 198 insertions(+)
> >  create mode 100644 Documentation/hwmon/pli1209bc.rst
> >  create mode 100644 drivers/hwmon/pmbus/pli1209bc.c
> > 
> > diff --git a/Documentation/hwmon/pli1209bc.rst
> > b/Documentation/hwmon/pli1209bc.rst
> > new file mode 100644
> > index 000000000000..a3f686d03cf2
> > --- /dev/null
> > +++ b/Documentation/hwmon/pli1209bc.rst
> > @@ -0,0 +1,73 @@
> > +Kernel driver pli1209bc
> > +=======================
> > +
> > +Supported chips:
> > +
> > +  * Digital Supervisor PLI1209BC
> > +
> > +    Prefix: 'pli1209bc'
> > +
> > +    Addresses scanned: 0x50 - 0x5F
> > +
> > +    Datasheet:
> > https://www.vicorpower.com/documents/datasheets/ds-PLI1209BCxyzz-VICOR.pdf
> > +
> > +Authors:
> > +    - Marcello Sylvester Bauer <sylv@sylv.io>
> > +
> > +Description
> > +-----------
> > +
> > +The Vicor PLI1209BC is an isolated digital power system supervisor
> > thatprovides
> 
> that provides

ack.

> 
> > +a communication interface between a host processor and one Bus
> > Converter Module
> > +(BCM). The PLI communicates with a system controller via a PMBus
> > compatible
> > +interface over an isolated UART interface. Through the PLI, the
> > host processor
> > +can configure, set protection limits, and monitor the BCM.
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +=======================
> > ========================================================
> > +in1_label              "vin2"
> > +in1_input              Input voltage.
> > +in1_rated_min          Minimum rated input voltage.
> > +in1_rated_max          Maximum rated input voltage.
> > +in1_max                        Maximum input voltage.
> > +in1_max_alarm          Input voltage high alarm.
> > +in1_crit               Critical input voltage.
> > +in1_crit_alarm         Input voltage critical alarm.
> > +
> > +in2_label              "vout2"
> > +in2_input              Output voltage.
> > +in2_rated_min          Minimum rated output voltage.
> > +in2_rated_max          Maximum rated output voltage.
> > +in2_alarm              Output voltage alarm
> > +
> > +curr1_label            "iin2"
> > +curr1_input            Input current.
> > +curr1_max              Maximum input current.
> > +curr1_max_alarm                Maximum input current high alarm.
> > +curr1_crit             Critical input current.
> > +curr1_crit_alarm       Input current critical alarm.
> > +
> > +curr2_label            "iout2"
> > +curr2_input            Output current.
> > +curr2_crit             Critical output current.
> > +curr2_crit_alarm       Output current critical alarm.
> > +curr2_max              Maximum output current.
> > +curr2_max_alarm                Output current high alarm.
> > +
> > +power1_label           "pin2"
> > +power1_input           Input power.
> > +power1_alarm           Input power alarm.
> > +
> > +power2_label           "pout2"
> > +power2_input           Output power.
> > +power2_rated_max       Maximum rated output power.
> > +
> > +temp1_input            Die temperature.
> > +temp1_alarm            Die temperature alarm.
> > +temp1_max              Maximum die temperature.
> > +temp1_max_alarm                Die temperature high alarm.
> > +temp1_crit             Critical die temperature.
> > +temp1_crit_alarm       Die temperature critical alarm.
> > +=======================
> > ========================================================
> > diff --git a/drivers/hwmon/pmbus/Kconfig
> > b/drivers/hwmon/pmbus/Kconfig
> > index c96f7b7338bd..831db423bea0 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -310,6 +310,15 @@ config SENSORS_PIM4328
> >           This driver can also be built as a module. If so, the
> > module will
> >           be called pim4328.
> >  
> > +config SENSORS_PLI1209BC
> > +       tristate "Vicor PLI1209BC"
> > +       help
> > +         If you say yes here you get hardware monitoring support
> > for Vicor
> > +         PLI1209BC Digital Supervisor.
> > +
> > +         This driver can also be built as a module. If so, the
> > module will
> > +         be called pli1209bc.
> > +
> >  config SENSORS_PM6764TR
> >         tristate "ST PM6764TR"
> >         help
> > diff --git a/drivers/hwmon/pmbus/Makefile
> > b/drivers/hwmon/pmbus/Makefile
> > index e5935f70c9e0..7ce74e3b8552 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -34,6 +34,7 @@ obj-$(CONFIG_SENSORS_MP2888)  += mp2888.o
> >  obj-$(CONFIG_SENSORS_MP2975)   += mp2975.o
> >  obj-$(CONFIG_SENSORS_MP5023)   += mp5023.o
> >  obj-$(CONFIG_SENSORS_PM6764TR) += pm6764tr.o
> > +obj-$(CONFIG_SENSORS_PLI1209BC)        += pli1209bc.o
> 
> Alphabetic order please.

ack.

Thanks,
Marcello

> 
> >  obj-$(CONFIG_SENSORS_PXE1610)  += pxe1610.o
> >  obj-$(CONFIG_SENSORS_Q54SJ108A2)       += q54sj108a2.o
> >  obj-$(CONFIG_SENSORS_STPDDC60) += stpddc60.o
> > diff --git a/drivers/hwmon/pmbus/pli1209bc.c
> > b/drivers/hwmon/pmbus/pli1209bc.c
> > new file mode 100644
> > index 000000000000..5f8847307e55
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/pli1209bc.c
> > @@ -0,0 +1,115 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Hardware monitoring driver for Vicor PLI1209BC Digital
> > Supervisor
> > + *
> > + * Copyright (c) 2022 9elements GmbH
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pmbus.h>
> > +#include "pmbus.h"
> > +
> > +/*
> > + * The capability command is only supported at page 0. Probing the
> > device while
> > + * the page register is set to 1 will falsely enable PEC support.
> > Disable
> > + * capability probing accordingly, since the PLI1209BC does not
> > have any
> > + * additional capabilities.
> > + */
> > +static struct pmbus_platform_data pli1209bc_plat_data = {
> > +       .flags = PMBUS_NO_CAPABILITY,
> > +};
> > +
> > +static int pli1209bc_read_word_data(struct i2c_client *client, int
> > page,
> > +                                   int phase, int reg)
> > +{
> > +       int data;
> > +
> > +       switch (reg) {
> > +       /* PMBUS_READ_POUT uses a direct format with R=0 */
> > +       case PMBUS_READ_POUT:
> > +               data = pmbus_read_word_data(client, page, phase,
> > reg);
> > +               if (data < 0)
> > +                       return data;
> > +               data = sign_extend32(data, 15) * 10;
> > +               return clamp_val(data, -32768, 32767) & 0xffff;
> > +       default:
> > +               return -ENODATA;
> > +       }
> > +}
> > +
> > +static struct pmbus_driver_info pli1209bc_info = {
> > +       .pages = 2,
> > +       .format[PSC_VOLTAGE_IN] = direct,
> > +       .format[PSC_VOLTAGE_OUT] = direct,
> > +       .format[PSC_CURRENT_IN] = direct,
> > +       .format[PSC_CURRENT_OUT] = direct,
> > +       .format[PSC_POWER] = direct,
> > +       .format[PSC_TEMPERATURE] = direct,
> > +       .m[PSC_VOLTAGE_IN] = 1,
> > +       .b[PSC_VOLTAGE_IN] = 0,
> > +       .R[PSC_VOLTAGE_IN] = 1,
> > +       .m[PSC_VOLTAGE_OUT] = 1,
> > +       .b[PSC_VOLTAGE_OUT] = 0,
> > +       .R[PSC_VOLTAGE_OUT] = 1,
> > +       .m[PSC_CURRENT_IN] = 1,
> > +       .b[PSC_CURRENT_IN] = 0,
> > +       .R[PSC_CURRENT_IN] = 3,
> > +       .m[PSC_CURRENT_OUT] = 1,
> > +       .b[PSC_CURRENT_OUT] = 0,
> > +       .R[PSC_CURRENT_OUT] = 2,
> > +       .m[PSC_POWER] = 1,
> > +       .b[PSC_POWER] = 0,
> > +       .R[PSC_POWER] = 1,
> > +       .m[PSC_TEMPERATURE] = 1,
> > +       .b[PSC_TEMPERATURE] = 0,
> > +       .R[PSC_TEMPERATURE] = 0,
> > +       /*
> > +        * Page 0 sums up all attributes except voltage readings.
> > +        * The pli1209 digital supervisor only contains a single
> > BCM, making
> > +        * page 0 redundant.
> > +        */
> > +       .func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT
> > +           | PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT
> > +           | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT
> > +           | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> > +           | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT,
> > +       .read_word_data = pli1209bc_read_word_data,
> > +};
> > +
> > +static int pli1209bc_probe(struct i2c_client *client)
> > +{
> > +       client->dev.platform_data = &pli1209bc_plat_data;
> > +       return pmbus_do_probe(client, &pli1209bc_info);
> > +}
> > +
> > +static const struct i2c_device_id pli1209bc_id[] = {
> > +       {"pli1209bc", 0},
> > +       {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, pli1209bc_id);
> > +
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id pli1209bc_of_match[] = {
> > +       { .compatible = "vicor,pli1209bc" },
> > +       { },
> > +};
> > +MODULE_DEVICE_TABLE(of, pli1209bc_of_match);
> > +#endif
> > +
> > +static struct i2c_driver pli1209bc_driver = {
> > +       .driver = {
> > +                  .name = "pli1209bc",
> > +                  .of_match_table =
> > of_match_ptr(pli1209bc_of_match),
> > +                  },
> > +       .probe_new = pli1209bc_probe,
> > +       .id_table = pli1209bc_id,
> > +};
> > +
> > +module_i2c_driver(pli1209bc_driver);
> > +
> > +MODULE_AUTHOR("Marcello Sylvester Bauer <sylv@sylv.io>");
> > +MODULE_DESCRIPTION("PMBus driver for Vicor PLI1209BC");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS(PMBUS);
