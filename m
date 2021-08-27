Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E4A3F9FAD
	for <lists+linux-doc@lfdr.de>; Fri, 27 Aug 2021 21:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhH0TMF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Aug 2021 15:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhH0TMB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Aug 2021 15:12:01 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DF7C061796
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 12:11:12 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id n12so4515881plk.10
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 12:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yl8JaGwDYWpLzn1wS9SWOQbcJPOi0ZPRWqv06q6Qt74=;
        b=LQBqohKiZF1hUQMSKbFutNRYNB2ZNBVrhxEGrV1/8QVmiiiwLqYpSys8ZACniFIdH4
         xM7xdYhXcyegGoPyE3+qtuehpOFqNA9gFUXKXAZxnyBlokhrZBx7v8e2Z3A1rAWhrbl7
         R3Ce4Ww+tmlx/5NmV8nIRwz0kvJpH70SjEOHC0z0zsUh5vi4iEK2ZdFwLHc6XCKTosnr
         avjP30EP8hNygZms28yK8TAHbPcuQi3xyn8YVpSapvous8V0ILQ+MCQDC/GgUrWRJ4Ca
         SkB39+e/WmHAULwChUJz/Q05W1pMC7ddj20rj/H7iZmu4pJdHZu9gx6J4FFy/j6yRrId
         WjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yl8JaGwDYWpLzn1wS9SWOQbcJPOi0ZPRWqv06q6Qt74=;
        b=lMM+wNayqLvm3SilnoYYqLRO/Ui8eQ3Wzfz5WwVT9c/URTIWq4CfV44HlLafTiYbkY
         Zav9Krte0pGBPxLs2ROqT6Owi3f5ffLfrs+n7LiFkUJczVmg/d4E5QHSZM6DerQuSdZA
         tqqgYKn1NHhOHr4Jf1UcmnwyWYxSY7YAbSFDLs/CGcbYOMALcH1eEDVKo8IzDHFLh5r9
         M0ox5hoFgyCmv5qohFqTYN1grVIPxUNlwWG4vSAkhEIV9jbk7v/s4LX2Vf00AnjfwCCg
         4FGCqZoWeGNCdwwg7zpqf8lQEref/oR0BVyI0tPKUYoRetnU+hBRaSe0hXj6y4i9stTN
         rbaw==
X-Gm-Message-State: AOAM530hB5OLTwQdVphWcHyNgqCrNoIT0/Wi+HhCIw9ZrVygxRS8JAi9
        jruEKPrXf/aO3BrIQbolRVrQ/HKGnsPoqd6gCoDRVw==
X-Google-Smtp-Source: ABdhPJxPpy9zsWh8K3XJaMk4z9lCRsqU/ns24+nAno2osjLNoWIhEDfFvosicD/8oRBRu6WenkwxjYSnfuhYhnlHAWs=
X-Received: by 2002:a17:90a:1991:: with SMTP id 17mr15779481pji.149.1630091471578;
 Fri, 27 Aug 2021 12:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210803113134.2262882-1-iwona.winiarska@intel.com> <20210803113134.2262882-10-iwona.winiarska@intel.com>
In-Reply-To: <20210803113134.2262882-10-iwona.winiarska@intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 27 Aug 2021 12:11:00 -0700
Message-ID: <CAPcyv4hhtTi+dKspjoamYj53GxT4Ot_1pG5-eavUJdihD8iAEg@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] peci: Add sysfs interface for PECI bus
To:     Iwona Winiarska <iwona.winiarska@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        openbmc@lists.ozlabs.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        X86 ML <x86@kernel.org>,
        Device Tree <devicetree@vger.kernel.org>,
        linux-aspeed@lists.ozlabs.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-hwmon@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Yazen Ghannam <yazen.ghannam@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Zev Weiss <zweiss@equinix.com>,
        David Muller <d.mueller@elsoft.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 3, 2021 at 4:35 AM Iwona Winiarska
<iwona.winiarska@intel.com> wrote:
>
> PECI devices may not be discoverable at the time when PECI controller is
> being added (e.g. BMC can boot up when the Host system is still in S5).
> Since we currently don't have the capabilities to figure out the Host
> system state inside the PECI subsystem itself, we have to rely on
> userspace to do it for us.
>
> In the future, PECI subsystem may be expanded with mechanisms that allow
> us to avoid depending on userspace interaction (e.g. CPU presence could
> be detected using GPIO, and the information on whether it's discoverable
> could be obtained over IPMI).

Thanks for this detail.

