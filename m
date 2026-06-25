Return-Path: <linux-doc+bounces-93616-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hUw8C71yPWoX3QgAu9opvQ
	(envelope-from <linux-doc+bounces-93616-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:26:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 929886C82FE
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:26:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=H7W5XyJq;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93616-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93616-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02F4D3004C34
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 18:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C18313534;
	Thu, 25 Jun 2026 18:25:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4B130F7EB
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:25:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411950; cv=none; b=QGASlTNFZ8rfSWKfvZIwe9ozdHCwqU7MiSFZKHvTBik+d72gNPNxE1WsVbgyfaLoKcqD7V8GU243Lvpeq0a1MDfYiOOsOoolaP1y4JPwxv+GTAL0sS0lPb6xpWhYyJqeLI4TnvQk3H5eIF6sI5dEBT2qA3U4RrC5C+HQZ6aw6jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411950; c=relaxed/simple;
	bh=cJD1d8SS4YkFBeIsSThL0NMVfHMqUFfkKfh1Wvpcjiw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BSpNs7CwV7wHF3vxwicyr++H4kUUvFzefz8otnlMOm0mFriV4IlWWZR7aerpHpRSrd+XhmZ2NazYyF31Za9bB+2+dTXUMFZPfzo7ArEBPXC0xG1P/pO5ER1svEeZWWJxcvX74ntfYyE7UPzuv/GVjphg1HD239Zubjly/cjbipM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H7W5XyJq; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c6afd85980so1461295ad.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411948; x=1783016748; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJD1d8SS4YkFBeIsSThL0NMVfHMqUFfkKfh1Wvpcjiw=;
        b=H7W5XyJqLVSIX7ZcKm5hXyxMpX49GCZ0qKDOyicbDlTnY/rNBEmbMcOie2AnTOqYXh
         45wLbpOnzvZKGzD14Y6kS5FziaYULg0kOoRQdJKnZVlqd9z/zGfOdK91RiLt/UYpHgVt
         rLMiGmqE0e/4XOb7jhk8HNNlwyBJt9CbzHJJHMgFXnYSDDLb0fmkvXAATL17aN+GLTA6
         3ZLFk+XebhHLHVUminbxovZIKE0vMyY/S7rLjX55bTgDuX2JHntOoqYqDuAqA3R3Pbru
         Q352RidDY+hMJDD+g1r5YmgaCzlkLiTKfkBe4nebXeBdvXJxFmx8epi1TpkmWewA2fyq
         eO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411948; x=1783016748;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJD1d8SS4YkFBeIsSThL0NMVfHMqUFfkKfh1Wvpcjiw=;
        b=VNRfp+dwRPDu9LrWRrFZsXoQe91hoi26nFQAVsZ+6rOUHVk8DAKolUbqAomY0bYyvT
         izCsTBqjP7LpInoJ2ICorajr4cvGe9KeTD+DWiMzBgbFKBf7JacTXGqiVR04N8SlctC9
         lQ0eV337wDpFHLjcPlDbU9PxxTX5dERmYdHHvyW8zRBvUFLWhT30lvXkUCAze8m1NOVE
         y3X39OBVatOyCLlJGwVFimYTfZCrcdX4me4i6o/Knc8tieq5C/Fl/PBrzmyIDQb4x604
         7YkrlrqfBgNuOb+Mp1L68TzMF+1auULjeje7TYi0h6lu15CQvT6pX6TR4zsDECCwRzoj
         V4cw==
X-Forwarded-Encrypted: i=1; AFNElJ9RLJdg+sLMJO4YCLMy3eXUKSkSIpQTpcSj/meICGZ44/UWfpV+/2md7yl3qPkA8EPZNxplkkcAtbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLxzQGitpKGhmHXxCKMyze0fubsujmZdQ0IpLuWG+FbNMkqv/
	tHFyo/WyOgq+L+0iA48gr1ckNzwP2oQBFP80DcXxXI0xj+GItuBFVabXnaW7nDoCwDhek+rxCrY
	eRLQLIA==
X-Received: from pgbfe1.prod.google.com ([2002:a05:6a02:2881:b0:c92:f433:5ab0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:220c:b0:3b4:6cae:4a51
 with SMTP id adf61e73a8af0-3bd4ac5e2f8mr4530424637.11.1782411948176; Thu, 25
 Jun 2026 11:25:48 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:25:47 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-12-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-12-4fe8b602ff47@google.com>
Message-ID: <aj1yq6DFK-5WI9ey@google.com>
Subject: Re: [PATCH RFC 12/12] Documentation: KVM: Focus acquisition order
 section on preventing deadlocks
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
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:zhaotianrui@loongson.cn,m:maobibo@loongson.cn,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:tabba@google.com,m:vannapurve@google.com,m:x86@kernel.org,m:hpa@zytor.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-93616-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 929886C82FE

On Wed, May 27, 2026, Ackerley Tng wrote:
> Now that the first sentence is already described in more detail in the new
> section on synchronization while managing guest faults, drop the first
> sentence.

Nope, nothing in that sections says anything about the role of
mn_active_invalidate_count.

