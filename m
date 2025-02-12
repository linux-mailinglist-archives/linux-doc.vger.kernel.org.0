Return-Path: <linux-doc+bounces-37876-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E5BA328B6
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 15:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 577B87A3F0D
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 14:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79E9211466;
	Wed, 12 Feb 2025 14:37:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D263253F3B;
	Wed, 12 Feb 2025 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371065; cv=none; b=XJGCy/w5vNLprv+CsOsVHbS6NvBIQJZYu8/ArfgaZoEBMzpIzJXcQIctnzV+IPdh42bi/Q+GnyZiG7qKy58X92qOltsG7ybxuk0vtX9GSUPiiw50fh03jAM1P/X6wNBu4+HvB7bX/Phi55x+YruzbZQJ7GRaIXH1LHCqpIPku1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371065; c=relaxed/simple;
	bh=LQ0FXgQX+fJnC8TT3T+Plw/tfIu1Ml/obWDpSVzwDlU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZG8ijVzsfV3gS7UjrMItks91w1OW5d7LNF4MCK1YmIeNaJ9PJf42p7cgXXmG6Nyt1WjJzfgY0rEvRu2vXhEjog+kHdV1o5LwdO+iBQ40txlC8GTeeG5ZUH3AsbTvSyBG1LNL3RCRDrOvEXiGMszU7Fq0D6PYZ++w+IFdIdPqxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YtLSh484wz6J7fw;
	Wed, 12 Feb 2025 22:35:16 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id EAE50140B2A;
	Wed, 12 Feb 2025 22:37:41 +0800 (CST)
Received: from P_UKIT01-A7bmah.china.huawei.com (10.126.169.206) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Feb 2025 15:37:39 +0100
From: <shiju.jose@huawei.com>
To: <linux-edac@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
CC: <linux-doc@vger.kernel.org>, <bp@alien8.de>, <tony.luck@intel.com>,
	<rafael@kernel.org>, <lenb@kernel.org>, <mchehab@kernel.org>,
	<dan.j.williams@intel.com>, <dave@stgolabs.net>,
	<jonathan.cameron@huawei.com>, <dave.jiang@intel.com>,
	<alison.schofield@intel.com>, <vishal.l.verma@intel.com>,
	<ira.weiny@intel.com>, <david@redhat.com>, <Vilas.Sridharan@amd.com>,
	<leo.duran@amd.com>, <Yazen.Ghannam@amd.com>, <rientjes@google.com>,
	<jiaqiyan@google.com>, <Jon.Grimm@amd.com>, <dave.hansen@linux.intel.com>,
	<naoya.horiguchi@nec.com>, <james.morse@arm.com>, <jthoughton@google.com>,
	<somasundaram.a@hpe.com>, <erdemaktas@google.com>, <pgonda@google.com>,
	<duenwen@google.com>, <gthelen@google.com>, <wschwartz@amperecomputing.com>,
	<dferguson@amperecomputing.com>, <wbs@os.amperecomputing.com>,
	<nifan.cxl@gmail.com>, <yazen.ghannam@amd.com>, <tanxiaofei@huawei.com>,
	<prime.zeng@hisilicon.com>, <roberto.sassu@huawei.com>,
	<kangkang.shen@futurewei.com>, <wanghuiqiang@huawei.com>,
	<linuxarm@huawei.com>, <shiju.jose@huawei.com>
Subject: [PATCH v20 10/15] cxl/mbox: Add support for PERFORM_MAINTENANCE mailbox command
Date: Wed, 12 Feb 2025 14:36:48 +0000
Message-ID: <20250212143654.1893-11-shiju.jose@huawei.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20250212143654.1893-1-shiju.jose@huawei.com>
References: <20250212143654.1893-1-shiju.jose@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500007.china.huawei.com (7.182.85.172)

From: Shiju Jose <shiju.jose@huawei.com>

Add support for PERFORM_MAINTENANCE mailbox command.

CXL spec 3.1 section 8.2.9.7.1 describes the Perform Maintenance command.
This command requests the device to execute the maintenance operation
specified by the maintenance operation class and the maintenance operation
subclass.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
---
 drivers/cxl/core/mbox.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/cxl/cxlmem.h    | 17 +++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
