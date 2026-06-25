Return-Path: <linux-doc+bounces-93607-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oA1DIIVvPWp73AgAu9opvQ
	(envelope-from <linux-doc+bounces-93607-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:12:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3436C81B7
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:12:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=wLj3yr40;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93607-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93607-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B4BA3032656
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 18:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE8330D3FA;
	Thu, 25 Jun 2026 18:12:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12BDF59
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:12:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411129; cv=none; b=aeb0QsyYV1uBA2vj+Zo23ctYgzwifOCf5cWnoUsQvZMbNbnbY5De5vDatPuKiOPAlLppH3smVYCC+DfgIhxag50fg1VmGmvcHfjGV4nx/aqg5k4utKvNcWW+FOmdYshTwAmlRf/W7GRdJl1rQ5+DCVW0He48hjmWtGMPrfforSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411129; c=relaxed/simple;
	bh=1PYPrh5cmW7j92HgEZsxX+MtgSZruUXIrXzPkSjifnI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JsgX/ae/4bXJTQHKRA07ZN2CFLsR56QjA93rLtgp7MR63UAK1fDU2gOnP+18rUI3RtY7B5ZVBxuspVaJA5cY2kIDDujFQMUiWtTURWs72RR0Qk3wdrRt4snmnnOH2u7335KcEiG09iJj/C0tXpnY0CIU5Jh9pMMHa+Vm336foPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wLj3yr40; arc=none smtp.client-ip=209.85.215.202
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c860544c077so165026a12.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411126; x=1783015926; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytZubqtXwlHPvZAN+p1oFC5/Ov6kfqDqplPxrT9CpGE=;
        b=wLj3yr402erE2fLcvahXA8QdcIcUykM0SrGgplCZ7ZfFILjW48N4NAQtcza+0GImz3
         ubR65rUwRjC9AQJPv0fzCCmUEEVUhCUTwTgbCqitAt+rGeAn/ccHuQmzYf19va+m9ehl
         QaSHTQaC7a+pNTmGuBw5bDSFGHwwFNIH21zwiMnaw4K4rD5qCBwbMu9kUJ5LFU8aPakm
         SBj4TsMKACOYqShDtnz0oiHMyyi+Ji5jyJTdf3hHpmCWXRfy8vF8qlgk7OMl597Kt69H
         5zCs2MY28F6MHIy8uk5M8qmXceDe6QJWPh+hAzfc/8INzCYEjgWLBmNOsVxJaYub6xQq
         U3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411126; x=1783015926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytZubqtXwlHPvZAN+p1oFC5/Ov6kfqDqplPxrT9CpGE=;
        b=Nr7t4f9Ef+3/cSlymHzEmzw898KFRk+I8zB8eEPOHOfXLiAas9FP/cL6n07HivgoMo
         nF8gOT+OhJcArMKKwiJEcIDknTOIL/DrJZcTpRxYM/epcGIaB7vq1+wlv8bcAYGOkwMh
         5X+54bD91S2tZiDpzp+tnilomlsJ9VjEnZYzZHwvXlQxd6eZItD94CyUyp9AHomeAP/U
         bhn8tpUiNOhXxHXFu78tNXF5btNUPPBACaOqwdGZDun2QQqYCMuXCkR1gIH7qIg/ho63
         aqoxL06s05mzZtHPaTn/q6nMeDyTfgNMQE3tZCQMQmXelFC9jKDfj63uhnaCxBuEFq5m
         oXHQ==
X-Forwarded-Encrypted: i=1; AFNElJ90ahucs4hy269O5H1BbjbEvPASQfWU9mb8euFiSUChS3+R0fNnXYw3/9/WGHEPwuZuoMGjl9mpi+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1MpeXAO+uvutINwVLXzov7jH2pdJ6B9cIPy93j6jbH4fegTqW
	1gyiF7iP46VeTwqCZdsYgnIJRMJdwS2V+bzr3SyMZ7KNtSdfGJsqt3oC+FpXH+UTLp7jWBWIeLk
	kHP5m9w==
X-Received: from pgbfp5.prod.google.com ([2002:a05:6a02:2ce5:b0:c8b:ed9c:4468])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1bc1:b0:3bd:203b:b587
 with SMTP id adf61e73a8af0-3bd4b021e47mr4245885637.40.1782411125978; Thu, 25
 Jun 2026 11:12:05 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:12:05 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-1-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-1-4fe8b602ff47@google.com>
Message-ID: <aj1vdb1VxNilPa9i@google.com>
Subject: Re: [PATCH RFC 01/12] Documentation: KVM: Elaborate comment on kvm_usage_lock
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, vannapurve@google.com, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:zhaotianrui@loongson.cn,m:maobibo@loongson.cn,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:tabba@google.com,m:vannapurve@google.com,m:x86@kernel.org,m:hpa@zytor.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93607-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF3436C81B7

On Wed, May 27, 2026, Ackerley Tng wrote:
> The original comment talks about cpus_read_lock() and kvm_usage_count, but
> doesn't explain why they are related.
> 
> Elaborate comment on kvm_usage_lock to provide more context.
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  Documentation/virt/kvm/locking.rst | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
> index 662231e958a07..5564c8b38b9cc 100644
> --- a/Documentation/virt/kvm/locking.rst
> +++ b/Documentation/virt/kvm/locking.rst
> @@ -248,8 +248,23 @@ time it will be set using the Dirty tracking mechanism described above.
>  :Arch:		any
>  :Protects:	- kvm_usage_count
>  		- hardware virtualization enable/disable
> -:Comment:	Exists to allow taking cpus_read_lock() while kvm_usage_count is
> -		protected, which simplifies the virtualization enabling logic.
> +:Comment:       ``kvm_usage_count`` serves to deduplicate hardware
> +    virtualization enabling and disabling requests from different VMs
> +    being created.

kvm_usage_count does that and more, i.e. this is 'wrong" by being incomplete. 

> +
> +    Hardware virtualization enabling/disabling requires taking
> +    ``cpus_read_lock()``.
> +
> +    ``kvm_lock`` used to also protect ``kvm_usage_count``, but other
> +    parts of the Linux kernel holding ``cpus_read_lock()`` need to
> +    call into KVM to ensure that VM state remains consistent with the
> +    host's state. For example, when the CPU frequency changes, KVM is
> +    notified. ``kvmclock_cpufreq_notifier()`` takes ``kvm_lock`` to
> +    iterate ``vm_list``.
> +
> +    To decouple these, use different locks, ``kvm_lock`` for
> +    ``vm_list`` and ``kvm_usage_lock`` for enabling/disabling hardware
> +    virtualization.

I appreciate the effort, but honestly I think this does more harm than good.  I
already know what this code does, and the above confused me more than anything.

>  
>  ``kvm->mn_invalidate_lock``
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> -- 
> 2.54.0.823.g6e5bcc1fc9-goog
> 

