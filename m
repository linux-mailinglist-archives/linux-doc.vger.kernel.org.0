Return-Path: <linux-doc+bounces-37308-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0672CA2B957
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 03:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC86B7A1795
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 02:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E019138385;
	Fri,  7 Feb 2025 02:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMBf4RwG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95496AA7
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896961; cv=none; b=pa3lXV5ak/HNkZN7w9XTmXIV+y9aw2N9QxtwPWOHC1zZf6gX4ZY71mb1XqGtjrxaV6W4xwnIP1oS88KluLGV5CnTEntfDiB3Eequ1cf/Gva6P9e4uMqqmlJy74OaTB7w4uNliQ/ITE5D5OXQdMmEfpqVpwAHxK38eBl9Un8qqYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896961; c=relaxed/simple;
	bh=KNb2sPbBvRi60mplWVUb/wlii3cfAV4CqRauzhDNtCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twwqbgMT38aZhG8Ruz66DT9ow1CQ8N6fPpCgdrnRS+j/f6zaCcklj/CMyR+em7WP7y1vu6MPkqvJoSaQ+OfvXiqr1svTR0OdzmZW5Zcq2S+mZU3DSo6VoLh+4fkTOOrzRfYChLXY+Etc8sinh3PTdyy6MGwbAd9oTzsO2levQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMBf4RwG; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30761be8fa8so14213091fa.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 18:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896958; x=1739501758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Byca7B+SvHo9poDjpj+NTEDwW3aW+UfYwBPg1UM/mI=;
        b=XMBf4RwGsmhuRwtQAsirsOIv84QEgaJvPpSFTNH+UgALobIPwpaB2LnEPHIId6goW+
         C2w3WIslfaq9V66RdgiSTVFet59K3NNerDV8FMCW+RGzTqeTfWh3qxeN9iPUPewn7ZxW
         OLH4YqiUjZ7tWNZZq1AukrPW8FsTB+zJfQ7LgUXelbSt3vgzG0ailobXLf70v3eUmmnQ
         SNHT+4dDOVqGv287VOd+M03MKqZWu2hMqj8YUqtTEQlZZO8TgCW6AtxERqTC3hKYV9qw
         RdibvpTGTISGrM13L3OdMcS6NFySbNYIB6vLBeA3/wPtB0kL/97AttTQgY141yD/qPzq
         C8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896958; x=1739501758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Byca7B+SvHo9poDjpj+NTEDwW3aW+UfYwBPg1UM/mI=;
        b=pXNtrRN3tk+fFYv+RdtHcf1VlDQdmwPiZLUD5kBzmAOLk5yquHMkxWcwwYWEnMb8K8
         CofEF06i7TpzOlfL6+4gRJurvu4l1bSLQoR7zw4GD3jcaWw7E7yTP1qQy65gGX7M6cLW
         FfwgZqHTgWuocUsr1FW5tT2iv0OvhVA2o+67LlzV31vtp2PyWjLuReasin7cNJSd68HS
         sEgji8c4sb07t/nr29jClpusH2Med+UglYgjaVL+CPQjYoZPzlwnobFasZOyTSrSY96z
         BdPprJQWsdJEOp/YnIPTsr3FQH+25TZ7opmxDtgEIkOrjLqnKCaicvdScLWCbmcrcjxd
         Mp2A==
X-Forwarded-Encrypted: i=1; AJvYcCW3kvtblVVzsUXpqVDCEVgnITZcJRcNqliR5e2JIZVRjAS4qC9lD1oWTrmJX6GACMybUdQ0n2h+27o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQIuH4sEU7k3ZGZulUFZvvQjFhiJKIwbx2cmM6/CFinFWNpEN
	e+rC9RA9RF6tOrDDxkJY/egvSsnkFWBsp01ZmU4+3SXLUB6c9tbpgG6I29A7Kuk=
X-Gm-Gg: ASbGncv7sRMZMlHikH8YrVrU85Jg/9SYblpu5g0SyReIrMdZfwWhGeXHj9Bt/vnpBN3
	W0iE0PWImPqJdRvHgsJ+ak5p2MCy5/TBOYE8FbVLE+u7U2IaRyyV+85T4x97SftVKUE5abf3Dgy
	8HsZYaHvfydU179gPDlNmutVQ0Wm9DWOZTYTtiOrcoLTRHDO0oMyb8IusWKdaG8ExZIejHpjygT
	4Tby1oMMV7uPD+DF/1+AxLz6XWH8xi+bXJbqHMTWSZf6xHUohC2xUlAzu9fKyKa+gSn62JJP5SN
	eVNdofIRoiMgO1jt0Ro8d7jOr1+TIUAqwW3hHR4ln3Jk3jt5U8grIfZucK7r8qxl5AKF0tk=
