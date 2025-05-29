Return-Path: <linux-doc+bounces-47764-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E652AC7FE9
	for <lists+linux-doc@lfdr.de>; Thu, 29 May 2025 16:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12F8F7AED5C
	for <lists+linux-doc@lfdr.de>; Thu, 29 May 2025 14:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C66921C9F5;
	Thu, 29 May 2025 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hyXLQnv7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D7D1F3BAB
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748530614; cv=none; b=U9DutL3PlBGogqm7yX/W2UozQHvlwrp3asI6tDB+HnMmzN6HpPYLZSYpa2AnVTK+7GR958brk8xOTiconx9mfmQ4sZqkf6TQXH+KvwXhWJzpXhXSjuATBQb5I0Bk/Hlx8GRP7XdXZwVf1nF7Igq2DFezr4pbljUYK1YCKHf2Jfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748530614; c=relaxed/simple;
	bh=B1zsO3xLB87dBpNzAoGuj+8RJlTANU2xKvOZOU1twOU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sNqyf3HLg/WCziaFt38YWruUcmvBGxa/xvKqDBpktYLiCW76SgoraLjoTqBxjrjz8rZnv+gvjrQdt7SSA1M+yJxvOSEnbMB0hbJkK0iUdy01G+u5L73ANvuRLUJJNPGnVkHYVE76n3NUWPlueMy2tPUw2vPpE/Pf8NoTeswpYR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hyXLQnv7; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a59538b17so986717a91.3
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748530612; x=1749135412; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wtc8z1lt0l7J7qwleBMoPVIkOE4MKmf5AJAUWp638/g=;
        b=hyXLQnv7oXEntBAzMTAPyUhwAnRTHCci3ptm+H6vpNjcZ1SBsaYZSIS29rQ37BWRpM
         nKzmyry1m8ComuGB7/wEP6B9vDah1u8dqm/H3gOFh3VDFjK+ZSlbcGMOtKXMiDAiiZku
         lFOo3WOLxA5IzhFi5bgUXGTJ9TwfWXvBU+aLki3q/k4yE2nNC9zwlpZtzd2ekdFrrr6F
         lxP5/6WNKc8IgRWY+EBOE9ZCn2LQW90EoDlj3uMzQsRSgqXilJEdL7hiMmIHjMHoxxUT
         4w/Hetq61CgISID1WKgCiGeboNyuxjhIplPTnToCLy1X9M/Rxgqn181FNyXpnmzxy1RM
         miwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748530612; x=1749135412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wtc8z1lt0l7J7qwleBMoPVIkOE4MKmf5AJAUWp638/g=;
        b=hysIjtfxAkQdhOqlB9OhHaa6YEvaxtG7oGLZJnPvQrfr7ie/3ibuy2dg4QtWBDalHr
         iILSzReGGvwlC7M+mXDJzVk3pf6wKoZkGUhq2qeCIcXl7GpeDrnYl1bC5TWC1j4ODD0h
         CrnvaSheCkTGg5TB92stk4QMfDjIhY4CZ6+gXE+hMpCs3oGJ8QcevwWHYrKORKEscuBz
         4+/pRvFEcrgPp8fVe9opeYctVk3iqd+owmcfIjBeNc0W6DerToYNsvGCqMVF+pSbATiL
         TXXU8VqeVgkrugIOvakHKyPBmfXyHC5DdT2ge4fUMOy3qO2TPrT00o8CBH8BRvhXoMcV
         n3/g==
X-Forwarded-Encrypted: i=1; AJvYcCUGhD+hir3/lyd96WG9uHgQchpzyFyuc3r7agOrGrpj9Rm3ftrjVWqldTjUV89m/06tm3ZdsCGYpR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjtcvBZsTZ50j3bq/IFwXlerWxXXKQ3MbJnt8R3d+KSvuSCapL
	jrGJK1E3zPfQpVpdhtLhszoA2XaDLSxkGGYulYYTuOYFn08QLnWrHUM5YXm9GLnEJMhz4QMCSsk
	1U7o7Kw==
