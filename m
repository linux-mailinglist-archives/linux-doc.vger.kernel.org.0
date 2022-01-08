Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62930487FE1
	for <lists+linux-doc@lfdr.de>; Sat,  8 Jan 2022 01:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiAHATf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Jan 2022 19:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiAHATe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jan 2022 19:19:34 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C31C061574
        for <linux-doc@vger.kernel.org>; Fri,  7 Jan 2022 16:19:34 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id v10so5896570ilj.3
        for <linux-doc@vger.kernel.org>; Fri, 07 Jan 2022 16:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U8P8SmP0qPdbiyx8lx3McbNzmYprIh1snsE0Jac/l90=;
        b=KlrSCUQ6zoHS28F0Wu1tDFI/yNUJ8ArVvaUy+uTlL/FeUDKBCOJYPtMyLINNBObFp4
         YJ/EHx8ZtZ+S3b8u0YIKugkK9cmlbEod3BbXfucFCWP6ZzduECXW6Pkfy015WbnNuwpP
         jB/Dest13d5zIEhocs5RgEIniAQIpDBec6GHjTkBybmuKEpiXs5U/ignu8Zq+y3URSPh
         vFWB9tlWVyi1MpRHKGgcTY20bPrw1CKE7US7Gau6TVAqHyKg64DnrZQCY/tuvrNQdBYM
         qmcp58mJ61kqY3gwXNPlnOinlU8RG7OrfA7fQFpbbcavndFJlbgT6lc79ozILLgKkA/l
         0n+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U8P8SmP0qPdbiyx8lx3McbNzmYprIh1snsE0Jac/l90=;
        b=nuhb5sKsJDXZkwopbbF0oEZrLJbygZ7EDgjoh5KIdosau7/QSNFTAPpCmIHkbvWwJy
         tzTzIBay0GvCvDAS2Y1NeVllKOmN4/vfGG9jtf1GbMRSAocwSoGl/pNlvmN8GqOz6YQi
         T21kaqQRCjbUgQ4Amd0ErUUB0plQ4hXzeSku0RbxUBRbLDrqdQHNME8CRcIOYR6OHuNI
         Dw7YNzlOo0f7kKGdrupn/Mdgzw86UdMB0HHcBgZo8QGmsZA15xSFVVcVw+c7si0yV1gJ
         XfFWRU+M2AsPwlLGWjvMzk2AIjBr9ZyxZQ8Myj8zPfCbqEX4S9tWogxLHfWHGJrQxTCg
         BBPg==
X-Gm-Message-State: AOAM5314CdWdJF70SmYHXlsFJK5r3PS6ZOTDB7Z0/qF+GeNBBfyQCA9G
        2AU4LIdfD7Em8+/NYYbq9xPFmA==
X-Google-Smtp-Source: ABdhPJzjBo4KzV0lFm0oheRxOqHhBQQ40kQO3JFbzrqyVzJYHo4OK2LeVQNGaPOUbBZTIP3KSFsvkA==
X-Received: by 2002:a92:c744:: with SMTP id y4mr32084011ilp.124.1641601173525;
        Fri, 07 Jan 2022 16:19:33 -0800 (PST)
Received: from google.com ([2620:15c:183:200:8b41:537d:f5d3:269c])
        by smtp.gmail.com with ESMTPSA id s6sm90741ilq.21.2022.01.07.16.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 16:19:33 -0800 (PST)
Date:   Fri, 7 Jan 2022 17:19:28 -0700
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
Subject: Re: [PATCH v6 5/9] mm: multigenerational lru: mm_struct list
Message-ID: <YdjYkFmtMdrYg736@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-6-yuzhao@google.com>
 <YdgChw4vNb43XsU/@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdgChw4vNb43XsU/@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 07, 2022 at 10:06:15AM +0100, Michal Hocko wrote:
> On Tue 04-01-22 13:22:24, Yu Zhao wrote:
> > To exploit spatial locality, the aging prefers to walk page tables to
> > search for young PTEs. And this patch paves the way for that.
> > 
> > An mm_struct list is maintained for each memcg, and an mm_struct
> > follows its owner task to the new memcg when this task is migrated.
> 
> How does this work actually for the memcg reclaim? I can see you
> lru_gen_migrate_mm on the task migration. My concern is, though, that
> such a task leaves all the memory behind in the previous memcg (in
> cgroup v2, in v1 you can opt in for charge migration). If you move the
> mm to a new memcg then you age it somewhere where the memory is not
> really consumed.

There are two options to gather the accessed bit: page table walks and
rmap walks. Page table walks sweep dense hotspots that are NOT
misplaced in terms of reclaim scope (lruvec); rmap walks cover what
page table walks miss, e.g., misplaced dense hotspots or sparse ones.

Dense hotspots are stored in Bloom filters for each lruvec.

If an mm leaves everything in the old memcg, page table walks in the
new memcg reclaim path basically ignore this mm after the first scan,
because everything is misplaced.

In the old memcg reclaim path, page table walks won't see this mm
at all. But rmap walks will catch everything later in the eviction
path, i.e., lru_gen_look_around(). This function is less efficient
compared with page table walks because, for each rmap walk of a
non-shared page, it only can gather the accessed bit from 64 PTEs at
most. But it's still a lot faster than the original rmap, which only
gathers the accessed bit from a single PTE, for each walk of a
non-shared page.
