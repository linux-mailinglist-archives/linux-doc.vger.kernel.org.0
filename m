Return-Path: <linux-doc+bounces-75782-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NoBZGA1Wi2lFUAAAu9opvQ
	(envelope-from <linux-doc+bounces-75782-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 17:00:13 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B547B11CDE9
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 17:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E801301D07B
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 16:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A469838737C;
	Tue, 10 Feb 2026 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMyQYHYN"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8179638756A;
	Tue, 10 Feb 2026 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739208; cv=none; b=RffWzZVnxQ8JR/lTy7UmbO2JVq9lCm6ahtUfp57ys+po+jO+OfrDvxS1UK6M8B+w60mNiNAT59uIBmw/TfRkhLwElflzJo3Hezgd9JzpyVcdshbBjZNapSr0eva+witLpqIFaBP81Ku07KzYg49uJNtFcK+CwTIZD+AWaKmWhUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739208; c=relaxed/simple;
	bh=zldcbNbjmj+RA7A3DZ3ZkdfjMPm277Yz7u9u9p4QqjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cryjii3hOOBqY2EVhQD+BjSu2c6LH00PHR/MqO6fuhBKT5/bY0kRO8wjuGGz+TS/IAGRKUgp/UPMb/mhYpK3vCeiuCYruS0jK91ChkXkXLmi+Z43DDZdLUwsco4G/nOXhpVAZdrr91TQC0fy2szewdO41Jc5jjYAsQNqDTRw+qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMyQYHYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A011C116C6;
	Tue, 10 Feb 2026 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770739208;
	bh=zldcbNbjmj+RA7A3DZ3ZkdfjMPm277Yz7u9u9p4QqjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RMyQYHYNpszMSJqmidkGX2NoEYtO7xOazdfZO2Q5iGJNTMCgJ+znXKLHV3wU+w5mU
	 81P544GiPydpylxVo/SCUj9yY6feDstrxgJOuMw/pWJJz9ndZsgEC2zR4EHbObdpi4
	 pfHL1KTzKa1NeezI3wv7aGc81F9plh/aKvv2RW9s5nFZ6rCp0yQ9DhjqSHhHQUn6L/
	 vVP41AcOWSjY2uwX18XpLxfND6DbM5L4o9zj0y/UV6PtcPdBVM3ih+N1X0kYONwg9e
	 3ymEssncp804w6MMxkU2DI6GfIPLf5S0gp9wgoKnhCAqL5W9wEcjZ0WXGGTtj4CcEz
	 EB95D+CLtTCiQ==
Date: Tue, 10 Feb 2026 17:00:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 20/22] drm/tests: edid: Add __maybe_unused attribute
 to EDID definitions
Message-ID: <20260210-didactic-okapi-of-modernism-ff00d9@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-20-ef790dae780c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="km3cw6v2t5aytgoz"
Content-Disposition: inline
In-Reply-To: <20260121-color-format-v7-20-ef790dae780c@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75782-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B547B11CDE9
X-Rspamd-Action: no action


--km3cw6v2t5aytgoz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 20/22] drm/tests: edid: Add __maybe_unused attribute
 to EDID definitions
MIME-Version: 1.0

Hi,

On Wed, Jan 21, 2026 at 03:45:27PM +0100, Nicolas Frattaroli wrote:
> It's normal for a test suite to need an EDID, but not all EDIDs across
> every test. Silence compiler warnings caused by unused definitions by
> using the appropriate attribute.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

It's not clear to me when the EDIDs could be compiled but the tests
wouldn't, and as far as I know it's all part of the same module.
Expanding a bit on how you can trigger that warning would be great.

With that fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--km3cw6v2t5aytgoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYtWAAAKCRAnX84Zoj2+
dt2nAX0UsXzuusEYCVBCqgJwtZ264lcQWo9yWUlALQWTVuR932yQyPhy8y6N7uQn
emUBNQgBf2NvmzdJa+lE7RXY5eWBX5awNF8H76g5vlBxZXvOQkVir9drD30JTaPa
AhXIei7HvQ==
=9Hue
-----END PGP SIGNATURE-----

--km3cw6v2t5aytgoz--

