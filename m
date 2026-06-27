Return-Path: <linux-doc+bounces-93785-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DR+5EIlEP2q+QwkAu9opvQ
	(envelope-from <linux-doc+bounces-93785-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:33:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2D6D0EBA
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:33:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=U3DOTmap;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93785-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93785-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3E05303F94E
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 03:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3643733F8C1;
	Sat, 27 Jun 2026 03:31:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D6F33DED9
	for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 03:31:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531099; cv=none; b=EesRMh/2iB+hE6zVLq3vznphrDWeXlLGB20iSg+1Deucboo/+e3K9pm53WxL49Rxmj2OsGqUQhPz4jUplhBaWi47scikx2120ET3TtpZSOXkwDEeNdC45YRZdbJZeqYUNpy+fMVY+l51u75RVpCeTMb+XiKRVhdrI4jK0t6xMnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531099; c=relaxed/simple;
	bh=QxtkbLtOuqD/8Tr9XrtQOv7lZ9IVnfRDzZjEd1wrhR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rp2dV2tF5qBINTg0QbjroBIQ0HIzR3uQDbT3XpTAmHLu2kPSKQfZGUDj228WAr1MT6HLvlasiniCoKzuI8AEjyFeBsgZHNCFCN0eUUicFaVJHUHRt5pjY2tYFDfH2Qx2mg3pqhmyKgzXbIAxDD42eIecP4rgzFo3pS98VXoGZkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U3DOTmap; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4CAAE4E409F8;
	Sat, 27 Jun 2026 03:31:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EB5760233;
	Sat, 27 Jun 2026 03:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA4E7106F1175;
	Sat, 27 Jun 2026 05:31:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N6E5ww/MPyZisEPU9Lijrr/bZjYPcXQmEGjHBhPPG/k=;
	b=U3DOTmap7x5rAyWQ0bkMXMsvWxjuKGwhSSjgFbfiV2bW2xdS4qfdTcWGm4PYgSKHlTdLZ7
	BmVK2Ue8YOsW3j1GiI6sNtlPYId9II8iHvF2EzGq3nEYn5AAzADXfQpVZsAgv+hnfgG9OF
	AIjwDtqv9wVks4YDcO+0HrLnY4TDB9Eyhk2YRAhuP4GETQWYt3EOItUG76FPj40sT/97bI
	3VbIM9sibR2kJ13dDnclZk2BGuWsJawhrpf57dN7zOWykqoZSfe1qFnKicJ8pLw8TLvdAZ
	SPq07lQphEdFoi+nbpMMquxPuDKtfrt4qlEi+qAS9B+u9d8SSSnEdInlxI1e6g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:36 +0200
Subject: [PATCH v5 19/38] drm/vkms: Introduce configfs for plane color
 encoding
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-19-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6618;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QxtkbLtOuqD/8Tr9XrtQOv7lZ9IVnfRDzZjEd1wrhR8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PfxIU7vU/mxQGaEPtzGeOqN0taXxVWCGWdE
 hOte8ebSdaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOLXIQ/+NNl56DYvWjlElng/LAs1mIOF7jgZ5xw
 CTbm+oSkOmk+/BP0fHDt/bX8dE5jySdDQwtf9kkwMyXKfZmiwn1rgRtt8bR4fnCl3sOBEHWeOVB
 t5cgbbAKq3w2Tzn4m45FOOCo/Pq89SlHq3RVo2oGpgeRB3WWWojL/Mr+NOUXv9d/R8YDNojWSmd
 gvDHgzXvSbAW9ejJRW004BNWs0TQFQzHjhhz84UVmP3f1zrsNDNWPKvWRx/839s75fQFH5Xv1mP
 GxbsIWRZ9HpoOBiJjDPfHYTMLn9ec9wrWQnh+9vK/HylJN1F+VAi257MsYNudHrLh9XSIHyg2WE
 QiKcWjvAt4TzdSf3PrV8Birmu1sR/GPSaRoHC2EwEr3WXZEP4NGBMovEQrUL6tombS3Yo8xKHBz
 LhG6X18BMRogAMc6JNw8LTsYCloIQfHuswk7GapUflyChACUB0XPLOHwPoZdXQ9cok5Cyfg8p6l
 5U7p/3JJD69mQZV4jPkPRW+hwYfv35FQrcQw/Zm6CY0F3S6Q8fdM0zol70rOQALfcuPku1xw6yE
 69UB2Mc7n1+QEXbrVCp55NbpYhhV4hQV9bsd07iUQTZWaQoK079u+9z1XBeKMarbJJppgZH87Yd
 /RgCuBIuks8tAPnCND1pqbQHhaeM3sLyWlkXORe2rYJ76wqbNWZA=
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
	TAGGED_FROM(0.00)[bounces-93785-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lists.freedesktop.org:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDF2D6D0EBA

To allows the userspace to test many hardware configuration, introduce a
new interface to configure the available color encoding per planes. VKMS
supports multiple color encoding, so the userspace can choose any
combination.

The supported color encoding are configured by writing a color encoding
bitmask to the file `supported_color_encoding` and the default color
encoding is chosen by writing a color encoding bitmask to
`default_color_encoding`.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 14 +++++
 Documentation/gpu/vkms.rst              |  8 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 92 +++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 7820da8505ef..a9ee05fe0c66 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -118,6 +118,20 @@ Description:
 	Default rotation presented to userspace, same values as
 	possible_rotations.
 
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_color_encodings
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Available color encodings for the plane, as a bitmask:
+	0x01 - YCBCR_BT601, 0x02 - YCBCR_BT709, 0x04 - YCBCR_BT2020.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/default_color_encoding
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Default color encoding presented to userspace, same
+	values as supported_color_encoding.
+
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 610305483716..7206cd2b231a 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 3 configurable attributes:
+Planes have 5 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -96,6 +96,12 @@ Planes have 3 configurable attributes:
   (same values as those exposed by the "rotation" property of a plane)
 - default_rotation: Default rotation presented to the userspace, same values as
   supported_rotations.
+- supported_color_encodings: Available encodings for a plane, as a bitmask:
+  0x01 YCBCR_BT601, 0x02 YCBCR_BT709, 0x04 YCBCR_BT2020 (same values as those exposed
+  by the COLOR_ENCODING property of a plane). If set, supported_color_range
+  must be set too.
+- default_color_encoding: Default color encoding presented to the userspace, same
+  values as supported_color_encodings
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 47b3a4aeee8d..c1d1841b2c5a 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -9,6 +9,14 @@
 #include "vkms_configfs.h"
 #include "vkms_connector.h"
 
+/**
+ * VKMS_SUPPORTED_COLOR_ENCODINGS - Bitmask of all supported color encodings in VKMS
+ */
+#define VKMS_SUPPORTED_COLOR_ENCODINGS (	\
+	BIT(DRM_COLOR_YCBCR_BT601) |		\
+	BIT(DRM_COLOR_YCBCR_BT709) |		\
+	BIT(DRM_COLOR_YCBCR_BT2020))
+
 /* To avoid registering configfs more than once or unregistering on error */
 static bool is_configfs_registered;
 
@@ -402,14 +410,98 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_color_encodings_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	unsigned int supported_color_encodings;
+
+	scoped_guard(mutex, &plane->dev->lock)
+		supported_color_encodings = vkms_config_plane_get_supported_color_encodings(plane->config);
+
+	return sprintf(page, "%u", supported_color_encodings);
+}
+
+static ssize_t plane_supported_color_encodings_store(struct config_item *item,
+						     const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~(VKMS_SUPPORTED_COLOR_ENCODINGS))
+		return -EINVAL;
+	/* Should at least provide one color encoding */
+	if ((val & (VKMS_SUPPORTED_COLOR_ENCODINGS)) == 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_supported_color_encodings(plane->config, val);
+	}
+
+	return count;
+}
+
+static ssize_t plane_default_color_encoding_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane = plane = plane_item_to_vkms_configfs_plane(item);
+	unsigned int default_color_encoding;
+
+	scoped_guard(mutex, &plane->dev->lock)
+		default_color_encoding = BIT(vkms_config_plane_get_default_color_encoding(plane->config));
+
+	return sprintf(page, "%u", default_color_encoding);
+}
+
+static ssize_t plane_default_color_encoding_store(struct config_item *item,
+						  const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~VKMS_SUPPORTED_COLOR_ENCODINGS)
+		return -EINVAL;
+
+	/* Ensure val is a single bit set */
+	if (!is_power_of_2(val))
+		return -EINVAL;
+
+	/* Convert bit position to the proper enum value */
+	val = __ffs(val) + DRM_COLOR_YCBCR_BT601;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_default_color_encoding(plane->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
+CONFIGFS_ATTR(plane_, supported_color_encodings);
+CONFIGFS_ATTR(plane_, default_color_encoding);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
 	&plane_attr_supported_rotations,
 	&plane_attr_default_rotation,
+	&plane_attr_supported_color_encodings,
+	&plane_attr_default_color_encoding,
 	NULL,
 };
 

-- 
2.54.0


