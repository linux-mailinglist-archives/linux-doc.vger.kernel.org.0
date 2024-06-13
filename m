Return-Path: <linux-doc+bounces-18469-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB87906465
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 08:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 031742854F1
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 06:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E91137758;
	Thu, 13 Jun 2024 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M9CSiT8d"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0653E135A6F
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 06:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718261397; cv=none; b=KW+PGutO3mkkvwxbtPPU8fzMizDL96ns9u0XY3E4UIY6BkPt/6VAaWLeIPK+VJHpLUsnu7r7+XSJivg2R98jkLjFiFm2Ypi/ymA1EpsvsKkaBWSD9TEVCM5qeV0KkLDLMNG/lNhWKOow1WZSqkAg8AqSJiR3PKPsoxUUQlQhZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718261397; c=relaxed/simple;
	bh=Q9ytFUaZFqi/5BMymYxqCA95wvqaeZhoarb+e5F9yPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFstLM5ocnbK9winfJ/q0HaWlPWCMsElKT9zLXFFwfnK7Ch5Q9VMf/id7eYIBzcL+4zMG06Xr+cjDA19hEjgSP7DzVoiKrfJC5fN1yPEFyqQJghSBUfVGJ1S2NKlK/t++wOikiISRZzfcs3BkM+hSGgY244XLuX0XBzKRdxfeaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M9CSiT8d; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: seanjc@google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718261393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dUgr+f5/S1BYrMzUIzzHoZq+nuXyyf5V0WdYC25Cd8s=;
	b=M9CSiT8dKaHTw3piv1V6oTj1KqOQyfs8CvaI3RQ5vdJYFt99RH8vNd3LFbE9PIVk8OwVas
	XLz0PROCqSuYLAzNwIijJmurJ/2zA913Ie50WmEJwiiEM6WIAqspuiwNr8jfX+PHrPS0PA
	FrxV+3EAzC1TIsW+x5UmXdQ/vywRTBQ=
X-Envelope-To: yuzhao@google.com
X-Envelope-To: jthoughton@google.com
X-Envelope-To: akpm@linux-foundation.org
X-Envelope-To: pbonzini@redhat.com
X-Envelope-To: ankita@nvidia.com
X-Envelope-To: axelrasmussen@google.com
X-Envelope-To: catalin.marinas@arm.com
X-Envelope-To: dmatlack@google.com
X-Envelope-To: rientjes@google.com
X-Envelope-To: james.morse@arm.com
X-Envelope-To: corbet@lwn.net
X-Envelope-To: maz@kernel.org
X-Envelope-To: rananta@google.com
X-Envelope-To: ryan.roberts@arm.com
X-Envelope-To: shahuang@redhat.com
X-Envelope-To: suzuki.poulose@arm.com
X-Envelope-To: weixugc@google.com
X-Envelope-To: will@kernel.org
X-Envelope-To: yuzenghui@huawei.com
X-Envelope-To: kvmarm@lists.linux.dev
X-Envelope-To: kvm@vger.kernel.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-mm@kvack.org
Date: Wed, 12 Jun 2024 23:49:43 -0700
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Yu Zhao <yuzhao@google.com>, James Houghton <jthoughton@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shaoqin Huang <shahuang@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v5 8/9] mm: multi-gen LRU: Have secondary MMUs
 participate in aging
Message-ID: <ZmqWhw3eKzwwWUHN@linux.dev>
References: <20240611002145.2078921-1-jthoughton@google.com>
 <20240611002145.2078921-9-jthoughton@google.com>
 <ZmnGlpBR91TyI3Lt@google.com>
 <CAOUHufYCmYNngmS=rOSAQRB0N9ai+mA0aDrB9RopBvPHEK42Ng@mail.gmail.com>
 <ZmnZmj8iVmcLf8fo@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmnZmj8iVmcLf8fo@google.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 12, 2024 at 10:23:38AM -0700, Sean Christopherson wrote:
> On Wed, Jun 12, 2024, Yu Zhao wrote:
> > I do think there can be false negatives but we have not been able to
> > measure their practical impacts since we disabled the flush on some
> > host MMUs long ago (NOT by MGLRU), e.g., on x86 and ppc,
> > ptep_clear_flush_young() is just ptep_test_andclear_young().
> 
> Aha!  That's what I was missing, I somehow didn't see x86's ptep_clear_flush_young().

Heh, well the helper name isn't exactly giving any hints...

> That begs the question, why does KVM flush TLBs on architectures that don't need
> to?  And since kvm_mmu_notifier_clear_young() explicitly doesn't flush, are there
> even any KVM-supported architectures for which the flush is mandatory?
> 
> Skipping the flush on KVM x86 seems like a complete no-brainer.
> 
> Will, Marc and/or Oliver, what are arm64's requirements in this area?  E.g. I see
> that arm64's version of __ptep_clear_flush_young() does TLBI but not DSB.  Should
> KVM be doing something similar?  Can KVM safely skip even the TBLI?

Short answer, yes, KVM can elide TLBIs when clearing AF.

Long answer: Software needs to be extremely careful to ensure that TLBI
elision doesn't lead to a failure to uphold break-before-make requirements,
if we're only concerned with architecture-specific requirements. IOW, the AF
cannot be used as a hint for the presence of TLB entries for a given PTE.

There's the obvious failure of skipping TLBIs for old pages when
unmapping, but that isn't an architecture-specific issue.

So, since KVM/arm64 doesn't play any games with the AF at stage-2, leaving
out a TLBI when aging ought to be fine.

-- 
Thanks,
Oliver

