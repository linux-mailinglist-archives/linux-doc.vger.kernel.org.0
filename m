Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79524BF874
	for <lists+linux-doc@lfdr.de>; Tue, 22 Feb 2022 13:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbiBVM51 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Feb 2022 07:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbiBVM5Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Feb 2022 07:57:25 -0500
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B21354BE2;
        Tue, 22 Feb 2022 04:56:46 -0800 (PST)
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K2zgN5f9Nz67yPg;
        Tue, 22 Feb 2022 20:56:00 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Tue, 22 Feb 2022 13:56:44 +0100
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 12:56:39 +0000
From:   John Garry <john.garry@huawei.com>
To:     <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
        <artur.paszkiewicz@intel.com>, <jinpu.wang@cloud.ionos.com>,
        <chenxiang66@hisilicon.com>, <damien.lemoal@opensource.wdc.com>,
        <hch@lst.de>
CC:     <Ajish.Koshy@microchip.com>, <yanaijie@huawei.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <linuxarm@huawei.com>,
        <liuqi115@huawei.com>, <Viswas.G@microchip.com>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH v3 03/18] scsi: libsas: Delete lldd_clear_aca callback
Date:   Tue, 22 Feb 2022 20:50:44 +0800
Message-ID: <1645534259-27068-4-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1645534259-27068-1-git-send-email-john.garry@huawei.com>
References: <1645534259-27068-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This callback is never called, so remove support.

Signed-off-by: John Garry <john.garry@huawei.com>
Reviewed-by: Jack Wang <jinpu.wang@ionos.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Xiang Chen <chenxiang66@hisilicon.com>
Tested-by: Yihang Li <liyihang6@hisilicon.com>
Tested-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 Documentation/scsi/libsas.rst         |  2 --
 drivers/scsi/aic94xx/aic94xx.h        |  1 -
 drivers/scsi/aic94xx/aic94xx_init.c   |  1 -
 drivers/scsi/aic94xx/aic94xx_tmf.c    |  9 ---------
 drivers/scsi/hisi_sas/hisi_sas_main.c | 12 ------------
 drivers/scsi/isci/init.c              |  1 -
 drivers/scsi/isci/task.c              | 18 ------------------
 drivers/scsi/isci/task.h              |  4 ----
 drivers/scsi/mvsas/mv_init.c          |  1 -
 drivers/scsi/mvsas/mv_sas.c           | 11 -----------
 drivers/scsi/mvsas/mv_sas.h           |  1 -
 drivers/scsi/pm8001/pm8001_init.c     |  1 -
 drivers/scsi/pm8001/pm8001_sas.c      |  8 --------
 drivers/scsi/pm8001/pm8001_sas.h      |  1 -
 include/scsi/libsas.h                 |  1 -
 15 files changed, 72 deletions(-)

diff --git a/Documentation/scsi/libsas.rst b/Documentation/scsi/libsas.rst
index 6589dfefbc02..305a253d5c3b 100644
--- a/Documentation/scsi/libsas.rst
+++ b/Documentation/scsi/libsas.rst
@@ -207,7 +207,6 @@ Management Functions (TMFs) described in SAM::
 	/* Task Management Functions. Must be called from process context. */
 	int (*lldd_abort_task)(struct sas_task *);
 	int (*lldd_abort_task_set)(struct domain_device *, u8 *lun);
-	int (*lldd_clear_aca)(struct domain_device *, u8 *lun);
 	int (*lldd_clear_task_set)(struct domain_device *, u8 *lun);
 	int (*lldd_I_T_nexus_reset)(struct domain_device *);
 	int (*lldd_lu_reset)(struct domain_device *, u8 *lun);
@@ -262,7 +261,6 @@ can look like this (called last thing from probe())
 
 	    my_ha->sas_ha.lldd_abort_task     = my_abort_task;
 	    my_ha->sas_ha.lldd_abort_task_set = my_abort_task_set;
-	    my_ha->sas_ha.lldd_clear_aca      = my_clear_aca;
 	    my_ha->sas_ha.lldd_clear_task_set = my_clear_task_set;
 	    my_ha->sas_ha.lldd_I_T_nexus_reset= NULL; (2)
 	    my_ha->sas_ha.lldd_lu_reset       = my_lu_reset;
