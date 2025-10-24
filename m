Return-Path: <linux-doc+bounces-64446-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F0C06F57
	for <lists+linux-doc@lfdr.de>; Fri, 24 Oct 2025 17:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A7774F68B2
	for <lists+linux-doc@lfdr.de>; Fri, 24 Oct 2025 15:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5398D3254A4;
	Fri, 24 Oct 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfHOF9EM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6EB31B818
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761319551; cv=none; b=mM+NpJoo6gp1OnSICUhtT37A58Gv0TIZltsNG5r/rHhE9ahjhVrozrQs4HD33auTevs8Ri9WmhZIoAHYP0LY8biE6C4uZ3f6sjyLkBaQPDL0quzkODwhAY733uN2bQPYayhwrtmJoTcXuyUgp45d71aZFuhIZkGV382dr1rUwEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761319551; c=relaxed/simple;
	bh=+DwPFwhmkSUiZT3UZKwe/oRJM2RIonPEtdgijLe62ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEPadmvT/G8Mf7jesocamza1lAHN7hhJZlzFTs22k8Fai5xmS1GBEZOeXWr7G+JTumblpw0Xh99vDMTcyOnrTp0+t5URah7Kf0vFx1mTX88NJjCKVPBSJs0SCFP/4mtopstL5LNzgXaNX7wouUUISmj/tFIoZLq8GnCR/rc3gUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfHOF9EM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47114a40161so22866025e9.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761319547; x=1761924347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ypqIa5w6VQiQoM+Tw67e2xyPwM3Mkp0M4rGw2lAkqjc=;
        b=BfHOF9EMKgW0O53R9chqL/tBdcyFSVlsbtXhjVAJV95wJ2LWzSdSx1HbQaa3559weV
         YL7fDBnZ8SCLyA47ZYeCligFMYEOsPFqD0iCSBRNY9+lOTtdOhg5W7cdIahkgsg3yzGw
         bfIJhZwCtQ9b93KX1vyEb4L1dzQHR7NjbokGFjNiIfZsP+XdRXwJG1O2GKEkKxs5hfmA
         mlD7qJfk/olxg8bEGKeTPaEDMlZNoJlZ89Zc5fwRoBKbhpjLlGapCMmqwFdOiqW7vamN
         QvjBhVSd71Cm71fippa8+R6rHuRogGs94UvdodctPCXSuMZMCQ/ED6rqOMSiTzuVPlws
         4inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761319547; x=1761924347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypqIa5w6VQiQoM+Tw67e2xyPwM3Mkp0M4rGw2lAkqjc=;
        b=m/84ZPyBQEy+YM17WvLqEDV5UraBMdCkEkvXZfIdzjPMkB9MItufG63nYSaLasqeHE
         22BH47+M++bPVTyiruPLwcEfWtpqW/0LUJ7aZOP4T68i1kVM4h7n53T1STAQp7iF1dPx
         C/HGLVZ2NY6nRUQDTY8LYQ/yMyUU9Qs9FtK+jt0vGyt8DHdSikundlDV9BDiJP1Sg88L
         M/Df6WLUXh74CRbv5VAhVzBIx8IFxg5sX5Gh05jyNWk4qlL8CTabnx8YM5s1AzqyuCw9
         IWPE611PVucCEuJqv/7uVnpIIKVbHiISLxezXaZeK4SzjChz3binpXs5vBK9V9L/pwix
         pnww==
X-Forwarded-Encrypted: i=1; AJvYcCXqIlUi32gQezForkiHMWIuOjzRUBVrraII9XL3LoRK6IXVyHO00g5pSOW36xf1WK5wUz6TUrwSBWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/AAszqVYeao8CfuO7n+8LSP8c4RYO0lBDCwdtLeRtibQV65bq
	nX6E3fRd9eStF62CoTg+5X+HGz9VkWyqzRcr2Jr+ehCu7hpLI85jFyZB
X-Gm-Gg: ASbGncvlf4bAdLTotwR1vJ3lf106ggUFAZWY1304bXTX4RyVPVehPPWX1kAbh7SD2uP
	2O7OgMJCSgi/xRhGIlqbBB/uHLO7KljHCGNzhEbIsNQP53qgRWIgX25X8l6Ucb0n44PKNQDBNpK
	ibyjREXCEl4gRsYTs0kUSMlLGo8XwMZ0TT9ieZAf+4YvYwUIuFRwFjB+atSAMjkunsCGYu9gOAA
	gD+2m1WXOhVZiUCvyTY2BS35t982LYvns/HIs61w5iYMOJLW0KUbEXmUeYfLCWCLOjEFh5ioxHV
	XAJWBZd5Ca/o5Ejmu0haKJ37nbaRt6TwA6/4YZmMZsIfWBMCoTGLtyI0mlnG89rLiKXRMfoi0uF
	cCEVToW35MuwLar0WMMHRnDvpj1Yckqx5n0kSrsLZ5Ip7aaAa+Bapk4QeqijZ3ZaCVZJSCPEVBt
	SlZCUlz/xNS+ft4LS9Dr9f
