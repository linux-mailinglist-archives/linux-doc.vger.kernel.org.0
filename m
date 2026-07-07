Return-Path: <linux-doc+bounces-95410-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sK7RJ80lTWpLvwEAu9opvQ
	(envelope-from <linux-doc+bounces-95410-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:14:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CA71DB71
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:14:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="MG1lP1W/";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95410-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95410-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1169630164B1
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 16:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0427432BC1;
	Tue,  7 Jul 2026 16:11:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF8D3E5A2F;
	Tue,  7 Jul 2026 16:11:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440704; cv=none; b=tS6RVMiuHIJ74zLSua/GSCtx5QrwR2TPxbQEvGcxlG+essw+nENuPJ/EWst8OMZ1IaWJiiJdhFomYrI148kdjqN+yGDJHmaF65EB7cn0kkkcksAwKlfVhiga10IB8OTvY9mQY12c6zPXVimNNkZMxBU5o8S85iOn5X8+aX0PqHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440704; c=relaxed/simple;
	bh=j4QRAqlphOVdxlFtfWuqnxqYr3ZFc1O57I0+MMovv4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qf5OG3YZV8TuoRKBOaFRxyKY5IQ94a2bj+JUEznY5QS4mCumUnyF+GuX4Uf8bZq+WD6nwj07p3aKFvIfaoXgAqtjsvfvQYz9NTbqz9FXxBpVLYMDCK7fPW8LRCo9/Wb/EtyORsUbWJOwpeR4ykXvKCzgNiwUA+nDVSpOfIcQplw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MG1lP1W/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBA31F000E9;
	Tue,  7 Jul 2026 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440703;
	bh=6kfZL1bZ61XpWYYJGI0POi3WJq/TiN8givamjNPrHAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MG1lP1W/7uLLeA0rkDghFWu342eAzwAshaZeHgtEZEhDlQkU07rHc1Qj1VcanOwzl
	 yd2TRQjq8RekF5lNl8lJZXBZlEL25v/GwClTDLpI6nlvdS2biAtBeKDqDHItyRPR9c
	 dzVbkPd4za7tuZsAWdDgDmw9Om2K3edWcg1lQmGteIN0wRS5rQZFIgtHHYMwnPFrAx
	 tnaWIlc1wccBs/php+aO7E9zwUClYYN1f6N+XrHn83cyVNBRr9McBKqs+oYCX4340a
	 dQ79VsNNllu4H4dxYNPC4RfbIXsqYfCnCu82e5TAMn4qGLNn1uun0e5Xy1nfr22gbB
	 Tv3J2kvmdM7SA==
Date: Tue, 7 Jul 2026 17:11:37 +0100
From: Conor Dooley <conor@kernel.org>
To: rodrigo.alencar@analog.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v7 09/17] dt-bindings: iio: frequency: add ad9910
Message-ID: <20260707-frays-backtrack-2de75efdf7be@spud>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
 <20260707-ad9910-iio-driver-v7-9-a4ec30f63700@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/httJea6x0BUcb5z"
Content-Disposition: inline
In-Reply-To: <20260707-ad9910-iio-driver-v7-9-a4ec30f63700@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95410-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,spud:mid,microchip.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F37CA71DB71

--/httJea6x0BUcb5z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2026 at 03:04:30PM +0100, Rodrigo Alencar via B4 Relay wrote:
> +  adi,pll-enable:
> +    type: boolean
> +    description:
> +      Indicates that a loop filter is connected and the internal PLL is enabled.

Is this wording correct? Does the PLL come on automatically or is it
turned on by hardware? If the property means that the driver must turn
on the PLL, the wording should be adjusted.

Otherwise, I think this looks okay.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +      Often used when the reference clock is provided by a crystal or by a
> +      single-ended on-board oscillator.

--/httJea6x0BUcb5z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0lOQAKCRB4tDGHoIJi
0qANAP9Uk92hW2LOjGog5MGOFzrayer8+G7MEwUnHeEprda1hAEA7JV6ox+YpaU5
0qAb0GHK6iBPbQnP0wV/dBrA1CaH/go=
=aVDG
-----END PGP SIGNATURE-----

--/httJea6x0BUcb5z--

