Return-Path: <linux-doc+bounces-86920-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN65EgY8AmrmpAEAu9opvQ
	(envelope-from <linux-doc+bounces-86920-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 22:28:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA4515DE4
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 22:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 490023033F9B
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 20:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971C43822AA;
	Mon, 11 May 2026 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="BNjZzw86"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9E3803CC;
	Mon, 11 May 2026 20:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531173; cv=none; b=C8gL2YZWI0vlPrE08Eu8u+tdJiUEDOMPFxRQDvWmYT2V6kz4VWSSumyZecI8lRv7+Cg7DJ9sAWRd1g3V/iJDNOWcsNpxaZ9hcEORv+B6GW3idqcq9EDJ7JuOd2p4ECBciXdC0zvKuYIKX4ABups0IjAkiBoV1ZRWMdeM74Kkk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531173; c=relaxed/simple;
	bh=cXxfqxuQ4bMovFOhILP4kFSxyP347BRWwT2doxePogM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaW9bmexuxCa3fMg1lAjvtovUye7ovn1lMOAa4Z6v051wFRY8zvI1moz8+MG3F8ZnRh8B4dnECYHyIsDnotqN7v/DLl2bKoPyxLWNJ4GJa+bYkGoecyUeBEOiNxOP1ISZhfTeOMfsa9VUWGJDDN6DqUXFZiGgvREUVAZNuRakeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=BNjZzw86; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778531167; bh=sV6h7rBJgaaYqTMWiO4QoIXSUi1lUmG7AF3xMpPmZWE=;
	h=From:Message-ID:From;
	b=BNjZzw86z/bEIbHzs/hz2T1PK6hEMFy2sFJ+8cjP9iMH9+4CadeDfGuieNeDFBEE1
	 jwx3ec6CMzX0dLBOyWDiu2eLo9E9vO6W3lGUQuRMBSNM4HEuS5ijfFTRYgxS/+2vaO
	 SUbPxe8241icRKWP91HsuHi1Y1CiInAotPdvkGeE=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 28A7DC0A9C;
	Mon, 11 May 2026 22:26:07 +0200 (CEST)
Date: Mon, 11 May 2026 22:26:06 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <agI7XogSmfN_Pm4t@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
 <2026051124-afar-renewal-795c@gregkh>
 <agIZ8zeg3m0xE3yL@1wt.eu>
 <878q9pvlif.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878q9pvlif.fsf@trenco.lwn.net>
X-Rspamd-Queue-Id: BBFA4515DE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86920-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1wt.eu:email,1wt.eu:mid,1wt.eu:dkim]
X-Rspamd-Action: no action

Hi Jon!

On Mon, May 11, 2026 at 12:39:20PM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> >> 
> >> Looks great, thank you!
> >> 
> >> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> 
> >> Want me to take it through one of my trees now to get it to Linus this
> >> week, or should it go through the documentation tree?  Either is fine
> >> with me.
> >
> > Yes, please take it as usual, it's simpler for me and it will likely
> > allow it to be published ealier, which ultimately should help us
> > faster ;-)
> 
> I can ship stuff Linusward quickly too... :)  But it's fine if Greg
> takes it, of course.

Oh that's fine then. I thought you only delivered such updates into next
releases. I'm fine with either way of course! Let's pick the path of
least effort for each.

Thank you!
Willy

