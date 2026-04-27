Return-Path: <linux-doc+bounces-84759-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E+iCNNp72l3BAEAu9opvQ
	(envelope-from <linux-doc+bounces-84759-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:51:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7A3473BFB
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64E5E3001587
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 13:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08E03D0913;
	Mon, 27 Apr 2026 13:50:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF13BED37;
	Mon, 27 Apr 2026 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297852; cv=none; b=aS7qy+6aywxPGp0VrbsXNFGmBZgBxRZHiuHeIuk8muIpgjv3Qi2oN5FTdXGm3X0/hEQ5hyuYE6AmaLGgXjAH/ocsfFisbCijNEhMv+fsumdY28U5n0gye+e0+EI2E8pqlH32JI3sfkA7uMgZB6q6NR/ooqLaqOudD5xkTBQwHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297852; c=relaxed/simple;
	bh=4nyv8Zmag9UkEM/i0o6h8KU01nqrq203CMsueAUVOPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFfUlzWI7gmARCoQTu1uRue0Uot6N/Jl6jQOqCFn78nf1XaFXt1vMnE/27Hm/3sUxdxnGxWWVXMWwIN5SLKAMJo2jPCR9geiQIpGkWWwVi1ZkBibizj9fIdsGIa/4jmwjxkOl7yBp2kLd3dzpeXfjsMEuz02nfNuBhK+BHICSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A65EC19425;
	Mon, 27 Apr 2026 13:50:51 +0000 (UTC)
Date: Mon, 27 Apr 2026 07:50:16 -0600
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Documentation: security-bugs: clarify requirements
 for AI-assisted reports
Message-ID: <2026042705-nearest-storm-9f76@gregkh>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-4-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426163914.19449-4-w@1wt.eu>
X-Rspamd-Queue-Id: 6B7A3473BFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[kroah.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84759-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1wt.eu:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:email]

On Sun, Apr 26, 2026 at 06:39:14PM +0200, Willy Tarreau wrote:
> AI tools are increasingly used to assist in bug discovery. While these
> tools can identify valid issues, reports that are submitted without
> manual verification often lack context, contain speculative impact
> assessments, or include unnecessary formatting. Such reports increase
> triage effort, waste maintainers' time and may be ignored.
> 
> Reports where the reporter has verified the issue and the proposed fix
> typically meet quality standards. This documentation outlines specific
> requirements for length, formatting, and impact evaluation to reduce
> the effort needed to deal with these reports.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/security-bugs.rst | 55 +++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)

Nice addition!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

