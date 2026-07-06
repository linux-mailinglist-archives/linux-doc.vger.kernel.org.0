Return-Path: <linux-doc+bounces-95269-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FkYhMBQ7TGoFiAEAu9opvQ
	(envelope-from <linux-doc+bounces-95269-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 01:32:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECD3716523
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 01:32:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="fwoS/Owz";
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95269-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95269-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19FD93025E6A
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 23:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1046F3D34AB;
	Mon,  6 Jul 2026 23:32:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6CC3B19D0
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 23:32:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783380752; cv=none; b=QkvQSks4A3tfnyzw10173hySyn5mFTO1K5Rtd4MALroVIRqwp7dbRYxcEXm7W5t1qEScQHhPOLuxED9hVAsOgo91YWYN/Mp/2GzYt5vKLQ8Gdyo6Aluju0QJCr+ZS9gojR3PdQ0MdwbgwC62kAhjc+a4FNzOcdZ3pugxGqM1WgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783380752; c=relaxed/simple;
	bh=/7t9Ugc/W34LK6a95xG4YkOqd/nN2ewf/ou8V7WUmdk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ThOGVKI9gfXDDvYc7UcLi1OyWCsrxw4aq6pmuAHL5pZspLDk+GDOVMqNYcmYVsfLNwzQiHHEeOSTw7Bc4aJibtGIHXf5ZtXWM1/AIiOXPEHAmJV88ZzbIpwXiiwkr0kBFvaXSh6ElTwINMx4W7Dq0dD/z3WxNdoXZbomf3KNraw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fwoS/Owz; arc=none smtp.client-ip=209.85.214.202
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ca5d2474c7so82900885ad.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 16:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783380750; x=1783985550; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BNNmomhV9Nj74H+ib76PoUxNfB3q9OlvTlV4N1FLXo=;
        b=fwoS/OwzXo9V75GTv/qCbwG6OLxdTvi9CK6CMXjYrLVhWIIdeGS6/aXIP4dfSRIyF1
         xRuIsmBPA3lRMXEGE3FZlYpGP45M7Tb9OXdhvY5OCnZi4tSzutEWNByA3JofJGF68uN7
         1adLPY2E6q1XMiC6rFjUIwo/KUCcS8F3m9tKNm2BxQRw97eiii30YAmetvBcqIpKH1om
         f5KVXnOXWKcgZ32FXHendpZjRlbiIjZk7mBDv39OGWQUdFU4FqHT2X5kTMj1OW1KXJrW
         ZVMzIjw//s+7SSFLHDdb7QYFVZfp7hO+cuNz4Y2y/jFUpXmOqJ9RgXkA4Madz0zR/dkm
         fZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783380750; x=1783985550;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8BNNmomhV9Nj74H+ib76PoUxNfB3q9OlvTlV4N1FLXo=;
        b=kA+7rNllCT6vvsRSTvUBPTH/AeqjpE2Bhc7nUjHZlg5bt40fvQTEJgfkBPzDEBh6E4
         NR7LzOdaK1prJzoM3ePGHVWdXAbjbZQ6zbojIULSojH+lVcIXR+7WOjzuZ14cujya3bt
         ojKJygMyaqrCJPgA2dwJUbC0RLPF1FELIOVyr5N8NDY72M0h2JNRxtzbotRKu50YsReg
         ov3jDKa5aSH3Yj8oBLBys+0YbqxmW4ruKxHqCQg3ik7zMo061wcXeogfFnAxWj0UqJl8
         v45IDBoVDxi8CXdgE7TlMLjfpZbP9hfY0PqqOGmE3QW+oFUIgIdNn75BZ/SB8WLeH2gD
         rBUw==
X-Forwarded-Encrypted: i=1; AHgh+RoG6c6QBTWKOayjkVVU4kQ2W0LUTDPaEIN68vfoX3IPnTj1FXUbBMvs6O99DGGDFO27OLTfhOK7TLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ3t5fdW2dHrpHnknvAgn+T7XcDRD1xnQH9A89GNc6y8bK9y12
	gHtdInnmS9lDrGabMTq152i9/Evg7pnjLT0QLEBGWQNP8uXHmc9+wm6s8/g2c5KzHBn3Acns3ld
	L3xNzDA==
X-Received: from plgv5.prod.google.com ([2002:a17:902:e8c5:b0:2ca:d6d7:6943])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41cd:b0:2c9:d55d:2d1
 with SMTP id d9443c01a7336-2ccbf07a42fmr29351655ad.33.1783380749761; Mon, 06
 Jul 2026 16:32:29 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:32:29 -0700
In-Reply-To: <20260706092021.3625908-4-twiederh@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260706092021.3625908-2-twiederh@redhat.com> <20260706092021.3625908-4-twiederh@redhat.com>
Message-ID: <akw7DcP4LM7l_FBh@google.com>
Subject: Re: [PATCH 2/4] KVM: x86: Document APIC base address constraint for
 in-kernel irqchip
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95269-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:twiederh@redhat.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ECD3716523

On Mon, Jul 06, 2026, Tim Wiederhake wrote:
> When an in-kernel irqchip is enabled, vcpu creation installs a private
> 4 KiB memory slot at the default APIC base address (0xfee00000).  If a
> user memory region overlaps this slot, vcpu creation fails with EEXIST.
> The same error occurs when installing an overlapping user memory region
> after vcpu creation.
> 
> This constraint is not documented anywhere.  Add a note to the
> KVM_CREATE_IRQCHIP documentation.
> 
> Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
> ---
>  Documentation/virt/kvm/api.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index ec5bf99ff8b8..da8beb80699a 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -863,6 +863,11 @@ KVM_CREATE_DEVICE, which also supports creating a GICv2.  Using
>  KVM_CREATE_DEVICE is preferred over KVM_CREATE_IRQCHIP for GICv2.
>  On s390, a dummy irq routing table is created.
>  
> +On x86, when an in-kernel irqchip is enabled, KVM reserves a private memory
> +slot for the local APIC at the default APIC base address (0xfee00000).  

KVM doesn't actually do this, at least not until patches 3 and 4, as the APIC
access page is allocated if and only if any form of virtual APIC acceleration
is enabled (in practice, APICv or AVIC, but I'm being pedantic because KVM
enables TPR access accleration even if APICv isn't fully supported).

E.g. if you disable flexpriority_enabled (Intel only) and enable_apicv/avic, KVM
should let userspace create a memslot at the APIC base (I haven't actually tried
this).  The guest won't be able to access its APIC via MMIO, but vCPU creation
shouldn't fail.

Another wrinkle is that the local APIC behavior applies to KVM_CAP_SPLIT_IRQCHIP
as well, i.e. ideally that "ioctl" would call out the local APIC base interaction
too (maybe as a redirect?).

And for KVM_CREATE_IRQCHIP specifically, creating a memslot that overlays the
I/O APIC will also be problematic.  It won't lead to an explicit ioctl failure,
but like the local APIC, creating such an overlay will effectively prevent the
guest from accessing the I/O APIC (via MMIO).

> +User
> +space must not map guest memory that covers this address and must leave a 4 KiB
> +hole in the guest physical memory map at this address.
> +
>  Note that on s390 the KVM_CAP_S390_IRQCHIP vm capability needs to be enabled
>  before KVM_CREATE_IRQCHIP can be used.
>  
> -- 
> 2.52.0
> 

