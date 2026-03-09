Return-Path: <linux-doc+bounces-78481-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mODoL8rxrmnZKgIAu9opvQ
	(envelope-from <linux-doc+bounces-78481-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:14:02 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 843EE23C896
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CE97300E156
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2026 16:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593353DA7FA;
	Mon,  9 Mar 2026 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nUsA+JeL"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F89D3CCA11;
	Mon,  9 Mar 2026 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072621; cv=none; b=hoY8f7XVXeDJ7IlzJl4IZQGvelojeix2+AN0OCdgmMWXvL5cbMWUpbEteHDQKe3gDAPorvGw2EwJUfURxXxjjTZrQFtrN+ZCy1XhRNEPxab+6Ls49ze5Gc+6CBum/CGvcSLDxGr8bQMn6fZHpfgy7ielv3c6wV7BHNEuynhXbqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072621; c=relaxed/simple;
	bh=xpGURxzfmd5tmwdU6ZEqYaOgTt5F52/K5hLY4ATuySc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S7rZo2sMAo+ulkhZcqhwGZCSsxpf9fAdSkFjV9tXHKat0sFpAdYU9gtNEggSEVl/6cKfjMYUJqYOp5RNu9dQYjRKaLsCVw8Ht4Q0gCvDHMpQas6cYErngsie9JSuGzXZTPEcgTwo7RkUf4E/lBk47/JzYWzXhxg1AzWqTiSlNmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nUsA+JeL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69AA840C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773072619; bh=Hz1hJUwC6N3smegrQxjMoXkEvYOWDYjikvQz9Sfuh0U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nUsA+JeLMxqfeWT6hMwpibDmKdaSf5B7TxuuBjc2j4wXjJO6Dsq7bYACv5Hz71chN
	 +q5Ll/Ff68Jipx8vj53Sd+s0yTptvMzeBO5iSY7XbhO1LTLkxpI/DCXuJN/dKmPEPx
	 nrDEsSuzn6snibRRVcRlvQBpD3Y15yq8yuxaNiLspj5Gs00uXDoT47zgC8kU+umD2F
	 drIYxOIxkK/JBFn4UKCqo5qG5ifuT3NPuhf/xOauKJwtPtsJGLM7v16CNNMZpyl8Nd
	 /EQsdgmDnRptjVgdZYdA0bwydgtdH2an45LnW3v1YTinFs00YvHw8ug+VT2HUXdVK3
	 5AA6Hckf1XSEg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 69AA840C9C;
	Mon,  9 Mar 2026 16:10:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: LIU Haoyang <tttturtleruss@gmail.com>, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: LIU Haoyang <tttturtleruss@gmail.com>, cocci@inria.fr,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/dev-tools: fix a broken URL in
 dev-tools/coccinelle.rst
In-Reply-To: <20260308100851.341-1-tttturtleruss@gmail.com>
References: <20260308100851.341-1-tttturtleruss@gmail.com>
Date: Mon, 09 Mar 2026 10:10:18 -0600
Message-ID: <87v7f5vv9x.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 843EE23C896
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-78481-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,inria.fr,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,inria.fr,imag.fr,linuxfoundation.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

LIU Haoyang <tttturtleruss@gmail.com> writes:

> The original supplemental documentation for coccicheck is
> https://bottest.wiki.kernel.org/coccicheck, which redirects to a not found page,
> thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
> which adds a suffix to original URL to make it direct to the right page.
>
> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
> ---
>  Documentation/dev-tools/coccinelle.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
> index 2b942e3c8049..f73ccf5397f3 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -61,7 +61,7 @@ Supplemental documentation
>  
>  For supplemental documentation refer to the wiki:
>  
> -https://bottest.wiki.kernel.org/coccicheck
> +https://bottest.wiki.kernel.org/coccicheck.html
>  
>  The wiki documentation always refers to the linux-next version of the script.

I'll apply this - a working URL is better than a broken one.  But is
there really nothing better to link to than a page that warns "OBSOLETE
CONTENT" at the top?

Thanks,

jon

