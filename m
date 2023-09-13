Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71DD379F5A7
	for <lists+linux-doc@lfdr.de>; Thu, 14 Sep 2023 01:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233262AbjIMXmO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Sep 2023 19:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233255AbjIMXmO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Sep 2023 19:42:14 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7314E41
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 16:42:09 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-68fbbb953cfso265425b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 16:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694648529; x=1695253329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qhJToYTNQgE0Hp2zNwcVoJ6UineNQbf397W3Yx/XnQM=;
        b=XIvDZc7Bh8u1mm86VX/zcCV1n59N+zXmBuqf7vjj7a78yLHYUYSX4TeWRaA0MjHIRG
         VDiGpBU6iNP9zw5ffRYsww/Vld1qCoDx4lymkPqhJvpzhKfDf0vBkRgSBFjCu3Sn8uL1
         WrsK/hnCW7NLTlD1ZquHIZY8xtVxg4bRE6WHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694648529; x=1695253329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhJToYTNQgE0Hp2zNwcVoJ6UineNQbf397W3Yx/XnQM=;
        b=H15lQ0ZDy6i5stZFaP7A4l15UxbLRKTfZMctC2tTx2X9z8UMgTWWn0HB88nv4Pw89D
         Ma3qbj5gRtBl/Vzu0CAgyx7GAnjlMOQ3V/5a65cSNPHnBJc27lBAtXeE/OQhRZo+9X5r
         sqcPYscssVhnm4420v2WkbW+NW2rUdVabQ51mH6HqqMSlE9UpMdw3J58W6eJ79gCMNV0
         NXCnrkmypvC2e+bgFfFXa3SZ6iK+ZugBX7COS7vgIs2HWdqAqrQXMJy+qC0hYLulVxwM
         saoSq5plhgAW6LhErHnNCci1phYCs9IhihX63d5H60YTQsEzvEDbHOrsTSABA06aojEM
         q/+w==
X-Gm-Message-State: AOJu0Yxl0cLNX8EXzVL0P3+ryNP20BDyRqSYlqkR89wJyYrRaYLHWzuR
        8CargGESaRp9WjrCQlxLqa3ENQ==
X-Google-Smtp-Source: AGHT+IEb+U0u0xKyw5shUYDu9+LXf06vqwRCVkTois8kAxcLarz4lxMuR+oS1Pa4m67fU85hFGCeBQ==
X-Received: by 2002:a05:6a20:4403:b0:14c:512c:60d9 with SMTP id ce3-20020a056a20440300b0014c512c60d9mr4576906pzb.27.1694648529242;
        Wed, 13 Sep 2023 16:42:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001b9e9edbf43sm169157plj.171.2023.09.13.16.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 16:42:08 -0700 (PDT)
Date:   Wed, 13 Sep 2023 16:42:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        tony.luck@intel.com, gpiccoli@igalia.com,
        mathieu.poirier@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, vigneshr@ti.com, nm@ti.com,
        matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
        bmasney@redhat.com, quic_tsoni@quicinc.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
Subject: Re: [REBASE PATCH v5 11/17] qcom_minidump: Register ramoops region
 with minidump
Message-ID: <202309131632.736914C0A3@keescook>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-12-git-send-email-quic_mojha@quicinc.com>
 <202309131624.0371D7E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309131624.0371D7E@keescook>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 13, 2023 at 04:30:04PM -0700, Kees Cook wrote:
