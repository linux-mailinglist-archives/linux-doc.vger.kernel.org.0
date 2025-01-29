Return-Path: <linux-doc+bounces-36348-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C7AA2209E
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 16:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4E5118841E2
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 15:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6469C1DDC3A;
	Wed, 29 Jan 2025 15:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Doq+/rNz"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E601DD0C7;
	Wed, 29 Jan 2025 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165309; cv=none; b=lRXLvlQbGgvBGM1lraKvGflPLPwJzxD/g4W4GAAkSJsfUiBXt6jIiOr3nsK7pSfZVJvK25ZT4Y6FNwqW5ONO3mCUfp1wfZT+BqgUmP7YLfaEs9vLSbZC/a2QXmbpLtxaNrlJVv2wjbvsPgl4odc9grjjOgknDwl/PC7VPtkegck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165309; c=relaxed/simple;
	bh=x9FQ10F4P9ene0avOkX6SJRwE4duJpiylNTvH2FHki0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObI2o/Hg2h3GJ0IafNhRgb4yamXlx/9kSt20zQRQi8cUeqfq7N5+05SCsKMyED5in2UZ8uYi+7j45znQA6J1SPMuabmyKrDOU5FKBkAKv9gxa7bDSnOgAnTprj2tOctL+9i8NUjyIiTCMzGCS0Hic25SqPnXCileEOfS7EOXSPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Doq+/rNz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0D5C4CED1;
	Wed, 29 Jan 2025 15:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738165308;
	bh=x9FQ10F4P9ene0avOkX6SJRwE4duJpiylNTvH2FHki0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Doq+/rNzHg+crI9ZcWtKePHsQc6DCfqlblaynmX5rkNKoSR8aoRtfLCo8hlplQT8S
	 SszLnZ7/buZh6jfPwyw7MFwtzbCqliYr1x8R26ffuKILIzG4Dcrlo2vauyEx+ZCa7Q
	 fGMA+W95aCCNzgyEj0Sl5Hjc6GbfuxBPEg/1VR+9jrU8RajCzwLijwt9d05XfTVIdU
	 pXcYBPgl+if4aDVy8x6uvii+g9qXvXmGsdU6tc8eW1deajAWLklzKK93vVc7zEKfTM
	 LfkYLXOkbdJxFMvmKe1KH7TkEg/csOuMkrEGGxXdWVtbhKJsIm3GZwQaznV1b1oyxx
	 udzvX+QKPoOSw==
Date: Wed, 29 Jan 2025 16:41:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 07/14] drm/rockchip: move to
 devm_platform_ioremap_resource() usage
Message-ID: <fkck6okku766yn4bpfbiykpvvsj5k7tgebko7pvybon3rctn7w@gkl5z2o3bcf2>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="n2rj4zmziwj6lmg7"
Content-Disposition: inline
In-Reply-To: <20250128-cocci-memory-api-v1-7-0d1609a29587@redhat.com>


--n2rj4zmziwj6lmg7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 07/14] drm/rockchip: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 05:29:31PM -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource(pdev,...);
> -ioremap_res =3D devm_ioremap_resource(...);
> +ioremap_res =3D devm_platform_ioremap_resource(pdev,0);
>=20
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Heiko St=FCbner <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_vop.c
> index 57747f1cff26e444ef3569983d6a7f7922f03ff7..4c639f7c868907fc35ce22f2e=
f7e281ad85c2d9e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -2187,7 +2187,6 @@ static int vop_bind(struct device *dev, struct devi=
ce *master, void *data)
>  	const struct vop_data *vop_data;
>  	struct drm_device *drm_dev =3D data;
>  	struct vop *vop;
> -	struct resource *res;
>  	int ret, irq;
> =20
>  	vop_data =3D of_device_get_match_data(dev);
> @@ -2207,8 +2206,7 @@ static int vop_bind(struct device *dev, struct devi=
ce *master, void *data)
> =20
>  	vop_win_init(vop);
> =20
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	vop->regs =3D devm_ioremap_resource(dev, res);
> +	vop->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(vop->regs))
>  		return PTR_ERR(vop->regs);
>  	vop->len =3D resource_size(res);

This one will result in a compile failure too, you removed res but it's
still used on the last line.

Maxime

--n2rj4zmziwj6lmg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pMOAAKCRAnX84Zoj2+
dm9sAX95MxW28qLtlCcTTmdQkMrfL23sMFhwLQtAuxzLU6cNJTr4Laq62TyMz0tE
fkKBU/cBgOoSJ8YDN8x0kWdfzBz+S1fj4kdxPGLwpdkIMLxH7u1CgpGzqotO9jni
7iTsYM6fhw==
=I0Jf
-----END PGP SIGNATURE-----

--n2rj4zmziwj6lmg7--