diff --git a/drivers/scsi/aic94xx/aic94xx.h b/drivers/scsi/aic94xx/aic94xx.h
index 8f24180646c2..f595bc2ee45e 100644
--- a/drivers/scsi/aic94xx/aic94xx.h
+++ b/drivers/scsi/aic94xx/aic94xx.h
@@ -60,7 +60,6 @@ void asd_set_dmamode(struct domain_device *dev);
 /* ---------- TMFs ---------- */
 int  asd_abort_task(struct sas_task *);
 int  asd_abort_task_set(struct domain_device *, u8 *lun);
-int  asd_clear_aca(struct domain_device *, u8 *lun);
 int  asd_clear_task_set(struct domain_device *, u8 *lun);
 int  asd_lu_reset(struct domain_device *, u8 *lun);
 int  asd_I_T_nexus_reset(struct domain_device *dev);
diff --git a/drivers/scsi/aic94xx/aic94xx_init.c b/drivers/scsi/aic94xx/aic94xx_init.c
index 7a78606598c4..954d0c5ae2e2 100644
--- a/drivers/scsi/aic94xx/aic94xx_init.c
+++ b/drivers/scsi/aic94xx/aic94xx_init.c
@@ -960,7 +960,6 @@ static struct sas_domain_function_template aic94xx_transport_functions = {
 
 	.lldd_abort_task	= asd_abort_task,
 	.lldd_abort_task_set	= asd_abort_task_set,
-	.lldd_clear_aca		= asd_clear_aca,
 	.lldd_clear_task_set	= asd_clear_task_set,
 	.lldd_I_T_nexus_reset	= asd_I_T_nexus_reset,
 	.lldd_lu_reset		= asd_lu_reset,
diff --git a/drivers/scsi/aic94xx/aic94xx_tmf.c b/drivers/scsi/aic94xx/aic94xx_tmf.c
index 2ba91eaaf0ee..27d32b8c2987 100644
--- a/drivers/scsi/aic94xx/aic94xx_tmf.c
+++ b/drivers/scsi/aic94xx/aic94xx_tmf.c
@@ -644,15 +644,6 @@ int asd_abort_task_set(struct domain_device *dev, u8 *lun)
 	return res;
 }
 
-int asd_clear_aca(struct domain_device *dev, u8 *lun)
-{
-	int res = asd_initiate_ssp_tmf(dev, lun, TMF_CLEAR_ACA, 0);
-
-	if (res == TMF_RESP_FUNC_COMPLETE)
-		asd_clear_nexus_I_T_L(dev, lun);
-	return res;
-}
-
 int asd_clear_task_set(struct domain_device *dev, u8 *lun)
 {
 	int res = asd_initiate_ssp_tmf(dev, lun, TMF_CLEAR_TASK_SET, 0);
diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hisi_sas_main.c
index 1873707ca599..ad630694cc4f 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_main.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
@@ -1793,17 +1793,6 @@ static int hisi_sas_abort_task_set(struct domain_device *device, u8 *lun)
 	return rc;
 }
 
-static int hisi_sas_clear_aca(struct domain_device *device, u8 *lun)
-{
-	struct hisi_sas_tmf_task tmf_task;
-	int rc;
-
-	tmf_task.tmf = TMF_CLEAR_ACA;
-	rc = hisi_sas_debug_issue_ssp_tmf(device, lun, &tmf_task);
-
-	return rc;
-}
-
 #define I_T_NEXUS_RESET_PHYUP_TIMEOUT  (2 * HZ)
 
 static int hisi_sas_debug_I_T_nexus_reset(struct domain_device *device)
