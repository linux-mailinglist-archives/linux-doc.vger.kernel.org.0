Return-Path: <linux-doc+bounces-93407-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YzwfCEENPGo1jQgAu9opvQ
	(envelope-from <linux-doc+bounces-93407-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 19:00:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7221C6C0321
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 19:00:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=GwH5XZT5;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93407-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93407-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DF9330488F5
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 16:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8861734029E;
	Wed, 24 Jun 2026 16:57:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB3340260
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 16:57:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320227; cv=none; b=rYJc/vd4GNWzslLddKYQh4uYObay3jT2M7GCprvNSNtpiZeHMRRd9zOCrES/bdPjI/hAWLvQEr/aLgetxshOFHUynqn9oBWRXUMSs70PSqHLpIUKIOrAuWNhLkes7fb8dztji+b1cAmzGVEup1Xz7EbZ0TWCidB4bK9VP2uOELs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320227; c=relaxed/simple;
	bh=sFclBlGuLlklutyWalxOxdLRxtPJWxF7xb2dfh79PCc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q9qW3TpZN3Qb4rzKoLac6BfGYu6D8Kws+14cKYD3+cHiik3av6VhtmiywmeLnkqV8ealhGcaxxn9+4MTWX5XKogNDtsbHWdub8n9rMDt/GKzc6/FxcGlU/iz4vZpEeOFPFK0aLsENS/IWd7r+WL0QGnqKVSeaeZdUzROC/viChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GwH5XZT5; arc=none smtp.client-ip=209.85.214.202
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c76be5dd09so8676645ad.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782320225; x=1782925025; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bTiRAq90VFPvdthoswICGCbbk82NFtmBH/qctXPK1uM=;
        b=GwH5XZT5Gjtb/KiCw8TnuO37Blpge4KdrQPeHuge+fZ2ETrA/7DHZDBZJhhj5T9t9T
         +m0mKXolKbM+sB2/iw5PzfNG9X3CKDq8QaZGGePsE7ehLwyy7NViZtAxz1EOO0qgD91B
         sDcE44mtf8Uhm/c6mfio2i7R7I2t77uN8d4RO/shjDMAyLXXQgp5TuL2qNZzfP9f491L
         hVwGb2vv8u4P7+b4j3S6xKNDoGiGW6Vce2462lp2Fkt9ecdJ9NlzKImTGcEdh86+Wsxt
         pkDn9q1v+NC7T5gda5AA0A7AC36NAdqEGWroymqCYDcuS/Wg2/x6jj5CxstfckPuFGkI
         g4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782320225; x=1782925025;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTiRAq90VFPvdthoswICGCbbk82NFtmBH/qctXPK1uM=;
        b=IvyNvWgg/8WPJQho7Vcmm/V3PWlvwImHynwM2jdCQQcq2aSdo/laRUdg+80cEPO0ud
         Fmcq7gAz9WbTrC64Mhcrs4c4+YdASw84KXnETcuP8hO65FuRlp7Fwj05DB5wAzMHbJQY
         yO9wa7JIFFtNIg7727BPTSmIJPxzj6skAakJFbf2FdKUpzMwQOoQYAzv1duNGp5DyH7B
         1H/aIfm10qPhM1Chj8YZ/O4Qz3ihYHef14PmYai/ZCT6VnEXxQ1vmsH0h3KgKpmuMLG2
         a8dnI47RjqkoeTl418eCUjTHoDMbfmKNBoMhMQt2QoxoTreJ5380RmpIoo4uoZfogAga
         afUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAMSRx2abL+iQo2ca35qgh2l1I5us7h1H1YD9fsa9X9XzhAYk3qrGpg8Wd1V/ZUkb0oxpB/0w63fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4k7JEqQGRmuy4qGtDhP1u2rW6aOk1BZSGUju1MSTfp4Fuu4i1
	rHYknya2KI2nz+q32A3IzgZ5yvcvBhtyD4SPUDT35PwNxJJCFxpUlyBFjBQ8dPe+1goQPZ+kwbd
	3dVClkw==
X-Received: from plpn21.prod.google.com ([2002:a17:902:9695:b0:2c6:b814:535b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fd47:b0:2c0:b081:84b1
 with SMTP id d9443c01a7336-2c7e1464d1amr26763135ad.10.1782320224855; Wed, 24
 Jun 2026 09:57:04 -0700 (PDT)
Date: Wed, 24 Jun 2026 09:57:04 -0700
In-Reply-To: <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
Message-ID: <ajwMYCSrPlxg-Fok@google.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,google.com,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93407-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@hu
 aweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7221C6C0321

On Thu, Jun 18, 2026, Ackerley Tng wrote:
> When checking if a guest_memfd folio is safe for conversion, its refcount
> is examined. A folio may be present in a per-CPU lru_add fbatch, which
> temporarily increases its refcount. 

Under what circumstances does this happen, and what alternatives are there for
userspace to work around the issue?

