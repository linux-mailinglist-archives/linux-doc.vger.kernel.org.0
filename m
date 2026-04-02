Return-Path: <linux-doc+bounces-82299-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECoANBC+zmmTpgYAu9opvQ
	(envelope-from <linux-doc+bounces-82299-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Apr 2026 21:05:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5133E38D8A1
	for <lists+linux-doc@lfdr.de>; Thu, 02 Apr 2026 21:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9460E30120E2
	for <lists+linux-doc@lfdr.de>; Thu,  2 Apr 2026 19:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D2C379EEC;
	Thu,  2 Apr 2026 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="P+Z+Z4v9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E0735F185;
	Thu,  2 Apr 2026 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775156749; cv=none; b=GL9KdPTe4teunppBjP/Hu4Qw9ejwtNJRby3x6Tz4yuDlEq6t3h4b+QR8Q821JyjwRNdm/o2ut0e6GZeGq865Xwcc3IbZBqyrdOCKpRWPKjadeMvI5sWO6kE4CNSjblvL6MRqUgsUY7XGD4SUhxhrYcHGlIHkgyAZr3Sg/ybbFt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775156749; c=relaxed/simple;
	bh=DpRgumJvGtBGYpHt5STFCTt11roPXeCzOgvCCRl9rAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqVV/RdeW2uwViZYFrwJVzgfGYIZmuUhrAc0iKpeLeN6j1jRdycEaXIJtw+hjXsLoOkcSKgRm2OjeEVLCbHpb3VNMsFkwLdE17L/EoM4koderMgAfAH46VUXdTgs0lGSRn4sEOPZM8bmfJcm0VW8Y32lP2oNUFE64+nFpo1NMcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=P+Z+Z4v9; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775156745; bh=33Nx55sN5ViJ7cBIYn9//CGgH5xtdY6wsR4y3ZzqaHU=;
	h=From:Message-ID:From;
	b=P+Z+Z4v9b9WtptaP9tvJsUy1EN1bBtF8igV8Fl40tGOg+elRuashrfZyYnuo1oe/7
	 1ehqZNktICFl5Gex8PDNdlDZd4yFwQH8ATChT2SNM1PpqRV3JsTCjft2Z3cChhKoNc
	 6/C1qrebTr6NlHSZMJGBC5FieYq8n6kWRXQRJFug=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 86628C0AA1;
	Thu, 02 Apr 2026 21:05:45 +0200 (CEST)
Date: Thu, 2 Apr 2026 21:05:45 +0200
From: Willy Tarreau <w@1wt.eu>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: greg@kroah.com, edumazet@google.com, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: explain how to find maintainers
 addresses for security reports
Message-ID: <ac6-CYmhwi87z_e7@1wt.eu>
References: <20260402182655.8636-1-w@1wt.eu>
 <20260402182655.8636-3-w@1wt.eu>
 <e9f0bbe9-fbff-45c8-af99-4c66982bd2cd@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9f0bbe9-fbff-45c8-af99-4c66982bd2cd@infradead.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82299-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[1wt.eu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1wt.eu:dkim,1wt.eu:email,1wt.eu:mid,kroah.com:email]
X-Rspamd-Queue-Id: 5133E38D8A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 11:42:51AM -0700, Randy Dunlap wrote:
> 
> 
> On 4/2/26 11:26 AM, Willy Tarreau wrote:
> > These days, 80% of the work done by the security team consists in
> > locating the affected subsystem in a report, running get_maintainers on
> > it, forwarding the report to these persons and responding to the reporter
> > with them in Cc. This is a huge and unneeded overhead that we must try to
> > lower for a better overall efficiency. This patch adds a complete section
> > explaining how to figure the list of recipients to send the report to.
> > 
> > Cc: Eric Dumazet <edumazet@google.com>
> > Cc: Greg KH <greg@kroah.com>
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > ---
> >  Documentation/process/security-bugs.rst | 76 ++++++++++++++++++++++++-
> >  1 file changed, 73 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> > index da7937fd59df..6937fa9fba5a 100644
> > --- a/Documentation/process/security-bugs.rst
> > +++ b/Documentation/process/security-bugs.rst
> 
> 
> >  Markdown, HTML and RST formatted reports are particularly frowned upon since
> >  they're quite hard to read for humans and encourage to use dedicated viewers,
> >  sometimes online, which by definition is not acceptable for a confidential
> > -security report.
> > +security report. Note that some mailers tend to mangle formatting of plain
> > +text by default, please consult :doc:`the email client howto
> > +<../process/email-clients>` for more info.
> 
> Just use the file name and let automarkup do its job:
> 
>    text by default; please consult Documentation/process/email-clients.rst
>    for more information.
> 
> It's also more convenient for text readers that way.

If that's supposed to work, I'm indeed all for it! I must confess that
I have not even understood the reason for "../process" when coming from
the same directory, but I just picked that from existing entries.

Thanks for your feedback, much appreciated!
Willy

