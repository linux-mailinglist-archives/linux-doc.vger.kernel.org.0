Return-Path: <linux-doc+bounces-24552-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89D96D26E
	for <lists+linux-doc@lfdr.de>; Thu,  5 Sep 2024 10:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B2851C21042
	for <lists+linux-doc@lfdr.de>; Thu,  5 Sep 2024 08:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D90193409;
	Thu,  5 Sep 2024 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K8FnCMdA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA3419258A
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725525998; cv=none; b=oqWHbwlh/C5J3JOyxDqMs2jjAsAjSVPZUSZbbzx3D9WZCvwZ+2sV9dpXzXMKzHy2RGtqmU8LkXUdFtFKvUqO8UBjIn8Bg68Zi9vcVuJU+7Z8RuqFMybT39DDYoXVlthsnJ+M6PteUcRQognUT3vraA+RqfThYqLHKxAt3er82sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725525998; c=relaxed/simple;
	bh=Pgn8gtEKLWEn6WXIfDryIx396HriDT0XtMQC+phz3Dw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g4BNnAFDqulkbAjlScmLl6A6Kz7eJiF57NadB5ia8T5P4Igem89cW3T7pkuKu0FwlL5JJBQJEyr4XNazn+6iNhxZqJ/d+a9TlK4by4/yfYvkiVSSE1qaoaD0VIth4L/CCq4N+2qZmNTMXHd178YcY6H6DpLvNLvriA7H2dc+XHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K8FnCMdA; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-70f660d2250so335977a34.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Sep 2024 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725525996; x=1726130796; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXkjpL05ZUAWPSwxurLP+o/NmUrwwwGpKOs7Ld0tSUo=;
        b=K8FnCMdA+/DJ+LTs9CAcV/9J+elPxVLrwoP+BI5zOQZmt8gwtLrmpcWHHDIv1ryLDo
         k+ElVfvqJ6xc+Qrc0jYGsEZmqQWw+fzh5BdB/m0KRmEILZstI61/lK6bt6xGW8Q01u3L
         /YbB7vudsbmJbuVivILZQjElwsZreolyLAc9gJTMH3gVtfl9oBoNVIH/cNzkNGL17mwF
         b7NzqyomuJe5jj4r0B+fCQUKswNL8TjYk7XnHEibqQuZJpEjMlU61puqoPzDPRJOHcuW
         F40vTBB4iVjpyaNae1+gpijeXHjEJM8XZshvlpUv2ybcx6rtuymybz05nmzD+DfFRQEK
         iSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725525996; x=1726130796;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXkjpL05ZUAWPSwxurLP+o/NmUrwwwGpKOs7Ld0tSUo=;
        b=FSzcL7OIymgVlOrTAHHC1JDimGuBwaDXSOpoHLMeJPcKbo63eC554ZBeBBhzbeZsWS
         ZtsYFaas6rLDtB1LlwfbAnxb4Xrz90ot2OWzOuO/xy6YrV2GUei0Ij0DWLHtx2yv0qcE
         kqRQlilRdyd309qqfRTss+XaC452hbhPeWjcPLqdQKBt03yXa9cjBR+ZGGWLRtVjG+Bl
         hhqxY4JVeT073iPz+FTxRYNUnIaynDUDUUE7PdNvBx10Vv1wWKGLFbEOB6JTNgIFjeL1
         b4kEQuc7jvzsntYksr2TeFHuBiNi//1pm/xCSL5IRfVjoch7xICsfEhv6dLJ4xEoSab3
         EBiw==
X-Forwarded-Encrypted: i=1; AJvYcCWw8R5IyGwBACWNZLtXmgV6HVe0gI05XF4aRmF6bFmBe7ondNloc/SOqqLZAJYjQ7DAO+3KvOKm/oA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsiruZdKVvQqZxo990/7TbY8HWYXIQIlvRtljFoBJYSVjRuTx5
	hH2kBkyqMxhLdnJHN9GbfOJabNZQQW3TN+oS8sTfIQs/aN24iQdByZwb5JTa1Q==
