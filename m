Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D00E5A6DA8
	for <lists+linux-doc@lfdr.de>; Tue, 30 Aug 2022 21:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbiH3Tne (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Aug 2022 15:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbiH3TnI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Aug 2022 15:43:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FD773900;
        Tue, 30 Aug 2022 12:42:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54AC2B81DB7;
        Tue, 30 Aug 2022 19:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABA4C433D7;
        Tue, 30 Aug 2022 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661888565;
        bh=+cGXZMI2oEXKgWxb9ZJXDzYjbbc2gJTCUd+EAG1qVPM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LYpYi+hA+j838eO7PaAlm6hujUBT/ozW55UwaoOz2+nwvC/lvCzYZchAfH2IlWFtx
         BL/C94gwh7XgqP5VAIgYmNDlAI0asdiWjkKXPxFY6f4AqPGlfEMR4ZL+SXXB4OtGOJ
         D3oPjR4HANLtqLoltwJZvh1+0UW9ey0vQ+GMDWL3Fn+Zd/Sn9GERIYCjMxXbQ38Z+j
         Tc1NH80aBwAE/KSjp+yQKJ8uuazJ5JsdnSJwk1PINDKVMjrkizHLfzcwKshkAbp8TA
         VnuSHSB6lcAQ0YUoHD8HLLF0mYhQ1MtyGV9Csn8H7mCqJih2C0sTv5L9JOT3k5/SRl
         E8CelWuDuqlTA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YvrDp32/TknqV05t@sirena.org.uk>
References: <cover.1660292316.git.mazziesaccount@gmail.com> <166057828406.697572.228317501909350108.b4-ty@kernel.org> <YvpsRbguMXn74GhR@pendragon.ideasonboard.com> <Yvp1Qkuh7xfeb/B2@sirena.org.uk> <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com> <20220815205857.308B1C433D6@smtp.kernel.org> <YvrDp32/TknqV05t@sirena.org.uk>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
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
        Nuno =?utf-8?q?S=C3=A1?= <nuno.sa@analog.com>,
        Robert Foss <robert.foss@linaro.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        David Airlie <airlied@linux.ie>, linux-iio@vger.kernel.org
To:     Mark Brown <broonie@kernel.org>
Date:   Tue, 30 Aug 2022 12:42:42 -0700
User-Agent: alot/0.10
Message-Id: <20220830194244.DABA4C433D7@smtp.kernel.org>
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Mark Brown (2022-08-15 15:07:35)
> On Mon, Aug 15, 2022 at 01:58:55PM -0700, Stephen Boyd wrote:
>=20
> > I think the main issue is that platform drivers are being asked to do
> > too much. We've put the burden on platform driver authors to intimately
> > understand how their devices are integrated, and as we all know they're
>=20
> This is for the regulator API, it's mainly for off SoC devices so it's
> not a question of understanding the integration of a device into a piece
> of silicon, it's a question of understanding the integration of a chip
> into a board which seems reasonably in scope for a chip driver and is
> certainly the sort of thing that you'd be talking to your customers
> about as a silicon vendor.

Right. I'm coming from the devm_clk_get_*() APIs angle when saying that
platform drivers don't want to know everything.

>=20
> > The basic idea is that drivers should be focused on what they're
> > driving, not navigating the (sometimes) complex integration that's
> > taking place around them. When a device driver probe function is called
> > the device should already be powered on. When the driver is
> > removed/unbound, the power should be removed after the driver's remove
> > function is called. We're only going to be able to solve the power
> > sequencing and ordering problem by taking away power control and
> > sequencing from drivers.
>=20
> That is a sensible approach for most on SoC things but for something
> shipped as a separate driver there's little point in separating the
> power and clocking domain driver from the device since there's typically
> a 1:1 mapping.  Usually either it's extremely simple (eg, turn
> everything on and remove reset) but some devices really need to manage
> things.  There's obviously some edge cases in SoC integration as well
> (eg, the need to manage card supplies for SD controllers, or knowing
> exact clock rates for things like audio controllers) so you need some
> flex.

I think we're on the same page. The clk API bridges both on SoC and off
SoC devices, but leans more towards on SoC devices so I'm coming from
that angle.=20

I agree it doesn't make sense to rip out and move power management logic
for off SoC devices (your chip driver), because then you get a driver
that is split to two places. The hardware engineer for those types of
devices has designed the chip to be more aware of the system integration
and how their chip is powered, so that it can be easily integrated into
various designs without their involvement. This allows it to be used on
numerous boards and that's partly the reason why Linux doesn't have
board files or board "drivers" because the combinatorial explosion is
unmanageable, hence DTS and driver subsystems. The boundary of the
combinations ends at the chip which is 1:1 with the platform driver.

For on SoC devices, the hardware engineer typically isn't involved in
the system integration at all. Instead they hand that task off to the
SoC integrator who has to wire everything up (clks, power, resets) and
layout the SoC. The combinatorial explosion isn't possible here, because
only so many SoCs are ever created and customers can't rewire the
internals of the SoC to change which clks go there (although I guess
with FPGAs this may be possible). The boundary where the combinations
exist is at the device level, not the SoC level, but we've encoded the
SoC details into the compatible strings and the drivers to the point
that the boundary is pushed to the SoC level.

For these on SoC devices, we should extract and consolidate the power
management logic away from the drivers, because we're spreading the SoC
integration knowledge all around the drivers/ directory for every device
class that exists in that SoC. I continue to see drivers that get
another clk in the next SoC generation because there was some change to
split a clk domain or they get another regulator because they split a
power domain. The driver doesn't care, but it has to match a new
compatible string and then get the proper list of clks or regulators
even though it just wants to turn the thing on and get it running. This
gunk needs to go. Runtime PM is a solution to part of the problem, but I
think RPM ops should be about poking device registers for these on SoC
devices, not about controlling yet another clk or regulator that got
wired up this SoC generation.

Probably we need to get away from having platform driver probe for on
SoC devices get resources like clks, regulators, and interconnects at
all. Instead, those should be managed by some "SoC" driver that knows
the integration of the SoC and can make sure the proper power sequencing
is followed. Hopefully we can do this largely via genpd and RPM, with a
little bit of help from some SoC driver that registers genpds for
devices under /soc. Of course there are exact clk frequencies required
sometimes (audio rates, display link rates, serial baud rates, etc.) but
those sorts of things could use a higher level of abstraction so that we
don't get bogged down in the details of which clk needs to be used to
set the clk frequency when this compatible is present. Maybe
dev_pm_opp_set_rate() is the answer there, but then we have some drivers
that call clk APIs like clk_round_rate() that we'll need to figure out
how to manage.

Long story short, there's a need for both approaches so that we can
manage the combinatorial complexity at the place where it is. I hope the
devm APIs are going to help us find that place so we can come up with a
solution to the "drivers don't want to know" problem when we see that
XYZ driver can use a genpd that turns on the power along with RPM to
turn it off during suspend.
