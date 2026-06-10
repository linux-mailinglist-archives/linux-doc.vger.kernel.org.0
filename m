Return-Path: <linux-doc+bounces-91882-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hgYKGxTjKWojfAMAu9opvQ
	(envelope-from <linux-doc+bounces-91882-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 00:20:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D82CB66D2E6
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 00:20:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=aTXNsPFv;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91882-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91882-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53A1D3035AA2
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 22:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F435371885;
	Wed, 10 Jun 2026 22:19:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A22E2DFB
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 22:19:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781129994; cv=none; b=dZhlFGU7d74eIjYufCEL/dbp7CuJKpoY907bpHHjMBhmIBpY9uLDl0J3RZnVNXgOWXc8cJzISzuOuCUdT825mhCDlT5/Gy9sKoUug5Z+4W43i7knWEiGwCd3b4K1Wc8+ffMkMUwokkqAp9j+dggzWYEtADzXNg6GKuutw912Jys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781129994; c=relaxed/simple;
	bh=BOqSVJmxLhcTxId4mKxBy6QT0CiREOB6byamA0QERaI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kmf4+GPWNh9poGlAzqFf6ShCo5mKhMchL4HkNzxN56RI904EmxZwECDz8h9w1t2OIp4UQL9PAoKRHS0wihtwkXl+oVvP+c4vaa6GN5QusWA+v07aSVsGS5pqSXoC95vhWqoIwesqPTIcA3FQ6j1VP6dydZyz0vcNirGibJxiVxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aTXNsPFv; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c2d65d9773so5741905ad.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 15:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781129991; x=1781734791; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCXjEr9VLMiB3RNr9V4LUHEdwVcyHXL9rlViMmJIYhA=;
        b=aTXNsPFvPEiDDCAFSsO+jf7T2rvyxel9mt033kL/2WL2iU91N/kmuxaDkFJgWYjFrd
         SeQarSM61K9UxEz7t5fxO91xCLK5u1UtLCm11LwAgOOqlmET3VCO7jeKEDEZW1nL5iPZ
         cD9EfhFKfLZ0pmGEBkL33ve59G8BqR9xLPF24QZjIet4MbrvMQwSz9RC/qQUg/KouUT9
         d7gF9HeqEnJpwczrFtsW+UHc61nR3EU16RbvvPsFkQ1iT5bCa+Sl0pyPVOGPALqv4QHV
         Navl7sxehCbkngefZoZEEEdrhdv4O2S11Iur3zsllRJU3IySo8ExbT34nHpLJaD14ia2
         Ev2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781129991; x=1781734791;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCXjEr9VLMiB3RNr9V4LUHEdwVcyHXL9rlViMmJIYhA=;
        b=HCvUkoOn6fgf9x//IgpPTYxj6+uu4ZrfNk6fAfRsf0F9oO+0MshWjzAU+wmfXY7j3J
         TEIWlS0K/G5jFFZJ6NUVO6l1FEJYSS7uvDN7qrJqUT5jIEjosSv7fmOVjelLMLlQfNcx
         uivgSDzTwdFLatg1iNqC5XeGiWI/bm5ITMcePDmj1hvfzzQpUxn6OTFnDVjpT2/QXO4h
         FdMQD8nskCO03121oEE7L4DDJtY1Me6ed2imbF/hwC5PmnaqHxa9MvAqrN59sm+GNu1Q
         eG/tzXXeke48puk23KOeK+8Nknu/FoCM+1QpzRcaEFjd4Rzg8jot8djztnE/xoK8IBM6
         Ozeg==
X-Forwarded-Encrypted: i=1; AFNElJ8aRBpjoYujyghkt8V+6h9EX55hmefbu1edIhRNBlhX6Ix6ZYDbKwBDWKpaux+ywvWjhzueFqxh4eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4CoPhxaYQ59F0F/lTOQYxyr0XkRgR6hUt4T945ZCzJNx6Te9
	K56Unl39Ybo6jN0TV7buvGda19UrrLANUnZwQq+tsOS5LRN/9fxwr6FU8fDUG+iEl2vndmyErPu
	OEqqtXQ==
X-Received: from plcp17.prod.google.com ([2002:a17:902:e351:b0:2bf:1958:c64d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1acb:b0:2c0:ccdb:e02c
 with SMTP id d9443c01a7336-2c2a1baf93fmr114931065ad.7.1781129990748; Wed, 10
 Jun 2026 15:19:50 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:19:50 -0700
In-Reply-To: <20260522-gmem-inplace-conversion-v7-4-2f0fae496530@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com> <20260522-gmem-inplace-conversion-v7-4-2f0fae496530@google.com>
Message-ID: <ainjBvqDTU5DNZR7@google.com>
Subject: Re: [PATCH v7 04/42] KVM: Stub in ability to disable per-VM memory
 attribute tracking
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,google.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91882-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:ira.weiny@intel.com,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tenc
 ent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D82CB66D2E6

On Fri, May 22, 2026, Ackerley Tng wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Introduce the basic infrastructure to allow per-VM memory attribute
> tracking to be disabled. This will be built-upon in a later patch, where a
> module param can disable per-VM memory attribute tracking.
> 
> Split the Kconfig option into a base KVM_MEMORY_ATTRIBUTES and the
> existing KVM_VM_MEMORY_ATTRIBUTES. The base option provides the core
> plumbing, while the latter enables the full per-VM tracking via an xarray
> and the associated ioctls.
> 
> kvm_get_memory_attributes() now performs a static call that either looks up
> kvm->mem_attr_array with CONFIG_KVM_VM_MEMORY_ATTRIBUTES is enabled, or
> just returns 0 otherwise. The static call can be patched depending on
> whether per-VM tracking is enabled by the CONFIG.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---

...

> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index abb9cfa3eb04d..ee26f1d9b5fda 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -101,6 +101,17 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(halt_poll_ns_shrink);
>  static bool __ro_after_init allow_unsafe_mappings;
>  module_param(allow_unsafe_mappings, bool, 0444);
>  
> +#ifdef CONFIG_KVM_MEMORY_ATTRIBUTES
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +static bool vm_memory_attributes = true;
> +#else
> +#define vm_memory_attributes false
> +#endif
> +DEFINE_STATIC_CALL_RET0(__kvm_get_memory_attributes, kvm_get_memory_attributes_t);
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_KEY(__kvm_get_memory_attributes));
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_TRAMP(__kvm_get_memory_attributes));
> +#endif

Fudge.  This morning's PUCK discussion about VBS made me realize that we really
don't want to kill off _all_ per-VM attributes like this, we really just want to
kill off PRIVATE.  And even if RWX protections never arrive, conceptually shoving
all attributes into guest_memfd doesn't make any sense, because it really is only
the private vs. shared state that is tied to the physical memory, things like RWX
protections aren't so tightly couple to the data.

It'll require a bit of minor surgery to these patches, but the silver lining is
that I think the end code will be slightly easier to follow.

I'll sync with you off-list to splice in the changes to your current series (I
have them sketched out).

