Return-Path: <linux-doc+bounces-73930-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XGc9DiIrdmknMwEAu9opvQ
	(envelope-from <linux-doc+bounces-73930-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 25 Jan 2026 15:39:30 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ADE81066
	for <lists+linux-doc@lfdr.de>; Sun, 25 Jan 2026 15:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D389D300651E
	for <lists+linux-doc@lfdr.de>; Sun, 25 Jan 2026 14:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C7F3242D4;
	Sun, 25 Jan 2026 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hekLqH7z"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EEA322A28;
	Sun, 25 Jan 2026 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769351964; cv=none; b=UvXjVUeQMPNbFqqmVWTGZdQC6U9Id7UCrBhyPlJ1QfhRfjr6fpjui0G+wuZggbRm52qbiVzpYv50cJrqdbGUSFSTbChj7oXDFBf9xtHcxbjrCVIVwmlLo6/BTAUR+n6JqZAglhkV1NpMhLD9q7P5yKP25cAFpZmrMp1wSSweIoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769351964; c=relaxed/simple;
	bh=ul3zI6m3/E/j0CtfDBenVrsXomXj71j6tkFREgyaXoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohNbubn7OnhAyFA/MvH4sMnVfJyhhu2O6FbFEh0tOWMlFQCi0sRMg4eIyWYH/DnfeftESntlqYTKFDbO+wWo6ZRT9PPWNO1bVTWy8NSg2gj/uNvShOQhv6Txaos+QyUAdm2OKZpXi+ms7/DUi5nUnT8/Ws+YsCPMM7WeonnQGQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hekLqH7z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8193C4CEF1;
	Sun, 25 Jan 2026 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769351964;
	bh=ul3zI6m3/E/j0CtfDBenVrsXomXj71j6tkFREgyaXoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hekLqH7zih8X4Y89cR5ioIiEhPSnBHxNoxVov8Giyr07yMM6uAGf7spzhAT+nrntB
	 MVWIprG/z8ZFmB/+Ucgk1xQELkCQygcN0/eIaTOKOogFEivZvazhWPYmhupkNwwAdn
	 uKWOrJoxsA7Ycvd1+LISz0rtvV+XxK0J0ydxPfNA=
Date: Sun, 25 Jan 2026 15:39:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: john ashrith6 <johnashrith6@gmail.com>
Cc: workflows@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: clarify CC list guidance wording
Message-ID: <2026012556-majestic-traitor-8f03@gregkh>
References: <CABoKZACHObTMAC5FMvhRG3Guev_s_Pys_t3G7LAqF7BTiLD+KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoKZACHObTMAC5FMvhRG3Guev_s_Pys_t3G7LAqF7BTiLD+KQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73930-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A6ADE81066
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 08:08:08PM +0530, john ashrith6 wrote:
> This patch clarifies wording in the CC list guidance to avoid ambiguity.
> 
> No functional changes intended.
> 
> >From 416237c2cea7ccb4fa863ebc260777ea102b2b62 Mon Sep 17 00:00:00 2001
> From: JAR2004re <johnashrith6@gmail.com>
> Date: Sun, 25 Jan 2026 14:17:13 +0000
> Subject: [PATCH] docs: clarify CC list guidance wording

No need for this to be in the body of the email/changelog.

> Signed-off-by: JAR2004re <johnashrith6@gmail.com>

Please use your name here, not your alias.

thanks,

greg k-h

