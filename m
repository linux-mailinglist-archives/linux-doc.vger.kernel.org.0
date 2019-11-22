Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F7E107650
	for <lists+linux-doc@lfdr.de>; Fri, 22 Nov 2019 18:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfKVRTz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 22 Nov 2019 12:19:55 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34695 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbfKVRTz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Nov 2019 12:19:55 -0500
Received: by mail-pl1-f196.google.com with SMTP id h13so3370616plr.1
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2019 09:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q6BlYT6/Z4tSjKr/kNllhAtnAKd8iVSV2iEUROLqPI8=;
        b=ELi7O8YUvk4UeiMsi97t5rySbf3MeMQpU40ZfilxIwysZPVt0iMiXTHBYH7tWqWUHK
         DiK6SlEe46Nbs2F4Sg5q7RNIMawIhdYfwmSm1nZq2lte6oZdommCecGC9bCqDnvJhw9v
         Bzk4hRMz1IFsG5s2flsmQ8f8897JbAZGpNraVUlyu27VD3ICoo39dD0EFC7IZZMyaxFd
         01p5sS+p6jXleCyJKz9YM+FbHPGL6qK3dMcqg93fiSrUKrPCiEGORDq+dBIrjXLUkxO9
         cucdn2ONlNaQ8QyNuo8c3JWyrIfbN5t4XKcmHKOEgpvj+kwE9d9+RGqmhDmUW6mwzSMV
         hyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q6BlYT6/Z4tSjKr/kNllhAtnAKd8iVSV2iEUROLqPI8=;
        b=HSvG1g2H5Yrkms0iuI8frWVOZysyrjyFjRYRkkLQmTarkE1lHEryxfXjh+y6i5VfQk
         YQ0etCXLnsNk8PLduFwQZ6wuAldCY6oclsqY01P7vBz7jjRmX8VAa8xDnloqXKx0UlFT
         477GF/cxc8usY1PwH54IWS/PLh+A7/7xp6XRszqEDJDB4XQDXU3BKOD1tb7YvIVG2Of8
         IArcvjrirrvDE2IWhISAGXoRFQqQQMghyg55iZSmCLigN8I70NSiWF1Az6RiUnnhSoP7
         XiNUfQbglYP6jr0fYdgMhdIGLs0xvHTAd/7z6RjpUGsmaAxi3WCeflp7EHEyow+IjcgO
         6aDQ==
X-Gm-Message-State: APjAAAW5xYNZ0Q3ErZ/Xee5ybTq57SXfTKwZCtVkqVTNpPANNOCiDIqI
        Il5PoIRSMwiy3XeH1pB/n99E4hOFCV4=
X-Google-Smtp-Source: APXvYqwss35cdEVoof9/JF38V2dzqPfgSmlyObJ0V3lQBa4vCUR86x9K77SIdHdEoTSPOZ/XapIXXA==
X-Received: by 2002:a17:90a:7784:: with SMTP id v4mr20673851pjk.74.1574443192905;
        Fri, 22 Nov 2019 09:19:52 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y1sm8286433pfq.138.2019.11.22.09.19.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2019 09:19:51 -0800 (PST)
Date:   Fri, 22 Nov 2019 10:19:50 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        suzuki.poulose@arm.com
Subject: Re: [PATCH v5 02/14] coresight: cti: Add sysfs coresight mgmt reg
 access.
Message-ID: <20191122171950.GA23396@xps15>
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-3-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119231912.12768-3-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 19, 2019 at 11:19:00PM +0000, Mike Leach wrote:
> Adds sysfs access to the coresight management registers.
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>

Tags added to a patch are like a chain of custody and should be added in order
they were published.  In this case you wrote the patch so your SoB goes first.
Then Suzuki and I have reviewed your patch and as such, our RB come _after_ your
SoB.  When I add the patch to my tree I'll add my SoB after that and when Greg
picks it up in his, he will do the same.  Please re-order the tags in this patch
and the other ones in this set to reflect the chronology of events.

> ---
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 53 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-priv.h  |  1 +
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index a832b8c6b866..507f8eb487fe 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -62,11 +62,64 @@ static struct attribute *coresight_cti_attrs[] = {
>  	NULL,
>  };
>  
> +/* register based attributes */
> +
> +/* macro to access RO registers with power check only (no enable check). */
> +#define coresight_cti_reg(name, offset)			\
> +static ssize_t name##_show(struct device *dev,				\
> +			   struct device_attribute *attr, char *buf)	\
> +{									\
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
> +	u32 val = 0;							\
> +	pm_runtime_get_sync(dev->parent);				\
> +	spin_lock(&drvdata->spinlock);					\
> +	if (drvdata->config.hw_powered)					\
> +		val = readl_relaxed(drvdata->base + offset);		\
> +	spin_unlock(&drvdata->spinlock);				\
> +	pm_runtime_put_sync(dev->parent);				\
> +	return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);		\
> +}									\
> +static DEVICE_ATTR_RO(name)
> +
> +/* coresight management registers */
> +coresight_cti_reg(devaff0, CTIDEVAFF0);
> +coresight_cti_reg(devaff1, CTIDEVAFF1);
> +coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS);
> +coresight_cti_reg(devarch, CORESIGHT_DEVARCH);
> +coresight_cti_reg(devid, CORESIGHT_DEVID);
> +coresight_cti_reg(devtype, CORESIGHT_DEVTYPE);
> +coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0);
> +coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1);
> +coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2);
> +coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3);
> +coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4);
> +
> +static struct attribute *coresight_cti_mgmt_attrs[] = {
> +	&dev_attr_devaff0.attr,
> +	&dev_attr_devaff1.attr,
> +	&dev_attr_authstatus.attr,
> +	&dev_attr_devarch.attr,
> +	&dev_attr_devid.attr,
> +	&dev_attr_devtype.attr,
> +	&dev_attr_pidr0.attr,
> +	&dev_attr_pidr1.attr,
> +	&dev_attr_pidr2.attr,
> +	&dev_attr_pidr3.attr,
> +	&dev_attr_pidr4.attr,
> +	NULL,
> +};
> +
>  static const struct attribute_group coresight_cti_group = {
>  	.attrs = coresight_cti_attrs,
>  };
>  
> +static const struct attribute_group coresight_cti_mgmt_group = {
> +	.attrs = coresight_cti_mgmt_attrs,
> +	.name = "mgmt",
> +};
> +
>  const struct attribute_group *coresight_cti_groups[] = {
>  	&coresight_cti_group,
> +	&coresight_cti_mgmt_group,
>  	NULL,
>  };
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 82e563cdc879..aba6b789c969 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -22,6 +22,7 @@
>  #define CORESIGHT_CLAIMCLR	0xfa4
>  #define CORESIGHT_LAR		0xfb0
>  #define CORESIGHT_LSR		0xfb4
> +#define CORESIGHT_DEVARCH	0xfbc
>  #define CORESIGHT_AUTHSTATUS	0xfb8
>  #define CORESIGHT_DEVID		0xfc8
>  #define CORESIGHT_DEVTYPE	0xfcc
> -- 
> 2.17.1
> 
