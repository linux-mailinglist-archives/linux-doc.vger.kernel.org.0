Return-Path: <linux-doc+bounces-94984-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AsM/L/dASmpuAAEAu9opvQ
	(envelope-from <linux-doc+bounces-94984-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 05 Jul 2026 13:33:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 025B6709D1E
	for <lists+linux-doc@lfdr.de>; Sun, 05 Jul 2026 13:33:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SpzKUKJr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94984-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94984-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE3F7300AB1B
	for <lists+linux-doc@lfdr.de>; Sun,  5 Jul 2026 11:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2853135AC16;
	Sun,  5 Jul 2026 11:33:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0711FF1B5
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 11:33:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783251189; cv=none; b=ffrK+X6Ujecbq1gBkW4yQLJSqWKJpnDj+A9QwJeZeVgio5cdmyglNAzJRbRFTqeMJ5beTi3wa6dX5StGqolbz4p8BJ6hNtc4RkzBey47sk+V0bCphtRTeTjrDpbqyJq5rTHBpEtEZWrTR43rNZVp8vQOYDQIL7zx6mQoxpJjbys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783251189; c=relaxed/simple;
	bh=8P0QNjJlcHI6HgxOlg6IUhN5+Kup9IuekanC4zCHlFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qxSSrQjU/cVlWcaMxFTQOAFVis1ckdvEd3fHhtCFjjs/hHBOr4L8GXHq5uXtPViP3nfKeUKnNyBA+1r2QQGPYx93ego8wvUxe+7kPwR9SgHV14QlzAlqhV0pGiaEzvjTCxofiuVtjYtjzEhmC6TR61Fs+zwxOQ/1zY5Ba17B6go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpzKUKJr; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1206049f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 04:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783251186; x=1783855986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GKZD8suZHUX72iEyA8RIZIB5/2RWsYR7LLY9AUUTX8=;
        b=SpzKUKJruAOg2GVpiB237sKO4JuTh1iRi/Lye8ltFtX2rQtgHKXsOZsOb82EdIHAYH
         yDgc4vlDhP9gF/xodzQoBlwCIh5TqODVskp9GaOgl50/h2bsajvTBXvZcPJmLTiLxdW3
         Pn4m1Rx/dNuSZbk5esj/5XMi1B0MNToMNEF7TzQAc7qlYfSJQxhM8nBfO9lnFP+ZTezm
         5KtpoHv7loVAbbEGx8JGlLnb4PZcwPuW90BkPXHZdcsMRFVabwCLMRY0H/6xcUHu6ER6
         jWLZpt0dfv89fqukFjvOzsNUqCJsEzFNCxgMWxChhdAuLU8Lxr9yoifxR9gIw7aewG2X
         k4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783251186; x=1783855986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GKZD8suZHUX72iEyA8RIZIB5/2RWsYR7LLY9AUUTX8=;
        b=o39LAY2aDdlX0VuKoyUkV0JhuGPrieBAlMmpS9W/k8x96Qub5twq4150/v0L8r32l4
         TZgaPMD30nhPAXNiTfVvyapJXjGgRIGzqFh8cPmujiv4MFSbBdzpBe4Joqob6NMH6kEh
         s6/p80PuHjB+kkmvM/tA+H0eJl7J7Dk+yZiLPxg9J7ZGkhZlYetysAmLnaiwkuWgPhn0
         AXzn43rAvUQAyJq44Q1WcL0uykfus77ax5I29tAxfef7GYnDJhLPSbV4JDFRkA9Tc5Za
         eiuaXQPC/N7Cc1DS04/JaLQnPSG/K/2WRq9cvz5ySf18YhoyYP9n0FAd8z0arIyzVEzz
         twwQ==
X-Forwarded-Encrypted: i=1; AHgh+RoM1r8hcQO7bt87wRB9p7bBnOLipl28tuAkJYVbn1LQyivSMTd0j/Fgiy9mAo+tbLZBPrQ2D2Eooag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3IpGPPpH8Rbkrz3jYUPhpDdNS3b33Bo/D0/fwCdfkwtaJHW+T
	cDGUwRgme+/W6aWDJeSDZ0lB4IdCGxIYXS2QSHIPEM3zUAcjNDqLoLKG
X-Gm-Gg: AfdE7ckWm/B6yKYHlihS4kBVuBiKAaFBG5H9rZ0N0jIjtzOM9qGYl7apmtrmQPFBkmz
	psS4y7yDBXPcG6w9G7rkmP785uE+e1Df6KrTEEKmiBeukdU8DMBKEcDzJYy1BBj+CkZ4WSAiNQ0
	lwzEjBAcMrH+du/1LEXvlH5Qky4zntHy5feqx9CA6um2KzCMVzLuoIyP7MDhZuE9/t9gkjbPHaO
	ZydSTZIrhYd34V2sMeU1jHmJyeI5VPU2Jv3veLesOSVrAIcGzNOreLxqDusiOumGQQT+DUTQ2Pi
	j/PrhZkAwaLTstG58DsIP5MFZMc8jlhWqUMv9vFOMPSyOvCW6YLZWETGG8CM4DQ9Tz6GUFde0ZG
	j3wqoAI27TViRUQUrBVaP0/7JMP/06qcIkogan+vJHbpviGu5KMt5U9w8+ESEhTZVWAMAouc3VE
	5L3Pf4A+TTA7PCLs75IVe7zJiW/HLoCEw=
X-Received: by 2002:adf:e391:0:b0:475:f0c2:5b07 with SMTP id ffacd0b85a97d-47aad8304d0mr5378708f8f.61.1783251185783;
        Sun, 05 Jul 2026 04:33:05 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d7801sm15860984f8f.16.2026.07.05.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 04:33:05 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: =?UTF-8?q?Miska=20H=C3=A4m=C3=A4l=C3=A4inen?= <miska.hamalainen@hotmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E HERO
Date: Sun,  5 Jul 2026 13:32:36 +0200
Message-ID: <20260705113246.812500-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94984-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:miska.hamalainen@hotmail.com,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[eugeneshalygin@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[hotmail.com,roeck-us.net,lwn.net,linuxfoundation.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eugeneshalygin@gmail.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 025B6709D1E

From: Miska Hämäläinen <miska.hamalainen@hotmail.com>

Add support for ROG CROSSHAIR X870E HERO

Signed-off-by: Miska Hämäläinen <miska.hamalainen@hotmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index ccf43fd1fa9f..84c9160efdd2 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -25,6 +25,7 @@ Supported boards:
  * ROG CROSSHAIR X670E EXTREME
  * ROG CROSSHAIR X670E HERO
  * ROG CROSSHAIR X670E GENE
+ * ROG CROSSHAIR X870E HERO
  * ROG MAXIMUS X HERO
  * ROG MAXIMUS XI HERO
  * ROG MAXIMUS XI HERO (WI-FI)
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 4ec2028f7dfe..381c399963e8 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -487,6 +487,14 @@ static const struct ec_board_info board_info_crosshair_x670e_hero = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_crosshair_x870e_hero = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_800_series,
+};
+
 static const struct ec_board_info board_info_maximus_vi_hero = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR |
@@ -891,6 +899,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_crosshair_x670e_gene),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X670E HERO",
 					&board_info_crosshair_x670e_hero),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR X870E HERO",
+					&board_info_crosshair_x870e_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO",
 					&board_info_maximus_xi_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO (WI-FI)",
-- 
2.55.0


