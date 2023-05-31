Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD62F7186E4
	for <lists+linux-doc@lfdr.de>; Wed, 31 May 2023 17:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbjEaP7T convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-doc@lfdr.de>); Wed, 31 May 2023 11:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234479AbjEaP7R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 May 2023 11:59:17 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7011CB3;
        Wed, 31 May 2023 08:59:12 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QWYn36pMtz67Gvv;
        Wed, 31 May 2023 23:57:27 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 31 May
 2023 16:59:09 +0100
Date:   Wed, 31 May 2023 16:59:08 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Junhao He <hejunhao3@huawei.com>
CC:     <will@kernel.org>, <linux-kernel@vger.kernel.org>,
        <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
        <yangyicong@huawei.com>, <shenyang39@huawei.com>,
        <prime.zeng@hisilicon.com>
Subject: Re: [PATCH v2 2/3] drivers/perf: hisi: Add support for HiSilicon UC
 PMU driver
Message-ID: <20230531165908.000022b0@Huawei.com>
In-Reply-To: <20230531104625.18296-3-hejunhao3@huawei.com>
References: <20230531104625.18296-1-hejunhao3@huawei.com>
        <20230531104625.18296-3-hejunhao3@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 31 May 2023 18:46:24 +0800
Junhao He <hejunhao3@huawei.com> wrote:

Hi Junhao,

A few small comments inline.

> On HiSilicon Hip09 platform, there is a UC (unified cache) module
> on each chip SCCL (Super CPU Cluster). UC is a cache that provides
> coherence between NUMA and UMA domains. It is located between L2
> and Memory System. While PA uncore PMU model is the same as other
> Hip09 PMU modules and many PMU events are supported. 

I don't follow what this sentence means.  Normally you'd have
While A, B is different..


> Let's support
> the PMU driver using the HiSilicon uncore PMU framework.
> 
> * rd_req_en : rd_req_en is the abbreviation of read request tracetag enable
> and allows user to count only read operations.
> details are listed in the hisi-pmu document.
Details are .. Also no need for the ine break
  and allows user to count only read operations. Details are listed
  in the hisi-pmu document at ....

> 
> * srcid_en & srcid: allows user to filter statistics that come from

Allows
for consistency with the uring_channel description that follows.

> specific CPU/ICL by configuration source ID.
> 
> * uring_channel: Allows users to filter statistical information based on
> the specified tx request uring channel.
> uring_channel only supported events: [0x47 ~ 0x59].
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>


> diff --git a/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
> new file mode 100644
> index 000000000000..d27f28584fd7
> --- /dev/null
> +++ b/drivers/perf/hisilicon/hisi_uncore_uc_pmu.c
> @@ -0,0 +1,577 @@
...




> +static int hisi_uc_pmu_init_data(struct platform_device *pdev,
> +				 struct hisi_pmu *uc_pmu)
> +{
> +	/*
> +	 * Use SCCL (Super CPU Cluster) ID and CCL (CPU Cluster) ID to
> +	 * identify the topology information of UC PMU devices in the chip.
> +	 */

From patch description, I'd assume there is only one of these
per sccl so why do we care about the cluster level or the sub-id?
Perhaps that description is missleading?

> +	if (device_property_read_u32(&pdev->dev, "hisilicon,scl-id",
> +				     &uc_pmu->sccl_id)) {
> +		dev_err(&pdev->dev, "Can not read uc sccl-id!\n");
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_u32(&pdev->dev, "hisilicon,ccl-id",
> +				     &uc_pmu->ccl_id)) {
> +		dev_err(&pdev->dev, "Can not read uc ccl-id!\n");
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_u32(&pdev->dev, "hisilicon,sub-id",
> +				     &uc_pmu->sub_id)) {
> +		dev_err(&pdev->dev, "Can not read sub-id!\n");
> +		return -EINVAL;
> +	}
> +
> +	uc_pmu->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(uc_pmu->base)) {
> +		dev_err(&pdev->dev, "ioremap failed for uc_pmu resource\n");
> +		return PTR_ERR(uc_pmu->base);
> +	}
> +
> +	uc_pmu->identifier = readl(uc_pmu->base + HISI_UC_VERSION_REG);
> +
> +	return 0;
> +}


> +static struct platform_driver hisi_uc_pmu_driver = {
> +	.driver = {
> +		.name = "hisi_uc_pmu",
> +		.acpi_match_table = hisi_uc_pmu_acpi_match,
> +		/*
> +		 * We have not worked out a safe bind/unbind process,
> +		 * so this is not supported yet.

If you can reference more info on this that would be great.
Perhaps a thread talking about why?

> +		 */
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = hisi_uc_pmu_probe,
> +};
