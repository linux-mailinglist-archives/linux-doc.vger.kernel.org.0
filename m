Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0164F10D5D0
	for <lists+linux-doc@lfdr.de>; Fri, 29 Nov 2019 13:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfK2Mre (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Nov 2019 07:47:34 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:43172 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2Mre (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Nov 2019 07:47:34 -0500
Received: by mail-qk1-f193.google.com with SMTP id q28so6453561qkn.10
        for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2019 04:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HA9o/u53YjrVdA02BiAhrhaWuLmdYlt8zQVP4Dznw6U=;
        b=l5uWqe7bpXn2UmXrf5rJxfPA/epAIbrtB3jup0WIiu5m8pWoU00aEs1tua2o2EoA8W
         +8Yw+nK4rUZFqZEuAwGmwZC55hEP898tYISz7JX6QLf/hlKh11pwKjIXI35npPPAlj4H
         Uk2Itv6CXUl6L6unhF9qRb3phRktfJIStsROI9PlzzoMhgaKR987uAch/1leF22Mvcso
         wbkcSGEtMwT6sYVIVQJeNmyZdvNUOynl88P92VcAFVYVY3ci6e5+TjDeuI51N7/Ts0TT
         cUY2iNqTDxjjIjYvvju8CsLLbJHhlJp+9LAtmGT/fLGYmiCNYlgHDiO+P0Fxseh+LseN
         T3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HA9o/u53YjrVdA02BiAhrhaWuLmdYlt8zQVP4Dznw6U=;
        b=PFGxTDVN8TAswJoNrWEfJygpkc1bmCt+M5gOZ0teoRxd1T2u/zexuGm7wUmMUxx2/b
         0vfRp/0QnLjvuYB3ZHhPyzl8ZxHAwhaqroVwaW57V113e9d8nrkq9xJJtTvnpzXnPwY3
         XbFx2tmclzbPaEQcVjwLSaAkvjIqt0uAnNETuOS9Qbgt8ekMq1QE5KOAHZC7HMEzLytj
         1qgUZrqp/w4/hEzmITIScG+DUcmNCWPPJlWS74MIvQAxOBHhv5ezrBmYR+YjhA+YRT8k
         IWviVeR/7FuRBIr3J8zY+Efssv9ehGXQ2sZ7+L+aOTAR17fTcz7f16by4sauQ3CcROgY
         gOkQ==
X-Gm-Message-State: APjAAAWmvCYs+PK1ElzDyRM9utjjFGGcaBNGTAptHvAmAMA8mR7VXB8L
        oKBNwj6BmkmemCcRyUFsmEOcfqY8tQdSyctigV56TA==
X-Google-Smtp-Source: APXvYqzmTmr6QZQFIUEGRuuXj5PXEOxF6lLfDqA6zEH/L5cP6mOIC+LfT9NMK8B0Ha75O23mZDfOLZ+HCsRM7UEbVTU=
X-Received: by 2002:a37:62d2:: with SMTP id w201mr15360336qkb.445.1575031651558;
 Fri, 29 Nov 2019 04:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-4-mike.leach@linaro.org>
 <df1f3912-4096-bc96-e65a-5db1593ad8f4@arm.com>
In-Reply-To: <df1f3912-4096-bc96-e65a-5db1593ad8f4@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 29 Nov 2019 12:47:20 +0000
Message-ID: <CAJ9a7VhV=5okV1oCW8sAUZVsUzgDWnDNgP-eWejquGx+M9Xv2w@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] coresight: cti: Add sysfs access to program
 function regs
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Suzuki,


On Wed, 27 Nov 2019 at 18:26, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 19/11/2019 23:19, Mike Leach wrote:
> > Adds in sysfs programming support for the CTI function register sets.
> > Allows direct manipulation of channel / trigger association registers.
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >   .../hwtracing/coresight/coresight-cti-sysfs.c | 362 ++++++++++++++++++
> >   drivers/hwtracing/coresight/coresight-cti.c   |  19 +
> >   drivers/hwtracing/coresight/coresight-cti.h   |   5 +
> >   3 files changed, 386 insertions(+)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > index 507f8eb487fe..02d3ee0c1278 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> > @@ -109,6 +109,362 @@ static struct attribute *coresight_cti_mgmt_attrs[] = {
> >       NULL,
> >   };
> >
> > +/* CTI low level programming registers */
> > +
> > +/*
> > + * Show a simple 32 bit value if enabled and powered.
> > + * If inaccessible & pcached_val not NULL then show cached value.
> > + */
>
> Also I am not sure if it makes sense to mention that the value is cached.
>
> > +static ssize_t cti_reg32_show(struct device *dev, char *buf,
> > +                           u32 *pcached_val, int reg_offset)
> > +{
> > +     u32 val = 0;
>    +    char *state = "";
>
> > +     struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +     struct cti_config *config = &drvdata->config;
> > +
> > +     spin_lock(&drvdata->spinlock);
> > +     if ((reg_offset >= 0) && CTI_PWR_ENA(config)) {
>
> minor nit: Personally I don't like the naming here. This could simply
> be: cti_accessible(config) , may be defined as a static inline function
> instead of a macro:
>
> static inline bool cti_accessible(struct cti_drvdata *drvdata)
> {
>         struct cti_config *cfg = &drvdata->config;
>
>         return cfg->hw_powered && cfg->hw_enabled;
> }
>
>

Since this is a generic access function used throughout the file - the
cached pointer is an indicator used by the callee that there is a
value available if the CTI is unpowered  / disabled - so the function
can show an appropriate value which will be taken from the config
structure.

So I don't think it is relevant to show that a "cached" value is being
used to show the user. If you look at similar functions in the ETM
drivers for example, quite often a show function simple shows that
stored value from a config structure without ever looking at the
register in the device.

As to naming - the name is chosen to represent a specific state - both
powered and enabled. The sysfs interface is accessible in any state  -
powered / unpowered  , enabled /disabled - so I am being specific.
Unlike the ETM, this hardware can have registers programmed while
enabled - and for some such as apppulse this is the only time it makes
sense to use them.

I don't mind either way between macro / inline function - though it
still has to be declared in the header as it is used in multiple .c
files.
I'd be inclined to call it cti_active() if preferred to cti_pwr_ena -
active implies that the CTI is in operation.

Thanks

Mike


> > +             CS_UNLOCK(drvdata->base);
> > +             val = readl_relaxed(drvdata->base + reg_offset);
> > +             if (pcached_val)
> > +                     *pcached_val = val;
> > +             CS_LOCK(drvdata->base);
> > +     } else if (pcached_val) {
> > +             val = *pcached_val;
>
>    +            state = " (cached)";
> > +     }
> > +     spin_unlock(&drvdata->spinlock);
> > +     return scnprintf(buf, PAGE_SIZE, "%#x\n", val);
>    +    return scnprintf(buf, PAGE_SIZE, "%#x%s\n", val, state);
>
> > +}
> > +
> > +/*
> > + * Store a simple 32 bit value.
> > + * If pcached_val not NULL, then copy to here too,
> > + * if reg_offset >= 0 then write through if enabled.
> > + */
> > +static ssize_t cti_reg32_store(struct device *dev, const char *buf,
> > +                            size_t size, u32 *pcached_val, int reg_offset)
>
>
> > +static ssize_t appclear_store(struct device *dev,
> > +                           struct device_attribute *attr,
> > +                           const char *buf, size_t size)
> > +{
> > +     unsigned long val;
> > +     struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > +     struct cti_config *config = &drvdata->config;
> > +
> > +     if (kstrtoul(buf, 0, &val))
> > +             return -EINVAL;
> > +
> > +     spin_lock(&drvdata->spinlock);
> > +
> > +     /* a 1'b1 in appclr clears down the same bit in appset*/
>
> nit: a 0b1 ?
>
Syntax is <bitwidth>'<radix><value> - a habit picked up from verilog.

> > +     config->ctiappset &= ~val;
> > +
> > +     /* write through if enabled */
> > +     if (CTI_PWR_ENA(config))
> > +             cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
> > +     spin_unlock(&drvdata->spinlock);
> > +     return size;
> > +}
> > +static DEVICE_ATTR_WO(appclear);
> > +
>
> Otherwise looks good to me.
>
> Suzuki



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
