Return-Path: <linux-doc+bounces-41994-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86999A77B51
	for <lists+linux-doc@lfdr.de>; Tue,  1 Apr 2025 14:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 513597A3088
	for <lists+linux-doc@lfdr.de>; Tue,  1 Apr 2025 12:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11321F0E29;
	Tue,  1 Apr 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVaoi1nA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0D202F9D
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511865; cv=none; b=bX3RJOWo0jRRmZ0Ngmqg7RjVjVtlmaJ26xZR65rAebTkAcnmJRDP+0Rq/B0MlieJZ2xEt+QsJvnSvEJce5NGls2DHxBrrv584zTKnp/eMkd/v2TZ2w7HCkzdCJSgDh/ttx50mtDp11u3UD54eO988S/O/jPyIS2KswTrHZER9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511865; c=relaxed/simple;
	bh=ZOFsi3litqhCgJS1jihO7XF23Gp1ddwfq7GOwxxIK5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9eUEAjXY98D3QA5BlcTeLk569wVUhNtogiduWHxsiQQq8OLaL1emSoKYyYIqXqtepRwdHnK32Nuw7JTNAGxHk+AEK0IfxMyVLg2VEDDxSwq7yUzuzUFfaVs7z43HlZn37a38IDGBFRG8hAIks0PcAKchMSeB5SwKmGkHs1uUlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVaoi1nA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224171d6826so80856805ad.3
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743511863; x=1744116663; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yn6iujXamPOMTSSX+tFE3E9MwwaCnXbxRAwBn2smIRI=;
        b=wVaoi1nAJ+7GZPu8/AIPFolXYuzlFaG2ukGsF1aFUlnfooIw8wi1DVN+H7EyOcpVM0
         a2JVf+fYwmyZ3SAMFvbK1cQ08OGqBfi8Ae6Jb5q52wZswBiGomPhOotPBgPxA9Fc2a2q
         NPBD8A0VrCGLUdfh56Mfi4AGdqp9w0MjvraRy+kTA9kciRslsu30eR7nIidWkAg4TFbF
         DO1LF++BCYkH9zt8hrmZypCM4NFJUM9tb586plobcqpyk5pQFKS+NYcefN6iBDE3EANE
         9DXQdWUR0TQo/XuEr/o4Ad+3rHowwKimKM5vBo7UJBY0Ew6M3K+Y91z1f+tYsELeYUHU
         D3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511863; x=1744116663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yn6iujXamPOMTSSX+tFE3E9MwwaCnXbxRAwBn2smIRI=;
        b=gNZZSJ3c76Ct0J10PUXqxmmvAR3i6R/EjLgNUHwi2XP+caz0MSl7bhl2zlMa0HCOyF
         Ay4PAdeoWTADtA6+OUPthuuRDM3RGYs42DzY5eOMmUSiPjnoVppRRY1bU/8bh8vwyvjA
         p2x0CtRblV+dZHmbpyq8Rnzt3EtYQCvpUloc4dHUjVmZqQtZAyNFT31kWKTyOSDApTEm
         1txYiR0aI6E6ooGyF/MZ8dcH8Tl8smXEmAjACvkdzP22iP3vrGU6NFy491Evs+iDD2JA
         EcSLVH3k0kuRInmc7Ovi7IGcmG7O6YjMz8rxwRHeHewa0LFcQeK2hA6r0YRtitwNvwGb
         Wg8A==
X-Forwarded-Encrypted: i=1; AJvYcCUHgvnsL/LYhy4veVsgfOHpXNB/hi4XZEyTe7dNbprhoCv5cFxP4RAMVZlsl39tZBR0tVbdYlBAZdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBiaD7gUOjyttq5DJtjt8H2/whhrYURiQ/g357kvlkW3aG6Dyx
	rCo27ANN89EZvJ54hGTeQoQ9Rcmn7Sq+ruv108CESnjrMoL2rclEtJWm+quF2mTZUlsW/KjYhr2
	Pg/N21JJF9cRfz1zRJC82Ohgt5q3nU8sD6A9vpQ==
X-Gm-Gg: ASbGncsVskakjZTp4CS5nTw7+KLAfepAA5Mc1F+H/JyHamTcKdcmK+Dbt+h9hQQVhj4
	bp3ne9poMqRY4AcpHNs4rcLVOTBd7yXCOQGN94rAAmW0jjEwBELz3WA+TYMMdYVLuEXu6Tbh8d2
	YJlSvmNiKj9cCkXlaHyznyM8vRq1hoXEvRegAG0g==
X-Google-Smtp-Source: AGHT+IGJ4D6WlyWRmXCY7tI860Hkqd5R2026ZqBanuazeSj4V5Z2viAo41F6x1U8U43Rxn2+DKU1Wn2n4dsVbHHsNpQ=
X-Received: by 2002:a05:6a00:2383:b0:736:34a2:8a18 with SMTP id
 d2e1a72fcca58-7398044db06mr16843430b3a.24.1743511863245; Tue, 01 Apr 2025
 05:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-5-leo.yan@arm.com>
