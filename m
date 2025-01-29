Return-Path: <linux-doc+bounces-36336-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB08A2204E
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 16:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D86F91883048
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 15:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901B71DDA17;
	Wed, 29 Jan 2025 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOyxzPTq"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E01D9346;
	Wed, 29 Jan 2025 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738164533; cv=none; b=HvA4+4DrrXHiFjW4Q7dE7tq64qiCM+NNsWHe1iWmN8EVKdKhIWITeYbgSs66QoBbbp9Aq4MN1+oYcGKNE5tjrQ+zgCvSegvjDkzwUkJTMJ4buie3AUKBC6pg90euJRXcjVcKRVjhnd7Uvy2TBm5yMCOqyHoUpwfHsK4fUCkNpcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738164533; c=relaxed/simple;
	bh=bok9TVvjjQCymMYvMKlNAI5VH8lxZtesRpd8zGC0hcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bO8MnQsIcA4LRjOT08TOP8/QfnE71+5qtusXslCyuCCOci7hzW2jAfhriqf8LDtznis0emq9bwsgcQPrR2kzrU8Ps2Fim2ToPVeJ+xmG+B8/SLrukOm1b5CgERbOKISKdl/KyWlL1TuNq03eVUn7frgNCxJH3N8P+LAMvq8VxKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOyxzPTq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DB6C4CED1;
	Wed, 29 Jan 2025 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738164532;
	bh=bok9TVvjjQCymMYvMKlNAI5VH8lxZtesRpd8zGC0hcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NOyxzPTqxCIMDXiltBFL33XgRz5+HmhF0fqEkvxsOMQ+6Wzc56dBN6SyjzMqltBb3
	 6NHtoBcd65EsJ8oCbYGGJvz7/v567MFrM9a76OkdnsX647Ow/whbk9IojguGxowzk/
	 vbgmUGA5QVu9G7m22EiF1kv31X4aNiRWdytIs030qtfGVFcGpnPSqX2oZnwdYQILpm
	 Pjpn1K1oNLt3gHaVCozxK5+ncmcRqK8/EMM9cl/FWKOpIv1Co7UcwDOnuN5Jv9Df4M
	 APJZcGw1WrNChwRUMgJfEVxBXmfA2Yi8igsZSjP24OyJBaMR3b9+I6o4BEWoNaXNbL
	 K/PKTztalZRiQ==
Date: Wed, 29 Jan 2025 16:28:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
	Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 14/14] Documentation: Update the todo
Message-ID: <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
 <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ntiwixuo22akqcub"
Content-Disposition: inline
In-Reply-To: <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>


--ntiwixuo22akqcub
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 03:41:32PM +0100, Thierry Reding wrote:
> On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> > Hi Thomas,
> >=20
> > On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > > Remove the TODO now that this series addresses
> > > > the changes needed.
> > >=20
> > > While your series is fine, this TODO item is unrelated. It's about va=
rious
> > > ancient fbdev drivers that do not reserve their memory regions correc=
tly. So
> > > please drop patch 14 form the series.
> >=20
> > Is it? Could we rephrase the entry then? I'm the one that suggested
> > Anusha to work on this, and it's still not clear to me what it means
> > exactly if it's not what she worked on :)
>=20
> The text in the TODO sounds pretty clear to me.

The title is "Request memory regions in all drivers", and the first
sentence is "Go through all drivers and add code to request the memory
regions that the driver uses". It's definitely ambiguous if only fbdev
drivers should be considered, even more so in the DRM documentation.

> It says that not all drivers request the memory that they are going to
> use, and suggests to add those missing calls.

Right.

> But all of the drivers in this series already do that

Nope.

> and the only change here is to convert them to use some of the newer
> helpers.

For some, yes. For others, it actually adds request_mem_region.

Maxime

--ntiwixuo22akqcub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pJLAAKCRAnX84Zoj2+
djXJAX42QJuv9ldBu+AhSOcaGHTmHduDMEY8V8Vl9SA1LQwXd1eGjPx3kK6JEffx
SuWaI7oBgKL15NjVE6UaWuMksj7yMDft9JYcv/qLSoYx2TpAp/7FYElajo0cqE0S
btsWT+helA==
=K+FR
-----END PGP SIGNATURE-----

--ntiwixuo22akqcub--

