Return-Path: <linux-doc+bounces-37407-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD48A2CD07
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 20:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 965DF1880208
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 19:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC51191F62;
	Fri,  7 Feb 2025 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFQhp8Kc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759AB185B73
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738957630; cv=none; b=novMdynTDCb9eUBgW6hPvh/yPaTb2hea89eO6bEn4KTTyADNyRPp9lScgyIGtA6CztP4wxA59ENpgklOwr7GYa1SvKD7ih33A/wvLNBRMSrTYO52d/OsRmc6az/7H8opL++3cl3kCf+XE2087pUuj8t/ljJI0cIhstTIYwecvno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738957630; c=relaxed/simple;
	bh=NdYMsQ+8Re0UHYkj0YZzvvONYUYq6cy7MxaN7V7mDKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyUgHS5p5bvJP0QW0c79RSO5YLG1SHmBrTicPRfmvxsh2tMvsQ0LIsrEBFgQNBYVc5MmShyViiKL0kP5FpURPmdjMrV96pCzAaf/KsPErGu8RV3kE0TZ8XpvAPRKT8/OXJoW5zC3TCgph7LccPKR7J/MGS4fpd7klkjgCGAEQ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFQhp8Kc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-544fe4f254eso826564e87.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 11:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738957626; x=1739562426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Nnc+VLoNy3XrMrlSAm4S+smEOzp9c+gb/eHhOZ1VIc=;
        b=CFQhp8KcwlAd3WJen2fjQHtjYWhl5FtOivpxg4I+vT2/wk8rDzFGq/Y/f0YsDr+FBh
         lqukXbNiN0u+BVZV/w9ptH2+IOENI5ykO+Tn3ovwp2DCL3SSS9hQiLcN5vGdbmz9wZA9
         dQxTPsVc2kvjAy4zmRxAbZyQlIe23RcqZfzSHHuPSGztgM3rv4rTIGkDy9+wj0j6Xfoe
         tu8e82avPILHtkNhubcNTHzFPB7Cym8g/MAWxEcLQJ69VstEM1u70M1CKrwl4b/EwGl5
         zFm2FKw6CkYEt00iVao+KsO/pRSb/UUwXQrcpMY8CX2RMgCpyP9vj4uHvHFwtw7sIO7O
         xkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738957626; x=1739562426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nnc+VLoNy3XrMrlSAm4S+smEOzp9c+gb/eHhOZ1VIc=;
        b=fIU5SpNkA2+ySU3dxpDFRogpG+RdY7g4pTHdTL+2NadukvvCT3RKLzazOvdatzQigk
         tzK7w/sNj5JBzvHBxhEPgC3Hvdr/0St7/qHjvOncRWbgW3tZisq9+juHeIK/sRQGq5G2
         DdfA4ALcjTmLNtBkrmLi2xVdOWpj0f3+AL91Ke4M7H1peWUtTsvNszliNUi4v8DWia8i
         8fdH2YN4xjkdTj/9H1RrfROwKU8ojyHNALYMwZtSGdA8OeK9dMGTQsTE9bi0ZxQOkZg9
         2ltomxBBBmoQHwh29E+920hp6ylERcQCGW7Pkxp0nNsxb5dws2U1YvZ2ZqIuBxcc+o6x
         MxGg==
X-Forwarded-Encrypted: i=1; AJvYcCXw7L4ddQeir3k/olIGsCvoFKXU3mgnJRDTaxDJfAxElsDkClcz4gUvPFAhdnQi5iYecmqlqORuX+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcjlQR1Ep457h77UNzukXsSI0ekLNV+eOnjR7Q+e6BeIk06Zr
	3MgkjhZlORibmHYKt9bOOi8BTbKRPFpH1qn6356xpOPhubQi462Y7qe5Kd6ibfQ=
X-Gm-Gg: ASbGncugcmNpJgd/XI9y5kmULiON6C/+q1ePPl5s17NzvwrcETIv6z10Ra80pBPoHPR
	/4q2j4czCX1SsPyKkYnYZy1/CpHyhAEpnsAzH5TPziFJzknWautcQLzlmjHd1mzTy6ZSkx8dXqn
	nkLTlleW343GmaXydMmuD+wWmDmIldqMXKJpBPr56D7XdcnhZwAXWeTWP5m6YaAH9iutLosjSia
	VgP7uK1N9BJVLSNwVUtu7mOknTU0YwieC4Z/kIgmlHzulan6PqgUUlYwCmL1vuT6c5pcilkinw3
	VB67gzeBJN6BtoMTYET7rOg0yLhFcsDxMW7bZHfB10z0EtkVKIK0quPe9tZRI805BTJwgjQ=
