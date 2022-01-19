Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6624934FC
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jan 2022 07:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351206AbiASGbN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Jan 2022 01:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiASGbN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jan 2022 01:31:13 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD21C061574
        for <linux-doc@vger.kernel.org>; Tue, 18 Jan 2022 22:31:12 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id r15so1327880ilj.7
        for <linux-doc@vger.kernel.org>; Tue, 18 Jan 2022 22:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UkxAceZxhajO8BZgkx8KrSGLctag3Zj1oQU14fV01lI=;
        b=Al/uDi3lg+lN09USLdsbvITyPec67cN5Pi0OUqyCegJg47rd3VhCxspvMZpaV1wT+W
         SvDRoVhrHnzyuI9uW2Gx6O40x+11XZAEE1mWZ2oDkglCgZRBiuLMienpZwn1dXxuVxZa
         dVER1xf43OOVYL6tGrvttn0OgbDIUhu2z6BmdN4oPcA1YVTj2vsPuDVyX9N8naFPXLpf
         s43BvSzaDQpikXXCfDezMayLfKPfhBl4huxVeq4LT9q+BZkxCufxE84ehwGoJ6Eqw0RG
         d9oaa2p0Itw0RYje0YB8rgjkFpskE4CAwxsTR9a91PU+sHdLdt5Xk2nrxm0O8qiCQohR
         q4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UkxAceZxhajO8BZgkx8KrSGLctag3Zj1oQU14fV01lI=;
        b=PChOyk5vsb6UPIbgXXdbG3rfYhoDLX5AcbhpOwQsXyGEGxGqdbGcdbSuePuyFD5j/2
         KFHUlxq1dPEBpUaeQV/8nOqrLfgycy4oViOxT7PpdFBZORTYDBhbZ9867zNaHUN0Edy8
         cfWPb5djE2p1H9ta1u+SCbgMtv3Nd9W8O+XlTwWkPZQW9wEaQ1famOIz56Ijs+qSve9c
         1/iavb87lP+vJCkq4XGzk2lFUjzOLOndftA65/0ENc1YILEI+5+vdTxN5F5F14WBbjCl
         4NV289oCorch8UGkhr53W6a5xgIOiWwGc7ru1pPmyxH2CGaBW+MQFKUwd/R4zLTFwlaw
         hsqA==
X-Gm-Message-State: AOAM532tkJjlitJ9iVxEAKXCXO3gE8djq+4u1cxSS2a5y5ra9WSxgEiR
        wwKluhixg8MOztp63LX/Cvb0Wg==
X-Google-Smtp-Source: ABdhPJx6MTLpNNm2sOsjZA6EPUjb9C5/VI8R+cN1990w1Y2oviGcshouM6+huqzkXNgC6iBpgogcAg==
X-Received: by 2002:a05:6e02:198a:: with SMTP id g10mr15789393ilf.280.1642573872028;
        Tue, 18 Jan 2022 22:31:12 -0800 (PST)
Received: from google.com ([2620:15c:183:200:90fc:e0c9:c69f:bede])
        by smtp.gmail.com with ESMTPSA id g5sm13398294ioo.21.2022.01.18.22.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 22:31:11 -0800 (PST)
Date:   Tue, 18 Jan 2022 23:31:07 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Michal Hocko <mhocko@suse.com>
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
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>
Subject: Re: [PATCH v6 6/9] mm: multigenerational lru: aging
Message-ID: <YeewK/cYG4MXV4f3@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-7-yuzhao@google.com>
 <YdcU4P+XWkbDUUoO@dhcp22.suse.cz>
 <Yddh+APQGg8dKRgw@google.com>
 <Ydf/7DDu94fMs0CG@dhcp22.suse.cz>
 <YdgBL1dRk1KmyXJS@dhcp22.suse.cz>
 <Yduuyrk/AZG717Hs@google.com>
 <YdxEqFPLDf+wI0xX@dhcp22.suse.cz>
 <Yd/0Sgxy+jLm5cqd@google.com>
 <YeAU0n1puxyr4N6Y@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeAU0n1puxyr4N6Y@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 13, 2022 at 01:02:26PM +0100, Michal Hocko wrote:
> On Thu 13-01-22 02:43:38, Yu Zhao wrote:
> [...]
> > > > The bottom line is I can try various optimizations, e.g., preallocate
> > > > a few buffers for a limited number of page walkers and if this number
> > > > has been reached, fallback to the rmap-based function. But I have yet
> > > > to see evidence that calls for additional complexity.
> > > 
> > > I would disagree here. This is not an optimization. You should be
> > > avoiding allocations from the memory reclaim because any allocation just
> > > add a runtime behavior complexity and potential corner cases.
> > 
> > Would __GFP_NOMEMALLOC address your concern? It prevents allocations
> > from accessing the reserves even under PF_MEMALLOC.
> 
> __GFP_NOMEMALLOC would deal with the complete memory depletion concern
> for sure but I am not sure how any of these allocations would succeed
> when called from the direct reclaim. Some access to memory reserves is
> necessary if you insist on allocating from the reclaim process.
> 
> You can have a look at the limited memory reserves access by oom victims
> for an example of how this can be done.

Thanks. I'll change GFP_KERNEL to __GFP_HIGH | __GFP_NOMEMALLOC.
__GFP_HIGH allows some access to memory reserves and __GFP_NOMEMALLOC
prevents the complete depletion. Basically the combination lower the
min watermark by 1/2, and we have been using them for
add_to_swap_cache().
