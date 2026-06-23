Return-Path: <linux-doc+bounces-93163-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kUZuHvDfOWrkyQcAu9opvQ
	(envelope-from <linux-doc+bounces-93163-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 03:22:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B8D6B3277
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 03:22:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=pZvVIr5q;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93163-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93163-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADC7B302C16E
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 01:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CE3379998;
	Tue, 23 Jun 2026 01:22:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85983378D7F
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 01:22:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782177768; cv=none; b=BdQXk7sS4tydO4aOXsBpc0HnWJH0pMYKcbOLzJ7QXiVDVY39FM1jXiC/jU39CBkgKTkgt1FqmBqN/C5JlqIxHxzZeU6jX2El92ZIvQ8woKHo2Y6YoqY0aFGc4JczGFnzbay+JPdkdHIBydpzQeAzBR5Bejqsy24ajFXGcwLms2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782177768; c=relaxed/simple;
	bh=dFe2FI4dOmbgg56+MmHgIOFrB/nhq/z0xCIy1SQ3BBI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mIs3JCdSIujjuwiLKqWFSKYxIavR2p0hvUC6CI6H4epIaj2ENEjv+wKXuwaEx1iwrDT6ssGpKi7RJDOZaEcPchzprxgxhKADwtDyiZz15MLDArkW7MPr6RSOuuPu1g+9l6aMcjO7Qx/S81HHItH2AnY4I4vUPGQkj32LjiXnoWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pZvVIr5q; arc=none smtp.client-ip=209.85.215.201
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c891ed872ddso3353005a12.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 18:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782177767; x=1782782567; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QZV3uH/IPwxj9lEYe1ZUXoqPM2qjMTtjeMRmC3XTGao=;
        b=pZvVIr5qCmoZ+VdSePQ6NSqlc/lXeCPf1u0qTCRN6pMvymiBXXbZ0kxfJ+w3eG7Nnr
         /tv3BiFFdX8v2DFVRMxFbFU2GaqEOPov2LXJJj08S/aX3iPuBqNJoAX5iG7WHUqeUiqn
         ZuOh+Agkq4Y0lzTO6UA1icEWLpBENNG78Z8UxdcUl4WaMizfVSW80xt4Lo5ICFXXRhAZ
         /+ugEyVe5JhOsBMB5W65l48O/sCzG1oVrF2p6dq/jnmrcJbZqn3nI+oyxql/oAOQ8gRA
         DlXoaH0mVXm4v7vRFvz0a0/qBeZtdz20nvt1hk1xzwZZGGHn7MFEVp1vDVlfAQJMs7rT
         oqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782177767; x=1782782567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZV3uH/IPwxj9lEYe1ZUXoqPM2qjMTtjeMRmC3XTGao=;
        b=c0ZngXhKn8Akw+GrAJq2PeV/j2mFx6+A7hzboemrswaRdQXrYqlgDnWwR7MvEHq6fv
         0KCpq7ITM/W9n+eZJJOUFuYiL7Ig5WIBMlrElFebVj1RFfro58gecVy0vc2j2mUhV9Ez
         7qEJuew/yq8zx1uMNt0mnaaCde3TCButJNgHsTQM4eAZhIDnhcS5909lGgaQN+C7L7wD
         8cLjlzmkWz/CVuoROUSPqTMDqoyk6E6hoMSC7Oftr3fAFGaH/ApibFYplmXD1W5UJ/vG
         +dXvUmCLRIk9hdHTwJpjMs6kpSj/yPtXpLpflzn+N51zjU1y8oMeXPCwDAdpqUTMGvCb
         o4mA==
X-Forwarded-Encrypted: i=1; AFNElJ8XunqN2OsIkaUaFUAA1b4mM/UW5GoEdmfcKXzISjCWg7K4fPvGUiJ5UHhePF/PJCJsXtHYHvCRTcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVdh69s9OZfsFgOb4txA+OVecwQBb/FEMpHXo/ghbXS2IvZRBp
	ULvi1pSCmFW1lbT9RqzpennH2UJiMIasSLOJCoZl7RWAeTSop42oXdZA6KC4OETDFPIvGkBviLO
	UhSLZFw==
X-Received: from pgbck12.prod.google.com ([2002:a05:6a02:90c:b0:c8a:b173:5516])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d045:b0:3b4:904f:c9cd
 with SMTP id adf61e73a8af0-3bc5181907emr14837899637.6.1782177766311; Mon, 22
 Jun 2026 18:22:46 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:22:45 -0700
In-Reply-To: <ajjc0hw8PjGw69e9@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com> <ajjc0hw8PjGw69e9@yzhao56-desk.sh.intel.com>
Message-ID: <ajnf5Z9nWZxoLS4x@google.com>
Subject: Re: [PATCH v8 23/46] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93163-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yan.y.zhao@intel.com,m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@hu
 aweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14B8D6B3277

On Mon, Jun 22, 2026, Yan Zhao wrote:
> On Thu, Jun 18, 2026 at 05:32:00PM -0700, Ackerley Tng via B4 Relay wrote:
> > From: Ackerley Tng <ackerleytng@google.com>
> > 
> > Update tdx_gmem_post_populate() to handle cases where a source page is
> > not explicitly provided. Instead of returning -EOPNOTSUPP when src_page
> > is NULL, default to using the page associated with the destination PFN.
> > 
> > This change allows for in-place memory conversion where the data is
> > already present in the target PFN, ensuring the TDX module has a valid
> > source page reference for the TDH.MEM.PAGE.ADD operation.
> > 
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  Documentation/virt/kvm/x86/intel-tdx.rst |  4 ++++
> >  arch/x86/kvm/vmx/tdx.c                   | 11 ++++++++---
> >  2 files changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/virt/kvm/x86/intel-tdx.rst b/Documentation/virt/kvm/x86/intel-tdx.rst
> > index 6a222e9d09541..74357fe87f9ec 100644
> > --- a/Documentation/virt/kvm/x86/intel-tdx.rst
> > +++ b/Documentation/virt/kvm/x86/intel-tdx.rst
> > @@ -158,6 +158,10 @@ KVM_TDX_INIT_MEM_REGION
> >  Initialize @nr_pages TDX guest private memory starting from @gpa with userspace
> >  provided data from @source_addr. @source_addr must be PAGE_SIZE-aligned.
> >  
> > +If guest_memfd in-place conversion is enabled, pass NULL for @source_addr to
> > +initialize the memory region using memory contents already populated in
> > +guest_memfd memory.
> > +
> >  Note, before calling this sub command, memory attribute of the range
> >  [gpa, gpa + nr_pages] needs to be private.  Userspace can use
> >  KVM_SET_MEMORY_ATTRIBUTES to set the attribute.
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index ffe9d0db58c59..56d10333c61a7 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -3198,8 +3198,12 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
> >  	if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
> >  		return -EIO;
> >  
> > -	if (!src_page)
> > -		return -EOPNOTSUPP;
> > +	if (!src_page) {
> > +		if (!gmem_in_place_conversion)
> When userspace turns on gmem_in_place_conversion while creating guest_memfd
> without the MMAP flag, the absence of src_page should still be treated as an
> error.

Why MMAP?  Shouldn't this be a general "if (!src_page && !up-to-date)"?  Just
because userspace _can_ mmap() the memory doesn't mean userspace _has_ mmap()'d
and written memory.  And when write() lands, MMAP wouldn't be necessary to
initialize the memory.

> Additionally, to properly enable in-place copying for the TDX initial memory
> region, userspace must not only specify source_addr to NULL, but also follow
> a specific sequence (where steps 1/2/3/7 are required only for in-place copy):
> 1. create guest_memfd with MMAP flag
> 2. mmap the guest_memfd.
> 3. convert the initial memory range to shared.
> 4. copy initial content to the source page.
> 5. convert the initial memory range to private
> 6. invoke ioctl KVM_TDX_INIT_MEM_REGION.
> 7. do not unmap the source backend.
> 
> So, would it be reasonable to introduce a dedicated flag that allows userspace
> to explicitly opt into the in-place copy functionality? e.g.,

Why?  It's userspace's responsibility to get the above right.  If userspace fails
to provide a src_page when it doesn't want in-place copy, that's a userspace bug.

