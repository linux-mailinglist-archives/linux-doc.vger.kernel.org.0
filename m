Return-Path: <linux-doc+bounces-38017-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC7A34FD9
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 21:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43DCE3AA4B5
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 20:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED7626982A;
	Thu, 13 Feb 2025 20:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HpX50b94"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D629624BC00
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739479538; cv=none; b=Fq6WpZi3rngnXk3Y5MfZ+Ri1/neKA+UyDJtObcREasnFcYcYUKXFGmQ8qf9j/hdXMDMgzBiFlpS0YswWW7DxjdGQyKnGU6Wrdgiygg50Mfi02Yjy7x2Amn30Qrj5edPpmxQDWtg5tONpqGZz+mW+nVT0h64Fj5NR/BeBhGin01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739479538; c=relaxed/simple;
	bh=f0x1/+Ylj4Mv7eF1BZEhj1MwEsnk1tafHH+F0mKWKTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1w7s8H1dL6QgxcLSDdYWwtapVm3vdJpqGdN1KXZJCMG62vzgHT+mVJrdF7rOI4kuCLnm2U3OtTStYGk5attCoeFJnk3BBn0LV4tumY7r3d4LRgfzf6I5pRdIuWykpGkViYbljMJxcgGqS6ArxdVG6w9+7Drw5srn7NV4aWr2FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HpX50b94; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739479532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOshCcawRD5l+dOOKNUyTV2qDASClyiozukCegwj140=;
	b=HpX50b94YHX/UzqrASELxwwOkrqi9bMbm28f0Qt578jClxWAEVZcAgh0D0yfh9KPWWLFAF
	wdBzdT8ftsYlIpNy3M8sk7/L86jR8CMiq0sjl091oM1NCtoKIArVkCUBrjhuLTy+uSZYMh
	NpJxC2OB0tZmwy75PAK6Q/m7q5eqGtQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-rpLY7LNSNPGXFuiqLjeSCw-1; Thu,
 13 Feb 2025 15:45:27 -0500
X-MC-Unique: rpLY7LNSNPGXFuiqLjeSCw-1
X-Mimecast-MFC-AGG-ID: rpLY7LNSNPGXFuiqLjeSCw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1824518D95DC;
	Thu, 13 Feb 2025 20:45:25 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 86AD419373D9;
	Thu, 13 Feb 2025 20:45:21 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:28 -0500
Subject: [PATCH 11/20] drm/panel/novatek-nt36523: Move to using
 mipi_dsi_*_multi() variants
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-11-67d94ff319cc@redhat.com>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
In-Reply-To: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=93676;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=f0x1/+Ylj4Mv7eF1BZEhj1MwEsnk1tafHH+F0mKWKTM=;
 b=V2ZTIZgoepp2lU/wwws7wsPunyC+f67KbRpj0WajaLxuSChuIfcTHafRKN8dGyxCENfXzftkZ
 dwTn9uF9t/TAK6dcFCjYzGsEMeQWr+JoLr6Z/zxSnQUk8bz9SeR5nCW
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Stop using deprecated API.
Used Coccinelle to make the change.

@rule_1@
expression dsi_var;
expression list es;
identifier jdi;
@@
struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+struct mipi_dsi_multi_context dsi_ctx0 = { .dsi = dsi0 };
+struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = dsi1 };
<+...
-mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, es);
+mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, es);
...+>

@rule_3@
identifier dsi_var;
identifier r;
identifier func;
type t;
position p;
expression dsi_device;
expression list es;
@@
t func(...) {
...
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
(
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_set_display_off(dsi_var)@p;
+mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
|
.....//rest of the mipi APIs with _multi variant
)
<+...
-if(r < 0) {
-...
-}
...+>
}
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1678 +++++++++++++------------
 1 file changed, 841 insertions(+), 837 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index 04f1d2676c783516574b7dc22d22eea45f5b4fc6..da5fc5abe719795c1395a51d63510cb34a006d73 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -23,10 +23,10 @@
 
 #define DSI_NUM_MIN 1
 
