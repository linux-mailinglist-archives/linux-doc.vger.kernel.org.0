Return-Path: <linux-doc+bounces-94635-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SN3NFTyGRmpcXwsAu9opvQ
	(envelope-from <linux-doc+bounces-94635-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:39:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CF46F986A
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:39:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kHlhXQYH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94635-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94635-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 41D8530067B9
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 15:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F31E37A85D;
	Thu,  2 Jul 2026 15:38:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C3A37A847;
	Thu,  2 Jul 2026 15:38:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783006726; cv=none; b=aZJQguwyQ6iMyiH6j8Yg6wX46Xi7PWWrwAJg9L2UbbSYz0rRm/5NrwqgG0TdwBnw/N/b327SlzsVjIS6tbdRA3Oa+8cde1jmHJ6oQ7KR8TIK88bQ4w8kG5crEe6NxFn8VLISelAU7Q2qlkV9W0ekuOLapglgA+akIB/iIQDlT9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783006726; c=relaxed/simple;
	bh=jrjnIDRd4Bktw+OR/2nGZT63W61+wt9F3alKaZ8W/OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6rDMlr7axRuzGmth/yhWB0RJvXz7CcTjWy5sRDx1O8LlM+nr5+m8a7PBFsP8/qB/Yjcx/DUT1crevzaQoXWNWTMN2d3zD2zXgQCjiqLm4RkcNBZoJwysbTL9gTfEpA8UjFfmrZoOjT9wxSIhh1RHSJYu4WBODI1WjeUVrenSlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHlhXQYH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7391F000E9;
	Thu,  2 Jul 2026 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006724;
	bh=gnP9BAFcBr8YepGSjigXPELQUSougD4kTqP9JAMV/ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kHlhXQYH0GjrVMC1tAgUsYs9fyR1QjM2zIIXfYqfpLr3ai15VbK4NWNzds7hq6U4I
	 WHkDLushfZAiOiRZwMjwMr3Mku+oFHAlG45XMUxOl0UO8jjXpuX5lv169Todzj1e9h
	 Df9zHgrdLPUKcIArJ8egVDAVC15BDrfgmlMZKhngo2Knjpe4sGKIC+kXn6nHgc8Qh1
	 +sWq85EZRWtt8bxDfRvHAy1zyt1hVqbvk7/1PgxijvvUwFhuWJvS2jOaqOZ76v/Agc
	 voORsSPR+7dCIgFkWGjrXkDtmmJohvh12bSK5hIhhOuum+BIjO7gqvIDKh3S97bxmL
	 UBRCMlO/11XUw==
Date: Thu, 2 Jul 2026 16:38:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: Sort registers in cpu-feature-registers.rst
Message-ID: <af54a933-f6c3-4786-a9a2-de679fa8d2be@sirena.org.uk>
References: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
 <20260522-arm64-cpu-ftr-regs-v1-3-19775b40faf0@kernel.org>
 <akaCJvZkdqigcQUZ@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P9JGLlGwTUGfsf3d"
Content-Disposition: inline
In-Reply-To: <akaCJvZkdqigcQUZ@arm.com>
X-Cookie: Reactor error - core dumped!
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94635-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peter.maydell@linaro.org,m:joey.gouly@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8CF46F986A


--P9JGLlGwTUGfsf3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2026 at 04:22:14PM +0100, Catalin Marinas wrote:

> The patch is fine but I just realised that we are really inconsistent
> with the non-visible things. We exposed a few hear, I guess in the early
> days, and then we stopped, just adding the occasional visible fields.

> Shall we drop the 'visible' column altogether and only document the
> visible fields here?

Yeah, I was struggling to understand the logic and would certainly
prefer to not have to type in every single bitfield in yet another
location.  I'll add a patch on top that does as you suggest, see if
anyone objects.

--P9JGLlGwTUGfsf3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGhf8ACgkQJNaLcl1U
h9C8SAf9E5KA5iSqdivlp96tse489VUFmODlF8XFNkfYBRH8kzOUXLteEaC6JLzm
wFF3CFAPVDwg1PSbY4wkgDoEdadpOou0L842z2zDjys1twMfeXK5gWY+wvNm4iQK
kiNW1OSaV4D4GirwPome2nswvkeTIfyxcYXcmzhAU2nPtFgzAndHycLm8AUs6daL
W2WsdJiwCFrvoNWKiLl/RjNDoSUM8ycGy882zcGJYnid1TIAhx0jXyQpABQMlNKy
MtSKq/c3TRPbUGmCl0Ut3cgiUa7XQ+actK18NJH9RfwowhOTHbhg+hbXUS+AoWG6
rz3p4wMc3FqUWGiDFUV49Bu/QVeuCg==
=GLCj
-----END PGP SIGNATURE-----

--P9JGLlGwTUGfsf3d--

