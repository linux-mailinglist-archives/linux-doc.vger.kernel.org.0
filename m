Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A16935928C
	for <lists+linux-doc@lfdr.de>; Fri,  9 Apr 2021 05:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbhDIDJY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 8 Apr 2021 23:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbhDIDJW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 23:09:22 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A14C061760;
        Thu,  8 Apr 2021 20:09:09 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id q3so4502714qkq.12;
        Thu, 08 Apr 2021 20:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sUg+qQ2naPK41eFG+uLo1X841jilOQ0/5sOtlHaDPZI=;
        b=sJzRge/vng3nm0ztAJCYD4SodCovKOQ6mMj1tTJ3o5LzLAccii1xaNxZz0N8PX0rr5
         t+ujD8QFh8uUlUljimN+rLpV7BG3y2hs9Piqp+C3akxa5xNNK8rPAQejJJ3u4CQu4fVU
         PTAH4pvqymqzVY/9h9QLmHn/BGTKR1p8G9uoC4NlyJ70nOqnIJ3ZnzkZN0Hdij94flsp
         HrMxkmZcJf6jPsur+ZH85mk1MQpOm/GVqWqnV7O2IFB2DbLqM0NG5U7B8cMuD2xPLS4c
         rkTLc7w+3yDpmfIYNuD9f5qTKAmqrWNmfMpAqIN/C7to2RiaF8/j+nDKyVI+w7lXWwHp
         WMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sUg+qQ2naPK41eFG+uLo1X841jilOQ0/5sOtlHaDPZI=;
        b=CNidOqYZKACtGVYP0YOjsv64zAT1JCLbvAAPJ4ygWD6E1E/lW8oxqiHTABadg1uwJm
         2tX/oXdTr1pxLmdBed2awiBluUx9Xzevh4CST8u34CwbAuMCfp7Xcj3VwXskKYrKNdeL
         N6Q+dMtep2JI9AIViGLh0gH2GfDzugURM05nFafo5uHDk6Zi6yCUJ3fkb0SUBwXmf8Wm
         JW9ZHJm4+CU7UTPFYndFLyALlyBVPpwQLsEIg2NssnoGRUz26QNY6yjImSEuPeTOxnfj
         tcQEUdy/GDCnUyNQU9MLyoww5t9YcPaoD/f6ICZxHKI5ZoEQSemz9aNbE5c9OY/PYj4b
         K/PQ==
X-Gm-Message-State: AOAM530csvmX4dk2DftXWcri0LLGzJhWT5CTHKcIQ9IdpVBH0qBKE1vT
        AMLI9FP+9WpdZ+2uEVWL5vg=
X-Google-Smtp-Source: ABdhPJw0aRZgbOgsQjWI8e55R5cur7OcMs0kd22WRz+HQtYXrSHh1zx7obsuJ+1QkQ6DwJ16bfCeDg==
X-Received: by 2002:a37:7745:: with SMTP id s66mr11593524qkc.18.1617937749025;
        Thu, 08 Apr 2021 20:09:09 -0700 (PDT)
Received: from LuizSampaio-PC.localdomain ([2804:14d:5c21:af45:3b27:576c:7dde:37f1])
        by smtp.gmail.com with ESMTPSA id c5sm925408qkl.21.2021.04.08.20.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:09:08 -0700 (PDT)
From:   Luiz Sampaio <sampaio.ime@gmail.com>
To:     zbr@ioremap.net
Cc:     corbet@lwn.net, rikard.falkeborn@gmail.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luiz Sampaio <sampaio.ime@gmail.com>
Subject: [PATCH v5 5/6] w1: ds2438: adding support for reading page1
Date:   Fri,  9 Apr 2021 00:09:41 -0300
Message-Id: <20210409030942.441830-6-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210409030942.441830-1-sampaio.ime@gmail.com>
References: <20210405105009.420924-1-sampaio.ime@gmail.com>
 <20210409030942.441830-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Added a sysfs entry to support reading the page1 registers. This registers
contain Elapsed Time Meter (ETM) data, which shows for how long the chip is
on, as well as an Offset Register data, which can be used to calibrate the
current measurement of the chip.

Signed-off-by: Luiz Sampaio <sampaio.ime@gmail.com>
---
 .../ABI/stable/sysfs-driver-w1_ds2438         |  6 +++
 Documentation/w1/slaves/w1_ds2438.rst         |  8 ++++
 drivers/w1/slaves/w1_ds2438.c                 | 41 +++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-w1_ds2438