-#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
+#define mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, cmd, seq...)        \
 		do {                                                 \
-			mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
-			mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, seq);      \
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, seq);      \
 		} while (0)
 
 struct panel_info {
@@ -67,218 +67,221 @@ static int elish_boe_init_sequence(struct panel_info *pinfo)
 {
 	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
 	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx0 = { .dsi = dsi0 };
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = dsi1 };
 	/* No datasheet, so write magic init sequence directly */
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x05);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x18, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0x84);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x05, 0x2d);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x06, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x07, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x08, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0x45);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x12, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x15, 0x83);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29, 0x0a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x31, 0xfe);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x32, 0xfd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x33, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x34, 0xf8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0xf5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x36, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x37, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x38, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0xec);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3d, 0xe9);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3f, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x40, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x41, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x45, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x46, 0xf4);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x47, 0xe7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x48, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x49, 0xcd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4a, 0xc0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4b, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4c, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4d, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4e, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x50, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x68);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x52, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x54, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0x0e);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x59, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5a, 0xf7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5b, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5c, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5d, 0xe3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5e, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5f, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x60, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x61, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x62, 0xcb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x63, 0xbf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x64, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x65, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x66, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x67, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x25, 0x47);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0x47);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0x47);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1a, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x84, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x85, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x91, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x92, 0x0f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x93, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x94, 0x18);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x95, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x96, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb0, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x1b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x24);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x27);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x31);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd1, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd2, 0x30);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xde, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdf, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x81);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x6f, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x70, 0x11);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x73, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x74, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x76, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x77, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa0, 0x3f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa9, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xaa, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xab, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xad, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xba, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbe, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbf, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc0, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc1, 0x59);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc2, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc5, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc6, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc7, 0x48);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xca, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcb, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xce, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcf, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd3, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd7, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdc, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdd, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe1, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe2, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf2, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf3, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf4, 0x48);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x13, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbc, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbd, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x97, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x98, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x99, 0x95);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9a, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9b, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9c, 0x0b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9d, 0x0a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9e, 0x90);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa3, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x60);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0xc0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xd0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x02, 0xaf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0xee);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1d, 0x09);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x0f, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x2c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x05);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x18, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0x84);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x05, 0x2d);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x06, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x07, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x08, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x09, 0x45);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x11, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x12, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x15, 0x83);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x16, 0x0c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x29, 0x0a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x30, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x31, 0xfe);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x32, 0xfd);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x33, 0xfb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x34, 0xf8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x35, 0xf5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x36, 0xf3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x37, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x38, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x39, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3a, 0xef);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3b, 0xec);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3d, 0xe9);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3f, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x40, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x41, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2a, 0x13);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x45, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x46, 0xf4);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x47, 0xe7);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x48, 0xda);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x49, 0xcd);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4a, 0xc0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4b, 0xb3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4c, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4d, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4e, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4f, 0x99);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x50, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x68);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x52, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x53, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x54, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2b, 0x0e);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x58, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x59, 0xfb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5a, 0xf7);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5b, 0xf3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5c, 0xef);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5d, 0xe3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5e, 0xda);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5f, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x60, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x61, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x62, 0xcb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x63, 0xbf);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x64, 0xb3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x65, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x66, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x67, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x25, 0x47);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x30, 0x47);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x39, 0x47);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x19, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1a, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1b, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1c, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2a, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2b, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x84, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x85, 0x0c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x91, 0x1f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x92, 0x0f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x93, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x94, 0x18);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x95, 0x03);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x96, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb0, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x19, 0x1f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1b, 0x1b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x24);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb8, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x27);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd0, 0x31);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd1, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd2, 0x30);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd4, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xde, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xdf, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x81);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9f, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x6f, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x70, 0x11);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x73, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x74, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x76, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x77, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa0, 0x3f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa9, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xaa, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xab, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xad, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb8, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xba, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbb, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbe, 0x04);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbf, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc0, 0x04);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc1, 0x59);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc2, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc5, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc6, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc7, 0x48);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xca, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xcb, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xce, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xcf, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd0, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd3, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd4, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd7, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xdc, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xdd, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xe1, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xe2, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xf2, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xf3, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xf4, 0x48);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x13, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x14, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbc, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbd, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x97, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x98, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x99, 0x95);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9a, 0x03);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9b, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9c, 0x0b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9d, 0x0a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9e, 0x90);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9f, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa3, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x14, 0x60);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x16, 0xc0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4f, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3a, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xd0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x02, 0xaf);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x09, 0xee);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1c, 0x99);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1d, 0x09);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x0f, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x53, 0x2c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x35, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbb, 0x13);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3b, 0x03, 0xac,
+				    0x1a, 0x04, 0x04);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x11);
 	msleep(70);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x29);
 
 	return 0;
 }
