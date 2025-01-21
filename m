Return-Path: <linux-doc+bounces-35797-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F35A17D01
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 12:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4C218834F6
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 11:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683E51F1317;
	Tue, 21 Jan 2025 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V/3PZH8d"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049AF1F12EF;
	Tue, 21 Jan 2025 11:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737458865; cv=none; b=iT6Mfmuvj5PoEtZbDxHAMncaz7Y/W2dbkHkfTe3SZ8eyg4HxT441EVVVLwuLX3f/YUbOKZ2vcS1x8TPw21sp4d+nf6XQqxa/5SX+BjXIZC59gNqspEopgCp+4zfsl0WH73Jl9kN4rEjAH+49GaeevLpWhmz95cpQSGv/gK9bPRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737458865; c=relaxed/simple;
	bh=cpDKuCGVBOQfbn9ng7L6o9852ySGlOYpJ75gMAT16gA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EDuILyQDcmddrqKBJ2y54sR/sdSXvIPcBiftC0ueiiEDylIErbvZAVuzO1RQiU8SHHk1vvQ4/qeKLi78y0f1ImpDu57bLaJlpVUe1bZejshw9fj4x48liHqjrsHMfoZz9xH7SAey0gCLeBRS9s4uDliK/yD51LV5YwK25WJPyUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V/3PZH8d; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFBC9C0007;
	Tue, 21 Jan 2025 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737458854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yvv94Anmst7/2WZT6xQ2X+vnKjVuKH+YPHmx45U8gWY=;
	b=V/3PZH8di8ECH8dzB2brdXaHGriyjtVgkO+F/f2s8u1prLK5l0rnib2tK0SGDUnA1Uu13L
	DDClaof0e1GQ8RnO+dX81ixHbQdG/JKmcIvNyH6Aut7bmhsiZcKZE8rCLmD4kmLvQa7dk2
	3fSR1pfvs6y6fh4KVAjoP7cUCSAg5SlyBpGtoahKhPsrfJH2Akq52as/KDs9WV/0l0PLry
	LBhh6QxUKP8GbwOFdKPOje1FT5qZTNTlrUM+cDDIeV+7b4ZPd+bP9iluh7DCUWiun4L2SF
	KD8OARAr58NiVB6tSEu/BAGqOQvwrETgVd/rq8L7HGBnwkm1ejswmrIcz1Elzg==
Date: Tue, 21 Jan 2025 12:27:29 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Simona Vetter
 <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, Paul
 Kocialkowski <contact@paulk.fr>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <20250121122729.41c8f2b1@booty>
In-Reply-To: <20250116-brave-feathered-dormouse-8ea4cf@houat>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
	<20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
	<7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
	<20250102130149.5784c09b@booty>
	<20250110115819.55bc887b@booty>
	<20250116113236.39ba876a@booty>
	<20250116-brave-feathered-dormouse-8ea4cf@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Maxime,

On Thu, 16 Jan 2025 13:26:25 +0100
Maxime Ripard <mripard@kernel.org> wrote:

[...]

> > And then there is the panel bridge. My understanding (which I'd love to
> > get clarified in case it is not accurate) is that DRM bridges expect to
> > always interact with "the next bridge", which cannot work for the last
> > bridge of course, and so the panel bridge wraps the panel pretending it
> > is a bridge.
> > 
> > This software structure is clearly not accurately modeling the
> > hardware (panel is not bridge),  
> 
> We don't have a proper definition of what a bridge is, so as far as I'm
> concerned, everything is a bridge :)
> 
> The name came from "external signal converters", but the API got reused
> to support so many hardware components it's not meaningful anymore.

So if I'm getting your point here, drm_bridge is actually the base
class for DRM devices in OOP jargon, or a "DRM subunit" in V4L2 jargon.
OK, that's fine for me (except maybe for a "we should rename" thought).

[...]

