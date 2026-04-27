Return-Path: <linux-doc+bounces-84758-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE6bMopp72l3BAEAu9opvQ
	(envelope-from <linux-doc+bounces-84758-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:50:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 208D3473BC7
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65A653007B2F
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 13:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441A13CFF45;
	Mon, 27 Apr 2026 13:49:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C8C3CF69E;
	Mon, 27 Apr 2026 13:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297783; cv=none; b=tObu+o1zvpSZJdVjtcoJOzBLwP4+2OSqkr0ODzretSCuAaDpm0m7w+p7lcJnlyJj9kRFb8jPvVjkPdhVXRXt6aGo+CyvsbgBxRrzhFBT4yTq4sAwX8BFGKFZa/MzY0De08aFum9WoPDfnwucvaUCJt2G9H+s5wEVoTLdFo6hr3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297783; c=relaxed/simple;
	bh=1jT06HNmD4c1aAP11xIK87nFG5vUeV1cPhaJHIcg84Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S402IRt4DaX3d8Y/Q5ODwZvr5c3dcdMjRjugOt7EjO/L99eSC9BNZS/bvgwff6XrQcrXtHCVniA/dUCRGcP1kQKLXr+iiJZzJm2aVFvxbpQjlqP1hvQzvVf/iD28herEGpMs7v3m9CODfrhlDZnv86Gx+bnzRtU98Q2Ocig01Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74E4C19425;
	Mon, 27 Apr 2026 13:49:42 +0000 (UTC)
Date: Mon, 27 Apr 2026 07:49:08 -0600
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: security-bugs: do not systematically
 Cc the security team
Message-ID: <2026042727-recital-twiddling-eb22@gregkh>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-2-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426163914.19449-2-w@1wt.eu>
X-Rspamd-Queue-Id: 208D3473BC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[kroah.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84758-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1wt.eu:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Sun, Apr 26, 2026 at 06:39:12PM +0200, Willy Tarreau wrote:
> With the increase of automated reports, the security team is dealing
> with way more messages than really needed. The reporting process works
> well with most teams so there is no need to systematically involve the
> security team in reports.
> 
> Let's suggest to keep it for small lists of recipients, to cover the
> risk of lost messages (spam, vacation etc) but to avoid it for larger
> teams.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>

This is going to cut down on emails to us a bunch, which might be good,
or not, as now we'll not have a way to know what's going on overall.
But hey, let's try it and see what happens!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

