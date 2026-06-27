Return-Path: <linux-doc+bounces-93777-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a7zJCUJEP2qTQwkAu9opvQ
	(envelope-from <linux-doc+bounces-93777-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:32:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C09656D0E33
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:32:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="nK/TaRkR";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93777-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93777-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E21C33024974
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 03:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EE0318139;
	Sat, 27 Jun 2026 03:31:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B01ACED5;
	Sat, 27 Jun 2026 03:31:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531079; cv=none; b=qqQs75fpWnrZ2NIiEZWU79IgoggEso0qGK7SsDgnUAYb+ekHHiHlupN+IvbVqcq1b4lYxVY0nRi9tvQBv3+A8NDqhe8qR2P0RagyRya433xELysP3WouWpyUVjiMRsiWLDgJ7w5HLMJoOVpJGusBX51EbyeRVwGickd2q7/5u4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531079; c=relaxed/simple;
	bh=IPPO/N5KzxecIhN7sCv6ZygxjxmYOy9rXkt7EwU9Nd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNCGgblsj5XEtE+BdYvXBcqYF8RaBOh3jzcOh5ZmGQjXrGmTK94PLxvE+yNbRkMPXfO3b0yICK/VyBwvIOHqalnR2I/vvH6nLPS7/Vu+LixNUFtw9ct2TJ6l7UfmSSQf3+zW88FQ5zvGnnLaYVC5ri8ooeKDQUC/l6cjMMVtbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nK/TaRkR; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4616CC5CD79;
	Sat, 27 Jun 2026 03:31:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3328460233;
	Sat, 27 Jun 2026 03:31:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 544C4106F1171;
	Sat, 27 Jun 2026 05:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ny8jovS05Cy6acIMNd4HSb4i/Bq9Nh8qF6KY1lLItU0=;
	b=nK/TaRkRBR4iHTyxBMNWCYJ4T4wYBJiZ6oxhWaqyKa+JsJzKvUlCxHRT0H3GtDaI+8qsy1
	Gq4W52Myn/x1C0cxsE8x+Eyu1dpzs7hOlB9bSBso9seiIeJSMDExKTkzjw3yz/ct5kFYsE
	nYwX+dHMymwqHwHdJgG0kenPmwlwTcYgrVIJNw6HWaLV/qMxbdfdbNUOqoKhVnqnwWQ0mG
	4ieZlcpNmIc6bi6Too946ntl3dO18rdMpal6CYpDjMuLeTQI8SnoeH5tt7Dcd03rTSaFd5
	gFcVI29aKYtsOwbRK1dxjRwX0O72FZdirw8uWrGj+LdE1WfyE3apNryDlHnRyw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:28 +0200
Subject: [PATCH v5 11/38] drm/vkms: Use enabled/disabled instead of 1/0 for
 debug
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-vkms-all-config-v5-11-854aa0840926@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, llvm@lists.linux.dev, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=IPPO/N5KzxecIhN7sCv6ZygxjxmYOy9rXkt7EwU9Nd0=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PeYbFNR/zDAOgcy6qf+LVqKQj2Ych5s1YSA
 J+rWbfD3K6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJGjA//flEtStMdS9irHvAdw1FQN5JOQrLHfIe
 Yd7Y+jYRXU2QrzjWnFQrnuaIWI6EY3GKaP6mZ4eYfkgpkTGD/GFZRUpEKoQSSg0jhwxvWL7Thss
 X0d7ar+wsCtXmlHa0ejgFOZcZWevu6mNpRpMyv0CdxjzRlp+O1/yyL/CG9gQZ1xYwuEiNG9vqGx
 6fhhvlSgVMEBTB0pXQUEvDheBWKashnwrmRInTLpMQo7XybZwfmi7UvK6TEVbTcgWsFnIe4y2AX
 BvhWp3YQcleNjD7/GHr66xy38y5d/DxAI4S+79m9v2j632cHT3QXLq9y9CnKEHE3hM2evLYEWgS
 VlRCBiSpyNZRPuWLIN2lTfhu8TNj49jg/8MyRdnpom7lMMiy6hLQ3TRqxKie4wgMd4LFQCBoZYB
 ErkIgh/vKX1phNa5i9i0LgQ3Af2XC8+ogtiX0/QK2kh5ey86Uu4XZGBHQBsAwh4p7gU07USel4D
 /03nltywZu/roLt9RKqls4lTiVw0tVcsuvC+GAay02lZ+8x5GZiUAz042+VngKKiG3xDU713Vh5
 BYo/oeg+GH611Fi+yAaYpioBBSke0IJ3jgdKvkq31UqsIiY5dLZlh3uXfL8juboGXf7gUxYCtdb
 1HPmRABPQLuAfYxkpxqHwuSgdA+s9xDHQ4Ox7QzuGbtxEgENN2VY=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93777-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,google.com];
	FORGED_SENDER(0.00)[louis.chauvet@bootlin.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:jose.exposito89@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ojeda@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:luca.ceresoli@bootlin.com,m:kory.maincent@bootlin.com,m:victoria@system76.com,m:sebastian.wick@redhat.com,m:thomas.petazzoni@bootlin.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:louis.chauvet@bootlin.com,m:llvm@lists.linux.dev,m:jose.exposito@redhat.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,m:joseexposito89@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C09656D0E33

Debug information are mainly read by human, so display human
readable values.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 469c57c6d1e8..4c6f3ead51d7 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
@@ -358,8 +359,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
 		seq_puts(m, "crtc:\n");
-		seq_printf(m, "\twriteback=%d\n",
-			   vkms_config_crtc_get_writeback(crtc_cfg));
+		seq_printf(m, "\twriteback=%s\n",
+			   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
 	}
 
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)

-- 
2.54.0


