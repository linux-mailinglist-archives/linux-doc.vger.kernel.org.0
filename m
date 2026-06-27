Return-Path: <linux-doc+bounces-93780-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i9foC2BEP2qlQwkAu9opvQ
	(envelope-from <linux-doc+bounces-93780-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:32:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01A6D0E6E
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:32:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=ULXNSJzH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93780-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93780-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8662C3045304
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 03:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBA331E85A;
	Sat, 27 Jun 2026 03:31:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F30324B20
	for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 03:31:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531088; cv=none; b=mzJfXsZdYYPglB0AxPEoA1W3KHIGP8SyatR9UrC6Eveo7hV4YM1nmR4TL0ndvHNWdtivt3MBCgAMdkcEJvha+Y6IV/EMW1N2Ucgk3cnvIbT+Bai+OoSXYB1MLLYgkSRaDLnc4ZBqeQoDlTZShszoQA9/QWJQFB1KcGStghw6/cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531088; c=relaxed/simple;
	bh=XiKwAPRa/+NQm3DU+qGiwJ/34hsXkmvGjxyX2KcisQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPfXGe3Ync9KT5u2f7ioVwXKzW55bfDmkqjwk2Fo3vNg44FN7/QGbmUs14NZwcKsoXDnLMhofs4cuPOovZJF3tl0wGOr6vZQwbHyb1GvbX9GdD9Dc+9g4xZkuVJS4SNnmP4xyA0rZ7n7M06AdN08VVIYHwQQNJUm15/MPTQgAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ULXNSJzH; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AAEDF1A0A16;
	Sat, 27 Jun 2026 03:31:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F94360233;
	Sat, 27 Jun 2026 03:31:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF6A7106F1170;
	Sat, 27 Jun 2026 05:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=enjP3ecSS4QzsDh23km0Yhkh9WtnM49/1mdnYB1P4Io=;
	b=ULXNSJzHOLol9rJxXzejdSV18o4ococAqqOi8hr0ijk8s1vJFavK5KKH3uDHtl9DVX70xY
	Tls02ebaj06ZXvEqdPjVdPD8hNfZ3dwim4tn/oWjD2SN8QEqKQQAGiZsva6sylDMp+l860
	A5+JjpHbc+Gsn6ElckCFG1gO+gbzVyr4/y/hIM48GFvC57Z4EqSi+rwLct2oRuhcPo2hM8
	NqREB7zQ85Ajdv+Mha9qd98w7tMcJPdZsZ9Lpc0Svyy7DYVkFpPXx3qIH7ajdaVEvpcpyl
	4jlQDlr6Ez8Ua2gNx4OUJG5v7B/HMrH6OuhZ47fnYNxzhMt30eDHNV+kdmwHpQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:31 +0200
Subject: [PATCH v5 14/38] drm/vkms: Use plane folder name as plane name
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-14-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XiKwAPRa/+NQm3DU+qGiwJ/34hsXkmvGjxyX2KcisQ4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0PeBSZa/Q5LZrxCv8vC3cSZ+TH2Lb88ejFEz
 9FxZtUMnUCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOJGLRAAg/uGvBHH9KsgxvsyhNZ8WI2nL1GeuCJ
 1m+Qv668EUWQuRK7GWAigdDVfTA5e4z8M65EZ1ZgLta/3RQkcDzzGIm2cLAmkHTLyuDbJz8Sxaz
 dxXtydRBA1S9aCWr0aiMmfbyanc2n+eiS2Io1QZnf/CCUJJQt7HY2cTYkdhlgoP41kvHhbDh/88
 hdDCJ7ogtdtlZq63ZqEXBnnMi8HsSrimjJkG3vsXW5iupgG8ife77VkiQJ8sKOYl+ZbDdXPJOwN
 5zVGwSH7cGAgwiFA8oC9xgMEW7n9BDXEiL02FwyLCZ+tlAedn2NWWtRFsyKfswuSZml+YPtQ6U8
 CvEeG3RK/c6c8kKk1ql9xUiaUmHIDAGUDm/htKVALSNw85c8vTZ6n7ho6MNlG5TsltcdsYF2rMJ
 6vj2S1JA8h8xK93dO0yjzI4ce4hSvcKuxx5Mcxp1mTpne6cb9+xuvhlOiQhRSk9zYkEf5Nqf2vf
 ojBYmW7RE54B1KE7vhxEN9hUVs0EI1fxb8fDijZwWjpW6g9O7204kzyqDhyN9U6IkW0MposN/JX
 kryBJX9RgveTXrtC4NQJwb8t/idyWStkW4Uta6mXzp+E4LZ/uKYj8ODew/zOrCdzUO93wriojiw
 /pSz7v3G1aF4Ih8oyejo2w/ZiVmKablzHw0l+ka81ZxfwykoSA3g=
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
	TAGGED_FROM(0.00)[bounces-93780-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC01A6D0E6E

The plane name is now directly derived from the configfs folder
name. When a plane directory is created under
/config/vkms/<device>/planes/, the folder name is used as the
plane name via vkms_config_plane_set_name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 97f87a53d202..0744ac40814d 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -377,6 +377,12 @@ static struct config_group *make_plane_group(struct config_group *group,
 			return ERR_PTR(ret);
 		}
 
+		ret = vkms_config_plane_set_name(plane->config, name, strlen(name));
+		if (ret) {
+			kfree(plane);
+			return ERR_PTR(ret);
+		}
+
 		config_group_init_type_name(&plane->group, name, &plane_item_type);
 
 		config_group_init_type_name(&plane->possible_crtcs_group,

-- 
2.54.0


