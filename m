Return-Path: <linux-doc+bounces-39462-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4FA451C6
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 01:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDC22189A37C
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 00:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5938915382E;
	Wed, 26 Feb 2025 00:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kvMIoC7o"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04191531E8
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 00:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740531543; cv=none; b=aynrVIF41hBsvKXdXx0dRLWRbX+PMqO7O3IJXze2fF9ldW7OWZgU6zBoTRjRSY7jEe7TOdbWnD2FLGyV20COJMKOLzENPmwIbOkgvMLLyMC6JQbnan5g0zDhyTE2/wZ5ZIoU7lpdTV77OP4CFg3a4+7qRcdP8B8UReGDZvlY6P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740531543; c=relaxed/simple;
	bh=pEtfZVCVm3/XOugzU8Ltx4f7z/cLwxmkARQ2R+6a/Qc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JhtvNTM0o5mk4rWaqedhT76R5HLmfLQdbOkuU0Vhe8dOzWoP5g9IfpBzsIgrvISuPTANZtxjhEAYkOTO/dTtC6UzlMuhYkSpdQ5mQnJC+7eG6kID2X6ixdeE8tvbXjpUgBTMGvJm7Imo0EOa5CrhnoBcWhICvMekJ+8ou8BpDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kvMIoC7o; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fe86c01f4aso63910a91.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 16:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740531541; x=1741136341; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfE+FYiAOd9DAOybGgX5laywdzU/CIqHsXJrp0PBGSY=;
        b=kvMIoC7onJ9el6359P2kksBcw1fUyvFQ5BG00eaS6r6g7Lk+2z3Iq1cKWUEIegi8G3
         FNgUCWwkwwLUasxSDULJOataRitRltGWLhdiEw9uGw5eNLMcnLv/16ekUoZJN80HORm9
         skeNhoAkG2HWFo6Zq39yfiw2VmdSGzhnbbc8gFZjVa3iu49iiZg6hpNcjkG9qw/yyTDO
         9IvwBR/wVDP6ybkDGJDaEJKM7JEDJS3KGkOOsbNq/cXaXX0BCoAnMbA+WPAJDHfP5EwA
         6hQ5TreFgBS6aWqyegaV+NZ70Ir2udjvuBb1eUyIt7Yqo1ocyGXOWOMdO+tAWHhQpzes
         2E9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740531541; x=1741136341;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BfE+FYiAOd9DAOybGgX5laywdzU/CIqHsXJrp0PBGSY=;
        b=ToK7/FLPQwQL2s7HNjChkWxLCwVAGFkh0Xt8aNxZnFKRjn6gHUx4GkwgMcEV6p243G
         hk34lxCDsgpDuPsSth90xamlFXmzJZGhYvRKCR5Cv/IIPm7cQfD1MSx5RKydin1ac8Bo
         vievwF5ibtGMmo4IQcnePMnXMPa+5CY5FoJRRbKsBk3MBS6+HyzlrdHL2tiWaMMyHxOt
         gpFggvuwy9uwIpR72b1Sd0087Rq47RoyhejO/pUlvybP+nRv9UHxX+o63rRxy2gzv9BR
         ceUhY7CMhK+jCzSiteuKXRL4WSy/1l84yVhOYcj5YWUx2c23PL4cySAXyXt4nVWBYZdj
         PhnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU0MsAiDanWGt3Ke0VqhZoiBnlr532Mh2rlhwfkXxLhmWI/GLcb3N1hlKAd04hbebcwBynST5JoiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9bUkrOg6EfXXX5YLptywP0bF/9QSW4MZBuwz+Fk715eKIy+G
	t2+Hm7Pjv6KDdHRyMvmdkpXmMn7zVAF9cFb9hv+pZ38AzfrMiKT3+bM8IDS/ndN7MjUpGfiXZry
	bwg==
