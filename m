Return-Path: <linux-doc+bounces-93445-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bM7zEc53PGp4oQgAu9opvQ
	(envelope-from <linux-doc+bounces-93445-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 02:35:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2336C1FE0
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 02:35:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=b6zvtV1p;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93445-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93445-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACD9C30377A9
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 00:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BDF33F5BF;
	Thu, 25 Jun 2026 00:35:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD0534FF45
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 00:35:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782347721; cv=none; b=hSlZ53sf6iF39AOQYZCk547+porIbzemYKldgHnjrcdj7hIgxFDrikPo6XX4/c2CBBo9NnvL5nMI3ZgZUg5z89WhS/uR7ZzHhz92j2j10f7d/NojzzkQrEEt1wZeqTWZySGbx68lQaZPjt5HvQu8drYDm2PHf2TbEMUcBxVf2+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782347721; c=relaxed/simple;
	bh=f4AREVsRHfiF4PAbuxnn5TgCeRNzuQ0Pw+TvIFB8YS0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pcxMvlW7m1kPoELGVO9mN74Zr7eUC9S2yLIhTZFBMHcTMI5RXYYjWskdalylPg0dezf/rfTNVyrjuNSgg+sS6PDUtIxfjcG7SRBKXK3hcgboaFfwv/bQ+E0zLBKf8Hg9QqoO+jFuHPwVed+nCLISlyXGgsZlSWIH1YdYoAmXLTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b6zvtV1p; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c7ee3952d6so7076175ad.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 17:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782347712; x=1782952512; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XNahi9jo3ln3x9OacQs1ORbpzN2GfmnsobY71bssZU8=;
        b=b6zvtV1pd9ygwuBS/nsicc/w/JFBgXi7+DIhzhsuqmgtllGzzTQNSsvpsNcVJJ6tLS
         bFxu/8FnOpAca9IN0DQ/frCnfVsRcsF9prm2n+wSUpu0Yfr1yK3TZQUmUIGy6m1PlaOd
         WWaAz34eVsJ432ODUHxw8x3Eyna+MfWxWL4XuXvWpLIpzJeKlFUBDwiMAudYohcQmUWI
         ztwW77cPJEQx08+y0xwbrfQp94CoFpFWTvmVVALF+rkHxDF+LMwjIngQTFnLBN5LCL8Z
         5ApTmCpoms4cYEh1AkPcJbv+97Ui0/o+ZaWbsAqBb9ffZXNIyElkBqv4cm9JJVZj2JHY
         SOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782347712; x=1782952512;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNahi9jo3ln3x9OacQs1ORbpzN2GfmnsobY71bssZU8=;
        b=eXfflBtYXRkY1jb+tPY1pp5RzM0XQdTBdMyKGG17QlMdlnRz9AXP3oOADsAy4IyWZ7
         y4qj/wqPPuoj7T7doKMCl0J5bD8Gy4EZfcAWxDzHC+nA0Ph22t3G2myGuOTETUOhwslw
         fdmQyWr8PFu89OIyMwEUC38N2K6rgKgG92PppF6chKuKdXhQDhgyaGXhH3q7UhV2/ALc
         vGaXaIZG9O6eUwQNqOywKDLFtiYIUWPR3yGTnEFsmHHI6qLM6FI83sMudm+ba0kmxwLd
         e20UOz/IY4EGMjp+pkYUDf9yUe7o2dtujgi+oLcN+Ri/v0DOa2wPuXTqXa6glhScxjuT
         4XLw==
X-Forwarded-Encrypted: i=1; AHgh+RqMmN1G/MvtpLi6nXOZYVJqtdtUL3MGnVjpXyu8g4HqdN45VE5WpYm4SlpZTMvNryp1hcoarE2fAmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsqOmMwihfZmNqdLle/4qHj8oSo2OtsxMYalxYJl2EOkOj1dVh
	IXwJTXwtjcA7WF2SNurv9/B04HfoERytDBPK0xib5y/RM6HtKIhn7E9iHiFOZ2bbmQ3fCrZ8PGE
	o2u3Dww==
X-Received: from plly17.prod.google.com ([2002:a17:902:7c91:b0:2c6:bce1:2477])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce81:b0:2c0:cf44:3b3d
 with SMTP id d9443c01a7336-2c7fc7579b0mr4179365ad.26.1782347710976; Wed, 24
 Jun 2026 17:35:10 -0700 (PDT)
Date: Wed, 24 Jun 2026 17:35:10 -0700
In-Reply-To: <CAEvNRgE8HZDOnexMJeim6TjmxGG1AUXFY2+HH1YyKB=aM6D-DQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
 <ajwMYCSrPlxg-Fok@google.com> <CAEvNRgE8HZDOnexMJeim6TjmxGG1AUXFY2+HH1YyKB=aM6D-DQ@mail.gmail.com>
Message-ID: <ajx3vmNPRf-M9kR6@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,google.com,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93445-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@hu
 aweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA2336C1FE0

On Wed, Jun 24, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Thu, Jun 18, 2026, Ackerley Tng wrote:
> >> When checking if a guest_memfd folio is safe for conversion, its refcount
> >> is examined. A folio may be present in a per-CPU lru_add fbatch, which
> >> temporarily increases its refcount.
> >
> > Under what circumstances does this happen,
> 
> It happened 100% of the time in selftests. Perhaps it's because in the
> selftests the pages are almost always freshly allocated and so the
> lru_add fbatch isn't full yet? (and that the host isn't super busy so
> lru_add fbatch doesn't get drained yet).

I chatted with Ackerley about this.  What I wanted to understand is why guest_memfd
pages were getting put onto per-CPU batches for lru_add(), given that guest_memfd
pages are unevictable.  The answer (assuming I read the code right), is that
lruvec_add_folio() updates stats and other per-lru metadata for the unevictable
lru, and does so under a per-lru lock.  I.e. we don't want to skip that stuff
entirely.

One thought I had, to avoid the IPIs that draining all per-CPU caches requires,
was to disallow putting guest_memfd pages in folio batches, e.g. by hacking
something into folio_may_be_lru_cached().  But due to taking a per-lru lock,
that would penalize the relatively hot path and definitely common operation of
faulting in guest memory.  On the other hand, memory conversion is already a
relatively slow operation and is relatively uncommon compared to page faults,
(and likely very uncommon for real world setups).  I.e. having to drain all
caches if conversion isn't safe penalizes a relatively slow, relatively uncommon
path.

If we're concerned about noisy neighbor problems, or outright abuse, I think a
simple (per process?) ratelimit would suffice.  But it's not clear to me that we
even need that, because there are already many flows in the kernel that allow
blasting IPIs without too much effort.

