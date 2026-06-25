Return-Path: <linux-doc+bounces-93611-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YFQ8MV5xPWrL3AgAu9opvQ
	(envelope-from <linux-doc+bounces-93611-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:20:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 382696C8271
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:20:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=XyOGoMEX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93611-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93611-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B5D5305EA5A
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 18:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833872F5321;
	Thu, 25 Jun 2026 18:20:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C842F8E94
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:20:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411603; cv=none; b=lHi9gVouGKpqPykcxdnEr9M+h6oIGeP5Gh6aSccgJtiAmCrTTHTRSYcLld69dnnNdENb4ckr1dYhvar5UGkxOLVVsgxpggevL+GZdEdYKZgnzp6/eCGFte8A+5/554n9eEh8Wdlmp8pbqYcO7x9zzJWuolrYczNPdYfZx7A+G4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411603; c=relaxed/simple;
	bh=XxndvljOt9uUmD9D72rN/iNmVCcGubaSjNNlVCf2UNQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CY2XYzYuvIuofYGZHG0kstHeBylq9EqGTVk+E53wYSZRYYIaiZZUvtcCXI8pwxQf65s8HG1/ggf6hStzbXP39UMDUNMMhwM49V2tera5zGVwpVre/KcxQu47kCAAWhQSiWd/CyaaNcVNliIYXb8GzCO9QBluzZHUmnhFbEcE5fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XyOGoMEX; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c7ef28ce24so1323835ad.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411601; x=1783016401; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymb11MHWr84mbZGvyE15DfTishs1pDuYphEFb//5g8g=;
        b=XyOGoMEXSDZcc/y/BjnEs5FkWrnabnpyiDN1aJVPr74MPt07irywkjIm8CH3iwSbrK
         r8XtwefSbJVNn8ulvHVzooTVVPC9BfizHEZWloqy+zUfKbrPQadVHXH8qxXJoCTYDvBE
         0rC2ixuaiiPSVmqWmJDVo/ldGaf8u6ihM4n/0Z/G0TTDgxBEUwvEwbjnIi7rN5tZ8dT9
         nx6INJkSAJApPMPXzb3kNy2iTkbT+vNkTxZJKbUHiBABfrSWA3KmuMY6WHGRNz2PLPOW
         mB3Y+1kCRMdxb903dcFPyi7NLJXk8mvpMLJuMfWlIIFS7PrcuZHgo1Iy9BBKA/BWYw/N
         Rp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411601; x=1783016401;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymb11MHWr84mbZGvyE15DfTishs1pDuYphEFb//5g8g=;
        b=Dd2chZ/P2Ggo7V546lYDetuayGKvLZjYCAYC18HgiiEhZIyAaOLnz1RORHncFytap/
         LyDFNGNMg3LeL4g1EJGQ0K2mT3xGkSnhgKs/wc7u5+BoSE5PoGJVWerU/7YCXjw+j8fS
         JMKmr7aWnbFVAYjTtfhk5expUqHASMrD6gW3R2IhC/9ZSihA5qDOaW3HdZnuSLiZq/s0
         VDjfTRChS/qHoyFT0Am+FD0cXz+BTS9XA97DfcoPlZBX14yP6fsOrFg49/rhVSIf6o68
         5okl9OfJkh/kd3ZZC9k8EYuAv0kqnwak6GmKBz1h7m1GpzD6ULU7MdPLSRyW9zTt5G/C
         xt3A==
X-Forwarded-Encrypted: i=1; AHgh+RokGmSoAqiQEQAwFjOHQueWGelbQGqkHp9Me6oNRsRPDSP64VlRZklyHD6vfnaGgm8rsvuJbHm4tZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLZFyNC3qRKLVXwizj6t1m3D97aMXcfC8fYaxRyhmQlcGF9go/
	Z55MaSJAyyQEPBXJuIfUu91XXlkWUoEohAaHqV70A8P3ZHXOvlPjEg3falJLgT2l9SSRFYo5li3
	jQtoYNQ==
X-Received: from plmt4.prod.google.com ([2002:a17:903:3d44:b0:2c7:ed23:f48b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d482:b0:2c6:8d95:fd6d
 with SMTP id d9443c01a7336-2c7fc74bd33mr35612465ad.21.1782411600543; Thu, 25
 Jun 2026 11:20:00 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:19:59 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-10-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-10-4fe8b602ff47@google.com>
Message-ID: <aj1xT7XkSpkqNFAI@google.com>
Subject: Re: [PATCH RFC 10/12] KVM: guest_memfd: Clarify comment about
 gmem.file vs kvm->srcu
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-93611-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 382696C8271

On Wed, May 27, 2026, Ackerley Tng wrote:
> Clarify the existing comment about synchronize_srcu() and
> kvm_gmem_get_pfn() to provide further context. Explain which
> synchronize_srcu() prevents races with how kvm_gmem_get_pfn() is used.
> 
> Also point reader to documentation for better understanding.
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  virt/kvm/guest_memfd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 69c9d6d546b28..f2218db0af980 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -711,8 +711,13 @@ static void __kvm_gmem_unbind(struct kvm_memory_slot *slot, struct gmem_file *f)
>  	xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
>  
>  	/*
> -	 * synchronize_srcu(&kvm->srcu) ensured that kvm_gmem_get_pfn()
> -	 * cannot see this memslot.
> +	 * This is called when memslots are updated, after the old
> +	 * memslot container is no longer in
> +	 * use. synchronize_srcu(&kvm->srcu) was called there, so
> +	 * kvm_gmem_get_pfn() from KVM's guest fault handling cannot
> +	 * see this memslot. See Documentation/virt/kvm/locking.rst
> +	 * for more information about kvm->srcu and the memslots
> +	 * container.

If we want to add to this comment, I would much rather do so as part of an update
to kvm_gmem_release()'s comment as well.

https://lore.kernel.org/all/20251113232229.1698886-1-seanjc@google.com

