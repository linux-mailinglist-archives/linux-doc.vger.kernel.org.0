Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D78E3AB4E7
	for <lists+linux-doc@lfdr.de>; Thu, 17 Jun 2021 15:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbhFQNkA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Jun 2021 09:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbhFQNju (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 09:39:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0532C061574
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 06:37:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF4DCE7B;
        Thu, 17 Jun 2021 15:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623937057;
        bh=Qs2XutlvAV6qs/FOjkiJtjYY5NxqRPFyXp4MbKdnPvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PDrQxnJ/DwBlNMyD0pMlOERaqLrYTbFgYV04C6zOfKFX+lVGRq9dSpYtqmL03F4Jf
         3fY6tgUB6mRXdYAeuSvmOI4oMGBhWHCJkQBtdQi9K99ePTRepQybMeTt15pIKXu1lC
         2Xowib49SmLnF88q4fivEhrFqkVPfQW1QwxemtrM=
Date:   Thu, 17 Jun 2021 16:37:14 +0300
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
Message-ID: <YMtQClnvjGNDhn9q@pendragon.ideasonboard.com>
References: <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
 <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
 <20210615100335.0b8f96d5@eldfell>
 <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
 <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
 <20210615131656.2ecefdc4@eldfell>
 <YMpnlDmzn0Re4Urn@pendragon.ideasonboard.com>
 <20210617102701.28f820b2@eldfell>
 <YMskHF8Bo/z3kqxf@pendragon.ideasonboard.com>
 <20210617143311.19896458@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210617143311.19896458@eldfell>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Pekka,

On Thu, Jun 17, 2021 at 02:33:11PM +0300, Pekka Paalanen wrote:
> On Thu, 17 Jun 2021 13:29:48 +0300 Laurent Pinchart wrote:
> > On Thu, Jun 17, 2021 at 10:27:01AM +0300, Pekka Paalanen wrote:
> > > On Thu, 17 Jun 2021 00:05:24 +0300 Laurent Pinchart wrote:  
> > > > On Tue, Jun 15, 2021 at 01:16:56PM +0300, Pekka Paalanen wrote:  
> > > > > On Tue, 15 Jun 2021 12:45:57 +0300 Laurent Pinchart wrote:    
> > > > > > On Tue, Jun 15, 2021 at 07:15:18AM +0000, Simon Ser wrote:    
> > > > > > > On Tuesday, June 15th, 2021 at 09:03, Pekka Paalanen wrote:
> > > > > > >       
> > > > > > > > indeed it will, but what else could one do to test userspace KMS
> > > > > > > > clients in generic CI where all you can have is virtual hardware? Maybe
> > > > > > > > in the long run VKMS needs to loop back to a userspace daemon that
> > > > > > > > implements all the complex processing and returns the writeback result
> > > > > > > > via VKMS again? That daemon would then need a single upstream, like the
> > > > > > > > kernel, where it is maintained and correctness verified.      
> > > > > > > 
> > > > > > > The complex processing must be implemented even without write-back, because
> > > > > > > user-space can ask for CRCs of the CRTC.
> > > > > > >       
> > > > > > > > Or an LD_PRELOAD that hijacks all KMS ioctls and implements virtual
> > > > > > > > stuff in userspace? Didn't someone already have something like that?
> > > > > > > > It would need to be lifted to be a required part of kernel UAPI
> > > > > > > > submissions, I suppose like IGT is nowadays.      
> > > > > > > 
> > > > > > > FWIW, I have a mock libdrm [1] for libliftoff. This is nowhere near a full
> > > > > > > software implementation with write-back connectors, but allows to expose
> > > > > > > virtual planes and check atomic commits in CI.
> > > > > > > 
> > > > > > > [1]: https://github.com/emersion/libliftoff/blob/master/test/libdrm_mock.c
> > > > > > >       
> > > > > > > > For compositor developers like me knowing the exact formulas would be a huge
> > > > > > > > benefit as it would allow me to use KMS to off-load precision-sensitive
> > > > > > > > operations (e.g.  professional color management). Otherwise, compositors
> > > > > > > > probably need a switch: "high quality color management? Then do not use KMS
> > > > > > > > features."      
> > > > > > > 
> > > > > > > I think for alpha blending there are already rounding issues depending on the
> > > > > > > hardware. I wouldn't keep my hopes up for any guarantee that all hw uses the
> > > > > > > exact same formulae for color management stuff.      
> > > > > > 
> > > > > > Good, because otherwise you would be very quickly disappointed :-)
> > > > > > 
> > > > > > For scaling we would also need to replicate the exact same filter taps,
> > > > > > which are often not documented.    
> > > > > 
> > > > > That is where the documented tolerances come into play.    
> > > > 
> > > > This is something I've experimented with a while ago, when developing
> > > > automated tests for the rcar-du driver. When playing with different
> > > > input images we had to constantly increases tolerances, up to a point
> > > > where the tests started to miss real problems :-(  
> > > 
> > > What should we infer from that? That the hardware is broken and
> > > exposing those KMS properties is a false promise?  
> > 
> > No, just that the scaler doesn't document the internal hardware
> > implementation (number of taps in the filters, coefficients, rounding,
> > ...). That's the rule, not the exception, and it doesn't prevent correct
> > operation, images get scaled in a reproducible way (the same input
> > produces the same output).
> > 
> > > If a driver on certain hardware cannot correctly implement a KMS
> > > property over the full domain of the input space, should that driver
> > > then simply not expose the KMS property at all?  
> > 
> > The properties involved here would the the SRC and CRTC rectangles for
> > the planes. They don't document pixel-perfect scaling :-)
> > 
> > > But I would assume that the vendor still wants to expose the features
> > > in upstream kernels, yet they cannot use the standard KMS properties
> > > for that. Should the driver then expose vendor-specific properties with
> > > the disclaimer that the result is not always what one would expect, so
> > > that userspace written and tested explicitly for that hardware can
> > > still work?
> > > 
> > > That is, a sufficient justification for a vendor-specific KMS property
> > > would be that a standard property already exists, but the hardware is
> > > too buggy to make it work. IOW, give up trying to make sense.  
> > 
> > It's not just about buggy hardware, it's also about implementation
> > specificities, such as rounding, filters, order of operations in the
> > color management pipeline (it's relatively easy when you only have two
> > LUTs and a CCM matrix, but if you through 3D LUTs and other tonemapping
> > features in the mix, not all hardware will implement the same pipeline),
> > or various types of image compression (this device implements a
> > "near-lossless" compression scheme that reduces the memory bandwidth by
> > 50% for instance).
> 
> Rounding shouldn't result in needing wide tolerances.
> 
> Filters are more difficult, but at least we can factor them out when
> testing other things. Filters could be tested in isolation with some
> image difference metrics rather than per-pixel independent comparisons.

The metrics I was using had both a tolerance on the pixel value and on
the number of pixels accepted outside of the value tolerance. I'm sure
we can improve it (perhaps taking locality into account), but that's
heuristics, and keeping heuristics working across a wide variety of use
cases is hard.

The filter I mentioned, by the way, is the scaler filter. Out of
curiosity, do any of the devices you work on document with pixel-perfect
precision how the hardware scaler is implemented ?

> The order of operations in the color management pipeline is very
> important. We can't work with "whatever". All the variability in
> hardware is exactly why I have been calling out for defined abstract
> color pipeline in the DRM UAPI docs, so that drivers would know which
> properties to map to their elements, so that userspace can have any
> possibility of using them correctly. If the hardware has a block
> that doesn't fit in the abstract pipeline, you get to add things to the
> abstract pipeline, or invent a whole another abstract pipeline and
> document that.

One very typical difference between devices is the order of the
processing blocks. By modelling the KMS pipeline as degamma -> ccm ->
gamma, we can accommodate hardware that have any combination of
[1-2] * 1D LUTs + 1 * CCM. Now, throw one 3D LUT into the mix, at
different points in the pipeline depending on the device, and it will
start getting complicated, even if the use case is quite simple and
common. This is getting a bit out of topic, but how would you solve this
one in particular ?

> Lossy compression needs its own KMS properties to ensure it can be
> disabled when necessary. Near-lossless is not lossless, if a difference
> can be measured. The driver or hardware cannot guess if the end user is
> ok with "near-lossless" or not, so you have to be conservative and
> assume not ok, offering an opt-in for lossy.

Sure, but what would be the barrier to entry for such a property that
would enable the compression (it could actually be a pixel format
modifier) ? Would it only need to be documented ? Would we need a
software implementation in VKMS and/or in IGT ? The compression
algorithm is proprietary and not documented, so the latter can't be
done.

> ...
> 
> > > My underlying assumption is that generic userspace will not use
> > > vendor-specific properties.  
> > 
> > I expect some amount of device-specific code in userspace, yes. 
> 
> If we had a reliable way to test device-specific code without the
> hardware and automatically in CI, then maybe.
> 
> > There are usually large variations in how the hardware exposes access to
> > a given feature, which leads to code having to convert the standard API
> > parameters to hardware parameters. To a large extend this can be done in
> > drivers, but for some more complex features, it may put too much burden
> > on the kernel. There's a reason mesa is a userspace stack :-)
> 
> If we get a Khronos standardised 2D composition API... oh wait.
> 
> Nothing wrong with userspace libraries, but it does mean that driver
> developers need to contribute to them, like they do to Mesa. Is there
> any of that going on for KMS?

Not that I'm aware of, but I think that's a direction we can consider
seriously.

> In the mean time, DRM UAPI basically must define a 2D composition API,
> or the new KMS properties will not see use outside of vendor trees.
> 
> > > Or, since we have atomic commits with TEST_ONLY, should it be driver's
> > > responsibility to carefully inspect the full state and reject the
> > > commit if the hardware is incapable of implementing it correctly?
> > > Vendor-specific userspace would know to avoid failing configurations to
> > > begin with. I suppose that might put an endless whack-a-mole game on
> > > drivers though.

-- 
Regards,

Laurent Pinchart
