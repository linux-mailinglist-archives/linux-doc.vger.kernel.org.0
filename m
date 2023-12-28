Return-Path: <linux-doc+bounces-5958-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279B181F36D
	for <lists+linux-doc@lfdr.de>; Thu, 28 Dec 2023 01:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB04E282B44
	for <lists+linux-doc@lfdr.de>; Thu, 28 Dec 2023 00:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C551D17F7;
	Thu, 28 Dec 2023 00:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="I9TZNyYe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C510EF
	for <linux-doc@vger.kernel.org>; Thu, 28 Dec 2023 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-427f5cc49afso1461441cf.2
        for <linux-doc@vger.kernel.org>; Wed, 27 Dec 2023 16:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703723697; x=1704328497; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jy4/hAbZIHHKviv5DRs0q6iojZt8AME5ln1+pcgK9ak=;
        b=I9TZNyYe5/S7FkFaIFHZgCXcMf0SdrdwOI/+g/8VP/nmpXa+PJpRfFj5a5oTyGxNRx
         r/nmmVBNaFRrJHBdqwB2AZL4hY8O4MHwTzSa+bpC2wqKwpn5WpofFBfqdkHkpHOHaMCk
         P0WFDYRoy6JxEVTrEfegwsFSJ+VwLZ5qL4G1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703723697; x=1704328497;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jy4/hAbZIHHKviv5DRs0q6iojZt8AME5ln1+pcgK9ak=;
        b=aL4w5DdWWYqcdpS8LENvI0tva54RDKiPX+dTlgEfe76rdsovJD2PSYg58wXeXBbUvt
         OabMg+GBNoEFv5PdX11RXRAs4t5wmPdqUNx3I0or/1ER0q6jdN0Xzz7rPyoVumQw4abo
         BXLhNhHilBZoqOhAnkYWsEledavlI/4hAvIAqDq4Op+MnB5YiX/ZrGUBNBx3mUI4Y0PK
         XU2ysZGFdsyKMid6+nOP38Omf8ZmwtKnt/mHCEcdeP7f3GtxfSi501qM71vFWl52GVMs
         Jy/WNLDCCFU83K/H4JK/zcPHuSJZDvfWW0a5l0IwN0X2O3eCeD/jinHneuBMNgpNnJk7
         7D9Q==
X-Gm-Message-State: AOJu0YyD0oDPV4BnS+uU1UKsTfvWBtW45baPAN39Cu60O1LhvYED/sWb
	5s6SMnaB0unarmRJaZ3+Sc5uvpvs9kCfrA==
X-Google-Smtp-Source: AGHT+IEieXdMuigHa2IUm917hcMq3i8tcM2icJXoR0uOkPM2X7bdMe5Ynbq3Opfwm+Fo80GV3C9V9g==
X-Received: by 2002:a05:622a:1803:b0:41c:c8f2:58ce with SMTP id t3-20020a05622a180300b0041cc8f258cemr15594049qtc.27.1703723697440;
        Wed, 27 Dec 2023 16:34:57 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id fb9-20020a05622a480900b004279315b3besm7710684qtb.0.2023.12.27.16.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 16:34:57 -0800 (PST)
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
Subject: [PATCH v2 2/2] platform/surface: aggregator_registry: add entry for fan speed
Date: Wed, 27 Dec 2023 19:34:44 -0500
Message-Id: <20231228003444.5580-3-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231228003444.5580-1-ivor@iwanders.net>
References: <20231228003444.5580-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Add an entry for the fan speed function.
Add this new entry to the Surface Pro 9 group.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
Link: https://github.com/linux-surface/kernel/pull/144
---
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


