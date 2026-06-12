Return-Path: <linux-doc+bounces-92207-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EYokLKh5LGpjRQQAu9opvQ
	(envelope-from <linux-doc+bounces-92207-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 23:27:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9D367C865
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 23:27:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="ovUtcy/H";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92207-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92207-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2408310E2BE
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4CF38D3F6;
	Fri, 12 Jun 2026 21:26:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A623E377567
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 21:26:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781299610; cv=none; b=ccSMpJzsVmwm819daAhhfiz3QQokxQwZ0uUlubX8meUBsOi6inQyj+buKLZUZQixbm33j+Qp4zozfrzEwnmi2WhqD4b5d7pnzH19pITdqEHl8lgsU9E8kxue7F7wEfbXukOjJkc63bEGf76OO5qgZkAEVO/knE2ENc34iZVQX/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781299610; c=relaxed/simple;
	bh=vQRs/qjGkOUg+kGpHxYMeuOyoLjb6dULYqqS+cIUfWw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KH4Y5fYTOEPUKdqf5Jk5iCi7BbYPddywkWf8+DPYU4VjIz9jizw+Fir+d9y4HN4p+FGmlxlU3AB9V2ijKgHelckNmbZP46EZuITzzGWvdWfnCz0UCh3AFmf0oCJACU4Ay9DnelejG7qJVb7d8FUka1zO3imam123EZ/moHQSVGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ovUtcy/H; arc=none smtp.client-ip=209.85.128.172
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7e053987001so28367947b3.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 14:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781299609; x=1781904409; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QoqQNxNPBqMismqzNgaeaEvZMlSF3o7CK1/OdEQIGC0=;
        b=ovUtcy/HEKEPeWMBQwJpucSBLLBXqg3n9RuyvSoNzvLV1UtoMGi81aHVSu9D2uDZ1m
         Wagzj6LtRPCCAJiGQWh1RkaqsP9f15FS+TS5habJh9p4czgPvkEB4REfjzezFZuqxasO
         CHqzEbmPpsP5F2kvi7dG5PTgkqAkA8WKDXT9UkPCJW88nhGJirh0EiCtoMknK9eouYe4
         JKXT1j56VBHuIKPpMZ3XVN6727Ts5NnPqsi8QkLVyip0aaSL+XKSSArvKcoqKkAv18nA
         XbJdPjui8EKvuUOIRWebq4lXL/bHLbI/EqA9RsvFD0O+78/mpLQsy2uF8SXpqTVC/YN6
         0/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781299609; x=1781904409;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoqQNxNPBqMismqzNgaeaEvZMlSF3o7CK1/OdEQIGC0=;
        b=VEwY6OSYXIBjqZ4Oq/uLwWL561gwXk36U+Cxy6wR2HcGyNpRK1X5GppxPfVeuCWNwM
         3Qwrtjd4W57GkQHZ3oCvnlv6Ij0fPCIG9kHJvBHGLPSYiUzsYGl6IVl2oYsQoy4nlZdu
         Fn9T7CzdS0q6NRfZaDHSPoYUuiFjVQX/N9itjuYCaR3OHuisXd+ltFoG2YH4yikvggXw
         azAaHes8tmGCQQYE/mG+05qzzI3Zmi7co/DY03DI/3gywEw7q5IzvFYltj2VJNouq6qf
         AgglPGewIEXk/QDy5HRHwHqiN38pSvptL7EtcdUYpRvMJV9cRMDRan7YiCuXYAKnHJV4
         t17w==
X-Forwarded-Encrypted: i=1; AFNElJ+yOsN18mpy2a9j6hyPo9mOBgBnBiYd4mcSY2QPTjCWEM/HF1ea+Gra6o+i8x9Lx3Q7jZL0DZ69OI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0zdPdLFXCI94Kfj1juittMehzOFPGLXUrjaQiNitFy5Ch7PBx
	ppCNvdeOgSzvkM0vTYas2QAipkNlwN3C82/qIfEUtqwU0UBYusqokM9XcI90+WOLUA==
X-Gm-Gg: Acq92OH0dEN/R1OxY+SPPYJ9W1h0/XJRvHpyMxLqLGK9xIurpZfrkvYzW+ZzJ//gDb7
	YnL98i4Tvl43394ch2AqPPj3JLZyhZu9CTqcTmbDACzC0F9P9og2/knIx3mjxzseejxA2AmCgB0
	034rDvkxc6nECsH8hP2xSD6VzSjJ3izXSBvVxhQ+qztYR7/dOEG5gsGJH8PQBsvvEE4RgPHkVAr
	BAccIkqPLCOiiXuo75UMNHE+tB/tgiz8jrg8SFoyeMz8QgjrLnde+/N8dbhfhFJ6+eGxRScQQUS
	5KMALsCbOMsSbGFpomHtsLA7sRdqJeRXPkrzdmKcv+J7wueQAxdBLwoSQ+rxasBZGg7j/dADDZy
	7Y+sSe4gGwYe5Ln030KcsVd91NNVhs6eTDoGUJdnnQP+l81HT/R7FJ2r6JOE73ozlMvZaQBisCp
	Zofod0mENVxfOMayV361aFC/WTK9CB3I96OaVxil+7UbO5Bw4NWSM5ARhIYqCfPnGeyUI0MDxuU
	x5eoRAM2g==
X-Received: by 2002:a05:690c:3a0:b0:7db:d527:b8c5 with SMTP id 00721157ae682-7f797da207amr45590297b3.16.1781299608152;
        Fri, 12 Jun 2026 14:26:48 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7f76e8991dcsm15341147b3.17.2026.06.12.14.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 14:26:47 -0700 (PDT)
Date: Fri, 12 Jun 2026 14:26:34 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
    Sergey Senozhatsky <senozhatsky@chromium.org>, 
    Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
    Jonathan Corbet <corbet@lwn.net>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
In-Reply-To: <fc57bb9a-4564-489e-8da4-65068b5283ae@kernel.org>
Message-ID: <4a416383-62f5-1716-8e04-a2ee1f89a864@google.com>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com> <20260610043545.3725735-4-anshuman.khandual@arm.com> <fc57bb9a-4564-489e-8da4-65068b5283ae@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92207-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:anshuman.khandual@arm.com,m:linux-mm@kvack.org,m:andriy.shevchenko@linux.intel.com,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ljs@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hughd@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hughd@google.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F9D367C865

On Fri, 12 Jun 2026, David Hildenbrand (Arm) wrote:
...
> 
> After some off-list discussion, I wonder if we can make our life easier.
> 
> I think, even with your patch, there is still the case:
> 
> pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
> 	 pgtable_level_to_str(level), entry);
> 
> Where we cast all entries to an "unsigned long" in the callers. We'd have to rework all
> that for 128bit entries either way (passing them in some struct instead).
> 
> I really just extended what we used to do here in print_bad_pte() before commit ec63a44011d.
> 
> Maybe we should just drop the "print the involved page table entries" thing?
> 
> I mean, we do have the actual page, and we do have the address in the address space, which
> we all print.
> 
> Not sure if the actual page table entries are that relevant?

The page table entry is BUGgily Bad: we want to see what it looks like
(sometimes, a sequence of bad page map entries may even show up as ASCII).

Hugh

