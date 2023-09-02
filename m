Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E480B79060C
	for <lists+linux-doc@lfdr.de>; Sat,  2 Sep 2023 10:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjIBIO5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 2 Sep 2023 04:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351816AbjIBIO4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Sep 2023 04:14:56 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C51210F9
        for <linux-doc@vger.kernel.org>; Sat,  2 Sep 2023 01:14:53 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so2347382f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 02 Sep 2023 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693642492; x=1694247292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+orQorNPUo6KSCKW6crP6TptJaHrZr+1uo8TeED/eMM=;
        b=nuZ7LRCDD8Uo0ziB4avRDvxh3CiHggpsd6IwGJfl/ncOMWAhtIZmW89GBWLG3Iq4Wi
         3iVMlz+fAydBoXUMGH+YdmZUIHci/sGFT/dQdIbMLs/RdyUIOwdCftc7soaWf59n/lRK
         611hxVDO60UDa/+erHJgd5k36l0Ez1bEi3XLSsOTSUzifJQ5ARUA0U0vDdTStvB0OwVQ
         1gCIbYpbPo4xWADWNtusAiil5TWKjuKlapUF/yPLhDOnVF+4rK66dujkPY4vGWC98sq8
         VZl5gSpPuGNstOg6Mg6XL16j4c9XyTeyLeElqZ72v+Nf7KKZ7thI7izzNzD5Wr03yXIb
         YdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693642492; x=1694247292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+orQorNPUo6KSCKW6crP6TptJaHrZr+1uo8TeED/eMM=;
        b=KCbpcRPJevpHUzOMUhU5sNGS7m3HmPgewn/E+bihrSlYaahd69D8Frfs38iZgJKwNF
         rBAKAP/ZVeMvhtPXwHIhKKCaAkIbCMF3JOCCu/mRtIqLv4u1bWMmp6W5sOkLLOlrxQ8g
         eZnYHemQKbrA0JP/ap74Pru15BZscbWKuDFKvowNLQWgk5fCiIQ7OF/gj7eSyWUnPIxm
         jcyQDGe3JMDOOg/AmEQEjyIU+Ny/4IH6PX9v/2BoDt779wiyNFyVGWStGDcrTs8yzU77
         NEHW86k7S2ZPYwriPrPg9ixvay82JJTNgEMVYvK1dE9W2rzI4hse8iGsVuyv44QtihS2
         O2LQ==
X-Gm-Message-State: AOJu0YxavtrZ8ccDaMRTw0iOLlPGBW2u9FBiuY+X+HUy6KNryCzUmIGd
        FNNDrdct+LsWSsWk8zsoaU3tTb0yGEr3BtIRBeTokQ==
X-Google-Smtp-Source: AGHT+IGssLJAq5Eqm+CddbR0K32DVSCl5LIdA8ZBywnBACFN/kb7Lsv+HAqT8RQFL4H3Tgao+QSAiuwK1bcmHfczBuY=
X-Received: by 2002:a05:6000:1081:b0:319:79a9:4d9e with SMTP id
 y1-20020a056000108100b0031979a94d9emr3340613wrw.44.1693642491915; Sat, 02 Sep
 2023 01:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230819093340.265817-1-leo.yan@linaro.org> <CAM9d7cj=ichFk4bVQSbyptqy9wo8GFm1Z1Q7QzfhMFLjewNF-Q@mail.gmail.com>
 <20230823023838.GF57731@leoy-huanghe.lan> <CAM9d7cgaMyH=vSjVEOBjLzBWbZOricm6aHcP9hfLsTJ_gUEh3g@mail.gmail.com>
 <20230826072957.GA75980@leoy-huanghe.lan> <CAM9d7cjkQAhponi_mO9yBHaBP3wB4cBcWc5B7yb_4nE2dQWpLw@mail.gmail.com>
In-Reply-To: <CAM9d7cjkQAhponi_mO9yBHaBP3wB4cBcWc5B7yb_4nE2dQWpLw@mail.gmail.com>
From:   Leo Yan <leo.yan@linaro.org>
Date:   Sat, 2 Sep 2023 16:14:40 +0800
Message-ID: <CALZQ+UOvBe9352td44g3+qCqGGmLLq3=ObRyfQ=JXucY-MX9Gg@mail.gmail.com>
Subject: Re: [PATCH v6] Documentation: userspace-api: Document perf ring
 buffer mechanism
To:     Namhyung Kim <namhyung@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Thomas Richter <tmricht@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Olsa <jolsa@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Namhyung,

On Sat, Aug 26, 2023 at 07:45:15AM -0700, Namhyung Kim wrote:

[...]

> > > >   The combination is supported in perf tool:
> > > >
> > > >   ---+------------+-----------
> > > >      |  Forward   | Backward
> > > >   ---+------------+-----------
> > > >   rw |  Yes       |   No
> > > >   ---+------------+-----------
> > > >   ro |  X         |   Yes
> > > >   ---+------------+-----------
> > > >
> > > >   Yes: is supported
> > > >   No: is not supported
> > > >   X: is not feasible
> > >
> > > I think they are all supported.  You can use rw mode with backward
> > > direction but it's just not intuitive.  Also ro mode with forward direction
> > > is working but there's a chance to miss the start position of the
> > > previous event.
> >
> > I am a bit confused for the all four modes are supported.
> >
> > From the code [1], we can see there have only two combinations:
> >
> > - overwrite + read-only mode (PROT_READ);
> > - no-overwrite + read-write mode (PROT_READ | PROT_WRITE);
> >
> > And I think perf tool must use the backward writing for "overwrite",
> > and use the forward writing for "non-overwrite" mode.  I think the
> > code [2] can help us to conclude this.
>
> I mean the kernel supports all the combinations but perf tool uses
> the selected two.  IIUC you are describing the kernel behavior, right?

You are right.  I read the kernel code again and get the same conclusion
with you.

The kernel code is general enough, which supports forward and backward
writing directions and doesn't assume the direction is bound to any
specific ring buffer mode.  On the other hand, the perf tool selects
the combinations of the direction and mapping property for two modes:
one is the non-overwrite mode and another is the overwritable mode.

In the next spin, I'd like to add a subsection "Ring buffer modes" to
describe the implementation in the kernel and userspace respectively,
hope this can avoid confusion.

Thanks a lot for suggestion!


Leo
