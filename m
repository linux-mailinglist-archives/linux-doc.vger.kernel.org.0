Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDBF495F33
	for <lists+linux-doc@lfdr.de>; Fri, 21 Jan 2022 13:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380458AbiAUMno (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Jan 2022 07:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380431AbiAUMnk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Jan 2022 07:43:40 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E204C061574
        for <linux-doc@vger.kernel.org>; Fri, 21 Jan 2022 04:43:39 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso28753973wmj.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Jan 2022 04:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EWlGEwUNQNsFOBQfyTw758QJnOz/Mz+YQnkVX090/Ec=;
        b=MYFGLp4W4jpqtR3IIydSN+Z/d3lEDhCaOqSjM3NTv5GVVALIHbQQcGos5LllHPGS++
         SbTqDkZxIXtaKEtj4Fm8z3dd5evfJhdVVyXYkkEDJp86hhy85w5IMQoZomC/60GG8cWX
         WB7iVNQQ6rDfGUik3QLdVB5C7LF309H1wyzN/09BUQpO9Q8nRzNah6JN9/wtEw+QLvfB
         6tpicTDlg3TcZzgDKPR3C+PcxAf9kYvPTj9Ls7jVfbeaSepo+5G0SGq4VxO4NkykJiqJ
         WTXzZqk4Xrgop16zr5lNKB5VhosktgruYMjt6a6RNBmXX33+FkmO2HA0xuES72wbP4vl
         9mHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EWlGEwUNQNsFOBQfyTw758QJnOz/Mz+YQnkVX090/Ec=;
        b=LNS40pF6bugCgwljrh1b9f6DqpOdR1LEHSGyWOd/XAXNnGLsDob4Vpqt1RlhBLRCm3
         iLNkQ1kZmDEjBHU4IFtP7Ih4yvUQyLFQtOSXKn5GSGno8bKx7pR95sMWvx8hNFTZfUSa
         uOOCHXLm+IE+dE1y+/QV1riwvPVLXCwCjFSgzlUy1moGDnL4/aptWKTeqUV5ax1gwgUu
         OwsUhUfu9SA2qAOhCq5+b0CQjAXb2XAValuL5a90w1mvdtNgt3TuN9nGM6BRcrnMOXal
         apXqJaEoINV56CArhO/iOw81EduHiKYR2Su7HUPj00TnrfixPdSRkX1tSQ2cTEnpZdcq
         UZpA==
X-Gm-Message-State: AOAM532JWZvYtJJKac4Eb093EpfruXHygf3Se737jJBoLZMNhSIKuEUN
        g4+j9YkYAIQz8DZCnlI62kHzrVaKUSQEEi0eOhW1Zw==
X-Google-Smtp-Source: ABdhPJxVIUEv+Gh1C/eqHdYDUCSzfEdK6zAnokctV5VtHG6hK9uye4hFh/zXYkdfWtjlEqWpF56HAeb28htkXndj+h0=
X-Received: by 2002:adf:df84:: with SMTP id z4mr3696038wrl.519.1642769018129;
 Fri, 21 Jan 2022 04:43:38 -0800 (PST)
MIME-Version: 1.0
References: <20220113091056.1297982-1-james.clark@arm.com> <20220113091056.1297982-2-james.clark@arm.com>
In-Reply-To: <20220113091056.1297982-2-james.clark@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 21 Jan 2022 12:43:27 +0000
Message-ID: <CAJ9a7VhYEzXFbSDvvUsH-D9T_1bTVUJW6P_TJj_W8_C1T-2vVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] coresight: Add config flag to enable branch broadcast
To:     James Clark <James.Clark@arm.com>
Cc:     suzuki.poulose@arm.com, mathieu.poirier@linaro.org,
        coresight@lists.linaro.org, leo.yan@linaro.com,
        Leo Yan <leo.yan@linaro.org>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 13 Jan 2022 at 09:11, James Clark <james.clark@arm.com> wrote:
>
> When enabled, all taken branch addresses are output, even if the branch
> was because of a direct branch instruction. This enables reconstruction
> of the program flow without having access to the memory image of the
> code being executed.
>
> Use bit 8 for the config option which would be the correct bit for
> programming ETMv3. Although branch broadcast can't be enabled on ETMv3
> because it's not in the define ETM3X_SUPPORTED_OPTIONS, using the
> correct bit might help prevent future collisions or allow it to be
> enabled if needed.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c   |  2 ++
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 ++++++++++
>  include/linux/coresight-pmu.h                      |  2 ++
>  3 files changed, 14 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index c039b6ae206f..43bbd5dc3d3b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -52,6 +52,7 @@ static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
>   * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
>   * now take them as general formats and apply on all ETMs.
>   */
> +PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
>  PMU_FORMAT_ATTR(cycacc,                "config:" __stringify(ETM_OPT_CYCACC));
>  /* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
>  PMU_FORMAT_ATTR(contextid1,    "config:" __stringify(ETM_OPT_CTXTID));
> @@ -97,6 +98,7 @@ static struct attribute *etm_config_formats_attr[] = {
>         &format_attr_sinkid.attr,
>         &format_attr_preset.attr,
>         &format_attr_configid.attr,
> +       &format_attr_branch_broadcast.attr,
>         NULL,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index bf18128cf5de..04669ecc0efa 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -692,6 +692,16 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>                 ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>         }
>
> +       /* branch broadcast - enable if selected and supported */
> +       if (attr->config & BIT(ETM_OPT_BRANCH_BROADCAST)) {
> +               if (!drvdata->trcbb) {
> +                       ret = -EINVAL;
> +                       goto out;
> +               } else {
> +                       config->cfg |= BIT(ETM4_CFG_BIT_BB);
> +               }
> +       }
> +
>  out:
>         return ret;
>  }
> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
> index 4ac5c081af93..6c2fd6cc5a98 100644
> --- a/include/linux/coresight-pmu.h
> +++ b/include/linux/coresight-pmu.h
> @@ -18,6 +18,7 @@
>   * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
>   * directly use below macros as config bits.
>   */
> +#define ETM_OPT_BRANCH_BROADCAST 8
>  #define ETM_OPT_CYCACC         12
>  #define ETM_OPT_CTXTID         14
>  #define ETM_OPT_CTXTID2                15
> @@ -25,6 +26,7 @@
>  #define ETM_OPT_RETSTK         29
>
>  /* ETMv4 CONFIGR programming bits for the ETM OPTs */
> +#define ETM4_CFG_BIT_BB         3
>  #define ETM4_CFG_BIT_CYCACC    4
>  #define ETM4_CFG_BIT_CTXTID    6
>  #define ETM4_CFG_BIT_VMID      7
> --
> 2.28.0
>
Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
