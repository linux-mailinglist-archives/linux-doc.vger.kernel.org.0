Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977CA4975C1
	for <lists+linux-doc@lfdr.de>; Sun, 23 Jan 2022 22:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240235AbiAWVkn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 23 Jan 2022 16:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240233AbiAWVkm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 23 Jan 2022 16:40:42 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE09C06173B
        for <linux-doc@vger.kernel.org>; Sun, 23 Jan 2022 13:40:42 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id i62so1578925ioa.1
        for <linux-doc@vger.kernel.org>; Sun, 23 Jan 2022 13:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IyKNPXR0xXBAL80gtxnxeT19PyLCAGmnDeiaMG7++bM=;
        b=ZMlU5JvaMGRzZqWwhMytbclyq2hK+DR3jCfjxiTok0CS8FFyYCsm/UFaEtOyfdSk5d
         kdtDiVMulhEgRlVhTMXABPMK7hLpwFGzeajhi/W9rVzcnuu9ME4FK9ShDLgi/D0BXH+O
         PQiTqpuxJngULJ6oaET3u7sRaihthGRaApk0q5G5fZTetiQ/60Kocm74RrILXTUc1tT8
         SAaEc8KTvcOMSd3QUG+gAnOEsETBwbGBmdvn/pETf8PFCVxiQtnjoA9jMVbQeparWeJ+
         sRpsptQQ0obvOnaqu5N0/rjQ/Zg1xGqcTus8V6e1Ykc2aqAFUi9zfKZ/IYjWxqn2tSr2
         ifSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IyKNPXR0xXBAL80gtxnxeT19PyLCAGmnDeiaMG7++bM=;
        b=hkYMElJGTwglNlrrBDzCP21ZKmr7Jhr3YsqAnmrF/0xkK8QPyb8tI7c8x4FQeanta0
         S7O3uYMYBaDP1mM+tLj/BgejGLy7OB68SXzk1a2ayQDNSVsYOKLi/f+kje9LSfOe5jXj
         HQNt8HV/KJNzm2fdOJwHQkVVEjLPnDRNZX3crpdhgSUacvCM325oSYlLeerFRUTWYffl
         kRtgHyMQUd1KGIuAJUrTbpxY7xt21J1sF0Lt7MAX5EobjZHDevPiWKy6FwseeJICVFvE
         D6PcKWElHVdIWivW9WaHFM9C+T1wMt3WauA9qb2S8PPjkKe2AiZdmrL4Vh9EeM9nrVg4
         gUrQ==
X-Gm-Message-State: AOAM533uI2gIIl+WNvOdVLiSyceVHmeeAztfQxqzlRPqGcBHtxfsBeRa
        PvAgPS96ZYLByTtVZYvA/LebIQ==
X-Google-Smtp-Source: ABdhPJzxHVZd/U5xuji1+wbXuf3oi0S1JW3F72Mw005SIgUl8rEA/x+DErKmKSlc6HG3ZjPbcd2wog==
X-Received: by 2002:a05:6638:ec7:: with SMTP id q7mr5992263jas.210.1642974041316;
        Sun, 23 Jan 2022 13:40:41 -0800 (PST)
Received: from google.com ([2620:15c:183:200:b551:d37:7fd2:5a1a])
        by smtp.gmail.com with ESMTPSA id w19sm5474492iov.16.2022.01.23.13.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 13:40:40 -0800 (PST)
Date:   Sun, 23 Jan 2022 14:40:36 -0700
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
Message-ID: <Ye3LVBuWBcPGd1Es@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-7-yuzhao@google.com>
 <Ydxlg5rI4ZvODQvF@dhcp22.suse.cz>
 <Yd4oaUwHkpadAKwe@google.com>
 <Yd6q0QdLVTS53vu4@dhcp22.suse.cz>
 <Yd9nk0qlK3jK9baN@google.com>
 <YeATr//U6XD87fWF@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeATr//U6XD87fWF@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 13, 2022 at 12:57:35PM +0100, Michal Hocko wrote:
> On Wed 12-01-22 16:43:15, Yu Zhao wrote:
> > On Wed, Jan 12, 2022 at 11:17:53AM +0100, Michal Hocko wrote:
> [...]
> > > Is there any reason you are not using folio_memcg_lock in the
> > > pte walk instead?
> > 
> > We have a particular lruvec (the first arg), hence a particular memcg
> > to lock. But we don't have a particular page to lock.
> 
> That is certainly true at this layer but the locking should be needed
> only for specific pages, no?

Yes.

> So you can move the lock down to the
> callback which examines respective pages. Or is there anything
> preventing that?

No.

> To be honest, and that is the reason I am asking, I really do not like
> to open code the migration synchronization outside of the memcg proper.

Agreed.

> Code paths which need a stable memcg are supposed to be using
> folio_memcg_lock for the specific examination time.

No argument here, just a clarification: when possible I prefer to
lock a batch of pages rather than individual ones.

> If you prefer a
> trylock approach for this usecase then we can add one.

Done. Thanks.