X-Google-Smtp-Source: AGHT+IFZ4T7u0nGpfUVwU5s+4eCkQKYR6Jj3XEJ5v8Yh2TBgTlWEdJadPmr9h+8Pcw7MtkjpxzqCxQ==
X-Received: by 2002:a05:651c:892:b0:2fb:8c9a:fe3f with SMTP id 38308e7fff4ca-307e5817d58mr4571041fa.22.1738896957912;
        Thu, 06 Feb 2025 18:55:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2d8efesm2799391fa.88.2025.02.06.18.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:55:56 -0800 (PST)
Date: Fri, 7 Feb 2025 04:55:54 +0200
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
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
Message-ID: <hc6llejnkhj5uaj5o4fof64hmderfcbfkrburv7nmqwzq2jnin@nac32akftsbm>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:26PM +0100, Luca Ceresoli wrote:
> In order to support panels described either via graph links or via a
> subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
> to find the next bridge. The resulting logic is complex and duplicates code
> already present in the DRM bridge core. Switch to the new APIs in DRM
> bridge core that allow to do the same in a much cleaner way.
> 
> Note there are two slight changes in the new logic intended to improve the
> final result:
> 
>  * the old code looks for a subnode with any name except "port" or "ports",
>    while the new code uses the node passed as a parameter
> 
>  * the old code looks for a subnode first and falls back to a graph link,
>    while the new code uses the reverse order because graph links are the
>    recommended device tree representation now
> 
> The first change makes the code more robust by avoiding the risk of using
> an unrelated node which is not describing a panel and not names "port" or
> "ports".
> 
> The second change is not expected to expose regressions because, in the
> cases where both a subnode and a graph link are used to describe a panel,
> the graph link should point to the subnode itself, such as in
> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> 
> As a further cleanup, use a temporary variable to assign dsi->out_bridge
> only on success. This avoids the risk of leaving a non-NULL value in
> dsi->out_bridge when samsung_dsim_host_attach() fails.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------------
>  1 file changed, 9 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6e8ca741bffa5e46 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
>  	struct device *dev = dsi->dev;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *remote;
> -	struct drm_panel *panel;
> +	struct drm_bridge *out_bridge;
>  	int ret;
>  
> -	/*
> -	 * Devices can also be child nodes when we also control that device
> -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> -	 *
> -	 * Lookup for a child node of the given parent that isn't either port
> -	 * or ports.
> -	 */

Please leave the comment in place (maybe rewrite it slightly).

> -	for_each_available_child_of_node(np, remote) {
> -		if (of_node_name_eq(remote, "port") ||
> -		    of_node_name_eq(remote, "ports"))
> -			continue;
> +	out_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
> +	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) != -EPROBE_DEFER)

Can it actually return EPROBE_DEFER?

> +		out_bridge = devm_drm_of_get_bridge_by_node(dev, device->dev.of_node);
>  
> -		goto of_find_panel_or_bridge;
> -	}
> -
> -	/*
> -	 * of_graph_get_remote_node() produces a noisy error message if port
> -	 * node isn't found and the absence of the port is a legit case here,
> -	 * so at first we silently check whether graph presents in the
> -	 * device-tree node.
> -	 */
> -	if (!of_graph_is_present(np))
> -		return -ENODEV;
> -
> -	remote = of_graph_get_remote_node(np, 1, 0);
> -
> -of_find_panel_or_bridge:
> -	if (!remote)
> -		return -ENODEV;
> -
> -	panel = of_drm_find_panel(remote);
> -	if (!IS_ERR(panel)) {
> -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> -	} else {
> -		dsi->out_bridge = of_drm_find_bridge(remote);
> -		if (!dsi->out_bridge)
> -			dsi->out_bridge = ERR_PTR(-EINVAL);
> -	}
> -
> -	of_node_put(remote);
> -
> -	if (IS_ERR(dsi->out_bridge)) {
> -		ret = PTR_ERR(dsi->out_bridge);
> -		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
> -		return ret;
> +	if (IS_ERR(out_bridge)) {
> +		DRM_DEV_ERROR(dev, "failed to find the bridge: %ld\n", PTR_ERR(out_bridge));
> +		return PTR_ERR(out_bridge);
>  	}
>  
>  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
> @@ -1784,6 +1745,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
>  
> +	dsi->out_bridge = out_bridge;
> +

Please move the assignment closer to the original place.

>  	return 0;
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

