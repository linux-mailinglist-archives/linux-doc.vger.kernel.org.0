Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62DC66C9B95
	for <lists+linux-doc@lfdr.de>; Mon, 27 Mar 2023 09:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbjC0HAN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Mar 2023 03:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjC0HAH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Mar 2023 03:00:07 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC5949F0
        for <linux-doc@vger.kernel.org>; Mon, 27 Mar 2023 00:00:05 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so7651353pjt.5
        for <linux-doc@vger.kernel.org>; Mon, 27 Mar 2023 00:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679900405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmNqAYKnOmYaT/MnZIm+5aeZTWdgoQKIw2nZzS1PcBo=;
        b=TXIS+/KKAj2KCdZAGQzvukjjkWKiexAr7zec2pALHc5KGO+7ooF+MTTZsjlckLnrVG
         Q12kmCc90mGtwETdo0G0r6b3pnPpiSoC4ceBFPfNLLGnJG9feJnqRpgaXe2KZEUF22Nz
         6dO0gup1oDO2urAmp47DRaPwENCl09GeaH+mQHBL2o/TM/H5DJHF/dXFwUn4kFMmP3Bs
         C9fcq9AmvR37EJHJvltQbNyDPkeh2M/EHi4WZz/HGgmICtjxVa8zXnYJtlLTqCBuiEK5
         5qZY5Z0uzVbe6JcqBW3tD9jjWXb3I3V7iNBtEKLjRZLJLMJFBr/UNXzUe4Gep8gED2J8
         mKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679900405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmNqAYKnOmYaT/MnZIm+5aeZTWdgoQKIw2nZzS1PcBo=;
        b=26FORJzQ5Vkfaoxz9Urv0KfPSj+1eIbhPu1PlPXZPR9AqX7+a7M9cf8zmLaPSKG6N8
         pliOM4jKVFBvDCBi9iCU48SabDqNesDGQtC6wwdAx9pPjybNAUJ/5H9IoyN18PiZe3mw
         hCliQtPfxC5NAZqjxFDG1GSK9Uy33n0LG7TEl94FNFtKwaLLtVhwsJstkqEsYAFypWza
         VowszeKDjRfECR2GOXr1bQb6qB3+w1cfiUWg+IUa2YT5GL0KHNaj4JQUUZfs5OA17tSf
         +iaMPsEhxyyfED/jThPh9YlmCGi5kDIQ9gCOdMGgvnQaGzghkFYYr3bLBNV+N7QNTct9
         NY4A==
X-Gm-Message-State: AAQBX9dQ+K6Yfe6C0cQf/a0CM1UvyCOPZof3SZBR14Ukkp1VOHy1gpGr
        a7P0dAn2Y8v2dVHQK1832VBQ
X-Google-Smtp-Source: AKy350ZprbiosUicJTaRFAFWzkEZi/IcLgs3gXLrBboR1sxnYdrSQgZ/tO5zlzDRApjMuTO3iJb+Hw==
X-Received: by 2002:a17:90b:1b49:b0:23f:9439:9a27 with SMTP id nv9-20020a17090b1b4900b0023f94399a27mr11474154pjb.20.1679900404581;
        Mon, 27 Mar 2023 00:00:04 -0700 (PDT)
Received: from thinkpad ([117.217.184.83])
        by smtp.gmail.com with ESMTPSA id nk13-20020a17090b194d00b0023b3179f0fcsm3818034pjb.6.2023.03.27.00.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 00:00:04 -0700 (PDT)
Date:   Mon, 27 Mar 2023 12:29:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
        jacek.lawrynowicz@linux.intel.com,
        stanislaw.gruszka@linux.intel.com, dafna@fastmail.com,
        dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com,
        quic_carlv@quicinc.com, quic_ajitpals@quicinc.com,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/8] accel/qaic: Add MHI controller
Message-ID: <20230327065955.GB6270@thinkpad>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-4-git-send-email-quic_jhugo@quicinc.com>
 <20230324102645.GB4259@thinkpad>
 <e671d2df-6429-185a-31b2-27734d537281@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e671d2df-6429-185a-31b2-27734d537281@quicinc.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 24, 2023 at 09:26:49AM -0600, Jeffrey Hugo wrote:
