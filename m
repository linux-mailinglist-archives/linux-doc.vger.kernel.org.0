Return-Path: <linux-doc+bounces-38833-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EE9A3E42D
	for <lists+linux-doc@lfdr.de>; Thu, 20 Feb 2025 19:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14DC3189D047
	for <lists+linux-doc@lfdr.de>; Thu, 20 Feb 2025 18:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEB7262D3C;
	Thu, 20 Feb 2025 18:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WGmpSk0J"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C19262D31
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 18:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740077345; cv=none; b=BPUYeAO8xYEBl55QgmqI1Ss4LEuESK1ltCA0f5ehuGkhHKzg9rCehGZNDvg/5LujDm8KBjb8TuV2LbnViqygehwl87xxmeJpe90poaTBoz9NJpkatlo2E9FLi7y2jirGvtPgFzg7eb77+a9+HEerZH8MNX4zWfmJ4pccguJG1Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740077345; c=relaxed/simple;
	bh=HhmUsnUAA9FXfyyFZW1O/vQBTW1dafCygMEgR1PSV2w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UYwWVsntCR3YRiFXGPe8P53IVPPsiGs0l0k9TbFqKcEoFQtbr5NajwlfepBmWINf5ivUBIOYX9SJFMbFbr5N19jqHKHO9+Djnpt7HXTLrd85uAB4CSyqh6LpJitqmWBv3buSEnzje3hkv86juBni5Ou23W3+SJh4bWXRhaNROJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WGmpSk0J; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc1a4c14d4so2751774a91.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 10:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740077343; x=1740682143; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nrIXE8v94l6Qz63J0EW6oWgUR3NGdxme+Ofja+voZ/I=;
        b=WGmpSk0JTG4rZuTDErNhp7zDGK93oHpE2qdZiC2KwW9Pjm/fVHPXObRNy4G/r9ygwI
         LwWVefCZ+FrWf/MD//EMXRcmwdTQq4s0g/aMIamzf5pGUZu3OkZUKgvavaD91L3Ovai2
         y0NSspvRMCz0glu3CHPlQ5prwa8I5oAiYxhhVUe3TddmORLnH8Ksat0WVeU+Gb/dNw1y
         Dxp1jPyRrulCuLsPcm0x8mNw26hDEX88FN7hLr/ul//Q+k/C4g5Y34mo6eai92Ss7DG6
         d467FSILgsPA4P0Y1rQl9ujj5Kz0RBlwvfcRS9vdZpR3xHs8H+uqoHF2gxp3et64ipBd
         g3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740077343; x=1740682143;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nrIXE8v94l6Qz63J0EW6oWgUR3NGdxme+Ofja+voZ/I=;
        b=HgzYyyMXkHaSK1TDaBfMCLY395TCbIzdJRPRVvD1+ySTSWFKm0nD6LPhZH9xLyE8pc
         vu2t0CFl6KUNs8BO59TNzn4lKv3mZeOU8AZOc1e4sbhdyBolIFrWxDdFgFeZaI6WRKTi
         43O6xKrgFnDss9/aPpSD8nVFlhS+S5Xd83IFA43zFT4dXy1pAX/urSglggTweDOG9TaP
         Koya3LK2+kK+u4iT1Qc+mEl6J6Y3eDlZyGBNnJHNzbsK4W+zknLa+JySTUcDWssuLMXU
         z2tgy6m/FwwaT+QzbKWVa/kY9HLqviBjLfHc8ao76L5upt87O+jacAYaTRpG1tGjdHyv
         RrQg==
X-Forwarded-Encrypted: i=1; AJvYcCVlPlF+CQi9NMi2ncE1HhZyqCkZcqGub8YJTizzErZsNKIZKBNRv/jgLKPEIRSFbOIy3TycBlP0IFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQJlDkLH4gtjQl19eSQ1A6ut/xbUaDX2xmTGKEWiZhGAtJs93
	aBA/rQG2vSrv+fU2licgomXeilBUtGON/Oxp8MjtwQ1ep79r7nfM0/V7PiU7qbq3+TinF9sxV/6
	m9Q==
