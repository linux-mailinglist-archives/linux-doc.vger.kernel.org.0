Return-Path: <linux-doc+bounces-93618-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZPusHgF0PWpP3QgAu9opvQ
	(envelope-from <linux-doc+bounces-93618-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:31:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF666C8362
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:31:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=VW30oJLi;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93618-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93618-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9226230136AE
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 18:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBF5325706;
	Thu, 25 Jun 2026 18:29:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643F83168EE
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:29:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412174; cv=none; b=na1wnmuBsY+f29cUbwXe1o6LQzYJR7HLgn55/c8QdDEmBDQSk5FA8Iq+qKfisNnPoB2RKp/rf/emhg0AMxFlCI+XsTZ67LS0BC1lon3ywM/yzrLkLeQqdGtV765pfmdFPNxxMtgCyEStA33NuHZbW+BbggyuH99mRUMS4lGddpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412174; c=relaxed/simple;
	bh=ruI1D+60LviHu6T85gvnun6dB5PLGiX7hIRc8JYMsR4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vunm9ON/hz8CtOkFRABvHN5cnx6mjLFggXnVpBfB8zybqicU0e+rXCpa680NLG1Kf5ugnaDxjpcnFl13ZJ/tNQodo3neU6rXzsf6Boo0JDhYoEExlUtRxacleERma5IaV2lonExdWiLskZ8f9+Id2bPNwAZo3ahBoENElDhBAcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VW30oJLi; arc=none smtp.client-ip=209.85.214.202
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c7ee3952d6so1514865ad.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782412173; x=1783016973; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UlrTxHjS5w8g7dS4TjG06CQGwg1aqavnJRIR747VzMs=;
        b=VW30oJLi1YnO21Z9dAvCvWUufqDhrW2+KRY9yPzl/a3CX2BEHLYnxMdAfnspHDt5lx
         eVipj7Vqe04jDp8b9Tgo+I34H/suTWeAip66n9cAPxd5XX0+lOjmSUX+RvO8+z5AoVjJ
         7aCZbO9ik+gIZYCaA8ZCytU1iPHuXn4Mqr48BMDzyIVpNthG1K2rtFvxAy8WroyFbkfc
         xc2zcQGBAM1VM2FArRNOdcwyUzuQu7srXQVlynXY0GIuxWo2UebnQBrUct/By4aoEUAo
         erzUsAI9nT7gj/kc6ret8QhSASmRh+Leci3rzUsmIHooD+r8wT37uHYbD5QBeshX5vGa
         l2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412173; x=1783016973;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UlrTxHjS5w8g7dS4TjG06CQGwg1aqavnJRIR747VzMs=;
        b=dPxG9yNYz1uL1minVz9utJd2A4DTecoDqQQyaI8tf08updy161LpgneZzhvO5HsN8q
         T0reRzxpxwmNKKQxwwf3RMT6dm398Tqv2YUOTZyRxxUTBX7HbDy8kSVjzGhZ1tM0wOKy
         AQ5qNpFT3kllNn5juGmu277wkud0s2D6H2OnsVuwbHN4YkPZHbJsKkDECdh5rxhodzvS
         /GrWMnOB8WuzXx8cspZTonoRDCNtvS8D2khpeZftOIILtNxYo+f7gDbzXDRgpw3NpVSx
         cn5asWW4s1d6h9nqzBkEv6jqygELgw51tMDFF+aEBgk+vvb1n7J73N3YcaynBB6ldm4K
         upOw==
X-Forwarded-Encrypted: i=1; AHgh+Rp42NIyskYBMv80Sd3/lEYKNS7qDB4sAmsX0uGHe9hzR0ZMJXT/+VTgyHOaeSVpLXToNhHRRJnS7kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHHDw4aUXBCq2QJ4AqB/bDEwk/MkpnHT+e7XojpaGuk7tMe8rS
	cl2XYoDNuFEcS6I8LCq0J4LFH/gMNTLpq301me8j+7ukSssrANrCtcztrrgVxTqEHwpNtZQTIp/
	sGOH1rQ==
X-Received: from plps15.prod.google.com ([2002:a17:902:988f:b0:2bd:4f41:fbf4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d484:b0:2be:3850:297e
 with SMTP id d9443c01a7336-2c7fc792f8emr34372895ad.31.1782412172316; Thu, 25
 Jun 2026 11:29:32 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:29:31 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-11-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-11-4fe8b602ff47@google.com>
Message-ID: <aj1zi1XIvFpJtNlq@google.com>
Subject: Re: [PATCH RFC 11/12] KVM: mmu: Point users of host_pfn_mapping_level()
 to docs
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:zhaotianrui@loongson.cn,m:maobibo@loongson.cn,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:tabba@google.com,m:vannapurve@google.com,m:x86@kernel.org,m:hpa@zytor.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-93618-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEF666C8362

On Wed, May 27, 2026, Ackerley Tng wrote:
> After consolidating documentation for host_pfn_mapping_level() in
> Documentation/virt/kvm/locking.rst, point users of function to docs.

NAK.  I want the "formal" documentation to describe the rules and general mechanisms,
not arch specific implementation details.  It's unfortunate the LoongArch copy+pasted
x86's code, comment and all, but that's a separate problem.

