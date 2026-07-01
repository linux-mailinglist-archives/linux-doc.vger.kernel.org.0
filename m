Return-Path: <linux-doc+bounces-94501-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kSh6DCeJRWqoBgsAu9opvQ
	(envelope-from <linux-doc+bounces-94501-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 23:39:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD986F1E48
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 23:39:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=jYZHQ0FZ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94501-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94501-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA4AE30479DF
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 21:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A56F3B9929;
	Wed,  1 Jul 2026 21:39:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56739282B
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 21:38:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941940; cv=none; b=ZeYEKb/ooUcYOHbAaCsoa9jbJPNS1WlPqOMAqjaQ57spi/mFXzGFmLcIJIYpoSfYHfTuHC0a3i/4fjeb6nHUXjnyetJ2uxfLKyq4S2ZyxZVNjjJmpPGr1qHm+E/iwFP+dp5CeZuuHQV2JQnd9K7+//DYcl7mBJlfjqjHLyFqw2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941940; c=relaxed/simple;
	bh=s3SRCVocvxtBq/BBjpyMKtPRDxFAsPXDOITHXqUnO4o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lAlM2Qfxb4AFkuPunFGQf5GKFbU6W4iXoJsqzPJZm4nv5qyswSeGWHdLmMkmASBPH6wWevsKiE40KkmncIZdi2jp6S5yY7bYgjLODcAXgQ/Id5m0ttjYpkGxu6P/gEypjkXAbl+I+oF1fxnTOvCgqlPlNF3noJ/CGCQljTE4/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jYZHQ0FZ; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c987913b08so14210395ad.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782941937; x=1783546737; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRkq9jmjNuS5m4BJgbbAEXZCpunnA1N0v1XvrStDBgY=;
        b=jYZHQ0FZXAGO1JEGSty/T2GCc1OXGTQApUcOJesNOIlH8l85iNchenlCCV/1DZdGoT
         ksIP9vNV78wNEvoOdkfuVCk6HMJpet5vE+JYsUm2vMRnZSVKK+VjR8H5InwAYOPHBbc1
         aaJNkmEDURJ64lc302othmdm5JZAy42dA9ZCFHGr9qu9CrPaRnRwtS3P9Atu6psHqXVV
         JrnvTWDS98Y8L0Ll9o+oukfL5b0Id9i/dljxhUWkxi5cia+UxSpSDi9ntkDAhZMITm4O
         WOAVy5C64JRZJT5tOn8mcx2DNNJSYvpif1Q3nkBbkuEKGWAOgnzxXw/pAWQrh3tafiBr
         L2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782941937; x=1783546737;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRkq9jmjNuS5m4BJgbbAEXZCpunnA1N0v1XvrStDBgY=;
        b=ehDRdl7nvocYv49bJMTRvfoFUa6RaF9koXP1RYohtijf9XDbzDV0JQp34/STQTAllV
         JXKnWAx9Ro/W6nESnQo2jaVwMoNuyfdcWiaaW+6IzIxU+nzsrO1bDxX0HyHHaXwVavdT
         Lg40y8JdcTW8l9Cz4DL9/k5JsKU/k2gsvph8S6JtFRc41+mpngWHbPd7tUSw9ayPPNt0
         CCBW9hnJXTnIcwd65H7LvNk544LQyvIQmTeylXkyjKWpdJsrCi45v166KCU6wUxuVW+c
         NG4+J0E3kjwu8fTdhemXn3limxjQ7KE8FZZdbp9pobNACc3WpKusrs3tNzxd5iAYXfzG
         6SXg==
X-Forwarded-Encrypted: i=1; AHgh+RqWtNfq1YF322OhtJXWd21uZoc3bMooO3Dj+wEjiBJSoGJdfzDyChR3UBIf0jDESwCyeYAQBW4bPqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfSDTul7OFvqpx0FKK4eBmMEOoBKGVw+bohxN+9vwIYg6so3TK
	hr6R6li4F6oqaXcUQGMSoZA+IgeWzHXOlSZPUzd9NNYO5Z86NkiAMksKV2nwOooNWlijlFNmjRK
	6qqqD/g==
X-Received: from plbka15.prod.google.com ([2002:a17:903:334f:b0:2bd:9574:2958])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2c2:b0:2c9:fa36:ab73
 with SMTP id d9443c01a7336-2ca7e6f0b6emr36500665ad.8.1782941936636; Wed, 01
 Jul 2026 14:38:56 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:38:55 -0700
In-Reply-To: <20260608145455.89187-7-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260608145455.89187-1-dwmw2@infradead.org> <20260608145455.89187-7-dwmw2@infradead.org>
Message-ID: <akWI72WrPKy-PBqo@google.com>
Subject: Re: [PATCH v5 06/34] KVM: x86: Explicitly disable TSC scaling without CONSTANT_TSC
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
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
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-94501-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amazon.co.uk:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BD986F1E48

On Mon, Jun 08, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> KVM does make an attempt to cope with non-constant TSC, and has
> notifiers to handle host TSC frequency changes. However, it *only*
> adjusts the KVM clock, and doesn't adjust TSC frequency scaling when
> the host changes.
> 
> This is presumably because non-constant TSCs were fixed in hardware
> long before TSC scaling was implemented, so there should never be real
> CPUs which have TSC scaling but *not* CONSTANT_TSC.
> 
> Such a combination could potentially happen in some odd L1 nesting
> environment, but it isn't worth trying to support it. Just make the
> dependency explicit.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  arch/x86/kvm/svm/svm.c | 3 ++-
>  arch/x86/kvm/vmx/vmx.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index e7fdd7a9c280..7817752533fe 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -5546,7 +5546,8 @@ static __init int svm_hardware_setup(void)
>  				     XFEATURE_MASK_BNDCSR);
>  
>  	if (tsc_scaling) {
> -		if (!boot_cpu_has(X86_FEATURE_TSCRATEMSR)) {
> +		if (!boot_cpu_has(X86_FEATURE_TSCRATEMSR) ||
> +		    !boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
>  			tsc_scaling = false;
>  		} else {
>  			pr_info("TSC scaling supported\n");
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index a29896a9ef14..ed207cc7692d 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -8672,7 +8672,7 @@ __init int vmx_hardware_setup(void)
>  	if (!enable_apicv || !cpu_has_vmx_ipiv())
>  		enable_ipiv = false;
>  
> -	if (cpu_has_vmx_tsc_scaling())
> +	if (cpu_has_vmx_tsc_scaling() && boot_cpu_has(X86_FEATURE_CONSTANT_TSC))

We should clear SECONDARY_EXEC_TSC_SCALING in setup_vmcs_config().  Failure to
clear the vmcs_config bit will advertise the feature to L2 and allow it to be
enabled in vmcs12, but KVM will ultimately not honor the scaling in vmcs02:

	if (kvm_caps.has_tsc_control)
		vmcs_write64(TSC_MULTIPLIER, vcpu->arch.tsc_scaling_ratio);

This series kinda sorta gets there with "KVM: x86: Remove pvclock_gtod_data and
private timekeeping code", but that change looks misplaced?  And I think clearing
the bit this late will lead to false failures in vmx_check_processor_compat() due
to the golden config clearing the bit, but the local config having it set.


>  		kvm_caps.has_tsc_control = true;
>  
>  	kvm_caps.max_tsc_scaling_ratio = KVM_VMX_TSC_MULTIPLIER_MAX;
> -- 
> 2.54.0
> 

