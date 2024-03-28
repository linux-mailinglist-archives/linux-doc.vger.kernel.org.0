Return-Path: <linux-doc+bounces-12460-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA42885DC6
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 17:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9565C280D34
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 16:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB1C8592D;
	Thu, 21 Mar 2024 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wWAs86Pz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCFD12C814
	for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039039; cv=none; b=LHBOCNHzhG+ExemZqsqSkkZQC+6ua4Ks3UrmBAUCvLwABU5Ph/ECS+S8pdqIEE6dPdlm0eY5Sfe5TaEoV7UrLR19vHkO6KfbyVgMRmuMI8E+F7NYvwDrDOim0dzV1sVj/a1Ez78UAe8PYXK0vTyCVzFf07csp2gtW7sn8oPkWFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039039; c=relaxed/simple;
	bh=HDNKqGkk/azPcTtEhJHN+gpMAx3GoPDUVnE3EYb5Lwg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=elqMevOeMZMA5mcCr2BQm5R06hOosCTKzu9PIb/GQb7PexmCCD6p6CwOP/ocsyhUI3NPkQyQ/m+7hD9CikubqKD5m+TVOaBLjWNIyOs9YHMa4cgnuz+wwshhPvNmrrDNj6yGAtMFHN+5zhc0F1km+z3yrw4kd/TJgzSR9n7x9HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wWAs86Pz; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a54004e9fso21446157b3.3
        for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711039037; x=1711643837; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRKfaiB6dOVHxpZUYVy57amQHTHiIgtHPVa28h/bxKY=;
        b=wWAs86Pzoa7/o4uO9DUaKalp5/lqsafBptAizETSwrwxG543E6aMELKTNZSJkOAIe0
         bRt0Sx5bIrvo0fEeZIMOi/WnS3w8QvJt+cukgQ97dy2sUMu/2XvrkrSPB3wxcsHWECwJ
         gXSz591epccQDT13TSfHCWEmVtILtlUzWaK6lofLdZtFD76e6xRP7kFw62KtCG/PeU3h
         vCzqp4N2MCFbRN6fJ/OGzaUN0Z+fXQRfoKah+oG2oqXKYQLTWQzgy3lkLXpiFckDQa+N
         mwKOtfm5DRQgGMMMcGfaLNoBA9YRBfqKZZyBJ0++lPTsszo1wJOPkxqU9dNzI9czQynf
         t+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711039037; x=1711643837;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRKfaiB6dOVHxpZUYVy57amQHTHiIgtHPVa28h/bxKY=;
        b=BpMvrYEa9NQULg4pHEgRgfVyLTSEToqyviTJDrEmfeRTrexOPEG1bBwzF8JGeyrMfg
         Zo5/9XN7ErS/xhIeR+S0OwNgD7mlN26kRXDg7tbm5If8SsQ1kuVW3du/Wa0Pc5PckHli
         L2TT/FY9IY6ebc6tGTO3ih4Bhp+sOSm/ck1ZEg1gu4Djpw4JLg2A7jG7HCmt1DTnnJ2E
         EnS95L9Hfg6l7R7Z6sVwzCWJJ0foQZbm2sXgE2/NYKcYkK6kcJUkyiLddzpgyzQDryMk
         d1dKN8DA6r7+NW5EtAxl1bT7Iiu45Spl3XjkwOlN2pKPZsJX//k/e/ABRFTERSSIDl69
         ooAw==
X-Forwarded-Encrypted: i=1; AJvYcCVoY9RAmAFuSap6BY3qA3z3V43pmuyDmTx5F2+t2R599ls+N55iSe5xVT/9w6mt/L+wsE4C90NJKuJGURoDASJ7GWyXfYCr4gQ1
X-Gm-Message-State: AOJu0YycDRJ/Pg2K7CWIPC5HD2cYSFbI/cG5KufRA9le+ZFrzHg+2u18
	BbpxfPWEnl56OPfYOh3K03rr2abKPQAJ49u5df7TKWXar31k+2K+CEvTUp0LyXn5ytrAHaAc6a4
	3pg==
X-Google-Smtp-Source: AGHT+IFYgw5ohbM2qs9qWLSKEHVv/3K2+6lhzKzCxOpGXwJ9EG3Fd8M+K30yKZwcBlNXdCTg4+rc5Suy1A8=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:a489:6433:be5d:e639])
 (user=surenb job=sendgmr) by 2002:a05:690c:f88:b0:610:f11e:9d24 with SMTP id
 df8-20020a05690c0f8800b00610f11e9d24mr1686171ywb.4.1711039036599; Thu, 21 Mar
 2024 09:37:16 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:36:25 -0700
In-Reply-To: <20240321163705.3067592-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240321163705.3067592-4-surenb@google.com>
Subject: [PATCH v6 03/37] mm/slub: Mark slab_free_freelist_hook() __always_inline
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, 
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	surenb@google.com, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

It seems we need to be more forceful with the compiler on this one.
This is done for performance reasons only.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 1bb2a93cf7b6..bc9f40889834 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2106,9 +2106,9 @@ bool slab_free_hook(struct kmem_cache *s, void *x, bool init)
 	return !kasan_slab_free(s, x, init);
 }
 
-static inline bool slab_free_freelist_hook(struct kmem_cache *s,
-					   void **head, void **tail,
-					   int *cnt)
+static __fastpath_inline
+bool slab_free_freelist_hook(struct kmem_cache *s, void **head, void **tail,
+			     int *cnt)
 {
 
 	void *object;
-- 
2.44.0.291.gc1ea87d7ee-goog


