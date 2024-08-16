Return-Path: <linux-doc+bounces-22896-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1188953FC6
	for <lists+linux-doc@lfdr.de>; Fri, 16 Aug 2024 04:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FAF5B2350A
	for <lists+linux-doc@lfdr.de>; Fri, 16 Aug 2024 02:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F3F3BBF0;
	Fri, 16 Aug 2024 02:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aQwF2aqv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D307F482E4
	for <linux-doc@vger.kernel.org>; Fri, 16 Aug 2024 02:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723775926; cv=none; b=LU6PCVvBWzgLrR/sUbBk2s8wwUhaGN9gWf81/Q2KCWhUIXLuzCcdkcjdVMZt8h55eogbOD5k74FG3JIxy69Il6/BONLEovktXXjmbJeHkiuzSzM79n6wC6Drg2ndeWflcTH+CrZqpNKuQ5ycsxpAOY1uyIkpJVugD9x0NRUL1Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723775926; c=relaxed/simple;
	bh=Tg/mUA7GfRDkY08pK/TnN/m2P6YZYX8pzUAgRlRhh2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PToHrCPjMINAAiAX6Z5DItJIsnOE9hNBFT+Rm86kCfZTI65FdOuQTGXyoinVuYg12D1LTNu8C9mDQN2G98xjV2Xi8JSkxBFoeGkkK8qCt+hHHlg6Z5fs7BRKfeKxwwpgGZeUvQjlcvxm54FyhDBYO7q3zxpjgjzy06dy+dJTzM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aQwF2aqv; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ad97b9a0fbso32384327b3.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2024 19:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723775924; x=1724380724; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LyjbohY2C3uhRTrXGup/3TN9AtJjgG7LMPSUPTUSkaA=;
        b=aQwF2aqv3cVokNoWV+pRbB6kEfNaJ59JQZLURZi+hITnc7ZwIgx0tC5TdlMqQjQER8
         69tpwghC/A8DJGuSHRZvOattzykbYnv/jdyVf0DZsLcsScVqJfVPWGT1wLElK83Fu0iE
         28m24ok/lubY9gW0azB0TbXPLEP9ml0j4bDiudLeqnrLlTMlHnM2gb+jxm68t5fCEdNt
         PPsxcttjqAqCvZin8qZiF6ZuXjzPyBtcQH6JaDyS8NHFZwvOklr7mtwz3kDr9DU/toSN
         0kKTBNIc0EHvPy/4ReTte2uV7W0UPhZWjB8mTTFGD+9dATLR5Kukc21lzcIOx5MXmLJG
         /T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723775924; x=1724380724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyjbohY2C3uhRTrXGup/3TN9AtJjgG7LMPSUPTUSkaA=;
        b=qKuVWxeEjJnLioZbxq8ZHnHeU7o1SorifsWsT+NASJfPmXR5SaDwB6g8L1LJuUrvYU
         du1p1HAcY2Pc6cLcr6+IxsRX4kddIja95spPta46pMzoi9vFhS2LEX8mosxDpMJa9NQn
         IBmTgpbUx7HRTfAZnEKcTxO52RF6QY4BDuXp/2ddLxxVseg4I6htBeaMajKyAnxx02bN
         Ah3z1rZN/l7WWUM5HqBZhbfHIYvdWFjGwaHyxayHclWCX9nr0hEm//Gn52xYJ16WArio
         rq69eXiECFrHZzDDRplS3dIGV3jRIczBJ51mLFXQ99EbmpXbNLpXBZfMW9ZDU1YyjSn9
         0qPw==
X-Forwarded-Encrypted: i=1; AJvYcCXeVAz8Hu2tPsy/30Rv0zmONTBrGQh7WT3i7AvGKS3jzvlQQ4GhCFOGoAlzia/Zgr9IJaScRxLKGPu1uSBmuYiFoVHOqWxfTI49
X-Gm-Message-State: AOJu0YzayQJ/9MKCiBl9Ix/BSpFvJe5bawXnGNrwL6VGA1thTvsex2vX
	Sx65d5mZZZKtXVkaySrvNCF7jn9o7+1t2kBlyFG/6nJcH1+BOIwQnh7DDMM+dZ3cTWMr2LcqXKW
	6Uw==
