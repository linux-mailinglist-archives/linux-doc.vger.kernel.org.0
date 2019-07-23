Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE2A471102
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jul 2019 07:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732718AbfGWFJ6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Jul 2019 01:09:58 -0400
Received: from mga05.intel.com ([192.55.52.43]:1853 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732715AbfGWFJ6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Jul 2019 01:09:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jul 2019 22:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,297,1559545200"; 
   d="scan'208";a="196992285"
Received: from hao-dev.bj.intel.com ([10.238.157.65])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2019 22:09:55 -0700
From:   Wu Hao <hao.wu@intel.com>
To:     gregkh@linuxfoundation.org, mdf@kernel.org,
        linux-fpga@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, atull@kernel.org,
        Wu Hao <hao.wu@intel.com>,
        Ananda Ravuri <ananda.ravuri@intel.com>,
        Xu Yilun <yilun.xu@intel.com>
Subject: [PATCH v3 01/12] fpga: dfl: fme: support 512bit data width PR
Date:   Tue, 23 Jul 2019 12:51:24 +0800
Message-Id: <1563857495-26692-2-git-send-email-hao.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563857495-26692-1-git-send-email-hao.wu@intel.com>
References: <1563857495-26692-1-git-send-email-hao.wu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In early partial reconfiguration private feature, it only
supports 32bit data width when writing data to hardware for
PR. 512bit data width PR support is an important optimization
for some specific solutions (e.g. XEON with FPGA integrated),
it allows driver to use AVX512 instruction to improve the
performance of partial reconfiguration. e.g. programming one
100MB bitstream image via this 512bit data width PR hardware
only takes ~300ms, but 32bit revision requires ~3s per test
result.

Please note now this optimization is only done on revision 2
of this PR private feature which is only used in integrated
solution that AVX512 is always supported. This revision 2
hardware doesn't support 32bit PR.

Signed-off-by: Ananda Ravuri <ananda.ravuri@intel.com>
Signed-off-by: Xu Yilun <yilun.xu@intel.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Acked-by: Alan Tull <atull@kernel.org>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
v2: remove DRV/MODULE_VERSION modifications
---
 drivers/fpga/dfl-fme-mgr.c | 110 ++++++++++++++++++++++++++++++++++++++-------
 drivers/fpga/dfl-fme-pr.c  |  43 +++++++++++-------
 drivers/fpga/dfl-fme.h     |   2 +
 drivers/fpga/dfl.h         |   5 +++
 4 files changed, 129 insertions(+), 31 deletions(-)

diff --git a/drivers/fpga/dfl-fme-mgr.c b/drivers/fpga/dfl-fme-mgr.c
index b3f7eee..46e17f0 100644
--- a/drivers/fpga/dfl-fme-mgr.c
+++ b/drivers/fpga/dfl-fme-mgr.c
@@ -22,6 +22,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/fpga/fpga-mgr.h>
 
+#include "dfl.h"
 #include "dfl-fme-pr.h"
 
 /* FME Partial Reconfiguration Sub Feature Register Set */
@@ -30,6 +31,7 @@
 #define FME_PR_STS		0x10
 #define FME_PR_DATA		0x18
 #define FME_PR_ERR		0x20
+#define FME_PR_512_DATA		0x40 /* Data Register for 512bit datawidth PR */
 #define FME_PR_INTFC_ID_L	0xA8
 #define FME_PR_INTFC_ID_H	0xB0
 
@@ -67,8 +69,43 @@
 #define PR_WAIT_TIMEOUT   8000000
 #define PR_HOST_STATUS_IDLE	0
 
+#if defined(CONFIG_X86) && defined(CONFIG_AS_AVX512)
+
+#include <linux/cpufeature.h>
+#include <asm/fpu/api.h>
+
+static inline int is_cpu_avx512_enabled(void)
+{
+	return cpu_feature_enabled(X86_FEATURE_AVX512F);
+}
+
+static inline void copy512(const void *src, void __iomem *dst)
+{
+	kernel_fpu_begin();
+
+	asm volatile("vmovdqu64 (%0), %%zmm0;"
+		     "vmovntdq %%zmm0, (%1);"
+		     :
+		     : "r"(src), "r"(dst)
+		     : "memory");
+
+	kernel_fpu_end();
+}
+#else
+static inline int is_cpu_avx512_enabled(void)
+{
+	return 0;
+}
+
+static inline void copy512(const void *src, void __iomem *dst)
+{
+	WARN_ON_ONCE(1);
+}
+#endif
+
 struct fme_mgr_priv {
 	void __iomem *ioaddr;
+	unsigned int pr_datawidth;
 	u64 pr_error;
 };
 
@@ -169,7 +206,7 @@ static int fme_mgr_write(struct fpga_manager *mgr,
 	struct fme_mgr_priv *priv = mgr->priv;
 	void __iomem *fme_pr = priv->ioaddr;
 	u64 pr_ctrl, pr_status, pr_data;
-	int delay = 0, pr_credit, i = 0;
+	int ret = 0, delay = 0, pr_credit;
 
 	dev_dbg(dev, "start request\n");
 
@@ -181,9 +218,9 @@ static int fme_mgr_write(struct fpga_manager *mgr,
 
 	/*
 	 * driver can push data to PR hardware using PR_DATA register once HW
-	 * has enough pr_credit (> 1), pr_credit reduces one for every 32bit
-	 * pr data write to PR_DATA register. If pr_credit <= 1, driver needs
-	 * to wait for enough pr_credit from hardware by polling.
+	 * has enough pr_credit (> 1), pr_credit reduces one for every pr data
+	 * width write to PR_DATA register. If pr_credit <= 1, driver needs to
+	 * wait for enough pr_credit from hardware by polling.
 	 */
 	pr_status = readq(fme_pr + FME_PR_STS);
 	pr_credit = FIELD_GET(FME_PR_STS_PR_CREDIT, pr_status);
@@ -192,7 +229,8 @@ static int fme_mgr_write(struct fpga_manager *mgr,
 		while (pr_credit <= 1) {
 			if (delay++ > PR_WAIT_TIMEOUT) {
 				dev_err(dev, "PR_CREDIT timeout\n");
-				return -ETIMEDOUT;
+				ret = -ETIMEDOUT;
+				goto done;
 			}
 			udelay(1);
 
@@ -200,21 +238,27 @@ static int fme_mgr_write(struct fpga_manager *mgr,
 			pr_credit = FIELD_GET(FME_PR_STS_PR_CREDIT, pr_status);
 		}
 
-		if (count < 4) {
-			dev_err(dev, "Invalid PR bitstream size\n");
-			return -EINVAL;
+		WARN_ON(count < priv->pr_datawidth);
+
+		switch (priv->pr_datawidth) {
+		case 4:
+			pr_data = FIELD_PREP(FME_PR_DATA_PR_DATA_RAW,
+					     *(u32 *)buf);
+			writeq(pr_data, fme_pr + FME_PR_DATA);
+			break;
+		case 64:
+			copy512(buf, fme_pr + FME_PR_512_DATA);
+			break;
+		default:
+			WARN_ON_ONCE(1);
 		}
-
-		pr_data = 0;
-		pr_data |= FIELD_PREP(FME_PR_DATA_PR_DATA_RAW,
-				      *(((u32 *)buf) + i));
-		writeq(pr_data, fme_pr + FME_PR_DATA);
-		count -= 4;
+		buf += priv->pr_datawidth;
+		count -= priv->pr_datawidth;
 		pr_credit--;
-		i++;
 	}
 
-	return 0;
+done:
+	return ret;
 }
 
 static int fme_mgr_write_complete(struct fpga_manager *mgr,
@@ -279,6 +323,36 @@ static void fme_mgr_get_compat_id(void __iomem *fme_pr,
 	id->id_h = readq(fme_pr + FME_PR_INTFC_ID_H);
 }
 
+static u8 fme_mgr_get_pr_datawidth(struct device *dev, void __iomem *fme_pr)
+{
+	u8 revision = dfl_feature_revision(fme_pr);
+
+	if (revision < 2) {
+		/*
+		 * revision 0 and 1 only support 32bit data width partial
+		 * reconfiguration, so pr_datawidth is 4 (Byte).
+		 */
+		return 4;
+	} else if (revision == 2) {
+		/*
+		 * revision 2 hardware has optimization to support 512bit data
+		 * width partial reconfiguration with AVX512 instructions. So
+		 * pr_datawidth is 64 (Byte). As revision 2 hardware is only
+		 * used in integrated solution, CPU supports AVX512 instructions
+		 * for sure, but it still needs to check here as AVX512 could be
+		 * disabled in kernel (e.g. using clearcpuid boot option).
+		 */
+		if (is_cpu_avx512_enabled())
+			return 64;
+
+		dev_err(dev, "revision 2: AVX512 is disabled\n");
+		return 0;
+	}
+
+	dev_err(dev, "revision %d is not supported yet\n", revision);
+	return 0;
+}
+
 static int fme_mgr_probe(struct platform_device *pdev)
 {
 	struct dfl_fme_mgr_pdata *pdata = dev_get_platdata(&pdev->dev);
@@ -302,6 +376,10 @@ static int fme_mgr_probe(struct platform_device *pdev)
 			return PTR_ERR(priv->ioaddr);
 	}
 
+	priv->pr_datawidth = fme_mgr_get_pr_datawidth(dev, priv->ioaddr);
+	if (!priv->pr_datawidth)
+		return -ENODEV;
+
 	compat_id = devm_kzalloc(dev, sizeof(*compat_id), GFP_KERNEL);
 	if (!compat_id)
 		return -ENOMEM;
diff --git a/drivers/fpga/dfl-fme-pr.c b/drivers/fpga/dfl-fme-pr.c
index 3c71dc3..cd94ba8 100644
--- a/drivers/fpga/dfl-fme-pr.c
+++ b/drivers/fpga/dfl-fme-pr.c
@@ -83,7 +83,7 @@ static int fme_pr(struct platform_device *pdev, unsigned long arg)
 	if (copy_from_user(&port_pr, argp, minsz))
 		return -EFAULT;
 
-	if (port_pr.argsz < minsz || port_pr.flags)
+	if (port_pr.argsz < minsz || port_pr.flags || !port_pr.buffer_size)
 		return -EINVAL;
 
 	/* get fme header region */
@@ -101,15 +101,25 @@ static int fme_pr(struct platform_device *pdev, unsigned long arg)
 		       port_pr.buffer_size))
 		return -EFAULT;
 
+	mutex_lock(&pdata->lock);
+	fme = dfl_fpga_pdata_get_private(pdata);
+	/* fme device has been unregistered. */
+	if (!fme) {
+		ret = -EINVAL;
+		goto unlock_exit;
+	}
+
 	/*
 	 * align PR buffer per PR bandwidth, as HW ignores the extra padding
 	 * data automatically.
 	 */
-	length = ALIGN(port_pr.buffer_size, 4);
+	length = ALIGN(port_pr.buffer_size, fme->pr_datawidth);
 
 	buf = vmalloc(length);
-	if (!buf)
-		return -ENOMEM;
+	if (!buf) {
+		ret = -ENOMEM;
+		goto unlock_exit;
+	}
 
 	if (copy_from_user(buf,
 			   (void __user *)(unsigned long)port_pr.buffer_address,
@@ -127,18 +137,10 @@ static int fme_pr(struct platform_device *pdev, unsigned long arg)
 
 	info->flags |= FPGA_MGR_PARTIAL_RECONFIG;
 
-	mutex_lock(&pdata->lock);
-	fme = dfl_fpga_pdata_get_private(pdata);
-	/* fme device has been unregistered. */
-	if (!fme) {
-		ret = -EINVAL;
-		goto unlock_exit;
-	}
-
 	region = dfl_fme_region_find(fme, port_pr.port_id);
 	if (!region) {
 		ret = -EINVAL;
-		goto unlock_exit;
+		goto free_exit;
 	}
 
 	fpga_image_info_free(region->info);
@@ -159,10 +161,10 @@ static int fme_pr(struct platform_device *pdev, unsigned long arg)
 		fpga_bridges_put(&region->bridge_list);
 
 	put_device(&region->dev);
-unlock_exit:
-	mutex_unlock(&pdata->lock);
 free_exit:
 	vfree(buf);
+unlock_exit:
+	mutex_unlock(&pdata->lock);
 	return ret;
 }
 
@@ -388,6 +390,17 @@ static int pr_mgmt_init(struct platform_device *pdev,
 	mutex_lock(&pdata->lock);
 	priv = dfl_fpga_pdata_get_private(pdata);
 
+	/*
+	 * Initialize PR data width.
+	 * Only revision 2 supports 512bit datawidth for better performance,
+	 * other revisions use default 32bit datawidth. This is used for
+	 * buffer alignment.
+	 */
+	if (dfl_feature_revision(feature->ioaddr) == 2)
+		priv->pr_datawidth = 64;
+	else
+		priv->pr_datawidth = 4;
+
 	/* Initialize the region and bridge sub device list */
 	INIT_LIST_HEAD(&priv->region_list);
 	INIT_LIST_HEAD(&priv->bridge_list);
diff --git a/drivers/fpga/dfl-fme.h b/drivers/fpga/dfl-fme.h
index 5394a21..de20755 100644
--- a/drivers/fpga/dfl-fme.h
+++ b/drivers/fpga/dfl-fme.h
@@ -21,12 +21,14 @@
 /**
  * struct dfl_fme - dfl fme private data
  *
+ * @pr_datawidth: data width for partial reconfiguration.
  * @mgr: FME's FPGA manager platform device.
  * @region_list: linked list of FME's FPGA regions.
  * @bridge_list: linked list of FME's FPGA bridges.
  * @pdata: fme platform device's pdata.
  */
 struct dfl_fme {
+	int pr_datawidth;
 	struct platform_device *mgr;
 	struct list_head region_list;
 	struct list_head bridge_list;
diff --git a/drivers/fpga/dfl.h b/drivers/fpga/dfl.h
index a8b869e..8851c6c 100644
--- a/drivers/fpga/dfl.h
+++ b/drivers/fpga/dfl.h
@@ -331,6 +331,11 @@ static inline bool dfl_feature_is_port(void __iomem *base)
 		(FIELD_GET(DFH_ID, v) == DFH_ID_FIU_PORT);
 }
 
+static inline u8 dfl_feature_revision(void __iomem *base)
+{
+	return (u8)FIELD_GET(DFH_REVISION, readq(base + DFH));
+}
+
 /**
  * struct dfl_fpga_enum_info - DFL FPGA enumeration information
  *
-- 
1.8.3.1

