Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D8149ADF5
	for <lists+linux-doc@lfdr.de>; Tue, 25 Jan 2022 09:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376779AbiAYIZs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Jan 2022 03:25:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449840AbiAYIUz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jan 2022 03:20:55 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBABC075942
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 22:48:36 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id d188so8189419iof.7
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2CO/0VtOREtMtGW71kkDBfMgMYeipJa6iXGHC5VC/RU=;
        b=X1ftQALT1SX5jUMQWj7RoMqtz2ewnU+L3TGQqWmlcbgo3KSmMxF5sCjshQxkke1ZFA
         jzg3QMPbXZxTMJpqsuUnVp2tRS/gMu7mDs1i1AXKoC0Yn9NtDnO+jiAMoTVASSnpv88c
         oxTgFX+w+blwFXMcVO+umvS9Edyq2CPSGETtOkEmOYF6ChWDaI8pDRoItSjToYMdRYUV
         3zSSoseakDUqj/d4eR4g4BvplCQ0+YE8vHSaImz4kwNEIMnc6CD09VE7b2FyutUNyDch
         Ve7PL8FasxksLlw2ftA7KN04RdQRMY+YmJqacRaP4Qr2KrglAy9VvNHhS6fn8jyA3DE3
         tKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2CO/0VtOREtMtGW71kkDBfMgMYeipJa6iXGHC5VC/RU=;
        b=XwajSDzFRLF/avHN68v9w70GWju8CXDtpeJlBmD2JsZkNkEMRmVSyPMnyK4KoaNMDf
         eF3yHY3TGuUpflZXQoh2C4716EM4X7PPNWUJ3tVl9c91SzGA0cYgBwuwxTcb38D5LlTb
         B/090Q8pneBe3TG5hxKHNvYJ1j1mO6BApo4SZdw1wAvgNkTPLAkf0SoWoniZ/D2mgSkw
         b5TkpfyL6d15N2VIpykXOsugDf8JTD15u/uW8MfVdBQmL/+GUwdruGNIkLH+SiA/XqDM
         xQZRQhJJN9raKXF3aNcfK4MQDfvy2kdHUZsqiVsYPJN2Ven0aX3OXehXtW19CWrfjgtp
         g1ew==
X-Gm-Message-State: AOAM530Bsl0y8CXiRZq0NT7TK/FUQISy+wiXt1lc5dZ1gFx3FWhSwvOM
        td+WL7ZP3C7uuqpVtpKgqI4Tww==
X-Google-Smtp-Source: ABdhPJwDp6hR1qn1SHpSjIF3pYJ7fhWeNimbnilfiMoehjRW8WORjpC4cJ6QnM6/gZMjIwnNZM9XPQ==
X-Received: by 2002:a02:6d48:: with SMTP id e8mr9063758jaf.250.1643093315535;
        Mon, 24 Jan 2022 22:48:35 -0800 (PST)
Received: from google.com ([2620:15c:183:200:c4ed:79a3:8a0e:7ee])
        by smtp.gmail.com with ESMTPSA id c3sm8292027iow.28.2022.01.24.22.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 22:48:34 -0800 (PST)
Date:   Mon, 24 Jan 2022 23:48:30 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Barry Song <21cnbao@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, page-reclaim@google.com,
        x86 <x86@kernel.org>
Subject: Re: [PATCH v6 0/9] Multigenerational LRU Framework
Message-ID: <Ye+dPmO17JN2bNLL@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <CAGsJ_4zULJ5vPwn73Z5Bap3eRkAX+Yv24c-n41+zC7fN8xG60g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGsJ_4zULJ5vPwn73Z5Bap3eRkAX+Yv24c-n41+zC7fN8xG60g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jan 23, 2022 at 06:43:06PM +1300, Barry Song wrote:
> On Wed, Jan 5, 2022 at 7:17 PM Yu Zhao <yuzhao@google.com> wrote:

<snipped>

> > Large-scale deployments
> > -----------------------
> > We've rolled out MGLRU to tens of millions of Chrome OS users and
> > about a million Android users. Google's fleetwide profiling [13] shows
> > an overall 40% decrease in kswapd CPU usage, in addition to
> 
> Hi Yu,
> 
> Was the overall 40% decrease of kswap CPU usgae seen on x86 or arm64?
> And I am curious how much we are taking advantage of NONLEAF_PMD_YOUNG.
> Does it help a lot in decreasing the cpu usage?

Hi Barry,

The fleet-wide profiling data I shared was from x86. For arm64, I only
have data from synthetic benchmarks at the moment, and it also shows
similar improvements.

For Chrome OS (individual users), walk_pte_range(), the function that
would benefit from ARCH_HAS_NONLEAF_PMD_YOUNG, only uses a small
portion (<4%) of kswapd CPU time. So ARCH_HAS_NONLEAF_PMD_YOUNG isn't
that helpful.

> If so, this might be
> a good proof that arm64 also needs this hardware feature?
> In short, I am curious how much the improvement in this patchset depends
> on the hardware ability of NONLEAF_PMD_YOUNG.

For data centers, I do think ARCH_HAS_NONLEAF_PMD_YOUNG has some value.
In addition to cold/hot memory scanning, there are other use cases like
dirty tracking, which can benefit from the accessed bit on non-leaf
entries. I know some proprietary software uses this capability on x86
for different purposes than this patchset does. And AFAIK, x86 is the
only arch that supports this capability, e.g., risc-v and ppc can only
set the accessed bit in PTEs.

In fact, I've discussed this with one of the arm maintainers Will. So
please check with him too if you are interested in moving forward with
the idea. I might be able to provide with additional data if you need
it to make a decision.

Thanks.
