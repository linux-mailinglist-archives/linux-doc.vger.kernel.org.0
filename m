Return-Path: <linux-doc+bounces-88394-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ98EWArDGq0XwUAu9opvQ
	(envelope-from <linux-doc+bounces-88394-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 11:20:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 464C657B1BF
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 11:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BAFE530A7595
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 09:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771B940586A;
	Tue, 19 May 2026 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCdZ6qWg"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532AD40584F;
	Tue, 19 May 2026 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181335; cv=none; b=UeMhH5CQBGgRSSQ6bEGVkW0zltenEDepI2hHKuooCZSNh1GhdW0JVNut30RVdEf6YJkekWsm/lkKg90wwcMWOPOfyCrgiaI18IXYw+3bSY3s9YNhQSP+1rhk3sjx/IpCxXtKZsordNSQ6yVFUYUsZIP7a+04dx5hkpfdAGJ1I5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181335; c=relaxed/simple;
	bh=8gKR8nH9fdwkklOxC1orkJLxbt3pf9ySjt3LJ0StlRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRpYQ79gXOzMDeAf+1jz66oqUWYhptkDT4EsAqWseOSp5GO/Ldk7HwlyxGTGW6xuV+Xi8+P0CT9VjTEzg1wq5HLbm/t7JuxvL95HgWi6XfKrVoF76dFZoNhoAGkcR3mxE07yqWdXaJNg0ZiTH4sEvOyScFOd5IFFDzEErMnam54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCdZ6qWg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2BBC2BCF5;
	Tue, 19 May 2026 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181335;
	bh=8gKR8nH9fdwkklOxC1orkJLxbt3pf9ySjt3LJ0StlRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RCdZ6qWgczr9dtq+2SjsDchNxEuvhhSfHUYAWOl/VQZeUnZiuHMV//qLrp2iCS6Fx
	 X82N74LJqGTZ6QMlK9Et4b2MSMcl+1BuxoAQyI8Ns8iujfQlJ+w6FVyrU+IQpAloG0
	 3o0oda4ixqW8X+PchhhqBakBq5m4CPOUR73ooMSIaxP8mfAMBDoN/gTbw3pLaqntFu
	 9bRcRCN8q3DXLwUlLwkBDOclaslXcODv7obK/Ij/TnduCkAM6uNOd2V68saM6OJ5DP
	 wrcaTqB3L9/e2PRHwRNLgRH1usJWwDNmIfNRwE98f7VfCxMkROYtscsIiBJArMQsTn
	 jhlh42DHf/8Rw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 19 May 2026 11:01:45 +0200
Subject: [PATCH v5 03/19] drm/atomic: Drop drm_private_obj.state assignment
 from create_state
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-mode-config-init-v5-3-388b03321e38@kernel.org>
References: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
In-Reply-To: <20260519-drm-mode-config-init-v5-0-388b03321e38@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8gKR8nH9fdwkklOxC1orkJLxbt3pf9ySjt3LJ0StlRk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFk8ar/i5iW5bI8RdJHYE79ik8CcL5mW7etsg/9Ps/p6Y
 cO1EpaojqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARzSuMDfvCS7I3FVbu8j7l
 n5F+1MJl8cqiRx0HZgY8WOH58CDPxBmLmybc4HYRiY07zdkee1plDmPDskS/ukKVTjZ9njRB9im
 KTrUh9it/3EzJWGp7SuIS4+Kc+vNiNkwfnln/f7dkfs62SycA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88394-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,linuxfoundation.org,oss.qualcomm.com,iki.fi,ideasonboard.com,intel.com,linaro.org,kernel.org,kwiboo.se,emersion.fr,amd.com,igalia.com,redhat.com,ursulin.net,sholland.org,raspberrypi.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 464C657B1BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The initial intent of the atomic_create_state hook was to simply
allocate a proper drm_private_state and return it, without any side
effect.

However, __drm_atomic_helper_private_obj_create_state(), which most
atomic_create_state implementations call, introduces a side effect by
setting drm_private_obj.state to the newly allocated state.

This assignment defeats the purpose, but is also redundant since
drm_atomic_private_obj_init(), the only call site for the
atomic_create_state hook, will also set this pointer to the newly
allocated state.

Drop the assignment in __drm_atomic_helper_private_obj_create_state().

Fixes: e7be39ed1716 ("drm/atomic-helper: Add private_obj atomic_create_state helper")
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index cc70508d4fdb..a82568d87e4f 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -729,12 +729,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
 void __drm_atomic_helper_private_obj_create_state(struct drm_private_obj *obj,
 						  struct drm_private_state *state)
 {
 	if (state)
 		state->obj = obj;
-
-	obj->state = state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);
 
 /**
  * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state

-- 
2.54.0


