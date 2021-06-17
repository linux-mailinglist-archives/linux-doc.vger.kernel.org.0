Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4A93AB488
	for <lists+linux-doc@lfdr.de>; Thu, 17 Jun 2021 15:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbhFQNWv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Jun 2021 09:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbhFQNWv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 09:22:51 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1182C061574
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 06:20:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r9so6763399wrz.10
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=IZn+aE/io70i94lctHJsEfZVSh8DRa+CfBjUzyx9wYA=;
        b=L4j4OnU+Mx5UhODJsTRRzJ4NG+a2wMV1UBIwH33W2kHbaCyQELD7Z+FOtEncuZ4eef
         oUWK8XkzX8pd3ursfU2PbOBqQym6HT/Q+nTnmiJsA2r+2FmUfHh7bNZTJUwvcu244Urg
         lBoR4gXrvXr1ozpvfF/XwGmSyVXGAws3WaMVpmwFaNPfZi1uW9tdXoRXr0ZQYtonVSfx
         mKComkl0FBL8jVz5msPY0qeIXMvDrhib3fIbCrcheMT1BaGqZUU+/pWKRDlcuhZroDOv
         kA0D41NfhyRQWU/TlkoPaCt3C9OowwuapSmEsOBWtqlvcwZWGBUj1L4QtrECR5nv4PMd
         as9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=IZn+aE/io70i94lctHJsEfZVSh8DRa+CfBjUzyx9wYA=;
        b=fVXiG9ZHm12FfmYLvLoiBkvFS5mZtUltKgYfPp8oI4IWZn79pT5PNv+jr/ZxdzuAzq
         Fnll9YaoX5vQLFIMOkmZsarudnNL1WefSoRelBlT6iHFpKRyKwRwrv6H32AfP9qFituU
         ys2jUiN7aINuWpxfMz4VpggtWtglmNxA5PF7GK9r/M2TM5jjpjduefLTIWI/i6BEzPlz
         wcxibSkQ2Sp4VyJCFJbrMVwBcAF8VTDhBXKuc7kbiEJ5wKVwHt7rwYXvHBHavjtItrDa
         VYyEXS7qpXJeDa0yenFh0PHgGOnKMnSvTRqwj1TuKmqYWQZB90EyeBprq1MQ4PBVYa1H
         yRvw==
X-Gm-Message-State: AOAM5312JmSss6V5mUe4vPyLAZhKcXUJN8KQoUWdxz2bYAUpIFyv6/DA
        9WsxVJIcXysrzm/A0zElmq4=
X-Google-Smtp-Source: ABdhPJyGOhJgmuMwaeei2oENmp3PSzG5m0glsvtxvE8rzA/+dcvx0CCrCubPp3MM0w+41WvobynHRg==
X-Received: by 2002:a05:6512:a83:: with SMTP id m3mr3573657lfu.199.1623929608126;
        Thu, 17 Jun 2021 04:33:28 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id e4sm636836ljf.82.2021.06.17.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:33:27 -0700 (PDT)
Date:   Thu, 17 Jun 2021 14:33:11 +0300
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
Message-ID: <20210617143311.19896458@eldfell>
In-Reply-To: <YMskHF8Bo/z3kqxf@pendragon.ideasonboard.com>
References: <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
        <20210614174912.15a49336@eldfell>
        <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
        <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
        <20210615100335.0b8f96d5@eldfell>
        <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
        <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
        <20210615131656.2ecefdc4@eldfell>
        <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
        <20210617102701.28f820b2@eldfell>
        <YMskHF8Bo/z3kqxf@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IkItTTQt1NqFJW=/rXSrRHH"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/IkItTTQt1NqFJW=/rXSrRHH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Jun 2021 13:29:48 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Pekka,
>=20
> On Thu, Jun 17, 2021 at 10:27:01AM +0300, Pekka Paalanen wrote:
> > On Thu, 17 Jun 2021 00:05:24 +0300 Laurent Pinchart wrote: =20
> > > On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrote: =20
> > > > On Tue, 15 Jun 2021 12:45:57 +0300 Laurent Pinchart wrote:   =20
> > > > > On Tue, Jun 15, 2021 at 07:15:18AM +0000, Simon Ser wrote:   =20
> > > > > > On Tuesday, June 15th, 2021 at 09:03, Pekka Paalanen wrote:
> > > > > >      =20
> > > > > > > indeed it will, but what else could one do to test userspace =
KMS
> > > > > > > clients in generic CI where all you can have is virtual hardw=
are? Maybe
> > > > > > > in the long run VKMS needs to loop back to a userspace daemon=
 that
