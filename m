Return-Path: <linux-doc+bounces-43177-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C059A89C58
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 13:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3E01887512
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 11:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D439D297A5C;
	Tue, 15 Apr 2025 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lq4OFBo5"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD429A3E3;
	Tue, 15 Apr 2025 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716147; cv=none; b=oG5XNsBIuMmtWVwjQHCcj2USEUvS9+pkXWr6FAFoF2apDwaSLI6WEtgK9u3jOAbQTALZrbCI8FcCvlRR+UtbVaRQNIDdD8hg7kiUBWY5nBHFpJ86qW01ls+0wqfEicx10DyhF8oyMjqkePBPXVQchPlqIxnHEGHFKlxEM5FyYYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716147; c=relaxed/simple;
	bh=ycEo2Z8x5NpwyAIKbT3u/HI0dSC/LsbzhXmIWQ8tBEY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTk+m0G8BqwE9TuBlFBY/Vp2iwSeuMh2zoiBDqU4kAQKripbgK6cOb40sIFGZvzJ2gYpuKomPRI5b5z+OolDdv3aoDg+YhZsJ3i4dhJStyvkC9UGv1T06UReSeFMc3P93+GDIiVQu/vMT8cKhi3A39AKV6r0tAZGKJxePv+VrUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lq4OFBo5; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 571201FCE7;
	Tue, 15 Apr 2025 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744716143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LOPeQ3QXBoCTF3FUds9Uh4yiTkt5BuZd+Sa0Yo8E0Qs=;
	b=lq4OFBo5n/VHsMXt7eaqVQV2i3E3Ys+yaadhsx26TRwy8dumU4wHWX0hc1/LHRB6ZkWnHN
	81bJLMnXDjxpId/oH0EqfzdA9cYdv2ZuRBmE4mW7TQRDNGpdIg8pvfX8mWJuSBrlgpEjj5
	/EwgcYcZD/Z+e2d+uhVg4D24YDendCzHabENLlu+m8/3K+otjlhf1IhsRRKaSwJ/24KQ+F
	beQc3Qo669tV+fw6t78Yu+kSUv9i0okQj+zYn0aE4cn/fDSWvAHiF6b/hN5dAeDb8P2xwD
	orhq9KFBrHUf/zgYQbF1gcLGcpC8g6ibZ1q/ncejoumhvYRKVYRhfIprNSL2CQ==
Date: Tue, 15 Apr 2025 13:22:20 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Anusha Srivatsa
 <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, Dmitry
 Baryshkov <lumag@kernel.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] drm/bridge: documentat bridge allocation and
 lifecycle
Message-ID: <20250415132220.3246d9ca@booty>
In-Reply-To: <20250414-dangerous-stoic-lemur-5e083c@houat>
References: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
	<20250409-drm-bridge-alloc-doc-test-v7-1-a3ca4b97597f@bootlin.com>
	<20250414-dangerous-stoic-lemur-5e083c@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeffeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrn
 hhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Mon, 14 Apr 2025 17:40:46 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Wed, Apr 09, 2025 at 04:50:34PM +0200, Luca Ceresoli wrote:
