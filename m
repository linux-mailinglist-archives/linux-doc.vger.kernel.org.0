Return-Path: <linux-doc+bounces-94546-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 75SpCNkvRmpsLQsAu9opvQ
	(envelope-from <linux-doc+bounces-94546-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 11:31:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A76F5450
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 11:31:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xs4all.nl header.s=xs4all01 header.b=ZEiDPTGN;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94546-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94546-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=xs4all.nl;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC4B30EFA7F
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 09:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F151E47DD75;
	Thu,  2 Jul 2026 09:09:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4631747DD79
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 09:09:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983380; cv=none; b=ali5Wis19m4IsF8aQkYfTD658fRhlVZioiPLwl9CMmi1cigwkGMXXSZ3uDqEe675C1GCBhF0viAvIGepvIJpF271wd9kNMTUyXk4dcILqOQiPMT4ea3drnhLFOZ4Q11DeQkXDynSyJmiRBNF6kfuB/T8RKMG0qUTNMmKDeQTTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983380; c=relaxed/simple;
	bh=X4lWb4Zgyq9kDtHYjOqT/HcpzyRjjLI0DNIX1c5jUaM=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=IqImIRHxjO3yIjapvHo/BkhmjDGOfp+xFeNFSaYRktfFKljtz+irKkiY4sxsAWwo/KfwUqy8Tj40I4w6IYliAQltb76AAdyA3WyWQA0EOBKnXRAzoZfZZLCYAUDw+juvWFAuzLTkbmYR9Xjj30+GFBuogwYgmNEN/cvah6lVC6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=ZEiDPTGN; arc=none smtp.client-ip=195.121.94.185
X-KPN-MessageId: bff4b762-75f5-11f1-9e8e-005056999439
Received: from mta.kpnmail.nl (unknown [10.31.161.191])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id bff4b762-75f5-11f1-9e8e-005056999439;
	Thu, 02 Jul 2026 11:09:37 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.190])
	by mta.kpnmail.nl (Halon) with ESMTP
	id bff2e651-75f5-11f1-91b1-00505699891e;
	Thu, 02 Jul 2026 11:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=PqYWlkDcCBR62HicUulD+ZvvBxbrhHpWKTkTuPcmOVk=;
	b=ZEiDPTGNBOsEJe7MBRiZA+HoZfQoCwumR1bRMcSFV5e9HqtGX/AvhvfHYteM5cMrTBkGUKpL+yN63
	 4KuIx7VOlkYtRDupf3JnPqFpzA2x9PbhcodHS8OYX9WbobOI+rJl0ZU/Dsex1PqFnQ+sPxHn7Da9ZM
	 zstxb371hUTwEpUOUun9fryUYtOkWO5iusVSXdi1KlEbSUrKXZsiBeAqdI3L7c5WYrb3TQvreaF/5L
	 NVaR4sFh1jnQYgVbWA5xjXLOJ9yjShdLbhjGw5lBYtWjDhu+bp6JU+Yh/cVAFlA1jnRtKcaW3rZSuB
	 2P0rGauZpugbjh6TmrbjqNb7DNqbfGg==
X-KPN-MID: 33|A06hq9/OspSCblDEB2XsEAaS5PUjMJ/PvGk4O1z0S/ckLTliPawVDjQhJtQvp7M
 bC1I6m8Et6gUXIjvcKmMYL13UY3qYJ2f+ajB4taehJ64=
X-CMASSUN: 33|xV5+ZKyjGAqrRMlg92btei7Fl/lSCjGxTWwji/cF8+tpZaRdc5GIqoJHUqUCdfC
 j3Qw633Ao3CXiKU7+omMp5A==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh03 (cpxoxapps-mh03.personalcloud.so.kpn.org [10.128.135.209])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id bfe2ba4c-75f5-11f1-916a-005056995d6c;
	Thu, 02 Jul 2026 11:09:37 +0200 (CEST)
Date: Thu, 2 Jul 2026 11:09:37 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>
Message-ID: <1468431527.3731104.1782983377190@kpc.webmail.kpnmail.nl>
In-Reply-To: <a17b9a17-0ca7-4912-836d-4637cd0110f7@kernel.org>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <akYasD1ckWcH1C0g@lt-jori.localdomain>
 <a17b9a17-0ca7-4912-836d-4637cd0110f7@kernel.org>
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[xs4all.nl,reject];
	R_DKIM_ALLOW(-0.20)[xs4all.nl:s=xs4all01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[xs4all.nl];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94546-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jkoolstra@xs4all.nl,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vbabka@kernel.org,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:ljs@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkoolstra@xs4all.nl,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[xs4all.nl:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,kpc.webmail.kpnmail.nl:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 703A76F5450


> Op 02-07-2026 10:44 CEST schreef Vlastimil Babka (SUSE) <vbabka@kernel.org>:
> 
>  
> On 7/2/26 10:12, Jori Koolstra wrote:
> > Ah, I still reigniting this discussion again :)
> > 
> > What about a combination of what David and Jeff say? The whole point
> > seems to me that the salient information is not that an LLM was used (or
> > are we going to tag Sashiko as well or any other LLM-based code review
> > tool?), but what is was used to do. This information may be relevant for
> > how the review is approached. The latter should perhaps only be in the
> > cover letter and then we can drop the assisted-by tags altogether.
> > 
> > The question about enforcement remains.
> 
> It's not possible to enforce it. People can deny it if the tag is missing
> and you confront them and even though the submission has many signs of being
> obviously LLM, there is no definite proof. We've seen (likely, as there's no
> proof!) that happen in mm.
> 

Maintainers should be free to ignore what they perceive as slop without needing
to defend that call. Reputation can be gained by submitting useful work or
being present in the community, attending conferences, giving talks, etc.
I am not saying that we should be harsh on beginning contributors (or I would
have to count myself out as well), but they should be as free as possible to
only invest their time in the project and people that may become involved in the
community. And that call is up to them.

I try to review fix-up patches of first-time contributors, but if it reeks of
AI I don't bother. We have the same policy in the kernel mentorship program,
we invest time to help people get involved with the community and kernel, not
to let someone strike "kernel contributor" of their list. The whole point is
not that most of this clean-up work is super useful (and indeed an LLM can do it),
but to let someone feel excited about contributing and maybe getting them to
to stick around.

> Such situation then penalizes those who disclose so obviously they won't. We
> should drop the tag and instead think how we can empower maintainers to be
> able to use their own judgment and deprioritize dealing with what they
> perceive as LLM slop, without fearing consequences of not being properly
> responsible etc, and not rely on any non-enforceable tags for that.

