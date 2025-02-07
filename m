Return-Path: <linux-doc+bounces-37354-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B66A2BE9F
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 10:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B6E0168CF1
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 09:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C9E634EC;
	Fri,  7 Feb 2025 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GSWncqUo"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61245374F1;
	Fri,  7 Feb 2025 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918880; cv=none; b=G512Drrvj6BC4R80UoRngxYDPzaewn5vXLgH650dv8MHvoiOsd4WHa8wK+Wt+ebN8R9uJXWS8WzxCGuQVkPNWWpUAy7eer5GYsa0/sixseN1w9fs2tJ92XyCOUQ4R1IOiP0poq09UrJKpCwlSuukCeWb0nYPoishbQsf9Kc9NoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918880; c=relaxed/simple;
	bh=xcV043l2gNFd4WQNGBe8qS01eay8Iql7A6xo/1emEqc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmEVx8NwsYvE0r0qZXaJeRDL4dWWk9FZXY73NGeFXHNgHkk8H2mDC5HhYGXVUooc9xEOb9ceYhSuTbQ0f4ex+i9AkU0szQq6PurAMr0x3r+2d7CXZEga6u/msVmwBmPVBhTfSKHcYNC88+UohQ2p8NrvAmkbvnhaDTSA8sMo1vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GSWncqUo; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BCAD43310;
	Fri,  7 Feb 2025 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QuQO7QcmtLV3YXSW7XXjQXJN3jM1qRLRyaLw973vGc=;
	b=GSWncqUoCRG8fOhlT1BgumurcgFCDidy4afWlPmtggBq1JnOWRBv0IxGG6+BVetOGhKI5S
	FF37VhIlCH9QHylO0jP/kUcPqysMvln62a/xDma3U4U8SigHrBqroWmm7BebHh7MkS5rpA
	d5sHWvyX8FACg0kX2BZo6ar5hYhGCCVRTcHhtDSoqNWURaS5bfwznlJxJmhFHjMJ51DQoH
	CPekqRTO8wuxdDKL1V54skt5X7MFs9mmgN1F0ZmSYZU6o95lXcf7QBfN+f6lzbr78r3sHA
	85xB/aKdHHqCGWQRnven2+sfGhYqFYSaZexbKwZeD6sxLphwseutALcfRD68gQ==
Date: Fri, 7 Feb 2025 10:01:10 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 00/26] Add support for hot-pluggable DRM bridges
Message-ID: <20250207100110.3bc5baef@booty>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
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
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgto
 hhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: luca.ceresoli@bootlin.com

On Thu, 06 Feb 2025 19:14:15 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Patch series overview
> =====================

And I messed up with my patch series overview.

Please ignore all lines from here...

>  * 2 Preliminary patches (maybe to be removed as this work progresses):
>    - drm/bridge: allow bridges to be informed about added and removed bridges
>    - drm/encoder: add drm_encoder_cleanup_from()
> 
>  * Implement refcounting in the drm_bridge core:
>    - drm/bridge: add support for refcounted DRM bridges
>    - drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
>    - drm/bridge: add documentation of refcounted bridges
> 
>  * Adapt some existing bridges to be refcounted and/or to refcount bridges
>    they take a pointer to:
>    - drm/bridge: ti-sn65dsi83: use dynamic lifetime management
>    - drm/bridge: panel: use dynamic lifetime management
>    - drm/bridge: samsung-dsim: use supporting variable for out_bridge
>    - drm/bridge: samsung-dsim: refcount the out_bridge
> 
>  * Add hotplug-bridge (may be removed as this work progresses): 
>    - drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges

...to here, as they belong to v5

The lines that follow are the correct ones for v6:

>  * Prelimiary, simple cleanups:
>    - drm/debugfs: fix printk format for bridge index
>    - drm: of: drm_of_find_panel_or_bridge: move misplaced comment
>    - drm/bridge: panel: use drm_bridge_is_panel() instead of open code
>    - drm/bridge: panel: drm_panel_bridge_remove: warn when called on non-panel bridge
> 
>  * debugfs improvements to show bridges, part 1:
>    - drm/debugfs: add top-level 'bridges' file showing all added bridges
> 
>  * Restructure panel code to always add a panel_bridge:
>    - drm/panel: move all code into bridge/panel.c
>    - drm/bridge: panel: forbid initializing a panel with unknown connector type
>    - drm/bridge: panel: add a panel_bridge to every panel
>    - drm/bridge: move devm_drm_of_get_bridge and drmm_of_get_bridge to drm_bridge.c
> 
>  * Add new get_bridge variant for drivers supporting non-graph DT:
>    - drm/bridge: add devm_drm_of_get_bridge_by_node()
>    - drm/bridge: samsung-dsim: use devm_drm_of_get_bridge[_by_node] to find the out_bridge
>    
>  * Preliminary patches (maybe to be removed as this work progresses):
>    - drm/bridge: allow bridges to be informed about added and removed bridges
>    - drm/encoder: add drm_encoder_cleanup_from()
> 
>  * Implement refcounting in the drm_bridge core:
>    - drm/bridge: add support for refcounted DRM bridges
>    - drm/bridge: devm_drm_of_get_bridge and drmm_of_get_bridge: automatically put the bridge
>    - drm/bridge: increment refcount in of_drm_find_bridge()
>    - drm/bridge: add devm_drm_put_bridge() and devm_drm_put_and_clear_bridge()
>    - drm/bridge: add documentation of refcounted bridges
>    - drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
> 
>  * debugfs improvements to show bridges, part 2:
>    - drm/debugfs: bridges_show: show refcount
>    - drm/bridge: add list of removed refcounted bridges
>    - drm/debugfs: show removed bridges
>    
>  * Adapt some existing bridges to be refcounted and/or to refcount bridges
>    they take a pointer to:
>    - drm/bridge: samsung-dsim: use refcounting for the out_bridge
>    - drm/bridge: panel: use dynamic lifetime management
>    - drm/bridge: ti-sn65dsi83: use dynamic lifetime management
>    
>  * Add hotplug-bridge (may be removed as this work progresses): 
>    - drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges (HEAD -> ge/luca/wip)

Apologies for the mess.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