> On 3/24/2023 4:26 AM, Manivannan Sadhasivam wrote:
> > On Mon, Mar 20, 2023 at 09:11:09AM -0600, Jeffrey Hugo wrote:
> > > An AIC100 device contains a MHI interface with a number of different
> > > channels for controlling different aspects of the device. The MHI
> > > controller works with the MHI bus to enable and drive that interface.
> > > 
> > > AIC100 uses the BHI protocol in PBL to load SBL. The MHI controller
> > > expects the SBL to be located at /lib/firmware/qcom/aic100/sbl.bin and
> > > expects the MHI bus to manage the process of loading and sending SBL to
> > > the device.
> > > 
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> > > Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> > > Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > > ---
> > >   drivers/accel/qaic/mhi_controller.c | 563 ++++++++++++++++++++++++++++++++++++
> > >   drivers/accel/qaic/mhi_controller.h |  16 +
> > >   2 files changed, 579 insertions(+)
> > >   create mode 100644 drivers/accel/qaic/mhi_controller.c
> > >   create mode 100644 drivers/accel/qaic/mhi_controller.h
> > > 
> > > diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> > > new file mode 100644
> > > index 0000000..777dfbe
> > > --- /dev/null
> > > +++ b/drivers/accel/qaic/mhi_controller.c
> > > @@ -0,0 +1,563 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
> > > +/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/err.h>
> > > +#include <linux/memblock.h>
> > > +#include <linux/mhi.h>
> > > +#include <linux/moduleparam.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/sizes.h>
> > > +
> > > +#include "mhi_controller.h"
> > > +#include "qaic.h"
> > > +
> > > +#define MAX_RESET_TIME_SEC 25
> > > +
> > > +static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
> > > +module_param(mhi_timeout_ms, uint, 0600);
> > > +MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
> > > +
> > > +static struct mhi_channel_config aic100_channels[] = {
> > > +	{
> > > +		.name = "QAIC_LOOPBACK",
> > 
> > Why do you need QAIC_ prefix for channel names?
> 
> To avoid existing and anticipated conflicts.
> 
> As you are aware, the channel name becomes critical for the bus device and
> is the key that the consumer driver will probe on.
> 
> Sadly, that is rife for conflicts.  You can only have one driver for a
> particular MHI device (channel).  Multiple drivers can register for it, but
> only the first one will bind to the device.  This creates a race condition.
> Whoever is able to register with the bus first, owns all instances of that
> device.  That also means that particular driver on the bus also needs to be
> able to handle all instances of that device.
> 
> The WWAN subsystem already claims DIAG.  You and I both know from the WWAN
> subsystem creation experience, the Net folks don't want a common framework
> that can service multiple types of devices.  QAIC devices are not WWAN
> devices, and were an argument for having a WWAN specific thing.  So, I can't
> leverage WWAN, and frankly I shouldn't because my device is not a WWAN
> device.  The WWAN userspace shouldn't try to use ACCEL/QAIC devices (one of
> the reasons for having ACCEL instead of DRM).  Therefore DIAG devices are
> WWAN exclusive, and I need to have a different device.  "DIAG2" seems like a
> poor name.  If the QAIC DIAG device is going to be QAIC specific, having
> QAIC in the name to isolate and identify it seems like the best option.
> 
> I anticipate similar conflicts with
> SAHARA/QDSS/DEBUG/TIMESYNC/LOGGING/LOOPBACK.  All of these are "common" with
> other existing MHI devices.
> 

Hmm, this is something I anticipated to happen... :/

> I anticipate future conflicts with STATUS/RAS/TELEMETRY/CONTROL/SSR. These
> are rather generic channel names.  It seems likely that a future WWAN device
> or other MHI device would want a channel with the same name as one of these.
> I'd like to leave that open as a possibility by not exclusivly claiming the
> sole use to one of these names.
> 
> Arguably this is an internal implementation detail with how the MHI bus
> operates and could be fixed at first look.  However I don't think that is
> the case because it looks like the WWAN subsystem is exposing these names to
> userspace, which creates a uAPI that cannot be broken. Therefore I think we
> are rather quite stuck with this situation and what I have proposed with
> this patch is the best thing I've come up with to address the problem.  If
> you have an alternate suggestion, I'm willing to discuss with you.
> 

I think what you have is the best for now. Only downside of this approach is
the code duplication among the client drivers but I think we compromised this
during the WWAN framework discussion.

> > 
> > > +		.num = 0,
> > > +		.num_elements = 32,
> > > +		.local_elements = 0,
> > > +		.event_ring = 0,
> > > +		.dir = DMA_TO_DEVICE,
> > > +		.ee_mask = MHI_CH_EE_AMSS,
> > > +		.pollcfg = 0,
> > > +		.doorbell = MHI_DB_BRST_DISABLE,
> > > +		.lpm_notify = false,
> > > +		.offload_channel = false,
> > > +		.doorbell_mode_switch = false,
> > > +		.auto_queue = false,
> > > +		.wake_capable = false,
> > > +	},
> > 
> > [...]
> > 
> > > +static struct mhi_event_config aic100_events[] = {
> > > +	{
> > > +		.num_elements = 32,
> > > +		.irq_moderation_ms = 0,
> > > +		.irq = 0,
> > > +		.channel = U32_MAX,
> > > +		.priority = 1,
> > > +		.mode = MHI_DB_BRST_DISABLE,
> > > +		.data_type = MHI_ER_CTRL,
> > > +		.hardware_event = false,
> > > +		.client_managed = false,
> > > +		.offload_channel = false,
> > > +	},
> > > +};
> > > +
> > 
> > It'd be nice to use macros for defining the channels and events as done in the
> > pci_generic driver.
> 
> I think the pci_generic driver has a usecase for using a macro in that it is
> servicing multiple devices, with different configuration.  Right now, we
> only have the one device with the one config.  I suspect that will change in
> the future, but I don't have concrete information at the time to inform a
> proper design.
> 
> I feel this should be left until such time the multi-device scenario becomes
> realized.
> 

