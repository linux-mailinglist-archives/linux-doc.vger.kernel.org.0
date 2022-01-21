Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF03495F3E
	for <lists+linux-doc@lfdr.de>; Fri, 21 Jan 2022 13:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350520AbiAUMrS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Jan 2022 07:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343954AbiAUMrS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Jan 2022 07:47:18 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CA8C061401
        for <linux-doc@vger.kernel.org>; Fri, 21 Jan 2022 04:47:17 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i187-20020a1c3bc4000000b0034d2ed1be2aso27330795wma.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Jan 2022 04:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KSIxsFPV5bVCwyYpPb8wil0j/b7MlVv5okHNBdZvb+s=;
        b=prZs3CnccQtpraXzDMyfAnnmDi3yi6DOvIX1O4I5Q+pMyvQOytbx7Kr7II79SCyfCA
         k6W+BskGtZBjaDa+Y82fAIISYK4L9B7riP26eFan0MSrVkV29q/YgWRtYRSqneBtkB6h
         i4dd1Wb7OBRRnH/RjVP2zs+QBJdFFZOmIPInK8Senk8Q8pjzojGK6MfOh1Ojy8cIElo8
         PFKa1dRCK3yXGf0e7ynFi+WEs49Bj6Ydot/YSWVHJM3kIxl1/UopW+JMZrJJKLNXty7r
         uX8FUvII/MeeDS0cc/RXqZmiC0IacZj5ubW7owphGuFmH460scZ/sE+a7+ry9gpdwOZG
         GQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KSIxsFPV5bVCwyYpPb8wil0j/b7MlVv5okHNBdZvb+s=;
        b=bgoLnaaV1TJPJz2dTVNFGyO7uBfQn6jl0iWyN/fnYiMIFnVbwBJLOtWfdJodWu82hS
         eXpOnjbMXJVcxF7bZnNwuJlbIXsj5xuQIAhYa2gl+0QoN/q8LQQV5/MKN1iLWJ2qcel5
         qiPRkshS22Qk1vUU5UDxaiQkk2ROQGaEARnljco//5QURsHVbMSKE+AnNab/klyVi0oE
         u5NDIXwrvcRqVBn/1Ewyr5SrHuUPEXb35p0duFvyzM/2FynYvZC1VgBY7dYmQQKgiab/
         2noxmYhaxmJqhHQKqLSoxVo0k/Dy/IoJhXZa+OKoKdaHc7W7J3XP7UFfleOeULMgYEE6
         J5lQ==
X-Gm-Message-State: AOAM531cnTsoPdnSBD8l9vgOILIVZ6w/8Lj5lfFYH3uPPlgJIokdEbrv
        q3ZvTs+Ct+EqBDJWL1lf8XW1Cuw1zgIxh7iSzZ6BrQ==
X-Google-Smtp-Source: ABdhPJx9RWgi14LgNBLUN6n8Ket2m99+2j6IGdbR+86/UqQonas9n8/TuXSgPK0B3Be1ctB3wc0zX/vPYlOXGjAJ1gw=
X-Received: by 2002:a05:600c:4f4d:: with SMTP id m13mr588843wmq.153.1642769236393;
 Fri, 21 Jan 2022 04:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20220113091056.1297982-1-james.clark@arm.com> <20220113091056.1297982-5-james.clark@arm.com>
In-Reply-To: <20220113091056.1297982-5-james.clark@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 21 Jan 2022 12:47:05 +0000
Message-ID: <CAJ9a7Vj7=WPTZD_oWtXaZBUWbHpKbPti7CXMviUdd+ueKbpAMw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] Documentation: coresight: Turn numbered
 subsections into real subsections
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

Reviewed-by: Mike Leach <mike.leach@linaro.org>

On Thu, 13 Jan 2022 at 09:11, James Clark <james.clark@arm.com> wrote:
>
> This is to allow them to be referenced in a later commit. There was
> also a mistake where sysFS was introduced as section 2, but numbered
> as section 1. And vice versa for 'Using perf framework'. This can't
> happen with unnumbered sections.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>  Documentation/trace/coresight/coresight.rst | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index a15571d96cc8..db66ff45ff4c 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -339,7 +339,8 @@ Preference is given to the former as using the sysFS interface
>  requires a deep understanding of the Coresight HW.  The following sections
>  provide details on using both methods.
>
> -1) Using the sysFS interface:
> +Using the sysFS interface
> +~~~~~~~~~~~~~~~~~~~~~~~~~
>
>  Before trace collection can start, a coresight sink needs to be identified.
>  There is no limit on the amount of sinks (nor sources) that can be enabled at
> @@ -446,7 +447,8 @@ wealth of possibilities that coresight provides.
>      Instruction     0       0x8026B588      E8BD8000        true    LDM      sp!,{pc}
>      Timestamp                                       Timestamp: 17107041535
>
> -2) Using perf framework:
> +Using perf framework
> +~~~~~~~~~~~~~~~~~~~~
>
>  Coresight tracers are represented using the Perf framework's Performance
>  Monitoring Unit (PMU) abstraction.  As such the perf framework takes charge of
> @@ -495,7 +497,11 @@ More information on the above and other example on how to use Coresight with
>  the perf tools can be found in the "HOWTO.md" file of the openCSD gitHub
>  repository [#third]_.
>
> -2.1) AutoFDO analysis using the perf tools:
> +Advanced perf framework usage
> +-----------------------------
> +
> +AutoFDO analysis using the perf tools
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>  perf can be used to record and analyze trace of programs.
>
> @@ -513,7 +519,8 @@ The --itrace option controls the type and frequency of synthesized events
>  Note that only 64-bit programs are currently supported - further work is
>  required to support instruction decode of 32-bit Arm programs.
>
> -2.2) Tracing PID
> +Tracing PID
> +~~~~~~~~~~~
>
>  The kernel can be built to write the PID value into the PE ContextID registers.
>  For a kernel running at EL1, the PID is stored in CONTEXTIDR_EL1.  A PE may
> @@ -547,7 +554,7 @@ wants to trace PIDs for both host and guest, the two configs "contextid1" and
>
>
>  Generating coverage files for Feedback Directed Optimization: AutoFDO
> ----------------------------------------------------------------------
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>  'perf inject' accepts the --itrace option in which case tracing data is
>  removed and replaced with the synthesized events. e.g.
> --
> 2.28.0
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