> On Mon, Sep 11, 2023 at 04:23:53PM +0530, Mukesh Ojha wrote:
> > Register all the pstore frontend with minidump, so that they can
> > be dumped as default Linux minidump region to be collected on
> > SoC where minidump is enabled.
> > 
> > Helper functions is written in separate file and built along with
> > the minidump driver, since it is client of minidump and also call
> > it at appropriate place from minidump probe so that they always
> > get registered.
> > 
> > While at it also rename the out minidump module object name during
> > build as qcom_apss_minidump which basically depicts as Qualcomm
> > Application processor subsystem minidump.
> > 
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > ---
> >  drivers/soc/qcom/Kconfig                 |  1 +
> >  drivers/soc/qcom/Makefile                |  3 +-
> >  drivers/soc/qcom/qcom_minidump.c         |  4 ++
> >  drivers/soc/qcom/qcom_ramoops_minidump.c | 88 ++++++++++++++++++++++++++++++++
> >  drivers/soc/qcom/qcom_ramoops_minidump.h | 10 ++++
> >  5 files changed, 105 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/soc/qcom/qcom_ramoops_minidump.c
> >  create mode 100644 drivers/soc/qcom/qcom_ramoops_minidump.h
> > 
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index 0ac7afc2c67d..9f1a1e128fef 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -306,6 +306,7 @@ config QCOM_MINIDUMP
> >  	tristate "QCOM APSS Minidump driver"
> >  	depends on ARCH_QCOM || COMPILE_TEST
> >  	depends on QCOM_SMEM
> > +	depends on PSTORE
> >  	help
> >  	  This config enables linux core infrastructure for Application
> >  	  processor subsystem (APSS) minidump collection i.e, it enables
> > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> > index 4b5f72f78d3c..69df41aba7a9 100644
> > --- a/drivers/soc/qcom/Makefile
> > +++ b/drivers/soc/qcom/Makefile
> > @@ -33,4 +33,5 @@ obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
> >  qcom_ice-objs			+= ice.o
> >  obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
> >  obj-$(CONFIG_QCOM_RPROC_MINIDUMP)	+= qcom_rproc_minidump.o
> > -obj-$(CONFIG_QCOM_MINIDUMP)		+= qcom_minidump.o
> > +obj-$(CONFIG_QCOM_MINIDUMP)		+= qcom_apss_minidump.o
> > +qcom_apss_minidump-objs			+= qcom_minidump.o qcom_ramoops_minidump.o
> > diff --git a/drivers/soc/qcom/qcom_minidump.c b/drivers/soc/qcom/qcom_minidump.c
> > index 4ce36f154e89..7930a80b9100 100644
> > --- a/drivers/soc/qcom/qcom_minidump.c
> > +++ b/drivers/soc/qcom/qcom_minidump.c
> > @@ -23,6 +23,7 @@
> >  #include <soc/qcom/qcom_minidump.h>
> >  
> >  #include "qcom_minidump_internal.h"
> > +#include "qcom_ramoops_minidump.h"
> >  
> >  /**
> >   * struct minidump_ss_data - Minidump subsystem private data
> > @@ -688,6 +689,8 @@ static int qcom_apss_minidump_probe(struct platform_device *pdev)
> >  		return ret;
> >  	}
> >  
> > +	qcom_ramoops_minidump_register(md->dev);
> > +
> >  	mutex_lock(&md_plist.plock);
> >  	platform_set_drvdata(pdev, md);
> >  	qcom_apss_register_pending_regions(md);
> > @@ -701,6 +704,7 @@ static int qcom_apss_minidump_remove(struct platform_device *pdev)
> >  	struct minidump *md = platform_get_drvdata(pdev);
> >  	struct minidump_ss_data *mdss_data;
> >  
> > +	qcom_ramoops_minidump_unregister();
> >  	mdss_data = md->apss_data;
> >  	memset(mdss_data->md_ss_toc, cpu_to_le32(0), sizeof(struct minidump_subsystem));
> >  	md = NULL;
> > diff --git a/drivers/soc/qcom/qcom_ramoops_minidump.c b/drivers/soc/qcom/qcom_ramoops_minidump.c
> > new file mode 100644
> > index 000000000000..eb97310e3858
> > --- /dev/null
> > +++ b/drivers/soc/qcom/qcom_ramoops_minidump.c
> > @@ -0,0 +1,88 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/pstore.h>
> > +#include <linux/slab.h>
> > +#include <soc/qcom/qcom_minidump.h>
> > +
> > +#include "qcom_ramoops_minidump.h"
> > +
> > +static LIST_HEAD(ramoops_region_list);
> > +
> > +struct md_region_list {
> > +	struct qcom_minidump_region md_region;
> > +	struct list_head list;
> > +};
> > +
> > +static int qcom_ramoops_region_register(struct device *dev, int type)
> > +{
> > +	struct qcom_minidump_region *md_region;
> > +	struct md_region_list *mdr_list;
> > +	struct pstore_record record;
> > +	unsigned int max_dump_cnt;
> > +	phys_addr_t phys;
> > +	const char *name;
> > +	void *virt;
> > +	size_t size;
> > +	int ret;
> > +
> > +	record.type = type;
> > +	record.id = 0;
> > +	max_dump_cnt = 0;
> > +	name = pstore_type_to_name(record.type);
> > +	do {
> > +		ret = pstore_region_defined(&record, &virt, &phys, &size, &max_dump_cnt);
> 
> I really don't want this happening: you're building your own pstore_record
> (which has a common initializer that isn't used here) and manually
> scraping the ramoops regions.
> 
> It looks to me like you just want a way to talk all the records in
> pstore and then export their location to minidump. The record walker
> needs to be in the pstore core, and likely should be shared with
> fs/pstore/inode.c which does the same thing.
> 
> Then, in this code, you can just do something like:
> 
> 	for (record = pstore_get_record(NULL); record; record = pstore_get_record(record)) {

I just took another look at how records are stored, and I think the best
API here is going to be something like registering a callback so that
pstore can call into minidump for each record. (i.e. it can do this when
reading the records into the pstore filesystem);

	pstore_register_record_watcher(minidump_pstore_record)

Then pstore can make the calls if one is registered, in the middle of
pstore_mkfile(), with all the correct locks held, etc:

	if (psi->record_watcher)
		psi->record_watcher(record);

And then minidump_pstore_record() can do this part:


> 		if (ramoops_get_record_details(record, &virt, &phys) < 0)
> 			continue
> 		...
> 		md_region->virt_addr = virt;
> 		md_region->phys_addr = phys;
> 		md_region->size = record->size;
> 
> 		ret = qcom_minidump_region_register(md_region);

-Kees

-- 
Kees Cook
