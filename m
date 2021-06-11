Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6121F3A3C4D
	for <lists+linux-doc@lfdr.de>; Fri, 11 Jun 2021 08:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhFKGz3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Jun 2021 02:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhFKGz1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jun 2021 02:55:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5E4C061574
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 23:53:28 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71EC8B75;
        Fri, 11 Jun 2021 08:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623394404;
        bh=yjMZjw2BxmIhbRCgCTKRqt1JAVcVzWgaq+bS03eJXQs=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=SiSeJ5AVROGOL59HeOU9S33bskWFPqbemXzLeiMvmhoQUi7MPeIkJ/SBWAMWwI9/U
         pwG3GG0UlQZ1fvii17X1YX4wg+Vetw6tL9L93ciJrUKMhWSZtxDk/LH7cQ/IGaMm/H
         8xg+Uz/0koyTfrzlV0AHIFQu8tEEQO4vJfRfXX78=
To:     Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
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
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Eric Anholt <eric@anholt.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Marek Vasut <marex@denx.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
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
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Zack Rusin <zackr@vmware.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <20210611055407.aoeams62wbalodrj@gilmour>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <1cac781e-122f-568b-5f5a-7e0ceb94bd0b@ideasonboard.com>
Date:   Fri, 11 Jun 2021 09:53:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210611055407.aoeams62wbalodrj@gilmour>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/06/2021 08:54, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jun 10, 2021 at 11:00:05PM +0200, Daniel Vetter wrote:
>> On Thu, Jun 10, 2021 at 7:47 PM Maxime Ripard <maxime@cerno.tech> wrote:
>>>
>>> New KMS properties come with a bunch of requirements to avoid each
>>> driver from running their own, inconsistent, set of properties,
>>> eventually leading to issues like property conflicts, inconsistencies
>>> between drivers and semantics, etc.
>>>
>>> Let's document what we expect.
>>>
>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Alison Wang <alison.wang@nxp.com>
>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>> Cc: Andrew Jeffery <andrew@aj.id.au>
>>> Cc: Andrzej Hajda <a.hajda@samsung.com>
>>> Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>>> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>> Cc: Ben Skeggs <bskeggs@redhat.com>
>>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>>> Cc: Brian Starkey <brian.starkey@arm.com>
>>> Cc: Chen Feng <puck.chen@hisilicon.com>
>>> Cc: Chen-Yu Tsai <wens@csie.org>
>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>> Cc: "Christian K�nig" <christian.koenig@amd.com>
>>> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> Cc: Edmund Dea <edmund.j.dea@intel.com>
>>> Cc: Eric Anholt <eric@anholt.net>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Cc: "Heiko St�bner" <heiko@sntech.de>
>>> Cc: Huang Rui <ray.huang@amd.com>
>>> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
>>> Cc: Inki Dae <inki.dae@samsung.com>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
>>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>>> Cc: Joel Stanley <joel@jms.id.au>
>>> Cc: John Stultz <john.stultz@linaro.org>
>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
>>> Cc: Jyri Sarha <jyri.sarha@iki.fi>
>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
>>> Cc: Marek Vasut <marex@denx.de>
>>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Cc: Matthias Brugger <matthias.bgg@gmail.com>
>>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Melissa Wen <melissa.srw@gmail.com>
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
>>> Cc: "Noralf Tr�nnes" <noralf@tronnes.org>
>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>>> Cc: Paul Cercueil <paul@crapouillou.net>
>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>>> Cc: Qiang Yu <yuq825@gmail.com>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Robert Foss <robert.foss@linaro.org>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Roland Scheidegger <sroland@vmware.com>
>>> Cc: Russell King <linux@armlinux.org.uk>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Sandy Huang <hjc@rock-chips.com>
>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>> Cc: Stefan Agner <stefan@agner.ch>
>>> Cc: Steven Price <steven.price@arm.com>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: Thierry Reding <thierry.reding@gmail.com>
>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>> Cc: Tomi Valkeinen <tomba@kernel.org>
>>> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
>>> Cc: Xinliang Liu <xinliang.liu@linaro.org>
>>> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
>>> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
>>> Cc: Zack Rusin <zackr@vmware.com>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>
>>> ---
>>>
>>> Changes from v2:
>>>    - Take into account the feedback from Laurent and Lidiu to no longer
>>>      force generic properties, but prefix vendor-specific properties with
>>>      the vendor name
>>
>> I'm pretty sure my r-b was without this ...
> 
> Yeah, sorry. I wanted to tell you on IRC that you wanted to have a
> second look, but I shouldn't have kept it and caught you by surprise
> indeed.
> 
>> Why exactly do we need this? KMS is meant to be fairly generic (bugs
>> throw a wrench around here sometimes, and semantics can be tricky). If
>> we open up the door to yolo vendor properties in upstream, then that
>> goal is pretty much written off. And we've been there with vendor
>> properties, it's a giantic mess.
>>
>> Minimally drop my r-b, I'm definitely not in support of this idea.
> 
> So the argument Lidiu and Laurent made was that in some cases, getting a
> generic property right with only a couple of users is hard. So they
> advocated for the right to keep non-generic properties. I can get the
> argument, and no-one else said that was wrong, so it felt like the
> consensus was there.

I also think that (maybe mainly on embedded side) we may have 1) 
esoteric HW features which perhaps can't even be made generic, and 2) 
features which may or may not be generic, but for which support cannot 
be added to any common opensource userspace projects like X or Weston, 
as the only use cases for the features are specialized low level apps 
(often customer's closed-source apps).

While I agree with Daniel's "gigantic mess" problem, it would also be 
quite nice to have a way to support all the HW features upstream instead 
of carrying them in vendor trees.

  Tomi
