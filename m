Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A445A7A2941
	for <lists+linux-doc@lfdr.de>; Fri, 15 Sep 2023 23:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236136AbjIOVWr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Sep 2023 17:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237341AbjIOVW2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Sep 2023 17:22:28 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00278E6
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:22:21 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-690471b5889so964175b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Sep 2023 14:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694812941; x=1695417741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0kMZ8d93qRdQCVI6CVDzaa2b8htk/6nsTOwdqxIFLQ=;
        b=b6lXrWlps4mn56h2ROI/iAVf6IvmDLttDzn4BAlLtmgM9hu12XZTKM4SGLqFvqsK76
         s9yZsIVFRRPcuDxFf3qfCvERivDJyiV68mUkpDWLEJPgHtdyi7JCvYKmuB7ooiGJhVBt
         fV9yzcTudsN9MmLfVvN21kXU3fA0MXp+qID8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694812941; x=1695417741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0kMZ8d93qRdQCVI6CVDzaa2b8htk/6nsTOwdqxIFLQ=;
        b=GOVDAwi8soI3cIgZ5PkKnEtWNnzP973BY4HPEE03PEVVss2AF6dQGXZuWLO1c0kQm+
         CNA2Y+3Y3xm1Tsq1i44NeD+uNMLdcNbZs2kxa9+pSHFUaWPFxvkZeHj+ifzL2lJfI2KD
         jVz3yKd21DN61PqrAbmKU+0plpYdkyVzfPU8BHZ5HeqLNGvWqJMV3bylCjMchgk40+vD
         kD4zHanEHpErMTV7vRpK5aiVYn2MyCFaUWXMeEC8m62L5jeIpsZgGY0NkVJnDB93RKAf
         G7jgoHw9axLqNk6RHxhl8BmSJoFR9AOSnlwFzji4uu9muMPPV+7iIr8kp/pwrws+JyB+
         QTJw==
X-Gm-Message-State: AOJu0YwqQsZoJ4gRk4LcY0+/jVd601HRh6S2BVDyMD4qV3+BwKuS0BaA
        fLUj4hRN2IRl15BVM2RVRQtSyg==
X-Google-Smtp-Source: AGHT+IFXhYnUgA00/Q6g5wBduIWHI2eXNBUpE7oWPl1Z19J8jTpjt+T/QZNudB9t3IWA9FQ6aC/fsg==
X-Received: by 2002:a05:6a00:2344:b0:68e:43ed:d30b with SMTP id j4-20020a056a00234400b0068e43edd30bmr2745959pfj.21.1694812941429;
        Fri, 15 Sep 2023 14:22:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 15-20020aa7910f000000b006877b0b31c2sm3486022pfh.147.2023.09.15.14.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 14:22:20 -0700 (PDT)
Date:   Fri, 15 Sep 2023 14:22:20 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Matteo Rizzo <matteorizzo@google.com>
Cc:     cl@linux.com, penberg@kernel.org, rientjes@google.com,
        iamjoonsoo.kim@lge.com, akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-hardening@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        corbet@lwn.net, luto@kernel.org, peterz@infradead.org,
        jannh@google.com, evn@google.com, poprdi@google.com,
        jordyzomer@google.com
Subject: Re: [RFC PATCH 11/14] mm/slub: allocate slabs from virtual memory
Message-ID: <202309151413.A1166F314A@keescook>
References: <20230915105933.495735-1-matteorizzo@google.com>
 <20230915105933.495735-12-matteorizzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915105933.495735-12-matteorizzo@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 15, 2023 at 10:59:30AM +0000, Matteo Rizzo wrote:
> From: Jann Horn <jannh@google.com>
> 
> This is the main implementation of SLAB_VIRTUAL. With SLAB_VIRTUAL
> enabled, slab memory is not allocated from the linear map but from a
> dedicated region of virtual memory. The code ensures that once a range
> of virtual addresses is assigned to a slab cache, that virtual memory is
> never reused again except for other slabs in that same cache. This lets
> us mitigate some exploits for use-after-free vulnerabilities where the
> attacker makes SLUB release a slab page to the page allocator and then
> makes it reuse that same page for a different slab cache ("cross-cache
> attacks").
> 
> With SLAB_VIRTUAL enabled struct slab no longer overlaps struct page but
> instead it is allocated from a dedicated region of virtual memory. This
> makes it possible to have references to slabs whose physical memory has
> been freed.
> 
> SLAB_VIRTUAL has a small performance overhead, about 1-2% on kernel
> compilation time. We are using 4 KiB pages to map slab pages and slab
> metadata area, instead of the 2 MiB pages that the kernel uses to map
> the physmap. We experimented with a version of the patch that uses 2 MiB
> pages and we did see some performance improvement but the code also
> became much more complicated and ugly because we would need to allocate
> and free multiple slabs at once.

I think these hints about performance should be also noted in the
Kconfig help.

> In addition to the TLB contention, SLAB_VIRTUAL also adds new locks to
> the slow path of the allocator. Lock contention also contributes to the
> performance penalty to some extent, and this is more visible on machines
> with many CPUs.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> Co-developed-by: Matteo Rizzo <matteorizzo@google.com>
> Signed-off-by: Matteo Rizzo <matteorizzo@google.com>
> ---
>  arch/x86/include/asm/page_64.h          |  10 +
>  arch/x86/include/asm/pgtable_64_types.h |   5 +
>  arch/x86/mm/physaddr.c                  |  10 +
>  include/linux/slab.h                    |   7 +
>  init/main.c                             |   1 +
>  mm/slab.h                               | 106 ++++++
>  mm/slab_common.c                        |   4 +
>  mm/slub.c                               | 439 +++++++++++++++++++++++-
>  mm/usercopy.c                           |  12 +-
>  9 files changed, 587 insertions(+), 7 deletions(-)

Much of this needs review by MM people -- I can't speak well to the
specifics of the implementation. On coding style, I wonder if we can get
away with reducing the amount of #ifdef code by either using "if
(IS_ENABLED(...)) { ... }" style code, or, in the case of the allocation
function, splitting it out into two separate files, one for standard
page allocator, and one for the new virt allocator. But, again, MM
preferences reign. :)

-- 
Kees Cook
