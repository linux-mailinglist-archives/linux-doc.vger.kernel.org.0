Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F013AC9EF
	for <lists+linux-doc@lfdr.de>; Fri, 18 Jun 2021 13:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhFRLeV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Jun 2021 07:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbhFRLeV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 07:34:21 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF37DC061574
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 04:32:11 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id f8so4341976lfu.6
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=Y/4oHr+btH2pF/nzmSYnvvf7QHbNMc3inROlhqZdztM=;
        b=n2dSbBHDtwLBC9SsrZl1bB4cA687VCTDATuI82BfqteKDREyeD/DcDT6b03TFTO/rT
         Sk8/qDPoPmN66ugCG1VbbmkyGphgWUZyL6cPPAuS04iYb7BwfIIZUYrW5eG3pRa54FSf
         56mCCRauPwEmCSwaXEKAhPK7Gx5Zi56eyzfwHLtpU4ZMWnxlPNzBcO29L9S1NAywQEgg
         DLoGMU/vdCG5f5Ax/nhJwee3K/Au93Syz+d+gIbNxyMs1XARWvssAHZW8Wmc/ldrAWUX
         xdc8WJV80zfOypChZgpoT+EpZi/1R6xlmge3edbzLxSefCVSNN+Hus27QeOaTugP7lm5
         uo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=Y/4oHr+btH2pF/nzmSYnvvf7QHbNMc3inROlhqZdztM=;
        b=LtStQ51b7FJ5213jgQtb1NsLyaOmaefdRB86uuWzavaA6lAUilwhiJuuyPhf0xddlm
         GAiV0QSZdYI8AvYsF08wPxTBqIZ84QuD6tk+1w7GZOUb86RcHybkvADqt2jkwOcI32hR
         Vw9r+JyL7GO7CZExdXyauIoUnjx+FcSw3NUJ+GXdpEJteBRCkvPJd11C7Z5WRcv+JVoe
         TH7LAmswC2S0ON9Pj6morMACP7p5edfB9BlckgDj3AGPY74KSflBvAObhj140YSjh61P
         pq6hEq6pRL6L64k/XMVq0H2KL4aAhK5YHjn1ohCWTt+qxGcqwtWv1GTMC06obk3JBGV7
         9NDw==
X-Gm-Message-State: AOAM531Cxe0QwJQa4gLsxGVAj2cafJVLYVJ9wAdv7mrVheuy83KcKNaB
        2dJwfWgcFXHA/mAuEJjNwOU=
X-Google-Smtp-Source: ABdhPJzjU+HMcG1Dd+o5XTPFKRlTZYXak6DTMWfU7O3MbuKyl3zfssvDtHYk5XVA0MdReS43PMG4bQ==
X-Received: by 2002:ac2:4a83:: with SMTP id l3mr2793431lfp.406.1624015930155;
        Fri, 18 Jun 2021 04:32:10 -0700 (PDT)
Received: from erebos (85-76-76-133-nat.elisa-mobile.fi. [85.76.76.133])
        by smtp.gmail.com with ESMTPSA id e17sm1023949ljn.125.2021.06.18.04.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 04:32:09 -0700 (PDT)
Date:   Fri, 18 Jun 2021 14:32:00 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Simon Ser <contact@emersion.fr>, Liviu Dudau <liviu.dudau@arm.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Russell King <linux@armlinux.org.uk>,
        Melissa Wen <melissa.srw@gmail.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Steven Price <steven.price@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Marek Vasut <marex@denx.de>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Qiang Yu <yuq825@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alison Wang <alison.wang@nxp.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>, Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Huang Rui <ray.huang@amd.com>,
        Yannick Fertr e <yannick.fertre@foss.st.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Robert Foss <robert.foss@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210618143200.7e145f95@erebos>
In-Reply-To: <YMxuWZWpmggDtvT9@pendragon.ideasonboard.com>
References: <20210615100335.0b8f96d5@eldfell>
        <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
        <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
        <20210615131656.2ecefdc4@eldfell>
        <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
        <20210617102701.28f820b2@eldfell>
        <YMskHF8Bo/z3kqxf@pendragon.ideasonboard.com>
        <20210617143311.19896458@eldfell>
        <YMtQClnvjGNDhn9q@pendragon.ideasonboard.com>
        <20210618115152.79af3537@erebos>
        <YMxuWZWpmggDtvT9@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=80GHEhIxF46Mgn2M7HPv_3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/=80GHEhIxF46Mgn2M7HPv_3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Jun 2021 12:58:49 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Pekka,
