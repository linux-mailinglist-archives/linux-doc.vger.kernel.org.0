Return-Path: <linux-doc+bounces-79500-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIkwBaEnuGnhZgEAu9opvQ
	(envelope-from <linux-doc+bounces-79500-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 16:54:09 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8054829CCD4
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 16:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F040E302F240
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3887C3A5E87;
	Mon, 16 Mar 2026 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RRri84rO"
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E83A4523;
	Mon, 16 Mar 2026 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676159; cv=none; b=Czq41groRHdBpQWOBZkdZMuE2msrfefET2SB+GIzsQD7qchKk70Mbn1aE2D1MMcJh49Q67o74Ce1h2aYblH6X0wGUyauQUjoeMZs9W9iNgwcMQYMmzsGdtiRyNHP1QRgGC+0isxIQ1umJO4lC4SU0NK32mWkqgWvH+Ua2YlfAwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676159; c=relaxed/simple;
	bh=Hw+oGwfBxzHamlpIgBz5N8Zz/wAJ6ScBwV/dkIz8LbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUu96WcscOqfWS1u8cmz1QiORj/qkerYBjcthScjhVEDR11FXFcXkdLUoC2l+gZJfkZu0QILOz9khCk+JMpBPoQio15awS4Z0f5B0Y8sPgezVWUTsqdwk1nOcOoN3hc1yXTULVDN+8HQjxQ4KQpRxdA/n0quNl9ktLOEiK6ZEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RRri84rO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 966C4E79;
	Mon, 16 Mar 2026 16:48:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773676083;
	bh=Hw+oGwfBxzHamlpIgBz5N8Zz/wAJ6ScBwV/dkIz8LbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRri84rOI+wq9W+fc6r1rH5vcrj5tapaHOrx0QAUPB8PmHbPmkHxXgamePxscG1PW
	 aIeGdwhVx3dJYOLAnq+vv/rOJRTtd3EV8m0FJl3LapG6Zise86js9nP857ZrYqyR0a
	 8+s/7curAP1/KOf69pSvICYlKitd7vCNcS7IROm8=
Date: Mon, 16 Mar 2026 17:49:13 +0200
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
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/14] drm/atomic: Drop drm_private_state.obj assignment
 from create_state
Message-ID: <20260316154913.GE31616@killaraus.ideasonboard.com>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-2-de7397c8e1cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-drm-mode-config-init-v1-2-de7397c8e1cf@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79500-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,linuxfoundation.org,oss.qualcomm.com,iki.fi,ideasonboard.com,intel.com,linaro.org,kernel.org,kwiboo.se,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 8054829CCD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 05:06:54PM +0100, Maxime Ripard wrote:
> The initial intent of the atomic_create_state helper was to simply
> allocate a proper drm_private_state and returning it, without any side
> effect.
> 
> However, the __drm_atomic_helper_private_obj_create_state() introduces a
> side effect by setting the drm_private_obj.state to the newly allocated
> state.
> 
> This assignment defeats the purpose, but is also redundant since
> the only caller, drm_atomic_private_obj_init(), will also set this
> pointer to the newly allocated state.

__drm_atomic_helper_bridge_reset() is called in many places. Most of
them are .atomic_create_state() handlers, called from
drm_atomic_private_obj_init() only. The only exception is
__drm_atomic_helper_bridge_reset(). Are you sure this patch won't cause
any negative side effect there ? The commit message should explain why.

> 
> Let's drop the assignment in __drm_atomic_helper_private_obj_create_state().
> 
> Fixes: e7be39ed1716 ("drm/atomic-helper: Add private_obj atomic_create_state helper")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index bd6faa09f83b498b1417869493f31d876cd13914..323abc9926e084ad595768c06d5c5ee28c22c014 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -728,12 +728,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
>  void __drm_atomic_helper_private_obj_create_state(struct drm_private_obj *obj,
>  						  struct drm_private_state *state)
>  {
>  	if (state)
>  		state->obj = obj;
> -
> -	obj->state = state;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);
>  
>  /**
>   * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
> 

-- 
Regards,

Laurent Pinchart

