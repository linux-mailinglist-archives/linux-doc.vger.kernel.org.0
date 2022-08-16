Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6C759597D
	for <lists+linux-doc@lfdr.de>; Tue, 16 Aug 2022 13:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbiHPLJI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 Aug 2022 07:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235201AbiHPLIg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Aug 2022 07:08:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2B379EE2;
        Tue, 16 Aug 2022 03:36:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 940F060ED3;
        Tue, 16 Aug 2022 10:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61562C433C1;
        Tue, 16 Aug 2022 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660646195;
        bh=iOXSGtGGb7/LTwG0TCouGLbcXIpY5jR5zxVoRU1xG64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lUUOABwqNtfygdSbxVtRwiQcHdpC24YKzgZXj+DWz2eF1D/evnVSS/Hql8X4SdZ4L
         WQQurTRAs+dB9imN/fIDHYslwtDrMHA/aTWmV+YgQy8OCApUny7L+zJ26fr/xB9NY+
         BMghYD2aIx7nvS3FuCpENUJPvqy9djR3RCN/sUQqlRr+tw/RFZdWVtAmwngvEPnnJy
         b7u6tPu0fiawHefOc7mUDgKaohbk7S1fNy5qwX0xIodIgMfgb8z81pEnRtw03EH2VN
         jK2ekE0Cg1LOSL0u+FvR7jEsvnhly8YoYa9gDopXUFJLo399tuM0DdsIDu1am9P/gb
         /YaPwx1XnpXSg==
Date:   Tue, 16 Aug 2022 11:36:23 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        dri-devel@lists.freedesktop.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-amlogic@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Michael Turq uette <mturquette@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        linux-hwmon@vger.kernel.org, linux-clk@vger.kernel.org,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Robert Foss <robert.foss@linaro.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        David Airlie <airlied@linux.ie>, linux-iio@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <YvtzJw3jmocM0JFi@sirena.org.uk>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
 <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
 <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
 <YvrO+velKdYdGVve@sirena.org.uk>
 <57c312b3-ca5b-6efb-6356-43b6513a0c88@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MVZ75Zz0qn0/IYvJ"
Content-Disposition: inline
In-Reply-To: <57c312b3-ca5b-6efb-6356-43b6513a0c88@gmail.com>
X-Cookie: A bachelor is an unaltared male.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--MVZ75Zz0qn0/IYvJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 07:56:06AM +0300, Matti Vaittinen wrote:
> On 8/16/22 01:55, Mark Brown wrote:
> > On Tue, Aug 16, 2022 at 12:17:17AM +0300, Laurent Pinchart wrote:

> > > These devres helpers give
> > > a false sense of security to driver authors and they will end up
> > > introducing problems, the same way that devm_kzalloc() makes it
> > > outrageously easy to crash the kernel by disconnecting a device that is
> > > in use.

> I think this is going a bit "off-topic" but I'd like to understand what is
> behind this statement? From device-writer's perspective - I don't know much
> better alternatives to free up the memory. I don't see how freeing stuff at
> .remove would be any better? As far as I understand - if someone is using
> driver's resources after the device has gone and the driver is detached,
> then there is not much the driver could do to free-up the stuff be it devm
> or not? This sounds like fundamentally different problem (to me).

If a driver has done something like create a file that's accessible to
userspace then that file may be held open by userspace even after the
device goes away, the driver that created the file needs to ensure that
any storage that's used by the file remains allocated until the file is
also freed (typically this is data specific to the file rather than the
full device data).  Similar situations can exist elsewhere, that's just
the common case.  There'll be a deletion callback on whatever other
object causes the problem, the allocation needs to be reference counted
against both the the device and whatever other users there might be.

> > That's a different conversation, and a totally
> > valid one especially when you start looking at things like implementing
> > userspace APIs which need to cope with hardware going away while still
> > visible to userspace.

> This is interesting. It's not easy for me to spot how devm changes things
> here? If we consider some removable device - then I guess also the .remove()
> is ran only after HW has already gone? Yes, devm might make the time window
> when userspace can see hardware that has gone longer but does it bring any
> new problem there? It seems to me devm can make hitting the spot more likely
> - but I don't think it brings completely new issues? (Well, I may be wrong
> here - wouldn't be the first time :])

See above, something can still know the device was there even after it's
gone.

--MVZ75Zz0qn0/IYvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7cycACgkQJNaLcl1U
h9CzyQf/bDMqScPGw8MQIW6yZaN+9P25oNyQJTQ0X6hRYgasG5lC1b2j2/0LCuJQ
0Flnz8b/wQI5LbmpExV6c8/Kt/xKopO8No6Af3gUUtkUNPQYHn0CJoB9HDQmSBe+
uVrf5bEH9+GCi7WumAXuvFxT73bF4jt4WVbhNzBAGDD4hnxAF9hpyhSJ9uWS+b2z
f+b77s+ubFb6gbYAqAVnq06cStPvi8aZrAT3UjDUVe3vF8LGQiz7VIdeFA0m0nVl
eQNPvf5a0fCYw0M93B570wvMMPiX1lmfNt6iAWHwq9rKryHWKxB3Ntj5z+5EKDep
0DAfDf7LZH1UUNZzCXclRPka0Fd9kw==
=RD3o
-----END PGP SIGNATURE-----

--MVZ75Zz0qn0/IYvJ--
