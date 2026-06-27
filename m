Return-Path: <linux-doc+bounces-93795-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fB6tC+dEP2rkQwkAu9opvQ
	(envelope-from <linux-doc+bounces-93795-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:35:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F306D0EF7
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:35:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=ALiIgn+L;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93795-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93795-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6100304D581
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 03:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9BA35C1AD;
	Sat, 27 Jun 2026 03:32:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915A8329C60
	for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 03:32:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531123; cv=none; b=SjxjawwSCN84LOltOj9KiI7l8R2ZcuyM2FNg00XFmJKHU1s2M9oeDMXcOTHoV0us6SppchyIVDcpd1RDQCc3DPwtjU1PgdTU6mkw8/slLKMIpTLuasVNFoWSbebfehsNc1qQFKHgEDoDRgKQ4NyO6TjQyYjJguz0bWbnd3lp1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531123; c=relaxed/simple;
	bh=UXwwGxaBOqBDjeeLTM/UljPXbDdhrzGfo5KlNYNKbdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0RfyIXGbl7/XsJ/Vyqm2nB/vpJndKG4XSqNE67Goz/YQ8stv6HTpK28xdB4LUx0Nf0j8Q7rktEbjC5DqFioN6RgCSX9Ca5zh2kXEmdIYod13qOPSX2yOLD5Sp9giQiUgocDNyuIEUI/SZDfwENT3AClDZ/id8hAl1q44UPBawc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ALiIgn+L; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6DB284E40A01;
	Sat, 27 Jun 2026 03:32:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AFED60233;
	Sat, 27 Jun 2026 03:32:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9DB7106F1167;
	Sat, 27 Jun 2026 05:31:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rug1DyPN2ppPnE9qR5l8NP+bC1fynXftShzG6bvk3xI=;
	b=ALiIgn+LBYqbYewgzYRXkIRWZdhsBjo1JmjcSueIB63zf4rDNL9B21bGeSkfk/jtHBsofy
	gIdHlNm2ey69z+T9e5p7LCMYxoNxHxpC/N7p6T9eA/+eGhKIEj66vwW0Qd5O1GnFN6afv+
	KcXAbNXHkIk4a1/AOBj1bUpPL1GK8M813ewwMYzMKqv78be2KARFgcAqX9hktCUeu5KmTl
	sjhLHyNxoMsdC1Mzi1PyD9/eU/B3y3y6qOOhUjQYk6vIO/EMD0LDG4m2UjUtKUHC/0D4vX
	FXncY7bF0tXRJCvEWEuUZmLpt45JxhVlh5ei1xKOUtKJW2JnMviiQcWOe8qQBQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:46 +0200
Subject: [PATCH v5 29/38] drm/vkms: Rename vkms_connector_init to
 vkms_connector_init_static
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-29-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2726;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=UXwwGxaBOqBDjeeLTM/UljPXbDdhrzGfo5KlNYNKbdc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PgPMMcK+cjeRP+LQGEicYUQDYRt+NwQvytV
 Dv6MX1raFmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D4BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOKICw/+MoqyL0CGc6vBSquo6Awmgm944Rt2lvP
 yWHt1M/hlVUe2QY7Xl62jIV8AfppEJWuL+A8xgIoHkcE/NQIRjHCVOppBQ8I34QKNdPe9eHREos
 2DGInlS+rZiG1Q0Ynfqcja6CF3OA7lcwMuVlfxkcYG59OAhdXgngi0Gz8jBF5i5C73eWo7HuObv
 rxNIeGYyYVHcmft2TJk958ovvQ6QbJpNLhQ+21smhgWGJ7U1w/uV4Bz+vfWklsdMzz8q9IJbhgm
 g84t7K2wOcwtZn/nURleLElmaddygf8cxT2Xr4rszgLn9MmMjNZpGV5KfspMttMLqCDIAwefCtN
 FjHPjzB6SSmeLoBNHjYvUmOAJaOE64RHfcnIpqTzvz1bxvt723CZjJRXx5SlSbgWGXdHAxQtxMf
 11LYw7nKHn+ZCv3McE3d+RTKZs3rU+y7wHlPpVYIl2KTnSgsuqNqhjFIhVprS/tKhFd7eyZ/6XZ
 q53h9N2SQ6M82bFnGcoqwaBwzUhPIJ+/+7zAzGtsVzFyOlvYPyJqw0aODXAGGZKRQ1Hoxqos79D
 Jb/jqD9/8TELDgLFn5LSnpVZfjPSv5Lq10NC5HqR+N9D9WNWFu1EyHBI3TcmyfIUfOqQph8nnDU
 zXZCAw4HnoyqiuznsyzKBK7bZrXDNNso/yMbjVNdBX154CJ1dkgk=
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
	TAGGED_FROM(0.00)[bounces-93795-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: F1F306D0EF7

With the introduction of dynamic connectors we will have two way of
initializing a VKMS connector. Rename the current function to clarify
the case.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 4 ++--
 drivers/gpu/drm/vkms/vkms_connector.h | 6 +++---
 drivers/gpu/drm/vkms/vkms_output.c    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 5a87dc2d4c63..5b29dcade7e1 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -68,8 +68,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.best_encoder = vkms_conn_best_encoder,
 };
 
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
-					   struct vkms_config_connector *connector_cfg)
+struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
+						  struct vkms_config_connector *connector_cfg)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index 33253d29b1cc..85f9082c710e 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -19,14 +19,14 @@ struct vkms_connector {
 };
 
 /**
- * vkms_connector_init() - Initialize a connector
+ * vkms_connector_init_static() - Initialize a connector
  * @vkmsdev: VKMS device containing the connector
  *
  * Returns:
  * The connector or an error on failure.
  */
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
-					   struct vkms_config_connector *connector_cfg);
+struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
+						  struct vkms_config_connector *connector_cfg);
 
 /**
  * vkms_trigger_connector_hotplug() - Update the device's connectors status
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 1288c8551bc8..406a22f1b963 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -97,7 +97,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		struct vkms_config_encoder *possible_encoder;
 		unsigned long idx = 0;
 
-		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
+		connector_cfg->connector = vkms_connector_init_static(vkmsdev, connector_cfg);
 		if (IS_ERR(connector_cfg->connector)) {
 			DRM_ERROR("Failed to init connector\n");
 			return PTR_ERR(connector_cfg->connector);

-- 
2.54.0


