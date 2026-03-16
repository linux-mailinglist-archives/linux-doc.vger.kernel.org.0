Return-Path: <linux-doc+bounces-79501-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DUTDiYpuGnhZgEAu9opvQ
	(envelope-from <linux-doc+bounces-79501-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 17:00:38 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AEA29CE8B
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 17:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1E043057E80
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 15:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF283B8957;
	Mon, 16 Mar 2026 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DuT2/HE1"
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA853B8926;
	Mon, 16 Mar 2026 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676440; cv=none; b=GNUQ+MAw1pjgy0FjuZJTXLuTo75VQl+BumwOZkizX3PCe0Y0wvUy8QXsKpH3pJUQNsCl52igQYMKnPf1EH3sX3asEtiEU9j5PWyDYNYs9fL6xY96G5/+zwkYyEJAVCa87rnVzItrm9DQe3elB2pV8FaVbO1W3yureRvjQ+VuU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676440; c=relaxed/simple;
	bh=nefS1Nl7jufl9v5V3tpA0vWdgfXt0Ga9N7ObiJRukwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acqqme80JIQGDAQq7hYUy07DVNg3j4zpsoy32FoVoBcQOWSSU+1I7emRFZ0EHgdPhzd6Ug6IOqxjXCT2eSqSTg7iLHytJhf8ybkjvJM46aYsqkLTJywQYcWmpZEY4EJcPWZcTl2YsbKloXk8lkZ2c5jZKgH2pdzFvFeL7Ij9EHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DuT2/HE1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F03F7C6C;
	Mon, 16 Mar 2026 16:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773676362;
	bh=nefS1Nl7jufl9v5V3tpA0vWdgfXt0Ga9N7ObiJRukwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuT2/HE1oA3ZPWNkOLEzbOjAdkEBfKhiD/G9bhfG29Q3BUkYdcUY3mhGHntLcQtIZ
	 Z1keo5lWUrVYla5+PYfj1cpYtCTtLjNBJAOAd/ILnVGnnQ5W6MQIedzI8aG9CtrSrF
	 XScpokjZiEinPXmWcIS01TrK84YbNwEepP54LnHM=
Date: Mon, 16 Mar 2026 17:53:52 +0200
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
Subject: Re: [PATCH 03/14] drm/mode-config: Mention drm_mode_config_reset()
 culprits
Message-ID: <20260316155352.GF31616@killaraus.ideasonboard.com>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-3-de7397c8e1cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-drm-mode-config-init-v1-3-de7397c8e1cf@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-79501-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: C0AEA29CE8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 05:06:55PM +0100, Maxime Ripard wrote:
> drm_mode_config_reset() has the expectation that drm_private_states are
> not reset.

I initially misinterpreted that. I don't think it's an "expectation".
The function simply does not reset the private objects states. If you
want to keep "expectation", you can write

drm_mode_config_reset() has the expectation that drm_private_states do
not need to be reset.

> This is especially significant for the DP MST and tunneling code that
> expect to be preserved across a suspend/resume cycle, where
> drm_mode_config_reset() is also used.
> 
> Let's document this expectation.
> 
> Link: https://lore.kernel.org/dri-devel/aOaQLx-7EpsHRwkH@ideak-desk/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 84ae8a23a36786705fea7c0eafd7f20813b7c8f9..54c27376f9894ef5eee378bb5b1e5fc7049de922 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -187,10 +187,14 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
>   * @dev: drm device
>   *
>   * This functions calls all the crtc's, encoder's and connector's ->reset
>   * callback. Drivers can use this in e.g. their driver load or resume code to
>   * reset hardware and software state.
> + *
> + * It's worth noting that @drm_private_obj structures are expected to be

s/It's worth noting/Note/

> + * stable across suspend/resume cycles, and @drm_mode_config_reset()
> + * will not affect these structures.

s/will/does/

With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>   */
>  void drm_mode_config_reset(struct drm_device *dev)
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_colorop *colorop;
> 

-- 
Regards,

Laurent Pinchart

