Return-Path: <linux-doc+bounces-18315-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3190452D
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 21:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13AF328284D
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 19:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12F713D8BA;
	Tue, 11 Jun 2024 19:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="psDrwT0a"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F6682490
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 19:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718135393; cv=none; b=dwrxhK9J7945z79bVSVEuQ8FRKgoKaswtPPK1PVjAZLyvu2QIgKnzthQEVjnczNa9m1WeOqUsqd2ZLoS3I8X6oidVMU4NorRWgrzVkG7dlJ251GQ07cUSSQcvL37XVwwy8MdPDpZmc+ZXmVEoaAyV3/kDBror2J0xmw7XnCXoq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718135393; c=relaxed/simple;
	bh=/NwHUZCZvevcGs9AY7lN4MhT6WOwaqpKh7KDLpz5U4w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z8F6aZC39QHEwgDN9om0ToaG7Y8JvPyvQmGQw+yl7r6tGjadXuXcoeori4qMxretRN5b3Jmg4xwBgL3/bJi6YUduVzhpUTXfoXCGMNyyK903iMFZ55NbU8iPv05JzU0HiPjpl4R7ePjfW+1d4tcmMRmSrRQDt9n2j+tMSTIop+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=psDrwT0a; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a3dec382eso2138387b3.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 12:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718135391; x=1718740191; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NsScqjx9mfx0RxKgLYLDE8PLKJt3i+CjnwDIOhR5gSU=;
        b=psDrwT0aT/+zOWt7TodmD8clrHhJGj0QJNuitdF9JFwwFohoyYco0Rx8Kn66EBTbPS
         f2nxYuWSycH/oQZJmu+e3NE3idLxOKo3e98Ld+o+DvlK4DHfP16wYnpenX3DpbuzqyGh
         fSXMNgEckdMNyVIYf0VeELQdZNJYzNxpSC9pKC3gh9mDImV31wWcku6W+QSME/2tHxuj
         X4R0YW3kdp77qVPukRwQ7DRO65e9bcg+Bdjv8i1fLqjrButL4e6aFb5ykpJ1T8SZtXyY
         lg46tK6/Z4NJrEtnA3M1/P1AJss0hVT8oM/o++D5LGgB3W41FSFLFHt9AmAucUAkXUlh
         QsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718135391; x=1718740191;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsScqjx9mfx0RxKgLYLDE8PLKJt3i+CjnwDIOhR5gSU=;
        b=CeZYxzA91FinHLyLF65EBdD3Chj8q/3cRhkGAFakogIaOafcxOTxnw+DKWwCJ0NlHU
         EA0K+/EpdCi/2REpJZpPWoGhbid4RV/wtYsKNkM3naFkPRBrWS8iZyVOQyc/pMQQ7ACi
         mDl9aIaH2+8NTXPuASMAXQFqAM9DEQN0fwwecx2kMbs+KAI56XPmCoj9cP02X8nlIR+v
         mbRKikHNnSTTBbdK4a4MaOPXxuquHgvJrfJcGIdKNsTrjGmOeomPfVkFuYMd1nGyJMDh
         2XF8vehp8u0KSqmBZVQJ+odoqoiu+9O7Eb8binUgrG66+WYxY7Ae4qRY9fl1vZWkmtxi
         iLEg==
X-Forwarded-Encrypted: i=1; AJvYcCWhfm60DBCccCrh2GyqrNNm4Ol1PPvB6GqPEd09IKwEAXyx32QFRLfHtDc6j+G/cVKcNbMejmjyQTwB4zi/oFM2jIiTUfmuaW9j
X-Gm-Message-State: AOJu0YxM9EN5Wx27HzgleTEmYO5W88+mPKix9oRmK3Nq8tP3nNw/oV7v
	1iMvY0FB/unKH0mtZTcRhtL/Msd8o/iHFsL/LWpjkorur3aqsaMNF9kACUloJM+3Sl+yvtjLj06
	mrg==
X-Google-Smtp-Source: AGHT+IHKfAK7pE+6MrNjEhC62+VdpwmGAN149yNl7QeE40CZzlXANYBAeDvy6+hs91vFlM0KeuUkc8js0Mw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:ca09:0:b0:627:edcb:cbe2 with SMTP id
 00721157ae682-62f171e8601mr6018567b3.5.1718135391323; Tue, 11 Jun 2024
 12:49:51 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:49:49 -0700
In-Reply-To: <ZmidYAWKU1HANKU6@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240611002145.2078921-1-jthoughton@google.com>
 <20240611002145.2078921-5-jthoughton@google.com> <CAOUHufYGqbd45shZkGCpqeTV9wcBDUoo3iw1SKiDeFLmrP0+=w@mail.gmail.com>
 <CADrL8HVHcKSW3hiHzKTit07gzo36jtCZCnM9ZpueyifgNdGggw@mail.gmail.com> <ZmidYAWKU1HANKU6@linux.dev>
Message-ID: <ZmiqXUwMXtUGanQc@google.com>
Subject: Re: [PATCH v5 4/9] mm: Add test_clear_young_fast_only MMU notifier
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Yu Zhao <yuzhao@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 11, 2024, Oliver Upton wrote:
> On Tue, Jun 11, 2024 at 09:49:59AM -0700, James Houghton wrote:
> > I think consolidating the callbacks is cleanest, like you had it in
> > v2. I really wasn't sure about this change honestly, but it was my
> > attempt to incorporate feedback like this[3] from v4. I'll consolidate
> > the callbacks like you had in v2.
> 
> My strong preference is to have the callers expectations of the
> secondary MMU be explicit. Having ->${BLAH}_fast_only() makes this
> abundantly clear both at the callsite and in the implementation.

Partially agreed.  We don't need a dedicated mmu_notifier API to achieve that
for the callsites, e.g. ptep_clear_young_notify() passes fast_only=false, and a
new ptep_clear_young_notify_fast_only() does the obvious.

On the back end, odds are very good KVM is going to squish the "fast" and "slow"
paths back into a common helper, so IMO having dedicated fast_only() APIs for the
mmu_notifier hooks doesn't add much value in the end.

I'm not opposed to dedicated hooks, but I after poking around a bit, I suspect
that passing a fast_only flag will end up being less cleaner for all parties.

