Return-Path: <linux-doc+bounces-87334-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BhfH2xUBGqMHAIAu9opvQ
	(envelope-from <linux-doc+bounces-87334-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 12:37:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 295075316AB
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 12:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F380630E0FA7
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 10:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B332C3E9C27;
	Wed, 13 May 2026 10:35:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F0A3E9C11;
	Wed, 13 May 2026 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668528; cv=none; b=OcbXd4MGhS794ewhyE7peutDO7axh4vKaCmcZwGR73gVmVKFFaRjZagazWFWLyb4atoZS5+bElaoN+l9hrjPvidWhJcJqYH70F773G9ja/wvjbrcfI4UocsPsiIGGG73vD3/tlCg9LyHXelxU18hpORGgc1ESU22UwjEWdtqTWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668528; c=relaxed/simple;
	bh=vjfR2GWpqdcZMNr7DbEEMQk2je0+nSri3Yp4wcLb1vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4HEMQrnVD1byG40sz/W7bQYJFBbETLxJUovol3Vnp3tgytajMKSyX3WzZuqIIPJYPnDNPqPUaTBzDWPHpJxtJBqixRqUNJbYx9wPnSzfJNTmFjC1WL6eFSkcGLe135YbZmDRIOZXIY18KQTotis7DZrCcJvz1P0ZliQpPKVkZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DDBC2BCB8;
	Wed, 13 May 2026 10:35:27 +0000 (UTC)
Date: Wed, 13 May 2026 12:30:10 +0200
From: Greg KH <greg@kroah.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Willy Tarreau <w@1wt.eu>, Leon Romanovsky <leon@kernel.org>,
	skhan@linuxfoundation.org, security@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
Message-ID: <2026051353-apricot-kleenex-fa57@gregkh>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-4-w@1wt.eu>
 <87se7wo861.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se7wo861.fsf@trenco.lwn.net>
X-Rspamd-Queue-Id: 295075316AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[kroah.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87334-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:email,1wt.eu:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 11:21:42AM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > AI tools are increasingly used to assist in bug discovery. While these
> > tools can identify valid issues, reports that are submitted without
> > manual verification often lack context, contain speculative impact
> > assessments, or include unnecessary formatting. Such reports increase
> > triage effort, waste maintainers' time and may be ignored.
> >
> > Reports where the reporter has verified the issue and the proposed fix
> > typically meet quality standards. This documentation outlines specific
> > requirements for length, formatting, and impact evaluation to reduce
> > the effort needed to deal with these reports.
> >
> > Cc: Greg KH <gregkh@linuxfoundation.org>
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Leon Romanovsky <leon@kernel.org>
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > ---
> >  Documentation/process/security-bugs.rst | 57 +++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> 
> One nit:
> 
> > +  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
> > +    the kernel's threat model and go to great lengths inventing theoretical
> > +    consequences.
> 
> If only we had a shiny new document describing that threat model that we
> could reference here... :)

Ah yes, a link to that would make things better, but don't we have that
elsewhere in this series?

thanks,

greg k-h

