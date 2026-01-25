Return-Path: <linux-doc+bounces-73938-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBpMJ+g1dmmTNgEAu9opvQ
	(envelope-from <linux-doc+bounces-73938-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 25 Jan 2026 16:25:28 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 23301812DD
	for <lists+linux-doc@lfdr.de>; Sun, 25 Jan 2026 16:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F2A63001032
	for <lists+linux-doc@lfdr.de>; Sun, 25 Jan 2026 15:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F5831D74C;
	Sun, 25 Jan 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NNoIBjXl"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFE1405F7;
	Sun, 25 Jan 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354724; cv=none; b=bGpl4dmvzVTn82arZCmE2afed+8QxSvamBWQIWgGKoCpISzKIJ0R9Ub8WzYR0doHfPmt2SlK99IFuLVa9ZOF7HH6HBmPVmM9+YP5ZJmB9278PIAecXu03JVlSze52YsJ+YRk+lIGGNuwBmDZbTIQzdYpOzyVv8PLYood5FaHLmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354724; c=relaxed/simple;
	bh=oGESXLq/bWmrmAWbNt3J1d76zlCuhmDQVcTK8W6oOFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCtkLJSYq67wbDOjxc00+OQ7o9gzOkTD7ZR+gbtdCaNfGf5mTEfh1M7a1LmnVvQZfPAfEYAJ7RdkW4xB4xPikXciPNtuPj1prAuS1nnqvJDPiol/BsWmLwnD8HsDU1yxRenaTmGFjeH8dicEhqWKtGTf/xPdN4uDy4DCasFEJeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NNoIBjXl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D430BC4CEF1;
	Sun, 25 Jan 2026 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769354724;
	bh=oGESXLq/bWmrmAWbNt3J1d76zlCuhmDQVcTK8W6oOFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNoIBjXltpIGrMiN5VVwB1k23p8IsghD+IPcCnz8QNi2pujpVQI6Ffke5F73/HbQ/
	 rThv3sHZJ2N2usoM2oCCiNf0pJ7NK8D98pDwcPT4HQVHiyi/BWKakSAInzXM5kO2FN
	 yYNhkxGtS9kgKSoSIdv+JK5kxrBmcUd/PZGbm2fo=
Date: Sun, 25 Jan 2026 16:25:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: john ashrith6 <johnashrith6@gmail.com>
Cc: workflows@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: clarify CC list guidance wording
Message-ID: <2026012527-operate-series-95f9@gregkh>
References: <CABoKZAD+694qPMAjgvJKfHdNYbwygsjp5NmowVA5hv63Z8823w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoKZAD+694qPMAjgvJKfHdNYbwygsjp5NmowVA5hv63Z8823w@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-73938-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 23301812DD
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 08:31:07PM +0530, john ashrith6 wrote:
> Removed the extra Signed-off-by so that only my real name remains.
> 
> Thanks for the review.
> 
> >From ed7f4bb8c6e46f76c1a02e91172402b7389ecb5d Mon Sep 17 00:00:00 2001
> From: John Ashrith <johnashrith6@gmail.com>
> Date: Sun, 25 Jan 2026 14:48:28 +0000
> Subject: [PATCH] docs: clarify CC list guidance wording
> 
> Signed-off-by: John Ashrith <johnashrith6@gmail.com>

Odd, this is showing up in a strange way.  Perhaps just use 'git
send-email' to send the patch out?

Also, you need some changelog text, for obvious reasons you don't want
us to take it without it.

Also, the versioning of the patch goes below the --- line, as the
documentation asks for.  Perhaps fix that up for v4?

thanks,

greg k-h