Ok, this sounds reasonable to me.

> > 
> > > +static struct mhi_controller_config aic100_config = {
> > > +	.max_channels = 128,
> > > +	.timeout_ms = 0, /* controlled by mhi_timeout */
> > > +	.buf_len = 0,
> > > +	.num_channels = ARRAY_SIZE(aic100_channels),
> > > +	.ch_cfg = aic100_channels,
> > > +	.num_events = ARRAY_SIZE(aic100_events),
> > > +	.event_cfg = aic100_events,
> > > +	.use_bounce_buf = false,
> > > +	.m2_no_db = false,
> > > +};
> > > +
> > > +static int mhi_read_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 *out)
> > > +{
> > > +	u32 tmp = readl_relaxed(addr);
> > > +
> > > +	if (tmp == U32_MAX)
> > > +		return -EIO;
> > > +
> > > +	*out = tmp;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void mhi_write_reg(struct mhi_controller *mhi_cntl, void __iomem *addr, u32 val)
> > > +{
> > > +	writel_relaxed(val, addr);
> > > +}
> > > +
> > > +static int mhi_runtime_get(struct mhi_controller *mhi_cntl)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > > +static void mhi_runtime_put(struct mhi_controller *mhi_cntl)
> > > +{
> > > +}
> > > +
> > > +static void mhi_status_cb(struct mhi_controller *mhi_cntl, enum mhi_callback reason)
> > > +{
> > > +	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntl->cntrl_dev));
> > > +
> > > +	/* this event occurs in atomic context */
> > > +	if (reason == MHI_CB_FATAL_ERROR)
> > > +		pci_err(qdev->pdev, "Fatal error received from device. Attempting to recover\n");
> > 
> > Why no dev_err()?
> 
> pci_err is more specific than dev_err.  It is built upon dev_err. pci_err
> seems to be preferred for pci devices, and also matches uses elsewhere in
> the driver.
> 

Ok.

