Return-Path: <linux-doc+bounces-84330-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAbJEWdt6mnrzAIAu9opvQ
	(envelope-from <linux-doc+bounces-84330-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 21:05:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6722D45652C
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 21:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27C4E300A7DA
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 19:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B221234A783;
	Thu, 23 Apr 2026 19:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="kN6ZYPCS"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA961F3BAC;
	Thu, 23 Apr 2026 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971106; cv=pass; b=RLBmgIAZ0N8ClD42d4xHdCJsLodMTt0VxXdg2l3v+debPVKTdAt07MWXLM0kJqHGwfdXM+uAp44jO8f5Qjcbk271NCoEzWXj4R7wfleZC87NIrNpspFqjNt+0QYRYHSGUjs+ERN8DHomqkq4k3J043/1cmr0TNQmvM+IG2bytAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971106; c=relaxed/simple;
	bh=lfc1JSLHA5xiRali01FFUu/ug3osumq0xJzCwJ+XDTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNDS+I5UrVVwA+uSUZIRorTHsudsjwOUlG09v/dEpDVVemNAQT1symnSj8TcFycmdA/JOPekpR4WaLaHC5CZUtpU5hskEj0hzzfCSLAMhCEN9u73TfzYotnkzLBYwqaPDCgFdm6/cvdROWr4k2hyNCjNiI6NtbyilK1eQ131GMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=kN6ZYPCS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1776971049; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VBTK/OHY+e14LAgZJNLKMR7ZsSNSru6wDBtJK4DI41Lt6ZgQDVJ9/dXGD3WUGDoEgQmIrRQJXBpm0dUdRQwx3Lbf1uuC85js0bcCCO5jLV8Tw3WiOAxg6NqTOkruTcf4TmECfY7Y+KTz7cmHYlhT5fAGa0Q19sHWlnxGehwb9oc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971049; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PlS0fOKH4i7gWqyWLF6xhZ2wNtI3PN2yuFORKR59uLI=; 
	b=GLqATmVGjhO7i6k/nO/6+Xjli5zcEfWx8L361LSH4ap73nKDmWDopEFJmGaQ+9oWTLtIDXXmYuWJimkEAyRRg6voPjTWWPkqNHOjSh6I4OLoHSFiXW6T8NqWuvxnzBxvPE4NQiNREHpWCSqoHkeqEG6k1BkgI/3YfY0GX3YdbC0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971049;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PlS0fOKH4i7gWqyWLF6xhZ2wNtI3PN2yuFORKR59uLI=;
	b=kN6ZYPCSZEbSp9RlTTLSKypntmNeAOvC/P535MnWABen/mGSY69rYu/MWvkPY+lj
	HV+S+7TmaFweSIpuGsg2mCC68AUpRru5Bwmz7HdGkHBjDYrUiYobz6MS4iR/hTLsZPz
	JFskoP6kSFw5yK9CI5Js3t5o/0rxV/zh13uy2cgs=
Received: by mx.zohomail.com with SMTPS id 1776971048542663.0436067145853;
	Thu, 23 Apr 2026 12:04:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:25 +0200
Subject: [PATCH v14 02/28] drm/display: hdmi-state-helper: Use default case
 for unsupported formats
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-2-449a419ccbd4@collabora.com>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
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
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84330-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[40];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 6722D45652C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Switch statements that do not handle all possible values of an
enumeration will generate a warning during compilation. In preparation
for adding a COUNT value to the end of the enum, this needs to be dealt
with.

Add a default case to sink_supports_format_bpc's DRM_OUTPUT_COLOR_FORMAT
switch statement, and move the log-and-return unknown pixel format
handling into it.

No functional change.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 9f3b696aceeb..a0d88701d236 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -541,10 +541,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		drm_dbg_kms(dev, "YUV444 format supported in that configuration.\n");
 
 		return true;
-	}
 
-	drm_dbg_kms(dev, "Unsupported pixel format.\n");
-	return false;
+	default:
+		drm_dbg_kms(dev, "Unsupported pixel format.\n");
+		return false;
+	}
 }
 
 static enum drm_mode_status

-- 
2.53.0


