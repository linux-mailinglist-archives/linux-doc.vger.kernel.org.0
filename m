Return-Path: <linux-doc+bounces-91593-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C9uSMJYMKGoU9AIAu9opvQ
	(envelope-from <linux-doc+bounces-91593-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 14:52:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568E6603E6
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 14:52:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=B5NvwbUa;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91593-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91593-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 694CA304CF75
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 12:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54043F4859;
	Tue,  9 Jun 2026 12:46:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F483DFC8F;
	Tue,  9 Jun 2026 12:46:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009195; cv=pass; b=V2gzgKqAJars6IsKm43LzhP4QWWYTUJB009+Bf32sZEemHT5YqP/dMs7AJmHoZJiA/dk0xEG/Koumfgz6emEFARUhv7wD7fsSHvkRiY498SK6HgQa1/yEkZoOPwAcAK0nqrE6k+rtzJx9ZE5nTZe5wsU1s7Zz34FX2uwBIeZNMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009195; c=relaxed/simple;
	bh=6yOpB9Ash46pW/QJlLvIqQd3mfvc1i4Vkt2TOorcn2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/nWa8vN0GTBRICjxleCf+gZoAFcJqpp6KhXZm2idykhjNfZCRJ4yW6vV60T1TNq/i2xLYgrfTGwpW8sGMdG8X+9cY9bKvevvcqE6UfsrTIEF8qqSBhQsDIEZTUbxrjdd5sl/sWJ+dZxqgmg1BIxzmap7VtOsx+CcTYm3dCnC0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=B5NvwbUa; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1781009143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yc6OyfwpcscwjjSDge3O05OI6ZjWVu+7+LaSFqY5ajmfHPbhnK5FCQgFpI0bkJd2lwc+lqYxJXR5IVvGQehDvAcKVOGUTvJf2MFI6nUnlmb4xw6jds/Kp1fFVIfjd5ehgcnObn5SW0kEoRtGOYHr+aooSuAvtORCMX6nYcQ21Gw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781009143; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M6wU4NrUe+v4YhcSMo6XilsLOyw86ckxU6P0st+QPRE=; 
	b=OpQOsefN/9nKtKLoZdi7rMl4tlPD4g+66jcMoJpUNYrDWFZ9gK7XakC7eUOGjMabcHxpnInvte0ECgdxnS9l5VrQ5VYdlq/J4efXT33UFes77hzsPxGMDT8X8tcy7HlSumW7QiKA4/t53+Zws+BTRRDeBbldpCd5VvorxIEyBQk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781009143;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=M6wU4NrUe+v4YhcSMo6XilsLOyw86ckxU6P0st+QPRE=;
	b=B5NvwbUayVw4bV7eewT1D9psA6LdRbxKsjz0obMnlK4TMGs2xp/pMS6JIzhLK/C7
	bexbDaasP6158GGU6D1dPegaR+PWTmoP8ulkUiiyp0XhIFBolh6e6Mw9dbdva4RWXLL
	7/lL4xchNLU3UtpNgV8iy+au53q7f+AfL0/nC9Do=
Received: by mx.zohomail.com with SMTPS id 178100914169789.36349059736551;
	Tue, 9 Jun 2026 05:45:41 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 09 Jun 2026 14:43:56 +0200
Subject: [PATCH v17 09/28] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-color-format-v17-9-35739b5782cc@collabora.com>
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
In-Reply-To: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,fooishbar.org];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:lumag@kernel.org,m:s.hauer@pengutronix.de,m:robh@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:daniel@fooishbar.org,m:kernel@collabora.com,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-d
 oc@vger.kernel.org,m:wayland-devel@lists.freedesktop.org,m:nicolas.frattaroli@collabora.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91593-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fooishbar.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3568E6603E6

drm_hdmi_connector_mode_valid assumes modes are only valid if they work
with RGB. The reality is more complex however: YCbCr 4:2:0
chroma-subsampled modes only require half the pixel clock that the same
mode would require in RGB.

This leads to drm_hdmi_connector_mode_valid rejecting perfectly valid
420-only or 420-also modes.

Fix this by checking whether the mode is 420-capable first. If so, then
proceed by checking it with DRM_OUTPUT_COLOR_FORMAT_YCBCR420 so long as
the connector has legalized 420, otherwise error out. If the mode is not
420-capable, check with RGB as was previously always the case.

Fixes: 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 069f9bf2489e..ce17eeefc2da 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -943,8 +943,21 @@ drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 			      const struct drm_display_mode *mode)
 {
 	unsigned long long clock;
+	enum drm_output_color_format fmt;
+
+	if (drm_mode_is_420_only(&connector->display_info, mode)) {
+		if (connector->ycbcr_420_allowed)
+			fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+		else
+			return MODE_NO_420;
+	} else if (drm_mode_is_420_also(&connector->display_info, mode) &&
+		   connector->ycbcr_420_allowed) {
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+	} else {
+		fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
+	}
 
-	clock = drm_hdmi_compute_mode_clock(mode, 8, DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	clock = drm_hdmi_compute_mode_clock(mode, 8, fmt);
 	if (!clock)
 		return MODE_ERROR;
 

-- 
2.54.0


