Return-Path: <linux-doc+bounces-93773-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J6g4FRJEP2p4QwkAu9opvQ
	(envelope-from <linux-doc+bounces-93773-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:31:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E2C6D0DEA
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 05:31:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=yTmyt0dj;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93773-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93773-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 396923033AEB
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 03:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3B02BEC5F;
	Sat, 27 Jun 2026 03:31:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1DA1A6813;
	Sat, 27 Jun 2026 03:31:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531073; cv=none; b=SuDU61nqsgy428fzr+YWam2/VAvIYsj05MJWsJrnCdvQ5Wf67nx/QADhFdl6oKVWM+8Q9FS+O+IvXFW65jevGLC+oZI/uhSFObZhfWTcl8tKYKNXUSKzISt8JuXsavt2bJgMxXicCuGNSG2NFngmRpsWU2j1+AFW/Xo7N3J4kyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531073; c=relaxed/simple;
	bh=M4IKg4jtN2coKi4h2W5OHuSx8L+kOjlkuI6yHVh2tSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aysJXlKqZOE/1Ag/v+7k6rf27/gGYXHN0vjukxEELNoNT+zvAd+ydHpqtbJoliBJDHI1XFXhLGLGbqw7AhZWtQrbIQW+A0q9jFh78cQGmpMMHbBIUlNvJ5Gb/WqQTy71z82Ox/4hi2IrL9qawip0SZ25Sb903tfsDB2RLoiv+lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yTmyt0dj; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EE7A1A0A10;
	Sat, 27 Jun 2026 03:31:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61EFC60233;
	Sat, 27 Jun 2026 03:31:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6B8C106F1170;
	Sat, 27 Jun 2026 05:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782531065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OZ8EM81DGMlJ9qEgvUE9Mt5KnFr4O4RtbirwspUTjRM=;
	b=yTmyt0djrIvDz5sia3dlyFo9K+o8tbbwin4Dc8R2c/IlQnUv5irrsKvGzTdiwXbAJ34wKH
	GM2McjpWG/y/nzI0XxZksRrgNBIO1CD4kQMRtHq2udX8Av0xJORWwQos+3c18aGqDNlzdW
	HDqZ0gGG40q5PRgEW/7arD3C9gDALolyWcq46HDyEB4DSbLVg8NV6aknl4Uu6uR1C5M9Xr
	AX3n3FIvM3+GKk1952j07Y3VlB0PLg2edZGqu5Jd0IYTi310d50O11t0biaUlGk7Io+6cf
	VPs8Daj3QLuno5jxybirPd7cICEKkoV/OyN4SGXGobQHCb+xZpZrzMEsZ5YWXQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 27 Jun 2026 05:30:24 +0200
Subject: [PATCH v5 07/38] Documentation: ABI: vkms: Add current VKMS ABI
 documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-vkms-all-config-v5-7-854aa0840926@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4411;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=M4IKg4jtN2coKi4h2W5OHuSx8L+kOjlkuI6yHVh2tSk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqP0Pd17dPdykH+J1Rl+Mvy3D02QP1ls2Fn3X5O
 BB88oAgLUWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaj9D3RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOLgpxAA1RNVJv+/B95y7Ja7uG6EkQvSfoqGq+l
 OAI6TQXR1iIfG7eeDfeqpdDWWEXBNfU/L/C7GfIN8Y3Ibr7hrSdvn64cfwctxdnje2nZhUxSu8e
 ACpBsIm1vj+XzT4rl1gWRGgLilo1xCHedZLgX+24tOxbWaYt0pZht4tIX6fMvMAeEFVPw6qt2cG
 hrqmtLuQtLxLPlEOi5M3MUKh/y1KqECP1eppSeKAfzWrqvrljHC+RDnpT9+pVh6thVp0ANDq9cf
 W+sMiJYdBmGwBrOAJ7NagBU9ePlPerphlwJ2mExMELXj0tz+yOoEa4rJcODSRw17lwS4jYczqgG
 RrZuaEG/8e0nusUiZj1LqtKGQ8cZWZ78dM2vwbEGKKcoK1lIifcO9/HzSZIuH9RR3k4fa5j+e4x
 STXSwrFDYWbZX5zgvbw+s+sUgcFHkBQP9LwQQ3RU5CbPVGVUoenJm6d8ucR+HQCIA9orszGEE9f
 DKDByc4QnDEdPOZdZHXzY5nttS55MYyI/z6M6yq5w4+Pyp2BzJBXaMmIUlqtZBWKvhZLhxBYzBb
 E+xPzZMQzFFJpWNgGiJhOQMuRIwsoabohSsHxNc1nnLBQ4OAHylJpEkIxbzv01fzn9xbm+tio04
 xabB6LmUE/Gc7flSfjkuhuTZ0XtHVcrlCmw/KgPaIFkQNweAib1A=
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
	TAGGED_FROM(0.00)[bounces-93773-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lists.freedesktop.org:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7E2C6D0DEA

VKMS recently introduced a ConfigFS API to configure new devices.
Add proper ABI documentation.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 118 ++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
new file mode 100644
index 000000000000..a1a3e186e50a
--- /dev/null
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -0,0 +1,118 @@
+What:		/sys/kernel/config/vkms/
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains sub-groups corresponding to created
+	VKMS devices.
+
+What:		/sys/kernel/config/vkms/<device>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the VKMS
+	device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	connectors of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	connector <connector> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/status
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Connection status of the connector. Possible values:
+	1 - connected, 2 - disconnected, 3 - unknown.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains symbolic links to possible encoders
+	for this connector.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	CRTCs of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs/<crtc>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	CRTC <crtc> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs/<crtc>/writeback
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Enable or disable writeback connector support for this
+	CRTC. Value: 1 - enabled, 0 - disabled.
+
+What:		/sys/kernel/config/vkms/<device>/encoders
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	encoders of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/encoders/<encoder>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	encoder <encoder> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/encoders/<encoder>/possible_crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains symbolic links to possible CRTCs
+	for this encoder.
+
+What:		/sys/kernel/config/vkms/<device>/planes
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains sub-groups corresponding to the
+	planes of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains attributes corresponding to the
+	plane <plane> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/type
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Plane type. Possible values: 0 - overlay, 1 - primary,
+	2 - cursor.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	This group contains symbolic links to possible CRTCs
+	for this plane.
+
+What:		/sys/kernel/config/vkms/<device>/enabled
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+	Enable or disable the VKMS device. Value: 1 - enabled,
+	0 - disabled.

-- 
2.54.0


