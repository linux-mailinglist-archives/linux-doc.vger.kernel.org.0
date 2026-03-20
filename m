Return-Path: <linux-doc+bounces-80379-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFIPKQV5vWmt9wIAu9opvQ
	(envelope-from <linux-doc+bounces-80379-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 17:42:45 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FA32DDBC0
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 17:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E9AA3207D26
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 16:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D476F3D1715;
	Fri, 20 Mar 2026 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFFMqAPn"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD33D16FF;
	Fri, 20 Mar 2026 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024067; cv=none; b=nqm/AmJPPz0E8Gs0ALIxonnWgcOuIR04o9P2CdlXbV6YetQP/aXLNJ8yFQPYJve4QojGRqLWXX08QA8aYACAFvOfZlXk1+9xsnMGhm64mEaOAqT3VwJU8fVaNjSQriN+KwiE5nUGz/iF5Is1C0ujVV/yspvzPmaZovP1C1d93Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024067; c=relaxed/simple;
	bh=i7TSkNwA5i7hM5OyE8zhFD/zvFWDZzBFXs6vPOsGtYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUDyBh5rk4PPXEMMnT1XQzR30hWaDibytQJ9ZSM6xGEhVoajpVGKKMB19GdtzgBwlSB+CPi7MSNBafZQ2NeKQb9tSpBy8s32Gqj4WwjuAzNayoytsEf38nlcyp2rKt+OhBYUX7j79Z1a2pXgPxL9qdF1hC66EHEyKVf7nSHg6OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFFMqAPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167D0C2BC87;
	Fri, 20 Mar 2026 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024067;
	bh=i7TSkNwA5i7hM5OyE8zhFD/zvFWDZzBFXs6vPOsGtYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PFFMqAPn66V78VY8gVBPfH3iAT8OXivT/nLHl/NmdhZT9oo5vey1KILVEfd2ItMdg
	 nbYWYbrqB1xip4NiLHQOiNiJMW9UGZQE002HdNdbU2AvQACBibrhD76c002O4fuoNl
	 SVLCBQdtQkR6LhnAAnRtI7D68dUHWqhu4rsaB5nnXnGbNSDbAMkbPZl1X2LXoTGHfZ
	 VWwJQDOlhHz3Cc7id9OsbluyGvhYe8b55yc1eMwcdlVglLE0HdRvmvQv0CmEctedYJ
	 LfV7+t59KGVpY1RcfOGbW8cqCvZOkUTRkDiTph74MSSy4KFdWhRxP3cbOEC+HvvArQ
	 NDWwbn7gFTD4w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:14 +0100
Subject: [PATCH v2 07/20] drm/atomic-state-helper: Rename
 __drm_atomic_helper_plane_state_reset()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-7-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4770; i=mripard@kernel.org;
 h=from:subject:message-id; bh=i7TSkNwA5i7hM5OyE8zhFD/zvFWDZzBFXs6vPOsGtYU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S9N0nZJn5nf7Oxi4bzm6U61Krta3I/hbP4fI1i9ru
 nmebLzWMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbyq5Kx4cau03FThIUbD/05
 7nvw650NnxK5Q4Ke8Ex8tI59T8QP9u9G1VGlWjOap51+tjXSJGflPsY6y4+Jia7ZLfHWChkHGAt
 mtRgtLK24abQhxUWzvPPljamrHUyWd0X8ars6RXPdJe4ZX44CAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80379-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,linuxfoundation.org,oss.qualcomm.com,iki.fi,ideasonboard.com,intel.com,linaro.org,kernel.org,kwiboo.se,emersion.fr,amd.com,igalia.com,redhat.com,ursulin.net,sholland.org,raspberrypi.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 12FA32DDBC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

__drm_atomic_helper_plane_state_reset() is used to initialize a newly
allocated drm_plane_state, and is being typically called by the
drm_plane_funcs.reset implementation.

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_plane_state instance, we will need to call
__drm_atomic_helper_plane_state_reset() from both the reset and
atomic_create hooks.

To avoid any confusion, we can thus rename
__drm_atomic_helper_plane_state_reset() to
__drm_atomic_helper_plane_state_init().

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c  | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_plane.c |  2 +-
 include/drm/drm_atomic_state_helper.h      |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index e1f3d05ad3470154a6be01423979a4deb8617441..2548d6da13675f63304dc92423c5d225de0447a8 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -235,19 +235,19 @@ void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
 
 /**
- * __drm_atomic_helper_plane_state_reset - resets plane state to default values
+ * __drm_atomic_helper_plane_state_init - Init plane state to default values
  * @plane_state: atomic plane state, must not be NULL
  * @plane: plane object, must not be NULL
  *
  * Initializes the newly allocated @plane_state with default
  * values. This is useful for drivers that subclass the CRTC state.
  */
-void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
-					   struct drm_plane *plane)
+void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
+					  struct drm_plane *plane)
 {
 	u64 val;
 
 	plane_state->plane = plane;
 	plane_state->rotation = DRM_MODE_ROTATE_0;
@@ -295,11 +295,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 							   plane->hotspot_y_property,
 							   &val))
 			plane_state->hotspot_y = val;
 	}
 }
-EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
+EXPORT_SYMBOL(__drm_atomic_helper_plane_state_init);
 
 /**
  * __drm_atomic_helper_plane_reset - reset state on plane
  * @plane: drm plane
  * @plane_state: plane state to assign
@@ -313,11 +313,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
  */
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *plane_state)
 {
 	if (plane_state)
-		__drm_atomic_helper_plane_state_reset(plane_state, plane);
+		__drm_atomic_helper_plane_state_init(plane_state, plane);
 
 	plane->state = plane_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
 
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index e06a0618b4c6cd3b4d13752f604006b525118193..705367fef836663e50fe9bbfb1fcc83abf1fb249 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -65,11 +65,11 @@
 static void intel_plane_state_reset(struct intel_plane_state *plane_state,
 				    struct intel_plane *plane)
 {
 	memset(plane_state, 0, sizeof(*plane_state));
 
-	__drm_atomic_helper_plane_state_reset(&plane_state->uapi, &plane->base);
+	__drm_atomic_helper_plane_state_init(&plane_state->uapi, &plane->base);
 
 	plane_state->scaler_id = -1;
 }
 
 struct intel_plane *intel_plane_alloc(void)
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 900672c6ea90ba9cb87e38a7c84225972aee43c5..44e8850aae7fd6390f4b58188a9c677b8389702f 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -51,11 +51,11 @@ struct drm_crtc_state *
 drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 					  struct drm_crtc_state *state);
 
-void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *state,
+void __drm_atomic_helper_plane_state_init(struct drm_plane_state *state,
 					   struct drm_plane *plane);
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *state);
 void drm_atomic_helper_plane_reset(struct drm_plane *plane);
 void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,

-- 
2.53.0


