Return-Path: <linux-doc+bounces-84792-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP31Df+B72nmBwEAu9opvQ
	(envelope-from <linux-doc+bounces-84792-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 17:34:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A7E475428
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 17:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3D4D303E4EB
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192C8333426;
	Mon, 27 Apr 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="tT6bNLU/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8767332EA2;
	Mon, 27 Apr 2026 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303452; cv=none; b=pp5Gx5mIYvZtFUSiUlIw3o43epmx0u6x/x6iklnVEx6w0WrLgwIahDsu3dOvcSuwHKQpP9a4Ii6ccP7Bqpk6SgiGZa31OmdRbiH8QbQMpx9b2dXLrvtwLloNPfiu9LVbxCeS7MmydtbBo25wfRmTrW0XspN/QSG204xIE9pS2yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303452; c=relaxed/simple;
	bh=SijeSrbpMrk4cC2YCZk0ZkZ7DvG7zOVzeljh7hc+TrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIrXsLxHM04qYa7L+TEfzkwULNm4WQ8tUnQOYEgh+hjvd1EGSWOtXmeIxSokwLlKaY0yUQBv8L0pnOndhbrUCNv7rsIbr/B6oPev+N3dl0n3eYLkMbpVLS7WO7RSvn4p8VMWiUhezYDLchgE3Yv8Z0PfYAeHjgSnGBCP39bB5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=tT6bNLU/; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777303446; bh=rmYw8hoRZUPbsG7R1C9+F0VWGOXfzi568wax9wmIrd0=;
	h=From:Message-ID:From;
	b=tT6bNLU/f5cTM4sAeU9qgQMsM5Vg/Xp8UoG1VOAXAncTRvkjrOtDDSjmMHrnpSmTl
	 CJYMiBbQ1gSyNjK/i8OM48spMR4EGmhfV2VeRBJlNx6F8qtwBxkvMe83JvAqs7Ue8w
	 nIIThVwJn1hE+LINvQTKJi516xn6ZzNcMU2XvtGk=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 71BEAC0B19;
	Mon, 27 Apr 2026 17:24:06 +0200 (CEST)
Date: Mon, 27 Apr 2026 17:24:06 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: security-bugs: do not systematically
 Cc the security team
Message-ID: <ae9_ljvxw5I9arzQ@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-2-w@1wt.eu>
 <2026042727-recital-twiddling-eb22@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042727-recital-twiddling-eb22@gregkh>
X-Rspamd-Queue-Id: D6A7E475428
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84792-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[1wt.eu:email,1wt.eu:dkim,1wt.eu:mid,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 07:49:08AM -0600, Greg KH wrote:
> On Sun, Apr 26, 2026 at 06:39:12PM +0200, Willy Tarreau wrote:
> > With the increase of automated reports, the security team is dealing
> > with way more messages than really needed. The reporting process works
> > well with most teams so there is no need to systematically involve the
> > security team in reports.
> > 
> > Let's suggest to keep it for small lists of recipients, to cover the
> > risk of lost messages (spam, vacation etc) but to avoid it for larger
> > teams.
> > 
> > Cc: Greg KH <gregkh@linuxfoundation.org>
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> 
> This is going to cut down on emails to us a bunch, which might be good,
> or not, as now we'll not have a way to know what's going on overall.
> But hey, let's try it and see what happens!

Or maybe we could suggest that first reports from a reporter should
always Cc the list ? After all, every time we asked to drop the list
was for senders at their 5th or 10th submission. Maybe we could just
say that the list members prefer not being repetitively CCed by the
same submitters to invest more time on newcomers ?

> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks!
willy

