Return-Path: <linux-doc+bounces-81228-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIRiA1oxxGkAxQQAu9opvQ
	(envelope-from <linux-doc+bounces-81228-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:02:50 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FD332AF48
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F31C03084DE7
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 19:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC812F8BC3;
	Wed, 25 Mar 2026 19:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="J+MkMiPo"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AC83385B2;
	Wed, 25 Mar 2026 19:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465206; cv=none; b=W1Y6SDDINM2fzxdsJkBH23pKITNfLWpadkwjCBrvIR4zQLhqmpU3GUsGzQdXAG8T1F3d7zxVQJ6sGojI8OMES5FKWsPwWB2ZBwondrwL4jrjVdxUGGB5R5sa+GKODaS+1V9lFTno+dId6MdrrI4kHGLAwU1zYawTej7ylN3utWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465206; c=relaxed/simple;
	bh=bx8b2zZShhGt0JH6vLj6+mEzYaGJnGrCIs08nUXzX7M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DVu5D0t4vWycoSgMsER6NsgCMupXHm70eGKgzwV6Q0h6Bi9ucgKI/xURPeEClCfmD7F0Gsy0KwI7mg+yze3HUbvOqZ/B5pLhyROYX4zFDgFM6eQJQo+zKsFEihJN1D9+0pJP4fPyA65HFORblYcfNN5SiUNPWiQEAEmEEC4fI3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=J+MkMiPo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 85F5840C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774465202; bh=p91A/mGZzCO1FjNMmAxf1OvUJbcrsKomd7ldotsyPZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J+MkMiPo40jR7W9ORSO5jqJih23CpFVwPjpVy2VA+1QF2B5az0xHjJwzdRD4UAyfq
	 KkuubHCZ+/CFUYex+V2Gqnzx1rbgzMZ7fatZ5MxccCjVs/JYfaU2XJhmfwg+ARh/z1
	 3nvtXgGVgWsSYPj9+to0FjOP18mUYnrWH+djbIg5N3SmBsDkRMSFSWGb4yhl9ROY9e
	 bvrJJYBJMD1PrJnJmHzo6//EaZgVJSmgY3oqN3F5N/R1Sx9PGhusPUWhFp/B59ZjID
	 QlA6i9SmUL+yrGmd7JnmPGtaWcm20Qsr1g7e9Vrz+cEr8c5ffPE7s8GzxCmZqs4/tV
	 lSxYdEllOMwqQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 85F5840C6F;
	Wed, 25 Mar 2026 19:00:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH v3] docs: contain horizontal overflow in C API descriptions
In-Reply-To: <20260323153342.33447-1-rito@ritovision.com>
References: <20260321142559.26005-2-rito@ritovision.com>
 <20260323153342.33447-1-rito@ritovision.com>
Date: Wed, 25 Mar 2026 13:00:01 -0600
Message-ID: <87jyuzg2fi.fsf@trenco.lwn.net>
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
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81228-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 79FD332AF48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rito Rhymes <rito@ritovision.com> writes:

> Some documentation pages contain long C API signatures that can exceed
> the content width and cause page-wide horizontal scroll overflow.
>
> Apply contained horizontal scrolling to C API description blocks and
> keep their signature rows on one line. This preserves signature
> formatting while preventing them from breaking page layout.
>
> Contained horizontal scrolling is preferred over wrapping here because
> code fidelity is the priority. These blocks are intended to remain
> representative of the code itself. Wrapping distorts spacing and line
> structure, which affects fidelity, creates misleading renderings, and
> reduces readability.
>
> Examples:
>   https://docs.kernel.org/6.15/driver-api/regulator.html
>   https://docs.kernel.org/6.15/userspace-api/fwctl/fwctl-cxl.html
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4
> ---
> v3: add latest public versioned URL examples to the patchlog
>
>  Documentation/sphinx-static/custom.css | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index db24f4344..18bf8813b 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -40,6 +40,13 @@ li { text-indent: 0em; }
>  dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
>  /* indent lines 2+ of multi-line function prototypes */
>  dl.function dt { margin-left: 10em; text-indent: -10em; }
> +/*
> + * Preserve C API signatures on one line and apply contained horizontal
> + * scrolling to prevent them from exceeding their container width and
> + * breaking page layout.
> + */
> +dl.c { overflow-x: auto; overflow-y: hidden; }
> +dl.c > dt.sig.sig-object { white-space: nowrap; }
>  dt.sig-object { font-size: larger; }

I am not convinced this is the best solution to the problem; somebody
looking at this documentation is going to want to see the prototype, and
reaching over for horizontal scrolling will not be entirely welcome.

I guess, though, that it's better than what we have now, so I have
applied this one.

Thanks,

jon