index 78c5346e3e89..9984a0c8b531 100644
--- a/drivers/cxl/core/mbox.c
+++ b/drivers/cxl/core/mbox.c
@@ -823,6 +823,40 @@ static const uuid_t log_uuid[] = {
 	[VENDOR_DEBUG_UUID] = DEFINE_CXL_VENDOR_DEBUG_UUID,
 };
 
+int cxl_do_maintenance(struct cxl_mailbox *cxl_mbox,
+		       u8 class, u8 subclass,
+		       void *data_in, size_t data_in_size)
+{
+	struct cxl_memdev_maintenance_pi {
+		struct cxl_mbox_do_maintenance_hdr hdr;
+		u8 data[];
+	}  __packed;
+	struct cxl_mbox_cmd mbox_cmd;
+	size_t hdr_size;
+
+	struct cxl_memdev_maintenance_pi *pi __free(kfree) =
+					kmalloc(cxl_mbox->payload_size, GFP_KERNEL);
+	pi->hdr.op_class = class;
+	pi->hdr.op_subclass = subclass;
+	hdr_size = sizeof(pi->hdr);
+	/*
+	 * Check minimum mbox payload size is available for
+	 * the maintenance data transfer.
+	 */
+	if (hdr_size + data_in_size > cxl_mbox->payload_size)
+		return -ENOMEM;
+
+	memcpy(pi->data, data_in, data_in_size);
+	mbox_cmd = (struct cxl_mbox_cmd) {
+		.opcode = CXL_MBOX_OP_DO_MAINTENANCE,
+		.size_in = hdr_size + data_in_size,
+		.payload_in = pi,
+	};
+
+	return cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
+}
+EXPORT_SYMBOL_NS_GPL(cxl_do_maintenance, "CXL");
+
 /**
  * cxl_enumerate_cmds() - Enumerate commands for a device.
  * @mds: The driver data for the operation
diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
index 1aa48fc7bbc2..657dc203d2fb 100644
--- a/drivers/cxl/cxlmem.h
+++ b/drivers/cxl/cxlmem.h
@@ -497,6 +497,7 @@ enum cxl_opcode {
 	CXL_MBOX_OP_GET_SUPPORTED_FEATURES	= 0x0500,
 	CXL_MBOX_OP_GET_FEATURE		= 0x0501,
 	CXL_MBOX_OP_SET_FEATURE		= 0x0502,
+	CXL_MBOX_OP_DO_MAINTENANCE	= 0x0600,
 	CXL_MBOX_OP_IDENTIFY		= 0x4000,
 	CXL_MBOX_OP_GET_PARTITION_INFO	= 0x4100,
 	CXL_MBOX_OP_SET_PARTITION_INFO	= 0x4101,
@@ -780,6 +781,19 @@ enum {
 	CXL_PMEM_SEC_PASS_USER,
 };
 
+/*
+ * Perform Maintenance CXL 3.1 Spec 8.2.9.7.1
+ */
+
+/*
+ * Perform Maintenance input payload
+ * CXL rev 3.1 section 8.2.9.7.1 Table 8-102
+ */
+struct cxl_mbox_do_maintenance_hdr {
+	u8 op_class;
+	u8 op_subclass;
+}  __packed;
+
 int cxl_internal_send_cmd(struct cxl_mailbox *cxl_mbox,
 			  struct cxl_mbox_cmd *cmd);
 int cxl_dev_state_identify(struct cxl_memdev_state *mds);
@@ -849,4 +863,7 @@ struct cxl_hdm {
 struct seq_file;
 struct dentry *cxl_debugfs_create_dir(const char *dir);
 void cxl_dpa_debug(struct seq_file *file, struct cxl_dev_state *cxlds);
+int cxl_do_maintenance(struct cxl_mailbox *cxl_mbox,
+		       u8 class, u8 subclass,
+		       void *data_in, size_t data_in_size);
 #endif /* __CXL_MEM_H__ */
-- 
2.43.0


