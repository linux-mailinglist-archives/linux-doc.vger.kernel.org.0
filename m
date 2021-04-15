Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24E23605B8
	for <lists+linux-doc@lfdr.de>; Thu, 15 Apr 2021 11:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhDOJbS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Apr 2021 05:31:18 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:58139 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230056AbhDOJbR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 05:31:17 -0400
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Apr 2021 05:31:17 EDT
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 6FC38153A;
        Thu, 15 Apr 2021 05:21:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 15 Apr 2021 05:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=zfj0rQaRKmMatrAglIvbM4mltoL
        UjF1OY8QTK/o+Ygs=; b=VvPT0bI72y0hK4xK7mXV/woFz4I767UjXKTfBbhvm9D
        QI6NOakfUTIPHriMD5eTgDJcWK0V2nLoDG9IQ+XP2xAl6BRCeKDplTZzH7OZ1Epq
        R/osEMTd3j2nAXsYPNUzOw3VTr/59egO/0yZrLYyp0mHBI09BfnzEKh7mlwTP35e
        2xLzYy170oGXveATrd4UsHGWwMvWE65Wuqk6ncVILDdW9PeVqEnTOhmb3PNmYyqk
        OqdezfzQcoDln+bWXdIKEqTKqEANVA6ldKnZlXtxYFm3VUFr3LBblOPQUalnwdql
        J87IRED81hnkSjpnT1swvizewerqtPkUdT70F2JLVGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zfj0rQ
        aRKmMatrAglIvbM4mltoLUjF1OY8QTK/o+Ygs=; b=BGADAo8PFmCgCfLPPBFW8t
        L/NTny2mQA0vNebmJUnMXryJUfOS2ze2UxdwD6yA4wMJtsQKE7OwCbUZ7EUuIdMZ
        +4y50x9miQ0MuB6R1BOzhyf61CE1pae9q7QA+zHjpqR7vENcR2C6FGQwR1Ut67AG
        PnA0wYuAOpQNXlwbWkR/1CmFRB6BTATBj1WTSeMjUqs7BTdTqAjqDBMaqrC4JtwT
        buKHOU0DrpEPTV/HInXuuUrO5YxVoBEjeoRoU6T7HSbVEJoMqL1tiYwEHbdrd4i5
        NYxA2v7ED6C++BN6V2eot6RKqlPJCphjqAx+MBqJdtnOPM8Brj5YOJABvXK3Wh1g
        ==
X-ME-Sender: <xms:lQV4YChUCP8iVpkABjYxrzPRMKejcQguuvyEo4VigwgTZm5ExAGoFg>
    <xme:lQV4YDDh_Z6yzxFxgeBFZUAUyqXkxModz9c4NMEXHY8Jj0WXFdTSEkNI9FU115o5A
    y5yU-KWFg8VO-BMbfE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lQV4YKFZCvqEvlMgpVezhT8P9fXOXmBFIr9UZ8cdAx8KtdONCT6myw>
    <xmx:lQV4YLQ7PkZ4onLzUP_N9UoLzRSfGoebL2AFqvE9Sr052amGDCuW3g>
    <xmx:lQV4YPznVjDFJtd_gKakJw3373la0KC5ILlWHEXdWy-JMZHGpXWqLA>
    <xmx:lgV4YEKf41X3D_3aoWu24lPOXieSiJwWeXDNkEKssHFIfNhJk95M90UCjds>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DBE3024005B;
        Thu, 15 Apr 2021 05:21:24 -0400 (EDT)
Date:   Thu, 15 Apr 2021 11:21:23 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, kraxel@redhat.com,
        corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org,
        sam@ravnborg.org, robh@kernel.org, emil.l.velikov@gmail.com,
        geert+renesas@glider.be, hdegoede@redhat.com,
        bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device
 node
Message-ID: <20210415092123.7zn6fbnkuqlajord@gilmour>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
 <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
 <3c7bacd1-e40e-0953-9ad9-9f79274106d5@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dssjutuvfuyn2y2e"
Content-Disposition: inline
In-Reply-To: <3c7bacd1-e40e-0953-9ad9-9f79274106d5@suse.de>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--dssjutuvfuyn2y2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 15, 2021 at 09:31:01AM +0200, Thomas Zimmermann wrote:
> Am 08.04.21 um 10:13 schrieb Maxime Ripard:
> > Hi,
> >=20
> > On Thu, Mar 18, 2021 at 11:29:19AM +0100, Thomas Zimmermann wrote:
> > > Make sure required hardware clocks are enabled while the firmware
> > > framebuffer is in use.
> > >=20
> > > The basic code has been taken from the simplefb driver and adapted
> > > to DRM. Clocks are released automatically via devres helpers.
> > >=20
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
> >=20
> > Even though it's definitely simpler to review, merging the driver first
> > and then the clocks and regulators will break bisection on the platforms
> > that rely on them
>=20
> I'd like to keep the patches separate for now, but can squash patches 6 t=
o 8
> them into one before pushing them. OK?

Yep, that works for me :)

> >=20
> > Another thing worth considering is also that both drivers will probe if
> > they are enabled (which is pretty likely), which is not great :)
> >=20
> > I guess we should make them mutually exclusive through Kconfig
>=20
> We already have several drivers in fbdev and DRM that handle the same
> hardware. We don't do this for any other pair, why bother now?

Yeah, but simplefb/simpledrm are going to be enabled pretty much
everywhere, as opposed to the other drivers that are more specialized.

Maxime

--dssjutuvfuyn2y2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHgFkwAKCRDj7w1vZxhR
xR7dAQDUsmxPNGS+rGoOg3pCp+4FevDlu8TAon1nvnQGWW17mAEA63okZYIc1T4q
tN/8/1My3nzjODBcoNImgljOJPz94AY=
=QTs0
-----END PGP SIGNATURE-----

--dssjutuvfuyn2y2e--
