Return-Path: <linux-doc+bounces-93782-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K280KWhEP2qwQwkAu9opvQ
	(envelope-from <linux-doc+bounces-93782-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:32:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBAA6D0E92
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:32:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=etS9hEFo;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93782-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93782-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9017C3036AC3
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 03:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419A830C632;
	Sat, 27 Jun 2026 03:31:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A333067F;
	Sat, 27 Jun 2026 03:31:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531092; cv=none; b=Szpcbc6rJ9KIr3b922tx85itkAARGbiO9bYOP6OAsArIHy7AD6w52kV+fXBr/OnEdLtGjOaEP6xqBJ+JXNLBS4I//hghLCF//55vY7z+a8P8neDG+1atMKZ0RDNCBXBVIsFlQuuL0bs0ngEFJaG1nv7iJVcvxUkOYkItR/HiZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531092; c=relaxed/simple;
	bh=mRSqoUGmy2p732uiUceNdBnrTLFMu66qquxwXRZoWz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YyIDiUq19dIjxNOAer+L6Nd2lPtNr3wFf2tmMbxnOBhIwnkrW02dEkqu9HIS/SPfamIg0aPCxOVcVvphaz+SVdXHEGnuvb1xzTkGQLvY301NEGvmxR3N/tq9+Rt2P6J7CVShlpPPIqQ3ruGGaEdN4cG0Z8iklm1+W3N+8mXNhsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=etS9hEFo; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E59FAC5CD7D;
	Sat, 27 Jun 2026 03:31:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D536F60233;
	Sat, 27 Jun 2026 03:31:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D491106F1167;
	Sat, 27 Jun 2026 05:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cW7Vp+Ww0BHKeSJTjS4TB9rMtbkv5BfsUgPd2jn2qL4=;
	b=etS9hEFo8FXg8crsFqFPG5PHd2LHyzwxfAEuX+xDrIJlTwkrtJ42bKNk1OKPHF+bp52j6s
	SGEHufuYaNrmJVBYM7fk35RrMZD7OU9vyiqqWbTeEDOY4hmsZAB5QJzB3RQ6ZwXVFnCSlf
	pfz0eC63UDmiv2Ai0/YqJ4EbcGHqRhdp5vpSvh97oXc/3MeJYVhqBIFhcuDB8yLRmQgIO0
	AG9UUHSq7pNRQurkOVbTSizVqfvcBkNtrzaTFn71mylkK8ndFVrSz4UoLB5br26BGCmS/w
	BTCZYUgGJgHvA/XkZZgVH9iwX1Qir4nqwo6QA3SPLbiTxHP3pGZ+oHPjD6r68g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:33 +0200
Subject: [PATCH v5 16/38] drm/vkms: Use DRM_ROTATION_FMT macros for
 rotation display
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-16-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mRSqoUGmy2p732uiUceNdBnrTLFMu66qquxwXRZoWz0=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0Pea+CRmukZQmcQ579p36VF8zMX6xh0xQoML
 vWGaM9sWGuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOI4jw/8Ccevri0r8ORDusswYP69rhtCM5CPILO
 N/72cm0g319PruVZOoTj/1NiRlE7c/4nIKqtJLN4mFFB8I3VNvVglR0agy5U4N+77Z0qTbiJchO
 nNXmQtTGbIC9uAXiEnGshf6DtnimHaZcVyRo5sTMVpt7EioXg+h57nNS3uMG/MMSUFEqkJBW0r1
 cqZFmm/qCRY25TBdR3D+HHogxA3NKUqt+OAsrXmX8aTsXPOJCwMV88HNJrL92iIwznha4D+T5vZ
 WAQMfYQecIrmacsPFhBkitUlwJIF+xGLWtrbRE8b8MSn7RL/9FoKqiuUrmME3IJljJVeRDA3jRL
 QYKw68nyHXzIohljol3xkW0f8SY8sk6vtcVxcniShPB91lvO9/0noiLDAqhPy4FhYB1dzKXBjVw
 eS8BDEEBeJ+2MZ4ARoZ3aD90qhq9ScevwUdJyEgU9V49sCtxNwWy5l4QOJzTkry06ebr3kC2sAy
 PxIcYFeWd/M+XSU2jHuF/q0zo88M+vNY9PAnUWkVkukRjH2EWxk6Sx78VfZyqxbn4rjoC/U0pgR
 RDM6qQEdGrytpla1fEOfearZc8opA5NfQwsfcFtnPM0LNxiVQPQvr0WkSGuI1y3fESuCHCsQLog
 wn9U8pPQrzxR9hrfvtijY7cJfCxK5izPG2Sqdb+JZCIHhNPjKZYg=
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
	TAGGED_FROM(0.00)[bounces-93782-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CBAA6D0E92

Replace show_bitfield calls for rotation/reflection with the new
DRM_ROTATION_FMT / DRM_ROTATION_FMT_ARGS macros for cleaner code.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 5c86eb24fedf..ca3ee3aa2c41 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -3,6 +3,7 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 
+#include <drm/drm_blend.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_print.h>
@@ -393,6 +394,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_printf(m, "\tname=%s\n",
 			   vkms_config_plane_get_name(plane_cfg) ?
 			   vkms_config_plane_get_name(plane_cfg) : "(null)");
+		seq_printf(m, "\tsupported rotations=" DRM_ROTATION_FMT "\n",
+			   DRM_ROTATION_FMT_ARGS(vkms_config_plane_get_supported_rotations(plane_cfg)));
+		seq_printf(m, "\tdefault rotation=" DRM_ROTATION_FMT "\n",
+			   DRM_ROTATION_FMT_ARGS(vkms_config_plane_get_default_rotation(plane_cfg)));
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {

-- 
2.54.0


