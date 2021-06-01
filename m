Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080BB39323A
	for <lists+linux-doc@lfdr.de>; Thu, 27 May 2021 17:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235899AbhE0PRH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 May 2021 11:17:07 -0400
Received: from foss.arm.com ([217.140.110.172]:59152 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235643AbhE0PQX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 May 2021 11:16:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C0BF1516;
        Thu, 27 May 2021 08:14:48 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55AC63F85F;
        Thu, 27 May 2021 08:14:48 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id AE63D683943; Thu, 27 May 2021 16:14:46 +0100 (BST)
Date:   Thu, 27 May 2021 16:14:46 +0100
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Alison Wang <alison.wang@nxp.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Brian Starkey <brian.starkey@arm.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Eric Anholt <eric@anholt.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Huang Rui <ray.huang@amd.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        John Stultz <john.stultz@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Marek Vasut <marex@denx.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Steven Price <steven.price@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Zack Rusin <zackr@vmware.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YK+3Zizbg1Kn9779@e110455-lin.cambridge.arm.com>
References: <20210520142435.267873-1-maxime@cerno.tech>
 <YKsl2xGgTnIuQLaE@pendragon.ideasonboard.com>
 <20210525103940.chay5r3ns4alowvc@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210525103940.chay5r3ns4alowvc@gilmour>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Maxime,

On Tue, May 25, 2021 at 12:39:40PM +0200, Maxime Ripard wrote:
> 
> Hi Laurent,
> 
> On Mon, May 24, 2021 at 07:04:43AM +0300, Laurent Pinchart wrote:
> > Hi Maxime,
> > 
> > Thank you for the patch.
> > 
> > On Thu, May 20, 2021 at 04:24:35PM +0200, Maxime Ripard wrote:
> > > New KMS properties come with a bunch of requirements to avoid each
> > > driver from running their own, inconsistent, set of properties,
> > > eventually leading to issues like property conflicts, inconsistencies
> > > between drivers and semantics, etc.
> > > 
> > > Let's document what we expect.
> > > 
> > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Alison Wang <alison.wang@nxp.com>
> > > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > > Cc: Andrew Jeffery <andrew@aj.id.au>
> > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > Cc: Brian Starkey <brian.starkey@arm.com>
> > > Cc: Chen Feng <puck.chen@hisilicon.com>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > Cc: Edmund Dea <edmund.j.dea@intel.com>
> > > Cc: Eric Anholt <eric@anholt.net>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > Cc: Hans de Goede <hdegoede@redhat.com>
> > > Cc: "Heiko Stübner" <heiko@sntech.de>
> > > Cc: Huang Rui <ray.huang@amd.com>
> > > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > > Cc: Inki Dae <inki.dae@samsung.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > > Cc: Joel Stanley <joel@jms.id.au>
> > > Cc: John Stultz <john.stultz@linaro.org>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > > Cc: Jyri Sarha <jyri.sarha@iki.fi>
> > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > Cc: Marek Vasut <marex@denx.de>
> > > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > Cc: "Noralf Trønnes" <noralf@tronnes.org>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > > Cc: Paul Cercueil <paul@crapouillou.net>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Qiang Yu <yuq825@gmail.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Robert Foss <robert.foss@linaro.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Roland Scheidegger <sroland@vmware.com>
> > > Cc: Russell King <linux@armlinux.org.uk>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Sandy Huang <hjc@rock-chips.com>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Stefan Agner <stefan@agner.ch>
> > > Cc: Steven Price <steven.price@arm.com>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Tian Tao <tiantao6@hisilicon.com>
> > > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > Cc: Tomi Valkeinen <tomba@kernel.org>
> > > Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> > > Cc: Xinliang Liu <xinliang.liu@linaro.org>
> > > Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> > > Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> > > Cc: Zack Rusin <zackr@vmware.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > 
> > > ---
> > > 
> > > Changes from v2:
> > >   - Typos and wording reported by Daniel and Alex
> > > ---
> > >  Documentation/gpu/drm-kms.rst | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > > 
> > > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > > index 87e5023e3f55..c28b464dd397 100644
> > > --- a/Documentation/gpu/drm-kms.rst
> > > +++ b/Documentation/gpu/drm-kms.rst
> > > @@ -463,6 +463,25 @@ KMS Properties
> > >  This section of the documentation is primarily aimed at user-space developers.
> > >  For the driver APIs, see the other sections.
> > >  
> > > +Requirements
> > > +------------
> > > +
> > > +KMS drivers might need to add extra properties to support new features.
> > > +Each new property introduced in a driver need to meet a few
> > 
> > s/need/needs/
> > 
> > > +requirements, in addition to the one mentioned above.:
> > 
> > s/above./above/
> > 
> > > +
> > > +- It must be standardized, with some documentation to describe how the
> > > +  property can be used.
> > > +
> > > +- It must provide a generic helper in the core code to register that
> > > +  property on the object it attaches to.
> > > +
> > > +- Its content must be decoded by the core and provided in the object's
> > > +  associated state structure. That includes anything drivers might want to
> > > +  precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for planes.
> > 
> > Does this effectively mean that we completely forbid driver-specific
> > properties ? While I agree that we should strive for standardization,
> > there are two issues that worry me. The first one is simple, we may need
> > to control features that would be very device-specific, and
> > standardizing properties doesn't seem to make much sense in that case.
> 
> I'd say that we should make it clear in that case that it's
> driver-specific.
> 
> > The second issue relates to properties that could be applicable to
> > multiple devices, but for which we have a single driver. Designing a
> > standard with a single data point usually leads to a bad design. I'm not
> > sure how to handle this correctly though, as we certainly don't want
> > this to be taken as an excuse to create driver-specific properties when
> > generic properties would make sense.
> 
> The discussion that made us create that patch was about this property:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/sti/sti_hdmi.c#n170
> 
> It's all kind of bad:
>   - It kind of conflicts with the generic Colorspace property
>   - It's not really a colorspace (Not that "Colorspace" is either)
>   - It could have been made generic from the start
>   - We don't have any knowledge on who uses it and why, so it's
>     difficult to rework
> 
> This was introduced before we had any kind of rule or documentation on
> the UAPI though, so there's no-one to blame really but we don't really
> want to have something like that happen again.
> 
> I agree that doing something generic from the beginning can be
> difficult, but this is some userspace API that we will have to carry
> around forever, so it's worth it I guess?
> 
> You have a point on the vendor properties though. Maybe we can require a
> vendor prefix for those? It would reduce the risk of a conflict.

My suggestion is to reword the documentation patch to suggest that driver properties
should be first checked against generic properties and only if there is no conflict
then they can be added to the driver.

TBH, mandating that new properties should go straight into the core on the first
implementation (which is likely to be applicable to only one, maybe two drivers) is
increasing the maintainance burden. If userspace starts using those properties and
later on we figure out we need a change in syntax, we will have to maintain backwards
compatiblity with the old, broken properties. Adding a driver specific property first
and then working it into a more generic one is simpler, as the UAPI surface is
smaller.

Best regards,
Liviu

> 
> Maxime



-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
