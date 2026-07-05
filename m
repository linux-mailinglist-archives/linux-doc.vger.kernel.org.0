Return-Path: <linux-doc+bounces-94994-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CysTMP1rSmo4CwEAu9opvQ
	(envelope-from <linux-doc+bounces-94994-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 05 Jul 2026 16:36:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE470A50C
	for <lists+linux-doc@lfdr.de>; Sun, 05 Jul 2026 16:36:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nEr2sd3z;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94994-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94994-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBC93300CE62
	for <lists+linux-doc@lfdr.de>; Sun,  5 Jul 2026 14:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E3634751F;
	Sun,  5 Jul 2026 14:36:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC323233938;
	Sun,  5 Jul 2026 14:36:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783262202; cv=none; b=WI5L3zRXLw2e2u1S7QzTxcQKwjSHN6U/pxRgLo/VhWMFyzBm7T1kGnjkA9hGhPzWwnoIUbgkgaTXWushKVkjOWDz2qQsPy1Vr4ZYHlZ0P3oMO/pIMqqNlQ+osNEeuuqTwhsiuJGGRNf5HYN2ziN6sM0OEvBXtGWQms/8jLyHgyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783262202; c=relaxed/simple;
	bh=eJ6cc+1shGQjpddnIvz+Ep+PRkYa0ZhICnQlhVxew0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaAB5071gQnfqGMsBasBon9Pl+uak2bJfgJsPPxi5nYbdPsRk0B/yN6GPCyZnxr0Ijdrei3gopMQlMWdHrrLL3m3r+c5ekyKv0C1LagtD4TngiIwc2V0EenZhlrznpB8pE24FfIaRLsxfFibWySJ5phY0/2CR0fPY5kZTA2FgnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEr2sd3z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF6C1F00A3F;
	Sun,  5 Jul 2026 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783262201;
	bh=+IDjOgvMZgIQmetcLrnnpwM1F1TovTt/ay9+vlVBx9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nEr2sd3zLoF5/BTzOLBehR/gZ+XtkN9iD2D+uHFYFKG+UJ8K2j71ODrygr5sKy1lt
	 z6ypXkTjFi7ksiVdP8bZ+BVjdG6v4esdT+yxndNyuobZod8lFBSztQNdTY3UNrIU8Y
	 pV2yvpW5IqOTPNbBpROMAO1tbomLeCMkWZFzQHBsoHV9f2diuB9dQsTDe6sP44OIBw
	 yItLWDbAmkotsklsKX23AZU+vJi2NTkcLqLFC/NjlmMRXuyFLnvxXn4Rcfixk/ni7k
	 78jEKGPmD/E5Unr6XRU8NKGnuC1pqIbvSe5aEcAwIR76cm8/2r1NifxZTg4zTYDiA4
	 RqzPoE8N5RUtA==
Date: Sun, 5 Jul 2026 15:36:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, linux@roeck-us.net,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, avifishman70@gmail.com,
	tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, corbet@lwn.net, skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: Re: [PATCH v3 1/3] dt-bindings: watchdog: npcm: add GCR syscon
 property
Message-ID: <20260705-gruffly-curing-ae3ab1044a94@spud>
References: <20260705140100.1543486-1-tmaimon77@gmail.com>
 <20260705140100.1543486-2-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UuJ/2UbYFy531ONn"
Content-Disposition: inline
In-Reply-To: <20260705140100.1543486-2-tmaimon77@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tmaimon77@gmail.com,m:andrew@codeconstruct.com.au,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joel@jms.id.au,m:krzk@kernel.org,m:conor@kernel.org,m:taliperry1@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94994-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,linux-watchdog.org,roeck-us.net,kernel.org,lists.ozlabs.org,vger.kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,jms.id.au];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15DE470A50C

--UuJ/2UbYFy531ONn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 05, 2026 at 05:00:58PM +0300, Tomer Maimon wrote:
> NPCM750 and NPCM845 latch watchdog reset indications in the SoC
> GCR block rather than in the watchdog block itself.
>=20
> Add the optional nuvoton,sysgcr phandle so watchdog nodes can
> reference the shared GCR reset-status registers that hold those
> latched watchdog reset indications.
>=20
> This is needed by the following reset-status support, which reads
> those latches and reports watchdog-caused resets through bootstatus.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Since the 450 doesn't support this, please make it conditional.
pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-w=
dt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.ya=
ml
> index 7aa30f5b5c49..99c225f166db 100644
> --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> @@ -40,6 +40,12 @@ properties:
>    clock-frequency:
>      description: Frequency in Hz of the clock that drives the NPCM timer.
> =20
> +  nuvoton,sysgcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      a phandle to access the GCR reset-status registers that latch
> +      watchdog reset indications on NPCM750 and NPCM845.
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.34.1
>=20

--UuJ/2UbYFy531ONn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakpr8AAKCRB4tDGHoIJi
0jzXAP9V+LH1kp6iYX1iEVWw/AAWNuNW+o54gflPkE8U5Q8X3AD+I57wifDzW5ES
KiTAcjkS45d13+QxSzYtdn2yBkuizg0=
=coSg
-----END PGP SIGNATURE-----

--UuJ/2UbYFy531ONn--