X-Google-Smtp-Source: AGHT+IEOksNt6WLBVwwH9cCjd/EZtQ2Y3bLCTU4Al9fuM3w6GA9Cf3/1B4op9exa2/CpdjOTCglkD0RIbFs=
X-Received: from pjbpq14.prod.google.com ([2002:a17:90b:3d8e:b0:311:2c1f:b0d8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c09:b0:30c:4b1d:330
 with SMTP id 98e67ed59e1d1-311e7460123mr9878567a91.27.1748530611851; Thu, 29
 May 2025 07:56:51 -0700 (PDT)
Date: Thu, 29 May 2025 07:56:50 -0700
In-Reply-To: <aDd-lbrJAX62UQLn@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-6-jthoughton@google.com> <aBqj3s8THH9SFzLO@google.com>
 <aDdwXrbAHmVqu0kA@linux.dev> <aDd-lbrJAX62UQLn@google.com>
Message-ID: <aDh1sgc5oAYDfGnF@google.com>
Subject: Re: [PATCH v2 05/13] KVM: x86/mmu: Add support for KVM_MEM_USERFAULT
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, May 28, 2025, Sean Christopherson wrote:
> On Wed, May 28, 2025, Oliver Upton wrote:
> > On Tue, May 06, 2025 at 05:05:50PM -0700, Sean Christopherson wrote:
> > > > +	if ((old_flags ^ new_flags) & KVM_MEM_USERFAULT &&
> > > > +	    (change == KVM_MR_FLAGS_ONLY)) {
> > > > +		if (old_flags & KVM_MEM_USERFAULT)
> > > > +			kvm_mmu_recover_huge_pages(kvm, new);
> > > > +		else
> > > > +			kvm_arch_flush_shadow_memslot(kvm, old);
> > > 
> > > The call to kvm_arch_flush_shadow_memslot() should definitely go in common code.
> > > The fancy recovery logic is arch specific, but blasting the memslot when userfault
> > > is toggled on is not.
> > 
> > Not like anything in KVM is consistent but sprinkling translation
> > changes / invalidations between arch and generic code feels
> > error-prone.
> 
> Eh, leaving critical operations to arch code isn't exactly error free either :-)
> 
> > Especially if there isn't clear ownership of a particular flag, e.g. 0 -> 1
> > transitions happen in generic code and 1 -> 0 happens in arch code.
> 
> The difference I see is that removing access to the memslot on 0=>1 is mandatory,
> whereas any action on 1=>0 is not.  So IMO it's not arbitrary sprinkling of
> invalidations, it's deliberately putting the common, mandatory logic in generic
> code, while leaving optional performance tweaks to arch code.
> 
> > Even in the case of KVM_MEM_USERFAULT, an architecture could potentially
> > preserve the stage-2 translations but reap access permissions without
> > modifying page tables / TLBs.
> 
> Yes, but that wouldn't be strictly unique to KVM_MEM_USERFAULT.
> 
> E.g. for NUMA balancing faults (or rather, the PROT_NONE conversions), KVM could
> handle the mmu_notifier invalidations by removing access while keeping the PTEs,
> so that faulting the memory back would be a lighter weight operation.  Ditto for
> reacting to other protection changes that come through mmu_notifiers.
> 
> If we want to go down that general path, my preference would be to put the control
> logic in generic code, and then call dedicated arch APIs for removing protections.
> 
> > I'm happy with arch interfaces that clearly express intent (make this
> > memslot inaccessible), then the architecture can make an informed
> > decision about how to best achieve that. Otherwise we're always going to
> > use the largest possible hammer potentially overinvalidate.
> 
> Yeah, definitely no argument there given x86's history in this area.  Though if
> we want to tackle that problem straightaway, I think I'd vote to add the
> aforementioned dedicated APIs for removing protections, with a generic default
> implementation that simply invokes kvm_arch_flush_shadow_memslot().

Alternatively, we could punt on this issue entirely by not allowing userspace to
set KVM_MEM_USERFAULT on anything but KVM_MR_CREATE.  I.e. allow a FLAGS_ONLY
update to clear USERFAULT, but not set USERFAULT.

Other than emulating poisoned pages, is there a (potential) use case for setting
KVM_MEM_USERFAULT after a VM has been created?

