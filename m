Return-Path: <linux-doc+bounces-38475-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4CDA3A0EB
	for <lists+linux-doc@lfdr.de>; Tue, 18 Feb 2025 16:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49D63164B4F
	for <lists+linux-doc@lfdr.de>; Tue, 18 Feb 2025 15:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED10526B94B;
	Tue, 18 Feb 2025 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JcLLBVJ5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5406613DBA0
	for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739891841; cv=none; b=LzRnHm4GKpeny2UrETb+8F/9Rb1OM4VpIuV2y8XEYCbjK6h0r7+8UvOXiEePrp8ZyYHvpdYdwJHsUaTx8aPeE4BwWWjupgpE7QG584ImZb/z8zWlsOx3sCzGLOEXAEx008wXAV87OnTXyTQ4v+uiHBlh3vAp/n1zS4t2PT7FUyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739891841; c=relaxed/simple;
	bh=06wi7OlKU9pttsryo+yx/71t6ANWvg+wVnFIDb+RIUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hLx8uBmMTVrXn1BkNA6gwHQcngGHyTYM4F3LdG93rfpDuB3amSSMpJCBjeinWI9kvLYVhnsUwzjSmN5CcJiicebORccaVn+1RKABNiGLX0Tyw//LuKsNJs+2KiB/BmBygPOR6EVHmRIEr3VBp89BA9DXIDJMXJotX53wGGDu/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JcLLBVJ5; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc2fee4425so13149826a91.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 07:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739891838; x=1740496638; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KTl00Jhr2CSLXa3I1xwwS3f7lgcM+/4oxJC/10DlxMg=;
        b=JcLLBVJ5G1hzsASTVglEUHhbaPwb/uB/w1y6emzcF8CpoXqdeCqNMUIyeveAfh1QbH
         BC1uNCXPAMVTHFUuXAaJXPWPzyvoJIS7yH1UYirnyWjC7/0Vh/pF16tdTrgliER3xhT7
         cmn/sUL9CTHhi30B+6jba3lqEMqzI/8HYXal23v1ZHdMvw4xo7LN0+fpsrzYWwvjhS8M
         mYae9FBu6YnHfhenVCnOIKAD3qxPJdR0ETK8M3G1S/B1LcLSbaImr5jNmoPg6B91jUNS
         vkV9Cn6AGbx5Afp82Cue7nDhdsvxTWOeOGvNoHvcotXesjKU/ma9yY/+EnJBYWLekyyL
         33MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739891838; x=1740496638;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTl00Jhr2CSLXa3I1xwwS3f7lgcM+/4oxJC/10DlxMg=;
        b=vFyDfI/qlzeUucnMrPL959iNKrMosoQ6EsAdGopG4kCfkPjx6tK+qtkUbMgm6xhsTQ
         mtnsLYRg7p6QjlGIHM4xrXNkT5Aw7KlzXFcfuoFktlMX2x35KEaomd/H1ZF6SnQro3OO
         ZOa706Ei5SYGmTNCLkDtOXYV9WCieh9Sm6tJCAV75ekTA4bX+OzohYOGE8FYEPaJOWCK
         6aqUxZrY8ALb4CeZMxttcsvAgUNlsOxOvSd25BxQ0hW1OcNv7KfeWHyzEpEZnntV7LR/
         4fdZ1XmSOp3TYWrn0ne+p2/Yc6FlrcSPViLpReHU0eg1u1vy6mVGhEr8DYKu7PnUdtbl
         mdCw==
X-Forwarded-Encrypted: i=1; AJvYcCW5IKC4Tx15Iy78C1VAk+dn8vtUw+IuQQMlzijaesGzjcF2W2T+/Om5FCT8hKt/9dPoq0Ph8zLwVZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOL21QELccOZLdWvlrv/Mt/11whvPDT31PdKd/TiCuJNlqadP4
	FRX6F9PPFj05VUxH+2Od2p1tfLNj01Qb3dcWzUmtCVnP5T7UeY6OLdM7zF58jNZRVms09K3g6Q9
	WyA==
