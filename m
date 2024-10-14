Return-Path: <linux-doc+bounces-27485-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6503099DA27
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 01:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00B391F22B4B
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 23:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D2A1D9A4F;
	Mon, 14 Oct 2024 23:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q5Qbr6Ma"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4BF1CBE8B
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 23:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728949015; cv=none; b=IW3HAqFAj70WcO9r+Z6EGgNwzweZk1eok5EsSKeOsY0H2H1/5TnDWqXdw4onffCrgqO9hbDDbdXrA49VZhPbSov7v0fJwWs5N3gMn1oMeyxIMojs6lo3UMse90tG8/zcpDFH/bA0AO/tN5UCrHyocM4eIWQzB8ni6e4YZCuHXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728949015; c=relaxed/simple;
	bh=9lQ11KBt43uQ5J9JR5JWrhkSeYstXcy9pl4223UHEE0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hk+DUGeI+FBEhWNJTOK5Uh0HqXBYbRFmETXfcU90+QtobYVx0GPpwE/J0CCLEEZgPTMlQp3cb8CfR9yt5sri0rfilw9kpLN3XXugowg0f5+LTqVB3HETkoaVWOhdkzuXzd9JgmYaY/GnpPtkIBMxL+Q/14tUyyFUz1vc8VQ2iig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q5Qbr6Ma; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e389169f92so23293877b3.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728949013; x=1729553813; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zm6GRvpYVPkv4rqmcHo9pBIrnZWQHVu3C3S3LK/OgI4=;
        b=q5Qbr6MaqI7zz/3A99gTIAbvhpULKJUA3yL3NQotwIJ286dQE9tiW2xwSkioFwixiG
         16tXjs+9iN/bAC8aMP2ms4c/2UmYVhUSUSCjFsQzuzrWrIRgb7W/dI74V/fEwS4tq8Ix
         wVhBELhd2r3XZRkahlrfO3rYWd5nrGIrG1rrudcNoaMBbkLbMvw7DHwtr2S+E/vK27hu
         UB7UxMfYszMXhIJ3W3gQDv7Yee/PG1PH47q9bTD3yjpWEYIaeHCbVN2w17XPhneJtqvn
         ORBrIcZChjtwhSHR+TCrrxNV9Df87tfejS8gQmMbZXR7o0cMGX04NhjXTJxFccvw6E0n
         n59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728949013; x=1729553813;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zm6GRvpYVPkv4rqmcHo9pBIrnZWQHVu3C3S3LK/OgI4=;
        b=P6vlcyAfAI6UXentA/t5QzDUEPxnTqDGOqyOgV+BWGvDdl60LOf6+tBFAOkTNkdXr4
         XsrV+YpwVvyPcfULQ4mvLyQicR6VQliYSP7/tmWWWMWGRXt7Y3hT10fsBqw1W1qlc76S
         cc3nMaYTV/9y/RRaraHioday/oQgRfKHszxQhiAaYbWTvTJPFvVEvUXctfWagx+NVOaE
         TO/Z43B/hilScc0Vw/y9/ivrsJKNtHdvxi6yeQDpNLMKafi4NhYT+n3EuSdvOi+ZtUtY
         G94Zw70V1disw1emA7cxYsvAFtib2QvSiDsqI+rzoEqaIvvyHMJcEbBzXhnxRxZLGKp0
         yMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcHtOm+mQxDYz3MdqbPX/rXW6QEfMiaQA2KAcyfQeyhw20QhNxaJ/FG+DSgztM/QKdduw1G+cCZ2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9+1qViewzxlhJDn02L+IeJZ6CLKC2qr6Z/OayXj6a1blPfO3
	CV072PfmLHraua7/1U9fCNU4lF9s1Bzrng2Gnm6wACMA1EIQ6/Y7W+mkbPOtlS95DGn/6ojQNPN
	GnA==
X-Google-Smtp-Source: AGHT+IGrlmmIMbrq1eDFzk8slt5Bv/bjfFyuOUS+xM//3TUnJKMB1jMjboz4gv8IycU3lIMwe83TEFFGqyA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:2e02:0:b0:e22:5fcb:5e22 with SMTP id
 3f1490d57ef6-e2919d75c76mr8304276.3.1728949013311; Mon, 14 Oct 2024 16:36:53
 -0700 (PDT)
Date: Mon, 14 Oct 2024 16:36:51 -0700
In-Reply-To: <20241004140810.34231-1-nikwip@amazon.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241004140810.34231-1-nikwip@amazon.de>
Message-ID: <Zw2rE7-ZTCFpNE5G@google.com>
Subject: Re: [PATCH 0/7] KVM: x86: Introduce new ioctl KVM_HYPERV_SET_TLB_FLUSH_INHIBIT
From: Sean Christopherson <seanjc@google.com>
To: Nikolas Wipper <nikwip@amazon.de>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Nicolas Saenz Julienne <nsaenz@amazon.com>, 
	Alexander Graf <graf@amazon.de>, James Gowans <jgowans@amazon.com>, nh-open-source@amazon.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Nikolas Wipper <nik.wipper@gmx.de>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	x86@kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 04, 2024, Nikolas Wipper wrote:
> This series introduces a new ioctl KVM_HYPERV_SET_TLB_FLUSH_INHIBIT. It
> allows hypervisors to inhibit remote TLB flushing of a vCPU coming from
> Hyper-V hyper-calls (namely HvFlushVirtualAddressSpace(Ex) and
> HvFlushirtualAddressList(Ex)). It is required to implement the
> HvTranslateVirtualAddress hyper-call as part of the ongoing effort to
> emulate VSM within KVM and QEMU. The hyper-call requires several new KVM
> APIs, one of which is KVM_HYPERV_SET_TLB_FLUSH_INHIBIT.
> 
> Once the inhibit flag is set, any processor attempting to flush the TLB on
> the marked vCPU, with a HyperV hyper-call, will be suspended until the
> flag is cleared again. During the suspension the vCPU will not run at all,
> neither receiving events nor running other code. It will wake up from
> suspension once the vCPU it is waiting on clears the inhibit flag. This
> behaviour is specified in Microsoft's "Hypervisor Top Level Functional
> Specification" (TLFS).
> 
> The vCPU will block execution during the suspension, making it transparent
> to the hypervisor.
 
s/hypervisor/VMM.  In the world of KVM, the typical terminology is that KVM itself
is the hypervisor, and the userspace side is the VMM.  It's not perfect, but it's
good enough and fairly ubiquitous at this point, and thus many readers will be
quite confused as to how a vCPU blocking is transparent to KVM :-)