@@ -287,196 +290,199 @@ static int elish_csot_init_sequence(struct panel_info *pinfo)
 {
 	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
 	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx0 = { .dsi = dsi0 };
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = dsi1 };
 	/* No datasheet, so write magic init sequence directly */
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x05);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x18, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xd0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x02, 0xaf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x30);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0xee);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1d, 0x09);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0x84);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x05, 0x2d);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x06, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x07, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x08, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0x45);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x12, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x15, 0x83);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29, 0x0a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x31, 0xfe);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x32, 0xfd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x33, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x34, 0xf8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0xf5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x36, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x37, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x38, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0xec);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3d, 0xe9);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3f, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x40, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x41, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x45, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x46, 0xf4);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x47, 0xe7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x48, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x49, 0xcd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4a, 0xc0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4b, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4c, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4d, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4e, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x50, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x68);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x52, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x54, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0x0e);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x59, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5a, 0xf7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5b, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5c, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5d, 0xe3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5e, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5f, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x60, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x61, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x62, 0xcb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x63, 0xbf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x64, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x65, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x66, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x67, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x0f, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x2c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x55, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x25, 0x46);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0x46);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0x46);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1a, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x84, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x85, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x91, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x92, 0x0f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x93, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x94, 0x18);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x95, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x96, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb0, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x1b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x24);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x27);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x31);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd1, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xde, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdf, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x81);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x6f, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x70, 0x11);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x73, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x74, 0x4d);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa0, 0x3f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa9, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xaa, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xab, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xad, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x4b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xba, 0x96);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x4b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbe, 0x07);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbf, 0x4b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc0, 0x07);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc1, 0x5c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc2, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc5, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc6, 0x3f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc7, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xca, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcb, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xce, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcf, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd3, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbc, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbd, 0x1c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9a, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x05);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x18, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xd0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x02, 0xaf);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x30);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x09, 0xee);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1c, 0x99);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1d, 0x09);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3a, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4f, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x58, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x35, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0x84);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x05, 0x2d);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x06, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x07, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x08, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x09, 0x45);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x11, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x12, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x15, 0x83);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x16, 0x0c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x29, 0x0a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x30, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x31, 0xfe);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x32, 0xfd);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x33, 0xfb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x34, 0xf8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x35, 0xf5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x36, 0xf3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x37, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x38, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x39, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3a, 0xef);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3b, 0xec);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3d, 0xe9);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3f, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x40, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x41, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2a, 0x13);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x45, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x46, 0xf4);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x47, 0xe7);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x48, 0xda);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x49, 0xcd);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4a, 0xc0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4b, 0xb3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4c, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4d, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4e, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4f, 0x99);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x50, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x68);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x52, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x53, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x54, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2b, 0x0e);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x58, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x59, 0xfb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5a, 0xf7);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5b, 0xf3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5c, 0xef);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5d, 0xe3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5e, 0xda);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5f, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x60, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x61, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x62, 0xcb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x63, 0xbf);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x64, 0xb3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x65, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x66, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x67, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x0f, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x53, 0x2c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x55, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbb, 0x13);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3b, 0x03, 0xac,
+				    0x1a, 0x04, 0x04);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x25, 0x46);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x30, 0x46);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x39, 0x46);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x19, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1a, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1b, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1c, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2a, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2b, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x84, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x85, 0x0c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x91, 0x1f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x92, 0x0f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x93, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x94, 0x18);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x95, 0x03);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x96, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb0, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x19, 0x1f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1b, 0x1b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x24);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb8, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x27);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd0, 0x31);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd1, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd4, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xde, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xdf, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x81);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x6f, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x70, 0x11);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x73, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x74, 0x4d);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa0, 0x3f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa9, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xaa, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xab, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xad, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb8, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x4b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xba, 0x96);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbb, 0x4b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbe, 0x07);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbf, 0x4b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc0, 0x07);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc1, 0x5c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc2, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc5, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc6, 0x3f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc7, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xca, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xcb, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xce, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xcf, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd0, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd3, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd4, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbc, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbd, 0x1c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9a, 0x03);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x11);
 	msleep(70);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x29);
 
 	return 0;
 }
