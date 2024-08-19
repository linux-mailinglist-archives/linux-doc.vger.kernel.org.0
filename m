Return-Path: <linux-doc+bounces-23250-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 679279575E4
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 22:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00FAEB21112
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 20:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D75415A84A;
	Mon, 19 Aug 2024 20:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QjckSWmi"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8861815921B
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 20:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724100128; cv=none; b=MGXQAV7+V9XPf+lUfbCpbiWJewIOJyN5UdcQBnzCZJUYW613Acm3B8y/6nyjU44QxAh7E6608vXozUsoFxQ5GNcsQVEb1LfYvEiKH0QAg59topnOcfq2EGrphOJGfRw6BBBXDeT+mhhadgXrC49UDxGMEiLGpSLOl3NLOTKHg+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724100128; c=relaxed/simple;
	bh=Dt1Ff7fKLLYPfMaJ4kJTzH4evyvUMfCz59lijmotGOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQRJd794fpSU3GWVoHek3ZVTl6lomfkSFTXVjfvc8dTBKfsxJRXFAz5imdupLli4yiIfkTRGYYsS3faN3KrGF6TEj7j5eN5Nm45lx8YjRUj/MwwEmuF699avC7cSOSFnB8tXKjmXgy72UMEU4MVQinVGP6AmTGteF9+65gprypY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QjckSWmi; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 19 Aug 2024 20:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724100121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Y168q5crzOyuR0vBXeOnFBth7VvFqg3LAjS8RW/lCM=;
	b=QjckSWmi/C6logVG6INyLTdl2yFG7ehaLWTfObZBDHmH29dWtGBfep0KYv6Z9gBDYeh9S+
	B6R9XRrjvorKQxuRIfjSMJWax726Gq0p6dIEjHG9Ct8t5QfdejAKRHlb7mGX73T27kmL/f
	3zLPC94bHuABE9SXOJjRNTeVEwEQcVA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yu Zhao <yuzhao@google.com>
Cc: Sean Christopherson <seanjc@google.com>,
	James Houghton <jthoughton@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	James Morse <james.morse@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shaoqin Huang <shahuang@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Wei Xu <weixugc@google.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v6 03/11] KVM: arm64: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
Message-ID: <ZsOuEP6P0v45ffC0@linux.dev>
References: <20240724011037.3671523-1-jthoughton@google.com>
 <20240724011037.3671523-4-jthoughton@google.com>
 <CADrL8HV5M-n72KDseDKWpGrUVMjC147Jqz98PxyG2ZeRVbFu8g@mail.gmail.com>
 <Zr_y7Fn63hdowfYM@google.com>
 <CAOUHufYc3hr-+fp14jgEkDN++v6t-z-PRf1yQdKtnje6SgLiiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOUHufYc3hr-+fp14jgEkDN++v6t-z-PRf1yQdKtnje6SgLiiA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Aug 16, 2024 at 07:03:27PM -0600, Yu Zhao wrote:
> On Fri, Aug 16, 2024 at 6:46 PM Sean Christopherson <seanjc@google.com> wrote:

[...]

> > Were you expecting vCPU runtime to improve (more)?  If so, lack of movement could
> > be due to KVM arm64 taking mmap_lock for read when handling faults:
> >
> > https://lore.kernel.org/all/Zr0ZbPQHVNzmvwa6@google.com
> 
> For the above test, I don't think it's mmap_lock

Yeah, I don't think this is related to the mmap_lock.

James is likely using hardware that has FEAT_HAFDBS, so vCPUs won't
fault for an Access flag update. Even if he's on a machine w/o it,
Access flag faults are handled outside the mmap_lock.

Forcing SW management of the AF at stage-2 would be the best case for
demonstrating the locking improvement:

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index a24a2a857456..a640e8a8c6ea 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -669,8 +669,6 @@ u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
 	 * happen to be running on a design that has unadvertised support for
 	 * HAFDBS. Here be dragons.
 	 */
-	if (!cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
-		vtcr |= VTCR_EL2_HA;
 #endif /* CONFIG_ARM64_HW_AFDBM */
 
 	if (kvm_lpa2_is_enabled())

Changing the config option would work too, but I wasn't sure if
FEAT_HAFDBS on the primary MMU influenced MGLRU heuristics.

> -- the reclaim path,
> e.g., when zswapping guest memory, has two stages: aging (scanning
> PTEs) and eviction (unmapping PTEs). Only testing the former isn't
> realistic at all.

AIUI, the intention of this test data is to provide some justification
for why Marc + I should consider the locking change *outside* of any
MMU notifier changes. So from that POV, this is meant as a hacked
up microbenchmark and not meant to be realistic.

And really, the arm64 change has nothing to do with this series at
this point, which is disappointing. In the interest of moving this
feature along for both architectures, would you be able help James
with:

 - Identifying a benchmark that you believe is realistic

 - Suggestions on how to run that benchmark on Google infrastructure

Asking since you had a setup / data earlier on when you were carrying
the series. Hopefully with supportive data we can get arm64 to opt-in
to HAVE_KVM_MMU_NOTIFIER_YOUNG_FAST_ONLY as well.

-- 
Thanks,
Oliver

