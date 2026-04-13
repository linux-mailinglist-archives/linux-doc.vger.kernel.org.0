Return-Path: <linux-doc+bounces-83231-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF/MHSjD3Gn5VwkAu9opvQ
	(envelope-from <linux-doc+bounces-83231-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 12:19:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3473EA829
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 12:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F9FF31036BE
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 10:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177903B4E87;
	Mon, 13 Apr 2026 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="YsK9cZHo"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE332E6BD;
	Mon, 13 Apr 2026 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075092; cv=pass; b=fXCVjU/9sUPIXeEUHNVA7PmyzKDRDzF0gAGj9NDSSPtg+4shsAGueSYV63rgmlBSn6N8BRYBoDxCKvi6nH5uln2jRQd0mE4X7nibJN5Mac4/ss+47p6VyMWupTpXrp7nmElqs+oonHg4i3KeXLY+5G+2YKwTvOJvH0a6PtZD1xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075092; c=relaxed/simple;
	bh=SF3PqPGQFW1n2GlkvMRXgWabOnuNFx6aVRju0Yr4vCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FiNLCaA+3c58AOHTX2p7chuTs7Nnrlp+Vm4XHm/7Va88EfTEixVUSZO0yxc8TvaTTtcOiR64WQucsKusU82yRxHyWgV5AVPwfKgTaqrhhUgVLfQsoQU6pf/sETbUtCYCKotjcIiZ0rKY+aUKqdEeqBxIQvttZtGJ5Hp+Um3MpT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=YsK9cZHo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1776075049; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FEUL1AZxBhLulwNyvsoHf59jGeaMvoKgJQbWqfFEAmzezA3hBiyC3PVygBwV4G7np2j0hGunigEkHsvqAnaWS8iVYr5h654OwYz7/D9WaY1qunZrUjNqi01qAtDa3iBvgBmzVmUv2Zbj2viGQ/k5ogvXCpmiVphHICDaFRDVPsM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776075049; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6qn4b7ZWpiJEjeric1g/QPZ6VWA0MPNXyaxCPWQyZaE=; 
	b=XYVl8rdJ3IYkr3priGfQpdX2mgDyyrUdLoJ+MCsMeDXoLZWyV/ze2CfBnQuTlpXfCDbXFMSkP8JIuWYvvWuaCBaEgVP8PK5rY28mg81MbaXN6OpEpg+kzDyhotI/KsVLBpg4UBt2f6OrsaD4FvWKcYx0oxC+/YSnbLN8mbTZrxc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776075049;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=6qn4b7ZWpiJEjeric1g/QPZ6VWA0MPNXyaxCPWQyZaE=;
	b=YsK9cZHoc1P8AaU4G8gDxx2YFS6hY6oO2paRrygsrywgKVHCAig4fkPCwISneTa7
	rjTd/vDJDaLH0x11Xh9fMtetbCwvynqbOw4Ay33WucjcfVjC4H1p7HcfTm5qdjDpbmw
	Vi4ASJmT5q1GMSjFHSWcNHGazEt4ZDnybIt6APJc=
Received: by mx.zohomail.com with SMTPS id 1776075047408170.7971357844874;
	Mon, 13 Apr 2026 03:10:47 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Apr 2026 12:07:35 +0200
Subject: [PATCH v13 21/27] drm/connector: Register color format property on
 HDMI connectors
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-color-format-v13-21-ab37d4dfba48@collabora.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83231-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF3473EA829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The drmm_connector_hdmi_init function can figure out what DRM color
formats are supported by a particular connector based on the supported
HDMI format bitmask that's passed in.

Use it to register the drm color format property.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d354ab77d3b8..048789032971 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -627,6 +627,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	ret = drm_connector_attach_color_format_property(connector, supported_formats);
+	if (ret)
+		return ret;
+
 	connector->hdmi.funcs = hdmi_funcs;
 
 	return 0;

-- 
2.53.0


