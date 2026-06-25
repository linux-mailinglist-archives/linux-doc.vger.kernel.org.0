Return-Path: <linux-doc+bounces-93619-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J3LnFvx0PWp13QgAu9opvQ
	(envelope-from <linux-doc+bounces-93619-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:35:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E9E6C83B4
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=qcatYeyB;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93619-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93619-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8BC230465C1
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 18:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8D83264F2;
	Thu, 25 Jun 2026 18:35:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7390C2DECC2
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:35:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412537; cv=none; b=rATCW1lJhoIpNzuGIOZwW0nE9SYB7FiyAIQlnuI4Ry1OTltMmRhAb3wiSsLJGLh5MvWaSIbDaUS1Mi8G7i+NnNXKZIspV0OrNljW+NYQfQbIFCeP8iXUKs0w/oyKj6J8XD3B1jWDF04o6eM9DksTOFWPNSDQPjYMvwH52A7jjcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412537; c=relaxed/simple;
	bh=L9vCpaeeEmhW+X3fHblf6tQERv8UAVK3udM+8P3RNr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MLhRU16dXREBPiAGleemBI4DrYvwUMfKUUjnHYIrM1YuIkurZcDCwLejA1CVWv7QPlDqjshtYP/+JyhfaAMY7EnBzbDKRbCBfO+O729MiGJ3/oVpW4OlJp5sQkO33MUQS8YReTXx4WNBuLsn9EzL4hFKSGOeIeprTPFPPhUrZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qcatYeyB; arc=none smtp.client-ip=209.85.215.201
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c894391f000so178627a12.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782412536; x=1783017336; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXrEPlz9Ov6WhImX2KAHJf2Hbzd09EWe17YltKaKh6c=;
        b=qcatYeyBvaAf2V63iqR7grZEaB1XVKQkBeiXQKabmdPi51WudavK/SR8iTvNwGNqEz
         BalS1LnUB73eML2mz/iIWejpmxfA/59vmn4Pz7i1aMXeKdVFuxKAfKqQFjMHaTQMt0/y
         q/i/gPcoIhdJbudLKip/WumJiJac9llUhSdp/MCbORMVIuZYXotDSNxjNrkM3OZCSHmn
         phA6duulBtgUnro7/7raUQJN8kBwLxfVsofSrJN55AyUoo+saU22scc/Nazzket2Fu+5
         yL7X5Hpa7piVAViuyytzHwOAIp35osMn2XRE9gH9Nz4uc51BDK8EgZW3JcuBcES37Fnd
         AnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412536; x=1783017336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXrEPlz9Ov6WhImX2KAHJf2Hbzd09EWe17YltKaKh6c=;
        b=AIi6H5/eo021xZNcM+n/bxYQBvXhBvNtiyERnT/d3EIEjp8DlRRL2Muxys6rGU2jot
         +Tjh7PnSsl7aU3bCgRqQzi+di67VE3CugssMfKKKWBfvasKRWFfTpUPDDY23g/wuGfRN
         /N4/l5gL3DuHUz9bKRFenjbdMiDlfmUuSmChXQxRPJxLQzLPtJ3CuwuJJ+zV6gFAiBVT
         Wq1oiv9Q+Z9nSCk/qcgUM7VEcLJfwv7hwrSySEeqHZGVPq1IWl3kUsOv2LwIFNSrR0Y1
         UyPZw9r3aAhYcWBsvljHofZJp9aT2uH8QLMoX8ZcJbo5/vrvO6M07OPmr5lmjWvfkHfR
         ZLog==
X-Forwarded-Encrypted: i=1; AFNElJ/fZBus3cdYEvXJVR9s7z928U1HnJs1Q5Spw27O1rUTPgJ0Vzd6JMIIoEmqiBwjtedbhxYabOnLZWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk+nbp0RTjX5i7ZBvkxv1gGfxgecqjXUCKKPvafvKYNZ8yFgBh
	3fHGTYXO/7jx4b8p74fHHNMMB4i88F8YRI+us0eKP37KAEAd3yfttCk153f4IG010T40GhAvkvA
	bwVwjew==
X-Received: from pgbz5.prod.google.com ([2002:a63:6505:0:b0:c8b:dff5:ac27])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a11b:b0:398:7256:3c0
 with SMTP id adf61e73a8af0-3bd4ac9e542mr4363119637.13.1782412535530; Thu, 25
 Jun 2026 11:35:35 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:35:34 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-7-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-7-4fe8b602ff47@google.com>
Message-ID: <aj109naG1wr46Cpf@google.com>
Subject: Re: [PATCH RFC 07/12] Documentation: KVM: Drop mention of kvm->lock
 in SRCU documentation
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-93619-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7E9E6C83B4

On Wed, May 27, 2026, Ackerley Tng wrote:
> The original comment says that synchronize_srcu(&kvm->srcu) is called
> inside critical sections for kvm->lock, vcpu->mutex and
> kvm->slots_lock. Drop mention of kvm->lock since this is no longer true.

I would *much* rather "fix" this by saying synchronize_srcu() *may* be called
inside blah blah blah.  Because (a) I don't feel like auditing all of KVM to see
if the above is true, (b) KVM's implementation may change again in the future,
and (c) taking kvm->lock inside a kvm->srcu read-side critical section is still
unsafe as we'd end up with ABBA deadlock (well, ABCCA?).

  1. SRCU held, waiting on kvm->lock
  2. kvm->lock held, waiting on vcpu->mutex
  3. vcpu->mutex held, waiting on synchronize_srcu()

