Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2114D58F64
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jun 2019 02:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfF1AvT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jun 2019 20:51:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41110 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfF1Au2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 20:50:28 -0400
Received: by mail-pf1-f195.google.com with SMTP id m30so2052851pff.8
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 17:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zinHmMOF0ezX8C5q3Fql37o3uQEnFt8vpcBRTtBr4tY=;
        b=U8ERe4kdBr1TMGBE01iNbQJmqOoF1YktKcxag4Q+ZLnblYGLJfCPbrSSC6I2G1gPfp
         thI4aJXe5RpSOtVV4vZxj40pR1KRla6hMHLPhAqm3pDzsfN/+QBT75x5DVuJV/0mbLnJ
         4GntHh5PzItYFnPhz508enHHl+5jNufHs/e9iEjbuIybjk+k6I+keyf/DuwQbrCa/COU
         RZPiU6LeZxko2TWEAWj4jcAHUNOs9gmU2tJ1osLutIX/a7sHyI25cVNSJ1gx75NF3Thu
         yVgn79IoY/M/08T+isT4DZNuLp+/VaV+BEjLdNmEQmAyRF9Dj+h3CDeJvXeAI9gRiQ95
         fbxg==
X-Gm-Message-State: APjAAAULdZHTFKXG7EOJlApW0nYssTvGoxeKHraorTd4jYa0c/OY9mLw
        h5nIjZnqIs/ywcwkv0UjTeweKA==
X-Google-Smtp-Source: APXvYqwuuaIB0MC1k0ECwh0hD4bxkF13oZnEdehjeG+jOhmu7okUfUV9CodhCpodxWovH9ZcoVxwxA==
X-Received: by 2002:a63:4404:: with SMTP id r4mr6428810pga.245.1561683027874;
        Thu, 27 Jun 2019 17:50:27 -0700 (PDT)
Received: from localhost (c-76-21-109-208.hsd1.ca.comcast.net. [76.21.109.208])
        by smtp.gmail.com with ESMTPSA id f14sm280233pfn.53.2019.06.27.17.50.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 17:50:26 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     linux-fpga@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Wu Hao <hao.wu@intel.com>, Zhang Yi Z <yi.z.zhang@intel.com>,
        Xu Yilun <yilun.xu@intel.com>, Alan Tull <atull@kernel.org>,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 06/15] fpga: dfl: fme: add DFL_FPGA_FME_PORT_RELEASE/ASSIGN ioctl support.
Date:   Thu, 27 Jun 2019 17:49:42 -0700
Message-Id: <20190628004951.6202-7-mdf@kernel.org>
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

In order to support virtualization usage via PCIe SRIOV, this patch
adds two ioctls under FPGA Management Engine (FME) to release and
assign back the port device. In order to safely turn Port from PF
into VF and enable PCIe SRIOV, it requires user to invoke this
PORT_RELEASE ioctl to release port firstly to remove userspace
interfaces, and then configure the PF/VF access register in FME.
After disable SRIOV, it requires user to invoke this PORT_ASSIGN
ioctl to attach the port back to PF.

 Ioctl interfaces:
 * DFL_FPGA_FME_PORT_RELEASE
   Release platform device of given port, it deletes port platform
   device to remove related userspace interfaces on PF, then
   configures PF/VF access mode to VF.

 * DFL_FPGA_FME_PORT_ASSIGN
   Assign platform device of given port back to PF, it configures
   PF/VF access mode to PF, then adds port platform device back to
   re-enable related userspace interfaces on PF.

Signed-off-by: Zhang Yi Z <yi.z.zhang@intel.com>
Signed-off-by: Xu Yilun <yilun.xu@intel.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Acked-by: Alan Tull <atull@kernel.org>
Acked-by: Moritz Fischer <mdf@kernel.org>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/fpga/dfl-fme-main.c   |  54 +++++++++++++++++
 drivers/fpga/dfl.c            | 107 ++++++++++++++++++++++++++++++----
 drivers/fpga/dfl.h            |  10 ++++
 include/uapi/linux/fpga-dfl.h |  32 ++++++++++
 4 files changed, 191 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/dfl-fme-main.c b/drivers/fpga/dfl-fme-main.c
