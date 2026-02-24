Return-Path: <linux-doc+bounces-76803-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLzfJiS4nWnERQQAu9opvQ
	(envelope-from <linux-doc+bounces-76803-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 15:39:32 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D673C1887B4
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 15:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1D9A3060B09
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 14:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C9738BF60;
	Tue, 24 Feb 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAJxolvt"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0D3803DE;
	Tue, 24 Feb 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771943969; cv=none; b=WEmr7YTHTnVvXLy+0UlvgudwnLvi/RGcZpF0cOnUmYfzFIoTDZ0tboswzqhpPb0ZdPEz9j+r8J16Wr5gxDrBukemAzrQgJkJr0Uy90HiAeT7NyM37TsYFosAZAViGow+gE2ghgEalzp7EXplhyDGCWy1Rt249Aj8oW90nfSleXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771943969; c=relaxed/simple;
	bh=jbaKWZqPk0Xh/pen8bNFDJZDvsXaHthkW4x5LB2hfwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8ntiZN+n182XtvnyTjfP60g3DDQSAWjZuRgxnkvA5HUDOkBJwyc+t/nzzPBd7TA2SCEV4fJ/MFLKYL7Qs8Tl2igT3rW+yFlylzZQKW2aBIai387TzbtycIFv9IT4+SyVwcSU7Dfcpjn/Ag9tJM99mbqXjlahY15EUmyLSifb3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAJxolvt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77B4C116D0;
	Tue, 24 Feb 2026 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771943969;
	bh=jbaKWZqPk0Xh/pen8bNFDJZDvsXaHthkW4x5LB2hfwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAJxolvtBpYImqZOf15uz64XZtLaqOMRGlK4t3iCD25I9W4zuA6LFVMWvUp1jifyR
	 c/RiqwoAwrUAYTyuSsClax2YUcKyJ5YlMjYMUE2F5TWAvzHgM4WKBcjuXtdfYPREUW
	 URhUfQy7A4i3SSrexklknypB7O9/Ocy3tUUpXdooByCEyzNk+JMLyJQRg9gi1ijBsU
	 rZA5pmkq/2kJVfer0lUZ2KbZfERYdACCLoKerKKJBMCvpsGnMiF228fEeqv2YCvRsu
	 yNL4qGRv7guNl5HKis6nr1hLzQ+JK8QRVkoDFuXxDa6EyeNIm/Np/qz7rMxs38NyEe
	 Et+fTvy4rJ5mA==
Date: Tue, 24 Feb 2026 15:39:26 +0100
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
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v8 03/20] drm: Add enum conversions for
 drm_color_format_enum
Message-ID: <20260224-wisteria-chimpanzee-of-chivalry-f7dea4@houat>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
 <20260216-color-format-v8-3-5722ce175dd5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ndgst2h4bnyvzp5a"
Content-Disposition: inline
In-Reply-To: <20260216-color-format-v8-3-5722ce175dd5@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76803-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: D673C1887B4
X-Rspamd-Action: no action


--ndgst2h4bnyvzp5a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 03/20] drm: Add enum conversions for
 drm_color_format_enum
MIME-Version: 1.0

On Mon, Feb 16, 2026 at 02:01:17PM +0100, Nicolas Frattaroli wrote:
> While the drm_color_format_enum enum and the hdmi_colorspace enum have
> similar values, they're not identical, and HDMI's enum is defined as per
> the HDMI standard.
>=20
> Meanwhile, each DRM_COLOR_FORMAT_* define has a corresponding
> drm_color_format_enum, which allows conversion from the bitshifted
> defines to the enum values.
>=20
> Implement conversion functions from DRM_COLOR_FORMAT bitshifted defines
> to drm_color_format_enum, and from hdmi_colorspace enum values to
> drm_color_format_enum enum values.
>=20
> In both conversions, an unexpected input results in a
> DRM_COLOR_FORMAT_ENUM_INVALID result. The functions are kept inline
> __pure to give the compiler maximum freedom to do as it pleases.
>=20
> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  include/drm/drm_connector.h | 53 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 18bd875b6918..886defdd069b 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2694,6 +2694,59 @@ int drm_connector_attach_color_format_property(str=
uct drm_connector *connector);
> =20
>  const char *drm_get_color_format_name(enum drm_color_format_enum color_f=
mt);
> =20
> +/**
> + * drm_color_format_to_enum - convert a single DRM_COLOR_FORMAT\_ to enum
> + * @fmt: One of the possible DRM_COLOR_FORMAT\_ values
> + *
> + * Converts a single DRM_COLOR_FORMAT\_ value to a corresponding
> + * &enum drm_color_format_enum value. Bitmasks of multiple DRM_COLOR_FOR=
MAT\_
> + * values are not supported, as they would not map to a single enum valu=
e.
> + *
> + * Returns converted enum value on success, or %DRM_COLOR_FORMAT_ENUM_IN=
VALID on
> + * failure.
> + */
> +static inline enum drm_color_format_enum __pure
> +drm_color_format_to_enum(u32 fmt)
> +{
> +	switch (fmt) {
> +	case DRM_COLOR_FORMAT_RGB444:
> +		return DRM_COLOR_FORMAT_ENUM_RGB444;
> +	case DRM_COLOR_FORMAT_YCBCR444:
> +		return DRM_COLOR_FORMAT_ENUM_YCBCR444;
> +	case DRM_COLOR_FORMAT_YCBCR422:
> +		return DRM_COLOR_FORMAT_ENUM_YCBCR422;
> +	case DRM_COLOR_FORMAT_YCBCR420:
> +		return DRM_COLOR_FORMAT_ENUM_YCBCR420;
> +	default:
> +		return DRM_COLOR_FORMAT_ENUM_INVALID;
> +	}
> +}
> +
> +/**
> + * drm_color_format_enum_from_hdmi_colorspace - convert hdmi_colorspace =
enum to
> + *                                              drm_color_format_enum
> + * @fmt: The &enum hdmi_colorspace to convert
> + *
> + * Returns the converted result on success, or %DRM_COLOR_FORMAT_ENUM_IN=
VALID on
> + * failure.
> + */
> +static inline enum drm_color_format_enum __pure
> +drm_color_format_enum_from_hdmi_colorspace(enum hdmi_colorspace fmt)
> +{
> +	switch (fmt) {
> +	case HDMI_COLORSPACE_RGB:
> +		return DRM_COLOR_FORMAT_ENUM_RGB444;
> +	case HDMI_COLORSPACE_YUV444:
> +		return DRM_COLOR_FORMAT_ENUM_YCBCR444;
> +	case HDMI_COLORSPACE_YUV422:
> +		return DRM_COLOR_FORMAT_ENUM_YCBCR422;
> +	case HDMI_COLORSPACE_YUV420:
> +		return DRM_COLOR_FORMAT_ENUM_YCBCR420;
> +	default:
> +		return DRM_COLOR_FORMAT_ENUM_INVALID;
> +	}
> +}
> +

With my series, you probably don't need this anymore and we just need
the drm_output_color_format -> hdmi_colorspace conversion in the
infoframe generation code.

Maxime

--ndgst2h4bnyvzp5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ24HgAKCRAnX84Zoj2+
dpMBAX0TTALfrVEdM8Ou+n3pA1974hxZid7FIeffpkDnDf3CXEwUedGcqqyaC+7V
YSAtCMMBgKfQZvmR8VNY7x30NF/vawck4Ho0cD82fz1Sew/x03nVoFNDC9woN85k
EBv6cnxPlQ==
=Ozkv
-----END PGP SIGNATURE-----

--ndgst2h4bnyvzp5a--

