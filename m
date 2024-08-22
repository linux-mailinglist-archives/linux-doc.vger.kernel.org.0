Return-Path: <linux-doc+bounces-23588-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F195BC8E
	for <lists+linux-doc@lfdr.de>; Thu, 22 Aug 2024 18:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13ABB287101
	for <lists+linux-doc@lfdr.de>; Thu, 22 Aug 2024 16:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BB91CDFC5;
	Thu, 22 Aug 2024 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o5NM5+I8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A00E1CDFBB
	for <linux-doc@vger.kernel.org>; Thu, 22 Aug 2024 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724345926; cv=none; b=oMpe5ojYF6yL3RfCWGmAdGEKp/g1YF074YtVZqM/nT5udAgmYhsDHAl5tVetKTu1Hx1Mq9dU2tHPUpkyybyVzYU3BEmk6l5RYDqCzIi1oJxcNYmamrdz8hpeL927levfxe+UuDaAiX39nL1ISOq0euVCk7TNLU39kQGxbvJXzPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724345926; c=relaxed/simple;
	bh=UeomF2//hAwCF+QkX7m0LD9i0ymmYaQhD/LHrqSfOr8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B606Rabtbw5smJuClLoM4t0Ixj9FZree7rXucDZ1U4AW3UNrRB7ZOmn695MCO9avpPpUYGVKD8Cdp57zw2UmL7KYKSCwjhMXcwra/K0zW5psN5/Akpmz61+1bVgXMMhzeC4OacAAb18eaUOUFImOkORTe2KyHmbbHHI66XfTDsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o5NM5+I8; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7cd98f27becso1057408a12.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Aug 2024 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724345925; x=1724950725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PnptKaBIwTlVutbudys0Nw5Cu09TSnmrnQQJzWGV6c8=;
        b=o5NM5+I8Px1XHFS8zSMcYEKneea7C3sW4Anl+GALFbdc8W7jzIxocKi4/uKfkDzxkj
         ueyR3JeYe3oeAmNJyEf5n3rPKWxA7MycA1dlmV6ebWAV8ct8p8k9XmLbLWh5M30tTMvR
         /YJQfi7k0Xl6XA5ddm/XKjvPZFYnOO/uQ/gCAC1eSPgzzxFSxmvVtIF+aAYXzoPFwKl2
         ggSVcE3e+2P5jW+0ENVvotAaT10ynT/VvWiP58thkA3R22ExGFKLax4HUwJrWkGp4ISs
         r4OIkzomWGDRFOXnLZGXlsoXJUgZmWj5VC26mpkqoSOXmkLpi0KaIlLffmJMghJ44m4B
         YUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724345925; x=1724950725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnptKaBIwTlVutbudys0Nw5Cu09TSnmrnQQJzWGV6c8=;
        b=PImqzmEL2hAAyedJCZa2KfTmpcu2c1n2IdDx2aVGBVtIchwjFASr+lIJbvjwcMeRHr
         GW7WC18g5Y/aO/HQK5902x4G8S27LBvJ/b6brJDmanFHVm7ge5Gd3EAXCYWAJmexNi0w
         a8tmDDSomsey6hhmx+vThRRYSOMlGJscxHTqYpuLCjTCSRw5XbaWp1iH+vjwB0Vl0c7e
         Qw8TvhtJ/YUal4Xjk8swrjNR7jnB2+cpqtIAK6doYJrPclQIKaB7FMzYDt8ywrDLvDVa
         b7gR5tWzM2+dHEAOjuHhOUftCg8yacR+SmmgiLAgvh0Y2cI65pqY+VbgrVqPkUduiyY5
         wk7A==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZCCIe9kJR5EGccieUi35RBHDIITmWM5W/1SbcEaIr4MiJZe7rBNYi0S3Kkfv6o4Hay2apo+f2+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVXr/w8yHAV8fZDa+8mGvo3117XzIzpml13+oLeECqwco0CKv2
	L4CCZzhm+66lCMxD7lpzIZjZQIHg4wjF42BLrsvuFyJ2IiNDpzLp0+7vHjyz75fsWcy/BgWCE5x
	raw==
X-Google-Smtp-Source: AGHT+IHwvoth9fT1Z/DL4U24HgtU5PZ34fwWotGULJe3J4WG7tBh6KRt8uzZjRmfX56Dy8PjGUScXSTTOtc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:64ca:0:b0:6e3:e0bc:a332 with SMTP id
 41be03b00d2f7-7cd88b70338mr16399a12.2.1724345924436; Thu, 22 Aug 2024
 09:58:44 -0700 (PDT)
Date: Thu, 22 Aug 2024 09:58:43 -0700
In-Reply-To: <D3MJJCTNY7OM.WOB5W8AVBH9G@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240609154945.55332-1-nsaenz@amazon.com> <20240609154945.55332-17-nsaenz@amazon.com>
 <D3MJJCTNY7OM.WOB5W8AVBH9G@amazon.com>
Message-ID: <ZsduQ7tg0oQFDY8h@google.com>
Subject: Re: [PATCH 16/18] KVM: x86: Take mem attributes into account when
 faulting memory
From: Sean Christopherson <seanjc@google.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	graf@amazon.de, dwmw2@infradead.org, pdurrant@amazon.com, mlevitsk@redhat.com, 
	jgowans@amazon.com, corbet@lwn.net, decui@microsoft.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	amoorthy@google.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 22, 2024, Nicolas Saenz Julienne wrote:
> On Sun Jun 9, 2024 at 3:49 PM UTC, Nicolas Saenz Julienne wrote:
> > Take into account access restrictions memory attributes when faulting
> > guest memory. Prohibited memory accesses will cause an user-space fault
> > exit.
> >
> > Additionally, bypass a warning in the !tdp case. Access restrictions in
> > guest page tables might not necessarily match the host pte's when memory
> > attributes are in use.
> >
> > Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> 
> I now realize that only taking into account memory attributes during
> faults isn't good enough for VSM. We should check the attributes anytime
> KVM takes GPAs as input for any action initiated by the guest. If the
> memory attributes are incompatible with such action, it should be
> stopped. Failure to do so opens side channels that unprivileged VTLs can
> abuse to infer information about privileged VTL. Some examples I came up
> with:
> - Guest page walks: VTL0 could install malicious directory entries that
>   point to GPAs only visible to VTL1. KVM will happily continue the
>   walk. Among other things, this could be use to infer VTL1's GVA->GPA
>   mappings.
> - PV interfaces like the Hyper-V TSC page or VP assist page, could be
>   used to modify portions of VTL1 memory.
> - Hyper-V hypercalls that take GPAs as input/output can be abused in a
>   myriad of ways. Including ones that exit into user-space.
> 
> We would be protected against all these if we implemented the memory
> access restrictions through the memory slots API. As is, it has the
> drawback of having to quiesce the whole VM for any non-trivial slot
> modification (i.e. VSM's memory protections). But if we found a way to
> speed up the slot updates we could rely on that, and avoid having to
> teach kvm_read/write_guest() and friends to deal with memattrs. Note
> that we would still need to use memory attributes to request for faults
> to exit onto user-space on those select GPAs. Any opinions or
> suggestions?
> 
> Note that, for now, I'll stick with the memory attributes approach to
> see what the full solution looks like.

FWIW, I suspect we'll be better off honoring memory attributes.  It's not just
the KVM side that has issues with memslot updates, my understanding is userspace
has also built up "slow" code with respect to memslot updates, in part because
it's such a slow path in KVM.

