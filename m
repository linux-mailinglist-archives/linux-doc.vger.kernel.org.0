Return-Path: <linux-doc+bounces-22869-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B59538D0
	for <lists+linux-doc@lfdr.de>; Thu, 15 Aug 2024 19:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E022281AE6
	for <lists+linux-doc@lfdr.de>; Thu, 15 Aug 2024 17:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161D01B9B4A;
	Thu, 15 Aug 2024 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tInm7iFn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6584036AF8
	for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 17:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723741952; cv=none; b=FoHkQZqf7WnfRn9qYBCbfbYZBK+hzw3yglF/5qqKyIPLyzzGB++c8RFfD3lxKbncgs7kbzbvJrUVh+A+xoNlIPDFN2sSfIG/hUHGcpz4TJwMgiL2A2+lGRlmbcWPCPDXcb/onEgYPo80ohQfc038Hw/pmPtsD3op5Yf8+LWXgZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723741952; c=relaxed/simple;
	bh=YnedXFXmNlTUmV4EtthEbEnVIL2LfqX3Jy0XQNW8IYc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YoxFPyqcZ8gcFn0XiX/LZRn95GMUQQznprMb/DdNzhzJt2gqq4/tll3cSnaynNXOiygKGbU0TAL8sJUvvDfxkZAX8AmfUJomGuydjFKfL0uHxe/ERZPLzmwf+HXwmLG6TV/WFwN7EjuLMqXWlm3Q0GgncfBer2ND0WPOTTDNYbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tInm7iFn; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-688777c95c4so19926067b3.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723741949; x=1724346749; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yvhrlQOvT1qaF0wyf19GNpeoicAZhXdNzp2/56IfXXY=;
        b=tInm7iFnfYKWdteXtxTKy07sGNdwrItS0H6Z+a1/gIcuiq5TuxmCiuLJDH32j35N7i
         zQ3HJLEIuf2TGXD7QuTMOs1yy3WFv3IY3dWOMgzicgikK8LH7hBEosYXdi4rgkP1Mioj
         YaxDo21Nw16yfJr/uz2ocl2cmt3i5IPC255oJpOhfVPo+4jHjj1iROPJ8tioyKUOzdp8
         gfd9VvDWZ+EMM+tkWxE9wIFPVcjUPQ4xqbKEO0Pk5nx53uq3HokWnb3dS0YbiJBIAg3A
         EzsYIB/pumEgrhShK4S6K67nG38SLe9Pwn2KdTq3K2/2J5R+8THIu5mFDwrR6aUBLG4p
         T8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723741949; x=1724346749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvhrlQOvT1qaF0wyf19GNpeoicAZhXdNzp2/56IfXXY=;
        b=KdMr2IHD16AYtubkYZTMXfcfOioy23hjWnHEH7UNovkFhPOmBaT4TSw9j9woE60+DH
         x8DhVp7COA2rXxozEQCx3urKRcjHjnQtfpBxRNXlNkm2sQ/qoJbQSXlrM3nS/kU+aVfc
         sErsFkpX+9HgSv5e2Ib6tsgWi6oP5XpSZy6E3tt//MzKFT1quO2CcXoXayc2eXzSHnvA
         hfAPsvJ9Qv73d6s1xGmVH2wg9dvpjp/qVyHMF9ZkGxug9N2NOtNmRLirOlwvP0il/pSv
         aNfDkLNYeeF8jsxeX1rKEtdHuQo7nJVisNGO5nvwPy/A1DeMgwzuufEElUZIJtZBL5cD
         +yoA==
X-Forwarded-Encrypted: i=1; AJvYcCXrq06fDzDmtH5encFUHz8BKMFa9xBpAI/XzlR+nuwP0fAI7CeAejd1zPhJR5jJFDKmW+MEU52MdbS5cGT9mcK6v+ZqmCKoWomu
X-Gm-Message-State: AOJu0YwPoMoE1XXik0hTwes0N64Aox4bJhm6JlqBnwtBcy1VTjDyIuUg
	PgLUJIxVMwO8jFUAZ3SokQdjCrnG/F+22weRcnVl78rlppFv2y534dGja5soYZbt5UVaIlE5SxS
	DVA==
