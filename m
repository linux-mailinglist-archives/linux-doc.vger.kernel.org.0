Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131A478DC1D
	for <lists+linux-doc@lfdr.de>; Wed, 30 Aug 2023 20:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238445AbjH3Sht (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 30 Aug 2023 14:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242863AbjH3Jxt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Aug 2023 05:53:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9571B0;
        Wed, 30 Aug 2023 02:53:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 029656130E;
        Wed, 30 Aug 2023 09:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E347BC433C7;
        Wed, 30 Aug 2023 09:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693389225;
        bh=w+1a6zEPU4pcIGBrXOrm5TZPI0iO1MQnan2XAxPaS3w=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=JMQQ83SQXGwS1eP8V+91F0G/ErnzPmsPJtRN1ewG/o1NKiv/foNFWs1p3kl8eg0bK
         bEvzDr6PMJS/lzPJtHhjJMlrQTeJaBaQmzz78NM8La1bCzevfCfuo9/PZTc9DSo5kf
         mBxQDHr8Eo/blyauhxB8O1/RZyd0hemypcuuhNaxp3RiQdEF5iqtn8g34dN5W4zmTs
         BsvOmgbCNK9lIPpcpe4l0QJhARZoJ+Q7kSpyJL5/g2Ptu6lljgJlQujhTR10QQpEQJ
         AmQEkVFR2OCf+aef5wSKk8hsfLycF6idIPUz0wpney2H4dwZaw3z4beqr121Fp10TU
         ig+RC0unInN1A==
Date:   Wed, 30 Aug 2023 11:53:42 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Helen Koike <helen.koike@collabora.com>,
        dri-devel@lists.freedesktop.org, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
        daniels@collabora.com, emma@anholt.net, robclark@freedesktop.org,
        gustavo.padovan@collabora.com, robdclark@google.com,
        anholt@google.com, maarten.lankhorst@linux.intel.com,
        tzimmermann@suse.de, airlied@gmail.com, corbet@lwn.net,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        heiko@sntech.de, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
Message-ID: <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
References: <20230811171953.176431-1-helen.koike@collabora.com>
 <ZOTFfhtzzWkrQ23Y@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ahpuv6hd6ml66bjn"
Content-Disposition: inline
In-Reply-To: <ZOTFfhtzzWkrQ23Y@phenom.ffwll.local>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--ahpuv6hd6ml66bjn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 04:26:06PM +0200, Daniel Vetter wrote:
> On Fri, Aug 11, 2023 at 02:19:53PM -0300, Helen Koike wrote:
> > From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >=20
> > Developers can easily execute several tests on different devices
> > by just pushing their branch to their fork in a repository hosted
> > on gitlab.freedesktop.org which has an infrastructure to run jobs
> > in several runners and farms with different devices.
> >=20
> > There are also other automated tools that uprev dependencies,
> > monitor the infra, and so on that are already used by the Mesa
> > project, and we can reuse them too.
> >=20
> > Also, store expectations about what the DRM drivers are supposed
> > to pass in the IGT test suite. By storing the test expectations
> > along with the code, we can make sure both stay in sync with each
> > other so we can know when a code change breaks those expectations.
> >=20
> > Also, include a configuration file that points to the out-of-tree
> > CI scripts.
> >=20
> > This will allow all contributors to drm to reuse the infrastructure
> > already in gitlab.freedesktop.org to test the driver on several
> > generations of the hardware.
> >=20
> > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > Acked-by: Daniel Stone <daniels@collabora.com>
> > Acked-by: Rob Clark <robdclark@gmail.com>
> > Tested-by: Rob Clark <robdclark@gmail.com>
>=20
> Ok I pushed this into a topic/drm-ci branch in drm.git and asked sfr to
> include that branch in linux-next.
>=20
> But also I'd like to see a lot more acks here, we should be able to at
> least pile up a bunch of (driver) maintainers from drm-misc in support of
> this. Also maybe media, at least I've heard noises that they're maybe
> interested too? Plus anyone else, the more the better.

I'm not really convinced by that approach at all, and most of the issues
I see are shown by the follow-up series here:

https://lore.kernel.org/dri-devel/20230825122435.316272-1-vignesh.raman@col=
labora.com/

  * We hardcode a CI farm setup into the kernel

  * We cannot trust that the code being run is actually the one being
    pushed into gitlab

  * IMO, and I know we disagree here, any IGT test we enable for a given
    platform should work, period. Allowing failures and flaky tests just
    sweeps whatever issue is there under the rug. If the test is at
    fault, we should fix the test, if the driver / kernel is at fault,
    then I certainly want to know about it.

  * This then leads to patches like this one:
    https://lore.kernel.org/dri-devel/20230825122435.316272-6-vignesh.raman=
@collabora.com/

    Which (and it's definitely not the author's fault) are just plain
    unreadable, reproducable or auditable by anyone not heavily involved
    in the CI farm operations and the platforms being tested.

That being said, I don't have anything better to suggest than what I
already did, and it looks like I'm alone in thinking that those are
problems, so feel free to add my ack if you want to.

Maxime

--ahpuv6hd6ml66bjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZO8RpgAKCRDj7w1vZxhR
xUrIAP9QRFVLlssVVu4MLlSOKUv+Pxp3R2Dpzn9Wuq/tBNYLjwD9Hb2bhr9MDmXJ
KAfdcUBPisWAmKWsl9QlqxaqFbtvvQM=
=RdhW
-----END PGP SIGNATURE-----

--ahpuv6hd6ml66bjn--