> > > > > > > implements all the complex processing and returns the writeba=
ck result
> > > > > > > via VKMS again? That daemon would then need a single upstream=
, like the
> > > > > > > kernel, where it is maintained and correctness verified.     =
=20
> > > > > >=20
> > > > > > The complex processing must be implemented even without write-b=
ack, because
> > > > > > user-space can ask for CRCs of the CRTC.
> > > > > >      =20
> > > > > > > Or an LD_PRELOAD that hijacks all KMS ioctls and implements v=
irtual
> > > > > > > stuff in userspace? Didn't someone already have something lik=
e that?
> > > > > > > It would need to be lifted to be a required part of kernel UA=
PI
> > > > > > > submissions, I suppose like IGT is nowadays.     =20
> > > > > >=20
> > > > > > FWIW, I have a mock libdrm [1] for libliftoff. This is nowhere =
near a full
> > > > > > software implementation with write-back connectors, but allows =
to expose
> > > > > > virtual planes and check atomic commits in CI.
> > > > > >=20
> > > > > > [1]: https://github.com/emersion/libliftoff/blob/master/test/li=
bdrm_mock.c
> > > > > >      =20
> > > > > > > For compositor developers like me knowing the exact formulas =
would be a huge
> > > > > > > benefit as it would allow me to use KMS to off-load precision=
-sensitive
> > > > > > > operations (e.g.  professional color management). Otherwise, =
compositors
> > > > > > > probably need a switch: "high quality color management? Then =
do not use KMS
> > > > > > > features."     =20
> > > > > >=20
> > > > > > I think for alpha blending there are already rounding issues de=
pending on the
> > > > > > hardware. I wouldn't keep my hopes up for any guarantee that al=
l hw uses the
> > > > > > exact same formulae for color management stuff.     =20
> > > > >=20
> > > > > Good, because otherwise you would be very quickly disappointed :-)
> > > > >=20
> > > > > For scaling we would also need to replicate the exact same filter=
 taps,
