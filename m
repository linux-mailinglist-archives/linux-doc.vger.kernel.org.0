Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582F43A6A00
	for <lists+linux-doc@lfdr.de>; Mon, 14 Jun 2021 17:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbhFNP0T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Jun 2021 11:26:19 -0400
Received: from foss.arm.com ([217.140.110.172]:38608 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232809AbhFNP0S (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jun 2021 11:26:18 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8044C11D4;
        Mon, 14 Jun 2021 08:24:15 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4005A3F793;
        Mon, 14 Jun 2021 08:24:15 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id E51D5682B70; Mon, 14 Jun 2021 16:24:13 +0100 (BST)
Date:   Mon, 14 Jun 2021 16:24:13 +0100
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Simon Ser <contact@emersion.fr>,
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
Message-ID: <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <KNFHfqvJUVq9oy9BSdznj1S6xhDoZUAx1_DwfSNvUv8u1d-TroKBTq2hxtv7u1aJnxnpI5CxUXSMTn73YsVhZjnRW78gv-QLsK6AkJ5m3Fw=@emersion.fr>
 <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <20210614174912.15a49336@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210614174912.15a49336@eldfell>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 14, 2021 at 05:49:12PM +0300, Pekka Paalanen wrote:
> On Fri, 11 Jun 2021 13:03:09 +0100
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > On Fri, Jun 11, 2021 at 08:14:59AM +0000, Simon Ser wrote:
> > > On Thursday, June 10th, 2021 at 23:00, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >   
> > > > If there's a strong consensus that we really need this then I'm not
> > > > going to nack this, but this really needs a pile of acks from
> > > > compositor folks that they're willing to live with the resulting
> > > > fallout this will likely bring. Your cc list seems to have an absence
> > > > of compositor folks, but instead every driver maintainer. That's
> > > > backwards. We make uapi for userspace, not for kernel driver
> > > > maintainers!  
> > > 
> > > In wlroots we have a policy of only allowing standard KMS properties to
> > > be used. Any vendor-specific property is going to be less well-defined,
> > > less widely useful, potentially have more design issues, potentially
> > > overlap in functionality with other vendor-specific properties, likely
> > > have some hardware-specific assumptions, etc.
> > > 
> > > What matters here is discussing with other driver & user-space folks to
> > > make sure the new property's design is sound. Designing uAPI is hard.
> > > 
> > > If kernel folks are struggling with a user-space implementation, they
> > > should discuss with user-space folks to see which project would be
> > > interested. There's a chance a compositor will be interested in the new
> > > property and will just do the user-space part for you, if not we can
> > > suggest candidate projects.
> > > 
> > > tl;dr strong agree with Daniel here.  
> > 
> > I think the assumption you and Daniel are making is that the first implementation of
> > a new KMS property can be made standard from day one and that it will work for any
> > late comer driver as is, without having to make changes to its behaviour in a
> > significant way. In my experience that is not the case.
> > 
> > I think we have moved from the times when we were trying to implement in the Linux
> > world features that were available in the hardware but needed a kernel and userspace
> > API. The set of properties that exist in KMS cover a lot of needed functionality and
> > I don't expect to see new properties for stuff that is already supported by hardware.
> > 
> > What I'm expected to see in the future is new functionality that gets implemented by
> > one hardware vendor and the kernel developers trying to enable that for userspace. It
> > could be that the new property is generic, but there is no way of testing that on
> > more than one implementation yet, so I'd say we are generous calling it "standard
> > property". When the second or third hardware vendor comes along and starts supporting
> > that property with their own set of extra requirements, then we can call it
> > "standard".
> 
> I agree that is a problem with trying to make generic anything. But it
> does not mean you should not even try. Maybe trying really hard saves a
> couple revisions.

Agree.

> 
> What I think should be planned for is revisions. How to add new
> properties that do the same thing but better, while documenting that a
> userspace KMS client can use only one revision at a time. You never
> remove old revisions, unless maybe with a DRM client cap they
> could disappear from that file description if that is necessary for
> seeing the new revision.
> 
> While designing this, one also needs to take into account that KMS
> clients need to be able to save and restore properties *they do not
> understand*. So exposing two revisions of the same feature
> simultaneously would break save/restore is that's an error.

I quite like the idea of having versions for properties.

> 
> > Then comes the effort cost: would it be easier to start with a vendor
> > property that only the vendor needs to support (and can submit patches into the
> > compositors to do so) and when the standard property gets added moves to that, or
> 
> But you can't move, you can only add? You can't delete the old property
> in kernel if it was ever released with a kernel and anyone used it. In
> the same sentence you also imply that there is a user of it, so
> removing it will break that user. Then you'll have to track the
> userspace lifetime to figure out which decade you can try removing it.

Not that I am supporting the workflow, but I was trying to address the comments that
vendors are going to push their own userspace implementation for their vendor
properties. If that is the case, when they switch to the standard ones they can drop
the support in userspace for their changes. With the implied assumption that you will
have fewer vendor implementations hence easier to make changes, KMS properties can be
deleted if you know there is no user of them (e.g. the vendor has upgraded all their
software to the standard property).

> 
> > should we start with a generic property that gets implemented by the compositors
> > (maybe, but then only one vendor supports it) and then later when we actually
> > standardise the property we will have to carry backwards compatibility code in the
> > kernel to handle the old behaviour for old userspace? My proposal to Maxime was for
> > the former option to be reflected in the documentation, but I would like to hear your
> > thoughts.
> 
> You have to carry the backward compatibility in all cases, right?
> 
> Userspace OTOH can drop support for older less supported KMS properties
> while taking advantage of a new revision. Userspace is not required to
> support old kernels forever.
> 
> 
> Here's a wild counter-proposal off a tangent:
> 
> How about we make "implemented in and testable with VKMS" the rule,
> instead of "is generic" for new properties?
> 
> VKMS is what compositors (will) use in CI. I would feel hugely less bad
> about using a property that only one hardware driver ever implements,
> if also VKMS implements it in a way that compositor CI can observe it
> working.
> 
> I don't expect this proposal to be accepted, but it's food for thought.
> The major problem for compositor projects is testing as you usually
> don't have the hardware, IMO. CI tends to not have any hardware.

While I don't dislike the proposal (I think it is quite sensible), I am worried that
for some behaviours VKMS will implement them in a quirky way. To pick (again) the
example of writeback, real hardware will have a way to tell if the buffer has been
sent successfully to memory and it might take more than one refresh period, while
VKMS (if I remember correctly) fakes it and signals the fence at the next vblank. If
you code your compositor based on VKMS you might get unexpected artifacts on real
hardware.

Best regards,
Liviu


> 
> 
> Thanks,
> pq



-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