In-Reply-To: <20250311170451.611389-5-leo.yan@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 13:50:52 +0100
X-Gm-Features: AQ5f1JrG6rHLtjrc-40BATWpK-5ZTpp_JctZAVhjYGTU8Y716TkHgEMEmzg3WSs
Message-ID: <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] coresight: perf: Support AUX trace pause and resume
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Leo,

On Tue, 11 Mar 2025 at 17:05, Leo Yan <leo.yan@arm.com> wrote:
>
> This commit supports AUX trace pause and resume in a perf session for
> Arm CoreSight.
>
> First, we need to decide which flag can indicate the CoreSight PMU event
> has started.  The 'event->hw.state' cannot be used for this purpose
> because its initial value and the value after hardware trace enabling
> are both 0.
>
> On the other hand, the context value 'ctxt->event_data' stores the ETM
> private info.  This pointer is valid only when the PMU event has been
> enabled. It is safe to permit AUX trace pause and resume operations only
> when it is not a NULL pointer.
>
> To achieve fine-grained control of the pause and resume, only the tracer
> is disabled and enabled.  This avoids the unnecessary complexity and
> latency caused by manipulating the entire link path.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  .../hwtracing/coresight/coresight-etm-perf.c  | 45 ++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f4cccd68e625..2dcf1809cb7f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -365,6 +365,18 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>                         continue;
>                 }
>
> +               /*
> +                * If AUX pause feature is enabled but the ETM driver does not
> +                * support the operations, clear this CPU from the mask and
> +                * continue to next one.
> +                */
> +               if (event->attr.aux_start_paused &&
> +                   (!source_ops(csdev)->pause_perf || !source_ops(csdev)->resume_perf)) {
> +                       dev_err_once(&csdev->dev, "AUX pause is not supported.\n");
> +                       cpumask_clear_cpu(cpu, mask);
> +                       continue;
> +               }
> +
>                 /*
>                  * No sink provided - look for a default sink for all the ETMs,
>                  * where this event can be scheduled.
> @@ -450,6 +462,15 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>         goto out;
>  }
>
> +static int etm_event_resume(struct coresight_device *csdev,
> +                            struct etm_ctxt *ctxt)
> +{
> +       if (!ctxt->event_data)
> +               return 0;
> +
> +       return coresight_resume_source(csdev);
> +}
> +
>  static void etm_event_start(struct perf_event *event, int flags)
>  {
>         int cpu = smp_processor_id();
> @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
>         if (!csdev)
>                 goto fail;
>

Is it possible here that the first call to etm_event_start() also has
the PERF_EF_RESUME flag set?
If so it looks like we need to fall through and do a "normal" start to
get all the ctxt->event_data set up.

> +       if (flags & PERF_EF_RESUME) {
> +               if (etm_event_resume(csdev, ctxt) < 0) {
> +                       dev_err(&csdev->dev, "Failed to resume ETM event.\n");
> +                       goto fail;
> +               }
> +               return;
> +       }
> +
>         /* Have we messed up our tracking ? */
>         if (WARN_ON(ctxt->event_data))
>                 goto fail;
> @@ -545,6 +574,16 @@ static void etm_event_start(struct perf_event *event, int flags)
>         return;
>  }
>
> +static void etm_event_pause(struct coresight_device *csdev,
> +                           struct etm_ctxt *ctxt)
> +{
> +       if (!ctxt->event_data)
> +               return;
> +
> +       /* Stop tracer */
> +       coresight_pause_source(csdev);
> +}
> +
>  static void etm_event_stop(struct perf_event *event, int mode)
>  {
>         int cpu = smp_processor_id();
> @@ -555,6 +594,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
>         struct etm_event_data *event_data;
>         struct coresight_path *path;
>
> +       if (mode & PERF_EF_PAUSE)
> +               return etm_event_pause(csdev, ctxt);
> +
>         /*
>          * If we still have access to the event_data via handle,
>          * confirm that we haven't messed up the tracking.
> @@ -899,7 +941,8 @@ int __init etm_perf_init(void)
>         int ret;
>
>         etm_pmu.capabilities            = (PERF_PMU_CAP_EXCLUSIVE |
> -                                          PERF_PMU_CAP_ITRACE);
> +                                          PERF_PMU_CAP_ITRACE |
> +                                          PERF_PMU_CAP_AUX_PAUSE);
>
>         etm_pmu.attr_groups             = etm_pmu_attr_groups;
>         etm_pmu.task_ctx_nr             = perf_sw_context;
> --
> 2.34.1
>

If the possible issue above is prevented by perf internals

Reviewed-by: Mike Leach <mike.leach@linaro.org>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

