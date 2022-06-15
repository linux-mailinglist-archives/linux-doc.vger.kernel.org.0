Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B15B54C8D0
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jun 2022 14:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348884AbiFOMoe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Jun 2022 08:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348880AbiFOMoV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 08:44:21 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EBA3EB9D
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 05:44:19 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id g2so13128372ljk.5
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=u1z8ewH9twrYjIuKxjz6km+1YgvAUwQA4rxgSTCF6ns=;
        b=PkHxUVrTWFqZd50er9QT/K67+UOAQZslg9eN16KjDHX/QpeYSZSNyFA2YT+Hl7r/yR
         /dhUpPRUUYrznisBw0F44p7I1FxDE+4d7Vh7tny4RzPU0JyRPBv76c5qkzGfNr+4StMs
         rtbjJFL9+3/BSEP3gtBW4vcr4HRWHqlDLC2dpjsxjGva06wo5GcMkZ/05hH6fSK1pDzc
         YOSbWBSOYTDNhdFHxPFYYuhJ6xBxzHX2jBj+ly4EUWrxu6iWOhkNsGLJbaVQuQqVWXLk
         44la15iM3anCDS6KbmL+ZCAjTPyncckaN7Gqg6k3rJ/C30cqAhY1Ba8uhT0UDhUYfbMv
         o9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=u1z8ewH9twrYjIuKxjz6km+1YgvAUwQA4rxgSTCF6ns=;
        b=UeAEs6rUELqAWY/sfKypdfCgRpRcePNm7KpWtU7H7/owVF/+EaVT26kZul8PIUHOp2
         2CrZKyU+6E59mtDevsXEhN9BZsvzIqKDZPw+s1RKtaSZxJMInrfzRz4o/TFKccUQpdJo
         XAwbYrRz1HOU51lxuMpp3Uwde9cpxRM0Jx9lYB/Am47BEIKb3eLkDzlRHThXjeEnZ2t1
         26oNJO17c0F20IvMZGtSlRpAKwo9r2+r/FwQPUVLHuCw2gPu6ziIduMfrEXxxx/cXRbk
         U5qydZdqxaS0cXRChOOLlJzAs6pR3U7pQpHnzvhRZ3sz+whjuCMW+EKni7ctr7bm3rgG
         Dz7A==
X-Gm-Message-State: AJIora9z6SvVTIFmA5NX8eG6U423Jh/deOFpOr/LdQMcHVSxgLzulSxW
        IH85GXVHPZZKOHrDbZ1FzRB8iA==
X-Google-Smtp-Source: AGRyM1u08Oq2tHefeTz5JnQOzos0N8jotQr1JQouoLzFOrPMZzUFTE6v1Y9Vbn2sFKX2kcSnVednYA==
X-Received: by 2002:a2e:87c8:0:b0:255:6d59:ebce with SMTP id v8-20020a2e87c8000000b002556d59ebcemr4918316ljj.455.1655297058156;
        Wed, 15 Jun 2022 05:44:18 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j11-20020a05651231cb00b004790506cf98sm1781254lfe.303.2022.06.15.05.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 05:44:17 -0700 (PDT)
Message-ID: <d8301ad6-104f-e959-9843-a220526a6650@linaro.org>
Date:   Wed, 15 Jun 2022 15:44:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/2] drm/msm: Expose client engine utilization via
 fdinfo
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Chris Healy <cphealy@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220609174213.2265938-1-robdclark@gmail.com>
 <20220609174213.2265938-2-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220609174213.2265938-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/06/2022 20:42, Rob Clark wrote:
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
> v2: Add dev-maxfreq-$engine and update drm-usage-stats.rst
> v3: spelling and compiler warning
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   Documentation/gpu/drm-usage-stats.rst | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.c         | 19 ++++++++++++++++++-
>   drivers/gpu/drm/msm/msm_gpu.c         | 21 +++++++++++++++++++--
>   drivers/gpu/drm/msm/msm_gpu.h         | 19 +++++++++++++++++++
>   4 files changed, 77 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 6c9f166a8d6f..92c5117368d7 100644
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
> +drm-engine-<str> tag and shall contain the maximum frequency for the given
> +engine.  Taken together with drm-cycles-<str>, this can be used to calculate
> +percentage utilization of the engine, whereas drm-engine-<str> only reflects
> +time active without considering what frequency the engine is operating as a
> +percentage of it's maximum frequency.
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
> index 244511f85044..f99292eaf529 100644
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
> +	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
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


-- 
With best wishes
Dmitry
