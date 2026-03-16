Return-Path: <linux-doc+bounces-79518-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DeDEDwyuGmvaAEAu9opvQ
	(envelope-from <linux-doc+bounces-79518-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 17:39:24 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B60F629D859
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 17:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53AB430965C0
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 16:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDEB3CCFCA;
	Mon, 16 Mar 2026 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bTDXH024"
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2513B9DBF;
	Mon, 16 Mar 2026 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678838; cv=none; b=aeXdxsr7Jg/QhlStGTVVBCiJv8WIPwY45tsxQBdH1icn84HSb194pZ7RvJY1MzKIbOQnt1U1RZU9qYfHciw5SXlbRNBofhlYJ83+ssYatZ0OAY82egx+jhDW5zK+JnSMMSuAo8ZHonhpXOV7Z4fdBvNv/qmo4cdZpMK0BpDk13Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678838; c=relaxed/simple;
	bh=ilztXb4L4lL5NjMNyaSUms4WUvTR31TNZ12rgzjdspE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDJ0SlX07oqeS5uHh9pX75N06Ss0beAQ6CtJ6fvexQ5pROyPflVLd3JrhrRZwoItfkGNgAo/aLs4A5jt4QaxI148MjgdvbSXU15vBf6hZEdaI3Z/ZhkuzsL7PnDLctg86xjjJV/mc7V4s2BPTy2ko9EirTC61CTEwk1opnAdHZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bTDXH024; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 53054BD2;
	Mon, 16 Mar 2026 17:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773678764;
	bh=ilztXb4L4lL5NjMNyaSUms4WUvTR31TNZ12rgzjdspE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTDXH024qh/2g4362810lLVTQHlYxS4V47UR5/grd9GNmHVk+p4FLWsi9fQM/oCX2
	 0PHlhrn87vpDT2Sz0D4FWhNqlqBa3/SM31dC7eU4vyW5yQm2aLwyGrls7Dgg2JCDr4
	 r3vkl2/SsugkJQY0hbnThRaBNfEEpAXKu94bfZBo=
Date: Mon, 16 Mar 2026 18:33:54 +0200
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
Subject: Re: [PATCH 09/14] drm/drv: Call drm_mode_config_create_state() by
 default
Message-ID: <20260316163354.GN31604@killaraus.ideasonboard.com>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-9-de7397c8e1cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-drm-mode-config-init-v1-9-de7397c8e1cf@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,linuxfoundation.org,oss.qualcomm.com,iki.fi,ideasonboard.com,intel.com,linaro.org,kernel.org,kwiboo.se,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-79518-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B60F629D859
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 05:07:01PM +0100, Maxime Ripard wrote:
> Almost all drivers, and our documented skeleton, call
> drm_mode_config_reset() prior to calling drm_dev_register() to
> initialize its DRM object states.
> 
> Now that we have drm_mode_config_create_state() to create that initial
> state if it doesn't exist, we can call it directly in
> drm_dev_register(). That way, we know that the initial atomic state will
> always be allocated without any boilerplate.

Should most drivers now stop calling drm_mode_config_reset() at probe
time ?

> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_drv.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 2915118436ce8a6640cfb0c59936031990727ed1..820106d56ab399a39cac56d98662b5ddbcae8ded 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1097,10 +1097,14 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  
>  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>  		ret = drm_modeset_register_all(dev);
>  		if (ret)
>  			goto err_unload;
> +
> +		ret = drm_mode_config_create_state(dev);
> +		if (ret)
> +			goto err_unload;
>  	}
>  	drm_panic_register(dev);
>  	drm_client_sysrq_register(dev);
>  
>  	DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",

-- 
Regards,

Laurent Pinchart

