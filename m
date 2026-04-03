Return-Path: <linux-doc+bounces-82400-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOLvN/Luz2mt1wYAu9opvQ
	(envelope-from <linux-doc+bounces-82400-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 18:46:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D739690D
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 18:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0AED3017019
	for <lists+linux-doc@lfdr.de>; Fri,  3 Apr 2026 16:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199283803DA;
	Fri,  3 Apr 2026 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="nyzHgPEf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC003B7A8;
	Fri,  3 Apr 2026 16:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234397; cv=none; b=LN/NgFFZm8VXDffv6uI8cYi5uQ4rA8yZIN085zM0xjQPXOjOpzlwChDfz9bedyLOWtIQBIapckASME/lXcIdJPU00JgfNM3PhmDdtaCNR5IHmy75A++v1MzV0GyzBVniq/bMgAD63b+KZadlfF4cWB+mYnSUb7Npwo0otPZN4gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234397; c=relaxed/simple;
	bh=09XO0caz1roHKrmwuKQTJlrqe3tlVKWKo0osQqfjP4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2DgynMnOhiaGP/KoRbEWeI81MQpYN6QuvSsWqaLZ6uW0SdOx0HyX8SEuDX+CuS4IeunCqOnfFdyEZc6BI3UI20n3dGB3bwBPmnszkAYmRIKNwhtoucsre4jm8PeDsgaKhPSmgg/DRubAT9yB8J72DqFF9XUSY8ABt4PLCXVcnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=nyzHgPEf; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775234391; bh=WXG/DwMgawvohdqdJv/bbExmHKwcGXCCBB+v5ddWPJg=;
	h=From:Message-ID:From;
	b=nyzHgPEfqDU/48S1a92gvVBEvbvR+UwAWDKopgSw+g+rD4Vqc8+tEa278t+LqPqPw
	 Zqz0TPCIHFSJiIExaPw/T1HYDQH10ysTIaP6raSm5dtr1R71RXBLX5tNKrCpzTwsjY
	 weM8uT3sZv6QfgNnasvXqPDlL+TjHw8MO9dF38Zg=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id E5249C0AC8;
	Fri, 03 Apr 2026 18:39:51 +0200 (CEST)
Date: Fri, 3 Apr 2026 18:39:51 +0200
From: Willy Tarreau <w@1wt.eu>
To: Kees Cook <kees@kernel.org>
Cc: greg@kroah.com, edumazet@google.com, rdunlap@infradead.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Documentation: explain how to find maintainers
 addresses for security reports
Message-ID: <ac_tV-M2exA2L8NH@1wt.eu>
References: <20260403062018.31080-1-w@1wt.eu>
 <20260403062018.31080-3-w@1wt.eu>
 <202604030845.9DBD539AB@keescook>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604030845.9DBD539AB@keescook>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82400-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[1wt.eu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B4D739690D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 08:48:56AM -0700, Kees Cook wrote:
> On Fri, Apr 03, 2026 at 08:20:17AM +0200, Willy Tarreau wrote:
> > [...]
> > +One difficulty for most first-time reporters is to figure the right list of
> > +recipients to send a report to.  In the Linux kernel, all official maintainers
> > +are trusted, so the consequences of accidentally including the wrong maintainer
> > +are essentially a bit more noise for that person, i.e. nothing dramatic.  As
> 
> Yeah, this is the central point: we already trust maintainers; there is
> nothing "special" about security@kernel.org.

Yep!

> > [...]
> > +single line suitable for use in the To: field of a mailer like this::
> > +
> > +  $ ./scripts/get_maintainer.pl --no-tree --no-l --no-r --no-n --m \
> > +    --no-git-fallback --no-substatus --no-rolestats --no-multiline \
> > +    --pattern-depth 1 drivers/example.c
> > +  dev1@example.com, dev2@example.org
> 
> To echo Greg, yeah, this is great, and has been an implicit action we've
> done for years, so there's every reason to delegate it to the reporter
> to avoid the round-trip.

Thanks!

> Though I guess we'll see if these new instructions actually change
> anything -- we still have people asking for CVE assignments. :P

I think it will move a little bit, because AI bots read this, so the
annoying ones who used to send us reports they didn't read will make
better ones. We've seen improvements already over the last two months,
with more plain text and less copy-pasted markdown. But maybe the MD
wasn't emitted in the first place. It's also true that the reports
quality has improved and now the tools are used by some experienced
people (but not just them yet). Anyway, we'll see. Now we have just
a link to copy-paste in return, we'll see how it evolves.

Cheers,
Willy

