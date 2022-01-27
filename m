Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5B649EC72
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jan 2022 21:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbiA0U0l (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jan 2022 15:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbiA0U0k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 15:26:40 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED816C061747
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 12:26:39 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id c24so5290211edy.4
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 12:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fi1CjDDx2TurE9KIT9xNPFydS/AJyEq38oGV2uaA61U=;
        b=zrJPnyAi4QGp6MxlP38emBrpS5F5jPUi1PK1fZWvpwb0xusZzOev1cXwqXD93Ah303
         Ys26qGM+xFSapbAYx+F93tj/Kg5JrfOi1eaHxcUZPXT2gfuzK3Trv25cghbnsmpduaIp
         rJEr880xWNlS5IhFzKydfG6n3habeIUecE+dPbH9yYuzu6pIVi66TjU8gPS0Fk/b1YOV
         z/FwOdNYLUobxS5GHQc1FFk9W41zhXeECZD3ZxDA/9Qi+v+sppG50iWj+WkIXkNCiyK3
         kq8QpsI70OhvFhB0uMMS2pDWpgN+VgzO7VyqMjXjE2SeWZ3kCOXqSuUUv/zkJHcqesvt
         6KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fi1CjDDx2TurE9KIT9xNPFydS/AJyEq38oGV2uaA61U=;
        b=a3NCtZVV5Fg4YBJIIkh5LRtTrfZHshFz+F6Lfv1XxOTcTFhYDLJXYefLI5F3jC4u+v
         4EwUMds4Q7jodHWql9G31RR5czVBcArMnG+cIkXB7qRF0vG4Q9BXmZJf8+9GGGSbFRMu
         hCzCeabI66ghouOrK42jE8WWvaQO2vy8boCrJxrICMNuBoL25LwcgHpPCDR6KD9rBEuM
         TsXKLDIQCmtHX1QC9AslkEpt/2Np93HX4P4o3CBMV8d/JZ78VzB0hOd2j+PNMtj1NMfc
         qpBF3y8EYy8bEpUGBlXwX6mAzhgU+856oGNvvVKygg8cOT1Nd7m0lhDGyPThfq6E7m93
         aaNA==
X-Gm-Message-State: AOAM533FkTtd1Pbs0pY+jbmJl4Rcg8fo/pWk2+hHHrgLYlhjgjNwhsGS
        BK1narGQrupG+eRIw39zh2Jf5cFElpT6KSaDIzt0fQ==
X-Google-Smtp-Source: ABdhPJznXPKKye7FSdr+lVY9GNZVYl4Rl6/0Ojgh5L4rDb57d3KmHVB5vjBqJr6BFTPH1QZ7Ji/9E0+4jr95RWzgttk=
X-Received: by 2002:a05:6402:1703:: with SMTP id y3mr5072637edu.239.1643315198479;
 Thu, 27 Jan 2022 12:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20220113091056.1297982-1-james.clark@arm.com>
In-Reply-To: <20220113091056.1297982-1-james.clark@arm.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 27 Jan 2022 13:26:26 -0700
Message-ID: <CANLsYkx4u_+hPNNdmN23g58RprqkcUfhoPeZhu578DKU0qJ_hg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] coresight: Add config flag to enable branch broadcast
To:     James Clark <james.clark@arm.com>
Cc:     Suzuki.Poulose@arm.com, coresight@lists.linaro.org,
        leo.yan@linaro.com, mike.leach@linaro.org,
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

Hi James,

I am seriously back-logged in my patch reviews and as such will not be
able to get to your work in the usual 14 days.  At this time and if
everything goes well, I should be able to start reviewing this
patchset during the week of February 7th.

Thanks,
Mathieu

On Thu, 13 Jan 2022 at 02:11, James Clark <james.clark@arm.com> wrote:
>
> This allows enabling branch broadcast for Perf hosted sessions (the option
> is currently only available for the sysfs interface). Hopefully this could
> be useful for testing the decode in perf, for example does a determinisitic
> run with branch broadcast enabled look the same as with it disabled? It
> could also be used for scenarios like OpenJ9's support for JIT code:
>
>   java -Xjit:perfTool hello.java
>
> Currently this is not working and you get the usual errors of a missing
> DSO, but branch broadcast would have to be enabled anyway before working
> through this next issue:
>
>   CS ETM Trace: Debug data not found for address 0xffff7b94b058 in /tmp/perf-29360.map
>
> Address range support in Perf for branch broadcast has also not been added
> here, but could be added later.
>
> The documentation has been refactored slightly to allow updates to be made
> that link the Perf format arguments with the existing documentation.
>
> For Suzuki's comment, I will do it as a separate change that converts all
> the other hard coded values to a more consistent sysreg.h style:
>
>   nit: While at this, please could you change the hard coded value
>   to ETM4_CFG_BIT_RETSTK ?
>
> Changes since v1:
>
>   * Added Leo's reviewed by on patch 3
>   * Fix bracket styling
>   * Add documentation
>
> Applies on top of coresight/next efa56eddf5d5c. But this docs fix is also
> required to get the links to work:
>   https://marc.info/?l=linux-doc&m=164139331923986&w=2
>
> Also available at: https://gitlab.arm.com/linux-arm/linux-jc/-/tree/james-branch-broadcast-v2
>
> James Clark (6):
>   coresight: Add config flag to enable branch broadcast
>   coresight: Fail to open with return stacks if they are unavailable
>   perf cs-etm: Update deduction of TRCCONFIGR register for branch
>     broadcast
>   Documentation: coresight: Turn numbered subsections into real
>     subsections
>   Documentation: coresight: Link config options to existing
>     documentation
>   Documentation: coresight: Expand branch broadcast documentation
>
>  .../coresight/coresight-etm4x-reference.rst   | 14 ++++-
>  Documentation/trace/coresight/coresight.rst   | 56 +++++++++++++++++--
>  .../hwtracing/coresight/coresight-etm-perf.c  |  2 +
>  .../coresight/coresight-etm4x-core.c          | 23 ++++++--
>  include/linux/coresight-pmu.h                 |  2 +
>  tools/include/linux/coresight-pmu.h           |  2 +
>  tools/perf/arch/arm/util/cs-etm.c             |  3 +
>  7 files changed, 92 insertions(+), 10 deletions(-)
>
> --
> 2.28.0
>
