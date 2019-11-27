Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D916810B5DE
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2019 19:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfK0SkU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Nov 2019 13:40:20 -0500
Received: from foss.arm.com ([217.140.110.172]:51658 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbfK0SkU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 27 Nov 2019 13:40:20 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72E0F31B;
        Wed, 27 Nov 2019 10:40:19 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A46543F6C4;
        Wed, 27 Nov 2019 10:40:18 -0800 (PST)
Subject: Re: [PATCH v5 04/14] coresight: cti: Add sysfs trigger / channel
 programming API
To:     Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-5-mike.leach@linaro.org>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <ce6d3334-2baf-0528-33a1-0157a8ad0c57@arm.com>
Date:   Wed, 27 Nov 2019 18:40:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191119231912.12768-5-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/11/2019 23:19, Mike Leach wrote:
> Adds a user API to allow programming of CTI by trigger ID and
> channel number. This will take the channel and trigger ID supplied
> by the user and program the appropriate register values.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---

> +
> +static ssize_t chan_xtrigs_view_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	struct cti_config *cfg = &drvdata->config;
> +	int used = 0, reg_idx;
> +	int buf_sz = PAGE_SIZE;
> +	u32 chan_mask = BIT(cfg->xtrig_rchan_sel);
> +
> +	used += scnprintf(buf, buf_sz, "[%d] IN: ", cfg->xtrig_rchan_sel);
> +	for (reg_idx = 0;
> +	     reg_idx < drvdata->config.nr_trig_max;
> +	     reg_idx++) {
> +		if (chan_mask & cfg->ctiinen[reg_idx]) {
> +			used += scnprintf(buf + used, buf_sz - used, "%d ",
> +					  reg_idx);
> +		}
> +	}

As a security measure, we must make sure that we have space left in the
buffer. We could end up passing "negative" numbers for the size
argument, in the worst case.

> +
> +	used += scnprintf(buf + used, buf_sz - used, "OUT: ");
> +	for (reg_idx = 0;
> +	     reg_idx < drvdata->config.nr_trig_max;
> +	     reg_idx++) {
> +		if (chan_mask & cfg->ctiouten[reg_idx]) {
> +			used += scnprintf(buf + used, buf_sz - used, "%d ",
> +					  reg_idx);
> +		}
> +	}
> +	used += scnprintf(buf + used, buf_sz - used, "\n");
> +	return used;
> +}
> +static DEVICE_ATTR_RW(chan_xtrigs_view);


The rest looks fine to me.

Suzuki
