Return-Path: <linux-doc+bounces-80395-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC8jCimCvWk4+gIAu9opvQ
	(envelope-from <linux-doc+bounces-80395-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 18:21:45 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 811F92DE810
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 18:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C66E831763CE
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 17:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16353CF66D;
	Fri, 20 Mar 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKTi1u9N"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD02361DC3;
	Fri, 20 Mar 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774026897; cv=none; b=Ov5JmQqu8dsMq2fFbtMNTix4+VoIAXnzF1QsCvsQU4Yyt7q9qJusMlgWY2jjGeDZMYaIuqNfkB4OVGPFGANpfBGy0hfwURnbBIW6zVFAq3Awenp6pyfLrVYwMrRLOe63MIs399T4gKHKmcw0VgnLARqspD9Ftws5GuxxJZSlfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774026897; c=relaxed/simple;
	bh=MqgKTfip+nRILxJnhrg/eh79SR01kCItoSi2X6WQf54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUhiEGCjj4X8+T5UEVMcBQJDlrZugRDCqKsTJruCW0Assdrlx1Gbj+uUJSrKvxST/BaEpQBk8ePFl+DAWwTAIwq8lPj+kAQfvVlBvME/B9E3V0esisK2GwgdrZt8UMC3f8WJrzV4PxX17xXEwUvN9CUD6VT2zBUhY0RC+4iwe2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKTi1u9N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580D7C4CEF7;
	Fri, 20 Mar 2026 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774026897;
	bh=MqgKTfip+nRILxJnhrg/eh79SR01kCItoSi2X6WQf54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKTi1u9NyiIkcVR7MNfsEtRE0yMegJBJlNcf9Kc2SP7PgJhFiBgm56FVLhGeHbSVW
	 lju/VNlPyNv2fRNhWmuBVbneFx0SW3KzDXjKuOqt4yafQRVCpTD4QmAmFcJOpPXSeb
	 Q+qh8/VKkcp1kafUznTNGCGYz/usJIjMdEqLCJYsNL8yL5BsAiOD0g+7IFaUrPOzmI
	 jEq3A57SEe4U+apU6tp72iSksL2wKdL2j2hXh0ny0DzRZvl50rlkHJTMoi3i3wjMjM
	 +UMzABjIpjXTtIaz+UlDVTyKxKQLirR6yTu1IwkMMZ412avp4ndbCgU9PP1j0E6ewL
	 vv7Qzstdk4MeQ==
Date: Fri, 20 Mar 2026 17:14:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH RFC v2 1/9] dt-bindings: iio: frequency: add ad9910
Message-ID: <20260320-utensil-estate-ea3af0d8a623@spud>
References: <20260318-ad9910-iio-driver-v2-0-e79f93becf11@analog.com>
 <20260318-ad9910-iio-driver-v2-1-e79f93becf11@analog.com>
 <20260319-annex-varying-afbddcb825b7@spud>
 <zi7ifl45h5fu76rlbdubkeq7wa7gtve5wsdruo574gzj5qbfu6@fl6rh3soaj74>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="llXdvqq1rnlyMPfA"
Content-Disposition: inline
In-Reply-To: <zi7ifl45h5fu76rlbdubkeq7wa7gtve5wsdruo574gzj5qbfu6@fl6rh3soaj74>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80395-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 811F92DE810
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--llXdvqq1rnlyMPfA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 11:21:37AM +0000, Rodrigo Alencar wrote:
> On 26/03/19 05:25PM, Conor Dooley wrote:
> > On Wed, Mar 18, 2026 at 05:56:01PM +0000, Rodrigo Alencar via B4 Relay =
wrote:
> > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > >=20
> > > DT-bindings for AD9910, a 1 GSPS DDS with 14-bit DAC. It includes
> > > configurations for clocks, DAC current, reset and basic GPIO control.
> > >=20
> > > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
>=20
> ...
>=20
> > > +
> > > +  clock-names:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: ref_clk
> >=20
> > s/_clk//, not like it can be anything else!
> >=20
> > > +      - items:
> > > +          - const: ref_clk
> > > +          - const: sync_in
> > > +
> > > +  '#clock-cells':
> > > +    const: 1
> > > +
> > > +  clock-output-names:
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +    items:
> > > +      enum: [ sync_clk, pdclk, sync_out ]
> >=20
> > I'd say same here, but then you've got some issues with differentiation,
> > so idk.
>=20
> so I've got the names as they are referred in the device pins in the data=
sheet

Coming back to this one, ye I think it just is less confusing to keep
the _clk ultimately. This looks good then, I think, modulo the RFC-state
of the series.

--llXdvqq1rnlyMPfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCab2AiAAKCRB4tDGHoIJi
0hYsAP9f0vICL+gupvDNZvqA96BX/JRiLZWKrkGxlflMa+834wD+Nk37ojRccRUz
RyAKw64JtEmI5hcC3LvRUaeUQUd6cwo=
=7Q/R
-----END PGP SIGNATURE-----

--llXdvqq1rnlyMPfA--