> Unfortunately, those methods may ultimately not be available (support
> will vary from platform to platform), which means that we still need
> platform independent method triggered by userspace.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-peci | 16 +++++
>  drivers/peci/Makefile                    |  2 +-
>  drivers/peci/core.c                      |  3 +-
>  drivers/peci/device.c                    |  1 +
>  drivers/peci/internal.h                  |  5 ++
>  drivers/peci/sysfs.c                     | 82 ++++++++++++++++++++++++
>  6 files changed, 107 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-peci
>  create mode 100644 drivers/peci/sysfs.c
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-peci b/Documentation/ABI/testing/sysfs-bus-peci
> new file mode 100644
> index 000000000000..56c2b2216bbd
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-peci
> @@ -0,0 +1,16 @@
> +What:          /sys/bus/peci/rescan
> +Date:          July 2021
> +KernelVersion: 5.15
> +Contact:       Iwona Winiarska <iwona.winiarska@intel.com>
> +Description:
> +               Writing a non-zero value to this attribute will
> +               initiate scan for PECI devices on all PECI controllers
> +               in the system.
> +
> +What:          /sys/bus/peci/devices/<controller_id>-<device_addr>/remove
> +Date:          July 2021
> +KernelVersion: 5.15
> +Contact:       Iwona Winiarska <iwona.winiarska@intel.com>
> +Description:
> +               Writing a non-zero value to this attribute will
> +               remove the PECI device and any of its children.
> diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
> index c5f9d3fe21bb..917f689e147a 100644
> --- a/drivers/peci/Makefile
> +++ b/drivers/peci/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  # Core functionality
> -peci-y := core.o request.o device.o
> +peci-y := core.o request.o device.o sysfs.o
>  obj-$(CONFIG_PECI) += peci.o
>
>  # Hardware specific bus drivers
> diff --git a/drivers/peci/core.c b/drivers/peci/core.c
> index d143f1a7fe98..c473acb3c2a0 100644
> --- a/drivers/peci/core.c
> +++ b/drivers/peci/core.c
> @@ -34,7 +34,7 @@ struct device_type peci_controller_type = {
>         .release        = peci_controller_dev_release,
>  };
>
> -static int peci_controller_scan_devices(struct peci_controller *controller)
> +int peci_controller_scan_devices(struct peci_controller *controller)
>  {
>         int ret;
>         u8 addr;
> @@ -159,6 +159,7 @@ EXPORT_SYMBOL_NS_GPL(devm_peci_controller_add, PECI);
>
>  struct bus_type peci_bus_type = {
>         .name           = "peci",
> +       .bus_groups     = peci_bus_groups,
>  };
>
>  static int __init peci_init(void)
> diff --git a/drivers/peci/device.c b/drivers/peci/device.c
> index 32811248997b..d77d9dabd51e 100644
> --- a/drivers/peci/device.c
> +++ b/drivers/peci/device.c
> @@ -110,5 +110,6 @@ static void peci_device_release(struct device *dev)
>  }
>
>  struct device_type peci_device_type = {
> +       .groups         = peci_device_groups,
>         .release        = peci_device_release,
>  };
> diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
> index 57d11a902c5d..978e12c8e1d3 100644
> --- a/drivers/peci/internal.h
> +++ b/drivers/peci/internal.h
> @@ -8,6 +8,7 @@
>  #include <linux/types.h>
>
>  struct peci_controller;
> +struct attribute_group;
>  struct peci_device;
>  struct peci_request;
>
> @@ -19,12 +20,16 @@ struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx_len, u
>  void peci_request_free(struct peci_request *req);
>
>  extern struct device_type peci_device_type;
> +extern const struct attribute_group *peci_device_groups[];
>
>  int peci_device_create(struct peci_controller *controller, u8 addr);
>  void peci_device_destroy(struct peci_device *device);
>
>  extern struct bus_type peci_bus_type;
> +extern const struct attribute_group *peci_bus_groups[];

To me, sysfs.c is small enough to just fold into core.c, then no need
to declare public attribute arrays like this, but up to you if you
prefer the sysfs.c split.

>
>  extern struct device_type peci_controller_type;
>
> +int peci_controller_scan_devices(struct peci_controller *controller);
> +
>  #endif /* __PECI_INTERNAL_H */
> diff --git a/drivers/peci/sysfs.c b/drivers/peci/sysfs.c
> new file mode 100644
> index 000000000000..db9ef05776e3
> --- /dev/null
> +++ b/drivers/peci/sysfs.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2021 Intel Corporation
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/peci.h>
> +
> +#include "internal.h"
> +
> +static int rescan_controller(struct device *dev, void *data)
> +{
> +       if (dev->type != &peci_controller_type)
> +               return 0;
> +
> +       return peci_controller_scan_devices(to_peci_controller(dev));
> +}
> +
> +static ssize_t rescan_store(struct bus_type *bus, const char *buf, size_t count)
> +{
> +       bool res;
> +       int ret;
> +
> +       ret = kstrtobool(buf, &res);
> +       if (ret)
> +               return ret;
> +
> +       if (!res)
> +               return count;
> +
> +       ret = bus_for_each_dev(&peci_bus_type, NULL, NULL, rescan_controller);
> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}
> +static BUS_ATTR_WO(rescan);
> +
> +static struct attribute *peci_bus_attrs[] = {
> +       &bus_attr_rescan.attr,
> +       NULL
> +};
> +
> +static const struct attribute_group peci_bus_group = {
> +       .attrs = peci_bus_attrs,
> +};
> +
> +const struct attribute_group *peci_bus_groups[] = {
> +       &peci_bus_group,
> +       NULL
> +};
> +
> +static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
> +                           const char *buf, size_t count)
> +{
> +       struct peci_device *device = to_peci_device(dev);
> +       bool res;
> +       int ret;
> +
> +       ret = kstrtobool(buf, &res);
> +       if (ret)
> +               return ret;
> +
> +       if (res && device_remove_file_self(dev, attr))
> +               peci_device_destroy(device);

How do you solve races between sysfs device remove and controller
device remove? Looks like double-free at first glance. Have a look at
the  kill_device() helper as one way to resolve this double-delete
race..

> +
> +       return count;
> +}
> +static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0200, NULL, remove_store);
> +
> +static struct attribute *peci_device_attrs[] = {
> +       &dev_attr_remove.attr,
> +       NULL
> +};
> +
> +static const struct attribute_group peci_device_group = {
> +       .attrs = peci_device_attrs,
> +};
> +
> +const struct attribute_group *peci_device_groups[] = {
> +       &peci_device_group,
> +       NULL
> +};
> --
> 2.31.1
>
