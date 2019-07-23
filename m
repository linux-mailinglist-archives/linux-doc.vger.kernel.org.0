Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14464710DB
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jul 2019 07:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732822AbfGWFKI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Jul 2019 01:10:08 -0400
Received: from mga05.intel.com ([192.55.52.43]:1853 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727735AbfGWFKI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Jul 2019 01:10:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jul 2019 22:10:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,297,1559545200"; 
   d="scan'208";a="196992360"
Received: from hao-dev.bj.intel.com ([10.238.157.65])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2019 22:10:06 -0700
From:   Wu Hao <hao.wu@intel.com>
To:     gregkh@linuxfoundation.org, mdf@kernel.org,
        linux-fpga@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, atull@kernel.org,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>
Subject: [PATCH v3 06/12] fpga: dfl: add id_table for dfl private feature driver
Date:   Tue, 23 Jul 2019 12:51:29 +0800
Message-Id: <1563857495-26692-7-git-send-email-hao.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563857495-26692-1-git-send-email-hao.wu@intel.com>
References: <1563857495-26692-1-git-send-email-hao.wu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds id_table for each dfl private feature driver,
it allows to reuse same private feature driver to match and support
multiple dfl private features.

Signed-off-by: Xu Yilun <yilun.xu@intel.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Acked-by: Moritz Fischer <mdf@kernel.org>
Acked-by: Alan Tull <atull@kernel.org>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
v2: rebased, remove DRV/MODULE_VERSION modifications
---
 drivers/fpga/dfl-afu-main.c | 14 ++++++++++++--
 drivers/fpga/dfl-fme-main.c | 11 ++++++++---
 drivers/fpga/dfl-fme-pr.c   |  7 ++++++-
 drivers/fpga/dfl-fme.h      |  3 ++-
 drivers/fpga/dfl.c          | 18 ++++++++++++++++--
 drivers/fpga/dfl.h          | 21 +++++++++++++++------
 6 files changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/fpga/dfl-afu-main.c b/drivers/fpga/dfl-afu-main.c
index 9025314..fbd9553 100644
--- a/drivers/fpga/dfl-afu-main.c
+++ b/drivers/fpga/dfl-afu-main.c
@@ -435,6 +435,11 @@ static void port_hdr_uinit(struct platform_device *pdev,
 	return ret;
 }
 
+static const struct dfl_feature_id port_hdr_id_table[] = {
+	{.id = PORT_FEATURE_ID_HEADER,},
+	{0,}
+};
+
 static const struct dfl_feature_ops port_hdr_ops = {
 	.init = port_hdr_init,
 	.uinit = port_hdr_uinit,
@@ -496,6 +501,11 @@ static void port_afu_uinit(struct platform_device *pdev,
 	device_remove_groups(&pdev->dev, port_afu_groups);
 }
 
+static const struct dfl_feature_id port_afu_id_table[] = {
+	{.id = PORT_FEATURE_ID_AFU,},
+	{0,}
+};
+
 static const struct dfl_feature_ops port_afu_ops = {
 	.init = port_afu_init,
 	.uinit = port_afu_uinit,
@@ -503,11 +513,11 @@ static void port_afu_uinit(struct platform_device *pdev,
 
 static struct dfl_feature_driver port_feature_drvs[] = {
 	{
-		.id = PORT_FEATURE_ID_HEADER,
+		.id_table = port_hdr_id_table,
 		.ops = &port_hdr_ops,
 	},
 	{
-		.id = PORT_FEATURE_ID_AFU,
+		.id_table = port_afu_id_table,
 		.ops = &port_afu_ops,
 	},
 	{
diff --git a/drivers/fpga/dfl-fme-main.c b/drivers/fpga/dfl-fme-main.c
index e61e0fe..e333f19 100644
--- a/drivers/fpga/dfl-fme-main.c
+++ b/drivers/fpga/dfl-fme-main.c
@@ -133,6 +133,11 @@ static long fme_hdr_ioctl(struct platform_device *pdev,
 	return -ENODEV;
 }
 
+static const struct dfl_feature_id fme_hdr_id_table[] = {
+	{.id = FME_FEATURE_ID_HEADER,},
+	{0,}
+};
+
 static const struct dfl_feature_ops fme_hdr_ops = {
 	.init = fme_hdr_init,
 	.uinit = fme_hdr_uinit,
@@ -141,12 +146,12 @@ static long fme_hdr_ioctl(struct platform_device *pdev,
 
 static struct dfl_feature_driver fme_feature_drvs[] = {
 	{
-		.id = FME_FEATURE_ID_HEADER,
+		.id_table = fme_hdr_id_table,
 		.ops = &fme_hdr_ops,
 	},
 	{
-		.id = FME_FEATURE_ID_PR_MGMT,
-		.ops = &pr_mgmt_ops,
+		.id_table = fme_pr_mgmt_id_table,
+		.ops = &fme_pr_mgmt_ops,
 	},
 	{
 		.ops = NULL,
diff --git a/drivers/fpga/dfl-fme-pr.c b/drivers/fpga/dfl-fme-pr.c
index cd94ba8..52f1745 100644
--- a/drivers/fpga/dfl-fme-pr.c
+++ b/drivers/fpga/dfl-fme-pr.c
@@ -483,7 +483,12 @@ static long fme_pr_ioctl(struct platform_device *pdev,
 	return ret;
 }
 
-const struct dfl_feature_ops pr_mgmt_ops = {
+const struct dfl_feature_id fme_pr_mgmt_id_table[] = {
+	{.id = FME_FEATURE_ID_PR_MGMT,},
+	{0}
+};
+
+const struct dfl_feature_ops fme_pr_mgmt_ops = {
 	.init = pr_mgmt_init,
 	.uinit = pr_mgmt_uinit,
 	.ioctl = fme_pr_ioctl,
diff --git a/drivers/fpga/dfl-fme.h b/drivers/fpga/dfl-fme.h
index de20755..7a021c4 100644
--- a/drivers/fpga/dfl-fme.h
+++ b/drivers/fpga/dfl-fme.h
@@ -35,6 +35,7 @@ struct dfl_fme {
 	struct dfl_feature_platform_data *pdata;
 };
 
-extern const struct dfl_feature_ops pr_mgmt_ops;
+extern const struct dfl_feature_ops fme_pr_mgmt_ops;
+extern const struct dfl_feature_id fme_pr_mgmt_id_table[];
 
 #endif /* __DFL_FME_H */
diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
index c3a8e1d..3eb67ab 100644
--- a/drivers/fpga/dfl.c
+++ b/drivers/fpga/dfl.c
@@ -281,6 +281,21 @@ static int dfl_feature_instance_init(struct platform_device *pdev,
 	return ret;
 }
 
+static bool dfl_feature_drv_match(struct dfl_feature *feature,
+				  struct dfl_feature_driver *driver)
+{
+	const struct dfl_feature_id *ids = driver->id_table;
+
+	if (ids) {
+		while (ids->id) {
+			if (ids->id == feature->id)
+				return true;
+			ids++;
+		}
+	}
+	return false;
+}
+
 /**
  * dfl_fpga_dev_feature_init - init for sub features of dfl feature device
  * @pdev: feature device.
@@ -301,8 +316,7 @@ int dfl_fpga_dev_feature_init(struct platform_device *pdev,
 
 	while (drv->ops) {
 		dfl_fpga_dev_for_each_feature(pdata, feature) {
-			/* match feature and drv using id */
-			if (feature->id == drv->id) {
+			if (dfl_feature_drv_match(feature, drv)) {
 				ret = dfl_feature_instance_init(pdev, pdata,
 								feature, drv);
 				if (ret)
diff --git a/drivers/fpga/dfl.h b/drivers/fpga/dfl.h
index 77b5137..f44fda1 100644
--- a/drivers/fpga/dfl.h
+++ b/drivers/fpga/dfl.h
@@ -30,8 +30,8 @@
 /* plus one for fme device */
 #define MAX_DFL_FEATURE_DEV_NUM    (MAX_DFL_FPGA_PORT_NUM + 1)
 
-/* Reserved 0x0 for Header Group Register and 0xff for AFU */
-#define FEATURE_ID_FIU_HEADER		0x0
+/* Reserved 0xfe for Header Group Register and 0xff for AFU */
+#define FEATURE_ID_FIU_HEADER		0xfe
 #define FEATURE_ID_AFU			0xff
 
 #define FME_FEATURE_ID_HEADER		FEATURE_ID_FIU_HEADER
@@ -169,13 +169,22 @@ struct dfl_fpga_port_ops {
 int dfl_fpga_check_port_id(struct platform_device *pdev, void *pport_id);
 
 /**
- * struct dfl_feature_driver - sub feature's driver
+ * struct dfl_feature_id - dfl private feature id
  *
- * @id: sub feature id.
- * @ops: ops of this sub feature.
+ * @id: unique dfl private feature id.
  */
-struct dfl_feature_driver {
+struct dfl_feature_id {
 	u64 id;
+};
+
+/**
+ * struct dfl_feature_driver - dfl private feature driver
+ *
+ * @id_table: id_table for dfl private features supported by this driver.
+ * @ops: ops of this dfl private feature driver.
+ */
+struct dfl_feature_driver {
+	const struct dfl_feature_id *id_table;
 	const struct dfl_feature_ops *ops;
 };
 
-- 
1.8.3.1

