Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA124376AC7
	for <lists+linux-doc@lfdr.de>; Fri,  7 May 2021 21:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhEGTlc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 May 2021 15:41:32 -0400
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:31175 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbhEGTlb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 May 2021 15:41:31 -0400
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id B06C41AA2757
        for <linux-doc@vger.kernel.org>; Fri,  7 May 2021 21:40:28 +0200 (CEST)
Received: from s499.loopia.se (unknown [172.22.191.6])
        by s807.loopia.se (Postfix) with ESMTP id A09172E36757;
        Fri,  7 May 2021 21:40:28 +0200 (CEST)
Received: from s898.loopia.se (unknown [172.22.191.6])
        by s499.loopia.se (Postfix) with ESMTP id 9B1AD1CE61DF;
        Fri,  7 May 2021 21:40:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level: 
X-Spam-Status: No, score=-1 tagged_above=-999 required=6.2
        tests=[ALL_TRUSTED=-1] autolearn=disabled
Received: from s645.loopia.se ([172.22.191.6])
        by s898.loopia.se (s898.loopia.se [172.22.190.17]) (amavisd-new, port 10024)
        with LMTP id enOMCyl4eEO3; Fri,  7 May 2021 21:40:28 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 155.4.133.180
Received: from localhost.localdomain (h-155-4-133-180.NA.cust.bahnhof.se [155.4.133.180])
        (Authenticated sender: carl@hgsystem.se)
        by s645.loopia.se (Postfix) with ESMTPSA id C23EF157A04C;
        Fri,  7 May 2021 21:40:27 +0200 (CEST)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH v2 1/3] hwmon: (pmbus) Add new flag PMBUS_READ_STATUS_AFTER_FAILED_CHECK
Date:   Fri,  7 May 2021 21:40:21 +0200
Message-Id: <20210507194023.61138-2-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
In-Reply-To: <20210507194023.61138-1-erik.rosen@metormote.com>
References: <20210507194023.61138-1-erik.rosen@metormote.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some PMBus chips end up in an undefined state when trying to read an
unsupported register. For such chips, it is necessary to reset the
chip pmbus controller to a known state after a failed register check.
This can be done by reading a known register. By setting this flag the
driver will try to read the STATUS register after each failed
register check. This read may fail, but it will put the chip into a
known state.

Signed-off-by: Erik Rosen <erik.rosen@metormote.com>
---
 drivers/hwmon/pmbus/pmbus_core.c |  2 ++
 include/linux/pmbus.h            | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index aadea85fe630..cb0b3c7c3434 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -512,6 +512,8 @@ static bool pmbus_check_register(struct i2c_client *client,
 	rv = func(client, page, reg);
 	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
 		rv = pmbus_check_status_cml(client);
+	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
+		data->read_status(client, -1);
 	pmbus_clear_fault_page(client, -1);
 	return rv >= 0;
 }
diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index 12cbbf305969..edd7c84fef65 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -43,6 +43,19 @@
  */
 #define PMBUS_NO_CAPABILITY			BIT(2)
 
+/*
+ * PMBUS_READ_STATUS_AFTER_FAILED_CHECK
+ *
+ * Some PMBus chips end up in an undefined state when trying to read an
+ * unsupported register. For such chips, it is necessary to reset the
+ * chip pmbus controller to a known state after a failed register check.
+ * This can be done by reading a known register. By setting this flag the
+ * driver will try to read the STATUS register after each failed
+ * register check. This read may fail, but it will put the chip in a
+ * known state.
+ */
+#define PMBUS_READ_STATUS_AFTER_FAILED_CHECK	BIT(3)
+
 struct pmbus_platform_data {
 	u32 flags;		/* Device specific flags */
 
-- 
2.20.1

