Return-Path: <linux-doc+bounces-93778-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kSgcFYdEP2q9QwkAu9opvQ
	(envelope-from <linux-doc+bounces-93778-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:33:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B478D6D0EB3
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:33:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=mgWfATN0;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93778-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93778-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3AE63097B0D
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 03:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DA731E849;
	Sat, 27 Jun 2026 03:31:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2543331E83A
	for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 03:31:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531082; cv=none; b=kEEnSgtk5bGdybXk0gxYmpPPK4taxEKiVy+jUr+LrFclvdlfZg20po8Q9O0EOZrBkmveG23nYsUY5G0gIngz22j8gOIBkTOYMSVvgK1oiEp5++E3la47ZrdCvClZlz/V2v/VjzdKFp11q7LFDpqD2lfoaeeHeOLHnioNiJWQbdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531082; c=relaxed/simple;
	bh=oxr/CF0EOleBJpYQ0o3XQ1eFlhGpl9bHjVK5vcH/zUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYmWi7iVLMLtEE7aNNubl5ktnJLWdeKmCorwO+qcKeqygQLo9hIt8v9x4KgkaS/txXcCu4VfWrBM3U4t6nOenia0CP73J3HIClumU+QuZBV5LWc1TfZHlMjfbDtSLmmc3ULyxA0wIZbGb/15QaOx8NyCbzryHI2jqsRKYPVKrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mgWfATN0; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E17C34E409ED;
	Sat, 27 Jun 2026 03:31:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE35D60233;
	Sat, 27 Jun 2026 03:31:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFDB3106F1174;
	Sat, 27 Jun 2026 05:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531078; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7t4wxccSVE+8YpNtCCYNB6F0KQiLmWtDWy0z8sUDzNs=;
	b=mgWfATN05p3uSCk5D3rXBj6g9bD4yIVBqfuItCRyvbI6KDsvC2fv1WWPSdfDIE9lOuelxk
	6M5fTRm134YoTK8EI195rhSbrE58n0mFbm6B34X8hm6H63IPLSDiNkVozzs7KKaYeQ8c7Q
	NM6PxmnDoN3KSjZRGp6DO574Acr4cG3x4NunZibheX3PF/7ixFUrbl5xuCt+VU5Z1XEalE
	kVCv1g/zl/Y8RfRpia+81QBgNy/LlupUqQqB3BNoqtPXwiuoicpNT/7ayocTbKjrHaned5
	e/8q+m4aEEBYKd1S3v3IEtFBTc5B6aKp5neatpwGDkvDJAzqbUW7Z3eEP+xb1Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:29 +0200
Subject: [PATCH v5 12/38] drm/vkms: Explicitly display connector status
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260627-vkms-all-config-v5-12-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=oxr/CF0EOleBJpYQ0o3XQ1eFlhGpl9bHjVK5vcH/zUw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0Pe03kOlBSLeLny4z2YzohoyX0ZyfDtpYSnn
 eu936/sl3iJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOKHmg/7BakTXcTMLBqo/YspJqXwtq3VhskmGJx
 cDXjP+hdjJZiCCfZC8exAZqDyk2BOPqq1MyHjCDkNfGR7dVvfAf5HLu6V9G30CvjiKDLmyuBQAh
 4O3zD+2J4Bm9VIIBsGTQAeQkzFlrUMhU6SksHh7ZjgflyQMwLtrU4rqko0GNkP8JiycImGRB3BZ
 t56vZfAdO7lln+YLwgCZor5DJOKgSkOINUqtvKZUa43bhlWTCG4HWTLPvFMLd2pVKweqaMINb5n
 vs1FYS38teJqemDVRqz5kPd99kopiq3MsqdLRtgJdORRFkSwOKWv8gQxRCkuvZ4unCg2w8+GeMd
 3Yn/l/bxxAKsYZHuUFSKIcwyAK/Xe1skcMAE76fw60xqIPhiLNGmltfp8cniXF8VQw87xNsFIs2
 uK+eHvKILuQaNngeRTBmy2D5eqb62z/O0RSiz1aHEVqcL7cNpdqev5fA71zrpLPTvQAiDmXkWnU
 rJdQkWXSZSiY4uSfg9PttW4hJ0LTYTTXma3jH0MZoGqQIep+lJ2ZBconXZs+ZYAcMczF6/uq5MP
 +BPmMol12Vgq8fWZks2/1wo8MjyPy2H2E6ahRhYQl1QkMRuYuh1R6KPJcSu2pN6i1Xh1vEDFsQQ
 OmmkkiOEC1tG1tNvtcY4R55Joeb1Mc0TA0PBgL3z7MUc20IQdOcs=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93778-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B478D6D0EB3

Debug information are mainly read by human, so use full name instead
of raw values for connector status.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 4c6f3ead51d7..9071d6864d52 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -3,6 +3,7 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 
+#include <drm/drm_connector.h>
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
 #include <kunit/visibility.h>
@@ -368,8 +369,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
 		seq_puts(m, "connector:\n");
-		seq_printf(m, "\tstatus=%d\n",
-			   vkms_config_connector_get_status(connector_cfg));
+		seq_printf(m, "\tstatus=%s\n",
+			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
 	}
 
 	return 0;

-- 
2.54.0