index 076d74f6416d..8b2a33760483 100644
--- a/drivers/fpga/dfl-fme-main.c
+++ b/drivers/fpga/dfl-fme-main.c
@@ -16,6 +16,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/uaccess.h>
 #include <linux/fpga-dfl.h>
 
 #include "dfl.h"
@@ -105,9 +106,62 @@ static void fme_hdr_uinit(struct platform_device *pdev,
 	sysfs_remove_files(&pdev->dev.kobj, fme_hdr_attrs);
 }
 
+static long fme_hdr_ioctl_release_port(struct dfl_feature_platform_data *pdata,
+				       void __user *arg)
+{
+	struct dfl_fpga_cdev *cdev = pdata->dfl_cdev;
+	struct dfl_fpga_fme_port_release release;
+	unsigned long minsz;
+
+	minsz = offsetofend(struct dfl_fpga_fme_port_release, port_id);
+
+	if (copy_from_user(&release, arg, minsz))
+		return -EFAULT;
+
+	if (release.argsz < minsz || release.flags)
+		return -EINVAL;
+
+	return dfl_fpga_cdev_config_port(cdev, release.port_id, true);
+}
+
+static long fme_hdr_ioctl_assign_port(struct dfl_feature_platform_data *pdata,
+				      void __user *arg)
+{
+	struct dfl_fpga_cdev *cdev = pdata->dfl_cdev;
+	struct dfl_fpga_fme_port_assign assign;
+	unsigned long minsz;
+
+	minsz = offsetofend(struct dfl_fpga_fme_port_assign, port_id);
+
+	if (copy_from_user(&assign, arg, minsz))
+		return -EFAULT;
+
+	if (assign.argsz < minsz || assign.flags)
+		return -EINVAL;
+
+	return dfl_fpga_cdev_config_port(cdev, assign.port_id, false);
+}
+
+static long fme_hdr_ioctl(struct platform_device *pdev,
+			  struct dfl_feature *feature,
+			  unsigned int cmd, unsigned long arg)
+{
+	struct dfl_feature_platform_data *pdata = dev_get_platdata(&pdev->dev);
+
+	switch (cmd) {
+	case DFL_FPGA_FME_PORT_RELEASE:
+		return fme_hdr_ioctl_release_port(pdata, (void __user *)arg);
+	case DFL_FPGA_FME_PORT_ASSIGN:
+		return fme_hdr_ioctl_assign_port(pdata, (void __user *)arg);
+	}
+
+	return -ENODEV;
+}
+
 static const struct dfl_feature_ops fme_hdr_ops = {
 	.init = fme_hdr_init,
 	.uinit = fme_hdr_uinit,
+	.ioctl = fme_hdr_ioctl,
 };
 
 static struct dfl_feature_driver fme_feature_drvs[] = {
diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
index 4b66aaa32b5a..308c80868af4 100644
--- a/drivers/fpga/dfl.c
+++ b/drivers/fpga/dfl.c
@@ -231,16 +231,20 @@ EXPORT_SYMBOL_GPL(dfl_fpga_port_ops_del);
  */
 int dfl_fpga_check_port_id(struct platform_device *pdev, void *pport_id)
 {
-	struct dfl_fpga_port_ops *port_ops = dfl_fpga_port_ops_get(pdev);
-	int port_id;
+	struct dfl_feature_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	struct dfl_fpga_port_ops *port_ops;
+
+	if (pdata->id != FEATURE_DEV_ID_UNUSED)
+		return pdata->id == *(int *)pport_id;
 
+	port_ops = dfl_fpga_port_ops_get(pdev);
 	if (!port_ops || !port_ops->get_id)
 		return 0;
 
-	port_id = port_ops->get_id(pdev);
+	pdata->id = port_ops->get_id(pdev);
 	dfl_fpga_port_ops_put(port_ops);
 
-	return port_id == *(int *)pport_id;
+	return pdata->id == *(int *)pport_id;
 }
 EXPORT_SYMBOL_GPL(dfl_fpga_check_port_id);
 
@@ -474,6 +478,7 @@ static int build_info_commit_dev(struct build_feature_devs_info *binfo)
 	pdata->dev = fdev;
 	pdata->num = binfo->feature_num;
 	pdata->dfl_cdev = binfo->cdev;
+	pdata->id = FEATURE_DEV_ID_UNUSED;
 	mutex_init(&pdata->lock);
 	lockdep_set_class_and_name(&pdata->lock, &dfl_pdata_keys[type],
 				   dfl_pdata_key_strings[type]);
@@ -973,25 +978,27 @@ void dfl_fpga_feature_devs_remove(struct dfl_fpga_cdev *cdev)
 {
 	struct dfl_feature_platform_data *pdata, *ptmp;
 
-	remove_feature_devs(cdev);
-
 	mutex_lock(&cdev->lock);
-	if (cdev->fme_dev) {
-		/* the fme should be unregistered. */
-		WARN_ON(device_is_registered(cdev->fme_dev));
+	if (cdev->fme_dev)
 		put_device(cdev->fme_dev);
-	}
 
 	list_for_each_entry_safe(pdata, ptmp, &cdev->port_dev_list, node) {
 		struct platform_device *port_dev = pdata->dev;
 
-		/* the port should be unregistered. */
-		WARN_ON(device_is_registered(&port_dev->dev));
+		/* remove released ports */
+		if (!device_is_registered(&port_dev->dev)) {
+			dfl_id_free(feature_dev_id_type(port_dev),
+				    port_dev->id);
+			platform_device_put(port_dev);
+		}
+
 		list_del(&pdata->node);
 		put_device(&port_dev->dev);
 	}
 	mutex_unlock(&cdev->lock);
 
+	remove_feature_devs(cdev);
+
 	fpga_region_unregister(cdev->region);
 	devm_kfree(cdev->parent, cdev);
 }
@@ -1029,6 +1036,82 @@ __dfl_fpga_cdev_find_port(struct dfl_fpga_cdev *cdev, void *data,
 }
 EXPORT_SYMBOL_GPL(__dfl_fpga_cdev_find_port);
 
+static int attach_port_dev(struct dfl_fpga_cdev *cdev, u32 port_id)
+{
+	struct platform_device *port_pdev;
+	int ret = -ENODEV;
+
+	mutex_lock(&cdev->lock);
+	port_pdev = __dfl_fpga_cdev_find_port(cdev, &port_id,
+					      dfl_fpga_check_port_id);
+	if (!port_pdev)
+		goto unlock_exit;
+
+	if (device_is_registered(&port_pdev->dev)) {
+		ret = -EBUSY;
+		goto put_dev_exit;
+	}
+
+	ret = platform_device_add(port_pdev);
+	if (ret)
+		goto put_dev_exit;
+
+	dfl_feature_dev_use_end(dev_get_platdata(&port_pdev->dev));
+	cdev->released_port_num--;
+put_dev_exit:
+	put_device(&port_pdev->dev);
+unlock_exit:
+	mutex_unlock(&cdev->lock);
+	return ret;
+}
+
+static int detach_port_dev(struct dfl_fpga_cdev *cdev, u32 port_id)
+{
+	struct platform_device *port_pdev;
+	int ret = -ENODEV;
+
+	mutex_lock(&cdev->lock);
+	port_pdev = __dfl_fpga_cdev_find_port(cdev, &port_id,
+					      dfl_fpga_check_port_id);
+	if (!port_pdev)
+		goto unlock_exit;
+
+	if (!device_is_registered(&port_pdev->dev)) {
+		ret = -EBUSY;
+		goto put_dev_exit;
+	}
+
+	ret = dfl_feature_dev_use_begin(dev_get_platdata(&port_pdev->dev));
+	if (ret)
+		goto put_dev_exit;
+
+	platform_device_del(port_pdev);
+	cdev->released_port_num++;
+put_dev_exit:
+	put_device(&port_pdev->dev);
+unlock_exit:
+	mutex_unlock(&cdev->lock);
+	return ret;
+}
+
+/**
+ * dfl_fpga_cdev_config_port - configure a port feature dev
+ * @cdev: parent container device.
+ * @port_id: id of the port feature device.
+ * @release: release port or assign port back.
+ *
+ * This function allows user to release port platform device or assign it back.
+ * e.g. to safely turn one port from PF into VF for PCI device SRIOV support,
+ * release port platform device is one necessary step.
+ */
+int dfl_fpga_cdev_config_port(struct dfl_fpga_cdev *cdev,
+			      u32 port_id, bool release)
+{
+	return release ? detach_port_dev(cdev, port_id) :
+			 attach_port_dev(cdev, port_id);
+}
+EXPORT_SYMBOL_GPL(dfl_fpga_cdev_config_port);
+
 static int __init dfl_fpga_init(void)
 {
 	int ret;
diff --git a/drivers/fpga/dfl.h b/drivers/fpga/dfl.h
index 8851c6c893fc..63f39ab08905 100644
--- a/drivers/fpga/dfl.h
+++ b/drivers/fpga/dfl.h
@@ -183,6 +183,8 @@ struct dfl_feature {
 
 #define DEV_STATUS_IN_USE	0
 
+#define FEATURE_DEV_ID_UNUSED	(-1)
+
 /**
  * struct dfl_feature_platform_data - platform data for feature devices
  *
@@ -191,6 +193,7 @@ struct dfl_feature {
  * @cdev: cdev of feature dev.
  * @dev: ptr to platform device linked with this platform data.
  * @dfl_cdev: ptr to container device.
+ * @id: id used for this feature device.
  * @disable_count: count for port disable.
  * @num: number for sub features.
  * @dev_status: dev status (e.g. DEV_STATUS_IN_USE).
@@ -203,6 +206,7 @@ struct dfl_feature_platform_data {
 	struct cdev cdev;
 	struct platform_device *dev;
 	struct dfl_fpga_cdev *dfl_cdev;
+	int id;
 	unsigned int disable_count;
 	unsigned long dev_status;
 	void *private;
@@ -378,6 +382,7 @@ void dfl_fpga_enum_info_free(struct dfl_fpga_enum_info *info);
  * @fme_dev: FME feature device under this container device.
  * @lock: mutex lock to protect the port device list.
  * @port_dev_list: list of all port feature devices under this container device.
+ * @released_port_num: released port number under this container device.
  */
 struct dfl_fpga_cdev {
 	struct device *parent;
@@ -385,6 +390,7 @@ struct dfl_fpga_cdev {
 	struct device *fme_dev;
 	struct mutex lock;
 	struct list_head port_dev_list;
+	int released_port_num;
 };
 
 struct dfl_fpga_cdev *
@@ -412,4 +418,8 @@ dfl_fpga_cdev_find_port(struct dfl_fpga_cdev *cdev, void *data,
 
 	return pdev;
 }
+
+int dfl_fpga_cdev_config_port(struct dfl_fpga_cdev *cdev,
+			      u32 port_id, bool release);
+
 #endif /* __FPGA_DFL_H */
diff --git a/include/uapi/linux/fpga-dfl.h b/include/uapi/linux/fpga-dfl.h
index 2e324e515c41..e9a00e014114 100644
--- a/include/uapi/linux/fpga-dfl.h
+++ b/include/uapi/linux/fpga-dfl.h
@@ -176,4 +176,36 @@ struct dfl_fpga_fme_port_pr {
 
 #define DFL_FPGA_FME_PORT_PR	_IO(DFL_FPGA_MAGIC, DFL_FME_BASE + 0)
 
+/**
+ * DFL_FPGA_FME_PORT_RELEASE - _IOW(DFL_FPGA_MAGIC, DFL_FME_BASE + 1,
+ *					struct dfl_fpga_fme_port_release)
+ *
+ * Driver releases the port per Port ID provided by caller.
+ * Return: 0 on success, -errno on failure.
+ */
+struct dfl_fpga_fme_port_release {
+	/* Input */
+	__u32 argsz;		/* Structure length */
+	__u32 flags;		/* Zero for now */
+	__u32 port_id;
+};
+
+#define DFL_FPGA_FME_PORT_RELEASE	_IO(DFL_FPGA_MAGIC, DFL_FME_BASE + 1)
+
+/**
+ * DFL_FPGA_FME_PORT_ASSIGN - _IOW(DFL_FPGA_MAGIC, DFL_FME_BASE + 2,
+ *					struct dfl_fpga_fme_port_assign)
+ *
+ * Driver assigns the port back per Port ID provided by caller.
+ * Return: 0 on success, -errno on failure.
+ */
+struct dfl_fpga_fme_port_assign {
+	/* Input */
+	__u32 argsz;		/* Structure length */
+	__u32 flags;		/* Zero for now */
+	__u32 port_id;
+};
+
+#define DFL_FPGA_FME_PORT_ASSIGN	_IO(DFL_FPGA_MAGIC, DFL_FME_BASE + 2)
+
 #endif /* _UAPI_LINUX_FPGA_DFL_H */
-- 
2.22.0

