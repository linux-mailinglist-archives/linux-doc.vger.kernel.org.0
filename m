Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C3F58F49
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jun 2019 02:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfF1Aug (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jun 2019 20:50:36 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40603 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfF1Aug (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 20:50:36 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so2056961pfp.7
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 17:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uWbPzKYCDNGy8Er4o5bWvuJxqg1RSoPPkQ8WvonaDvc=;
        b=uN/h9H2fGDSf7otfsXWjVPpN/EY25eOzDmb9hJBv65az+OUQJ7PHzaun4IfH8D5d+F
         EU64frnk1ZqzLuitKWufnNddmWG5QwDtzi0FivRMbXhpwycU/m5YadluL7kKzKwfvJON
         5zddaAxPV7SpT6v8jYZhkPoGZQ+dtIy4XJFTG6Xk1Y8unycdxBH4wUxRQrtjY/dTxd8S
         584kQcCUCOfRcjlyW07Q62N8ymfEB4UeWPn9C9JdrVMeW+DDcR+sow5BBpqsi+tcRzfl
         cz+lYB/R2a0CK+vNUEoGm6nHABbc5CQNx28I5WzgJvahRdwNvxUyAUGj3sYDl8Ez3Ddv
         MdzA==
X-Gm-Message-State: APjAAAUB3cAPo6UIgIcJydA3h/ELWdJXOheF+ryMPtTUzi50qjLLaYqG
        X/bgRs/2/6i/tIY8u5gJyE7XvA==
X-Google-Smtp-Source: APXvYqxECrnzsRtmHWaiehXEleoTA4NfQIYx5NY2gibUNpnlWaWjA2wpZAnoYi7xmLdag7V1ULTifg==
X-Received: by 2002:a17:90a:2023:: with SMTP id n32mr9194313pjc.3.1561683035419;
        Thu, 27 Jun 2019 17:50:35 -0700 (PDT)
Received: from localhost (c-76-21-109-208.hsd1.ca.comcast.net. [76.21.109.208])
        by smtp.gmail.com with ESMTPSA id n26sm276866pfa.83.2019.06.27.17.50.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 17:50:34 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     linux-fpga@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Wu Hao <hao.wu@intel.com>,
        Ananda Ravuri <ananda.ravuri@intel.com>,
        Russ Weight <russell.h.weight@intel.com>,
        Xu Yilun <yilun.xu@intel.com>, Alan Tull <atull@kernel.org>,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 09/15] fpga: dfl: afu: add userclock sysfs interfaces.
Date:   Thu, 27 Jun 2019 17:49:45 -0700
Message-Id: <20190628004951.6202-10-mdf@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190628004951.6202-1-mdf@kernel.org>
References: <20190628004951.6202-1-mdf@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wu Hao <hao.wu@intel.com>

This patch introduces userclock sysfs interfaces for AFU, user
could use these interfaces for clock setting to AFU.

Please note that, this is only working for port header feature
with revision 0, for later revisions, userclock setting is moved
to a separated private feature, so one revision sysfs interface
is exposed to userspace application for this purpose too.

Signed-off-by: Ananda Ravuri <ananda.ravuri@intel.com>
Signed-off-by: Russ Weight <russell.h.weight@intel.com>
Signed-off-by: Xu Yilun <yilun.xu@intel.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Acked-by: Alan Tull <atull@kernel.org>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 .../ABI/testing/sysfs-platform-dfl-port       |  35 ++++++
 drivers/fpga/dfl-afu-main.c                   | 113 +++++++++++++++++-
 drivers/fpga/dfl.h                            |   4 +
 3 files changed, 151 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-dfl-port b/Documentation/ABI/testing/sysfs-platform-dfl-port
index 17b37d110618..04ea7f2971c7 100644
--- a/Documentation/ABI/testing/sysfs-platform-dfl-port
+++ b/Documentation/ABI/testing/sysfs-platform-dfl-port
@@ -44,3 +44,38 @@ Contact:	Wu Hao <hao.wu@intel.com>
 Description:	Read-write. Read and set AFU latency tolerance reporting value.
 		Set ltr to 1 if the AFU can tolerate latency >= 40us or set it
 		to 0 if it is latency sensitive.
+
+What:		/sys/bus/platform/devices/dfl-port.0/revision
+Date:		June 2019
+KernelVersion:	5.3
+Contact:	Wu Hao <hao.wu@intel.com>
+Description:	Read-only. Read this file to get the revision of port header
+		feature.
+
+What:		/sys/bus/platform/devices/dfl-port.0/userclk_freqcmd
+Date:		June 2019
+KernelVersion:	5.3
+Contact:	Wu Hao <hao.wu@intel.com>
+Description:	Write-only. User writes command to this interface to set
+		userclock to AFU.
+
+What:		/sys/bus/platform/devices/dfl-port.0/userclk_freqsts
+Date:		June 2019
+KernelVersion:	5.3
+Contact:	Wu Hao <hao.wu@intel.com>
+Description:	Read-only. Read this file to get the status of issued command
+		to userclck_freqcmd.
+
+What:		/sys/bus/platform/devices/dfl-port.0/userclk_freqcntrcmd
+Date:		June 2019
+KernelVersion:	5.3
+Contact:	Wu Hao <hao.wu@intel.com>
+Description:	Write-only. User writes command to this interface to set
+		userclock counter.
+
+What:		/sys/bus/platform/devices/dfl-port.0/userclk_freqcntrsts
+Date:		June 2019
+KernelVersion:	5.3
+Contact:	Wu Hao <hao.wu@intel.com>
+Description:	Read-only. Read this file to get the status of issued command
+		to userclck_freqcntrcmd.
diff --git a/drivers/fpga/dfl-afu-main.c b/drivers/fpga/dfl-afu-main.c
index 040ed8ad16e5..8b434a405498 100644
--- a/drivers/fpga/dfl-afu-main.c
+++ b/drivers/fpga/dfl-afu-main.c
@@ -143,6 +143,17 @@ id_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(id);
 
+static ssize_t
+revision_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	void __iomem *base;
+
+	base = dfl_get_feature_ioaddr_by_id(dev, PORT_FEATURE_ID_HEADER);
+
+	return sprintf(buf, "%x\n", dfl_feature_revision(base));
+}
+static DEVICE_ATTR_RO(revision);
+
 static ssize_t
 ltr_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -278,6 +289,7 @@ static DEVICE_ATTR_RO(power_state);
 
 static const struct attribute *port_hdr_attrs[] = {
 	&dev_attr_id.attr,
+	&dev_attr_revision.attr,
 	&dev_attr_ltr.attr,
 	&dev_attr_ap1_event.attr,
 	&dev_attr_ap2_event.attr,
@@ -285,14 +297,112 @@ static const struct attribute *port_hdr_attrs[] = {
 	NULL,
 };
 
+static ssize_t
+userclk_freqcmd_store(struct device *dev, struct device_attribute *attr,
+		      const char *buf, size_t count)
+{
+	struct dfl_feature_platform_data *pdata = dev_get_platdata(dev);
+	u64 userclk_freq_cmd;
+	void __iomem *base;
+
+	if (kstrtou64(buf, 0, &userclk_freq_cmd))
+		return -EINVAL;
+
+	base = dfl_get_feature_ioaddr_by_id(dev, PORT_FEATURE_ID_HEADER);
+
+	mutex_lock(&pdata->lock);
+	writeq(userclk_freq_cmd, base + PORT_HDR_USRCLK_CMD0);
+	mutex_unlock(&pdata->lock);
+
+	return count;
+}
+static DEVICE_ATTR_WO(userclk_freqcmd);
+
+static ssize_t
+userclk_freqcntrcmd_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct dfl_feature_platform_data *pdata = dev_get_platdata(dev);
+	u64 userclk_freqcntr_cmd;
+	void __iomem *base;
+
+	if (kstrtou64(buf, 0, &userclk_freqcntr_cmd))
+		return -EINVAL;
+
+	base = dfl_get_feature_ioaddr_by_id(dev, PORT_FEATURE_ID_HEADER);
+
+	mutex_lock(&pdata->lock);
+	writeq(userclk_freqcntr_cmd, base + PORT_HDR_USRCLK_CMD1);
+	mutex_unlock(&pdata->lock);
+
+	return count;
+}
+static DEVICE_ATTR_WO(userclk_freqcntrcmd);
+
+static ssize_t
+userclk_freqsts_show(struct device *dev, struct device_attribute *attr,
+		     char *buf)
+{
+	u64 userclk_freqsts;
+	void __iomem *base;
+
+	base = dfl_get_feature_ioaddr_by_id(dev, PORT_FEATURE_ID_HEADER);
+
+	userclk_freqsts = readq(base + PORT_HDR_USRCLK_STS0);
+
+	return sprintf(buf, "0x%llx\n", (unsigned long long)userclk_freqsts);
+}
+static DEVICE_ATTR_RO(userclk_freqsts);
+
+static ssize_t
+userclk_freqcntrsts_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	u64 userclk_freqcntrsts;
+	void __iomem *base;
+
+	base = dfl_get_feature_ioaddr_by_id(dev, PORT_FEATURE_ID_HEADER);
+
+	userclk_freqcntrsts = readq(base + PORT_HDR_USRCLK_STS1);
+
+	return sprintf(buf, "0x%llx\n",
+		       (unsigned long long)userclk_freqcntrsts);
+}
+static DEVICE_ATTR_RO(userclk_freqcntrsts);
+
+static const struct attribute *port_hdr_userclk_attrs[] = {
+	&dev_attr_userclk_freqcmd.attr,
+	&dev_attr_userclk_freqcntrcmd.attr,
+	&dev_attr_userclk_freqsts.attr,
+	&dev_attr_userclk_freqcntrsts.attr,
+	NULL,
+};
+
 static int port_hdr_init(struct platform_device *pdev,
 			 struct dfl_feature *feature)
 {
+	int ret;
+
 	dev_dbg(&pdev->dev, "PORT HDR Init.\n");
 
 	port_reset(pdev);
 
-	return sysfs_create_files(&pdev->dev.kobj, port_hdr_attrs);
+	ret = sysfs_create_files(&pdev->dev.kobj, port_hdr_attrs);
+	if (ret)
+		return ret;
+
+	/*
+	 * if revision > 0, the userclock will be moved from port hdr register
+	 * region to a separated private feature.
+	 */
+	if (dfl_feature_revision(feature->ioaddr) > 0)
+		return 0;
+
+	ret = sysfs_create_files(&pdev->dev.kobj, port_hdr_userclk_attrs);
+	if (ret)
+		sysfs_remove_files(&pdev->dev.kobj, port_hdr_attrs);
+
+	return ret;
 }
 
 static void port_hdr_uinit(struct platform_device *pdev,
@@ -300,6 +410,7 @@ static void port_hdr_uinit(struct platform_device *pdev,
 {
 	dev_dbg(&pdev->dev, "PORT HDR UInit.\n");
 
+	sysfs_remove_files(&pdev->dev.kobj, port_hdr_userclk_attrs);
 	sysfs_remove_files(&pdev->dev.kobj, port_hdr_attrs);
 }
 
diff --git a/drivers/fpga/dfl.h b/drivers/fpga/dfl.h
index 1525098b8260..3c5dc3a13b0b 100644
--- a/drivers/fpga/dfl.h
+++ b/drivers/fpga/dfl.h
@@ -120,6 +120,10 @@
 #define PORT_HDR_CAP		0x30
 #define PORT_HDR_CTRL		0x38
 #define PORT_HDR_STS		0x40
+#define PORT_HDR_USRCLK_CMD0	0x50
+#define PORT_HDR_USRCLK_CMD1	0x58
+#define PORT_HDR_USRCLK_STS0	0x60
+#define PORT_HDR_USRCLK_STS1	0x68
 
 /* Port Capability Register Bitfield */
 #define PORT_CAP_PORT_NUM	GENMASK_ULL(1, 0)	/* ID of this port */
-- 
2.22.0