X-Google-Smtp-Source: AGHT+IFyXk03Mdjf7OBLIfTSLB6+EQPz/jBslrwK2d8KkEi7ba7NS0D3gxx1v5rFfPJNkg1JKx26oqdIPiY=
X-Received: from pjbqb10.prod.google.com ([2002:a17:90b:280a:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2708:b0:2f2:3efd:96da
 with SMTP id 98e67ed59e1d1-2fe7e39f297mr2345354a91.24.1740531541052; Tue, 25
 Feb 2025 16:59:01 -0800 (PST)
Date: Tue, 25 Feb 2025 16:58:47 -0800
In-Reply-To: <f820b630-13c1-4164-baa8-f5e8231612d1@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241118123948.4796-1-kalyazin@amazon.com> <Z6u-WdbiW3n7iTjp@google.com>
 <a7080c07-0fc5-45ce-92f7-5f432a67bc63@amazon.com> <Z7X2EKzgp_iN190P@google.com>
 <6eddd049-7c7a-406d-b763-78fa1e7d921b@amazon.com> <Z7d5HT7FpE-ZsHQ9@google.com>
 <f820b630-13c1-4164-baa8-f5e8231612d1@amazon.com>
Message-ID: <Z75nRwSBxpeMwbsR@google.com>
Subject: Re: [RFC PATCH 0/6] KVM: x86: async PF user
From: Sean Christopherson <seanjc@google.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, jthoughton@google.com, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, vkuznets@redhat.com, gshan@redhat.com, 
	graf@amazon.de, jgowans@amazon.com, roypat@amazon.co.uk, derekmn@amazon.com, 
	nsaenz@amazon.es, xmarcalx@amazon.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 21, 2025, Nikita Kalyazin wrote:
> On 20/02/2025 18:49, Sean Christopherson wrote:
> > On Thu, Feb 20, 2025, Nikita Kalyazin wrote:
> > > On 19/02/2025 15:17, Sean Christopherson wrote:
> > > > On Wed, Feb 12, 2025, Nikita Kalyazin wrote:
> > > > The conundrum with userspace async #PF is that if userspace is given only a single
> > > > bit per gfn to force an exit, then KVM won't be able to differentiate between
> > > > "faults" that will be handled synchronously by the vCPU task, and faults that
> > > > usersepace will hand off to an I/O task.  If the fault is handled synchronously,
> > > > KVM will needlessly inject a not-present #PF and a present IRQ.
> > > 
> > > Right, but from the guest's point of view, async PF means "it will probably
> > > take a while for the host to get the page, so I may consider doing something
> > > else in the meantime (ie schedule another process if available)".
> > 
> > Except in this case, the guest never gets a chance to run, i.e. it can't do
> > something else.  From the guest point of view, if KVM doesn't inject what is
> > effectively a spurious async #PF, the VM-Exiting instruction simply took a (really)
> > long time to execute.
> 
> Sorry, I didn't get that.  If userspace learns from the
> kvm_run::memory_fault::flags that the exit is due to an async PF, it should
> call kvm run immediately, inject the not-present PF and allow the guest to
> reschedule.  What do you mean by "the guest never gets a chance to run"?

What I'm saying is that, as proposed, the API doesn't precisely tell userspace
an exit happened due to an "async #PF".  KVM has absolutely zero clue as to
whether or not userspace is going to do an async #PF, or if userspace wants to
intercept the fault for some entirely different purpose.

> > > If we are exiting to userspace, it isn't going to be quick anyway, so we can
> > > consider all such faults "long" and warranting the execution of the async PF
> > > protocol.  So always injecting a not-present #PF and page ready IRQ doesn't
> > > look too wrong in that case.
> > 
> > There is no "wrong", it's simply wasteful.  The fact that the userspace exit is
> > "long" is completely irrelevant.  Decompressing zswap is also slow, but it is
> > done on the current CPU, i.e. is not background I/O, and so doesn't trigger async
> > #PFs.
> > 
> > In the guest, if host userspace resolves the fault before redoing KVM_RUN, the
> > vCPU will get two events back-to-back: an async #PF, and an IRQ signalling completion
> > of that #PF.
> 
> Is this practically likely?

Yes, I think's it's quite possible.

> At least in our scenario (Firecracker snapshot restore) and probably in live
> migration postcopy, if a vCPU hits a fault, it's probably because the content
> of the page is somewhere remote (eg on the source machine or wherever the
> snapshot data is stored) and isn't going to be available quickly.

Unless the remote page was already requested, e.g. by a different vCPU, or by a
prefetching algorithim.

> Conversely, if the page content is available, it must have already been
> prepopulated into guest memory pagecache, the bit in the bitmap is cleared
> and no exit to userspace occurs.

But that doesn't happen instantaneously.  Even if the VMM somehow atomically
receives the page and marks it present, it's still possible for marking the page
present to race with KVM checking the bitmap.

> > > > > What advantage can you see in it over exiting to userspace (which already exists
> > > > > in James's series)?
> > > > 
> > > > It doesn't exit to userspace :-)
> > > > 
> > > > If userspace simply wakes a different task in response to the exit, then KVM
> > > > should be able to wake said task, e.g. by signalling an eventfd, and resume the
> > > > guest much faster than if the vCPU task needs to roundtrip to userspace.  Whether
> > > > or not such an optimization is worth the complexity is an entirely different
> > > > question though.
> > > 
> > > This reminds me of the discussion about VMA-less UFFD that was coming up
> > > several times, such as [1], but AFAIK hasn't materialised into something
> > > actionable.  I may be wrong, but James was looking into that and couldn't
> > > figure out a way to scale it sufficiently for his use case and had to stick
> > > with the VM-exit-based approach.  Can you see a world where VM-exit
> > > userfaults coexist with no-VM-exit way of handling async PFs?
> > 
> > The issue with UFFD is that it's difficult to provide a generic "point of contact",
> > whereas with KVM userfault, signalling can be tied to the vCPU, and KVM can provide
> > per-vCPU buffers/structures to aid communication.
> > 
> > That said, supporting "exitless" KVM userfault would most definitely be premature
> > optimization without strong evidence it would benefit a real world use case.
> 
> Does that mean that the "exitless" solution for async PF is a long-term one
> (if required), while the short-term would still be "exitful" (if we find a
> way to do it sensibly)?

My question on exitless support was purely exploratory, just ignore it for now.

