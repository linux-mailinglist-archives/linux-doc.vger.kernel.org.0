Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFB1345CF8D
	for <lists+linux-doc@lfdr.de>; Wed, 24 Nov 2021 23:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343707AbhKXWHv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Nov 2021 17:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbhKXWHu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Nov 2021 17:07:50 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEF5C061574
        for <linux-doc@vger.kernel.org>; Wed, 24 Nov 2021 14:04:40 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id 193so5456437qkh.10
        for <linux-doc@vger.kernel.org>; Wed, 24 Nov 2021 14:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wnb56ZlXImyESxNGtft70OqOtQf36rXcNYeS2LPN9Hw=;
        b=TI8Ja/xF0rPlSq0XbH+Z7yi5SswZbFWopo2KUC+FP/Iq/PcR2rlzmFLMIj4QV03dcF
         YFUYfCfagoudNqaumEWziKMiWQsVBe/nYWESt1ElhUaQH0p2TYtI+XXrWnFxDi4JPhkn
         J9IE4NuQF6CPpF6Ci1vk5p5mPw939HjAOacCQtJhelXJspwRORvL+V7PPRUjf2Risto8
         4BHcTy/AhBEV/9E1wBryWAoNy5lDrTYyo38hC4OwWqxQtqKZJNOijMyqb/KzruZRt+sQ
         PkQ+AiAtFXLi1/WQoI2Fzf6KIe4dEM3YVJ6C79I+lq6D360kEnRvX067qmAV0N2pUquu
         c7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wnb56ZlXImyESxNGtft70OqOtQf36rXcNYeS2LPN9Hw=;
        b=gOqQwonUIG8xBRjlBtd9+OXjByR8BFNI0Hiw3s6F6he2c/TgmjANKxjqJtcrj96Zk/
         lsx0O8w6DQI4xjSbfQ2Ga11KpD/kB2kTI29E6x0U7aUd0U0n/170sa8/0zVNjuaGbTSh
         NS67OQTnnvzA68fM/4vpY8OFqhq+trz12CaHpXN3SINB+H9CpOsz9Zc14feoeVQ3XYJb
         TWaBIHQYeVry8HJyGmYj7sbGZ+FmGKM7kwMEttvO6ANeb9MERbwEdtgsCnANSIk8w3qu
         HFx979+KQkUv3sq7aFC8SVD9x3R9CFiMVgfmJJhAgavab4mIKHCu3ax5HvsQAWZOWZFO
         oKFQ==
X-Gm-Message-State: AOAM533F3nrBgX1a7XzjWTrg0dsGyMHUNdKTSObXCtiUyCMq4ON8ncRI
        mfTZA0pekhB2Xol/AdqW1ywLvm3Z9bb1x8gFXPHCgA==
X-Google-Smtp-Source: ABdhPJyEaZfSCy9c2XfuDBLl28EATOu0ZCMDM9ldvjLGNLlmcFX5/ceoutE7bj1w59tq2T4LxJMGglhzfOaD2fWRpig=
X-Received: by 2002:a25:2f58:: with SMTP id v85mr407870ybv.487.1637791478911;
 Wed, 24 Nov 2021 14:04:38 -0800 (PST)
MIME-Version: 1.0
References: <20211124193604.2758863-1-surenb@google.com> <YZ6wg9A5p5WUy7+k@cmpxchg.org>
In-Reply-To: <YZ6wg9A5p5WUy7+k@cmpxchg.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 24 Nov 2021 14:04:28 -0800
Message-ID: <CAJuCfpGP3ZdeqfYZJ6SUCdnputU-sEOsNYx5Pd9ckL1-zuWC2w@mail.gmail.com>
Subject: Re: [PATCH 1/1] sysctl: change watermark_scale_factor max limit to 30%
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     akpm@linux-foundation.org, mhocko@suse.com, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com,
        dave.hansen@linux.intel.com, vbabka@suse.cz,
        mgorman@techsingularity.net, corbet@lwn.net, yi.zhang@huawei.com,
        xi.fengfei@h3c.com, rppt@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 24, 2021 at 1:37 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Wed, Nov 24, 2021 at 11:36:04AM -0800, Suren Baghdasaryan wrote:
> > For embedded systems with low total memory, having to run applications
> > with relatively large memory requirements, 10% max limitation for
> > watermark_scale_factor poses an issue of triggering direct reclaim
> > every time such application is started. This results in slow application
> > startup times and bad end-user experience.
> > By increasing watermark_scale_factor max limit we allow vendors more
> > flexibility to choose the right level of kswapd aggressiveness for
> > their device and workload requirements.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Thanks!

>
> No objection from me as this limit was always totally arbitrary. But I
> have to say I'm a bit surprised: The current maximum setting will wake
> kswapd when free memory drops below 10% and have it reclaim until
> 20%. This seems like quite a lot? Are there applications that really
> want kswapd to wake at 30% and target 60% of memory free?

The example I was given by a vendor was Camera application requiring
0.25G on 1GB device. Camera apps are notoriously memory hungry on
Android and on low-memory devices it can require more than 20% of
total memory to run.