diff --git a/Documentation/ABI/stable/sysfs-driver-w1_ds2438 b/Documentation/ABI/stable/sysfs-driver-w1_ds2438
new file mode 100644
index 000000000000..fa47437c11d9
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-w1_ds2438
@@ -0,0 +1,6 @@
+What:		/sys/bus/w1/devices/.../page1
+Date:		April 2021
+Contact:	Luiz Sampaio <sampaio.ime@gmail.com>
+Description:	read the contents of the page1 of the DS2438
+		see Documentation/w1/slaves/w1_ds2438.rst for detailed information
+Users:		any user space application which wants to communicate with DS2438
diff --git a/Documentation/w1/slaves/w1_ds2438.rst b/Documentation/w1/slaves/w1_ds2438.rst
index a29309a3f8e5..ac8d0d4b0d0e 100644
--- a/Documentation/w1/slaves/w1_ds2438.rst
+++ b/Documentation/w1/slaves/w1_ds2438.rst
@@ -44,6 +44,14 @@ Internally when this file is read, the additional CRC byte is also obtained
 from the slave device. If it is correct, the 8 bytes page data are passed
 to userspace, otherwise an I/O error is returned.
 
+"page1"
+-------
+This file provides full 8 bytes of the chip Page 1 (01h).
+This page contains the ICA, elapsed time meter and current offset data of the DS2438.
+Internally when this file is read, the additional CRC byte is also obtained
+from the slave device. If it is correct, the 8 bytes page data are passed
+to userspace, otherwise an I/O error is returned.
+
 "temperature"
 -------------
 Opening and reading this file initiates the CONVERT_T (temperature conversion)
diff --git a/drivers/w1/slaves/w1_ds2438.c b/drivers/w1/slaves/w1_ds2438.c
index ef6217ecb1cb..2cfdfedb584f 100644
--- a/drivers/w1/slaves/w1_ds2438.c
+++ b/drivers/w1/slaves/w1_ds2438.c
@@ -49,6 +49,15 @@
 #define DS2438_CURRENT_MSB		0x06
 #define DS2438_THRESHOLD		0x07
 
+/* Page #1 definitions */
+#define DS2438_ETM_0			0x00
+#define DS2438_ETM_1			0x01
+#define DS2438_ETM_2			0x02
+#define DS2438_ETM_3			0x03
+#define DS2438_ICA			0x04
+#define DS2438_OFFSET_LSB		0x05
+#define DS2438_OFFSET_MSB		0x06
+
 static int w1_ds2438_get_page(struct w1_slave *sl, int pageno, u8 *buf)
 {
 	unsigned int retries = W1_DS2438_RETRIES;
@@ -325,6 +334,36 @@ static ssize_t page0_read(struct file *filp, struct kobject *kobj,
 	return ret;
 }
 
+static ssize_t page1_read(struct file *filp, struct kobject *kobj,
+			  struct bin_attribute *bin_attr, char *buf,
+			  loff_t off, size_t count)
+{
+	struct w1_slave *sl = kobj_to_w1_slave(kobj);
+	int ret;
+	u8 w1_buf[DS2438_PAGE_SIZE + 1 /*for CRC*/];
+
+	if (off != 0)
+		return 0;
+	if (!buf)
+		return -EINVAL;
+
+	mutex_lock(&sl->master->bus_mutex);
+
+	/* Read no more than page1 size */
+	if (count > DS2438_PAGE_SIZE)
+		count = DS2438_PAGE_SIZE;
+
+	if (w1_ds2438_get_page(sl, 1, w1_buf) == 0) {
+		memcpy(buf, &w1_buf, count);
+		ret = count;
+	} else
+		ret = -EIO;
+
+	mutex_unlock(&sl->master->bus_mutex);
+
+	return ret;
+}
+
 static ssize_t temperature_read(struct file *filp, struct kobject *kobj,
 				struct bin_attribute *bin_attr, char *buf,
 				loff_t off, size_t count)
@@ -390,6 +429,7 @@ static ssize_t vdd_read(struct file *filp, struct kobject *kobj,
 
 static BIN_ATTR(iad, 0664, iad_write, 0);
 static BIN_ATTR_RO(page0, DS2438_PAGE_SIZE);
+static BIN_ATTR_RO(page1, DS2438_PAGE_SIZE);
 static BIN_ATTR_RO(temperature, 0/* real length varies */);
 static BIN_ATTR_RO(vad, 0/* real length varies */);
 static BIN_ATTR_RO(vdd, 0/* real length varies */);
@@ -397,6 +437,7 @@ static BIN_ATTR_RO(vdd, 0/* real length varies */);
 static struct bin_attribute *w1_ds2438_bin_attrs[] = {
 	&bin_attr_iad,
 	&bin_attr_page0,
+	&bin_attr_page1,
 	&bin_attr_temperature,
 	&bin_attr_vad,
 	&bin_attr_vdd,
-- 
2.30.1

