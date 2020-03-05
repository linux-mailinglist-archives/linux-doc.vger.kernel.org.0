Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C74C17AC36
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2020 18:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbgCERTB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Mar 2020 12:19:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:41966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728008AbgCERPS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Mar 2020 12:15:18 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3234C207FD;
        Thu,  5 Mar 2020 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583428518;
        bh=cZr6PQdmiL0Y5o22uj5yyFQjh/COZT2QBmPyV9LF2xA=;
        h=From:To:Cc:Subject:Date:From;
        b=O5o4zH6uBRMgYUdIS61ti0g0F4ugazmvtokGw0NkSUZ7TyC/OluK+uPGHlQipQetY
         iq3GtgwQIRw/AWddhnjqiV/DmqeCbXSKmqCtQNQ9vO5wW+cjDtZEiFYxWJ9VkcnhEY
         gLsKlsYraesdri2OEA54BtscznK3KIBOwxGJEXiM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 01/31] ACPI: watchdog: Allow disabling WDAT at boot
Date:   Thu,  5 Mar 2020 12:14:45 -0500
Message-Id: <20200305171516.30028-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jean Delvare <jdelvare@suse.de>

[ Upstream commit 3f9e12e0df012c4a9a7fd7eb0d3ae69b459d6b2c ]

In case the WDAT interface is broken, give the user an option to
ignore it to let a native driver bind to the watchdog device instead.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  4 ++++
 drivers/acpi/acpi_watchdog.c                    | 12 +++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8bf0c0532046f..1a5101b7e853c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -136,6 +136,10 @@
 			dynamic table installation which will install SSDT
 			tables to /sys/firmware/acpi/tables/dynamic.
 
+	acpi_no_watchdog	[HW,ACPI,WDT]
+			Ignore the ACPI-based watchdog interface (WDAT) and let
+			a native driver control the watchdog device instead.
+
 	acpi_rsdp=	[ACPI,EFI,KEXEC]
 			Pass the RSDP address to the kernel, mostly used
 			on machines running EFI runtime service to boot the
diff --git a/drivers/acpi/acpi_watchdog.c b/drivers/acpi/acpi_watchdog.c
index 95600309ce420..685fd0ef9e8f2 100644
--- a/drivers/acpi/acpi_watchdog.c
+++ b/drivers/acpi/acpi_watchdog.c
@@ -58,12 +58,14 @@ static bool acpi_watchdog_uses_rtc(const struct acpi_table_wdat *wdat)
 }
 #endif
 
+static bool acpi_no_watchdog;
+
 static const struct acpi_table_wdat *acpi_watchdog_get_wdat(void)
 {
 	const struct acpi_table_wdat *wdat = NULL;
 	acpi_status status;
 
-	if (acpi_disabled)
+	if (acpi_disabled || acpi_no_watchdog)
 		return NULL;
 
 	status = acpi_get_table(ACPI_SIG_WDAT, 0,
@@ -91,6 +93,14 @@ bool acpi_has_watchdog(void)
 }
 EXPORT_SYMBOL_GPL(acpi_has_watchdog);
 
+/* ACPI watchdog can be disabled on boot command line */
+static int __init disable_acpi_watchdog(char *str)
+{
+	acpi_no_watchdog = true;
+	return 1;
+}
+__setup("acpi_no_watchdog", disable_acpi_watchdog);
+
 void __init acpi_watchdog_init(void)
 {
 	const struct acpi_wdat_entry *entries;
-- 
2.20.1