@@ -484,448 +490,446 @@ static int elish_csot_init_sequence(struct panel_info *pinfo)
 static int j606f_boe_init_sequence(struct panel_info *pinfo)
 {
 	struct mipi_dsi_device *dsi = pinfo->dsi[0];
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0xd9);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x78);
-	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x5a);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x63);
-	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x91);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0x95, 0xeb);
-	mipi_dsi_dcs_write_seq(dsi, 0x96, 0xeb);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x66);
-	mipi_dsi_dcs_write_seq(dsi, 0x75, 0xa2);
-	mipi_dsi_dcs_write_seq(dsi, 0x77, 0xb3);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
-			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
-			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
-			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
-			       0xfd, 0x03, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
-			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
-			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
-			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
-			       0xfd, 0x03, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
-			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
-			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
-			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
-			       0xfd, 0x03, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
-			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
-			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
-			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
-			       0xf5, 0x03, 0xf7);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
-			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
-			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
-			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
-			       0xf5, 0x03, 0xf7);
-	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
-			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
-			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
-			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
-			       0xf5, 0x03, 0xf7);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x23);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x77);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x0b, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x10, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x17, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x44);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x32);
-	mipi_dsi_dcs_write_seq(dsi, 0x37, 0x44);
-	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x9a);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x42);
-	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x43, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x47, 0x66);
-	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x9a);
-	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x4c, 0x91);
-	mipi_dsi_dcs_write_seq(dsi, 0x4d, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0x4e, 0x43);
-
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 18);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display brightness: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0x52, 0x34);
-	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x82, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0x7e, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x3c);
-	mipi_dsi_dcs_write_seq(dsi, 0x82, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x97, 0xc0);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6,
-			       0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05,
-			       0x05, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x92, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0x93, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x94, 0x5f);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7, 0x55);
-	mipi_dsi_dcs_write_seq(dsi, 0xda, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x88);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x88);
-	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x90);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0xe0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_VSYNC_TIMING, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_GET_SCANLINE, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x48, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x49, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0xd0);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x6a, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x70, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_START, 0xf3);
-	mipi_dsi_dcs_write_seq(dsi, 0xa3, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xa4, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xa5, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xd6, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xa1);
-	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0xf2);
-	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x50);
-	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x51);
-	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x65);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x17, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x86);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0xbb);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x32, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0xc3);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x78);
-	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0xc8, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xc9, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0xca, 0x4e);
-	mipi_dsi_dcs_write_seq(dsi, 0xcb, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_CONTINUE, 0x4c);
-	mipi_dsi_dcs_write_seq(dsi, 0xaa, 0x47);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x27);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x53);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x63, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x66, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x78, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc3, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xd1, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xf8);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xe0);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0xc0);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xf0);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x08);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x5d);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x5d);
-	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x44);
-	mipi_dsi_dcs_write_seq(dsi, 0x92, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x49, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x8d);
-
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x75);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set pixel format: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x02);
-
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
-
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x03, 0x5f, 0x1a, 0x04, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x95, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x96, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xa2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00, 0x08, 0x00, 0x23,
+				     0x00, 0x4d, 0x00, 0x6d, 0x00, 0x89, 0x00,
+				     0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x00, 0xda, 0x01, 0x13,
+				     0x01, 0x3c, 0x01, 0x7e, 0x01, 0xab, 0x01,
+				     0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x02, 0x67, 0x02, 0xa6,
+				     0x02, 0xd1, 0x03, 0x08, 0x03, 0x2e, 0x03,
+				     0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x03, 0x8e, 0x03, 0xa2,
+				     0x03, 0xb7, 0x03, 0xe7, 0x03, 0xfd, 0x03,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x00, 0x08, 0x00, 0x23,
+				     0x00, 0x4d, 0x00, 0x6d, 0x00, 0x89, 0x00,
+				     0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0xda, 0x01, 0x13,
+				     0x01, 0x3c, 0x01, 0x7e, 0x01, 0xab, 0x01,
+				     0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x02, 0x67, 0x02, 0xa6,
+				     0x02, 0xd1, 0x03, 0x08, 0x03, 0x2e, 0x03,
+				     0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x03, 0x8e, 0x03, 0xa2,
+				     0x03, 0xb7, 0x03, 0xe7, 0x03, 0xfd, 0x03,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x00, 0x08, 0x00, 0x23,
+				     0x00, 0x4d, 0x00, 0x6d, 0x00, 0x89, 0x00,
+				     0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0xda, 0x01, 0x13,
+				     0x01, 0x3c, 0x01, 0x7e, 0x01, 0xab, 0x01,
+				     0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x02, 0x67, 0x02, 0xa6,
+				     0x02, 0xd1, 0x03, 0x08, 0x03, 0x2e, 0x03,
+				     0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x03, 0x8e, 0x03, 0xa2,
+				     0x03, 0xb7, 0x03, 0xe7, 0x03, 0xfd, 0x03,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00, 0x00, 0x00, 0x1b,
+				     0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00,
+				     0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x00, 0xd2, 0x01, 0x0b,
+				     0x01, 0x34, 0x01, 0x76, 0x01, 0xa3, 0x01,
+				     0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x02, 0x5f, 0x02, 0x9e,
+				     0x02, 0xc9, 0x03, 0x00, 0x03, 0x26, 0x03,
+				     0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x03, 0x86, 0x03, 0x9a,
+				     0x03, 0xaf, 0x03, 0xdf, 0x03, 0xf5, 0x03,
+				     0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x00, 0x00, 0x00, 0x1b,
+				     0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00,
+				     0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0xd2, 0x01, 0x0b,
+				     0x01, 0x34, 0x01, 0x76, 0x01, 0xa3, 0x01,
+				     0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x02, 0x5f, 0x02, 0x9e,
+				     0x02, 0xc9, 0x03, 0x00, 0x03, 0x26, 0x03,
+				     0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x03, 0x86, 0x03, 0x9a,
+				     0x03, 0xaf, 0x03, 0xdf, 0x03, 0xf5, 0x03,
+				     0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x00, 0x00, 0x00, 0x1b,
+				     0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00,
+				     0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0xd2, 0x01, 0x0b,
+				     0x01, 0x34, 0x01, 0x76, 0x01, 0xa3, 0x01,
+				     0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x02, 0x5f, 0x02, 0x9e,
+				     0x02, 0xc9, 0x03, 0x00, 0x03, 0x26, 0x03,
+				     0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x03, 0x86, 0x03, 0x9a,
+				     0x03, 0xaf, 0x03, 0xdf, 0x03, 0xf5, 0x03,
+				     0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_LUT, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x9a);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x9a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x43);
+
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 18);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x82, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+				     MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00,
+				     0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x97, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x05, 0x00, 0x05, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x92, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x93, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x94, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xda, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdb, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdc, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdd, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe5, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8d, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8e, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x90);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_VSYNC_TIMING,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_GET_SCANLINE, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+				     MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_READ_PPS_START, 0xf3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa3, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa4, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa5, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd6, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0xa1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_COLUMNS,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0xc3);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc9, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x4e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_READ_PPS_CONTINUE,
+				     0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xaa, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+				     MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_LUT, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x08);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x5d);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x5d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x92, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdb, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdc, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdd, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe5, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_COLUMNS,
+				     0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x8d);
+
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, 0x75);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x02);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x03, 0x5f, 0x1a, 0x04,
+				     0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
 	usleep_range(10000, 11000);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display brightness: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x2c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x05, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05, 0x01);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	msleep(100);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 	msleep(30);
 
 	return 0;

-- 
2.47.0