X-Google-Smtp-Source: AGHT+IGdx9vJ04QFbXH1d0xR/IsbKP5xwmoYCmlGodslCWphqIqiV87CaDDk8XYR7EWmhRKtJJjrQg==
X-Received: by 2002:a05:6830:6f85:b0:70f:3720:16bb with SMTP id 46e09a7af769-70f5c38f8a3mr27156676a34.19.1725525995898;
        Thu, 05 Sep 2024 01:46:35 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70f671c2006sm3174015a34.68.2024.09.05.01.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 01:46:34 -0700 (PDT)
Date: Thu, 5 Sep 2024 01:46:19 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    Usama Arif <usamaarif642@gmail.com>, Yu Zhao <yuzhao@google.com>
cc: linux-mm@kvack.org, hannes@cmpxchg.org, riel@surriel.com, 
    shakeel.butt@linux.dev, roman.gushchin@linux.dev, david@redhat.com, 
    npache@redhat.com, baohua@kernel.org, ryan.roberts@arm.com, 
    rppt@kernel.org, willy@infradead.org, cerasuolodomenico@gmail.com, 
    ryncsn@gmail.com, corbet@lwn.net, linux-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org, kernel-team@meta.com, 
    Shuang Zhai <zhais@google.com>
Subject: Re: [PATCH v5 1/6] mm: free zapped tail pages when splitting isolated
 thp
In-Reply-To: <20240830100438.3623486-2-usamaarif642@gmail.com>
Message-ID: <1d490ab5-5cf8-4c16-65d0-37a62999fcd5@google.com>
References: <20240830100438.3623486-1-usamaarif642@gmail.com> <20240830100438.3623486-2-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Aug 2024, Usama Arif wrote:

> From: Yu Zhao <yuzhao@google.com>
> 
> If a tail page has only two references left, one inherited from the
> isolation of its head and the other from lru_add_page_tail() which we
> are about to drop, it means this tail page was concurrently zapped.
> Then we can safely free it and save page reclaim or migration the
> trouble of trying it.
> 
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> Tested-by: Shuang Zhai <zhais@google.com>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>

I'm sorry, but I think this patch (just this 1/6) needs to be dropped:
it is only an optimization, and unless a persuasive performance case
can be made to extend it, it ought to go (perhaps revisited later).

The problem I kept hitting was that all my work, requiring compaction and
reclaim, got (killably) stuck in or repeatedly calling reclaim_throttle():
because nr_isolated_anon had grown high - and remained high even when the
load had all been killed.

Bisection led to the 2/6 (remap to shared zeropage), but I'd say this 1/6
is the one to blame. I was intending to send this patch to "fix" it:

--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3295,6 +3295,8 @@ static void __split_huge_page(struct pag
 			folio_clear_active(new_folio);
 			folio_clear_unevictable(new_folio);
 			list_del(&new_folio->lru);
+			node_stat_sub_folio(folio, NR_ISOLATED_ANON +
+						folio_is_file_lru(folio));
 			if (!folio_batch_add(&free_folios, new_folio)) {
 				mem_cgroup_uncharge_folios(&free_folios);
 				free_unref_folios(&free_folios);

And that ran nicely, until I terminated the run and did
grep nr_isolated /proc/sys/vm/stat_refresh /proc/vmstat
at the end: stat_refresh kindly left a pr_warn in dmesg to say
nr_isolated_anon -334013737

My patch is not good enough. IIUC, some split_huge_pagers (reclaim?)
know how many pages they isolated and decremented the stats by, and
increment by that same number at the end; whereas other split_huge_pagers
(migration?) decrement one by one as they go through the list afterwards.

I've run out of time (I'm about to take a break): I gave up researching
who needs what, and was already feeling this optimization does too much
second guessing of what's needed (and its array of VM_WARN_ON_ONCE_FOLIOs
rather admits to that).

And I don't think it's as simple as moving the node_stat_sub_folio()
into 2/6 where the zero pte is substituted: that would probably handle
the vast majority of cases, but aren't there others which pass the
folio_ref_freeze(new_folio, 2) test - the title's zapped tail pages,
or racily truncated now that the folio has been unlocked, for example?

Hugh

