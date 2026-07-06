Return-Path: <linux-doc+bounces-95267-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NUeADZ44TGqChwEAu9opvQ
	(envelope-from <linux-doc+bounces-95267-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 01:22:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B6971648D
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 01:22:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Q3ji1pM3;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95267-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95267-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE8D83028B2A
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 23:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F403E7BCC;
	Mon,  6 Jul 2026 23:22:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8BB3E51E8
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 23:22:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783380122; cv=none; b=Dd+mZ9jIT20HpKII/31+BWexrbH0WFIMdiQbr+wegIKo9igdKLVRIrfeWTth1dAtPXAaDqUNEw6/vMqNLMcoL9cl+PYp2UDmSCD+KaL4H9533J/RndhXlENVVSlXL4hIed+shC9/5eJh1BO1be8JlvEJ4bjf2238KpvOSTHMf/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783380122; c=relaxed/simple;
	bh=5tTJzFCz090WEshickhyWZBU+H17ZnKRtGBALiNloLs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UxNHOtGc1gvk08IQ38UekD0ur7PJioIj2pVnWn0G/OLvwPW4CcxKxy7lIdDSeLZA5cGaBb5XCpraj7cSkEgiTbKf2mUocwWDSmrwj0DSV3VtNwbnH4hUN4ou7eYn0SeffOvFpfVzgjzjDCTbtu8GHzam7sXnoSIlB7/H9s1T9YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q3ji1pM3; arc=none smtp.client-ip=209.85.210.201
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso7205092b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 16:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783380121; x=1783984921; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkGzf5Ltjdp17l7lz9dFJNCiKSFQqbXrN82DhhAxuS4=;
        b=Q3ji1pM3TEx9qTs8lyrmnbPXJ5AuzBP1mkFHj1juU45RaVB6um1ykpX5nJ5DpI5bjf
         7wA83gh1nHeEme4R27MlyAmAfV2M+rhJhgKZVQvqGuOeXaxjOKsNkM8vULO0LClZ8lTE
         jw+EIY1VlIRca4U89BC9R6Nem7nvEwJ161GD69bwGebls3csshtJXaCl9nSwCum8jlIn
         nbOtVfqk1en9AbcZAxuSzJZS7Dsef/m5WPvrryhHYS/0wmiegjF2Y4gn+XCzDwX3mYAV
         Xor8fh2vakqcLoR4l4yrhan/3Fet165oK4WOuu4Ip5aWWPxmSWlvzCBjsxHXhp9Ibv/M
         qRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783380121; x=1783984921;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkGzf5Ltjdp17l7lz9dFJNCiKSFQqbXrN82DhhAxuS4=;
        b=nDehDXbVnEfB6woF6j1Y9X56Tr6ZIiPmudpeBn3ayXW1jE9wSgHY7rkAWbGWO1kG0V
         3t9Q2/wqfGfRznRDqrBwcWmHM8OPbrFH9bhrR0nVi+XtoZWhuTigzFk3uoWoqVxFIO2B
         tBCFlPKeHjjOr7cgH9Nm79Asy7jxt01yrwiUtp26RxW/guNKYCmriLfkTW6QzhgkXKt3
         U8gcNw9kK78SJ8An+uQh41vCOxFpeYQTvHL+OKB+Ffab7zE/pHfV95u5wCGYl9aogiWG
         UrXsfnh77SGS/DJExNHpaXcYfoyXDiU1I9IDDraE6egTY63yIMkTZKCsLJQ5XNeQk3rC
         s99Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro/+Fh1LqsM3wolJ8yHC8kV0gQdsoAzdeVHsbdCJnEaDwKfOE0afB62k1hSn5nkVOB+C5Uw+Iylydw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkIjGFN+yCfercwEnvAxSKnFejGZsxWegQUWdvxoBiSwBDzmY
	nO+jFkRRJFccrQccEvq2MNQrezAc2N6xxZvMcPNGTadFHLfe5/4yTHC1HMddsjbylFnHqFX1cXy
	i+tmCiQ==
X-Received: from pfx50.prod.google.com ([2002:a05:6a00:a472:b0:846:f544:63be])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:94f3:b0:845:d284:9e11
 with SMTP id d2e1a72fcca58-84826e38a3bmr2549381b3a.56.1783380120822; Mon, 06
 Jul 2026 16:22:00 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:22:00 -0700
In-Reply-To: <20260706092021.3625908-3-twiederh@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260706092021.3625908-2-twiederh@redhat.com> <20260706092021.3625908-3-twiederh@redhat.com>
Message-ID: <akw4mH99FGquorxC@google.com>
Subject: Re: [PATCH 1/4] KVM: x86: Document that KVM_CREATE_IRQCHIP must
 precede vcpu creation
From: Sean Christopherson <seanjc@google.com>
To: Tim Wiederhake <twiederh@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95267-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:twiederh@redhat.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82B6971648D

On Mon, Jul 06, 2026, Tim Wiederhake wrote:
> The kernel rejects KVM_CREATE_IRQCHIP with -EINVAL if any vcpus have
> already been created, but the API documentation does not mention this
> requirement.  Add a note.
> 
> Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
> ---
>  Documentation/virt/kvm/api.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 52bbbb553ce1..ec5bf99ff8b8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -856,7 +856,8 @@ Writes the floating point state to the vcpu.
>  Creates an interrupt controller model in the kernel.
>  On x86, creates a virtual ioapic, a virtual PIC (two PICs, nested), and sets up
>  future vcpus to have a local APIC.  IRQ routing for GSIs 0-15 is set to both
> -PIC and IOAPIC; GSI 16-23 only go to the IOAPIC.
> +PIC and IOAPIC; GSI 16-23 only go to the IOAPIC.  This ioctl must be called
> +before creating any vcpus.

I would say instead "This ioctl can only be called before creating any vCPUs",
because a reasonable reading of "must be called before" is that userpace must
*always* call KVM_CREATE_IRQCHIP before creating vCPUs.

>  On arm64, a GICv2 is created. Any other GIC versions require the usage of
>  KVM_CREATE_DEVICE, which also supports creating a GICv2.  Using
>  KVM_CREATE_DEVICE is preferred over KVM_CREATE_IRQCHIP for GICv2.
> -- 
> 2.52.0
> 

