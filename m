Return-Path: <linux-doc+bounces-37310-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43140A2B963
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 04:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3676B1889979
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 03:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5406814658B;
	Fri,  7 Feb 2025 03:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WCU4waY6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D073E2AF1E
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 03:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738897401; cv=none; b=M90cY7/pZVj+TOJrXngFvEAJA5BRNDIg0mvl7L3IbTN3c2P9LDnPME2FhJk9hPEPCOii0DX+2KV++9vTmUeg4+lNbfyYDYhVGGyEiVaZj9AiZJPIhXFM/55W11nYEqMiLeaabcJLJLHfxBl4jQN6YUd9PNIJlEE9imjOAz1CKI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738897401; c=relaxed/simple;
	bh=S1eakEV1hze/rafaulCC0Og+zurQKuDNVI7RRlHw5jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP6dCwsxE8EsjytmguTjAu8ktTuDcN+7bzJew7tDbynRoh3U0y+WGSYdoT2Qhwga3LS0i/qsbqbEZIEBNRV6cQkB4iy7t9hmvi6iuQIYWLt/EiCy+ft2dblV7+wECAFsfz9ezDRVT9az9YsdupUyb3UDvg5fzfztJqUsx4Uvy/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WCU4waY6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54411e3c610so1183554e87.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 19:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738897397; x=1739502197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScckE3sdkg/vVUj7WnXQkdjlruhwNWA4ty0J/lG2SIg=;
        b=WCU4waY6OLc9hPms7unEQVJ88na9KsRVEN3Y/+JJwjfU26jRJtoeMamKgaiFygGMVk
         zq7DITm6Z2gY7F+NLetHm/ahmYHhTwtXOasUCRrCspJOLMwj/aCxBeUCKwRbRFAEWtbe
         3/ZgWwIQmHwDNR9I0Grp4d+rlu/P6tSblKrrCMcXnFkxzr6AGWp8BTzcMoXrwfJtxGf6
         BVIRFkYdrjktUxirAhL1JNVoBx2sjkQjSJ1fo/XJn3eLtua0Lafbv27QrUJyKinWQGA+
         2xepYqKtfoMIqOIvrthQXHj7sgKMFbSNv30QxJ9R3F3MfHgPEj40fpKf0eQKNrlVD/ah
         1QTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738897397; x=1739502197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScckE3sdkg/vVUj7WnXQkdjlruhwNWA4ty0J/lG2SIg=;
        b=dReohP2s1xwVy6phmOIee4RaVMZfWpwmnQHPDtT1RNP52XgJK/B3td0NcghZyLQpA0
         np0id7FxrbdP0jcVF73LlbCh0fTkQAsnfEOQz8Yj4rYOWz+YqOcmBS8MxJptBJELBOs1
         WgK2CZwuSyFHg5BmjftzCgiv973JNHMXc81nLOqOjgJnNSKo0O8HDFjKgTxllF/UDSkn
         3M9mFf6ssYFYE5skJzY3JqsbHZB5EpJWV78YA5oJfQnjDrgX1UlJCK3V68hPaNT6tOEL
         9m64LoGFpTPqJ3tRuDBfeStt1G6ZeFr8rJo/k2aVqMgCRXFS5JRvzw9ya9KKCGEAubEv
         HLrg==
X-Forwarded-Encrypted: i=1; AJvYcCVkDOBd9nmNMbgv8DcfThqAjAV0zYcouTcxdrl38djdU9+JAd1mnan4T4xvM4+drOI6L4K/07DH0oM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDElMT4xixXiUC6s6xvfd8qu5vKB5fvNbjdDUHW5iN6KxDGaLZ
	tRasG3+14djii5iEj6iJJIuf0qCRJEdHcUJ0lkYkRZ6MWF8eCaPON86zZ72oZxs=
X-Gm-Gg: ASbGncubbjwcsx7euYRf0wcF204cqbGpcv7Jly/wOOwxC3UiCmHyKHjpqKZ9Ai4WkFg
	FHVEKzNQfZ347QsSxThx27WKZUVR/XGrnbTLHSkXAUYtm3kANBD+IrsKTQJjRdE9QJq1z9ebjID
	RO35YBHlGtqHXrZAuIr7hGRDoEL9bKi1Ra+toqC2XY+zekJL53cFCGI/EWkd5hXIpk4vnMidk8C
	9kToECtYpqOnqtSeIVqlOLmajaG7W+tbxhMoMp1hMY5AXFlcLJOLrzHSWwhgqakjR/BhAqvV/dp
	BjdSCTjsQrI/GNQHBGUJlcZlDa74kvaio91KPtznzre8eKakSuiUp0cVoVOT0LS6jSh3mRE=
X-Google-Smtp-Source: AGHT+IF1zkGPC274Byqhl5z75QjvE44TjiZdR7ZFTdBZSZkQteq90ey7AMuc2ci0aBKLn5vOWSqUSA==
X-Received: by 2002:a05:6512:2316:b0:540:1a40:ab0d with SMTP id 2adb3069b0e04-54414aa87e7mr369435e87.28.1738897396852;
        Thu, 06 Feb 2025 19:03:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54411cc9fa4sm261365e87.149.2025.02.06.19.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:03:15 -0800 (PST)
Date: Fri, 7 Feb 2025 05:03:13 +0200
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
Subject: Re: [PATCH v6 13/26] drm/encoder: add drm_encoder_cleanup_from()
Message-ID: <spxzxwcs27uv2ttt5mh3r2767ihczvzzrtov6afdmex2ye7lam@r6kdqv5ocg5h>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:28PM +0100, Luca Ceresoli wrote:
> Supporting hardware whose final part of the DRM pipeline can be physically
> removed requires the ability to detach all bridges from a given point to
> the end of the pipeline.
> 
> Introduce a variant of drm_encoder_cleanup() for this.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v6: none
> Changes in v5: none
> Changes in v4: none
> Changes in v3: none
> 
> Changed in v2:
>  - fix a typo in a comment
> ---
>  drivers/gpu/drm/drm_encoder.c | 21 +++++++++++++++++++++
>  include/drm/drm_encoder.h     |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 8f2bc6a28482229fd0b030a1958f87753ad7885f..472dfbefe2960924a4e83bec425af8c7ef5f5265 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -207,6 +207,27 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  }
>  EXPORT_SYMBOL(drm_encoder_cleanup);
>  
> +/**
> + * drm_encoder_cleanup_from - remove a given bridge and all the following
> + * @encoder: encoder whole list of bridges shall be pruned
> + * @bridge: first bridge to remove
> + *
> + * Removes from an encoder all the bridges starting with a given bridge
> + * and until the end of the chain.
> + *
> + * This should not be used in "normal" DRM pipelines. It is only useful for
> + * devices whose final part of the DRM chain can be physically removed and
> + * later reconnected (possibly with different hardware).
> + */
> +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge)
> +{
> +	struct drm_bridge *next;
> +
> +	list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
> +		drm_bridge_detach(bridge);
> +}
> +EXPORT_SYMBOL(drm_encoder_cleanup_from);

Shouldn't drm_encoder_cleanup() also use this function?

> +
>  static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
>  {
>  	struct drm_encoder *encoder = ptr;
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 977a9381c8ba943b4d3e021635ea14856df8a17d..bafcabb242674880a97dfb62a50d93cc4d80c1d4 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -320,6 +320,7 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
>  }
>  
>  void drm_encoder_cleanup(struct drm_encoder *encoder);
> +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge);
>  
>  /**
>   * drm_for_each_encoder_mask - iterate over encoders specified by bitmask
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

