Return-Path: <linux-doc+bounces-75697-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Sk3JGNA6imlkIgAAu9opvQ
	(envelope-from <linux-doc+bounces-75697-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Feb 2026 20:51:44 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B61143C1
	for <lists+linux-doc@lfdr.de>; Mon, 09 Feb 2026 20:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D353A3009FA9
	for <lists+linux-doc@lfdr.de>; Mon,  9 Feb 2026 19:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2F138758C;
	Mon,  9 Feb 2026 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ERTHnGOw"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9913064A0;
	Mon,  9 Feb 2026 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770666700; cv=none; b=YaiyExcPP7OIZ1v1ktSqskwTnE8xbFXLf99YuuH0SYP+Xmbo6P1khoG9Ea8xn25erNRgiHEwRlVhoyD6z8YHflCPUaHF2bSj0wxUagI2cp9mBOWRLVtAVhgkCqERdaannXaYUBtdSecowAWW1AHkjstqUSAHBtU+ckNKBKrbh3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770666700; c=relaxed/simple;
	bh=4tNBurZQW/jyricu4UwVEofpE1tfXKcBKMlW859+U88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kEDughi8Snbx2kTmr61CMUj9bEBPK4DMiXx+tWKHCfHSwTTJjjz/kLjz01x9RskSpyiCgjIVt96F3jXFdD6UPiRUFZWen7ZHz6rhIw7BpEkbsLcFnmtmHaW3ifwEHS7aHeADbfcasdauzf2WENF9qpwKsg+eSA3qxsBp9FfYU1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ERTHnGOw; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B919C40C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770666699; bh=fsrUuNtDXLGPAET7xN+TZZTOW30hEn1ruwzNWrdIv6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ERTHnGOwZ1mFakzHxAeOBV0NQYFRA+EhOFJJSHZ8XVGRmJtGXHdcc3h9a1cpCrlXq
	 2yH4rZ2k20pSIKebed+ccqBPitXrsgmc5RDNV5B+DexbtR6LgY3XK4oomKLkE9LfpN
	 l3CoFO41aoouHPqQPDvkbTNlm6H9FSR58xaYtksk2tWd3N/QBG0o8khbsbeIoQ8EWR
	 Nh8Gcr93E+Jve6J6fbOUDK/KMQ0xPGfBnUFRm5FhNEGOq2oG1BI+qc6whU50NXkjSU
	 7CvYn2IwEiO01wj5iE1VjmAd77cCfHKUic3YG0dv+DIedDSvrAP58QcpsaurgacJeX
	 /iUdP7Bssc4pQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B919C40C3E;
	Mon,  9 Feb 2026 19:51:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amitabh Srivastava <amitabh@amidevlab.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amitabh Srivastava <amitabh@amidevlab.com>
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update
 kernel.org docs link
In-Reply-To: <20260205115554.7795-1-amitabh@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
Date: Mon, 09 Feb 2026 12:51:38 -0700
Message-ID: <87a4xh8zlh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75697-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: AC4B61143C1
X-Rspamd-Action: no action

Amitabh Srivastava <amitabh@amidevlab.com> writes:

> Update http link to the documentation about how to add a kernel.org UID to
> the maintainer's key. Add missing SPDX-License-Identifier to fix a
> checkpatch warning.
>
> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
> ---
>  Documentation/process/maintainer-pgp-guide.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
> index b6919bf606c3..1e4d885dc784 100644
> --- a/Documentation/process/maintainer-pgp-guide.rst
> +++ b/Documentation/process/maintainer-pgp-guide.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  .. _pgpguide:
>  
>  ===========================
> @@ -864,7 +866,7 @@ don't already have them)::
>  If you have a kernel.org account, then you should `add the kernel.org
>  UID to your key`_ to make WKD more useful to other kernel developers.
>  
> -.. _`add the kernel.org UID to your key`: https://korg.wiki.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_pgp_key
> +.. _`add the kernel.org UID to your key`: https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp-key
>  

Applied, thanks.

jon