> > > > > which are often not documented.   =20
> > > >=20
> > > > That is where the documented tolerances come into play.   =20
> > >=20
> > > This is something I've experimented with a while ago, when developing
> > > automated tests for the rcar-du driver. When playing with different
> > > input images we had to constantly increases tolerances, up to a point
> > > where the tests started to miss real problems :-( =20
> >=20
> > What should we infer from that? That the hardware is broken and
> > exposing those KMS properties is a false promise? =20
>=20
> No, just that the scaler doesn't document the internal hardware
> implementation (number of taps in the filters, coefficients, rounding,
> ...). That's the rule, not the exception, and it doesn't prevent correct
> operation, images get scaled in a reproducible way (the same input
> produces the same output).
>=20
> > If a driver on certain hardware cannot correctly implement a KMS
> > property over the full domain of the input space, should that driver
> > then simply not expose the KMS property at all? =20
>=20
> The properties involved here would the the SRC and CRTC rectangles for
> the planes. They don't document pixel-perfect scaling :-)
>=20
> > But I would assume that the vendor still wants to expose the features
> > in upstream kernels, yet they cannot use the standard KMS properties
> > for that. Should the driver then expose vendor-specific properties with
> > the disclaimer that the result is not always what one would expect, so
> > that userspace written and tested explicitly for that hardware can
> > still work?
> >=20
> > That is, a sufficient justification for a vendor-specific KMS property
> > would be that a standard property already exists, but the hardware is
> > too buggy to make it work. IOW, give up trying to make sense. =20
>=20
> It's not just about buggy hardware, it's also about implementation
> specificities, such as rounding, filters, order of operations in the
> color management pipeline (it's relatively easy when you only have two
> LUTs and a CCM matrix, but if you through 3D LUTs and other tonemapping
> features in the mix, not all hardware will implement the same pipeline),
> or various types of image compression (this device implements a
> "near-lossless" compression scheme that reduces the memory bandwidth by
> 50% for instance).

Rounding shouldn't result in needing wide tolerances.

Filters are more difficult, but at least we can factor them out when
testing other things. Filters could be tested in isolation with some
image difference metrics rather than per-pixel independent comparisons.

The order of operations in the color management pipeline is very
important. We can't work with "whatever". All the variability in
hardware is exactly why I have been calling out for defined abstract
color pipeline in the DRM UAPI docs, so that drivers would know which
properties to map to their elements, so that userspace can have any
possibility of using them correctly. If the hardware has a block
that doesn't fit in the abstract pipeline, you get to add things to the
abstract pipeline, or invent a whole another abstract pipeline and
document that.

Lossy compression needs its own KMS properties to ensure it can be
disabled when necessary. Near-lossless is not lossless, if a difference
can be measured. The driver or hardware cannot guess if the end user is
ok with "near-lossless" or not, so you have to be conservative and
assume not ok, offering an opt-in for lossy.

...

> > My underlying assumption is that generic userspace will not use
> > vendor-specific properties. =20
>=20
> I expect some amount of device-specific code in userspace, yes.=20

If we had a reliable way to test device-specific code without the
hardware and automatically in CI, then maybe.

> There are usually large variations in how the hardware exposes access to
> a given feature, which leads to code having to convert the standard API
> parameters to hardware parameters. To a large extend this can be done in
> drivers, but for some more complex features, it may put too much burden
> on the kernel. There's a reason mesa is a userspace stack :-)

If we get a Khronos standardised 2D composition API... oh wait.

Nothing wrong with userspace libraries, but it does mean that driver
developers need to contribute to them, like they do to Mesa. Is there
any of that going on for KMS?

In the mean time, DRM UAPI basically must define a 2D composition API,
or the new KMS properties will not see use outside of vendor trees.

> > Or, since we have atomic commits with TEST_ONLY, should it be driver's
> > responsibility to carefully inspect the full state and reject the
> > commit if the hardware is incapable of implementing it correctly?
> > Vendor-specific userspace would know to avoid failing configurations to
> > begin with. I suppose that might put an endless whack-a-mole game on
> > drivers though. =20


Thanks,
pq

--Sig_/IkItTTQt1NqFJW=/rXSrRHH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDLMvcACgkQI1/ltBGq
qqelTxAAtTAdZSkxRjMsI3+yYuDzHvgjHhMIt5dm55aJbnUNlYRtSLmCpi74OV2R
8PnF70T+u2+38PF0iyTUhfsepjkXgoTtfj4zwmG9PUqep84jbMTtQgmzAPayxA2H
F7MAgN8UKjhH2taJmMLvuLQMRLBg8FmW6pE/V674TKICUGjp3cRr7br1EWjuMc96
dwLldgMo4y5CPFgsPFCVix6UQbEWR5EiQgkGlchlsU35TBCcgypBxPacl1NJ+ARg
4N80PC5B9KWIarWYBfA4+ed7yVxANWPbH6SAuKfy+h+VV1GcfFs0f3+fB8rLzE4N
Oan9wNbf88UMM5AIMY3PUY6sT5yJdkePaI6VBvCZaq2++zBBsrAkM8k/V352NGq+
IzrtWWSohlduN/sbp52z1WR3AdQ7gGSs8LIiEtlH48cq0Y+htx9swy+OnhtD4IP+
yqSAZAlx7E/cuaCV2O45Fmt8YPf/ZBf5W5OReR7O8uNmd3RxeUerkD0du9fniAsC
vEfUCcMWAqMGI82wgQmQsXSE4Pqec/3tbJ3kBUOIevYL7Rv324O+WfxK0bflpUV7
xrtWIC65Px94eErFxdVqKqboxKtdNVB2q33We/YGqgHCAg4E6puM2EtaSiFqY9A7
ZafKTiihNFD1xCv8+gqjtah6eHMMA6EOLn8IJxDwlMRaTDKi9r0=
=8gdj
-----END PGP SIGNATURE-----

--Sig_/IkItTTQt1NqFJW=/rXSrRHH--
