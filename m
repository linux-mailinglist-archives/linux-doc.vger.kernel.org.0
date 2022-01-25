Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8290849B32F
	for <lists+linux-doc@lfdr.de>; Tue, 25 Jan 2022 12:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382068AbiAYLpq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Jan 2022 06:45:46 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:4497 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355801AbiAYLir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jan 2022 06:38:47 -0500
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjlGg2tKgz67Ljg;
        Tue, 25 Jan 2022 19:38:19 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Tue, 25 Jan 2022 12:38:41 +0100
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 25 Jan 2022 11:38:37 +0000
From:   John Garry <john.garry@huawei.com>
To:     <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
        <artur.paszkiewicz@intel.com>, <jinpu.wang@cloud.ionos.com>,
        <chenxiang66@hisilicon.com>, <Ajish.Koshy@microchip.com>
CC:     <yanaijie@huawei.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linuxarm@huawei.com>, <liuqi115@huawei.com>,
        <Viswas.G@microchip.com>, <damien.lemoal@opensource.wdc.com>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH 05/16] scsi: libsas: Add struct sas_tmf_task
Date:   Tue, 25 Jan 2022 19:32:41 +0800
Message-ID: <1643110372-85470-6-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1643110372-85470-1-git-send-email-john.garry@huawei.com>
References: <1643110372-85470-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some of the LLDDs which use libsas have their own definition of a struct
to hold TMF info, so add a common struct for libsas.

Also add an interim force phy id field for hisi_sas driver, which will be
removed once the STP "TMF" code is factored out.

