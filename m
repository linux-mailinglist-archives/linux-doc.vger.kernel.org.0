Return-Path: <linux-doc+bounces-93620-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MjCpHWJ1PWqJ3QgAu9opvQ
	(envelope-from <linux-doc+bounces-93620-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:37:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 101D46C83DB
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:37:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=X8aWhkmN;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93620-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93620-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7255E3026FE9
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 18:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47418329E7E;
	Thu, 25 Jun 2026 18:37:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A09931F99D
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:37:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412640; cv=none; b=DCCHFvF5fJkV+hOQfcfIo46xK1mMJO6fFJxgPieifmtJdhZaR7nLWsJek9Wqb8bInrd5KzPwoeMNFSdWVgE5SNir2dpNHjqTcV8EQCZT7rQVguRxprjZlHnwCzptMA1DvFy4V0ur2zE7tQ5ealBIx8/M//x8J/zGMsvcLW3Rlnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412640; c=relaxed/simple;
	bh=XGF2VYl68rxHrrb3+celOOH/NDrS3MYyMHWdfsQBzvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TLjiWuzRyWqTrTgQNIkMo6jaO10aMV2SE8Ct0NQMU9ozR8q6TbYmrqS+VjxXplk0IJBqJgVvkAFUAiuC8H3OoewOtkmrUIOqaN2IZBXdxnAMS/t9G3aWiU3No3j02PJV1phy02BEA2mwwMsi/paPCjKrqcisnfqy9R9XFz3+al8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X8aWhkmN; arc=none smtp.client-ip=209.85.215.202
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c856470fe9fso97716a12.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782412638; x=1783017438; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1CLBFjHRtepPsR7OTGTpvVtcvQrDt/pUW+o4gNlp90=;
        b=X8aWhkmNeHj5B+S2ARCMB1eYjl8r4K4etZG/HFXM6FdnlaRlqdY4o98YfqE28CTDcR
         h/5o4uydtcCJZiCzbK9sKcrbpGEB+T9aiDdWY3gbAEdzDlZbZa/q2KSuRVZ+rLox9d3p
         G4TtUWznQjge07RTSOIla9Pcp/rxD06QJ6XKnXaUvB6LS0sDQD0KiwbF/nSfSJ/UctIs
         eiYqmaiFp2MeO9M8BJQa/JwucCl/DUMXIcHS7haA2iKr7vI3h4lbwnYwrAqjdla0TWWq
         ju4VtRWlsKfyNNN3B70xbms6qUr002QyNhVZPOSpZvIhg13Wsch+aShIcJyNNQcyyMMd
         Ol+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412638; x=1783017438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1CLBFjHRtepPsR7OTGTpvVtcvQrDt/pUW+o4gNlp90=;
        b=OApHxu5ZD4FM7va44TOCuK5H5sH8XaY8n5t/UqH8aLc64ucMVhHteOrWuQYnfWrdr2
         GAiR9D2Vq+SDIJOPGcXKRo8v4kapFwQpCCE+Rj2z3x2b/JXxzHfMoXFQB3SZxDkZ+abG
         0qOJU239F3UBq3XKoz2+yHSgCHCeN/S4SupB2hCa/ap0vKBbldve+LinTWyVBpi1mLK1
         zhnFgnU4B4O9juoOLQoZgutILqBD0caJTtOAfNgx/wWdk5vXVdQ4VTj/jL8UqUf1LxmT
         xGTvcLY8xot1gXqXJCEBRUuFdoD7Klvx+bNwTSDH6aHShnbn+TL6BunAUDzWTF8e7yyD
         Ciow==
X-Forwarded-Encrypted: i=1; AFNElJ9cCqC9NqIMSKKKUCT4vIWtkRpo6gMt6LGfq3yg311hHPHEfjJF6PLr5fcpuEepr1UmLb6nSZA6R5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwDpkXQXkLr6gg7bQvV6Btjs3ULou13KZMM2W/6Y9OkyZD99u3
	PBV70z2yFQNsioYIj4eMzwaHYMAO6XU767ZHkLD8LTOR9Y4oXdXPpnB7SiY4iXdfykLrnEH8fy7
	E0gInKA==
X-Received: from pgab3.prod.google.com ([2002:a63:3403:0:b0:c89:356d:606a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6b04:b0:3b4:8aad:6337
 with SMTP id adf61e73a8af0-3bd4ac80c24mr4406701637.15.1782412638064; Thu, 25
 Jun 2026 11:37:18 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:37:17 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com>
Message-ID: <aj11XdftC_WAf6Av@google.com>
Subject: Re: [PATCH RFC 00/12] Document synchronization used in managing guest faults
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-93620-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 101D46C83DB

On Wed, May 27, 2026, Ackerley Tng wrote:
> Ackerley Tng (12):
>       Documentation: KVM: Elaborate comment on kvm_usage_lock
>       Documentation: KVM: Consolidate notes about cpu_read_lock() and kvm_lock
>       Documentation: KVM: Consolidate notes about kvm->slots_lock and irq_lock
>       Documentation: KVM: Turn - into bullet point
>       Documentation: KVM: Explain what rule the exception section is meant for
>       Documentation: KVM: Have actual headings for exceptions
>       Documentation: KVM: Drop mention of kvm->lock in SRCU documentation
>       Documentation: KVM: Add example for kvm->srcu in relation to mutex/lock
>       Documentation: KVM: Document synchronization for managing guest faults
>       KVM: guest_memfd: Clarify comment about gmem.file vs kvm->srcu
>       KVM: mmu: Point users of host_pfn_mapping_level() to docs
>       Documentation: KVM: Focus acquisition order section on preventing deadlocks

Please split these up into standalone patches or small series of patches that are
logically related at a finer granularity.  "Here's a pile of KVM documentation
updates" is not a reasonable level of granularity.

