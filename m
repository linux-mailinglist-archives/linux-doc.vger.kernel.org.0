Return-Path: <linux-doc+bounces-91762-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8GhiNmOyKGomIQMAu9opvQ
	(envelope-from <linux-doc+bounces-91762-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 02:40:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0FF664FF4
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 02:40:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=j9mz7dvC;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91762-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91762-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22ADF3079FDB
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 00:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AB214A60F;
	Wed, 10 Jun 2026 00:36:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE0335BA;
	Wed, 10 Jun 2026 00:36:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781051779; cv=none; b=d5y1hQ+6NZEslrzkoz7dV8n61yREIrQzEazw7QxviUGJlEU6BNwIzgvS3TZox8QpDmNxagPh7C34nhIwLEBPrfOBaGXxJY987xjYlq7nce28ZxULUGzMPdA23Y8YDPMcBdCTWIvVybC6tC9RygpVfdlSUDqrPP4qqFM8KURCnCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781051779; c=relaxed/simple;
	bh=CDuCLDL5z910qKUNbSYxMd0zz/vk1MGVtnZ91arSK4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5s8Q8TKMFfsaRhs2suGIQiLDFcinA5KuIDQaViZQXTzqcEJx/K3gq3vaXmyBqCraSwL81y7sQby8LnBesphCNsONWYEkJWEfX5+rIqurnsZCgRwX8T2vyHiRXdV2aa7tgLYOji4Xr7VqBVDS8QLYdRtL4NiR2VCpfL1myqoliI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j9mz7dvC; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=X9n+0/2jd89hYZG+x6Z3Dpoobfrn1nZ5zeUbeSx3hCw=; b=j9mz7dvCX6XXnUEMqa5mEe6/un
	sem8Q8LwP1PPx1cyxKmANwMMkRBVB0nf4hcrukcxTDktIsJI8IQ5X/uCBsv+GqfBFVjOEaFT/5N5c
	hlsXEugZYU6Ku62pcfltcZqussh1EhKCXXAaF9FnYXQzB17KN5OKp4MVVb9asICvCq/vJ2fvRPUiV
	BPswfVPWoqX5z8Hc4ZW6gQ1N3oBZLHAtyQgA2KXRDRRo85MLtTkLSgu/YDwzSZz5dU1UphPqC28dM
	RWYs47/tC/MaYPZ6QagEY133KK76R9v/7Tl86RvA4far3BUXC93Dwgmr5v53OQChN2sdRdFdvypZx
	B7O3gipg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6vW-00000006Ymp-0Sp0;
	Wed, 10 Jun 2026 00:36:14 +0000
Message-ID: <5477c02f-ee84-4166-9025-c0df914bde03@infradead.org>
Date: Tue, 9 Jun 2026 17:36:13 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pnp: Documentation improvements
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609145117.1355753-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260609145117.1355753-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:rafael@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-91762-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E0FF664FF4



On 6/9/26 7:51 AM, Uwe Kleine-König (The Capable Hub) wrote:
>  - Consistently use named initializers and simplify sentinel
>  - Skip assignment to .driver_data if all are 0
>  - Use consistent spacing to match Linux coding style
>  - Fix prototype of probe function
>  - s/pnp_id/pnp_device_id/
>  - Drop non-existing .card_id_table
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

LGTM. Thanks.
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

The only issue I have with this file following this patch is
the use of "ex" for "Example" or "E.g.".


> ---
>  Documentation/admin-guide/pnp.rst | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pnp.rst b/Documentation/admin-guide/pnp.rst
> index 24d80e3eb309..14a0bf400d2d 100644
> --- a/Documentation/admin-guide/pnp.rst
> +++ b/Documentation/admin-guide/pnp.rst
> @@ -203,12 +203,12 @@ The New Way
>  
>     ex::
>  
> -	static const struct pnp_id pnp_dev_table[] = {
> +	static const struct pnp_device_id pnp_dev_table[] = {
>  		/* Standard LPT Printer Port */
> -		{.id = "PNP0400", .driver_data = 0},
> +		{ .id = "PNP0400" },
>  		/* ECP Printer Port */
> -		{.id = "PNP0401", .driver_data = 0},
> -		{.id = ""}
> +		{ .id = "PNP0401" },
> +		{ }
>  	};
>  
>     Please note that the character 'X' can be used as a wild card in the function
> @@ -217,14 +217,14 @@ The New Way
>     ex::
>  
>  	/* Unknown PnP modems */
> -	{	"PNPCXXX",		UNKNOWN_DEV	},
> +	{ .id = "PNPCXXX", .driver_data = UNKNOWN_DEV },
>  
>     Supported PnP card IDs can optionally be defined.
>     ex::
>  
> -	static const struct pnp_id pnp_card_table[] = {
> -		{	"ANYDEVS",		0	},
> -		{	"",			0	}
> +	static const struct pnp_device_id pnp_card_table[] = {
> +		{ .id = "ANYDEVS" },
> +		{ }
>  	};
>  
>  2. Optionally define probe and remove functions.  It may make sense not to
> @@ -234,14 +234,13 @@ The New Way
>     ex::
>  
>  	static int
> -	serial_pnp_probe(struct pnp_dev * dev, const struct pnp_id *card_id, const
> -			struct pnp_id *dev_id)
> +	serial_pnp_probe(struct pnp_dev *dev, const struct pnp_device_id *dev_id)
>  	{
>  	. . .
>  
>     ex::
>  
> -	static void serial_pnp_remove(struct pnp_dev * dev)
> +	static void serial_pnp_remove(struct pnp_dev *dev)
>  	{
>  	. . .
>  
> @@ -253,7 +252,6 @@ The New Way
>  
>  	static struct pnp_driver serial_pnp_driver = {
>  		.name		= "serial",
> -		.card_id_table	= pnp_card_table,
>  		.id_table	= pnp_dev_table,
>  		.probe		= serial_pnp_probe,
>  		.remove		= serial_pnp_remove,
> 
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72

-- 
~Randy

