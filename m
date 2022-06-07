Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD5253F8DA
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jun 2022 10:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbiFGI4N (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Jun 2022 04:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236629AbiFGI4L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jun 2022 04:56:11 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E13D7715;
        Tue,  7 Jun 2022 01:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654592170; x=1686128170;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TNjuxlNqjf4QqyCj82B4tS5ErRzaVWZCJ6/e6HR0xyA=;
  b=WDQSf84AAhZW3WdNkCBW4Q//0GzpuCpCaaR9wX0Pl4J6Lf3xDSUfgFdr
   HSJ5jR7EMWGo7+mo8ZhsnawV0JD2d82yyUIcotau3Gyl3MgW3Bc1almYt
   EdFltooZJcgCRKs/OG+w/8M8MVYVSXDMweHkPiI2m7BmrfiF92iDDhIvk
   N56UuNg/k6DWZ/8/QZ2VnAbXYb883580+7PkmUGOn/voSi2tCxFEFWK3X
   ep4ZDCMq+wxCL0L2ItC+ukKxYQgZCC8jt0KP912lqslAgf+rndE/69Ryi
   yGqaIU/YMlAZmdEugdp9pasWLmg/AKAyEt0+F6WAr62RQ9DP0ROBlQket
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="302075521"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="302075521"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 01:56:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="636033838"
Received: from bdgardin-mobl1.ger.corp.intel.com (HELO [10.213.217.225]) ([10.213.217.225])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 01:56:06 -0700
Message-ID: <8559b6f0-0322-9232-7000-534087e786fe@linux.intel.com>
Date:   Tue, 7 Jun 2022 09:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] drm/msm: Expose client engine utilization via
 fdinfo
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220606195432.1888346-1-robdclark@gmail.com>
 <20220606195432.1888346-2-robdclark@gmail.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220606195432.1888346-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 06/06/2022 20:54, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Similar to AMD commit
> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
> infrastructure added in previous patches, we add basic client info
> and GPU engine utilisation for msm.
> 
> Example output:
> 
> 	# cat /proc/`pgrep glmark2`/fdinfo/6
> 	pos:	0
> 	flags:	02400002
> 	mnt_id:	21
> 	ino:	162
> 	drm-driver:	msm
> 	drm-client-id:	7
> 	drm-engine-gpu:	1734371319 ns
> 	drm-cycles-gpu:	1153645024
> 	drm-maxfreq-gpu:	800000000 Hz
> 
> See also: https://patchwork.freedesktop.org/patch/468505/
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.c         | 19 ++++++++++++++++++-
>   drivers/gpu/drm/msm/msm_gpu.c         | 21 +++++++++++++++++++--
>   drivers/gpu/drm/msm/msm_gpu.h         | 19 +++++++++++++++++++
>   4 files changed, 77 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 6c9f166a8d6f..60e5cc9c13ad 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
>   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>   indicating kibi- or mebi-bytes.
>   
> +- drm-cycles-<str> <uint>
> +
> +Engine identifier string must be the same as the one specified in the
> +drm-engine-<str> tag and shall contain the number of busy cycles for the given
> +engine.
> +
> +Values are not required to be constantly monotonic if it makes the driver
> +implementation easier, but are required to catch up with the previously reported
> +larger value within a reasonable period. Upon observing a value lower than what
> +was previously read, userspace is expected to stay with that larger previous
> +value until a monotonic update is seen.
> +
> +- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
> +
> +Engine identifier string must be the same as the one specified in the
> +drm-engine-<str> tag and shall contain the maxium frequence for the given

maximum frequency

> +engine.  Taken together with drm-cycles-<str>, this can be used to calculate
> +percentage utilization of the engine, whereas drm-engine-<str> only refects

reflects

> +time active without considering what frequency the engine is operating as a
> +percentage of it's maximum frequency.

Cycles vs max freq sounds very useful. My reservations is that how come 
the idea hasn't happened in the CPU world. Or maybe it has and I am 
un-informed?