> > So far this approach has been working because devm and drmm ensure the
> > panel bridge would be dealloacted at some point. However the devm and drmm
> > release actions are associated to the consumer struct device (the panel
> > bridge consumer), so if the panel bridge is removed and the consumer is
> > not, deallocation won't happen.  
> 
> Oh, right, if one doesn't call drm_bridge_put(), that will result in a
> memory leak. The general topic we discuss and try to address here is
> memory safety, and a memory leak is considered safe. It's also going to
> get allocated only a couple of times anyway, so it's not a *huge*
> concern.
> 
> And about how to actually fix it, there's two ways to go about it:
> 
>   * Either we do a coccinelle script and try to put all those
>     drm_bridge_put() everywhere;
> 
>   * Or we create a devm/drmm action and drop the reference
>     automatically.
> 
> The latter is obviously less intrusive, we would need to deprecate
> devm_of_get_bridge() for it to be safe, and I'm not entirely sure it
> would be enough, but it might just work.
> 
> > For hotplugging we cannot use drmm and devm and instead we use get/put,
> > to let the "next bridge" disappear with the previous one still present.
> > So the trivial idea is to add a drm_of_get_bridge(), similar to
> > {drmm,devm_drm}_of_get_bridge() except it uses plain
> > drm_panel_bridge_add() instead of devm/drmm variants. But then the
> > caller (which is the panel consumer) will have to dispose of the struct
> > drm_bridge pointer by calling:
> > 
> >  - drm_bridge_put() in case a)
> >  - drm_panel_bridge_remove in case b)
> > 
> > And that's the problem I need to solve.  
> 
> I'm not sure the problem is limited to panel_bridge. Your question is
> essentially: how do I make sure a driver-specific init is properly freed
> at drm_bridge_put time. This was done so far mostly at bridge remove
> time, but we obviously can't do that anymore.
> 
> But we'd have the same issue if, say, we needed to remove a workqueue
> from a driver.
> 
> I think we need a destroy() hook for bridges, just like we have for
> connectors for example that would deal with calling
> drm_panel_bridge_remove() if necessary, or any other driver-specific
> sequence.

The .destroy hook looked appealing at first, however as I tried to
apply the idea to bridges I'm not sure it matches. Here's why.

The normal (and sane) flow for a bridge is:

 A) probe
    1. allocate private struct embedding struct drm_bridge
       (I have an _alloc() variant ready for v5 to improve this as you proposed)
    2. get resources, initialize struct fields
    3. drm_bridge_add(): publish bridge into global bridge_list

Now the bridge can be found and pointers taken and used.

And on hardware removal, in reverse order:
 
 B) remove (hardware is hot-unplugged)
    3. unpublish bridge
    2. release resources, cleanup
    1. kfree private struct

Some drivers do real stuff in B2, so it is important that B3 happens
before B2, isn't it? We don't want other drivers to find and use a
bridge that is being dismantled, or afterwards.

B3 should normally happen by removing the bridge from the global
bridge_list, or other bridges might find it. However setting the "gone"
bool and teaching of_drm_find_bridge() & Co to skip bridges with
gone==true would allow to postpone the actual removal, if needed.

With that said, with hotplugging there will be two distinct events:

 * hardware removal
 * last ref is put

The second event could happen way later than the first one. During the
time frame between the two events we need the bridge to be unpublished
and the bridge resources to be already released, as the hardware is
gone. We cannot do this at the last put, it's too late.

So I think the only sane sequence is:

 * on hardware removal:
     B3) unpublish bridge (drm_bridge_remove() or just set gone flag)
     B2) free resources, deinit whatever needed
 * when last ref is put
     B1) kfree (likely via devm)

So, back to the .destroy hook, it would fit at B2, and not at the last
put.

However in that place it seems unnecessary. The actions "on hardware
removal" (B3, B2) are done by the driver remove function, so they are
already driver specific without any additional hook. I'm however fine
to add the hook on hardware removal in case there's a good reason I
missed.

Do you think my reasoning is correct so far?

If you don't, can you clarify at which events (hardware removal VS last
put) the various actions (drm_bridge_remove, set gone flag, calling
.destroy, free resources and deinint, kfree) should be done?


(Side note: I've been pondering on why the .destroy hook works for
connectors and would not for bridges. I think it's due to the global
bridge_list, or because of the different lifetime management based on
drmm for connectors, or both.)


It may look as if my discussion is about bridges in general and not
about the panel bridge. However before delving into how to dispose of
a panel bridge we need to sort out how to dispose of a bridge in the
first place.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

