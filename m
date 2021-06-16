Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFA23AA5E6
	for <lists+linux-doc@lfdr.de>; Wed, 16 Jun 2021 23:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233864AbhFPVHy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Jun 2021 17:07:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34154 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbhFPVHx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 17:07:53 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21F5AFC9;
        Wed, 16 Jun 2021 23:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623877545;
        bh=2IBPWP7hn6ucwodbxtkHel4D6eOZPP8Ec1jAvIB9tpo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RokUqXx2zOiLscgJQ8kMnrPUp7wLhensj/HpKU912X7Gd3s4AAYn6/hcKsSMShbHr
         66f4J3p2xuUrDWgNtoT+gqvNcExviSmT5r0kvSt3bq4YAtM/tkSLTC+ZvSuPUxaAiK
         0ZBy8fbZaz6qZF4IuVpJkL7alvqnhmyCzuc1dQCE=
Date:   Thu, 17 Jun 2021 00:05:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pekka Paalanen <ppaalanen@gmail.com>
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
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
References: <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
 <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <20210614174912.15a49336@eldfell>
 <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
 <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
 <20210615100335.0b8f96d5@eldfell>
 <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
 <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
 <20210615131656.2ecefdc4@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210615131656.2ecefdc4@eldfell>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrote:
> On Tue, 15 Jun 2021 12:45:57 +0300 Laurent Pinchart wrote:
> > On Tue, Jun 15, 2021 at 07:15:18AM +0000, Simon Ser wrote:
> > > On Tuesday, June 15th, 2021 at 09:03, Pekka Paalanen wrote:
> > >   
> > > > indeed it will, but what else could one do to test userspace KMS
> > > > clients in generic CI where all you can have is virtual hardware? Maybe
> > > > in the long run VKMS needs to loop back to a userspace daemon that
> > > > implements all the complex processing and returns the writeback result
> > > > via VKMS again? That daemon would then need a single upstream, like the
> > > > kernel, where it is maintained and correctness verified.  
> > > 
> > > The complex processing must be implemented even without write-back, because
> > > user-space can ask for CRCs of the CRTC.
> > >   
> > > > Or an LD_PRELOAD that hijacks all KMS ioctls and implements virtual
> > > > stuff in userspace? Didn't someone already have something like that?
> > > > It would need to be lifted to be a required part of kernel UAPI
> > > > submissions, I suppose like IGT is nowadays.  
> > > 
> > > FWIW, I have a mock libdrm [1] for libliftoff. This is nowhere near a full
> > > software implementation with write-back connectors, but allows to expose
> > > virtual planes and check atomic commits in CI.
> > > 
> > > [1]: https://github.com/emersion/libliftoff/blob/master/test/libdrm_mock.c
> > >   
> > > > For compositor developers like me knowing the exact formulas would be a huge
> > > > benefit as it would allow me to use KMS to off-load precision-sensitive
> > > > operations (e.g.  professional color management). Otherwise, compositors
> > > > probably need a switch: "high quality color management? Then do not use KMS
> > > > features."  
> > > 
> > > I think for alpha blending there are already rounding issues depending on the
> > > hardware. I wouldn't keep my hopes up for any guarantee that all hw uses the
> > > exact same formulae for color management stuff.  
> > 
> > Good, because otherwise you would be very quickly disappointed :-)
> > 
> > For scaling we would also need to replicate the exact same filter taps,
> > which are often not documented.
> 
> That is where the documented tolerances come into play.

This is something I've experimented with a while ago, when developing
automated tests for the rcar-du driver. When playing with different
input images we had to constantly increases tolerances, up to a point
where the tests started to miss real problems :-(

> Userspace projects need screenshot-based testing, and we need to know
> how much tolerance we should allow or expect.
> 
> Good reminder about CRCs. CRCs have zero tolerance, so they are not
> useful for testing properties that have any leeway, are they?

-- 
Regards,

Laurent Pinchart