In any case, if going with this I think we need to clarify the text that 
the value should reflect the current soft limit, where the driver 
supports that, in case it has been set to lower than the maximum 
frequency hardware can support. I am thinking about avoiding "my gpu 
cannot hit 100%" support incidents in cases when user/admin lowered the 
soft limit for some reason. Possibly does not apply to msm but can apply 
to i915, if we decided to export the same data.

No other gotchas come to mind at the moment.

Regards,

Tvrtko

> +
>   ===============================
>   Driver specific implementations
>   ===============================
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 14ab9a627d8b..57a66093e671 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -948,7 +948,24 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
>   };
>   
> -DEFINE_DRM_GEM_FOPS(fops);
> +static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +	struct drm_file *file = f->private_data;
> +	struct drm_device *dev = file->minor->dev;
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	if (!priv->gpu)
> +		return;
> +
> +	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
> +}
> +
> +static const struct file_operations fops = {
> +	.owner = THIS_MODULE,
> +	DRM_GEM_FOPS,
> +	.show_fdinfo = msm_fop_show_fdinfo,
> +};
>   
>   static const struct drm_driver msm_driver = {
>   	.driver_features    = DRIVER_GEM |
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index eb8a6663f309..333a9a299b41 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -4,6 +4,8 @@
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
>   
> +#include "drm/drm_drv.h"
> +
>   #include "msm_gpu.h"
>   #include "msm_gem.h"
>   #include "msm_mmu.h"
> @@ -146,6 +148,16 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
>   	return 0;
>   }
>   
> +void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
> +			 struct drm_printer *p)
> +{
> +	drm_printf(p, "drm-driver:\t%s\n", gpu->dev->driver->name);
> +	drm_printf(p, "drm-client-id:\t%u\n", ctx->seqno);
> +	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
> +	drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
> +	drm_printf(p, "drm-maxfreq-gpu:\t%lu Hz\n", gpu->fast_rate);
> +}
> +
>   int msm_gpu_hw_init(struct msm_gpu *gpu)
>   {
>   	int ret;
> @@ -652,7 +664,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   {
>   	int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
>   	volatile struct msm_gpu_submit_stats *stats;
> -	u64 elapsed, clock = 0;
> +	u64 elapsed, clock = 0, cycles;
>   	unsigned long flags;
>   
>   	stats = &ring->memptrs->stats[index];
> @@ -660,12 +672,17 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   	elapsed = (stats->alwayson_end - stats->alwayson_start) * 10000;
>   	do_div(elapsed, 192);
>   
> +	cycles = stats->cpcycles_end - stats->cpcycles_start;
> +
>   	/* Calculate the clock frequency from the number of CP cycles */
>   	if (elapsed) {
> -		clock = (stats->cpcycles_end - stats->cpcycles_start) * 1000;
> +		clock = cycles * 1000;
>   		do_div(clock, elapsed);
>   	}
>   
> +	submit->queue->ctx->elapsed_ns += elapsed;
> +	submit->queue->ctx->cycles     += cycles;
> +
>   	trace_msm_gpu_submit_retired(submit, elapsed, clock,
>   		stats->alwayson_start, stats->alwayson_end);
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 6def00883046..4911943ba53b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -361,6 +361,22 @@ struct msm_file_private {
>   	/** cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE */
>   	char *cmdline;
>   
> +	/**
> +	 * elapsed:
> +	 *
> +	 * The total (cumulative) elapsed time GPU was busy with rendering
> +	 * from this context in ns.
> +	 */
> +	uint64_t elapsed_ns;
> +
> +	/**
> +	 * cycles:
> +	 *
> +	 * The total (cumulative) GPU cycles elapsed attributed to this
> +	 * context.
> +	 */
> +	uint64_t cycles;
> +
>   	/**
>   	 * entities:
>   	 *
> @@ -544,6 +560,9 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
>   int msm_gpu_pm_suspend(struct msm_gpu *gpu);
>   int msm_gpu_pm_resume(struct msm_gpu *gpu);
>   
> +void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
> +			 struct drm_printer *p);
> +
>   int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
>   struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
>   		u32 id);