X-Google-Smtp-Source: AGHT+IH/O74nUjl4sfpshsDyjxeZHvEjEYPoU6nLVkktHrMXY003wqNpVWSkAh256RPFReDLYAEdJvcIYMw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:288d:b0:669:e266:2c56 with SMTP id
 00721157ae682-6b1bb85ee65mr91497b3.6.1723741949511; Thu, 15 Aug 2024 10:12:29
 -0700 (PDT)
Date: Thu, 15 Aug 2024 10:12:27 -0700
In-Reply-To: <20240522001817.619072-17-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522001817.619072-1-dwmw2@infradead.org> <20240522001817.619072-17-dwmw2@infradead.org>
Message-ID: <Zr42-6sLSg0a9l1I@google.com>
Subject: Re: [RFC PATCH v3 16/21] KVM: x86: Factor out kvm_use_master_clock()
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Durrant <paul@xen.org>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jalliste@amazon.co.uk, sveith@amazon.de, zide.chen@intel.com, 
	Dongli Zhang <dongli.zhang@oracle.com>, Chenyi Qiang <chenyi.qiang@intel.com>
Content-Type: text/plain; charset="us-ascii"

The shortlog is rather misleading.  This is more than just a refactor, and I
would argue the refactor aspect is secondary, i.e. the main goal of this patch
is to apply the exceptons to kvm_track_tsc_matching().

On Wed, May 22, 2024, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Both kvm_track_tsc_matching() and pvclock_update_vm_gtod_copy() make a
> decision about whether the KVM clock should be in master clock mode.
> 
> They use *different* criteria for the decision though. This isn't really
> a problem; it only has the potential to cause unnecessary invocations of
> KVM_REQ_MASTERCLOCK_UPDATE if the masterclock was disabled due to TSC
> going backwards, or the guest using the old MSR. But it isn't pretty.
> 
> Factor the decision out to a single function. And document the historical
> reason why it's disabled for guests that use the old MSR_KVM_SYSTEM_TIME.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index e21b8c075bf6..437412b36cae 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -2518,6 +2518,27 @@ static inline bool gtod_is_based_on_tsc(int mode)
>  }
>  #endif
>  
> +static bool kvm_use_master_clock(struct kvm *kvm)

Maybe kvm_can_use_master_clock() so that this isn't misconstrued with the actual
ka->user_master_clock field.

> +{
> +	struct kvm_arch *ka = &kvm->arch;
> +
> +	/*
> +	 * The 'old kvmclock' check is a workaround (from 2015) for a
> +	 * SUSE 2.6.16 kernel that didn't boot if the system_time in
> +	 * its kvmclock was too far behind the current time. So the
> +	 * mode of just setting the reference point and allowing time
> +	 * to proceed linearly from there makes it fail to boot.
> +	 * Despite that being kind of the *point* of the way the clock
> +	 * is exposed to the guest. By coincidence, the offending
> +	 * kernels used the old MSR_KVM_SYSTEM_TIME, which was moved
> +	 * only because it resided in the wrong number range. So the
> +	 * workaround is activated for *all* guests using the old MSR.
> +	 */
> +	return ka->all_vcpus_matched_tsc &&
> +		!ka->backwards_tsc_observed &&
> +		!ka->boot_vcpu_runs_old_kvmclock;

Please align indentation:

	return ka->all_vcpus_matched_tsc &&
	       !ka->backwards_tsc_observed &&
	       !ka->boot_vcpu_runs_old_kvmclock;

> +}
> +
>  static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu)
>  {
>  #ifdef CONFIG_X86_64
> @@ -2550,7 +2571,7 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu)
>  	 * To use the masterclock, the host clocksource must be based on TSC
>  	 * and all vCPUs must have matching TSC frequencies.
>  	 */
> -	bool use_master_clock = ka->all_vcpus_matched_tsc &&
> +	bool use_master_clock = kvm_use_master_clock(vcpu->kvm) &&
>  				gtod_is_based_on_tsc(gtod->clock.vclock_mode);
>  
>  	/*
> @@ -3096,9 +3117,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
>  					&ka->master_cycle_now);
>  
>  	ka->use_master_clock = host_tsc_clocksource
> -				&& ka->all_vcpus_matched_tsc
> -				&& !ka->backwards_tsc_observed
> -				&& !ka->boot_vcpu_runs_old_kvmclock;
> +				&& kvm_use_master_clock(kvm);

Perfect opportuity to put the "&&" on the preceding line.
>  
>  	/*
>  	 * When TSC scaling is in use (which can thankfully only happen
> -- 
> 2.44.0
> 

