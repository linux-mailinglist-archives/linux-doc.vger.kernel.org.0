Return-Path: <linux-doc+bounces-79377-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id i3bwIVymtWkh3AAAu9opvQ
	(envelope-from <linux-doc+bounces-79377-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2026 19:18:04 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DEF28E62F
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2026 19:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DE7D3013711
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2026 18:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2A33A1CD;
	Sat, 14 Mar 2026 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="REWDu3KA"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564822F851
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773512279; cv=none; b=HxlLcKCdLhH6as782TrDPNKLRdhd1tpUBy3unQsqsJS72SdnpBi3IW80stHtL0vM1+xrjT3bH0+WQbWS2t58YhssRJ3q2lwka3b2TEOiSCKjNNBdwRhHIxvhTu29tUMgDTXxFebXm6A/Ks7ecdTfEn4mxMT6TfkM7Fh1aPQclJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773512279; c=relaxed/simple;
	bh=5lyc4nYBYKJUb0KYCmeiT0EMMXqOAiiUHayvp7zQMJ4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=F2Ma2wJ59M7rlM96eFu9IdBP0ZJ4cSDZSljMN/YB24UaiYjdgww3eGJmNcVeU2Yu2xf3dci9iGWCsp9ogVtoUYuVyDpUcDZL3ZtWSc1DMWUseMO5ELrvxwGLqHgWskqSEeYizAOcWkUtU0L9uQ4RAosm3C4hx08PK3y6UtUzp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=REWDu3KA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A263BC116C6;
	Sat, 14 Mar 2026 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773512278;
	bh=5lyc4nYBYKJUb0KYCmeiT0EMMXqOAiiUHayvp7zQMJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=REWDu3KAP6d0lLPALgItFItoZzlGs4vQ3BHFEgSJ8jdkBe704scT4OcGb3Q/A/mOM
	 vD8uJha6tAaW6bdGd3XDR2mDp8WY1NCrgtgSgcFliDiIZ5nx9MNNVeL2X6T3tR7F5t
	 WkCSOi0RIxuYUxUJvGfeQ2KjrOXFpbdPUwsHLR/o=
Date: Sat, 14 Mar 2026 11:17:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, david@kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
Message-Id: <20260314111757.2a17c3acce8c3a1eb68ed209@linux-foundation.org>
In-Reply-To: <CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com>
References: <20260314152538.100593-1-xaum.io@gmail.com>
	<87ms0ajtvy.fsf@trenco.lwn.net>
	<CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-79377-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7DEF28E62F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 17:02:47 +0100 Kit Dallege <xaum.io@gmail.com> wrote:

> Hi Jon,
> 
> The material was written with AI assistance (Claude) and then verified
> against the source code in mm/shmem.c. I read through the implementation,
> the existing comments, and Mel Gorman's book outline to identify what
> should be covered, then used AI to help draft the prose, which I reviewed
> and edited.

OK, so you're saying that you created the content and used an LLM to
assist in finishing it off?

> I'm happy to rework anything that's inaccurate or doesn't meet the bar.
> Should I add an Assisted-by tag to the commit?

Yes, Assisted-by: is appropriate and useful here.

From a quick scan, this material appears to be helpful and I think it
would be good for us to get this into the tree in some fashion.  Which
will involve asking the relevant MM developers to review each change.

> Mel Gorman's book outline

Well, Mel may have an opinion on this - hopefully you discussed this
with him beforehand.


