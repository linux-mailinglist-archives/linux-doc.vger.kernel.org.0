Return-Path: <linux-doc+bounces-94214-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lo0xOtr+Q2oRnAoAu9opvQ
	(envelope-from <linux-doc+bounces-94214-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:37:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8906E6F3C
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:37:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=va8T1XPx;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94214-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94214-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CD783005177
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 17:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980173DE421;
	Tue, 30 Jun 2026 17:30:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172B43DCDB0
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 17:30:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840645; cv=none; b=VBkzIc3oFo23HhGNCmHY7cTX0/gU8lfY8SBc7NN+0atmk5zp4b1OTPQnxNg4lTVYvrKyxNCngyhQAR1Lhz5cgQStm7m4W9YIBpCPpA6qo4VH812m5/QpTR4uoI17vrkHLXZ4ICz66VjipMj3w4oBGSJi5i/VvmdfxldP25CWCrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840645; c=relaxed/simple;
	bh=z6KmvGsEhliMX2kFxBWlW+oEtiV14/kK8zifG4u1OSc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kSsy6APeFKFpE/F6xqEHdWdORDbKZyKbc94R/pmheWEFqwpZtiiOBu/np28pmiyg9SIa8ATPsVw4M9iZ5PqfQrSiG5P/FWsobDtE+XisBPuIK0yZcs/ndOcoRtqxGwvTdKA2GiQaJb8EAu52FEMwlnXE23++tRyMGKcwBHGhaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=va8T1XPx; arc=none smtp.client-ip=209.85.210.201
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8479cc04d8fso2082128b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782840643; x=1783445443; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxXDGdZP36dVSNVXo6OGlh08WQ4jD0j+gPBa9WDdARQ=;
        b=va8T1XPx241WJZyMEqRecMsZNoozWVV3DSK3GRDxwRDu8pb+FaUDxvQ5brfllHB2mb
         dAnUKRoC0cNaUKbLGVwrhM4GjxwMAoB02Px6M8cmBBwMJ1w/7SIOscdj4QoNkv7a23sB
         g/ixTI7xYfEOSc2Gi1Gpci3vR1Eg0bbdHXY0zfCwAuV3prfmSphh+nVFeYU4aK61ivib
         FQODMfShZw8A/MhhSqcIpUTuE86h4GiWe5K/5gu7IACEP5E+aUzCLA2lNaezL2VKC473
         B2x9HYz2ebDgFjVz4Y340jix0kBpJyCBYdZgixQL84fEjsu/AUySgEyhHcv2MyYhwqbA
         Gwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782840643; x=1783445443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KxXDGdZP36dVSNVXo6OGlh08WQ4jD0j+gPBa9WDdARQ=;
        b=K4SjPrSAMS6ZIUBJPqt7GpyQ54XBaWVBWnJfq2Xxhf9FQIDyRLOy+g5ocXh1RjYJfY
         PXPOqQDIkELCq+zkIy1pczB0PHMnm1p8HjJra0kMokfsgbmZnyfTM74XAeILQ56Dw4El
         5dV4/QU3Um6uUUUB77319G+iGiMgkT6XZpnWrOECNFQn+ya3qJAfMA9+h5c7vbFwza2P
         0pElNNwPq7erxwpjTZz4qw7sXjpXPJU1zKtBE0prKs92RT0rPdQfjT/OH4eJhs+h8bjU
         gQHXRCdNwpK5s+IZ9IgtHdvxCL6aVEC8OvSLBh0kOulAu0NNwmN45eEE0fDt1Q9IG3nR
         W9MQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp963DHp1bP2ui53nnnXtpl+l0cAFAeGs/EY7Z75ywoLdBr2kdEpZLgfPT+n+62k9DiCWci/vrIVi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqVfm/VfFAynYrIfT2PII4O8Bb48KteCxw4v+UbcVS+JxsI2B
	ft6xpoGDaWB8AsYrQYk12eDJYeWZbpnzSrfxS4hggHKns53EVg7MCcT82GVaLZsD7Y9nbMJpfww
	mMD+XUw==
X-Received: from pfbfb9.prod.google.com ([2002:a05:6a00:2d89:b0:847:84b8:2dcf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b84:b0:842:6004:3fcf
 with SMTP id d2e1a72fcca58-847adeaa420mr1564771b3a.29.1782840642918; Tue, 30
 Jun 2026 10:30:42 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:30:42 -0700
In-Reply-To: <a1b06afb-af6e-4666-8c7d-990e7fa150fa@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-7-9d2959357853@google.com> <a1b06afb-af6e-4666-8c7d-990e7fa150fa@intel.com>
Message-ID: <akP9Qv_IPVEh7GAB@google.com>
Subject: Re: [PATCH v8 07/46] KVM: Rename memory attribute APIs to prepare for
 in-place gmem conversion
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94214-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xiaoyao.li@intel.com,m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@ten
 cent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB8906E6F3C

On Tue, Jun 30, 2026, Xiaoyao Li wrote:
> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
> > -bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > -				     unsigned long mask, unsigned long attrs);
> > +bool kvm_range_has_vm_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > +					unsigned long mask, unsigned long attrs);
> >   bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
> >   					struct kvm_gfn_range *range);
> >   bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> 
> We have
> 
>  - kvm_pre_set_memory_attributes()
>  - kvm_arch_pre_set_memory_attributes()
>  - kvm_arch_post_set_memory_attributes()

Yeah, that's probably for the best.

> left, do they need to be renamed as well?
> 
> then the interesting one is kvm_vm_set_mem_attributes(), which contains "vm"
> already while it means "vm ioctl". Do we need to rename it to
> kvm_vm_set_vm_mem_attributes()?

I say "no" on this last one, the fact that the function is scoped to a VM ioctl
is enough to communicate that it applies to per-VM attributes.

Actually, since it's a local helper, we could go with kvm_set_vm_mem_attributes()
to be consistent with the other functions.  That just leaves
kvm_vm_ioctl_set_mem_attributes(), which I think it appropriately scoped.