>=20
> On Fri, Jun 18, 2021 at 11:55:38AM +0300, Pekka Paalanen wrote:
> > On Thu, 17 Jun 2021 16:37:14 +0300 Laurent Pinchart wrote: =20
> > > On Thu, Jun 17, 2021 at 02:33:11PM +0300, Pekka Paalanen wrote: =20
> > > > On Thu, 17 Jun 2021 13:29:48 +0300 Laurent Pinchart wrote:   =20
> > > > > On Thu, Jun 17, 2021 at 10:27:01AM +0300, Pekka Paalanen wrote:  =
 =20
> > > > > > On Thu, 17 Jun 2021 00:05:24 +0300 Laurent Pinchart wrote:     =
=20
> > > > > > > On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrot=
e:     =20

...

> This isn't about human perception, but about the ability to check if the
> driver correctly configures the device :-) For driver testing, I don't
> care if the colours look right or not if userspace misconfigures the
> colour pipeline. What I need is to catch regressions when my driver
> messes up the hardware configuration. This particular device processes
> the images in stripes, and it's very easy for a stripe to be one pixel
> off (or actually a fraction of a pixel when the scaler is involved).
>=20
> Testing if a device correctly implements colour processing is of course
> also useful, but is a distinct goal. Both need to be considered, when
> stating requirements such as fully documented properties with a VKMS
> software implementation and pixel-perfect tests in IGT.

Right. Your driver testing requirements are different. You know how your
hardware works, so you can build your tests to suit.

What this thread is about is KMS UAPI, and verifying that a KMS
implementation matches the KMS UAPI specification. The UAPI
specification is the only thing I can look at when writing userspace.
As a userspace and compositor developer, I am specifically concerned
about how humans will perceive the final image.

If you use your hardware-specific tests to ensure that your driver
programs the hardware correctly, and IGT tests ensure that the KMS UAPI
is implemented to the KMS UAPI spec, then I would hope that everything
is fine. By reading the KMS UAPI spec I can decide to use or not use
specific KMS features.

...in an ideal world.


