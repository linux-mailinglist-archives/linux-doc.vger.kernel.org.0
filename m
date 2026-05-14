Return-Path: <linux-doc+bounces-87463-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG/RArp4BWoaXgIAu9opvQ
	(envelope-from <linux-doc+bounces-87463-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 09:24:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1EE53ED69
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 09:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13716301AB96
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 07:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7E73D7D9B;
	Thu, 14 May 2026 07:24:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9315B1DF748;
	Thu, 14 May 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743478; cv=none; b=UfF3y1l+tSOv5A2NXWcGQZoBlJboI9LXmX8kOGymkbcjOwAQI6hrxtov2bleAhNR5u2ZZoiA0JoxFMDlPZSbYyxa+orgUA4EBoXkYKpPZUQHCz2bp4jkZhJ0qmMREuZwe/4NDWdFuD9hhDTw2PiMz8QX0x8frZVNPExJgkaoHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743478; c=relaxed/simple;
	bh=qyBgmyKnXrQV6qm83BCHmNVHAslYtlyBrnJabep9YJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJBskK20R0s/CruQxg7D422U09BD1hMTsea0E+dUkXt5cDtB+JUwbrNc5Hc4Za/dSSYWxRWXv36lMMY6tcEnzac8pmbd/eDKGEB0Ga1y9baXntfmcYga01/velIoTjv1SJhkbTe5HCocxG4Pbe6F8/yuGZnmAG5nCYceVMBNySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE61FC2BCB7;
	Thu, 14 May 2026 07:24:37 +0000 (UTC)
Date: Thu, 14 May 2026 09:23:53 +0200
From: Greg KH <greg@kroah.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Willy Tarreau <w@1wt.eu>, Leon Romanovsky <leon@kernel.org>,
	skhan@linuxfoundation.org, security@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
Message-ID: <2026051439-reorder-flight-5a14@gregkh>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-4-w@1wt.eu>
 <87se7wo861.fsf@trenco.lwn.net>
 <2026051353-apricot-kleenex-fa57@gregkh>
 <agRfXQvN7ZDTNGQG@1wt.eu>
 <87a4u3mpxk.fsf@trenco.lwn.net>
 <87ik8r6n1r.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ik8r6n1r.fsf@trenco.lwn.net>
X-Rspamd-Queue-Id: 5D1EE53ED69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[kroah.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87463-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,1wt.eu:email,lwn.net:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 03:02:08PM -0600, Jonathan Corbet wrote:
> Jonathan Corbet <corbet@lwn.net> writes:
> 
> > Willy Tarreau <w@1wt.eu> writes:
> >
> >> On Wed, May 13, 2026 at 12:30:10PM +0200, Greg KH wrote:
> >>> > One nit:
> >>> > 
> >>> > > +  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
> >>> > > +    the kernel's threat model and go to great lengths inventing theoretical
> >>> > > +    consequences.
> >>> > 
> >>> > If only we had a shiny new document describing that threat model that we
> >>> > could reference here... :)
> >>> 
> >>> Ah yes, a link to that would make things better, but don't we have that
> >>> elsewhere in this series?
> >>
> >> It's in the same patch, I think Jon was sarcastic here. I thought I had
> >> addressed that one but apparently I was wrong :-/
> >
> > I'm just saying that this particular text should link to that document,
> > don't make readers go searching for it.  I can certainly add a patch
> > doing that if you like.
> 
> I was thinking something like this.
> 
> jon
> 
> >From 3f02a3c190bab6b54e2a250ead0c7408af1a3c51 Mon Sep 17 00:00:00 2001
> From: Jonathan Corbet <corbet@lwn.net>
> Date: Wed, 13 May 2026 14:51:29 -0600
> Subject: [PATCH 1/2] docs: security-bugs: add a link to the threat-model
>  documentation
> 
> Rather than make readers search for this document, just a link to it where
> it is referenced.
> 
> (While I was at it, I removed the unused and unneeded _threatmodel label
> from the top of threat-model.rst).
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/process/security-bugs.rst | 13 +++++++------
>  Documentation/process/threat-model.rst  |  2 --
>  2 files changed, 7 insertions(+), 8 deletions(-)

Looks good, thanks!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