> > 
> > > +	/* this event occurs in non-atomic context */
> > > +	if (reason == MHI_CB_SYS_ERROR)
> > > +		qaic_dev_reset_clean_local_state(qdev, true);
> > > +}
> > > +
> > > +static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntl)
> > > +{
> > > +	char time_sec = 1;
> > 
> > u8?
> 
> Eh.  Ok I guess.  I usually reserve the size specific types for things where
> that size is required, such as sending data over a network.
> 
> > 
> > > +	int current_ee;
> > > +	int ret;
> > > +
> > > +	/* Reset the device to bring the device in PBL EE */
> > > +	mhi_soc_reset(mhi_cntl);
> > > +
> > > +	/*
> > > +	 * Keep checking the execution environment(EE) after every 1 second
> > > +	 * interval.
> > > +	 */
> > > +	do {
> > > +		msleep(1000);
> > > +		current_ee = mhi_get_exec_env(mhi_cntl);
> > > +	} while (current_ee != MHI_EE_PBL && time_sec++ <= MAX_RESET_TIME_SEC);
> > > +
> > > +	/* If the device is in PBL EE retry power up */
> > > +	if (current_ee == MHI_EE_PBL)
> > > +		ret = mhi_async_power_up(mhi_cntl);
> > > +	else
> > > +		ret = -EIO;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> > > +						    int mhi_irq)
> > > +{
> > > +	struct mhi_controller *mhi_cntl;
> > 
> > Cosmetic change: We use "mhi_cntrl" in other controller drivers. So it is
> > better to follow the same pattern here also.
> 
> If you insist.  "cntl" is the more common abbreviation.  The MHI bus is the
> first place I recall seeing "cntrl".
> 

For some reason, all MHI controller drivers have picked up this notation. So
I'd like to keep it same.

> > 
> > > +	int ret;
> > > +
> > > +	mhi_cntl = devm_kzalloc(&pci_dev->dev, sizeof(*mhi_cntl), GFP_KERNEL);
> > > +	if (!mhi_cntl)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	mhi_cntl->cntrl_dev = &pci_dev->dev;
> > > +
> > > +	/*
> > > +	 * Covers the entire possible physical ram region. Remote side is
> > > +	 * going to calculate a size of this range, so subtract 1 to prevent
> > > +	 * rollover.
> > > +	 */
> > > +	mhi_cntl->iova_start = 0;
> > > +	mhi_cntl->iova_stop = PHYS_ADDR_MAX - 1;
> > > +	mhi_cntl->status_cb = mhi_status_cb;
> > > +	mhi_cntl->runtime_get = mhi_runtime_get;
> > > +	mhi_cntl->runtime_put = mhi_runtime_put;
> > > +	mhi_cntl->read_reg = mhi_read_reg;
> > > +	mhi_cntl->write_reg = mhi_write_reg;
> > > +	mhi_cntl->regs = mhi_bar;
> > > +	mhi_cntl->reg_len = SZ_4K;
> > 
> > Is this size fixed for all AIC100 revisions? I think you should get this value
> > from pci_resource_len() to avoid issues later.
> 
> Yes, this size is burned into the silicon with no provision for ever
> changing it.
> 

Fine then!

Thanks,
Mani

> > 
> > Thanks,
> > Mani
> > 
> > > +	mhi_cntl->nr_irqs = 1;
> > > +	mhi_cntl->irq = devm_kmalloc(&pci_dev->dev, sizeof(*mhi_cntl->irq), GFP_KERNEL);
> > > +
> > > +	if (!mhi_cntl->irq)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	mhi_cntl->irq[0] = mhi_irq;
> > > +	mhi_cntl->fw_image = "qcom/aic100/sbl.bin";
> > > +
> > > +	/* use latest configured timeout */
> > > +	aic100_config.timeout_ms = mhi_timeout_ms;
> > > +	ret = mhi_register_controller(mhi_cntl, &aic100_config);
> > > +	if (ret) {
> > > +		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
> > > +		return ERR_PTR(ret);
> > > +	}
> > > +
> > > +	ret = mhi_prepare_for_power_up(mhi_cntl);
> > > +	if (ret) {
> > > +		pci_err(pci_dev, "mhi_prepare_for_power_up failed %d\n", ret);
> > > +		goto prepare_power_up_fail;
> > > +	}
> > > +
> > > +	ret = mhi_async_power_up(mhi_cntl);
> > > +	/*
> > > +	 * If EIO is returned it is possible that device is in SBL EE, which is
> > > +	 * undesired. SOC reset the device and try to power up again.
> > > +	 */
> > > +	if (ret == -EIO && MHI_EE_SBL == mhi_get_exec_env(mhi_cntl)) {
> > > +		pci_err(pci_dev, "Found device in SBL at MHI init. Attempting a reset.\n");
> > > +		ret = mhi_reset_and_async_power_up(mhi_cntl);
> > > +	}
> > > +
> > > +	if (ret) {
> > > +		pci_err(pci_dev, "mhi_async_power_up failed %d\n", ret);
> > > +		goto power_up_fail;
> > > +	}
> > > +
> > > +	return mhi_cntl;
> > > +
> > > +power_up_fail:
> > > +	mhi_unprepare_after_power_down(mhi_cntl);
> > > +prepare_power_up_fail:
> > > +	mhi_unregister_controller(mhi_cntl);
> > > +	return ERR_PTR(ret);
> > > +}
> > > +
> > > +void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up)
> > > +{
> > > +	mhi_power_down(mhi_cntl, link_up);
> > > +	mhi_unprepare_after_power_down(mhi_cntl);
> > > +	mhi_unregister_controller(mhi_cntl);
> > > +}
> > > +
> > > +void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl)
> > > +{
> > > +	mhi_power_down(mhi_cntl, true);
> > > +}
> > > +
> > > +void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl)
> > > +{
> > > +	struct pci_dev *pci_dev = container_of(mhi_cntl->cntrl_dev, struct pci_dev, dev);
> > > +	int ret;
> > > +
> > > +	ret = mhi_async_power_up(mhi_cntl);
> > > +	if (ret)
> > > +		pci_err(pci_dev, "mhi_async_power_up failed after reset %d\n", ret);
> > > +}
> > > diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
> > > new file mode 100644
> > > index 0000000..c105e93
> > > --- /dev/null
> > > +++ b/drivers/accel/qaic/mhi_controller.h
> > > @@ -0,0 +1,16 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only
> > > + *
> > > + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> > > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +
> > > +#ifndef MHICONTROLLERQAIC_H_
> > > +#define MHICONTROLLERQAIC_H_
> > > +
> > > +struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> > > +						    int mhi_irq);
> > > +void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up);
> > > +void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl);
> > > +void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl);
> > > +
> > > +#endif /* MHICONTROLLERQAIC_H_ */
> > > -- 
> > > 2.7.4
> > > 
> > 
> 

-- 
மணிவண்ணன் சதாசிவம்
