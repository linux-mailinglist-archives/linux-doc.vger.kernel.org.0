Return-Path: <linux-doc+bounces-90570-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dsDUHNFcH2phlAAAu9opvQ
	(envelope-from <linux-doc+bounces-90570-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 00:44:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE8463287B
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 00:44:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=OLdpuuzZ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90570-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90570-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFF4830053E4
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 22:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399273A9626;
	Tue,  2 Jun 2026 22:41:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE353ADBAF
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 22:41:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440084; cv=pass; b=If+U6QHBSPcH8Ho6cyNdh+YPI3Yb0pulI7mNLBzxJiSGUXi+m9rWQwnq4cRpAmAnEMHG27iRdwNFTSF1M1cXU+AMJtsRwNamzOKUbsTo3gkIXmH4EnpRj0dvw2mgPArzm0/hv4wLpHmj8XMcGjBcqvUERelYV+1Xs7+bwfoT//Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440084; c=relaxed/simple;
	bh=JN5w0VLC4CArOs/YqYBchGdpeM2L7REgIk+BeZ3c7Nc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFPAGPk+1ZeKQ5ukR3IDvp2wSynPw1YmpMO5+2ZbZwbtQYin5iKltPC32nc+AuVe+6TmS6tQ2BUJsPWf8sAmLLl/Bg2YrZseFrTtQLsx+3moU9QqYiILNkAKWezlEodGz2a4OfncIIKgcvLUaNyG6xq+MQiUtiSOXlrIqoZ8Ubc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OLdpuuzZ; arc=pass smtp.client-ip=74.125.82.52
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137dd523634so4883209c88.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 15:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780440082; cv=none;
        d=google.com; s=arc-20240605;
        b=WNOmSsN/s8yTfCBQCZJUPaFd1HzeaQO3PzUVs0MIMQ6FtpTYpSQ22LVjHYQj1HKUj5
         FqXS1dLQGfXGVhAYJEafyuhcA769mCmvms2TniBqBNCP1dLlRamm2caTu0i4KsB6Xpsq
         2VZLLYquGM6DXS1wgPQrgqk5IVKOIVW9OMQ1KpolB5ACp4npZPKNo7OjKcYFAkjkEIhD
         uYMH+7+l6O9TqcY7MUAPDdsJv2d+UTKMu8HB3I4KyJ3OG48VL/68t/rqdJcKAGcIGlcX
         bVXtcfXiC258FO87QtVhZQdGVrqR5h+KlP2tcrznfWL4EjUE49HUrXIvTKmp1jJSrGWP
         H88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=9Zpj3jj8aTNr4p/iPSCl+ydGEAQL1021/sdQMyQbGis=;
        fh=6t0f96F0C99xxg4yQyruHlOgAX9++bJ0yrnosq6jHpk=;
        b=FHs5zcxScT9irHFi2QUbZdPDXV8uCBmPkVLx1MjEGbmgpuKF6nrC+HrsyJI3xxPn/O
         DA7WP4cuE7ilPvmz0Nf+K3g+sPWz/0Xx9HtSSzmF2rVODMA2stj0pmyCsp8UBNv/M6T0
         r2IwTRvZ5UEBpO/n8ffd+7J5LfD7t2Y3yGJ292BYtTnVU4gXhzNgPcgcvtzVyVJpFJ3u
         buvEvcKgBPTWED00mE5qQyXEVnxiLP0S6kPSQlO6BTgotgk5kf476vzjrU3DTk2oNgNv
         G8uowqHwgf3xqQdJuR9oKW9FhneHvWMrcVY7YVvI955hCGEY5ABQDEsInhXWYmHdc1uO
         Lg9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780440082; x=1781044882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Zpj3jj8aTNr4p/iPSCl+ydGEAQL1021/sdQMyQbGis=;
        b=OLdpuuzZDB47YplpmtAP4MJX6E8SIykbgJ59+5rm698PCRhUth1naGUs65Lu/IeH4N
         ktaZJLkhg0AECim8CAiss+raZ1tL3+xj5x8J4vTFCWyH52UwhtKMpUP3YFLnzflInGxe
         gBlAw0xf3m0ndFGggP8kAVwB7KfALltPNU6hF3FzGQf7wJmpllivrfKTMNoruZDSXoZS
         339scviSYJyk3gU8ZYDJICqQKcYeYM7F5gqrNqVreAcke/GozMlRPW+ugYZJd3OMUm6l
         QQC9Z8QHO2nEEXfI6mQFaJR6s1lg852u4+rNjjci7JsAhk0fCfrr46LzOkPwmjaJ9JgS
         VlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440082; x=1781044882;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Zpj3jj8aTNr4p/iPSCl+ydGEAQL1021/sdQMyQbGis=;
        b=r8gdeshEXhX9KqMmgzo7jWRNwuiVViysZLqJil5GbdW8tFykrHTCj0pHbs7Fi4Q/PU
         GeRuSZRo/4UENSgKMkRX+XxttPvE17g236ghLzkzVHpWFkbijrXD/w30myj8d+et02vz
         W3Br8CvkRicwv3eKXF9ZfA3Swa6KfwHne2CNlxDwj/hjy7f1oYiMh1vC4PSUZbXaDapE
         ji0VYwwDwSgMABdrqjFJenzYLEhCrEloMeLYizeOmkvRNn9+fqa66Fjljw7ed8S+vp9i
         iv7Qxuu4AfCJ25zZm2elzqqUSlB78D00rtLLdI2GOu9FfX3KOxzWDXHEdYVUi049lHJg
         oQGw==
X-Forwarded-Encrypted: i=1; AFNElJ/pPfIe9jyri/g7Er7eErb388mFtl8QP8UGRqZZhKpVa4KpanjDyxoq/fYU2/1e/J4CLUJEdWo8iqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhCDWQc36eCOJurgQaR6rvWVfeNCwWkJI+2w+MHPcElqIm5Zn
	eYxIcExTphROnjY1V6bW1Sncpt1wuOAO8bNxRo2OavI6BrY8rNKvahblo4nAQJW0IXCZAN1o9t1
	wmt1drtKltdVbWeqhUfW5aORabR9/Lem6H93/g2cY
X-Gm-Gg: Acq92OGRgmfplPiI1r6CBpMWapes9EVnUbON9a5hwmrd3QgZYzcPNP6/8v3b+B7mpbC
	yeRHvzmbboiF4Jk32HIYZjeObnTOczSwW0+Jz4tioodI+9aF1BCjpyPaoR930eJ5G98/PtQRJ7w
	ru8kHu62/unLqYjBIwMUKJIinEcExAUgVGXLFmypxJk+TNcax3r0FSj77i0B8hG7J00Zpn6MJrK
	wWGwOkDtarPzFABVzMWgf6mVhGYyHrf575L9zAkNPcZN34jLHj4N6ed2GwPfHoB6K45x1lsucpc
	dyvOLVBFoz6oOzaG8WjTTfYSVE06EXx0h4oNdDsUG4oknsEHLiVDebIdduJvLBLer58R3fINcdQ
	J645c+osPMRMktP4=
X-Received: by 2002:a05:7022:6ba8:b0:135:5d4b:2096 with SMTP id
 a92af1059eb24-137f6bd71e0mr275458c88.36.1780440081068; Tue, 02 Jun 2026
 15:41:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 15:41:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 15:41:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <144bbb9f-39a2-4c90-8903-51521e022da0@arm.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com>
 <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com> <144bbb9f-39a2-4c90-8903-51521e022da0@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 2 Jun 2026 15:41:20 -0700
X-Gm-Features: AVHnY4Il1A6xpCFYh9Ccj4ryfsVj2nvlEe4xvqbfHFojqcjHjss1rOCXb44vh2I
Message-ID: <CAEvNRgE1dCVAxJWd_hyFa8N=m9JLfn97ip9tAmvHxspWJ50oGg@mail.gmail.com>
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
To: Suzuki K Poulose <suzuki.poulose@arm.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90570-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:ira.weiny@intel.com,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.c
 om,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ackerleytng@google.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,google.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ackerleytng@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEE8463287B

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
>>> @@ -914,7 +916,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct
>>> kvm_memory_slot *slot,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 folio_mark_uptod=
ate(folio);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio)=
;
>>> +=C2=A0=C2=A0=C2=A0 if (kvm_gmem_is_private_mem(inode, index))
>>
>> Don't we need to make sure the entire folio is private ? Not just the
>> page at the index ?
>>  =C2=A0=C2=A0=C2=A0=C2=A0if (kvm_gmem_range_is_private(, index, folio_nr=
_pages(folio)) ?

I was thinking to fix this when I do huge pages, for now guest_memfd is
always just PAGE_SIZE, so just looking up index is fine.

Is that okay?

>
> Or rather, we should go through the individual pages and apply the
> prepare for ones that are private ?
>
> Suzuki
>

IIRC the plan was to make kvm_gmem_prepare_folio() idempotent, as in, if
a page is already private, just skip. Currently sev_gmem_prepare() does
a pr_debug(), which I guess is technically still idempotent.

I'm thinking that the information tha needs tracking to make
.gmem_prepare() idempotent should be tracked by arch code.

Does this work for ARM CCA?

>>
>> [...snip...]
>>

