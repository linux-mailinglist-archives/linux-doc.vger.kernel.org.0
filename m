Return-Path: <linux-doc+bounces-81192-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIQDMcvnw2lvugQAu9opvQ
	(envelope-from <linux-doc+bounces-81192-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 14:48:59 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 670DD3261A1
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 14:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83E6F31CFEE4
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 13:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071993D6CB7;
	Wed, 25 Mar 2026 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkJ7MeTn"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E8E3D6CA2;
	Wed, 25 Mar 2026 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443928; cv=none; b=N2ov3frw8Fjh958Q6z7i29mNT5MOv9Re0vS2QQtKKh/68BE/dxTp/KQtddpFc1T+aLF5pycWeZcY5QnzuW2pHkzRkqtz4NAQ91e+lH3wnyT9OO9f3U3k2lhoY7qNR5/EeM9jsaNp1W1amtfCWbBkBnStKmOVZuTI27ZRdlfjK6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443928; c=relaxed/simple;
	bh=aPMGk3jADcln8q+CeQZg3ofpMsUR6G6YPb/JjSH675o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NExtRUK9u2iwLoSiBVuJi5a0iYd1nRJzgytPoKy3MrS4KuOROQ/b/k2kzQV6XODmGGKPG7NBilP4wMkYyVUD5F1/yIousVX8kwjkmSt3f+NZjn3yOCfpuB4tnQ9tNnumODWBOD11iQuImogyaK4vJbK85cVPP6e3uBXCrr1bz7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkJ7MeTn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FABC4CEF7;
	Wed, 25 Mar 2026 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774443928;
	bh=aPMGk3jADcln8q+CeQZg3ofpMsUR6G6YPb/JjSH675o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkJ7MeTntxruIL7nO+EPdKYTYxw8SpxdkjEkM7l1A6XCC4fnHaHbYhYDKyFMNW7Du
	 Kz/YLyPVsNNbgDditw8AhEQA1mQ4/RZcDzp+/NzHuiNvvSH7CDqP2Kjc7aqjYMDkjG
	 dVdwu7s6FFBCdXWXg4W9mUlnNhcvEuhfSJEf0tchoCRvUmT+QCHaao2HOxDbF0p2kx
	 xV5ASeLropsHONR+RMEc+IYr5sLgTeMtVfGf90eGWeF75S+xpO8CUstpYLdXNdnXx8
	 bXy1d51lz72sLtmWF7I1xOfRU5IkaUDWHBNmFzFPiOlcYxnx1KUynWw89XisiKXg8c
	 PZoIAg8xb+TUQ==
Date: Wed, 25 Mar 2026 14:05:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
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
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Andri Yngvason <andri@yngvason.is>, 
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
Message-ID: <20260325-quaint-bull-of-fortitude-dc68da@houat>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
 <20260324-color-format-v11-3-605559af4fb4@collabora.com>
 <CAPY8ntB9f_=f5kru=8w9BpTuqQR+93maGpT61EKU28Uay2vq8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qhd22dcfmqbzbfkk"
Content-Disposition: inline
In-Reply-To: <CAPY8ntB9f_=f5kru=8w9BpTuqQR+93maGpT61EKU28Uay2vq8Q@mail.gmail.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81192-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FREEMAIL_CC(0.00)[collabora.com,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,tuxedocomputers.com,yngvason.is];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 670DD3261A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qhd22dcfmqbzbfkk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 03/22] drm: Add new general DRM property "color
 format"
MIME-Version: 1.0

Hi Dave,

On Wed, Mar 25, 2026 at 12:49:19PM +0000, Dave Stevenson wrote:
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index af8b92d2d5b7..bd549f912b76 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -571,14 +571,102 @@ enum drm_colorspace {
> >   *   YCbCr 4:2:2 output format (ie. with horizontal subsampling)
> >   * @DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> >   *   YCbCr 4:2:0 output format (ie. with horizontal and vertical subsa=
mpling)
> > + * @DRM_OUTPUT_COLOR_FORMAT_COUNT:
> > + *   Number of valid output color format values in this enum
> >   */
> >  enum drm_output_color_format {
> >         DRM_OUTPUT_COLOR_FORMAT_RGB444 =3D 0,
> >         DRM_OUTPUT_COLOR_FORMAT_YCBCR444,
> >         DRM_OUTPUT_COLOR_FORMAT_YCBCR422,
> >         DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> > +       DRM_OUTPUT_COLOR_FORMAT_COUNT,
> >  };
> >
> > +/**
> > + * enum drm_connector_color_format - Connector Color Format Request
> > + *
> > + * This enum, unlike &enum drm_output_color_format, is used to specify=
 requests
> > + * for a specific color format on a connector through the DRM "color f=
ormat"
> > + * property. The difference is that it has an "AUTO" value to specify =
that
> > + * no specific choice has been made.
> > + */
> > +enum drm_connector_color_format {
> > +       /**
> > +        * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display prot=
ocol
> > +        * helpers should pick a suitable color format. All implementat=
ions of a
> > +        * specific display protocol must behave the same way with "AUT=
O", but
> > +        * different display protocols do not necessarily have the same=
 "AUTO"
> > +        * semantics.
> > +        *
> > +        * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if=
 the
> > +        * bandwidth required for full-scale RGB is not available, or t=
he mode
> > +        * is YCbCr 4:2:0-only, as long as the mode and output both sup=
port
> > +        * YCbCr 4:2:0.
>=20
> Is there a reason you propose dropping back to YCbCr 4:2:0 without
> trying YCbCr 4:2:2 first? Minimising the subsampling is surely
> beneficial, and vc4 for one can do 4:2:2 but not 4:2:0.

The "auto" behaviour is strictly identical to the one we have right now,
and this one stems from i915. Back when all that logic was added, it was
decided to align every driver behavior on i915 because that's what most
compositors would expect.

Maxime

--qhd22dcfmqbzbfkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCacPdkQAKCRAnX84Zoj2+
drHtAYC+DuxgXCLhzVadFK3jmqH9FyaN19FHcokHPX07HgOJboZMiAKov3in7JDx
F2EVeaMBgOWXIimrG0/rhUteUiveBwgDmRTdeGj5T51fN1DLKTsNYPFR1cW+9rGb
iF4j/QhIQQ==
=of9f
-----END PGP SIGNATURE-----

--qhd22dcfmqbzbfkk--