> > Document in detail the DRM bridge allocation and refcounting process based
> > on the recently introduced devm_drm_bridge_alloc().
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> 
> There's a typo in your commit title.
> 
> > ---
> > 
> > Changes in v7:
> >  - remove mention of "legacy mode", we now support only refcounted
> >    bridges
> >  - rename patch title from "drm/bridge: add documentation of refcounted
> >    bridges", we now support only refcounted bridges
> > 
> > Changes in v6:
> >  - update to the new devm_drm_bridge_alloc() API
> >  - rewrite and improve various sentences for clarity
> >  - fix typos (Randy Dunlap)
> > 
> > This patch was added in v5.
> > ---
> >  Documentation/gpu/drm-kms-helpers.rst |  6 +++
> >  drivers/gpu/drm/drm_bridge.c          | 73 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 79 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> > index 5139705089f200b189876a5a61bf2a935cec433a..393cd0e4cb5af3fe98674e7a96c853ffb2556c97 100644
> > --- a/Documentation/gpu/drm-kms-helpers.rst
> > +++ b/Documentation/gpu/drm-kms-helpers.rst
> > @@ -151,6 +151,12 @@ Overview
> >  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> >     :doc: overview
> >  
> > +Bridge allocation and lifecycle
> > +-------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> > +   :doc: bridge lifecycle
> > +
> >  Display Driver Integration
> >  --------------------------
> >  
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index b4c89ec01998b849018ce031c7cd84614e65e710..b7e1ad761dad52bdb2ec09d425e69ee23a18fd36 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -61,6 +61,79 @@
> >   * encoder chain.
> >   */
> >  
> > +/**
> > + * DOC: bridge lifecycle
> > + *
> > + * In some use cases such as hot-plugging a DRM bridge device can
> > + * physically disappear and reappear at runtime. To handle such cases
> > + * without destroying and recreating the entire DRM pipeline, DRM bridge
> > + * lifetime is managed using reference counting:  
> 
> That case doesn't exist yet, so documenting it seems a source of confusion.

OK, I'd replace it all with:

+ * DRM bridge lifetime is managed using reference counting:  

> > + * - each &struct drm_bridge is reference counted since its allocation
> > + * - any code taking a pointer to a bridge has APIs to get a reference and
> > + *   put it when done, to ensure the memory allocated for the bridge won't
> > + *   be deallocated while there is still a reference to it
> > + * - the driver implementing the bridge also holds a reference, but the
> > + *   allocated struct can survive the driver in case other references still
> > + *   exist
> > + * - deallocation is done when the last put happens, dropping the refcount
> > + *   to zero
> > + *
> > + * Usage of refcounted bridges happens in two sides: the bridge *provider*
> > + * and the bridge *consumers*. The bridge provider is the driver
> > + * implementing the bridge. The bridge consumers are all parts of the
> > + * kernel taking a &struct drm_bridge pointer, including other bridges,
> > + * encoders and the DRM core.
> > + *
> > + * For bridge **providers**, the bridge driver declares a driver-specific
> > + * struct embedding a &struct drm_bridge. E.g.::
> > + *
> > + *   struct my_bridge {
> > + *       ...
> > + *       struct drm_bridge bridge;
> > + *       ...
> > + *   };
> > + *
> > + * The driver must allocate and initialize ``struct my_bridge`` using
> > + * devm_drm_bridge_alloc(), as in this example::
> > + *
> > + *     static int my_bridge_probe(...)
> > + *     {
> > + *         struct device *dev = ...;
> > + *         struct my_bridge *mybr;
> > + *
> > + *         mybr = devm_drm_bridge_alloc(dev, struct my_bridge, bridge, &my_bridge_funcs);
> > + *         if (IS_ERR(mybr))
> > + *             return PTR_ERR(mybr);
> > + *
> > + *         // Get resources, initialize my_bridge members...
> > + *         drm_bridge_add(&mybr->bridge);
> > + *         ...
> > + *     }
> > + *
> > + *     static void my_bridge_remove(...)
> > + *     {
> > + *         struct my_bridge *mybr = ...;
> > + *
> > + *         drm_bridge_remove(&mybr->bridge);
> > + *         // Free resources
> > + *         // ... NO kfree here!
> > + *     }  
> 
> This part is already documented by drm_bridge_add(), so it's not clear
> what that section brings to the table either.
> 
> > + * Bridge **consumers** need to handle the case of a bridge being removed
> > + * while they have a pointer to it. As this can happen at any time, such
> > + * code can incur in use-after-free. To avoid that, consumers have to call
> > + * drm_bridge_get() when taking a pointer and drm_bridge_put() after they
> > + * are done using it. This will extend the allocation lifetime of the
> > + * bridge struct until the last reference has been put, potentially a long
> > + * time after the bridge device has been removed from the kernel.  
> 
> And it's kind of the same thing here. You're saying here that every
> consumer absolutely needs to call drm_bridge_get() and drm_bridge_put()
> on their pointer ...
> 
> > + * Functions that return a pointer to a bridge, such as
> > + * of_drm_find_bridge(), internally call drm_bridge_get() on the bridge
> > + * they are about to return, so users using such functions to get a bridge
> > + * pointer only have to take care of calling drm_bridge_put().
> > + */  
> 
> ... but that every function that gives you a pointer will take care of
> drm_bridge_get already and (will) document that you need to call
> drm_bridge_put ?
> 
> I guess my larger question is kind of an editorial one. What do you want
> people to learn here that isn't in some function documentation already?
> At the moment, it looks like a doc that used to be useful but got kind
> of deprecated by the documentation you created on all the functions we
> merged so far, or a documentation that might be useful at some point but
> not quite yet. Either way, it's confusing.

When I start looking into a kernel subsystem that is new to me, I am
very happy when there is high-level, "big picture" introductory
documentation like this. Otherwise I need to learn from existing code,
with the risk of learning from drivers that not following the best
practice. That's what I tried to do here.

Of course neither you or I will need this documentation. But I suspect
you consider this not useful in general.

Do you think this patch should be removed entirely?

(no offense taken if you do, just I won't invest more time in improving
this patch if it is not going to be taken)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

