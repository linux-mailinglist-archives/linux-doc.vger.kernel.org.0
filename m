Return-Path: <linux-doc+bounces-84201-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCYPBYL86Gl/SgIAu9opvQ
	(envelope-from <linux-doc+bounces-84201-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 18:51:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDFE448EC7
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 18:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D672630275BB
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 16:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60093921DF;
	Wed, 22 Apr 2026 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nQSb66N4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C46E391E7A;
	Wed, 22 Apr 2026 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876572; cv=none; b=C7kDQBEgPr3NBHjl2qJWUUazzudEh3NrncAKI4LxlEF3DkNDtB1uOgH1isOkZHA1WrqD/KLrNQdg/NsigkOlRsJdHTg4q5tJo5vjDGmonyhBmbZFYO4ArXcFJF1biB1NGvK7tMTHWfDTZRVE1ImdHMc9hxb+jNnMSABAp/z+rcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876572; c=relaxed/simple;
	bh=QO0nEXY/Tj++iw3gsik4BGsKzA3Cny6MJRnxH8diHUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ii4KVVGdi1zZNY6DvlekdY35q9v4wrD23iDq78chZpjGNB0AswmYJLFtkPJxWOSfcNJD0mUwzzxhOQH+6BlCi5Mdaf+MWozFvEOeZCikmmGLux6M6PiuQhpuZMc2uq3SOPZndYOSvXss6vHxSBrYokqvv1cZEpwAaa3OqWQW9/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nQSb66N4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 18BE94E42AC1;
	Wed, 22 Apr 2026 16:49:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E21555FA8F;
	Wed, 22 Apr 2026 16:49:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE8FE10460C0F;
	Wed, 22 Apr 2026 18:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Cf/yDmKERYEBYLSU12www5JrTpnxj8TOnehYNlnRnf8=;
	b=nQSb66N4EFzkRkpxAW2F9wtjBhq6QoBRRoa/1jZitp7bZnW9cZFBykS+vui9R80lG2nfWs
	iIDC9j6Tp9KUgFzXMfECWNwaoBnZleTKL2eSt9wPMVQpRI57LcUmRWj4YqnlRnzB3N+fMv
	LEz25ieZC5y9Kf0eKpFDhpiDVtgffHbMIV+YPXxTPYRyavwc6b0T8MZuJTXDJLB71+6R+X
	cowrBTLVEEq/wWzEJokyjvFU85xYIJJOYPRhgFTGS7Ub1faaSnZohGShWapRQm1lTE/a4Y
	TBORHnBZyf5GaQDPDAc1aYJVYdXxjxlB+aj5oN6iQHbcxLmaSFw/s1Z0PrTq/g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:48:11 +0200
Subject: [PATCH v4 14/37] drm/vkms: Introduce configfs for plane name
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-vkms-all-config-v4-14-dbb52e9aadc3@bootlin.com>
References: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
In-Reply-To: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.16-dev
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84201-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,google.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[system76.com,redhat.com,gmail.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 9CDFE448EC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Planes can have name, create a plane attribute to configure it. Currently
plane name is mainly used in logs.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms |  6 ++++
 Documentation/gpu/vkms.rst              |  3 +-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 62 +++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index a1a3e186e50a..642d0dad8cca 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -103,6 +103,12 @@ Description:
 	Plane type. Possible values: 0 - overlay, 1 - primary,
 	2 - cursor.
 
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/name
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Name of the plane.
+
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 1e79e62a6bc4..79f1185d8645 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,10 +87,11 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 1 configurable attribute:
+Planes have 2 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
+- name: Name of the plane. Allowed characters are [A-Za-z1-9_-]
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 97f87a53d202..e8d5792b0873 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -324,10 +324,72 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
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
+	if (name)
+		return sysfs_emit(page, "%s\n", name);
+
+	return sysfs_emit(page, "\n");
+}
+
+static ssize_t plane_name_store(struct config_item *item, const char *page,
+				size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	char name_tmp[PAGE_SIZE];
+	size_t str_len;
+	int ret;
+
+	memcpy(name_tmp, page, PAGE_SIZE);
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	// strspn is not lenght-protected, ensure that page is a null-terminated string.
+	str_len = strnlen(name_tmp, count);
+	if (str_len > count)
+		return -EINVAL;
+
+	if (count > 0) {
+		size_t expected_count = count;
+
+		if (name_tmp[count-1] == '\n') {
+			expected_count = count - 1;
+			name_tmp[count-1] = '\0';
+		}
+
+		if (strspn(name_tmp,
+			   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-")
+		    != expected_count)
+			return -EINVAL;
+	}
+
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_plane_set_name(plane->config, name_tmp);
+		if (ret)
+			return ret;
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
2.54.0


