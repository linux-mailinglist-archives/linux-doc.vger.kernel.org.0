Return-Path: <linux-doc+bounces-93768-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 35ZlO/dDP2pXQwkAu9opvQ
	(envelope-from <linux-doc+bounces-93768-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:31:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A52CD6D0DA3
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:31:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=u1Th9DmB;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93768-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93768-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C62E93015860
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 03:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294EB21E097;
	Sat, 27 Jun 2026 03:30:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711FE2459DD;
	Sat, 27 Jun 2026 03:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531059; cv=none; b=WZyAXQTzw4O12faTQczNOS64WPeqh2Za2pSABMk8Q7/N3abVdokPhpzlOasKRdONUEZO+YqStrN4FAmmbCoEMsQwhQTJ6UENNqvArrjFTwH+xu6kQPT8Q9tCRyvoe5u/O5JdwqK+Rv0iIqllODbvuNQIAfk8kUuouQUyTwdg/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531059; c=relaxed/simple;
	bh=F6c91uycHO4sbmoHLTpP20OekCyoqwScqtNxrwrFaJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pG7Gq3fpDdim5OamFn7CeFNiEFW5wqN1W28QtWXdmmRuGotGJhnxWzPtl8hok5DKmrrt05UVJ7N7qkQH8EEC3ax7ZcNU2AFN+VVf7ucKqi9E2hjaGrNzr3S2cTqsONFksngQ5FZb5vJjuyiLPGBTSjZdw5AihA3tvYFAm2c7Hm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=u1Th9DmB; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 274F41A0A08;
	Sat, 27 Jun 2026 03:30:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE8F260233;
	Sat, 27 Jun 2026 03:30:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40CC2106F116D;
	Sat, 27 Jun 2026 05:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531054; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hwerMsivh8BfM/hhBYmrds/bzmWbDr4E5XoWMr8kQAE=;
	b=u1Th9DmBrt3zo1GI6umZnXL3sswsbRzfVO5oesXcJotdxB7tc52CeRaMgnXjPQdP8g9llV
	fHGyNwdj+gkol2e5WEI7XQvQTZ4KbTVo39rnidQpqwcp+CXq5uIRDQKEhc5FhBeCP+8FaO
	0F5QOBMEEZE/MYAnjiGTFa+5+h6rEGuFCyEdmyLKgM9OTJ8M6Qgfw60S7McQtAaMFsFcYT
	PB0PnEJlIkWTdvqyWtszHUGfUYpoyDvkk4jYT65Z9NQKRommdSzSOM9r+8lp/tA7/eYVbL
	EK2B7Ua8U70R4mSjLlfBYUZ/KXdZuBto0KSc7ZMRGDWs7IoJi6NZUgn+ggElXA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:19 +0200
Subject: [PATCH v5 02/38] drm/blend: Get a rotation name from it's bitfield
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-2-854aa0840926@bootlin.com>
References: <20260627-vkms-all-config-v5-0-854aa0840926@bootlin.com>
In-Reply-To: <20260627-vkms-all-config-v5-0-854aa0840926@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, victoria@system76.com, 
 sebastian.wick@redhat.com, victoria@system76.com, airlied@gmail.com, 
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, llvm@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4088;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=F6c91uycHO4sbmoHLTpP20OekCyoqwScqtNxrwrFaJQ=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGo/Q9ygNRBu7unbMAVsZyP6+ktUTkJUdEtgeAK7vDgvAgzMb
 okCTwQAAQgAORYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJqP0PcGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMgAKCRAgrS7GWxAs4qpRD/wItq+9q91ODjrAgkGBLjyte6dw6f9MHI4Q43XXWdN
 5x8BmmSvhjuPyabFrR8f3JlOHD66ZGPOOb1Yn7T25FobO88OG8FTWm8arp2twMqbDjshi5IZiWe
 8D4xpr0e6R5+NCx+DJ/FEzeyJPLbiVi/vFVG6R+ajdEZXqc169zoU9litKxS2B8qOa6Zw3VJYg9
 qTBXCs9E/HRzjyRF8/KSeOEJJeiY8wFwbHEH2R6jXkZ1GTUgOBV4oqpsZiUAfa6Uo4+6fTU8g1P
 OGG6MNRLfXjR9dTB633JtZ7KnJTtJR7GNPo1KiNO+xx4ZaDcAolrTuyN/i3gFUfIHWYnOIaR6Sl
 vO+LNViSENG9ryXwIRegfbkbfcHtpMQMbdUeBE241sVtT/SU5aC2+vYegIJSGYFpEXAqPt6TzE0
 n7D0NZAd8hVADQH6au0LImDDwwuO1NnDN0Crcr2FSxEBakj/ULJGXicP9aIY20yfG3QnaSosfHy
 b9OI/X123RaTjMrJNS9OKqQhvEDMXqh+xNDsmXYFvCse9XnNMRSaq7IRPwKQriLVHErW/GbQzV/
 bq2aqqU/tJfa3x31k15BflrXiF58HwfOmiPJ8bPNH4tPLNXKBv12hj/t1VMETm6N4RKbLaJNyIL
 tSP7Xr0TX3wX88HTvm3OxcpStG5DifJdDaI+xDhpUCQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93768-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,google.com];
	FORGED_SENDER(0.00)[louis.chauvet@bootlin.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:jose.exposito89@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ojeda@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:luca.ceresoli@bootlin.com,m:kory.maincent@bootlin.com,m:victoria@system76.com,m:sebastian.wick@redhat.com,m:thomas.petazzoni@bootlin.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:louis.chauvet@bootlin.com,m:llvm@lists.linux.dev,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,m:joseexposito89@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bootlin.com,system76.com,redhat.com,gmail.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A52CD6D0DA3

Having the rotation/reflection name from its value can be useful for
debugging purpose. Extract the rotation property table and implement
drm_get_rotation_name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_blend.c | 35 ++++++++++++++++++++++++++---------
 include/drm/drm_blend.h     | 17 +++++++++++++++++
 2 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 2f0d1ba285be..eecdaf623c1e 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -256,6 +256,31 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_create_alpha_property);
 