Even though some LLDDs (pm8001) use a u32 for the tag, u16 should be
enough.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/scsi/hisi_sas/hisi_sas.h       |  9 +--------
 drivers/scsi/hisi_sas/hisi_sas_main.c  | 22 +++++++++++-----------
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c |  4 ++--
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c |  2 +-
 drivers/scsi/mvsas/mv_defs.h           |  5 -----
 drivers/scsi/mvsas/mv_sas.c            | 20 ++++++++++----------
 drivers/scsi/pm8001/pm8001_hwi.c       |  4 ++--
 drivers/scsi/pm8001/pm8001_sas.c       | 18 +++++++++---------
 drivers/scsi/pm8001/pm8001_sas.h       | 10 +++-------
 include/scsi/libsas.h                  |  9 +++++++++
 11 files changed, 49 insertions(+), 56 deletions(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas.h b/drivers/scsi/hisi_sas/hisi_sas.h
index 15a58c955516..fe0c15bbfca9 100644
--- a/drivers/scsi/hisi_sas/hisi_sas.h
+++ b/drivers/scsi/hisi_sas/hisi_sas.h
@@ -234,13 +234,6 @@ struct hisi_sas_device {
 	spinlock_t lock; /* For protecting slots */
 };
 
-struct hisi_sas_tmf_task {
-	int force_phy;
-	int phy_id;
-	u8 tmf;
-	u16 tag_of_task_to_be_managed;
-};
-
 struct hisi_sas_slot {
 	struct list_head entry;
 	struct list_head delivery;
@@ -259,7 +252,7 @@ struct hisi_sas_slot {
 	dma_addr_t cmd_hdr_dma;
 	struct timer_list internal_abort_timer;
 	bool is_internal;
-	struct hisi_sas_tmf_task *tmf;
+	struct sas_tmf_task *tmf;
 	/* Do not reorder/change members after here */
 	void	*buf;
 	dma_addr_t buf_dma;
diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hisi_sas_main.c
index 61414a308906..db6f8ea7864d 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_main.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
@@ -11,7 +11,7 @@
 	((!dev) || (dev->dev_type == SAS_PHY_UNUSED))
 
 static int hisi_sas_debug_issue_ssp_tmf(struct domain_device *device,
-				u8 *lun, struct hisi_sas_tmf_task *tmf);
+				u8 *lun, struct sas_tmf_task *tmf);
 static int
 hisi_sas_internal_task_abort(struct hisi_hba *hisi_hba,
 			     struct domain_device *device,
@@ -401,7 +401,7 @@ void hisi_sas_task_deliver(struct hisi_hba *hisi_hba,
 			   struct hisi_sas_dq *dq,
 			   struct hisi_sas_device *sas_dev,
 			   struct hisi_sas_internal_abort *abort,
-			   struct hisi_sas_tmf_task *tmf)
+			   struct sas_tmf_task *tmf)
 {
 	struct hisi_sas_cmd_hdr *cmd_hdr_base;
 	int dlvry_queue_slot, dlvry_queue;
@@ -472,7 +472,7 @@ void hisi_sas_task_deliver(struct hisi_hba *hisi_hba,
 }
 
 static int hisi_sas_task_exec(struct sas_task *task, gfp_t gfp_flags,
-			      struct hisi_sas_tmf_task *tmf)
+			      struct sas_tmf_task *tmf)
 {
 	int n_elem = 0, n_elem_dif = 0, n_elem_req = 0;
 	struct domain_device *device = task->dev;
@@ -680,7 +680,7 @@ static int hisi_sas_init_device(struct domain_device *device)
 {
 	int rc = TMF_RESP_FUNC_COMPLETE;
 	struct scsi_lun lun;
-	struct hisi_sas_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	int retry = HISI_SAS_DISK_RECOVER_CNT;
 	struct hisi_hba *hisi_hba = dev_to_hisi_hba(device);
 	struct device *dev = hisi_hba->dev;
@@ -1245,7 +1245,7 @@ static void hisi_sas_tmf_timedout(struct timer_list *t)
 #define INTERNAL_ABORT_TIMEOUT		(6 * HZ)
 static int hisi_sas_exec_internal_tmf_task(struct domain_device *device,
 					   void *parameter, u32 para_len,
-					   struct hisi_sas_tmf_task *tmf)
+					   struct sas_tmf_task *tmf)
 {
 	struct hisi_sas_device *sas_dev = device->lldd_dev;
 	struct hisi_hba *hisi_hba = sas_dev->hisi_hba;
@@ -1413,7 +1413,7 @@ static int hisi_sas_softreset_ata_disk(struct domain_device *device)
 }
 
 static int hisi_sas_debug_issue_ssp_tmf(struct domain_device *device,
-				u8 *lun, struct hisi_sas_tmf_task *tmf)
+				u8 *lun, struct sas_tmf_task *tmf)
 {
 	struct sas_ssp_task ssp_task;
 
@@ -1520,7 +1520,7 @@ static void hisi_sas_send_ata_reset_each_phy(struct hisi_hba *hisi_hba,
 					     struct asd_sas_port *sas_port,
 					     struct domain_device *device)
 {
-	struct hisi_sas_tmf_task tmf_task = { .force_phy = 1 };
+	struct sas_tmf_task tmf_task = { .force_phy = 1 };
 	struct ata_port *ap = device->sata_dev.ap;
 	struct device *dev = hisi_hba->dev;
 	int s = sizeof(struct host_to_dev_fis);
@@ -1672,7 +1672,7 @@ static int hisi_sas_controller_reset(struct hisi_hba *hisi_hba)
 static int hisi_sas_abort_task(struct sas_task *task)
 {
 	struct scsi_lun lun;
-	struct hisi_sas_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	struct domain_device *device = task->dev;
 	struct hisi_sas_device *sas_dev = device->lldd_dev;
 	struct hisi_hba *hisi_hba;
@@ -1781,7 +1781,7 @@ static int hisi_sas_abort_task_set(struct domain_device *device, u8 *lun)
 {
 	struct hisi_hba *hisi_hba = dev_to_hisi_hba(device);
 	struct device *dev = hisi_hba->dev;
-	struct hisi_sas_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	int rc;
 
 	rc = hisi_sas_internal_task_abort(hisi_hba, device,
@@ -1932,7 +1932,7 @@ static int hisi_sas_lu_reset(struct domain_device *device, u8 *lun)
 			hisi_sas_release_task(hisi_hba, device);
 		sas_put_local_phy(phy);
 	} else {
-		struct hisi_sas_tmf_task tmf_task = { .tmf =  TMF_LU_RESET };
+		struct sas_tmf_task tmf_task = { .tmf =  TMF_LU_RESET };
 
 		rc = hisi_sas_debug_issue_ssp_tmf(device, lun, &tmf_task);
 		if (rc == TMF_RESP_FUNC_COMPLETE)
@@ -1990,7 +1990,7 @@ static int hisi_sas_clear_nexus_ha(struct sas_ha_struct *sas_ha)
 static int hisi_sas_query_task(struct sas_task *task)
 {
 	struct scsi_lun lun;
-	struct hisi_sas_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	int rc = TMF_RESP_FUNC_FAILED;
 
 	if (task->lldd_task && task->task_proto & SAS_PROTOCOL_SSP) {
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
index 3059d19e4368..176a2e7ccc93 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
@@ -958,7 +958,7 @@ static void prep_ssp_v1_hw(struct hisi_hba *hisi_hba,
 	struct hisi_sas_port *port = slot->port;
 	struct sas_ssp_task *ssp_task = &task->ssp_task;
 	struct scsi_cmnd *scsi_cmnd = ssp_task->cmd;
-	struct hisi_sas_tmf_task *tmf = slot->tmf;
+	struct sas_tmf_task *tmf = slot->tmf;
 	int has_data = 0, priority = !!tmf;
 	u8 *buf_cmd, fburst = 0;
 	u32 dw1, dw2;
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
index 64ed3e472e65..ef5d8f64edd8 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -1742,7 +1742,7 @@ static void prep_ssp_v2_hw(struct hisi_hba *hisi_hba,
 	struct hisi_sas_port *port = slot->port;
 	struct sas_ssp_task *ssp_task = &task->ssp_task;
 	struct scsi_cmnd *scsi_cmnd = ssp_task->cmd;
-	struct hisi_sas_tmf_task *tmf = slot->tmf;
+	struct sas_tmf_task *tmf = slot->tmf;
 	int has_data = 0, priority = !!tmf;
 	u8 *buf_cmd;
 	u32 dw1 = 0, dw2 = 0;
@@ -2492,7 +2492,7 @@ static void prep_ata_v2_hw(struct hisi_hba *hisi_hba,
 	struct hisi_sas_cmd_hdr *hdr = slot->cmd_hdr;
 	struct asd_sas_port *sas_port = device->port;
 	struct hisi_sas_port *port = to_hisi_sas_port(sas_port);
-	struct hisi_sas_tmf_task *tmf = slot->tmf;
+	struct sas_tmf_task *tmf = slot->tmf;
 	u8 *buf_cmd;
 	int has_data = 0, hdr_tag = 0;
 	u32 dw0, dw1 = 0, dw2 = 0;
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index a45ef9a5e12e..794a08b908f3 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@ -1219,7 +1219,7 @@ static void prep_ssp_v3_hw(struct hisi_hba *hisi_hba,
 	struct hisi_sas_port *port = slot->port;
 	struct sas_ssp_task *ssp_task = &task->ssp_task;
 	struct scsi_cmnd *scsi_cmnd = ssp_task->cmd;
-	struct hisi_sas_tmf_task *tmf = slot->tmf;
+	struct sas_tmf_task *tmf = slot->tmf;
 	int has_data = 0, priority = !!tmf;
 	unsigned char prot_op;
 	u8 *buf_cmd;
diff --git a/drivers/scsi/mvsas/mv_defs.h b/drivers/scsi/mvsas/mv_defs.h
index 199ab49aa047..7123a2efbf58 100644
--- a/drivers/scsi/mvsas/mv_defs.h
+++ b/drivers/scsi/mvsas/mv_defs.h
@@ -486,9 +486,4 @@ enum datapres_field {
 	SENSE_DATA	= 2,
 };
 
-/* define task management IU */
-struct mvs_tmf_task{
-	u8 tmf;
-	u16 tag_of_task_to_be_managed;
-};
 #endif
diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
index fd273c3e069e..22bffaaf2eb0 100644
--- a/drivers/scsi/mvsas/mv_sas.c
+++ b/drivers/scsi/mvsas/mv_sas.c
@@ -556,7 +556,7 @@ static int mvs_task_prep_ata(struct mvs_info *mvi,
 
 static int mvs_task_prep_ssp(struct mvs_info *mvi,
 			     struct mvs_task_exec_info *tei, int is_tmf,
-			     struct mvs_tmf_task *tmf)
+			     struct sas_tmf_task *tmf)
 {
 	struct sas_task *task = tei->task;
 	struct mvs_cmd_hdr *hdr = tei->hdr;
@@ -696,7 +696,7 @@ static int mvs_task_prep_ssp(struct mvs_info *mvi,
 
 #define	DEV_IS_GONE(mvi_dev)	((!mvi_dev || (mvi_dev->dev_type == SAS_PHY_UNUSED)))
 static int mvs_task_prep(struct sas_task *task, struct mvs_info *mvi, int is_tmf,
-				struct mvs_tmf_task *tmf, int *pass)
+				struct sas_tmf_task *tmf, int *pass)
 {
 	struct domain_device *dev = task->dev;
 	struct mvs_device *mvi_dev = dev->lldd_dev;
@@ -842,7 +842,7 @@ static int mvs_task_prep(struct sas_task *task, struct mvs_info *mvi, int is_tmf
 
 static int mvs_task_exec(struct sas_task *task, gfp_t gfp_flags,
 				struct completion *completion, int is_tmf,
-				struct mvs_tmf_task *tmf)
+				struct sas_tmf_task *tmf)
 {
 	struct mvs_info *mvi = NULL;
 	u32 rc = 0;
@@ -1280,7 +1280,7 @@ static void mvs_tmf_timedout(struct timer_list *t)
 
 #define MVS_TASK_TIMEOUT 20
 static int mvs_exec_internal_tmf_task(struct domain_device *dev,
-			void *parameter, u32 para_len, struct mvs_tmf_task *tmf)
+			void *parameter, u32 para_len, struct sas_tmf_task *tmf)
 {
 	int res, retry;
 	struct sas_task *task = NULL;
@@ -1355,7 +1355,7 @@ static int mvs_exec_internal_tmf_task(struct domain_device *dev,
 }
 
 static int mvs_debug_issue_ssp_tmf(struct domain_device *dev,
-				u8 *lun, struct mvs_tmf_task *tmf)
+				u8 *lun, struct sas_tmf_task *tmf)
 {
 	struct sas_ssp_task ssp_task;
 	if (!(dev->tproto & SAS_PROTOCOL_SSP))
@@ -1387,7 +1387,7 @@ int mvs_lu_reset(struct domain_device *dev, u8 *lun)
 {
 	unsigned long flags;
 	int rc = TMF_RESP_FUNC_FAILED;
-	struct mvs_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	struct mvs_device * mvi_dev = dev->lldd_dev;
 	struct mvs_info *mvi = mvi_dev->mvi_info;
 
@@ -1431,7 +1431,7 @@ int mvs_query_task(struct sas_task *task)
 {
 	u32 tag;
 	struct scsi_lun lun;
-	struct mvs_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	int rc = TMF_RESP_FUNC_FAILED;
 
 	if (task->lldd_task && task->task_proto & SAS_PROTOCOL_SSP) {
@@ -1468,7 +1468,7 @@ int mvs_query_task(struct sas_task *task)
 int mvs_abort_task(struct sas_task *task)
 {
 	struct scsi_lun lun;
-	struct mvs_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	struct domain_device *dev = task->dev;
 	struct mvs_device *mvi_dev = (struct mvs_device *)dev->lldd_dev;
 	struct mvs_info *mvi;
@@ -1545,7 +1545,7 @@ int mvs_abort_task(struct sas_task *task)
 int mvs_abort_task_set(struct domain_device *dev, u8 *lun)
 {
 	int rc;
-	struct mvs_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 
 	tmf_task.tmf = TMF_ABORT_TASK_SET;
 	rc = mvs_debug_issue_ssp_tmf(dev, lun, &tmf_task);
@@ -1556,7 +1556,7 @@ int mvs_abort_task_set(struct domain_device *dev, u8 *lun)
 int mvs_clear_task_set(struct domain_device *dev, u8 *lun)
 {
 	int rc = TMF_RESP_FUNC_FAILED;
-	struct mvs_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 
 	tmf_task.tmf = TMF_CLEAR_TASK_SET;
 	rc = mvs_debug_issue_ssp_tmf(dev, lun, &tmf_task);
diff --git a/drivers/scsi/pm8001/pm8001_hwi.c b/drivers/scsi/pm8001/pm8001_hwi.c
index c814e5071712..cac5755ba115 100644
--- a/drivers/scsi/pm8001/pm8001_hwi.c
+++ b/drivers/scsi/pm8001/pm8001_hwi.c
@@ -4627,7 +4627,7 @@ int pm8001_chip_abort_task(struct pm8001_hba_info *pm8001_ha,
  * @tmf: task management function.
  */
 int pm8001_chip_ssp_tm_req(struct pm8001_hba_info *pm8001_ha,
-	struct pm8001_ccb_info *ccb, struct pm8001_tmf_task *tmf)
+	struct pm8001_ccb_info *ccb, struct sas_tmf_task *tmf)
 {
 	struct sas_task *task = ccb->task;
 	struct domain_device *dev = task->dev;
@@ -4639,7 +4639,7 @@ int pm8001_chip_ssp_tm_req(struct pm8001_hba_info *pm8001_ha,
 
 	memset(&sspTMCmd, 0, sizeof(sspTMCmd));
 	sspTMCmd.device_id = cpu_to_le32(pm8001_dev->device_id);
-	sspTMCmd.relate_tag = cpu_to_le32(tmf->tag_of_task_to_be_managed);
+	sspTMCmd.relate_tag = cpu_to_le32((u32)tmf->tag_of_task_to_be_managed);
 	sspTMCmd.tmf = cpu_to_le32(tmf->tmf);
 	memcpy(sspTMCmd.lun, task->ssp_task.LUN, 8);
 	sspTMCmd.tag = cpu_to_le32(ccb->ccb_tag);
diff --git a/drivers/scsi/pm8001/pm8001_sas.c b/drivers/scsi/pm8001/pm8001_sas.c
index 4368122ab475..0a3701d97549 100644
--- a/drivers/scsi/pm8001/pm8001_sas.c
+++ b/drivers/scsi/pm8001/pm8001_sas.c
@@ -336,7 +336,7 @@ static int pm8001_task_prep_ata(struct pm8001_hba_info *pm8001_ha,
   * @tmf: the task management IU
   */
 static int pm8001_task_prep_ssp_tm(struct pm8001_hba_info *pm8001_ha,
-	struct pm8001_ccb_info *ccb, struct pm8001_tmf_task *tmf)
+	struct pm8001_ccb_info *ccb, struct sas_tmf_task *tmf)
 {
 	return PM8001_CHIP_DISP->ssp_tm_req(pm8001_ha, ccb, tmf);
 }
@@ -379,7 +379,7 @@ static int sas_find_local_port_id(struct domain_device *dev)
   * @tmf: the task management IU
   */
 static int pm8001_task_exec(struct sas_task *task,
-	gfp_t gfp_flags, int is_tmf, struct pm8001_tmf_task *tmf)
+	gfp_t gfp_flags, int is_tmf, struct sas_tmf_task *tmf)
 {
 	struct domain_device *dev = task->dev;
 	struct pm8001_hba_info *pm8001_ha;
@@ -731,7 +731,7 @@ static void pm8001_tmf_timedout(struct timer_list *t)
   * this function, note it is also with the task execute interface.
   */
 static int pm8001_exec_internal_tmf_task(struct domain_device *dev,
-	void *parameter, u32 para_len, struct pm8001_tmf_task *tmf)
+	void *parameter, u32 para_len, struct sas_tmf_task *tmf)
 {
 	int res, retry;
 	struct sas_task *task = NULL;
@@ -917,7 +917,7 @@ void pm8001_dev_gone(struct domain_device *dev)
 }
 
 static int pm8001_issue_ssp_tmf(struct domain_device *dev,
-	u8 *lun, struct pm8001_tmf_task *tmf)
+	u8 *lun, struct sas_tmf_task *tmf)
 {
 	struct sas_ssp_task ssp_task;
 	if (!(dev->tproto & SAS_PROTOCOL_SSP))
@@ -1119,7 +1119,7 @@ int pm8001_I_T_nexus_event_handler(struct domain_device *dev)
 int pm8001_lu_reset(struct domain_device *dev, u8 *lun)
 {
 	int rc = TMF_RESP_FUNC_FAILED;
-	struct pm8001_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	struct pm8001_device *pm8001_dev = dev->lldd_dev;
 	struct pm8001_hba_info *pm8001_ha = pm8001_find_ha_by_dev(dev);
 	DECLARE_COMPLETION_ONSTACK(completion_setstate);
@@ -1148,7 +1148,7 @@ int pm8001_query_task(struct sas_task *task)
 {
 	u32 tag = 0xdeadbeef;
 	struct scsi_lun lun;
-	struct pm8001_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	int rc = TMF_RESP_FUNC_FAILED;
 	if (unlikely(!task || !task->lldd_task || !task->dev))
 		return rc;
@@ -1197,7 +1197,7 @@ int pm8001_abort_task(struct sas_task *task)
 	struct pm8001_hba_info *pm8001_ha;
 	struct scsi_lun lun;
 	struct pm8001_device *pm8001_dev;
-	struct pm8001_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	int rc = TMF_RESP_FUNC_FAILED, ret;
 	u32 phy_id, port_id;
 	struct sas_task_slow slow_task;
@@ -1351,7 +1351,7 @@ int pm8001_abort_task(struct sas_task *task)
 
 int pm8001_abort_task_set(struct domain_device *dev, u8 *lun)
 {
-	struct pm8001_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 
 	tmf_task.tmf = TMF_ABORT_TASK_SET;
 	return pm8001_issue_ssp_tmf(dev, lun, &tmf_task);
@@ -1359,7 +1359,7 @@ int pm8001_abort_task_set(struct domain_device *dev, u8 *lun)
 
 int pm8001_clear_task_set(struct domain_device *dev, u8 *lun)
 {
-	struct pm8001_tmf_task tmf_task;
+	struct sas_tmf_task tmf_task;
 	struct pm8001_device *pm8001_dev = dev->lldd_dev;
 	struct pm8001_hba_info *pm8001_ha = pm8001_find_ha_by_dev(dev);
 
diff --git a/drivers/scsi/pm8001/pm8001_sas.h b/drivers/scsi/pm8001/pm8001_sas.h
index 3ea53a0d0cc1..0b1086042ca6 100644
--- a/drivers/scsi/pm8001/pm8001_sas.h
+++ b/drivers/scsi/pm8001/pm8001_sas.h
@@ -99,11 +99,7 @@ extern const struct pm8001_dispatch pm8001_80xx_dispatch;
 struct pm8001_hba_info;
 struct pm8001_ccb_info;
 struct pm8001_device;
-/* define task management IU */
-struct pm8001_tmf_task {
-	u8	tmf;
-	u32	tag_of_task_to_be_managed;
-};
+
 struct pm8001_ioctl_payload {
 	u32	signature;
 	u16	major_function;
@@ -203,7 +199,7 @@ struct pm8001_dispatch {
 		struct pm8001_device *pm8001_dev, u8 flag, u32 task_tag,
 		u32 cmd_tag);
 	int (*ssp_tm_req)(struct pm8001_hba_info *pm8001_ha,
-		struct pm8001_ccb_info *ccb, struct pm8001_tmf_task *tmf);
+		struct pm8001_ccb_info *ccb, struct sas_tmf_task *tmf);
 	int (*get_nvmd_req)(struct pm8001_hba_info *pm8001_ha, void *payload);
 	int (*set_nvmd_req)(struct pm8001_hba_info *pm8001_ha, void *payload);
 	int (*fw_flash_update_req)(struct pm8001_hba_info *pm8001_ha,
@@ -687,7 +683,7 @@ int pm8001_chip_set_nvmd_req(struct pm8001_hba_info *pm8001_ha, void *payload);
 int pm8001_chip_get_nvmd_req(struct pm8001_hba_info *pm8001_ha, void *payload);
 int pm8001_chip_ssp_tm_req(struct pm8001_hba_info *pm8001_ha,
 				struct pm8001_ccb_info *ccb,
-				struct pm8001_tmf_task *tmf);
+				struct sas_tmf_task *tmf);
 int pm8001_chip_abort_task(struct pm8001_hba_info *pm8001_ha,
 				struct pm8001_device *pm8001_dev,
 				u8 flag, u32 task_tag, u32 cmd_tag);
diff --git a/include/scsi/libsas.h b/include/scsi/libsas.h
index d59618898619..30b9afec1e1d 100644
--- a/include/scsi/libsas.h
+++ b/include/scsi/libsas.h
@@ -577,6 +577,15 @@ struct sas_ssp_task {
 	struct scsi_cmnd *cmd;
 };
 
+struct sas_tmf_task {
+	u8 tmf;
+	u16 tag_of_task_to_be_managed;
+
+	/* Temp */
+	int force_phy;
+	int phy_id;
+};
+
 struct sas_task {
 	struct domain_device *dev;
 
-- 
2.26.2