X-Google-Smtp-Source: AGHT+IH+9ceI5wAu8l/3wfsbGJD7MCuJ1USb4K1b4IDrZDz0mW503QMkS82KFPZH8fAPDDytSZwSNg==
X-Received: by 2002:a05:600c:3b03:b0:468:86e0:de40 with SMTP id 5b1f17b1804b1-4711786c6b9mr223889745e9.4.1761319546714;
        Fri, 24 Oct 2025 08:25:46 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496d4b923sm83941545e9.14.2025.10.24.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:25:46 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:25:43 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	victoria@system76.com, sebastian.wick@redhat.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 07/22] drm/vkms: Introduce config for plane color range
Message-ID: <aPuad03CDwb2PX5_@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-7-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-7-a7760755d92d@bootlin.com>


On Sat, Oct 18, 2025 at 04:01:07AM +0200, Louis Chauvet wrote:
> VKMS driver supports all the color range on planes, but for testing it can
> be useful to only advertise few of them. This new configuration interface
> will allow configuring the color range per planes.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 14 ++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c  |  5 ++---
>  3 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 5353719a476d..8f00ca21ed6e 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -163,6 +163,13 @@ static bool valid_plane_properties(const struct vkms_config *config)
>  			drm_info(dev, "Configured default color encoding is not supported by the plane\n");
>  			return false;
>  		}
> +
> +		if ((BIT(vkms_config_plane_get_default_color_range(plane_cfg)) &
> +		     vkms_config_plane_get_supported_color_range(plane_cfg)) !=
> +		    BIT(vkms_config_plane_get_default_color_range(plane_cfg))) {
> +			drm_info(dev, "Configured default color range is not supported by the plane\n");
> +			return false;
> +		}
>  	}
>  	return true;
>  }
> @@ -386,6 +393,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			   vkms_config_plane_get_supported_color_encoding(plane_cfg));
>  		seq_printf(m, "\tdefault color encoding: %d\n",
>  			   vkms_config_plane_get_default_color_encoding(plane_cfg));
> +		seq_printf(m, "\tsupported color range: 0x%x\n",
> +			   vkms_config_plane_get_supported_color_range(plane_cfg));
> +		seq_printf(m, "\tdefault color range: %d\n",
> +			   vkms_config_plane_get_default_color_range(plane_cfg));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> @@ -433,6 +444,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  							BIT(DRM_COLOR_YCBCR_BT709) |
>  							BIT(DRM_COLOR_YCBCR_BT2020));
>  	vkms_config_plane_set_default_color_encoding(plane_cfg, DRM_COLOR_YCBCR_BT601);
> +	vkms_config_plane_set_supported_color_range(plane_cfg, BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +							       BIT(DRM_COLOR_YCBCR_FULL_RANGE));
> +	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_FULL_RANGE);
>  
>  	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 11160c3c13bc..8127e12f00dc 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -47,6 +47,8 @@ struct vkms_config {
>   *         must be managed by other means.
>   * @default_color_encoding: Default color encoding that should be used by this plane
>   * @supported_color_encoding: Color encoding that this plane will support
> + * @default_color_range: Default color range that should be used by this plane
> + * @supported_color_range: Color range that this plane will support

Similar comment about using plural or singular in supported_*
properties.

>   */
>  struct vkms_config_plane {
>  	struct list_head link;
> @@ -58,6 +60,8 @@ struct vkms_config_plane {
>  	unsigned int supported_rotations;
>  	enum drm_color_encoding default_color_encoding;
>  	unsigned int supported_color_encoding;
> +	enum drm_color_range default_color_range;
> +	unsigned int supported_color_range;
>  	struct xarray possible_crtcs;
>  
>  	/* Internal usage */
> @@ -374,6 +378,32 @@ vkms_config_plane_set_supported_color_encoding(struct vkms_config_plane *plane_c
>  	plane_cfg->supported_color_encoding = supported_color_encoding;
>  }
>  
> +static inline enum drm_color_range
> +vkms_config_plane_get_default_color_range(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->default_color_range;
> +}
> +
> +static inline void
> +vkms_config_plane_set_default_color_range(struct vkms_config_plane *plane_cfg,
> +					  enum drm_color_range default_color_range)
> +{
> +	plane_cfg->default_color_range = default_color_range;
> +}
> +
> +static inline unsigned int
> +vkms_config_plane_get_supported_color_range(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->supported_color_range;
> +}
> +
> +static inline void
> +vkms_config_plane_set_supported_color_range(struct vkms_config_plane *plane_cfg,
> +					    unsigned int supported_color_range)
> +{
> +	plane_cfg->supported_color_range = supported_color_range;
> +}
> +
>  /**
>   * vkms_config_plane_set_name() - Set the plane name
>   * @plane_cfg: Plane to set the name to
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 5869000415e4..ab719da2ca0b 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -240,10 +240,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  
>  	drm_plane_create_color_properties(&plane->base,
>  					  vkms_config_plane_get_supported_color_encoding(config),
> -					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> -					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> +					  vkms_config_plane_get_supported_color_range(config),
>  					  vkms_config_plane_get_default_color_encoding(config),
> -					  DRM_COLOR_YCBCR_FULL_RANGE);
> +					  vkms_config_plane_get_default_color_range(config));
>  
>  	return plane;
>  }
> 
> -- 
> 2.51.0
> 

