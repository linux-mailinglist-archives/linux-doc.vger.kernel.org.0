Return-Path: <linux-doc+bounces-94405-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eztXCHA7RWrb8woAu9opvQ
	(envelope-from <linux-doc+bounces-94405-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 18:08:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 671906EF813
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 18:08:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CuRDbTH9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94405-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94405-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BA74301981F
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 16:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C401340682E;
	Wed,  1 Jul 2026 16:08:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B923451CF;
	Wed,  1 Jul 2026 16:08:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922092; cv=none; b=ceWiExLMZrUlurLrvBkPhF3WGdu8rohnTnLMy0AeXyZcBdwsv8w+0aeenRhjZuhtcM8oWI1mnkrOhAMxVARXKyT8yYDhCEACGJc/k+ZldXKTmdrLqii1aD60KpfHyP4mOAqCMuN/USqmdXuvHep1KTcoHp4xIhsHKloQPcaA7T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922092; c=relaxed/simple;
	bh=GaSKOyBYLfYB+eAJxyypOqkk/xNzs722ACszt6J6UiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avZp1Nqc0gRopsqzNDQqIzSlOOrLsMYQbCVZOLYXhFHeexeV3Y7BAVngBRsoRm04+PdWRnHjR7YPklqlJuJk1BlAvZEsTR3hTvzWDYaEk6+7aIAyxSNMtWPu8zozyN6LSOissWyGxXNewzuydiMGcZuCIZGUmL3pNF7u3Do8i0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuRDbTH9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673CF1F000E9;
	Wed,  1 Jul 2026 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782922091;
	bh=eYrWAKdwPbHbPLrL4wv1uPaPNKaEI0vQMV79ju55zNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CuRDbTH9jovQOUgb2bwRfbjuPL0WK3XYe9IOg4yc3lffTOI8OU4MSA1fHolHPjiBF
	 l3rZfwP3Ei9CdwdO3g2E1KYCHuKQKM7UOvU0POQClLtNfhFlKTQVnCDMYieRhH4Ner
	 wB7xKJeUwMAtDzlh5nNaoZ98AtGvqi3RgdDHE3hizqAtnE7elDigkQvJsLD/NX1+Ms
	 SvLgGLtIYGSRbX+bdlYoAnGdiThHMn30/7vcFngVjlwOvDZTPe4W/LFKPS9s0ThN88
	 EdNWlOpa3kYwkjiAu9xGesnDxVrH709yWz/yAyPqxVwWZQntCHuOq2v/fG78nEtxRi
	 47yugC+M4FhxA==
Date: Wed, 1 Jul 2026 17:08:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <70c1d2eb-a1ae-441c-91d4-1c5113b131aa@sirena.org.uk>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LoF85GzbnidZ//Vu"
Content-Disposition: inline
In-Reply-To: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
X-Cookie: Do unto others before they undo you.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94405-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 671906EF813


--LoF85GzbnidZ//Vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 05:54:48PM +0200, Christian Brauner wrote:

> And it reamins unclear to me what exactly we do get out of this detailed
> information: Do we want to run statistical analysis on what agent and
> model is used the most and publish that on LWN at some point?

IIRC it was literally this, have people mention which tools they used so
we can use that to inform our assessment of the patches.  I'm not sure
the differences we're actually seeing are tool based rather than
operator skill though.

--LoF85GzbnidZ//Vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFO2YACgkQJNaLcl1U
h9AqhAf/QMn6VvVhqzbxSsM4WdYRZ8E7RIGxyrLwcQd4khr7b4SqovCteJPEGlu8
qLH0WiQW8QF6+X6nBXDYu2qJ0ZpSY2dq1nh/HWAsI9Pt0mK7QEwd1TmqroiV2C9r
d5iIKcvNex/ZVwRN5ZWF6O1wp5jVX56HxkuJCq4ROcdZtUzXsU0mFUiVcYYKv2Oq
zbr/smkLE5LErwP7+fvsU+RF2p2765jZdYgL9wm+SMg+9sEkFNcieeTPn+XwgkoS
xfb1MfTX/IO+Ht58Ns73GFHbyMhJ5GSeVIiGLBhUCiWRnnFTDfoWZtskHWZDWi3L
IuhwMTwuZGlBQITvHzo7MW1uBEgX2A==
=yWSO
-----END PGP SIGNATURE-----

--LoF85GzbnidZ//Vu--

