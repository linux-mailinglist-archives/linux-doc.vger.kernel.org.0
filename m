Return-Path: <linux-doc+bounces-85705-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKBXC/fP+Glr1AIAu9opvQ
	(envelope-from <linux-doc+bounces-85705-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 18:57:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C84C1A84
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 18:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA7683003EA1
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 16:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E273E1D1D;
	Mon,  4 May 2026 16:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CvpwrU2Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9273E3D89;
	Mon,  4 May 2026 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913617; cv=none; b=b17sZ+9XXJcnH4SqzHsNN/2yXzeC3vqmPtcMzBMBESQ66kpjunwxaGdu1/FLGjkceAp2LC6txDGCEuKNMJryGcQFqopBzrT0aZnws9VVAK00mWLC20VGU9/oYMASrNrUrg0Ptj3v6zUwMIWz7VizUWwn1jZbbOJi5mN9XoQ9+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913617; c=relaxed/simple;
	bh=+EZl9qZ81AdPzkkEwOpCoiOGzDn6NE5XspISBAQ0FQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9r5OJNnhhFhVAq4kQ6TocTkxpfhkd65WmGHJ6r2fKWwrerUxk1zW6QKecD7zNVHi7prPeT+Nr9I/iRObBE8RLZ1DrZ7ezLfgInABo46FTUhWVDrsWXXhI4SqQGQ7MiE7t9GzfKFphyCtiKcJ43wC+SfEyLsMP646whj5BcY8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CvpwrU2Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4904D9C;
	Mon,  4 May 2026 18:53:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777913611;
	bh=+EZl9qZ81AdPzkkEwOpCoiOGzDn6NE5XspISBAQ0FQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CvpwrU2ZVuvJEMaGn/PmoNDMHJ4B3SbUdj8uAZYFJFB4/dGDtzcjF75/LvVQ5YzAC
	 RIfuJ0A5tkqa40FdmOa+pVb3ieNpgSDKRNch8yvbU7lZ/WZeC7JAT/BYdlOHosaoI3
	 2uLpdybBMGCQTjbhn81cN5aCxRU9TN2Zq1AFa1Oo=
Date: Mon, 4 May 2026 19:53:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Alex Hung <alex.hung@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 11/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_crtc_state_reset()
Message-ID: <20260504165332.GN1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-11-8b68d9db0d8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-11-8b68d9db0d8b@kernel.org>
X-Rspamd-Queue-Id: 7A6C84C1A84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85705-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,linuxfoundation.org,oss.qualcomm.com,iki.fi,ideasonboard.com,intel.com,linaro.org,kernel.org,kwiboo.se,emersion.fr,amd.com,igalia.com,redhat.com,ursulin.net,sholland.org,raspberrypi.com,lists.freedesktop.org,vger.kernel.org,collabora.com,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid,suse.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 12:18:51PM +0200, Maxime Ripard wrote:
> __drm_atomic_helper_crtc_state_reset() is used to initialize a newly
> allocated drm_crtc_state, and is being typically called by the
> drm_crtc_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_crtc_state instance, we will need to call
> __drm_atomic_helper_crtc_state_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_crtc_state_reset() to
> __drm_atomic_helper_crtc_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 10 +++++-----
>  drivers/gpu/drm/i915/display/intel_crtc.c |  2 +-
>  include/drm/drm_atomic_state_helper.h     |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 50fe4eec41a8..9cd8550cabb7 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -61,25 +61,25 @@
>   * For other drivers the building blocks are split out, see the documentation
>   * for these functions.
>   */
>  
>  /**
> - * __drm_atomic_helper_crtc_state_reset - reset the CRTC state
> + * __drm_atomic_helper_crtc_state_init - Initializes the CRTC state

"Initialize"

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>   * @crtc_state: atomic CRTC state, must not be NULL
>   * @crtc: CRTC object, must not be NULL
>   *
>   * Initializes the newly allocated @crtc_state with default
>   * values. This is useful for drivers that subclass the CRTC state.
>   */
>  void
> -__drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
> -				     struct drm_crtc *crtc)
> +__drm_atomic_helper_crtc_state_init(struct drm_crtc_state *crtc_state,
> +				    struct drm_crtc *crtc)
>  {
>  	crtc_state->crtc = crtc;
>  	crtc_state->background_color = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
>  }
> -EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
> +EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_init);
>  
>  /**
>   * __drm_atomic_helper_crtc_reset - reset state on CRTC
>   * @crtc: drm CRTC
>   * @crtc_state: CRTC state to assign
> @@ -94,11 +94,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
>  void
>  __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
>  			       struct drm_crtc_state *crtc_state)
>  {
>  	if (crtc_state)
> -		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
> +		__drm_atomic_helper_crtc_state_init(crtc_state, crtc);
>  
>  	if (drm_dev_has_vblank(crtc->dev))
>  		drm_crtc_vblank_reset(crtc);
>  
>  	crtc->state = crtc_state;
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index b8189cd5d864..a2ed4a76e061 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -179,11 +179,11 @@ struct intel_crtc_state *intel_crtc_state_alloc(struct intel_crtc *crtc)
>  void intel_crtc_state_reset(struct intel_crtc_state *crtc_state,
>  			    struct intel_crtc *crtc)
>  {
>  	memset(crtc_state, 0, sizeof(*crtc_state));
>  
> -	__drm_atomic_helper_crtc_state_reset(&crtc_state->uapi, &crtc->base);
> +	__drm_atomic_helper_crtc_state_init(&crtc_state->uapi, &crtc->base);
>  
>  	crtc_state->cpu_transcoder = INVALID_TRANSCODER;
>  	crtc_state->master_transcoder = INVALID_TRANSCODER;
>  	crtc_state->hsw_workaround_pipe = INVALID_PIPE;
>  	crtc_state->scaler_state.scaler_id = -1;
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index df371b2eef3e..e7fbbfdc5d69 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -38,11 +38,11 @@ struct drm_connector_state;
>  struct drm_private_obj;
>  struct drm_private_state;
>  struct drm_modeset_acquire_ctx;
>  struct drm_device;
>  
> -void __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *state,
> +void __drm_atomic_helper_crtc_state_init(struct drm_crtc_state *state,
>  					  struct drm_crtc *crtc);
>  void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
>  				    struct drm_crtc_state *state);
>  void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc);
>  void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,

-- 
Regards,

Laurent Pinchart

