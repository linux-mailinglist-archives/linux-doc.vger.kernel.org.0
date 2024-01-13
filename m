Return-Path: <linux-doc+bounces-6758-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6BB82CE23
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jan 2024 19:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B11FA1F221AA
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jan 2024 18:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB03EC8FF;
	Sat, 13 Jan 2024 18:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="ayA3iXRA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1209D568A
	for <linux-doc@vger.kernel.org>; Sat, 13 Jan 2024 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-783293278adso421596285a.3
        for <linux-doc@vger.kernel.org>; Sat, 13 Jan 2024 10:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1705170793; x=1705775593; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OvziupLQyzD7CXIhblfqO3HA/n00b86Rv0OXwbGfPwc=;
        b=ayA3iXRAae7Qvos2nxnewcRLlz5W5eGvBkPcGRMLXMAR/G6/Dl5g3QZxwe4ImcqVaT
         Dz8xITHPuj2ZFBxDdI1XR/Nqyh9uHZeNasswC1/fep86sQ/iyXEjMios7Ptl4rZ6Ukvq
         t7++7MrdH+AOPQTlBXdm/FLvkU7Cju8wDi10o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705170793; x=1705775593;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvziupLQyzD7CXIhblfqO3HA/n00b86Rv0OXwbGfPwc=;
        b=PNljDIaf5XGRskt5TBxQHE+bPCIvbmiv+HoDtHSRRSwn0U/CBeCpB/3fbyxvTti1VQ
         7YgPRKDlzaZtv0LTf8ioUmheMcNA9UFr1OKxrQGPUywppVmQRUz37VXeA+ioIw2yWxc9
         5o/AxGZFiLeiwRB3+NLlEcidGI8B/qZEsSh3GstLkTRStX69lTUMrbp+mw9LN0Ts9Ijt
         vJr9IiBpgb9VcC//ONKfg0b+t1WM/KzMHB/W+oEaNefyNHbeK5hAe9YK8qgYWpNyc7S2
         GJm6fM4RCqmFtS6WX0Q4NTN/TOZQ8GXQ80qHib7cUk9MGoX3ZLES3peK6bqop18MksuS
         n2xg==
X-Gm-Message-State: AOJu0YxWriX8sORqJxqOprh7H0cTA0Yd7M4Sy8Q0pERHJjTKS/XHY0ri
	I4UNFvPYkIt8YMbhUiBcjW24FtAwLxEIUw==
X-Google-Smtp-Source: AGHT+IFQdnDCXCdcfpK4uPkA6Gta2loKR0Z8fUh4ZmrcJurBWNwp64j+YEmBjiyiXp6ir5rk5q8ejg==
X-Received: by 2002:a05:620a:28d3:b0:783:562e:b0fc with SMTP id l19-20020a05620a28d300b00783562eb0fcmr750374qkp.7.1705170793048;
        Sat, 13 Jan 2024 10:33:13 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id z4-20020ae9e604000000b0078162695b73sm1855853qkf.104.2024.01.13.10.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 10:33:12 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/2] platform/surface: aggregator_registry: add entry for fan speed
Date: Sat, 13 Jan 2024 13:33:05 -0500
Message-Id: <20240113183306.9566-2-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240113183306.9566-1-ivor@iwanders.net>
References: <20240113183306.9566-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Add an entry for the fan speed function.
Add this new entry to the Surface Pro 9 group.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
Link: https://github.com/linux-surface/kernel/pull/144
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
---
Changes in v3:
  - No changes in this patch.
Changes in v2:
  - No changes in this patch.
---
 drivers/platform/surface/surface_aggregator_registry.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 530db4db7..b0db25886 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -74,6 +74,12 @@ static const struct software_node ssam_node_tmp_pprof = {
 	.parent = &ssam_node_root,
 };
 
+/* Fan speed function. */
+static const struct software_node ssam_node_fan_speed = {
+	.name = "ssam:01:05:01:01:01",
+	.parent = &ssam_node_root,
+};
+
 /* Tablet-mode switch via KIP subsystem. */
 static const struct software_node ssam_node_kip_tablet_switch = {
 	.name = "ssam:01:0e:01:00:01",
@@ -319,6 +325,7 @@ static const struct software_node *ssam_node_group_sp9[] = {
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
 	&ssam_node_tmp_pprof,
+	&ssam_node_fan_speed,
 	&ssam_node_pos_tablet_switch,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
-- 
2.17.1


