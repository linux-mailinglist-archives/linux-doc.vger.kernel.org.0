Return-Path: <linux-doc+bounces-88006-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNJ3C4XICWropQQAu9opvQ
	(envelope-from <linux-doc+bounces-88006-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 15:54:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E0561530
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 15:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A85330028D6
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 13:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E138026B973;
	Sun, 17 May 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ab9+YHNU"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2011A9F9F;
	Sun, 17 May 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779026045; cv=none; b=WlzH7YjR5YF8ahaapGQs/izAuJwcfgy7LkAbMOOebRkE2+9Ijixq/eJYPIOhmsxlJiaN8+Wkukq/v30Vbx7Vrxsb86ZM6+sDhNwpU6apTJ+PqHjRSd8i7xThDC8fmatpRqn0PsB+Nf4WVo4JTMIZk1YYtMPyzMVIfBoAQet51I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779026045; c=relaxed/simple;
	bh=fQCNw4EnSJMI7bx7pm4XaYCM6Vupjq8oyL3GdPFn8Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WBUd8m4FXyGkmthX1rKOJfpUn8uK445I0Xy2nDmCsT+TtzpF/jE7FKfrAjSnnnLzGg/S7cgSPKKyHUbv9SzG8YeTuadsU6eCicFa3KEA/KmNA1Tmc4RCnCf07zPNR/fOx4Z6vjCEx19aYrLeebeDZggEVkX1Sk2PQjaKzM/Olqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ab9+YHNU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB82C2BCB0;
	Sun, 17 May 2026 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779026045;
	bh=fQCNw4EnSJMI7bx7pm4XaYCM6Vupjq8oyL3GdPFn8Q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ab9+YHNUf/NlfMQYJ9XZnVPeNUOSgoPS1wojtV/MR6eLucxpYYgf6OYU+8G0aKNnY
	 UhWcHcFMMmGvzqEUWqoTsTCKcdDoNq+wKaMYookjK6noRfmyXRNle74bC16/YwP3US
	 0v9yE31Kgon9ztyHVMs2xFpSPZTm5S90199lwxVE+Ik/Tf89DDizjJZjaAnwHA+8lJ
	 ngcBcq+/CtifzuBtsRBUYkSJeTxtTiAmfDVB2CuqwOYmq5i/6SCDMwPiclY/JtUcKd
	 ynmNpb4R9h4gSywCrAVW2ya/0KcdtZQdPki6YM9ZwY00WqBLWfNzUKFajpgWEyrzPx
	 yRQ2QXLzulSaQ==
Date: Sun, 17 May 2026 14:53:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v13 02/12] iio: kstrtox: add local
 _parse_integer_limit_init() helper
Message-ID: <20260517145352.5f059a41@jic23-huawei>
In-Reply-To: <20260517-adf41513-iio-driver-v13-2-bb6e134a360f@analog.com>
References: <20260517-adf41513-iio-driver-v13-0-bb6e134a360f@analog.com>
	<20260517-adf41513-iio-driver-v13-2-bb6e134a360f@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2D8E0561530
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88006-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, 17 May 2026 10:13:57 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add parsing helper that accepts an initial value for the accumulated
> result when parsing an 64-bit integer. It reuses current implementation
> for _parse_integer_limit(), which now consumes the new function with
> init = 0. The diff algorithm would have the documentation header and
> prototype of _parse_integer_limit() moved around so it is adjusted
> according to guidelines.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
Sashiko makes a good point on this. It is not currently IIO specific
so the patch title should make that clear.

kstrox: add local_parse_integer_limit_init() helper.

> ---
>  lib/kstrtox.c | 39 ++++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/kstrtox.c b/lib/kstrtox.c
> index 97be2a39f537..0705461f51c0 100644
> --- a/lib/kstrtox.c
> +++ b/lib/kstrtox.c
> @@ -39,23 +39,15 @@ const char *_parse_integer_fixup_radix(const char *s, unsigned int *base)
>  	return s;
>  }
>  
> -/*
> - * Convert non-negative integer string representation in explicitly given radix
> - * to an integer. A maximum of max_chars characters will be converted.
> - *
> - * Return number of characters consumed maybe or-ed with overflow bit.
> - * If overflow occurs, result integer (incorrect) is still returned.
> - *
> - * Don't you dare use this function.
> - */
> -noinline
> -unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *p,
> -				  size_t max_chars)
> +static unsigned int _parse_integer_limit_init(const char *s, unsigned int base,
> +					      unsigned long long init,
> +					      unsigned long long *p,
> +					      size_t max_chars)
>  {
>  	unsigned long long res;
>  	unsigned int rv;
>  
> -	res = 0;
> +	res = init;
>  	rv = 0;
>  	while (max_chars--) {
>  		unsigned int c = *s;
> @@ -87,6 +79,27 @@ unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned lon
>  	return rv;
>  }
>  
> +/**
> + * _parse_integer_limit() - Convert integer string representation to an integer
> + *			    limiting the number of characters parsed.
> + * @s: The start of the string.
> + * @base: The number base to use.
> + * @p: Where to write the result of the conversion.
> + * @max_chars: Maximum amount of characters to consume.
> + *
> + * Convert non-negative integer string representation in explicitly given radix
> + * to an integer. A maximum of max_chars characters will be converted.
> + *
> + * Return: Number of characters consumed maybe or-ed with overflow bit.
> + *	   If overflow occurs, result integer (incorrect) is still returned.
> + */
> +noinline
> +unsigned int _parse_integer_limit(const char *s, unsigned int base,
> +				  unsigned long long *p, size_t max_chars)
> +{
> +	return _parse_integer_limit_init(s, base, 0, p, max_chars);
> +}
> +
>  noinline
>  unsigned int _parse_integer(const char *s, unsigned int base, unsigned long long *p)
>  {
> 


