Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E77B397846
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jun 2021 18:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbhFAQpk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Jun 2021 12:45:40 -0400
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:14604 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbhFAQpj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Jun 2021 12:45:39 -0400
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 291F62E63F65
        for <linux-doc@vger.kernel.org>; Tue,  1 Jun 2021 18:43:57 +0200 (CEST)
Received: from s899.loopia.se (unknown [172.22.191.5])
        by s807.loopia.se (Postfix) with ESMTP id 190CD2E2C68A;
        Tue,  1 Jun 2021 18:43:57 +0200 (CEST)
Received: from s474.loopia.se (unknown [172.22.191.6])
        by s899.loopia.se (Postfix) with ESMTP id 148CF2C8B9C7;
        Tue,  1 Jun 2021 18:43:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1 tagged_above=-999 required=6.2
        tests=[ALL_TRUSTED=-1] autolearn=disabled
Received: from s645.loopia.se ([172.22.191.6])
        by s474.loopia.se (s474.loopia.se [172.22.190.14]) (amavisd-new, port 10024)
        with LMTP id uydlwNniE59e; Tue,  1 Jun 2021 18:43:56 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 178.28.230.104
Received: from localhost.localdomain (c-b21ce668-74736162.cust.telenor.se [178.28.230.104])
        (Authenticated sender: carl@hgsystem.se)
        by s645.loopia.se (Postfix) with ESMTPSA id EB66A1579FDE;
        Tue,  1 Jun 2021 18:43:55 +0200 (CEST)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Nilsson <daniel.nilsson@flex.com>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH v4 1/5] hwmon: (pmbus/pim4328) Add new pmbus flag NO_WRITE_PROTECT
Date:   Tue,  1 Jun 2021 18:43:16 +0200
Message-Id: <20210601164320.2907-2-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
In-Reply-To: <20210601164320.2907-1-erik.rosen@metormote.com>
References: <20210601164320.2907-1-erik.rosen@metormote.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some PMBus chips respond with invalid data when reading the WRITE_PROTECT
register. For such chips, this flag should be set so that the PMBus core
driver doesn't use the WRITE_PROTECT command to determine it's behavior.

Signed-off-by: Erik Rosen <erik.rosen@metormote.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 9 ++++++---
 include/linux/pmbus.h            | 9 +++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index bbd745178147..cb885efc4fba 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2226,9 +2226,12 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * faults, and we should not try it. Also, in that case, writes into
 	 * limit registers need to be disabled.
 	 */
-	ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
-	if (ret > 0 && (ret & PB_WP_ANY))
-		data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
+	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
+		ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
+		if (ret > 0 && (ret & PB_WP_ANY))
+			data->flags |= PMBUS_WRITE_PROTECTED
+				    | PMBUS_SKIP_STATUS_CHECK;
+	}
 
 	if (data->info->pages)
 		pmbus_clear_faults(client);
diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index 12cbbf305969..f720470b1bab 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -43,6 +43,15 @@
  */
 #define PMBUS_NO_CAPABILITY			BIT(2)
 
+/*
+ * PMBUS_NO_WRITE_PROTECT
+ *
+ * Some PMBus chips respond with invalid data when reading the WRITE_PROTECT
+ * register. For such chips, this flag should be set so that the PMBus core
+ * driver doesn't use the WRITE_PROTECT command to determine it's behavior.
+ */
+#define PMBUS_NO_WRITE_PROTECT			BIT(4)
+
 struct pmbus_platform_data {
 	u32 flags;		/* Device specific flags */
 
-- 
2.20.1