@@ -2333,7 +2322,6 @@ static struct sas_domain_function_template hisi_sas_transport_ops = {
 	.lldd_control_phy	= hisi_sas_control_phy,
 	.lldd_abort_task	= hisi_sas_abort_task,
 	.lldd_abort_task_set	= hisi_sas_abort_task_set,
-	.lldd_clear_aca		= hisi_sas_clear_aca,
 	.lldd_I_T_nexus_reset	= hisi_sas_I_T_nexus_reset,
 	.lldd_lu_reset		= hisi_sas_lu_reset,
 	.lldd_query_task	= hisi_sas_query_task,
diff --git a/drivers/scsi/isci/init.c b/drivers/scsi/isci/init.c
index aade707c5553..e294d5d961eb 100644
--- a/drivers/scsi/isci/init.c
+++ b/drivers/scsi/isci/init.c
@@ -193,7 +193,6 @@ static struct sas_domain_function_template isci_transport_ops  = {
 	/* Task Management Functions. Must be called from process context. */
 	.lldd_abort_task	= isci_task_abort_task,
 	.lldd_abort_task_set	= isci_task_abort_task_set,
-	.lldd_clear_aca		= isci_task_clear_aca,
 	.lldd_clear_task_set	= isci_task_clear_task_set,
 	.lldd_I_T_nexus_reset	= isci_task_I_T_nexus_reset,
 	.lldd_lu_reset		= isci_task_lu_reset,
diff --git a/drivers/scsi/isci/task.c b/drivers/scsi/isci/task.c
index c82d07978532..c514b20293b2 100644
--- a/drivers/scsi/isci/task.c
+++ b/drivers/scsi/isci/task.c
@@ -620,24 +620,6 @@ int isci_task_abort_task_set(
 }
 
 
-/**
- * isci_task_clear_aca() - This function is one of the SAS Domain Template
- *    functions. This is one of the Task Management functoins called by libsas.
- * @d_device: This parameter specifies the domain device associated with this
- *    request.
- * @lun: This parameter specifies the lun	 associated with this request.
- *
- * status, zero indicates success.
- */
-int isci_task_clear_aca(
-	struct domain_device *d_device,
-	u8 *lun)
-{
-	return TMF_RESP_FUNC_FAILED;
-}
-
-
-
 /**
  * isci_task_clear_task_set() - This function is one of the SAS Domain Template
  *    functions. This is one of the Task Management functoins called by libsas.
diff --git a/drivers/scsi/isci/task.h b/drivers/scsi/isci/task.h
index cae168b8916f..f96633fa6939 100644
--- a/drivers/scsi/isci/task.h
+++ b/drivers/scsi/isci/task.h
@@ -140,10 +140,6 @@ int isci_task_abort_task_set(
 	struct domain_device *d_device,
 	u8 *lun);
 
-int isci_task_clear_aca(
-	struct domain_device *d_device,
-	u8 *lun);
-
 int isci_task_clear_task_set(
 	struct domain_device *d_device,
 	u8 *lun);
diff --git a/drivers/scsi/mvsas/mv_init.c b/drivers/scsi/mvsas/mv_init.c
index 44df7c03aab8..3fe0a9351cea 100644
--- a/drivers/scsi/mvsas/mv_init.c
+++ b/drivers/scsi/mvsas/mv_init.c
@@ -64,7 +64,6 @@ static struct sas_domain_function_template mvs_transport_ops = {
 
 	.lldd_abort_task	= mvs_abort_task,
 	.lldd_abort_task_set    = mvs_abort_task_set,
-	.lldd_clear_aca         = mvs_clear_aca,
 	.lldd_clear_task_set    = mvs_clear_task_set,
 	.lldd_I_T_nexus_reset	= mvs_I_T_nexus_reset,
 	.lldd_lu_reset 		= mvs_lu_reset,
diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
index b48ae26e29a9..e9182333e077 100644
--- a/drivers/scsi/mvsas/mv_sas.c
+++ b/drivers/scsi/mvsas/mv_sas.c
@@ -1550,17 +1550,6 @@ int mvs_abort_task_set(struct domain_device *dev, u8 *lun)
 	return rc;
 }
 
-int mvs_clear_aca(struct domain_device *dev, u8 *lun)
-{
-	int rc = TMF_RESP_FUNC_FAILED;
-	struct mvs_tmf_task tmf_task;
-
-	tmf_task.tmf = TMF_CLEAR_ACA;
-	rc = mvs_debug_issue_ssp_tmf(dev, lun, &tmf_task);
-
-	return rc;
-}
-
 int mvs_clear_task_set(struct domain_device *dev, u8 *lun)
 {
 	int rc = TMF_RESP_FUNC_FAILED;
diff --git a/drivers/scsi/mvsas/mv_sas.h b/drivers/scsi/mvsas/mv_sas.h
index 8ff976c9967e..fa654c73beee 100644
--- a/drivers/scsi/mvsas/mv_sas.h
+++ b/drivers/scsi/mvsas/mv_sas.h
@@ -441,7 +441,6 @@ int mvs_scan_finished(struct Scsi_Host *shost, unsigned long time);
 int mvs_queue_command(struct sas_task *task, gfp_t gfp_flags);
 int mvs_abort_task(struct sas_task *task);
 int mvs_abort_task_set(struct domain_device *dev, u8 *lun);
-int mvs_clear_aca(struct domain_device *dev, u8 *lun);
 int mvs_clear_task_set(struct domain_device *dev, u8 * lun);
 void mvs_port_formed(struct asd_sas_phy *sas_phy);
 void mvs_port_deformed(struct asd_sas_phy *sas_phy);
diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
index d8a2121cb8d9..b8cf1bae4040 100644
--- a/drivers/scsi/pm8001/pm8001_init.c
+++ b/drivers/scsi/pm8001/pm8001_init.c
@@ -123,7 +123,6 @@ static struct sas_domain_function_template pm8001_transport_ops = {
 
 	.lldd_abort_task	= pm8001_abort_task,
 	.lldd_abort_task_set	= pm8001_abort_task_set,
-	.lldd_clear_aca		= pm8001_clear_aca,
 	.lldd_clear_task_set	= pm8001_clear_task_set,
 	.lldd_I_T_nexus_reset   = pm8001_I_T_nexus_reset,
 	.lldd_lu_reset		= pm8001_lu_reset,
diff --git a/drivers/scsi/pm8001/pm8001_sas.c b/drivers/scsi/pm8001/pm8001_sas.c
index 8c12fbb9c476..bd3513e1882e 100644
--- a/drivers/scsi/pm8001/pm8001_sas.c
+++ b/drivers/scsi/pm8001/pm8001_sas.c
@@ -1358,14 +1358,6 @@ int pm8001_abort_task_set(struct domain_device *dev, u8 *lun)
 	return pm8001_issue_ssp_tmf(dev, lun, &tmf_task);
 }
 
-int pm8001_clear_aca(struct domain_device *dev, u8 *lun)
-{
-	struct pm8001_tmf_task tmf_task;
-
-	tmf_task.tmf = TMF_CLEAR_ACA;
-	return pm8001_issue_ssp_tmf(dev, lun, &tmf_task);
-}
-
 int pm8001_clear_task_set(struct domain_device *dev, u8 *lun)
 {
 	struct pm8001_tmf_task tmf_task;
diff --git a/drivers/scsi/pm8001/pm8001_sas.h b/drivers/scsi/pm8001/pm8001_sas.h
index a17da1cebce1..3ea53a0d0cc1 100644
--- a/drivers/scsi/pm8001/pm8001_sas.h
+++ b/drivers/scsi/pm8001/pm8001_sas.h
@@ -649,7 +649,6 @@ int pm8001_scan_finished(struct Scsi_Host *shost, unsigned long time);
 int pm8001_queue_command(struct sas_task *task, gfp_t gfp_flags);
 int pm8001_abort_task(struct sas_task *task);
 int pm8001_abort_task_set(struct domain_device *dev, u8 *lun);
-int pm8001_clear_aca(struct domain_device *dev, u8 *lun);
 int pm8001_clear_task_set(struct domain_device *dev, u8 *lun);
 int pm8001_dev_found(struct domain_device *dev);
 void pm8001_dev_gone(struct domain_device *dev);
diff --git a/include/scsi/libsas.h b/include/scsi/libsas.h
index fad328d3a551..8026c1bb57ba 100644
--- a/include/scsi/libsas.h
+++ b/include/scsi/libsas.h
@@ -636,7 +636,6 @@ struct sas_domain_function_template {
 	/* Task Management Functions. Must be called from process context. */
 	int (*lldd_abort_task)(struct sas_task *);
 	int (*lldd_abort_task_set)(struct domain_device *, u8 *lun);
-	int (*lldd_clear_aca)(struct domain_device *, u8 *lun);
 	int (*lldd_clear_task_set)(struct domain_device *, u8 *lun);
 	int (*lldd_I_T_nexus_reset)(struct domain_device *);
 	int (*lldd_ata_check_ready)(struct domain_device *);
-- 
2.26.2

