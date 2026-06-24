Return-Path: <linux-doc+bounces-93434-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u2+ED7paPGqNnAgAu9opvQ
	(envelope-from <linux-doc+bounces-93434-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 00:31:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F186C1C3D
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 00:31:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=EjAQjfaF;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93434-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93434-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BA10300BC9E
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 22:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6643B2D04;
	Wed, 24 Jun 2026 22:31:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7C3AB276
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 22:31:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782340275; cv=none; b=Xtbq5UODE18FJD3CDyGq1nu2JrCXL0capAfeqUp97e+h0dE1BcSE7aW74U9nlquGICbBVlfI8eeZyyovYTAav03yevi1+zeuXVSBov5iva7MSyvEMiT1w1jOjRnHFufW2mB/NxN8usHakt/nXZtj92C4Gt7/7Ms4Tjr1ilpXIPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782340275; c=relaxed/simple;
	bh=s5tBx/7xtCFykAIgDxBHorccHMTIs8SU+hRfK9pT/Nw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bn/FctKSALZj8BkL3XJMYk5L8JiljQGRICiU9EQ07IDEH1snk3sRN3KV9yfppyz73vNeUUG1/IBJ/8TLsI1PVRvnw7ZW1kMoVvswaK2iF7L9FFzx8U5CO++CvK9KDWAsojO201V0Zq+ThdbKNpxsfudbQ2DYBHHTBqOmlopZMWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EjAQjfaF; arc=none smtp.client-ip=209.85.216.74
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-37de6edd915so1118179a91.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782340273; x=1782945073; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9UD0cYPMpLMjUxZJI9vflj/wONeUt3vfrqS2YoALbAM=;
        b=EjAQjfaFYScuTkoPJfjJ6LK+MdTxG6Zk9x4khj6IDoWUaQlFvfIXu8Z4QCfqkLM+ff
         v68tqxa7HHquLcs0tZNIkkf72mznZlMUd3YSvqznibgvZu156GykKNwD5Ac0aajyi/Cz
         AefWecScLxsnYeTRSPTUbD8mGYvFTsTYzEGb6f2dZ5tFK3vF286dIK9ta1SwWaK58RMB
         toIHjHRo5OFribAqbW1eo/1nNfO1TD9DFDGv90hraSnm4G7ITX66NDpxYxYdNRjQUMvq
         dwEys/IZ5FiVU9Kb/CxmwqtoETUmdkX7wql+2zbsYVib1+P+Eq+iMq2JONqYCX9cX1gB
         gxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782340273; x=1782945073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UD0cYPMpLMjUxZJI9vflj/wONeUt3vfrqS2YoALbAM=;
        b=K2SOcKDR9TnpT3XuqFBBuzWtDzSKhdKyOaFLghHe1A/B5MKc2HUsqFjWi/04WvIffQ
         z1RRW22b0QF16Zft/s4fMTMhvjFdy/mNec0jA8TJfJpMlDBfUgGxYythnmx+b8xw2M8w
         GK7rUOGfpMIYIhOSKN7nrq4LJTG3nKkaAIa2ay/YXDhpV+USMdJem5wFK95eqclULnF7
         0zQ08JKgb4aokScCNaRlCcOk8U7pY568OqFscZJR25GBUOAJINWZr1SXGShQLtHiIJWk
         I7tTs/p6Y2O7ohGuNtrGE7kWV98nKoXQljntNN+5lRFKl/7yZS429WOcL2Xwx+pboG33
         k00Q==
X-Forwarded-Encrypted: i=1; AHgh+RptqlBxRdeQBkcAJ6qnuTHRFysl0yLMEfc5OMIag/iKbMM+priEeyTq1ZHXUhq4BJLb5ivSjgjIXNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxgYijfw/RpT7HqXComYiRnpsaghlpgXbuNwQhnqY3qkUL7Z4s
	cYkWnAQfeLqHRBNGOb5GDCizgaDcOW6cxWqnICHL3RKCjwrqg8h4Dvb2FdMHOjf+3cUwu7+5IX3
	WkEY9TA==
X-Received: from pjca15.prod.google.com ([2002:a17:90b:5b8f:b0:37c:64eb:faf7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b50:b0:36d:9e0b:3801
 with SMTP id 98e67ed59e1d1-37dd0d314c8mr11081058a91.8.1782340272872; Wed, 24
 Jun 2026 15:31:12 -0700 (PDT)
Date: Wed, 24 Jun 2026 15:31:12 -0700
In-Reply-To: <ajpGxu2uQys+S2F8@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
 <ajjc0hw8PjGw69e9@yzhao56-desk.sh.intel.com> <ajnf5Z9nWZxoLS4x@google.com>
 <ajoWngKaZ+wfIyR+@yzhao56-desk.sh.intel.com> <ajpGxu2uQys+S2F8@yzhao56-desk.sh.intel.com>
Message-ID: <ajxasFBzp_9KnQLq@google.com>
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
	TAGGED_FROM(0.00)[bounces-93434-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9F186C1C3D

On Tue, Jun 23, 2026, Yan Zhao wrote:
> On Tue, Jun 23, 2026 at 01:16:14PM +0800, Yan Zhao wrote:
> > On Mon, Jun 22, 2026 at 06:22:45PM -0700, Sean Christopherson wrote:
> > > On Mon, Jun 22, 2026, Yan Zhao wrote:
> > > > On Thu, Jun 18, 2026 at 05:32:00PM -0700, Ackerley Tng via B4 Relay wrote:
> > > > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > > > > index ffe9d0db58c59..56d10333c61a7 100644
> > > > > --- a/arch/x86/kvm/vmx/tdx.c
> > > > > +++ b/arch/x86/kvm/vmx/tdx.c
> > > > > @@ -3198,8 +3198,12 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
> > > > >  	if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
> > > > >  		return -EIO;
> > > > >  
> > > > > -	if (!src_page)
> > > > > -		return -EOPNOTSUPP;
> > > > > +	if (!src_page) {
> > > > > +		if (!gmem_in_place_conversion)
> > > > When userspace turns on gmem_in_place_conversion while creating guest_memfd
> > > > without the MMAP flag, the absence of src_page should still be treated as an
> > > > error.
> > > 
> > > Why MMAP?
> > Hmm, I was showing a scenario that in-place conversion couldn't occur.
> > I didn't mean that with the MMAP flag, mmap() and user write must occur.
> > 
> > > Shouldn't this be a general "if (!src_page && !up-to-date)"?  Just
> > > because userspace _can_ mmap() the memory doesn't mean userspace _has_ mmap()'d
> > > and written memory.  And when write() lands, MMAP wouldn't be necessary to
> > > initialize the memory.
> > Do you mean using up-to-date flag as below?

Yes?  I didn't actually look at the implementation details.

> > if (!src_page) {
> > 	src_page = pfn_to_page(pfn);
> > 	if (!folio_test_uptodate(page_folio(src_page)))
> > 		return -EOPNOTSUPP;
> > }
> 
> Another concern with this fix is that:
> commit "KVM: guest_memfd: Zero page while getting pfn" [1] always marks the
> folio uptodate before reaching post_populate().
> 
> [1] https://lore.kernel.org/all/20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com/
> 
> > One concern is that TDX now does not much care about the up-to-date flag since
> > TDX doesn't rely on the flag to clear pages on conversions.
> > I'm not sure if the flag can be reliably checked in this case. e.g.,
> > now the whole folio is marked up-to-date even if only part of it is faulted by
> > user access.
> > Ensuring that the up-to-date flag works correctly with huge page support seems
> > to have more effort than introducing a dedicated flag for TDX.
> > 
> > > > Additionally, to properly enable in-place copying for the TDX initial memory
> > > > region, userspace must not only specify source_addr to NULL, but also follow
> > > > a specific sequence (where steps 1/2/3/7 are required only for in-place copy):
> > > > 1. create guest_memfd with MMAP flag
> > > > 2. mmap the guest_memfd.
> > > > 3. convert the initial memory range to shared.
> > > > 4. copy initial content to the source page.
> > > > 5. convert the initial memory range to private
> > > > 6. invoke ioctl KVM_TDX_INIT_MEM_REGION.
> > > > 7. do not unmap the source backend.
> > > > 
> > > > So, would it be reasonable to introduce a dedicated flag that allows userspace
> > > > to explicitly opt into the in-place copy functionality? e.g.,
> > > 
> > > Why?  It's userspace's responsibility to get the above right.  If userspace fails
> > > to provide a src_page when it doesn't want in-place copy, that's a userspace bug.
> > I mean if userspace specifies a NULL source_addr by mistake, it's better for
> > kernel to detect this mistake, similar to how it validates whether source_addr
> > is PAGE_ALIGNED.

The alignment case is different.  If userspace provides an unaligned value, KVM
*can't* do what userspace is asking because hardware and thus KVM only supports
converting on page boundaries.

For a NULL source, KVM can still do what userspace is asking.  Rejecting userspace's
request would then be making assumptions about what userspace wants.

> > Since userspace already needs to perform additional steps to enable in-place
> > copy, specifying a dedicated flag to indicate that the NULL source_addr is
> > intentional seems like a reasonable burden.

I don't see how it adds any value.  I wouldn't be at all surprised if most VMMs
just wen up with code that does:

	if (in-place) {
		src = NULL;
		flags |= KVM_TDX_IN_PLACE_COPY_INITIAL_MEMORY_REGION;
	}

