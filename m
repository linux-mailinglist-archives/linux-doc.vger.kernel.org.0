Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3EA314093
	for <lists+linux-doc@lfdr.de>; Mon,  8 Feb 2021 21:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhBHUfA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Feb 2021 15:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232237AbhBHUeE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 15:34:04 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15710C061786
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 12:33:24 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id b145so10463420pfb.4
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 12:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8sJIQ7ey27vDjxSf7LzfXss7hIpoO6CjdEZcKguBnkA=;
        b=h3RNQULLGURi8yuzfdjwbFZqCfrh+rDTOBd9SBVVDSi9380NzoAY0IFRRzxT+Gp7y0
         EyUSBW/+WypeEPREZYoNZd2lWpVhxNKpVcCKjRXJDy7McP9CkyzOM6HBCjZWWWpYXS95
         WZbMRqcZj2na+9d8O1/A54CDB7d/mwskrmZ6MCkIAXTs2va5ZiT5AzEwXftCyAVd9OU1
         uRUB5KAUAkgXY19O0H1r3OJG7ORX8REnyZnSqTOhpg7Djnj43vDov/Pot4R1bUP4UkZ2
         HOBXQKQitSA4BI5I8XV9EvZMOTofQchX/xotG2WLNWAa/AjC0V4enhyDURX+u+A3yW8y
         tB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8sJIQ7ey27vDjxSf7LzfXss7hIpoO6CjdEZcKguBnkA=;
        b=SFba1BkjTRcpfsKMFFIljsJSj90r9MlQFYfJS7LYPXwvlEhuGOMiXxPcvK81O7+aQ+
         LlJ8JqqJ4lMu3Knr5RJvbrsWq3DgY4sPx8qXgMIOqAtMHOVAjmZQKzH9DZJAsFlWq8e5
         M/I+nCYAXHK7f/0NIFqb/0dA6DUnHk+C0DdIi+6OPdsRurEyWU4VkaUOGIsbZB/AGXYI
         xND4poENxKtPoQRdUbR2yMeQY6k3qlVAzO1Sv9X2Do9pA+0NIuvgi1mUVBBifoIqGH6o
         kjJRcaBYT6FHXo2T/mD0CxNvuVNJWNMZ49IXUjbge6zQeSyBeSQtsWK78Ql9qKgaODZJ
         s97A==
X-Gm-Message-State: AOAM531fuEjYbVVtU2HJY7VIxhwdv/x5qgDhYbq9SgsVLzafza5mSaui
        ir37nX4MRNtTLERgb0Mr8AL2zQ==
X-Google-Smtp-Source: ABdhPJwZWqP1nruXuIblgbD06iE4nLs4M/qFajWrDEpl8V+m7W81StVvNA6e1oO24SKw+JDHL5P7BQ==
X-Received: by 2002:a63:7c5:: with SMTP id 188mr18525532pgh.22.1612816403603;
        Mon, 08 Feb 2021 12:33:23 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 143sm130781pfw.3.2021.02.08.12.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 12:33:23 -0800 (PST)
Date:   Mon, 8 Feb 2021 13:33:20 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Al Grant <al.grant@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/8] perf cs-etm: Detect pid in VMID for kernel
 running at EL2
Message-ID: <20210208203320.GD2077938@xps15>
References: <20210206150833.42120-1-leo.yan@linaro.org>
 <20210206150833.42120-8-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206150833.42120-8-leo.yan@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 06, 2021 at 11:08:32PM +0800, Leo Yan wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> The PID of the task could be traced as VMID when the kernel is running
> at EL2.  Teach the decoder to look for VMID when the CONTEXTIDR (Arm32)
> or CONTEXTIDR_EL1 (Arm64) is invalid but we have a valid VMID.
> 
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Al Grant <al.grant@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Co-developed-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  .../perf/util/cs-etm-decoder/cs-etm-decoder.c | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> index 3f4bc4050477..4052c9ce6e2f 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -6,6 +6,7 @@
>   * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
>   */
>  
> +#include <linux/coresight-pmu.h>
>  #include <linux/err.h>
>  #include <linux/list.h>
>  #include <linux/zalloc.h>
> @@ -491,13 +492,42 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
>  			const ocsd_generic_trace_elem *elem,
>  			const uint8_t trace_chan_id)
>  {
> -	pid_t tid;
> +	pid_t tid = -1;
> +	static u64 pid_fmt;
> +	int ret;
>  
> -	/* Ignore PE_CONTEXT packets that don't have a valid contextID */
> -	if (!elem->context.ctxt_id_valid)
> +	/*
> +	 * As all the ETMs run at the same exception level, the system should
> +	 * have the same PID format crossing CPUs.  So cache the PID format
> +	 * and reuse it for sequential decoding.
> +	 */
> +	if (!pid_fmt) {
> +		ret = cs_etm__get_pid_fmt(trace_chan_id, &pid_fmt);
> +		if (ret)
> +			return OCSD_RESP_FATAL_SYS_ERR;
> +	}
> +
> +	/*
> +	 * Process the PE_CONTEXT packets if we have a valid contextID or VMID.
> +	 * If the kernel is running at EL2, the PID is traced in CONTEXTIDR_EL2
> +	 * as VMID, Bit ETM_OPT_CTXTID2 is set in this case.
> +	 */
> +	switch (pid_fmt) {
> +	case BIT(ETM_OPT_CTXTID):
> +		if (elem->context.ctxt_id_valid)
> +			tid = elem->context.context_id;
> +		break;
> +	case BIT(ETM_OPT_CTXTID2):
> +		if (elem->context.vmid_valid)
> +			tid = elem->context.vmid;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (tid == -1)
>  		return OCSD_RESP_CONT;
>  
> -	tid =  elem->context.context_id;
>  	if (cs_etm__etmq_set_tid(etmq, tid, trace_chan_id))
>  		return OCSD_RESP_FATAL_SYS_ERR;
>  
> -- 
> 2.25.1
> 
