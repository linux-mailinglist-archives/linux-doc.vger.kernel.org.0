Return-Path: <linux-doc+bounces-86151-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHurH9g7/Gm1NQAAu9opvQ
	(envelope-from <linux-doc+bounces-86151-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 09:14:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A9D4E3F2E
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 09:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E84D3007B86
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2026 07:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8EA34CFAB;
	Thu,  7 May 2026 07:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AgvroNTu"
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CDF29ACCD;
	Thu,  7 May 2026 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778138067; cv=none; b=URFha2OOgktcKrZR81DVgTpGK5viIdemkgAknalO8ra3PlDKbZiMUkHn35b4QxfgFrTKhmX5MQae58RJ4NMoKS59kyFotIYnNMQjOSk/o3QFrOjoUuSv/Zna+ROIlyI/PFm4YNl5Ct9RifIi63Q425RlWZp+5yHTidTzBXXOrBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778138067; c=relaxed/simple;
	bh=sfzUWyFFEcE2Y45OBZlR+P5Ex9YeL7EpMGzBNOcsJYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFZUSNMmcgzjScwl9egA4qGGB3VVpkIoM4ls+Ncs3imr9RWBvH6/bHP/K9O0V2JO0IBaw7SxUzpb7TIR+N873irEUUMcqcAZlBxwEz5RNs9qrzKT670aQW/xf08gExC3hkXECvBZ3RBbMpKK7iXfv47MGjVlrPFv/Q5+nPf4gLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AgvroNTu; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lCBUz6OTC9OMEfsbs0YD70bMJfL1qeVOQYEJQKKBxdc=; b=AgvroNTuaguGlHdaG+Mlh6sqRW
	e3Yk+SyUT7f5yAEejQvLxnyE+ipORDMkkXENRZPXfQzhKuUPMAjhyfr1lDu+y2+YUMnD8ldebO01n
	6cZ7+rmGtDjEp2N3cTt7DPOYXzhETLKop4U/1qFIg+Q8oVDpuzcc1XH73q6WD9CkcI01CL4AFxg8U
	ygON2NZSsVDg3xJLQrStzt0NR7TIP+DhVVIowVPlB7k1EVQgybglV01j0owNQp1duGpsVtgL7t2wo
	ja/vgCHVl7ozeeWJuF8vfNjnXmE1GmiMqlES6jkOj2m7G7S8aC1VyBJsykQhrICq3ALYli0bq+zwk
	JJXuXf1A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsw0-00000002mUx-3phW;
	Thu, 07 May 2026 07:14:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5A4783008D6; Thu, 07 May 2026 09:14:12 +0200 (CEST)
Date: Thu, 7 May 2026 09:14:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, greg@kroah.com,
	leon@kernel.org, security@kernel.org,
	Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <20260507071412.GH3126523@noisy.programming.kicks-ass.net>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <aftmB435XJ8FP3V_@1wt.eu>
 <afwSk3BC8mewPfPp@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afwSk3BC8mewPfPp@1wt.eu>
X-Rspamd-Queue-Id: 27A9D4E3F2E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86151-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noisy.programming.kicks-ass.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,infradead.org:dkim]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 06:18:27AM +0200, Willy Tarreau wrote:

> Another point is that for many vulns there are two types of adversaries:
>   - criminals
>   - script kiddies
> 
> The former must be assumed to also have discovered the same vuln, possibly
> earlier, and to be actively exploiting it. The latter however, is just
> going to use whatever published exploit to say "look mum, I'm root".
> Public reports containing too many details will speed up usability for
> this group and that's not good for users.
> 
> And we *know* that some reports contain working PoC that need very little
> modification. Passing them through s@k.o for triaging feels safer than
> directing them to public lists with no early validation.
> 
> So in short, I think that:
>   - AI reports should be considered public, but not necessarily well known
>     yet
>   - AI reports often contain repros that shouldn't be posted publicly

So, I think a targeted repro that exposes just the initial bug is in
most cases useful and shouldn't be held back. Full blown exploits on the
other hand should definitely be kept from the public list.

Most times, it still takes skill to get from the former to the latter,
although I suppose with LLMs this gap is shrinking too.

>   - AI reports wording can be intimidating to developers not used to
>     receiving these things
> 
>  -> the security team should remain the first filtering layer for this
>     for new reporters even if it means continuing to see some noise.
>     I think that instead it's the 3rd patch about the threat model that
>     should help us receive less noise by explaining what is not a
>     vulnerability.
> 
> I can rework that part a bit to reflect this.

Yes, I think that covers my earlier point well. And yes AI babble should
be sanitized, both for brevity and for explaining how to do the rest of
the exploit :-)



