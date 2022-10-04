Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470125F45A6
	for <lists+linux-doc@lfdr.de>; Tue,  4 Oct 2022 16:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiJDOhm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Oct 2022 10:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiJDOhR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 10:37:17 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CE861D55;
        Tue,  4 Oct 2022 07:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664894230; x=1696430230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oVMizV6xRVgcHB0P8EhhTm0yEd/XcNxmh/Jn5gT7Lro=;
  b=SP2OCQ0V6wsuQLNyEbPGwnpV9f02A99IvMaIaCABOyvimlrWvX0FagRm
   fiPPKCOJat677e2xFvzdwomw/g/Z+pGvXL3o+XztmReio3rI+dFI8UtDS
   yw6QxE2B7CjWOhVh9cRGa7a2H8ff+pt4gilTireRBbNKs4U12KaPvc+NG
   uQEWbNgWTsxeBpkMWrY5ShUFfB/sAyiyrZ3etkX5kQJdXk0HYezzOD9sj
   ntmeNg4Hearyr8hinyBIQcvfy5s2G82pV/yFskCXuetBLeSf54NfM0k8Q
   P8GkI4HzLuFaiGSY0d9/TP0xUUwCc2LQnPhvK3ZgCVyGH3DqyY4ppG3t8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="389215872"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; 
   d="scan'208";a="389215872"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 07:37:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="869021634"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; 
   d="scan'208";a="869021634"
Received: from rhweight-wrk1.ra.intel.com ([137.102.106.139])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 07:37:05 -0700
From:   matthew.gerlach@linux.intel.com
To:     hao.wu@intel.com, yilun.xu@intel.com, russell.h.weight@intel.com,
        basheer.ahmed.muddebihal@intel.com, trix@redhat.com,
        mdf@kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tianfei.zhang@intel.com, corbet@lwn.net,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        jirislaby@kernel.org, geert+renesas@glider.be,
        andriy.shevchenko@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se, macro@orcam.me.uk,
        johan@kernel.org, lukas@wunner.de
Cc:     Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH v3 3/4] fpga: dfl: add basic support for DFHv1
Date:   Tue,  4 Oct 2022 07:37:17 -0700
Message-Id: <20221004143718.1076710-4-matthew.gerlach@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004143718.1076710-1-matthew.gerlach@linux.intel.com>
References: <20221004143718.1076710-1-matthew.gerlach@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Add generic support for MSIX interrupts for DFL devices.

The location of a feature's registers is explicitly
described in DFHv1 and can be relative to the base of the DFHv1
or an absolute address.  Parse the location and pass the information
to DFL driver.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
---
v3: remove unneeded blank line
    use clearer variable name
    pass finfo into parse_feature_irqs()
    refactor code for better indentation
    use switch statement for irq parsing
    squash in code parsing register location

v2: fix kernel doc
    clarify use of DFH_VERSION field
---
 drivers/fpga/dfl.c  | 150 ++++++++++++++++++++++++++++++++------------
 drivers/fpga/dfl.h  |   3 +
 include/linux/dfl.h |  20 ++++++
 3 files changed, 134 insertions(+), 39 deletions(-)

diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
index b9aae85ba930..6a74317e549e 100644
--- a/drivers/fpga/dfl.c
+++ b/drivers/fpga/dfl.c
@@ -380,7 +380,11 @@ dfl_dev_add(struct dfl_feature_platform_data *pdata,
 	ddev->type = feature_dev_id_type(pdev);
 	ddev->feature_id = feature->id;
 	ddev->revision = feature->revision;
+	ddev->dfh_version = feature->dfh_version;
 	ddev->cdev = pdata->dfl_cdev;
+	ddev->csr_res.start = feature->csr_res.start;
+	ddev->csr_res.end = feature->csr_res.end;
+	ddev->csr_res.flags = IORESOURCE_MEM;
 
 	/* add mmio resource */
 	parent_res = &pdev->resource[feature->resource_index];
@@ -708,18 +712,24 @@ struct build_feature_devs_info {
  * struct dfl_feature_info - sub feature info collected during feature dev build
  *
  * @fid: id of this sub feature.
+ * @revision: revision of this sub feature
+ * @dfh_version: version of Device Feature Header (DFH)
  * @mmio_res: mmio resource of this sub feature.
  * @ioaddr: mapped base address of mmio resource.
  * @node: node in sub_features linked list.
+ * @csr_res: resource of DFHv1 feature registers
+ * @csr_size: DFHv1 size of feature registers
  * @irq_base: start of irq index in this sub feature.
  * @nr_irqs: number of irqs of this sub feature.
  */
 struct dfl_feature_info {
 	u16 fid;
 	u8 revision;
+	u8 dfh_version;
 	struct resource mmio_res;
 	void __iomem *ioaddr;
 	struct list_head node;
+	struct resource csr_res;
 	unsigned int irq_base;
 	unsigned int nr_irqs;
 };
@@ -797,6 +807,9 @@ static int build_info_commit_dev(struct build_feature_devs_info *binfo)
 		feature->dev = fdev;
 		feature->id = finfo->fid;
 		feature->revision = finfo->revision;
+		feature->dfh_version = finfo->dfh_version;
+		feature->csr_res.start = finfo->csr_res.start;
+		feature->csr_res.end = finfo->csr_res.end;
 
 		/*
 		 * the FIU header feature has some fundamental functions (sriov
@@ -935,55 +948,74 @@ static u16 feature_id(u64 value)
 }
 
 static int parse_feature_irqs(struct build_feature_devs_info *binfo,
-			      resource_size_t ofst, u16 fid,
-			      unsigned int *irq_base, unsigned int *nr_irqs)
+			      resource_size_t ofst, struct dfl_feature_info *finfo)
 {
 	void __iomem *base = binfo->ioaddr + ofst;
 	unsigned int i, ibase, inr = 0;
 	enum dfl_id_type type;
-	int virq;
-	u64 v;
-
-	type = feature_dev_id_type(binfo->feature_dev);
+	u16 fid = finfo->fid;
+	u64 v, dfh_ver;
+	int virq, off;
 
 	/*
 	 * Ideally DFL framework should only read info from DFL header, but
-	 * current version DFL only provides mmio resources information for
+	 * current version, DFHv0, only provides mmio resources information for
 	 * each feature in DFL Header, no field for interrupt resources.
 	 * Interrupt resource information is provided by specific mmio
 	 * registers of each private feature which supports interrupt. So in
 	 * order to parse and assign irq resources, DFL framework has to look
 	 * into specific capability registers of these private features.
 	 *
-	 * Once future DFL version supports generic interrupt resource
-	 * information in common DFL headers, the generic interrupt parsing
-	 * code will be added. But in order to be compatible to old version
+	 * DFHv1 supports generic interrupt resource information in DFHv1
+	 * parameter blocks. But in order to be compatible to old version
 	 * DFL, the driver may still fall back to these quirks.
 	 */
-	if (type == PORT_ID) {
-		switch (fid) {
-		case PORT_FEATURE_ID_UINT:
-			v = readq(base + PORT_UINT_CAP);
-			ibase = FIELD_GET(PORT_UINT_CAP_FST_VECT, v);
-			inr = FIELD_GET(PORT_UINT_CAP_INT_NUM, v);
+
+	switch (finfo->dfh_version) {
+	case 0:
+		type = feature_dev_id_type(binfo->feature_dev);
+		if (type == PORT_ID) {
+			switch (fid) {
+			case PORT_FEATURE_ID_UINT:
+				v = readq(base + PORT_UINT_CAP);
+				ibase = FIELD_GET(PORT_UINT_CAP_FST_VECT, v);
+				inr = FIELD_GET(PORT_UINT_CAP_INT_NUM, v);
+				break;
+			case PORT_FEATURE_ID_ERROR:
+				v = readq(base + PORT_ERROR_CAP);
+				ibase = FIELD_GET(PORT_ERROR_CAP_INT_VECT, v);
+				inr = FIELD_GET(PORT_ERROR_CAP_SUPP_INT, v);
+				break;
+			}
+		} else if (type == FME_ID) {
+			if (fid == FME_FEATURE_ID_GLOBAL_ERR) {
+				v = readq(base + FME_ERROR_CAP);
+				ibase = FIELD_GET(FME_ERROR_CAP_INT_VECT, v);
+				inr = FIELD_GET(FME_ERROR_CAP_SUPP_INT, v);
+			}
+		}
+		break;
+
+	case 1:
+		if (!dfhv1_has_params(base))
 			break;
-		case PORT_FEATURE_ID_ERROR:
-			v = readq(base + PORT_ERROR_CAP);
-			ibase = FIELD_GET(PORT_ERROR_CAP_INT_VECT, v);
-			inr = FIELD_GET(PORT_ERROR_CAP_SUPP_INT, v);
+
+		off = dfhv1_find_param(base, ofst, DFHv1_PARAM_ID_MSIX);
+		if (off < 0)
 			break;
-		}
-	} else if (type == FME_ID) {
-		if (fid == FME_FEATURE_ID_GLOBAL_ERR) {
-			v = readq(base + FME_ERROR_CAP);
-			ibase = FIELD_GET(FME_ERROR_CAP_INT_VECT, v);
-			inr = FIELD_GET(FME_ERROR_CAP_SUPP_INT, v);
-		}
+
+		ibase = readl(base + off + DFHv1_PARAM_MSIX_STARTV);
+		inr = readl(base + off + DFHv1_PARAM_MSIX_NUMV);
+		break;
+
+	default:
+		dev_warn(binfo->dev, "unexpected DFH version %lld\n", dfh_ver);
+		break;
 	}
 
 	if (!inr) {
-		*irq_base = 0;
-		*nr_irqs = 0;
+		finfo->irq_base = 0;
+		finfo->nr_irqs = 0;
 		return 0;
 	}
 
@@ -1006,8 +1038,8 @@ static int parse_feature_irqs(struct build_feature_devs_info *binfo,
 		}
 	}
 
-	*irq_base = ibase;
-	*nr_irqs = inr;
+	finfo->irq_base = ibase;
+	finfo->nr_irqs = inr;
 
 	return 0;
 }
@@ -1023,8 +1055,8 @@ static int
 create_feature_instance(struct build_feature_devs_info *binfo,
 			resource_size_t ofst, resource_size_t size, u16 fid)
 {
-	unsigned int irq_base, nr_irqs;
 	struct dfl_feature_info *finfo;
+	u8 dfh_version = 0;
 	u8 revision = 0;
 	int ret;
 	u64 v;
@@ -1032,7 +1064,7 @@ create_feature_instance(struct build_feature_devs_info *binfo,
 	if (fid != FEATURE_ID_AFU) {
 		v = readq(binfo->ioaddr + ofst);
 		revision = FIELD_GET(DFH_REVISION, v);
-
+		dfh_version = FIELD_GET(DFH_VERSION, v);
 		/* read feature size and id if inputs are invalid */
 		size = size ? size : feature_size(v);
 		fid = fid ? fid : feature_id(v);
@@ -1041,21 +1073,33 @@ create_feature_instance(struct build_feature_devs_info *binfo,
 	if (binfo->len - ofst < size)
 		return -EINVAL;
 
-	ret = parse_feature_irqs(binfo, ofst, fid, &irq_base, &nr_irqs);
-	if (ret)
-		return ret;
-
 	finfo = kzalloc(sizeof(*finfo), GFP_KERNEL);
 	if (!finfo)
 		return -ENOMEM;
 
 	finfo->fid = fid;
 	finfo->revision = revision;
+	finfo->dfh_version = dfh_version;
 	finfo->mmio_res.start = binfo->start + ofst;
 	finfo->mmio_res.end = finfo->mmio_res.start + size - 1;
 	finfo->mmio_res.flags = IORESOURCE_MEM;
-	finfo->irq_base = irq_base;
-	finfo->nr_irqs = nr_irqs;
+
+	ret = parse_feature_irqs(binfo, ofst, finfo);
+	if (ret)
+		return ret;
+
+	if (dfh_version == 1) {
+		v = readq(binfo->ioaddr + ofst + DFHv1_CSR_ADDR);
+		if (v & DFHv1_CSR_ADDR_REL)
+			finfo->csr_res.start = FIELD_GET(DFHv1_CSR_ADDR_MASK, v);
+		else
+			finfo->csr_res.start = binfo->start + ofst
+					       + FIELD_GET(DFHv1_CSR_ADDR_MASK, v);
+
+		v = readq(binfo->ioaddr + ofst + DFHv1_CSR_SIZE_GRP);
+		finfo->csr_res.end = finfo->csr_res.start
+				     + FIELD_GET(DFHv1_CSR_SIZE_GRP_SIZE, v) - 1;
+	}
 
 	list_add_tail(&finfo->node, &binfo->sub_features);
 	binfo->feature_num++;
@@ -1879,6 +1923,34 @@ long dfl_feature_ioctl_set_irq(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(dfl_feature_ioctl_set_irq);
 
+int dfhv1_find_param(void __iomem *base, resource_size_t max, int param)
+{
+	int off = DFHv1_PARAM_HDR;
+	u64 v, next;
+
+	while (off < max) {
+		v = readq(base + off);
+		if (param == FIELD_GET(DFHv1_PARAM_HDR_ID, v))
+			return (DFHv1_PARAM_DATA + off);
+
+		next = FIELD_GET(DFHv1_PARAM_HDR_NEXT_OFFSET, v);
+		if (!next)
+			break;
+
+		off += next;
+	}
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(dfhv1_find_param);
+
+int dfhv1_has_params(void __iomem *dfh_base)
+{
+	return (FIELD_GET(DFHv1_CSR_SIZE_GRP_HAS_PARAMS,
+		readq(dfh_base + DFHv1_CSR_SIZE_GRP)));
+}
+EXPORT_SYMBOL_GPL(dfhv1_has_params);
+
 static void __exit dfl_fpga_exit(void)
 {
 	dfl_chardev_uinit();
diff --git a/drivers/fpga/dfl.h b/drivers/fpga/dfl.h
index bd8720bc5320..0423aa8319ed 100644
--- a/drivers/fpga/dfl.h
+++ b/drivers/fpga/dfl.h
@@ -266,6 +266,7 @@ struct dfl_feature_irq_ctx {
  *		    this index is used to find its mmio resource from the
  *		    feature dev (platform device)'s resources.
  * @ioaddr: mapped mmio resource address.
+ * @csr_res: resource for DFHv1 feature registers
  * @irq_ctx: interrupt context list.
  * @nr_irqs: number of interrupt contexts.
  * @ops: ops of this sub feature.
@@ -276,8 +277,10 @@ struct dfl_feature {
 	struct platform_device *dev;
 	u16 id;
 	u8 revision;
+	u8 dfh_version;
 	int resource_index;
 	void __iomem *ioaddr;
+	struct resource csr_res;
 	struct dfl_feature_irq_ctx *irq_ctx;
 	unsigned int nr_irqs;
 	const struct dfl_feature_ops *ops;
diff --git a/include/linux/dfl.h b/include/linux/dfl.h
index 1a1a2b894687..71760c6a25d7 100644
--- a/include/linux/dfl.h
+++ b/include/linux/dfl.h
@@ -39,6 +39,7 @@ enum dfl_id_type {
  * @type: type of DFL FIU of the device. See enum dfl_id_type.
  * @feature_id: feature identifier local to its DFL FIU type.
  * @mmio_res: mmio resource of this dfl device.
+ * @csr_res: resource for DFHv1 feature registers
  * @irqs: list of Linux IRQ numbers of this dfl device.
  * @num_irqs: number of IRQs supported by this dfl device.
  * @cdev: pointer to DFL FPGA container device this dfl device belongs to.
@@ -50,7 +51,9 @@ struct dfl_device {
 	u16 type;
 	u16 feature_id;
 	u8 revision;
+	u8 dfh_version;
 	struct resource mmio_res;
+	struct resource csr_res;
 	int *irqs;
 	unsigned int num_irqs;
 	struct dfl_fpga_cdev *cdev;
@@ -95,4 +98,21 @@ void dfl_driver_unregister(struct dfl_driver *dfl_drv);
 	module_driver(__dfl_driver, dfl_driver_register, \
 		      dfl_driver_unregister)
 
+/**
+ * dfhv1_find_param() - find the offset of the given parameter
+ * @base: base pointer to start of DFH
+ * @max: maximum offset to search
+ * @param: id of dfl parameter
+ *
+ * Return: positive offset of parameter data on success, negative error code otherwise.
+ */
+int dfhv1_find_param(void __iomem *base, resource_size_t max, int param);
+
+/**
+ * dfhv1_has_params() - does DFHv1 have parameters?
+ * @base: base pointer to start of DFH
+ *
+ * Return: non-zero if DFHv1 has parameters, zero otherwise.
+ */
+int dfhv1_has_params(void __iomem *base);
 #endif /* __LINUX_DFL_H */
-- 
2.25.1

