Return-Path: <linux-doc+bounces-87100-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI+7F8kzA2oA1gEAu9opvQ
	(envelope-from <linux-doc+bounces-87100-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:06:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AB4521F22
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04FD2337E93D
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 13:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EEA3A05ED;
	Tue, 12 May 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcn8Ipjy"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741CC3E1738;
	Tue, 12 May 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591194; cv=none; b=B+/iLUk/Efo8lOH+IBOjWOqwkv7F6rITlt/VbYNdQb6A7RbRCIpr1Dv987hQC0kfIjbX93/fmBIzvLjooy0W4MPof6CaXvLTNQiXv+9QBgE7NlihMehbuE55Vxgo5HbPHHseWdtgHXcLKRzxeJ01Pbwit0mx+PZdhz8vl0Gg7E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591194; c=relaxed/simple;
	bh=DoHehglpGEtHjd3p4fHoExXCMyZCNZ7HfU8eg8Uy0C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aP+7WnrUjj9o0YQsNnasXDsRYAOqwg0wEIPXlyvcXB9YSqwTzobicOyRaT8jW1lXPuEo6AgbdFaX3lzicBUiPddjQI4723EGSuQjUO8YBxGUC6IAdKJbgBmebt1aD0Zb8g7daCqBbdXZW1cvg04Re3k7v2y+XdbKVr3tHpV2wxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcn8Ipjy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A4CC2BCB0;
	Tue, 12 May 2026 13:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778591194;
	bh=DoHehglpGEtHjd3p4fHoExXCMyZCNZ7HfU8eg8Uy0C4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kcn8Ipjyj1AN5Ro/vOPKe+Q9n/tzZ6qXzkNtKuQBW1pAb5/VO5STgFrYI5a+3R+vH
	 8zv0Yc3oIbtVj8FqS/DNUSPrDRp8te+vVgHk8nthkneaGgqe0DJcC/l17LLNE61vNe
	 cZyBhv/68g2EdPkc2yU0OTysp1LPiAxK5o1HHa8wKXaFwhfG8BNDZbem97vX+U+xem
	 PWIJQHYQTDQusLGzy50MF5P5T8ro+7FU/k1XjaChtZk73yMzlhJlieb4J2K8pX37MF
	 X1gw4hqwXWAsH1KLMASkI7Eht6PC+Q4Ht//NlTNC4rTd2eEq5JEBqN0fV03PKKCJHE
	 8Yg7APr6eeT5A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 12 May 2026 15:06:05 +0200
Subject: [PATCH v4 07/20] drm/colorop: Create
 drm_atomic_helper_colorop_create_state()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-drm-mode-config-init-v4-7-591dfdcc1bf9@kernel.org>
References: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
In-Reply-To: <20260512-drm-mode-config-init-v4-0-591dfdcc1bf9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3524; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DoHehglpGEtHjd3p4fHoExXCMyZCNZ7HfU8eg8Uy0C4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFnMqntPLu28rbmhYflR0+Pp2+pmRUa6Z3JeSl5lL+te+
 +Bqx964jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRlBmMtXJHSlZtzw1M+TOH
 offDTpkUbgG1E79cUlaaVlY9iufd37rz77xXh/KDBX1atzzm93bTZ6zT7C7xCF4yMe3Lw5Ilmts
 81a2lCuI61k+zlfA2sNY+IPv5mMZZs2u3hBqseQTrnD/P8gYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: A2AB4521F22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87100-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,linuxfoundation.org,oss.qualcomm.com,iki.fi,ideasonboard.com,intel.com,linaro.org,kernel.org,kwiboo.se,emersion.fr,amd.com,igalia.com,redhat.com,ursulin.net,sholland.org,raspberrypi.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email,ideasonboard.com:email]
X-Rspamd-Action: no action

Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
to drm_private_obj") introduced a new pattern for allocating drm object
states.

Instead of relying on the reset() callback, it created a new
atomic_create_state hook. This is helpful because reset is a bit
overloaded: it's used to create the initial software state, reset it,
but also reset the hardware.

It can also be used either at probe time, to create the initial state
and possibly reset the hardware to an expected default, but also during
suspend/resume.

Both these cases come with different expectations too: during the
initialization, we want to initialize all states, but during
suspend/resume, drm_private_states for example are expected to be kept
around.

reset() also isn't fallible, which makes it harder to handle
initialization errors properly. This is only really relevant for some
drivers though, since all the helpers for reset only create a new
state, and don't touch the hardware at all.

It was thus decided to create a new hook that would allocate and
initialize a pristine state without any side effect:
atomic_create_state to untangle a bit some of it, and to separate the
initialization with the actual reset one might need during a
suspend/resume.

Continue the transition to the new pattern with drm_colorop.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_colorop.c | 23 +++++++++++++++++++++++
 include/drm/drm_colorop.h     |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 4c4d0a953e35..c0eecde8c176 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -521,10 +521,33 @@ static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
 							   &val))
 			colorop_state->curve_1d_type = val;
 	}
 }
 
+/**
+ * drm_atomic_helper_colorop_create_state - Allocates and initializes colorop atomic state
+ * @colorop: drm colorop
+ *
+ * Initializes a pristine @drm_colorop_state.
+ *
+ * RETURNS:
+ * Pointer to new colorop state, or ERR_PTR on failure.
+ */
+struct drm_colorop_state *
+drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop)
+{
+	struct drm_colorop_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_colorop_state_init(state, colorop);
+
+	return state;
+}
+
 /**
  * __drm_colorop_reset - reset state on colorop
  * @colorop: drm colorop
  * @colorop_state: colorop state to assign
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index c873199c60da..b4b9e4f558ab 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -423,10 +423,12 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
 				 struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
 				 uint32_t lut_size,
 				 enum drm_colorop_lut3d_interpolation_type interpolation,
 				 uint32_t flags);
 
+struct drm_colorop_state *
+drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop);
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
 
 void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
 				      struct drm_colorop_state *state);

-- 
2.54.0