> > > One very typical difference between devices is the order of the
> > > processing blocks. By modelling the KMS pipeline as degamma -> ccm ->
> > > gamma, we can accommodate hardware that have any combination of
> > > [1-2] * 1D LUTs + 1 * CCM. Now, throw one 3D LUT into the mix, at =20
> >=20
> > But you cannot represent pipelines like
> > 1D LUT -> 1D LUT -> CCM
> > because the abstract pipeline just doesn't have the elements for that.
> > OTOH, maybe that ordering does not even make sense to have in hardware?
> > So maybe not all combinations are actually needed. =20
>=20
> If userspace wanted such a pipeline (I'm not sure why it would), then it
> could just combine the two LUTs in one.

Maybe? You can also combine the 1D LUTs into the 3D LUT in the
middle, too, but the result is not generally the same as using them
separately when the 3D LUT size is limited.

> > > different points in the pipeline depending on the device, and it will
> > > start getting complicated, even if the use case is quite simple and
> > > common. This is getting a bit out of topic, but how would you solve t=
his
> > > one in particular ? =20
> >=20
> > By defining all the points in the abstract color pipeline where a 3D
> > LUT could exist. Then each point would probably need its own KMS
> > property. =20
>=20
> And when we'll add the next object ? This can't scale I'm afraid. You'll
> have a spec that tells you that things can be in any order, and may well
> be able to expose the order to userspace, but you won't be able to
> implement a generic userspace that makes use of it.

Are you saying that generic userspace cannot happen? On top of KMS
UAPI, that is.

Why would a generic userspace library API be a more feasible effort?

> BTW, if we want to expose a finer-grained topology of processing blocks,
> I'd recommend looking at the Media Controller API, it was designed just
> for that purpose.

Sure. However, right now we have KMS properties instead. Or maybe they
should just go all unused?

Maybe the rule should be to not add any more KMS properties and tell
people to design something completely new based on Media Controller API
instead?

I've never looked at Media Controller API, so I have no idea how it
would suit display servers.

I very much think that I cannot use processing blocks exposed by
KMS if I cannot have guarantees that they work the same across all
Linux drivers.

> > We already have the KMS pipeline exactly as degamma -> ctm -> gamma and
> > drivers need to respect that order.
> >=20
> > If the combinatorial explosion gets out of hand, maybe we need a KMS
> > property to switch to whole another abstract pipeline which defines a
> > different ordering on the same and/or different KMS properties.
> >=20
> > From what I've learnt recently, if you have a 3D LUT, you want a 1D LUT
> > on each side of it for memory vs. precision optimization. And after the
> > degamma -> ctm -> gamma pipeline you may want one more ctm for
> > RGB-to-YCbCr conversion. So I have hope that the abstract pipeline with
> > all actually implemented hardware features might not go totally out of
> > hand. =20
>=20
> On the output of the CRTC, I have, in this order
>=20
> - RGB to YUV conversion (can only use presets for BT.601 and BT.709, with
>   limited or full range)
> - 3D LUT
> - 1D LUT
> - YUV to RGB conversion (presets only)
>=20
> The RGB to YUV and YUV to RGB conversions can be bypassed. That's it.
>=20
> There's also a histogram engine, to allow implementation of dynamic
> gamma correction. This would require userspace to read the histogram
> data for every frame, and update the LUTs accordingly.

Interesting, but almost none of that would be used by the color
management pipeline model I'm familiar with. I wonder what kind of use
cases doing LUTs in YUV have been designed for, and *after* blending,
even.

...

> I really think we'll end up needing device-specific userspace
> components. Given the example above, with histogram calculation and
> dynamic gamma correction, there's no way we'll be able to have a single
> userspace implementation that would support these kind of features for
> all devices. It doesn't have to be solved now, but we probably want to
> start thinking about an API to plug device-specific components in
> compositors. This is the kind of problem that the libcamera project is
> tackling on the camera side, I believe a similar approach will be needed
> for displays too.

To be able to plug device-specific components in compositors, we need a
driver-agnostic API through which compositors can use those device
specific components. Still the same problem, now just in userspace than
at the UAPI level.


Thanks,
pq

--Sig_/=80GHEhIxF46Mgn2M7HPv_3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDMhDAACgkQI1/ltBGq
qqfLaQ//ZioKDfMjyl3kEuqSwRVYiSc0YGO+jAJ/Te6lf0crFoGI90xuSaaKyOpo
WsKYkb86SFFauIB91mCVNB5++9T0y5D/zLAGwqNrzydOHpIUBXDTTac1RPKdKYHv
fzXZagEOr69BM/KDRL6ETWznO4kLV/GXssJGBXsE2zALWzO5hSaAE654CKqmMzNG
ypln0RVi8i+0SSgM+tAlV8m0eNzGqIJcp3gqIYjMJmj6GseWrvO6ns2c+DQJjiLE
r8rQSppUAS8BCJTEmBtql/mLX5kfygdCSkf+WuMUEXugeZfnUaP6YpMR2TH+a8DW
8Py2L0MJDfw7LaHjy/RjBBpAXnMvRsEkzqIvS6YwwjsVRHyWeKdyvyWmBrNm8EJP
TLnLpEcn3drykKZzDcixlfyEIvdXlZhigGDm9vNhJUnRei7ZBQIlC+LfbGSB+G3F
02vtjvL4P42usvfKR6Sb55dYk+l6026auVY5JigChrSZ264VzW7ZZsps2M9SwRkR
R93H9k4hfR6ppDR402jzkNmU6t/3riafpsZnn42fY1/hmh81Z3s3iTap6xmASirm
jOOnUZkOpoP+t2yL2zlTJn/JL/YgoBtRSGImjGOgM7PoSOG+dF4SRoteJU/HWIIo
VaYW+JePDOSL6lqHRVwLBAUhlH380f9jrCz1ggbXcRPpsi2t/Jo=
=WTF6
-----END PGP SIGNATURE-----

--Sig_/=80GHEhIxF46Mgn2M7HPv_3--