+static const struct drm_prop_enum_list rotation_props[] = {
+	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
+	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
+	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
+	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
+	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
+	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
+};
+
+/**
+ * drm_get_rotation_name - Return the name of a rotation
+ * @rotation: The rotation mask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
+ *
+ * Returns: the name of the rotation type (unknown) if rotation is not
+ * a known rotation/reflection
+ */
+const char *drm_get_rotation_name(unsigned int rotation)
+{
+	if (rotation < ARRAY_SIZE(rotation_props))
+		return rotation_props[rotation].name;
+
+	return "(unknown)";
+}
+EXPORT_SYMBOL(drm_get_rotation_name);
+
 /**
  * drm_plane_create_rotation_property - create a new rotation property
  * @plane: drm plane
@@ -294,14 +319,6 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
 				       unsigned int rotation,
 				       unsigned int supported_rotations)
 {
-	static const struct drm_prop_enum_list props[] = {
-		{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
-		{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
-		{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
-		{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
-		{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
-		{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
-	};
 	struct drm_property *prop;
 
 	WARN_ON((supported_rotations & DRM_MODE_ROTATE_MASK) == 0);
@@ -309,7 +326,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
 	WARN_ON(rotation & ~supported_rotations);
 
 	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
-					   props, ARRAY_SIZE(props),
+					   rotation_props, ARRAY_SIZE(rotation_props),
 					   supported_rotations);
 	if (!prop)
 		return -ENOMEM;
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index bebbb77a8f21..33329170aafe 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -43,6 +43,23 @@ static inline bool drm_rotation_90_or_270(unsigned int rotation)
 
 #define DRM_BLEND_ALPHA_OPAQUE		0xffff
 
+const char *drm_get_rotation_name(unsigned int rotation);
+
+#define DRM_ROTATION_FMT "%s%s%s%s%s%s%s%s%s%s%s%s"
+#define DRM_ROTATION_FMT_ARGS(rot) \
+	(rot) & DRM_MODE_ROTATE_0  ? drm_get_rotation_name(0) : "", \
+	(rot) & DRM_MODE_ROTATE_0  ? " " : "", \
+	(rot) & DRM_MODE_ROTATE_90 ? drm_get_rotation_name(1) : "", \
+	(rot) & DRM_MODE_ROTATE_90 ? " " : "", \
+	(rot) & DRM_MODE_ROTATE_180 ? drm_get_rotation_name(2) : "", \
+	(rot) & DRM_MODE_ROTATE_180 ? " " : "", \
+	(rot) & DRM_MODE_ROTATE_270 ? drm_get_rotation_name(3) : "", \
+	(rot) & DRM_MODE_ROTATE_270 ? " " : "", \
+	(rot) & DRM_MODE_REFLECT_X ? drm_get_rotation_name(4) : "", \
+	(rot) & DRM_MODE_REFLECT_X ? " " : "", \
+	(rot) & DRM_MODE_REFLECT_Y ? drm_get_rotation_name(5) : "", \
+	(rot) & DRM_MODE_REFLECT_Y ? " " : ""
+
 int drm_plane_create_alpha_property(struct drm_plane *plane);
 int drm_plane_create_rotation_property(struct drm_plane *plane,
 				       unsigned int rotation,

-- 
2.54.0