X-Google-Smtp-Source: AGHT+IE5aoR8QpfQBshABkJAvxMCtGn+ogdjhA8YhzRHzo0dzawE7uFYL81H+c5VKis6QxoS/7e7UbDurxE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:6784:b0:681:8b2d:81ae with SMTP id
 00721157ae682-6b1bb85ee4bmr800067b3.9.1723775923786; Thu, 15 Aug 2024
 19:38:43 -0700 (PDT)
Date: Thu, 15 Aug 2024 19:38:36 -0700
In-Reply-To: <20240522001817.619072-16-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522001817.619072-1-dwmw2@infradead.org> <20240522001817.619072-16-dwmw2@infradead.org>
Message-ID: <Zr67rPxxSDYTYPYV@google.com>
Subject: Re: [RFC PATCH v3 15/21] KVM: x86: Allow KVM master clock mode when
 TSCs are offset from each other
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

On Wed, May 22, 2024, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There is no reason why the KVM clock cannot be in masterclock mode when
> the TSCs are not in sync, as long as they are at the same *frequency*.

Yes there is.  KVM sets PVCLOCK_TSC_STABLE_BIT when the master clock is enabled:

	if (use_master_clock)
		pvclock_flags |= PVCLOCK_TSC_STABLE_BIT;

which tells the guest its safe to skip the cross-(v)CPU forced monotonicty goo:

	if ((valid_flags & PVCLOCK_TSC_STABLE_BIT) &&
		(flags & PVCLOCK_TSC_STABLE_BIT))
		return ret;

	/*
	 * Assumption here is that last_value, a global accumulator, always goes
	 * forward. If we are less than that, we should not be much smaller.
	 * We assume there is an error margin we're inside, and then the correction
	 * does not sacrifice accuracy.
	 *
	 * For reads: global may have changed between test and return,
	 * but this means someone else updated poked the clock at a later time.
	 * We just need to make sure we are not seeing a backwards event.
	 *
	 * For updates: last_value = ret is not enough, since two vcpus could be
	 * updating at the same time, and one of them could be slightly behind,
	 * making the assumption that last_value always go forward fail to hold.
	 */
	last = raw_atomic64_read(&last_value);
	do {
		if (ret <= last)
			return last;
	} while (!raw_atomic64_try_cmpxchg(&last_value, &last, ret));

	return ret;

As called out by commit b48aa97e3820 ("KVM: x86: require matched TSC offsets for
master clock"), that was the motivation for requiring matched offsets.

As an aside, Marcelo's assertion that "its obvious" was anything but to me.  Took
me forever to piece together the PVCLOCK_TSC_STABLE_BIT angle.

    KVM: x86: require matched TSC offsets for master clock
    
    With master clock, a pvclock clock read calculates:
    
    ret = system_timestamp + [ (rdtsc + tsc_offset) - tsc_timestamp ]
    
    Where 'rdtsc' is the host TSC.
    
    system_timestamp and tsc_timestamp are unique, one tuple
    per VM: the "master clock".
    
    Given a host with synchronized TSCs, its obvious that
    guest TSC must be matched for the above to guarantee monotonicity.
    
    Allow master clock usage only if guest TSCs are synchronized.
    
    Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

> Running at a different frequency would lead to a systemic skew between
> the clock(s) as observed by different vCPUs due to arithmetic precision
> in the scaling. So that should indeed force the clock to be based on the
> host's CLOCK_MONOTONIC_RAW instead of being in masterclock mode where it
> is defined by the (or 'a') guest TSC.
> 
> But when the vCPUs merely have a different TSC *offset*, that's not a
> problem. The offset is applied to that vCPU's kvmclock->tsc_timestamp
> field, and it all comes out in the wash.
> 
> So, remove ka->nr_vcpus_matched_tsc and replace it with a new field
> ka->all_vcpus_matched_tsc which is not only changed to a boolean, but
> also now tracks that the *frequency* matches, not the precise offset.
> 
> Using a *count* was always racy because a new vCPU could be being
> created *while* kvm_track_tsc_matching() was running and comparing with
> kvm->online_vcpus. That variable is only atomic with respect to itself.
> In particular, kvm_arch_vcpu_create() runs before kvm->online_vcpus is
> incremented for the new vCPU, and kvm_arch_vcpu_postcreate() runs later.
> 
> Repurpose kvm_track_tsc_matching() to be called from kvm_set_tsc_khz(),
> and kill the cur_tsc_generation/last_tsc_generation fields which tracked
> the precise TSC matching.

If this goes anywhere, it needs to be at least three patches:

  1. Bulk code movement
  2. Chaning from a count to a bool/flag
  3. Eliminating the offset matching