X-Google-Smtp-Source: AGHT+IG/fPttDnqX5qnmK9IJ1EvouZpm2CtXv0FEGLAeE0RI7k+5VtmeIsohxgzGHhXJ4d5CHa8CCumGZCw=
X-Received: from pjbpm4.prod.google.com ([2002:a17:90b:3c44:b0:2fa:a101:743])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ac4:b0:2fa:b84:b304
 with SMTP id 98e67ed59e1d1-2fc41049fecmr18192739a91.22.1739891838593; Tue, 18
 Feb 2025 07:17:18 -0800 (PST)
Date: Tue, 18 Feb 2025 07:17:17 -0800
In-Reply-To: <87frkcrab8.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241127172654.1024-1-kalyazin@amazon.com> <20241127172654.1024-2-kalyazin@amazon.com>
 <Z6ucl7U79RuBsYJt@google.com> <87frkcrab8.fsf@redhat.com>
Message-ID: <Z7SkfSRsE5hcsrRe@google.com>
Subject: Re: [PATCH 1/2] KVM: x86: async_pf: remove support for KVM_ASYNC_PF_SEND_ALWAYS
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Nikita Kalyazin <kalyazin@amazon.com>, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	xiaoyao.li@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, roypat@amazon.co.uk, xmarcalx@amazon.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 17, 2025, Vitaly Kuznetsov wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Wed, Nov 27, 2024, Nikita Kalyazin wrote:
> >> 3a7c8fafd1b42adea229fd204132f6a2fb3cd2d9 ("x86/kvm: Restrict
> >> ASYNC_PF to user space") stopped setting KVM_ASYNC_PF_SEND_ALWAYS in
> >> Linux guests.  While the flag can still be used by legacy guests, the
> >> mechanism is best effort so KVM is not obliged to use it.
> >
> > What's the actual motivation to remove it from KVM?  I agreed KVM isn't required
> > to honor KVM_ASYNC_PF_SEND_ALWAYS from a guest/host ABI perspective, but that
> > doesn't mean that dropping a feature has no impact.  E.g. it's entirely possible
> > removing this support could negatively affect a workload running on an old kernel.
> >
> > Looking back at the discussion[*] where Vitaly made this suggestion, I don't see
> > anything that justifies dropping this code.  It costs KVM practically nothing to
> > maintain this code.
> >
> > [*] https://lore.kernel.org/all/20241118130403.23184-1-kalyazin@amazon.com
> >
> 
> How old is old? :-)
> 
> Linux stopped using KVM_ASYNC_PF_SEND_ALWAYS in v5.8: 

5.8 is practically a baby.  Maybe a toddler :-)

> commit 3a7c8fafd1b42adea229fd204132f6a2fb3cd2d9
> Author: Thomas Gleixner <tglx@linutronix.de>
> Date:   Fri Apr 24 09:57:56 2020 +0200
> 
>     x86/kvm: Restrict ASYNC_PF to user space
> 
> and I was under the impression other OSes never used KVM asynchronous
> page-fault in the first place (not sure about *BSDs though but certainly
> not Windows). As Nikita's motivation for the patch was "to avoid the
> overhead ... in case of kernel-originated faults" I suggested we start
> by simplifyign the code to not care about 'send_user_only' at all. 

In practice, I don't think it's a meaningful simplification.  There are other
scenarios where KVM shouldn't inject an async #PF, so kvm_can_deliver_async_pf()
itself isn't going anywhere.

AFAICT, what Nikita actually wants is a way to disable host-side async #PF, e.g.

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f97d4d435e7f..d461e1b5489c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13411,7 +13411,8 @@ bool kvm_can_do_async_pf(struct kvm_vcpu *vcpu)
                     kvm_is_exception_pending(vcpu)))
                return false;
 
-       if (kvm_hlt_in_guest(vcpu->kvm) && !kvm_can_deliver_async_pf(vcpu))
+       if ((kvm_hlt_in_guest(vcpu->kvm) || kvm_only_pv_async_pf(vcpu->kvm)) &&
+           !kvm_can_deliver_async_pf(vcpu))
                return false;
 
        /*

> We can keep the code around, I guess, but with no plans to re-introduce
> KVM_ASYNC_PF_SEND_ALWAYS usage to Linux I still believe it would be good
> to set a deprecation date.

