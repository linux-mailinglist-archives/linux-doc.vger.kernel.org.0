Return-Path: <linux-doc+bounces-80574-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDySG91TwGkJGgQAu9opvQ
	(envelope-from <linux-doc+bounces-80574-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:41:01 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D222EAC10
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A37A3002912
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 20:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03911367F4D;
	Sun, 22 Mar 2026 20:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VdUBLfxd"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EC01D5CFB;
	Sun, 22 Mar 2026 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212053; cv=none; b=Ww8Jzj9G8TnaD9BHjAp3CAQhmWRfNfcVf9HuljvEhPsRX2pMonCzF1sxRoHpKlhbBRUXR6zQnIC5wwdz2gvThy8dxF/3JN+sSZe7HvEjg7/Le0Bp6CszyBsPZ64UmKze8j1hhybKUHtpKA7QXaP0UbTflx84Asv3IKqrSBjs12c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212053; c=relaxed/simple;
	bh=9C5yrzVrVTDGAjlLbQr+nrcb6A4GfZCAzIslqW/2SIA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rdTks9alGXIq7H7uehSlnvioRfZ/rVhiYELA4JZ1T2dCoUrTbb6Kmm1XolJENe6NKjY7f+9mfZdh7iiLdNOHOoiXtBRs9vQVfCg7nW7A9IP02J1SEaFixV7Rzm+GmkyXsWtbDGt+mLbgVeWSzaBkwbcGb56GFqx/EWWTmJUa6V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VdUBLfxd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 26327411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774212052; bh=fQ1fSPK511MJpj/8Y0FZ9LDhkI9z7WV1jdEbs3wsCbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VdUBLfxd3AU/vvmK9/f5WKA9sfwCpT7egYZNClfoWPAunFOfKnOSubMLbVNb/GuCL
	 AkfO7A0FT2doejl98rA8Cka8WC2m4wdvAXNcumME7xdUYFgtQMNabYQDHdiBWu3AgX
	 9eY2GIVW82a/FawCN9Idrbb3R+v+5gIGRIivEFwhSrAtQ6n9i1BSE4sMtg1gneMlBN
	 WonioFStNEH1ghBs2cbhd0enKN91IrlVP9ahr8NnTAV7CflKOhaRFj/D1TdrI02hW/
	 MgrRBZZ8Nai3hcHksrXtXBovQz5c6oRZ9pGR9RIagrlk+LJRIOMhiBbW11cCiLMPGp
	 7AORxJqzc4QEA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 26327411E2;
	Sun, 22 Mar 2026 20:40:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH] docs: set canonical base URL for HTML output
In-Reply-To: <20260321124907.8524-1-rito@ritovision.com>
References: <20260321124907.8524-1-rito@ritovision.com>
Date: Sun, 22 Mar 2026 14:40:51 -0600
Message-ID: <87zf3zd2cs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80574-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ritovision.com:email]
X-Rspamd-Queue-Id: 63D222EAC10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rito Rhymes <rito@ritovision.com> writes:

> Set the published docs URL as html_baseurl so generated HTML pages
> advertise the correct canonical URL metadata.
>
> This helps search engines and other consumers treat docs.kernel.org as
> the canonical location for published documentation pages.
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> ---
>  Documentation/conf.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 679861503..f517dfeaf 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -437,6 +437,9 @@ sys.stderr.write("Using %s theme\n" % html_theme)
>  # so a file named "default.css" will overwrite the builtin "default.css".
>  html_static_path = ["sphinx-static"]
>  
> +# Canonical base URL for generated HTML pages.
> +html_baseurl = "https://docs.kernel.org/"
> +

What problem does this actually solve; what isn't working as well as it
should due to the lack of this configuration?

...and how does it help all of the people who do their own docs builds?

Thanks,

jon

