Return-Path: <linux-doc+bounces-95193-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IPVODEf3S2oudwEAu9opvQ
	(envelope-from <linux-doc+bounces-95193-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:43:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 869CD7149DF
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:43:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NtQ6dmxq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95193-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95193-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26C05338BE50
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 16:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C19438460;
	Mon,  6 Jul 2026 16:57:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529BE435A9B;
	Mon,  6 Jul 2026 16:57:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357038; cv=none; b=kgV0jM8GLz31JnKuRSFHY7jjLK3hHTcKOoX39trY5XgJEOHYZv99jxLNarsjz/NS+4/GvPGOoQuO3DdnjaLhxsXigQ74IFcLwpu91EBJT/BeFdBWq9HQV1t5VSfjB1T+7nAQt1rL4OAXv401I8VEzJyEJ4N90tGFP5apdDoPRz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357038; c=relaxed/simple;
	bh=CV9D6fJM5vfq9UhvyjVV+ncTZTIz/gR5q15lfevzvkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ptp0x/XhJ+DivKBO8AAuBKelgxp0d+SJqw6wO1vK7sNl7nILIi8HHNBlwh/bpWNAz3fXDyrYz1fKF95WbnVXHFzY2Tz1S+qSLWRRrzlF391fo+SXbhrTOAJOy82MFCPftL0/wDQFsqb47SNIktWKfF7I09dH9rCz36ZD5LTxmqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtQ6dmxq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3AE1F00AC4;
	Mon,  6 Jul 2026 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357032;
	bh=CV9D6fJM5vfq9UhvyjVV+ncTZTIz/gR5q15lfevzvkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NtQ6dmxq8WhA0sy36y+sGDdk9I9AEeOuqedIPC/gWAu0i9lNTY46g5VDDP7gQpw1e
	 FmLSJSJcoYCWd/Fy0Lu3RAM5Rvw5Mfl7urBdBIzwgEP5rflOkIA8l1TMbGmuXYCM6i
	 ux8LZ5vQ0Itf2dT3kaS8726/BYkDd11DUEp7nEEDleZC3arz+hZtuVlaKLKKW1vvIx
	 +geNUP3mW6Mb8nBlx4ffSOsGftSphyj5WPO1OiQ3Ksa7w5RO63ft7tU6hC/0d4nbdL
	 miPrwYTp+d+ytcdo/+2YzXCMNcgIqj0ZzaK4Ah6mpfF+EBcPII2pcFH92xa/o9BAYL
	 X+Hq3h7R6+bAQ==
Date: Mon, 6 Jul 2026 17:57:06 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: watchdog: npcm: add GCR syscon
 property
Message-ID: <20260706-conjure-reptilian-616a34467c90@spud>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-2-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m6LAigrkJlf45dSi"
Content-Disposition: inline
In-Reply-To: <20260706144828.3517631-2-tmaimon77@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-95193-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,spud:mid,vger.kernel.org:from_smtp,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 869CD7149DF

--m6LAigrkJlf45dSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--m6LAigrkJlf45dSi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakveYgAKCRB4tDGHoIJi
0nw2AQCCSIgI/DvjYrlSHivtEkbwp491JIgduD4sSQx+rkYfJAEA0JOpdp1n27CZ
DSb+D92qQ0NSkgIqyW8oQcGHySK4yQY=
=bWTG
-----END PGP SIGNATURE-----

--m6LAigrkJlf45dSi--