X-Google-Smtp-Source: AGHT+IHkerbpaVTlWjWkXbgwvL2U1KNbZ8XETkgVM++qObug4lOq8hnkxEb0uReFtMabhh0VMSMpaVYDsx0=
X-Received: from pjboh5.prod.google.com ([2002:a17:90b:3a45:b0:2ef:82c0:cb8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3848:b0:2f9:d9fe:e72e
 with SMTP id 98e67ed59e1d1-2fce78d3e37mr429085a91.16.1740077343307; Thu, 20
 Feb 2025 10:49:03 -0800 (PST)
Date: Thu, 20 Feb 2025 10:49:01 -0800
In-Reply-To: <6eddd049-7c7a-406d-b763-78fa1e7d921b@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241118123948.4796-1-kalyazin@amazon.com> <Z6u-WdbiW3n7iTjp@google.com>
 <a7080c07-0fc5-45ce-92f7-5f432a67bc63@amazon.com> <Z7X2EKzgp_iN190P@google.com>
 <6eddd049-7c7a-406d-b763-78fa1e7d921b@amazon.com>
Message-ID: <Z7d5HT7FpE-ZsHQ9@google.com>
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

On Thu, Feb 20, 2025, Nikita Kalyazin wrote:
> On 19/02/2025 15:17, Sean Christopherson wrote:
> > On Wed, Feb 12, 2025, Nikita Kalyazin wrote:
> > The conundrum with userspace async #PF is that if userspace is given only a single
> > bit per gfn to force an exit, then KVM won't be able to differentiate between
> > "faults" that will be handled synchronously by the vCPU task, and faults that
> > usersepace will hand off to an I/O task.  If the fault is handled synchronously,
> > KVM will needlessly inject a not-present #PF and a present IRQ.
> 
> Right, but from the guest's point of view, async PF means "it will probably
> take a while for the host to get the page, so I may consider doing something
> else in the meantime (ie schedule another process if available)".

Except in this case, the guest never gets a chance to run, i.e. it can't do
something else.  From the guest point of view, if KVM doesn't inject what is
effectively a spurious async #PF, the VM-Exiting instruction simply took a (really)
long time to execute.

> If we are exiting to userspace, it isn't going to be quick anyway, so we can
> consider all such faults "long" and warranting the execution of the async PF
> protocol.  So always injecting a not-present #PF and page ready IRQ doesn't
> look too wrong in that case.

There is no "wrong", it's simply wasteful.  The fact that the userspace exit is
"long" is completely irrelevant.  Decompressing zswap is also slow, but it is
done on the current CPU, i.e. is not background I/O, and so doesn't trigger async
#PFs.

In the guest, if host userspace resolves the fault before redoing KVM_RUN, the
vCPU will get two events back-to-back: an async #PF, and an IRQ signalling completion
of that #PF.

> > > What advantage can you see in it over exiting to userspace (which already exists
> > > in James's series)?
> > 
> > It doesn't exit to userspace :-)
> > 
> > If userspace simply wakes a different task in response to the exit, then KVM
> > should be able to wake said task, e.g. by signalling an eventfd, and resume the
> > guest much faster than if the vCPU task needs to roundtrip to userspace.  Whether
> > or not such an optimization is worth the complexity is an entirely different
> > question though.
> 
> This reminds me of the discussion about VMA-less UFFD that was coming up
> several times, such as [1], but AFAIK hasn't materialised into something
> actionable.  I may be wrong, but James was looking into that and couldn't
> figure out a way to scale it sufficiently for his use case and had to stick
> with the VM-exit-based approach.  Can you see a world where VM-exit
> userfaults coexist with no-VM-exit way of handling async PFs?

The issue with UFFD is that it's difficult to provide a generic "point of contact",
whereas with KVM userfault, signalling can be tied to the vCPU, and KVM can provide
per-vCPU buffers/structures to aid communication.

That said, supporting "exitless" KVM userfault would most definitely be premature
optimization without strong evidence it would benefit a real world use case.

