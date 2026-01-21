Return-Path: <linux-doc+bounces-73469-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBAuGAn3cGmgbAAAu9opvQ
	(envelope-from <linux-doc+bounces-73469-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 16:55:53 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D7759870
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 16:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B70BC7688FF
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 14:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78EA4A340A;
	Wed, 21 Jan 2026 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="BBA3G30g"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E3D4A2E31;
	Wed, 21 Jan 2026 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006825; cv=pass; b=KOt9ThGLTs8yF6mi4lDAVBt1VxwnKeQ7tOMI+xWgSyr8hNgwJJvQUXV/7AtbSQamjFadKr7bpyiq5A9X/NFaq0Rx8A5Tm2DSfr3YBtYK2poEazpeKyL2yfhIk8puBUKTXcQDcDXF1jgya7qELhk09HxlmxdpNnM82NjJT65f+rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006825; c=relaxed/simple;
	bh=Fw46rztxhXlIflLl9DCo96v7GUozyz/juihMDMD9MWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6P28KYmEAzvgVfzXZ4//n76p4uy6kEaOgwmVQYh5XBZa9iS1kIfFKAp6yx0TMt8KTPzrYf6soGlTP0aIhlt/+nwQN+LonBOnGrLJzcl3eomzq9hb5tboFxfvaM6Rx7wdD/3luSsgV+YpcuQ9nd37s5PwHIED+19P5EGj/dsKdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=BBA3G30g; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1769006780; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e0A4bW9Bg//mH1TE8GfuAwqfayUGCpTByz8IEEaPpwXzBquMDVy0nh5DH51xbXKy5rmPwQH662AUdtZWghBgIouKZ/a4t5OcyMy6SRhKH7RF5w3XFXv3u1InZKhbzjnQuvfGp2x8L+/2NpFL+8gNDT5cyce1xYSb7IQm4Ny9WbY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769006780; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w+BU3yZcnZLVUl/l+ViGJZdk5XsNHMsU7ReIC8wTppQ=; 
	b=UCX3Sl2AfKRLsoHrzKby2mB6kAlz8z7DLkyY2+qpryszgxTq5gKYjjN3N8LBgdeXs63ZR2XJQBp3n2w467z1PwweHayc0MWK7bkFJ9fn9HSueTfjNeCiVs/l9hf5cP827z+M+CJHOUZJTNxfEV1ZSeCjTJnKQeqlBIrdinhwmuc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769006780;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=w+BU3yZcnZLVUl/l+ViGJZdk5XsNHMsU7ReIC8wTppQ=;
	b=BBA3G30gz/faVkMIqxUCEfIPk4lJkyDvkZggDeRxsF+FnBk5WUiwMEHQo9huuyiy
	h6tP6sZzmVJFb1mG3J6aljLWPNV+RxGUhRefiXBWZD8OZq9a6NJCzfHDr0Z9td7/Ahu
	PhVSsOrPoBTnnbM0fkZMh4rytu6Lyv0rcJGVWJY0=
Received: by mx.zohomail.com with SMTPS id 1769006778497255.4881577685843;
	Wed, 21 Jan 2026 06:46:18 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 15:45:13 +0100
Subject: [PATCH v7 06/22] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v7-6-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
In-Reply-To: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73469-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-doc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[collabora.com,none];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 25D7759870
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

drm_hdmi_connector_mode_valid assumes modes are only valid if they work
with RGB. The reality is more complex however: YCbCr 4:2:0
chroma-subsampled modes only require half the pixel clock that the same
mode would require in RGB.

This leads to drm_hdmi_connector_mode_valid rejecting perfectly valid
420-only or 420-also modes.

Fix this by checking whether the mode is 420-capable first. If so, then
proceed by checking it with HDMI_COLORSPACE_YUV420 so long as the
connector has legalized 420, otherwise error out. If the mode is not
420-capable, check with RGB as was previously always the case.

Fixes: 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 1ea3b9c93aa5..ceabfdb30f7a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -898,8 +898,21 @@ drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 			      const struct drm_display_mode *mode)
 {
 	unsigned long long clock;
+	enum hdmi_colorspace fmt;
+
+	if (drm_mode_is_420_only(&connector->display_info, mode)) {
+		if (connector->ycbcr_420_allowed)
+			fmt = HDMI_COLORSPACE_YUV420;
+		else
+			return MODE_NO_420;
+	} else if (drm_mode_is_420_also(&connector->display_info, mode) &&
+		   connector->ycbcr_420_allowed) {
+		fmt = HDMI_COLORSPACE_YUV420;
+	} else {
+		fmt = HDMI_COLORSPACE_RGB;
+	}
 
-	clock = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	clock = drm_hdmi_compute_mode_clock(mode, 8, fmt);
 	if (!clock)
 		return MODE_ERROR;
 

-- 
2.52.0


