Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5113A32AC
	for <lists+linux-doc@lfdr.de>; Thu, 10 Jun 2021 20:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhFJSGg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Jun 2021 14:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26895 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229802AbhFJSGg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 14:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623348279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CEoL5V4Mmey/+otE2j2URoJUKULpKPt4rB1iuEzrSWg=;
        b=G6norW3i4bK27LW6BCb6fBgCQx1yBFMpw9I0bWinL1NMtiLwv6uNCH3gwJNc8YdXUraUU0
        708WvDvpOGVtvn3Ht61kyV0PkpLgiGCGSdF26qFkcchEqXSm+MhgZAhrfyhOt5+xy6CePH
        dVIZy3NdrrfEaUVnKIV1BzOVlvZNksE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485--OZKoEH0OJOzF9BJD0mziQ-1; Thu, 10 Jun 2021 14:04:38 -0400
X-MC-Unique: -OZKoEH0OJOzF9BJD0mziQ-1
Received: by mail-qt1-f199.google.com with SMTP id q6-20020a05622a04c6b0290247f5436033so376655qtx.5
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 11:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CEoL5V4Mmey/+otE2j2URoJUKULpKPt4rB1iuEzrSWg=;
        b=d1wTXbx26ORASs/nUGxba78rlJ+Levmyp+H7sR0A/EMgoNsIkbRZanvdQgAAfMH/tm
         MUNLbIgbNgX5tNORd4w8D3Mu1lJXFkSL71NTYsLRDgtPkzxHqScyvkEXLigjlabDowzh
         Ypm+ygUCqlT1Bhq65I+Sx2DjnEMXQOwSSF+WrhBAC5j3EVJKNNLx2lek2KFhA/88P0aa
         sE8pZLR5ZVp8uRUvUZ7LjR+a5zAqjFgSE3t+NYi3eEHxlAUUUORQ7bsl+4KsNnMTLQkN
         B52bXlciXzNLeUbgJnUFtwhsJ3K1WlnJwB9lveKTVOCrO2wi+eGmqaJKtw9Xa8IytviU
         7/yg==
X-Gm-Message-State: AOAM531g+BggWdY+V3WXXKaGuwhoZrhxfKa9M9BUmn1NAcQCf+1pOKG1
        RAwXYSMFUuQCxs3qWhoJVocIxiL/QVbbaHvGZFss/CLcrJJ/bhaAt1uW5kt9vL1Ek/3X5qNMuzj
        Duffd016Ysm+t7IuMR+Bv
X-Received: by 2002:aed:306f:: with SMTP id 102mr3459qte.197.1623348277896;
        Thu, 10 Jun 2021 11:04:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTTO+KkTdxTZkkMrHOmkbo6ejQaZkDXpeywK0BwU0l5R3cowlkisPdpRInl2BsP3WxC79JBQ==
X-Received: by 2002:aed:306f:: with SMTP id 102mr3418qte.197.1623348277505;
        Thu, 10 Jun 2021 11:04:37 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
        by smtp.gmail.com with ESMTPSA id o3sm2731692qkc.93.2021.06.10.11.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 11:04:36 -0700 (PDT)
Date:   Thu, 10 Jun 2021 14:04:35 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        nouveau@lists.freedesktop.org, hughd@google.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, bskeggs@redhat.com, jgg@nvidia.com,
        shakeelb@google.com, jhubbard@nvidia.com, willy@infradead.org,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Message-ID: <YMJUM4sx1VclR7oz@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <270551728.uXnuCZxQlr@nvdebian>
 <YMDmsha6GDtUf3Vs@t490s>
 <2773835.D95cIkl9rl@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2773835.D95cIkl9rl@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 10, 2021 at 10:18:25AM +1000, Alistair Popple wrote:
> > > The main problem is split_huge_pmd_address() unconditionally calls a mmu
> > > notifier so I would need to plumb in passing an owner everywhere which could
> > > get messy.
> > 
> > Could I ask why?  split_huge_pmd_address() will notify with CLEAR, so I'm a bit
> > confused why we need to pass over the owner.
> 
> Sure, it is the same reason we need to pass it for the exclusive notifier.
> Any invalidation during the make exclusive operation will break the mmu read
> side critical section forcing a retry of the operation. The owner field is what
> is used to filter out invalidations (such as the exclusive invalidation) that
> don't need to be retried.

Do you mean the mmu_interval_read_begin|retry() calls?

Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
internally which will generate that unwanted CLEAR notify.

If that's the case, I think it fails because split_huge_pmd_address() will
trigger that CLEAR notify unconditionally (even if it's not a thp; not sure
whether it should be optimized to not notify at all... definitely another
story), while FOLL_SPLIT_PMD will skip the notify as it calls split_huge_pmd()
instead, who checks the pmd before calling __split_huge_pmd().

Does it also mean that if there's a real THP it won't really work?  As then
FOLL_SPLIT_PMD will start to trigger that CLEAR notify too, I think..

-- 
Peter Xu

