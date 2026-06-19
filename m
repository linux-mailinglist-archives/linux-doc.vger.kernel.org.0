Return-Path: <linux-doc+bounces-92955-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /dxvIWNtNWpowAYAu9opvQ
	(envelope-from <linux-doc+bounces-92955-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 18:25:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9476A70A6
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 18:25:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=jY8Egj58;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92955-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92955-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71C77300F44A
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 16:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E1D3BD63B;
	Fri, 19 Jun 2026 16:25:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8641FA859;
	Fri, 19 Jun 2026 16:25:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781886306; cv=none; b=hjecI/P1C8Arrs4oV2b/zBzZYd0jRspDfu1Y2SZAayRl9tGee2Rp/QmrqdoyynTeIUUZPjuPFCHezuQozSPEzyc0NQlDfNuL5Y7bUu8KMMBfYNUQikMWmGbMrwcAQAgA+7mVIBLolHs3gmupibtEzs/xWLE8+DgkpNqlgSfryyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781886306; c=relaxed/simple;
	bh=0R25ISdpc+AAKuQJQAHUFKomgtbaxc7SSl/fsBbkLEs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=e+bu73OKR3umS5rETRYgoXyVEa/QNBmL5Y6caQJitpTQ2v6TAYxceb8KSEFQ/UrbKoH+Gfw1eszjVNM2R3GlAzX6AMYGo1v0bi003V/R6X9tBwMZEwcAZa2raeB99vbmjBiYyWjpnx4K8qlQqVFLtKN0xD8hPFekYB9zEcHTdg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jY8Egj58; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A99E91A3A21;
	Fri, 19 Jun 2026 16:25:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D0F4601AD;
	Fri, 19 Jun 2026 16:25:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08E5B106C81BC;
	Fri, 19 Jun 2026 18:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781886299; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xrx5VoO25eYm5EH6Wc6vNdgK+6vpuoEcmvN4eX6Cvok=;
	b=jY8Egj58zUWOmsPwj9vynk2NQy9hCh/a+LGJvBDk3DqRfyL+FJQIuyDJQRRohvDhOBXcnW
	//AvVJmy/V7tylN+21mDLl593BLUfcG3dz090WmD7UcN98JIRVRLQ/m5l7+EC2wkNUXoNu
	OY3r/fPM8V0Ey5z04hzY+MHXR+FXcsckzsiV8jrezwluFXHT8MZBukmQNizYV+LllFdQFg
	Nq8mjjsoK8DWc4IXuaLUWlBpL/WCM0pLIK5BmeG/ZousyZJb+/ny8SsYGoB3m1Nbz1HyNz
	3bGNW8rAc8osqfVrmerKyh25ch/VkV9XZdD23tG58EnuIwQFtxnCNKSDDWhrYg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 18:24:46 +0200
Message-Id: <DJD5YZ2K1047.3UJ5QMMLQO6UY@bootlin.com>
Subject: Re: [PATCH v6 15/19] drm/connector: Add new atomic_create_state
 callback
Cc: <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Daniel Stone" <daniels@collabora.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Jyri Sarha" <jyri.sarha@iki.fi>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Simon Ser"
 <contact@emersion.fr>, "Harry Wentland" <harry.wentland@amd.com>, "Melissa
 Wen" <mwen@igalia.com>, "Sebastian Wick" <sebastian.wick@redhat.com>, "Alex
 Hung" <alex.hung@amd.com>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Samuel Holland" <samuel@sholland.org>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, "Raspberry Pi Kernel
 Maintenance" <kernel-list@raspberrypi.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260526-drm-mode-config-init-v6-0-852346394200@kernel.org>
 <20260526-drm-mode-config-init-v6-15-852346394200@kernel.org>
In-Reply-To: <20260526-drm-mode-config-init-v6-15-852346394200@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92955-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:daniels@collabora.com,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:laurent.pinchart+renesas@ideasonboard.com,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:contact@emersion.fr,m:harry.wentland@amd.com,m:mwen@igalia.com,m:sebastian.wick@redhat.com,m:alex.hung@amd.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:wens@kernel.org,m:samuel@sholland.org,m:dav
 e.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:laurent.pinchart@ideasonboard.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,linuxfoundation.org,oss.qualcomm.com,iki.fi,ideasonboard.com,intel.com,linaro.org,kwiboo.se,emersion.fr,amd.com,igalia.com,redhat.com,ursulin.net,sholland.org,raspberrypi.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,vger.kernel.org:from_smtp,suse.de:email,bootlin.com:dkim,bootlin.com:mid,bootlin.com:url,bootlin.com:from_mime,gitlab.freedesktop.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A9476A70A6

Hello Maxime, Dmitry, all,

On Tue May 26, 2026 at 6:46 PM CEST, Maxime Ripard wrote:
> Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> to drm_private_obj") introduced a new pattern for allocating drm object
> states.
>
> Instead of relying on the reset() callback, it created a new
> atomic_create_state hook. This is helpful because reset is a bit
> overloaded: it's used to create the initial software state, reset it,
> but also reset the hardware.
>
> It can also be used either at probe time, to create the initial state
> and possibly reset the hardware to an expected default, but also during
> suspend/resume.
>
> Both these cases come with different expectations too: during the
> initialization, we want to initialize all states, but during
> suspend/resume, drm_private_states for example are expected to be kept
> around.
>
> reset() also isn't fallible, which makes it harder to handle
> initialization errors properly. This is only really relevant for some
> drivers though, since all the helpers for reset only create a new
> state, and don't touch the hardware at all.
>
> It was thus decided to create a new hook that would allocate and
> initialize a pristine state without any side effect:
> atomic_create_state to untangle a bit some of it, and to separate the
> initialization with the actual reset one might need during a
> suspend/resume.
>
> Continue the transition to the new pattern with connectors.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

As I'm rebasing another series on current drm-misc-next, which now includes
this patch, I ran into troubles and I'm not sure what is the right thing to
do. I hope you can help me clarify this. See below for my question.

FTR the series I'm rebasing is "drm bridge hotplug", but the question is
not specific to that series.

> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -616,11 +616,19 @@ int drmm_connector_hdmi_init(struct drm_device *dev=
,
>
>  	/*
>  	 * drm_connector_attach_max_bpc_property() requires the
>  	 * connector to have a state.
>  	 */
> -	if (connector->funcs->reset)
> +	if (connector->funcs->atomic_create_state) {
> +		struct drm_connector_state *state;
> +
> +		state =3D connector->funcs->atomic_create_state(connector);
> +		if (IS_ERR(state))
> +			return PTR_ERR(state);
> +
> +		connector->state =3D state;
> +	} else if (connector->funcs->reset)
>  		connector->funcs->reset(connector);

Here a state is added to connector->state, and that's fine.

However non-HDMI connectors don't get a state created by default.

I was hit by this with the drm_bridge_connector which it can add either an
HDMI or a non-HDMI connector [0]. In the former case it calls
drmm_connector_hdmi_init(), which creates the state (in the hunk quoted
above). In the latter case, as I experienced at runtime and confirmed by
code inspection, it does not create a state: no one calls
connector->funcs->atomic_create_state.

I suspect this is related to patch 19/19 which converted the
drm_bridge_connector from drm_atomic_helper_connector_reset() to
drm_atomic_helper_connector_create_state(), and only the former sets
'connector->state =3D conn_state'.

Generally speaking, looks like a state is created only for HDMI
connectors.

The hardware I have uses the drm_bridge_connector in the non-HDMI case, so
the state is not created and this results in a NULL pointer deref later on,
in my case it's in in drm_atomic_connector_get_property().

Am I missing anything obvious?

For now I've come up with a quick workaround, adding (roughly after
connector init at [1]):

        if (!connector->state)
                connector->state =3D drm_bridge_connector_create_state(conn=
ector);

I'm not sure which would be the best solution. Maybe taking the whole
atomic_create_state/reset state creation calls [2] from
drmm_connector_hdmi_init() and hoist them up into
drmm_connector_init(), so all connectors benefit?

Let me know what you think.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/7a921d11181065267=
2e02c392b35fdcefa4d5030/drivers/gpu/drm/display/drm_bridge_connector.c#L995=
-1029
[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/7a921d11181065267=
2e02c392b35fdcefa4d5030/drivers/gpu/drm/display/drm_bridge_connector.c#L103=
0
[2] https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/7a921d11181065267=
2e02c392b35fdcefa4d5030/drivers/gpu/drm/drm_connector.c#L617-631

Kind regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

