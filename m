Return-Path: <linux-doc+bounces-64903-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A9C1B004
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 14:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F23DA5A6566
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 13:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2CD345CAD;
	Wed, 29 Oct 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J9SuWYbC"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654D73446BC
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744650; cv=none; b=BO2KNNc3+/zbMJZwNnG4kyMW8cCOxaf3SwXjNcxVQANQZKx8S61Nb9xPhaPyUABbEbDootWrKYYV6dgQN+HUlNhI16SEZGCP7EsdQSvaXG48H2dWBqUI1p4uUdodAc4/m1ji0iZYCFxW4eCR3C99Q7LtCz+e9VWkm/wi0dhMzjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744650; c=relaxed/simple;
	bh=kRHIbdbfnhVWw5i8K9kmqCMqIgSkq6c1b5MfkOrcekc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0Z4jROB1mwTF4FBz/u77Yv17TZD5T72F7AKwYCbISWqmfNZAmMSqWxNzyv1qIuL9eagxc457dYKJ2ITuXiaMZyWXZWA7DqSDfadP5X5XPDXwF1EeTSViQyXLvmDDk2I8jQy2Dvw62+QxnGf0koXGf9cHvCMHmi3z2blgswiASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J9SuWYbC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E09D41A1747;
	Wed, 29 Oct 2025 13:30:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6CE9606E8;
	Wed, 29 Oct 2025 13:30:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82E11117F80A2;
	Wed, 29 Oct 2025 14:30:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761744644; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lzv0r4HbW8ZPDlxxuNQc4DxHoOKfZX5QaG27pmKoI4k=;
	b=J9SuWYbCDfkuKUyM1KhZvr8jO8fSys1Ld/nGBbhDfz2+n9zRB4dKflK/kD7sBTb7K17/Fx
	YxYVDA2bIYONarVN1dwRGZtAHo2qPk/PPpOf3E5lquEpNPDGdBMFRkmea3h1wHXAJW6c+M
	QNSh1+T/vXYZB5HjXwsICm8U095MXr2pjZ9NHMp0AXVgfC1r0zrYtuMaVGuJXxDqoTbUZ0
	mDXJDFlH1gCx9M07Qc6blxGlGMEdNE7A/W6jq7jN5cspnIxLyjpb4S6OuU7Gxx1wh4ZxiB
	nCWWbN7n0B7tmM4PkPSe+o9KdkYsUqS+//YxAbVEuVJ8pW5XReztbw5YnhB/+w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 14:30:22 +0100
Subject: [PATCH v2 12/32] drm/vkms: Introduce configfs for plane color
 encoding
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-12-be20b9bf146e@bootlin.com>
References: <20251029-vkms-all-config-v2-0-be20b9bf146e@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-be20b9bf146e@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5578;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=kRHIbdbfnhVWw5i8K9kmqCMqIgSkq6c1b5MfkOrcekc=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAhbq6dPIKPQC1u+XPhmpbq22jb90+94b0IVxQ
 TNlx8lgkdGJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQIW6gAKCRAgrS7GWxAs
 4v4MD/9hRkM4jGPJ0wHcTHYF2Un73zUgv4H4IqRKs3KVb1mEeZhFvCL2StTsbUA+DdlpqQPN4ad
 1+RlBll9GRKTXomk5MEY3N5fchsEVERQmk9JvIHhsLfs93dHHlvlGv9PSt7AA15Bm4O+mm06CGT
 ReMhWWuqQoYZBRf/8rdAwq5OfX/EiJyeUwTzOnZfJLK3L3gF6iWwRBfXX31YdCsBCA2DzUIwjLF
 Eie38uSgo5DsM67uukW3jqD3yH8/nVK0GFdFlO5J68UTdKydkZ62vgO/IfM2Po+tU787QBx30Wn
 lMkj+fdyODxU2A6buEqwZjRmbbOIx2EiNMtJJWpc0igWU9Bufvgh+06/f0IMsBX/WOpQSaHnNsT
 bQr50vKjAq8egjxrntIhPD76U2WVWDiJX4HgDz6Bp45i6PJhAf3IxOCCNiu4jMDa0pZYtfswqEW
 vuqkL7kKwyVxVEDRk7fDc+0kxUkNHVu2FjDFWSri51R+CIKzZQ6JMLDsZMXRTx4AXj6BA3hFVuE
 Wpzz26Fy/kyOCi/F5zWmog3IVJLQ6mamK+vHW9r66qer3PRmXZxIuhPlgGxYTWXA3mQZK5DLDm6
 NRq2irlzzdbAEQj1qTTlP7yGDit3l0GXQYxslvu6FA3WGVc6RhLa+GLo6Yrhjf2yL4oC6Oy7Eun
 RBndah3f/RDFBGw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

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
 Documentation/gpu/vkms.rst           |  7 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 98 ++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index eac1a942d6c4..dab6811687a2 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 4 configurable attributes:
+Planes have 6 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -97,6 +97,11 @@ Planes have 4 configurable attributes:
   (same values as those exposed by the "rotation" property of a plane)
 - default_rotation: Default rotation presented to the userspace, same values as
   possible_rotations.
+- supported_color_encoding: Available encoding for a plane, as a bitmask:
+  0x01 YCBCR_BT601, 0x02: YCBCR_BT709, 0x04 YCBCR_BT2020 (same values as those exposed
+  by the COLOR_ENCODING property of a plane)
+- default_color_encoding: Default color encoding presented to the userspace, same
+  values as supported_color_encoding
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 7cc8ba315ef0..ee2e8d141f9e 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -439,16 +439,114 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_color_encodings_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int supported_color_encoding;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		supported_color_encoding = vkms_config_plane_get_supported_color_encodings(plane->config);
+	}
+
+	return sprintf(page, "%u", supported_color_encoding);
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
+	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020)))
+		return -EINVAL;
+	/* Should at least provide one color range */
+	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		/* Ensures that the default rotation is included in supported rotation */
+		if (plane->dev->enabled)
+			return -EINVAL;
+
+		vkms_config_plane_set_supported_color_encodings(plane->config, val);
+	}
+
+	return count;
+}
+
+/* Plane default_color_encoding : vkms/<device>/planes/<plane>/default_color_encoding */
+
+static ssize_t plane_default_color_encoding_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int default_color_encoding;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		default_color_encoding = vkms_config_plane_get_default_color_encoding(plane->config);
+	}
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
+	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020)))
+		return -EINVAL;
+	/* Should at least provide one color range */
+	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		/* Ensures that the default rotation is included in supported rotation */
+		if (plane->dev->enabled)
+			return -EINVAL;
+
+		vkms_config_plane_set_default_color_encoding(plane->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, name);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
+CONFIGFS_ATTR(plane_, supported_color_encodings);
+CONFIGFS_ATTR(plane_, default_color_encoding);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
 	&plane_attr_name,
 	&plane_attr_supported_rotations,
 	&plane_attr_default_rotation,
+	&plane_attr_supported_color_encodings,
+	&plane_attr_default_color_encoding,
 	NULL,
 };
 

-- 
2.51.0


