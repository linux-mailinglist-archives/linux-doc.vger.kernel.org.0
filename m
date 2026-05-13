Return-Path: <linux-doc+bounces-87351-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJmhAhN4BGqpKAIAu9opvQ
	(envelope-from <linux-doc+bounces-87351-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 15:09:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B7533A73
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 15:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3AB3311C3CC
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 12:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650AF3D649A;
	Wed, 13 May 2026 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Xzsxfh3d"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AFF3655EE;
	Wed, 13 May 2026 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677104; cv=none; b=Qej6em0A+cJBXTLSTYuysJFkKuffsF1aQyGt2i8nmprj3RLy9bGvR0QfyS4pKFT0Zn3yX5Phb21an7ZezZP4VZ/FSsf5L7ZDnaFSd5CqPbSsuSqACADJfAZSpTwzeqw140rmQ1E8RU/gk0BypT+3ORBYAMMYiziDaP57GOiNsYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677104; c=relaxed/simple;
	bh=++15Zm8EsjxdSFxKum1kXNQmUOyyLrCD/zkFTR1A7dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mo6MmyD0u4bm0bZjyuNxJ/pNthivFZtHcYZxfbJsM03C3MnMGqFywfLv4KebHWnlScflrREDIjNZIyMwarPNtR9xF2HfzavDhJxi267CtY0GkEgLOb626i3TiCacZt1FJiPEep/XhArBn/D0zECm7OTObFgWDVMlndkGuDc9T5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Xzsxfh3d; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778677099; bh=XokBXItwAJ511mMtz7LpI940MXrMEWQfmJDpWe9Taew=;
	h=From:Message-ID:From;
	b=Xzsxfh3ddM5FYJ1FujiCRMzyU9Z4X6cBnnaCLhkMHCu5Yt8zN1dTk43EYsXcmdnPu
	 oO3LhwU4OYzTYvvn2of0uNfiOZS4OPkaMsH99sd5VCTrOE6tf7p5dyeUD5i26O/ctR
	 cGk087bkAgNSoZv/hWW10PZYJX8880j1qwvUnm+4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 528FFC0A33;
	Wed, 13 May 2026 14:58:19 +0200 (CEST)
Date: Wed, 13 May 2026 14:58:18 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
Message-ID: <agR1ag43uhKukzw3@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-4-w@1wt.eu>
 <87se7wo861.fsf@trenco.lwn.net>
 <2026051353-apricot-kleenex-fa57@gregkh>
 <agRfXQvN7ZDTNGQG@1wt.eu>
 <87a4u3mpxk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4u3mpxk.fsf@trenco.lwn.net>
X-Rspamd-Queue-Id: 817B7533A73
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87351-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[1wt.eu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1wt.eu:email,1wt.eu:mid,1wt.eu:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 06:53:11AM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > On Wed, May 13, 2026 at 12:30:10PM +0200, Greg KH wrote:
> >> > One nit:
> >> > 
> >> > > +  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
> >> > > +    the kernel's threat model and go to great lengths inventing theoretical
> >> > > +    consequences.
> >> > 
> >> > If only we had a shiny new document describing that threat model that we
> >> > could reference here... :)
> >> 
> >> Ah yes, a link to that would make things better, but don't we have that
> >> elsewhere in this series?
> >
> > It's in the same patch, I think Jon was sarcastic here. I thought I had
> > addressed that one but apparently I was wrong :-/
> 
> I'm just saying that this particular text should link to that document,
> don't make readers go searching for it.  I can certainly add a patch
> doing that if you like.

That would be kind, thank you Jon. Feel free to modify my patch if you
haven't published it if you prefer.

Thanks!
willy