X-Google-Smtp-Source: AGHT+IEX/wE6vKWAFwICx9CtlReQSMFmjn6yOfdCDmiizKZeJHyRie3LA+6lJskicwM/rhyEQV3BlQ==
X-Received: by 2002:a05:6512:34c2:b0:542:91ac:3f78 with SMTP id 2adb3069b0e04-54414ab8364mr1217019e87.17.1738957626455;
        Fri, 07 Feb 2025 11:47:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bfd35sm545378e87.115.2025.02.07.11.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:47:05 -0800 (PST)
Date: Fri, 7 Feb 2025 21:47:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 09/26] drm/bridge: move devm_drm_of_get_bridge and
 drmm_of_get_bridge to drm_bridge.c
Message-ID: <7tul5avfkrw7potqif4xbv57o2wp5suuiiqna2gzcd2z4wwyxg@c2qu7bigul67>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
 <aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
 <20250207095421.07ca853f@booty>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207095421.07ca853f@booty>

On Fri, Feb 07, 2025 at 09:54:21AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Feb 2025 04:52:20 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Thu, Feb 06, 2025 at 07:14:24PM +0100, Luca Ceresoli wrote:
> > > devm_drm_of_get_bridge() and drmm_of_get_bridge() do not have anything to
> > > do with struct drm_panel anymore, they just manage bridges. So move them
> > > from bridge/panel.c to drm_bridge.c.
> > > 
> > > Move also of_drm_find_bridge_by_endpoint() which is used only by
> > > devm_drm_of_get_bridge() and drmm_of_get_bridge().
> > > 
> > > No code changes, only move functions to a different file within the same
> > > module and add an #include as needed.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > 
> > > ---
> > > 
> > > This patch was added in v6.
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 102 -----------------------------------------
> > >  drivers/gpu/drm/drm_bridge.c   | 100 ++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 100 insertions(+), 102 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > > index 6995de605e7317dd1eb153afd475746ced764712..1230ae50b2020e7a9306cac83009dd600dd61d26 100644
> > > --- a/drivers/gpu/drm/bridge/panel.c
> > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > @@ -418,49 +418,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
> > >  }
> > >  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
> > >  
> > > -/**
> > > - * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> > > - * @np: device tree node containing encoder output ports
> > > - * @port: port in the device tree node
> > > - * @endpoint: endpoint in the device tree node
> > > - * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> > > - *
> > > - * Given a DT node's port and endpoint number, find the connected node and
> > > - * return the associated struct drm_bridge.
> > > - *
> > > - * Returns zero if successful, or one of the standard error codes if it fails.
> > > - */
> > > -static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> > > -					  int port, int endpoint,
> > > -					  struct drm_bridge **bridge)  
> > 
> > I'd say make this function the main API instead (and name it drm_of
> > rather than of_drm, this can happen in the previous patch).
> 
> I agree there should be a small number of APIs for the foreseeable
> future (and any number of, hopefully decreasing-at-some-point,
> deprecated ones).
> 
> And I agree this one ^ and the devm_drm_of_get_bridge() below are
> equivalent, despite having different signatures, and so one should
> disappear.
> 
> So, time to think about what APIs we want. Some thoughts of mine:
> 
>  * I prefer "get" over "find", looks more intuitive as these functions
>    will drm_bridge_get()
>  * Is there a logic between of_drm_ and drm_of_? Just "the former is
>    old and deprecated"?

I don't know, it might be historical. Nevertheless, I think, having just
drm_ prefix for all DRM-related symbols is a good idea.

>  * Since getting bridges via the endpoint is the preferred way, I'd
>    like this function to have a shorter name than its variants
>  * Returning a struct drm_bridge err_ptr looks better to me than
>    returning an error and the bridge via a ptr-to-ptr, especially as we
>    don't have anymore the case of returning a panel or a bridge from
>    the same function
> 
> So, bottom line, we'd have:
> 
>  - struct drm_bridge *drm_of_get_bridge(np, port, endpoint)
>  - struct drm_bridge *drm_of_get_bridge_by_node(bridge_np)

I think these two are fine, please go with them

>  - devm_ and drmm_ variants of the above

These two are only necessary for the refcounted bridges. I'd say, skip
them as a part of the panel / bridge patchset. Please don't
overcomplicate it too much.

> 
> or a subset of these, in case some is not needed.
> 
> What are your opinions?
> 
> > > -struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> > > -					  struct device_node *np,
> > > -					  u32 port, u32 endpoint)
> 
> ^ kept for reference
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry

