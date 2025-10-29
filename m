Return-Path: <linux-doc+bounces-64897-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9EFC1ABB1
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 14:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 37972347503
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 13:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964D03358AF;
	Wed, 29 Oct 2025 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YeOgGv7u"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF533B6C6
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744639; cv=none; b=dTNLCexOeYovU1Kj5bt/KOsWgimvyE/jsyzenPzqX+nMhswwtaA1LFmebYPRfWCzox4chZpUre/xiwGESAReWDvUJs2QVI/+Xbsh8ko0JnlZtkSBNkFrRWppe+djY4oNJdQMZstthBwM/iKjBuYC40/PeMFoXI4jQiKB7t6cHoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744639; c=relaxed/simple;
	bh=e8ElyHXcVk0AWYJ7dGjNKx8CrM9WhxXKeDzUlhTH99U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rpJDPaJZ9iyNXQtATZtiyk1+gP2+grmZb0Ht0yXq7+sNAV9OjGhGe44o3+x3tYZ46drcQGc1dBXfMJQcH3sy/GBA3La4yx98gbIQpUobx8yfMP1llFMuUUbVVpxVhMBg0uLuJF3Zzsy2W6rMhelFsFQS0HhT51VHtilSWf41eYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YeOgGv7u; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CADFB4E413CE;
	Wed, 29 Oct 2025 13:30:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A165E606E8;
	Wed, 29 Oct 2025 13:30:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E305117F809A;
	Wed, 29 Oct 2025 14:30:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761744634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fs9ni9DRQ5vnDzOwoZttmqZ202xPMAoGkKss/mz8Bp4=;
	b=YeOgGv7u62i6IHv75jQrEqeZOcaQ2KAGt5yEvKhhYAGSAM/PlZjA1SjfIjZ9uatkBZBkHQ
	KKU3AM6SnnAkkQywvUHj7qF6UstBipPgRHNPFKkWh55v4PDM/NuUIm4pcpUe6Iu4s5MNZO
	zxPQ8WIaHSPfynw8y6Jhpe45gc5FarKyg/Pc1GTYvh9XSlyZuxgw/FJsb+j717KQR/WJLF
	gc2lhmGECh/xxHgTWRdvTookjyLo5aNMes7rcLAWDb9+sYXcguJo2S/5hHkzJFCB6ERj/z
	A6ZLIqkRUMaL5eReGraJHCbHmhPLgbMkGsZOMSJWX5P6608WmHk3vusBDjUyXA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 14:30:16 +0100
Subject: [PATCH v2 06/32] drm/vkms: Introduce configfs for plane name
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-6-be20b9bf146e@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2206;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=e8ElyHXcVk0AWYJ7dGjNKx8CrM9WhxXKeDzUlhTH99U=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAhbq15OoDz92mgX8JMHTEsCZmO0xWYXS2X01h
 jGzxdK2qPuJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQIW6gAKCRAgrS7GWxAs
 4hk9D/4/xFfTKKNu+LjBdoFMtoqtHavnG3bt5jownuu/g8cgVPIxlTrsOBL3jfly8Hnv3R2EMow
 05cgJTajRO7VE4BU1JYOFme1MNgtes66tNHq4qjGepFC87IPsHEFCMeSM5KmHfB213Nsb46W+m4
 Q66kW697gxKHw3AqyONY/rXiJbeRVujPevjbryEsieoyiJqfdI4I2lZknbcE59foOjwYGJGqe8V
 833ZkvskOf/zlxfqZYsMWLoXLunMbdyWCHuxYmkpQrArza0nh3cKkd3pOdvyKr1S+hIaImXGk8Q
 nO4QRRETXZKmK9MixUK5PH9cDvDICb3MKOuJ2M/Kba0RQJK4uBOBWC0GE9sAAH62p6qGXimJjeC
 ocujXz/FlVYGI1I8o+LA5DgsDWC5DeBZV0Vw3rX4jk94+NzMK11cYy4+MHw7k6ROXEx9iTt6oVB
 u1kFHRENCU8elYRg7nXNOkK925iHiSsTRZSwccjqqizlr/V5GYJONV3kL/RKkyYHqKcJROK5qLU
 Mh3PdBbxQvUDWRff1vmaNuSYieZfacNBZAvkfCkRSp6XONH/OFKpx1DBxpm6nl0E9DvruYYhT0I
 GpXqf27qND0Il6eHXpY51tjXrbmqWYztIEJO23JN19f/ixMOTt22oeXwFwQ8rOWLJ3bRCe7q7jW
 rpP2UbhDKuF0R2Q==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Planes can have name, create a plane attribute to configure it. Currently
plane name is mainly used in logs.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst           |  3 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 3574e01b928d..1fe6e420c963 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,10 +87,11 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 1 configurable attribute:
+Planes have 2 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
+- name: Name of the plane
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 07ab794e1052..be6c3ba998b9 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -322,10 +322,42 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
 	return (ssize_t)count;
 }
 
+static ssize_t plane_name_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	const char *name;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		name = vkms_config_plane_get_name(plane->config);
+
+	return sprintf(page, "%s\n", name);
+}
+
+static ssize_t plane_name_store(struct config_item *item, const char *page,
+				size_t count)
+{
+	struct vkms_configfs_plane *plane;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_name(plane->config, page);
+	}
+
+	return (ssize_t)count;
+}
+
 CONFIGFS_ATTR(plane_, type);
+CONFIGFS_ATTR(plane_, name);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
+	&plane_attr_name,
 	NULL,
 };
 

-- 
2.51.0


