Return-Path: <linux-doc+bounces-86027-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEF5IlsF+2mbVQMAu9opvQ
	(envelope-from <linux-doc+bounces-86027-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 11:09:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF324D85D7
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 11:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 075E0304BE7B
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2026 09:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2788B3E1D17;
	Wed,  6 May 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijUKn+El"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FD93DFC7B;
	Wed,  6 May 2026 09:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058387; cv=none; b=fuW6lAk3LVFanZyyWwu2ANhX5pq0rbR0Sea6J0a1hNYe4qtBNEXCiVTK+cWqQmxRGdS6nBEZ8ZB+vZblqPhJBQSSE6ghZHgh2OU+D86xahiyo5/8rCCVwg2nasQixSew8wBJqwTO0XXkoEvpLWeYP9LozFffO6r1aU/U0M/Drug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058387; c=relaxed/simple;
	bh=GABRbbhseVY5fpbfzplMTfXP9iVgDdxkQNIw1WYNLg4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=l6C5HL4hhcMj+NkFnlSCUJA0IczT5EqkDllxMEC4Oo3sjJL2Eo5qe8EVwnzClWngVGtr7ceyYJ+N+ySeKmnsNXBLpZ3WX0XJq9AzmDjywjDYr47dEKJtToDD8xtlx34N8UjnjJCsCNIzW/2SdkfBZlllJDfFumHbRtTbJU3ILlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijUKn+El; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB2DC2BCB8;
	Wed,  6 May 2026 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778058386;
	bh=GABRbbhseVY5fpbfzplMTfXP9iVgDdxkQNIw1WYNLg4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=ijUKn+El6I8DxFegJFWo0dJ7BX3zOT2jrEkofueVLsn99m3kjQ1Of/iYRiX3ybsPv
	 QEhbf+6uMkMDHHP5Lh+d5eFCY13uy5e+NxHuKPnoS6sBF9Wj6A26oXLOWcBUzjG2YH
	 wmN1Mbn15J+/eiDfbOXoPbASiGUpMRv26jDfYhbBuDFx3Qz2aWxRLuz++Y2WHmiYsi
	 RJ1sxVzMVsCWdb+s+EjsWSLkZS0WmUYS/IZqW6YiZp9FL9/dgLKfo+S22q5YctDOCX
	 a4GpLGgUjCWw0vVaA4MqAftdpz9QMiijCz2Uyb8S2+OkgBV2IejW+44P3v0fsTetEo
	 cIzpSXZF7pqUg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5359a88f7b0e3cf7b312e398a756181c345f5414e9c6c899c3e9b2ac54fb;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 06 May 2026 11:06:22 +0200
Message-Id: <DIBH3CCTRHPW.1J4LOJQAJ50XE@kernel.org>
Subject: Re: [PATCH v4 10/27] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Sean Anderson" <sean.anderson@linux.dev>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com> <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-10-833dab5e7288@bootlin.com> <2vxzbjet266g.fsf@kernel.org>
In-Reply-To: <2vxzbjet266g.fsf@kernel.org>
X-Rspamd-Queue-Id: DBF324D85D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86027-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

--5359a88f7b0e3cf7b312e398a756181c345f5414e9c6c899c3e9b2ac54fb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 5, 2026 at 6:05 PM CEST, Pratyush Yadav wrote:
> On Fri, Apr 03 2026, Miquel Raynal wrote:
>
>> There are many helpers already to either read and/or write SR and/or CR,
>> as well as sometimes check the returned values. In order to be able to
>> switch from a 1 byte status register to a 2 bytes status register while
>> keeping the same level of verification, let's introduce a new helper
>> that writes them both (atomically) and then reads them back (separated)
>> to compare the values.
>>
>> In case 2 bytes registers are not supported, we still have the usual
>> fallback available in the helper being exported to the rest of the core.
>>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> I'm confused. Doesn't spi_nor_write_16bit_sr_and_check() do the same
> thing? How are these two different?

So I've never come around to finish reviewing this series due to
personal reasons, but here are my remarks. Personally, I really
don't like all these multiple helpers doing almost the same thing.
But it is what is is for now.

Back when reviewing this series, I've digged into this and it mostly
evolve around how to enable the QE bit, that is defined in the 15th
SFDP DWORD. One could see how we could consolidate all the status
register handling in one function which are then called by the
different (specified) quad_enable helpers.

-michael

--5359a88f7b0e3cf7b312e398a756181c345f5414e9c6c899c3e9b2ac54fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCafsEjhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gGcAGA9DjU2OC+e/wedETHFWLEb9ldJfZuKhUQ
YO0OhCeqFre2dgwc7kLHRq2IN/tb9OxYAX9tmp9VRC/y+pPwnXutmYko/YemfEvF
4NJl8IKVWKaRNZbzYW5Fyunt1/wkK3IP7TA=
=s1/V
-----END PGP SIGNATURE-----

--5359a88f7b0e3cf7b312e398a756181c345f5414e9c6c899c3e9b2ac54fb--

