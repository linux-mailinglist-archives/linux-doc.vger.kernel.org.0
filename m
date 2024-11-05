Return-Path: <linux-doc+bounces-29972-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A09BD523
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 19:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A212C280F97
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 18:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D56D1F9A93;
	Tue,  5 Nov 2024 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJzAEldX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD811F9429;
	Tue,  5 Nov 2024 18:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730831982; cv=none; b=FyTUhB3zrHI6rbn+Gal7RWzO7dF2vPAR8bUtkD+HCtoT1tdm/liVBQ3BVo4hMxHcKy0nn/U8o3gUTste4gOG9DwjE03ZJyDzPPrJej8NVHb4JF6YZQoM3bCUZD38v7CXDw/cpdwRd3jppul49X1XUaylqzKYAk1UXnNrYJQJ9iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730831982; c=relaxed/simple;
	bh=Gl4+oM0oWMTc1Saz64ZHVtwtMIF2STVm2KOIjGxxXcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2k7vF4LK2ztFY3cMnMN9JL0zHtOkg4arOqIWNrVx5Kkhfv4zumXztrz6ue3Tw3HlEjjz14UPYoNrOE2qGQqnAH8jBlmF55l8LYVsv6MS3dCwcqsFYh0ZtF7IQ/Tc4HSujnBNLxHn1M2XfA/Seo4rxAqVmqSpI2X8tG8qPsGoOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJzAEldX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730831980; x=1762367980;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Gl4+oM0oWMTc1Saz64ZHVtwtMIF2STVm2KOIjGxxXcs=;
  b=eJzAEldXSDuhYkCG9MYCuAGEPOOVjxGSpazn8FbPegVGyVpQAsqFHmHM
   o+sFoOA1bYd8jiewzEU/l8maZHDq9SOhUXiyButGw5GvzoOrSNn/Lnq3n
   r83uCw8W9rrLMbXj8YFwBBbitOz3cbhw3o7cNb3CyFaHjinLycsczT10e
   5htfhe40WxyUg0AIhL4xLlaKZrpNcqHZ0MzPm4C7mq1PPD9rAXOlnhD3p
   m8tKH9zVuS9iFfM+H44Rex2APnUvIIFOSZ0uklUWIE9fOBZbpUSVonXAF
   I2rcuy8UkXFojSU5qpZueSDmx4Sb4fX0uQxM7IOLza1ZIJYCfT1spi0ki
   g==;
X-CSE-ConnectionGUID: MnJhaKebSqOdYzbdyuTYLA==
X-CSE-MsgGUID: 7Q56Ic5PQgGRP7G9yOc51g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30771361"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30771361"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 10:39:39 -0800
X-CSE-ConnectionGUID: 91PYpyzwRImmDUuPtpXjOQ==
X-CSE-MsgGUID: ocTxKLXORdikXFT5tOH6fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88916739"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO localhost) ([10.125.109.247])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 10:39:38 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Tue, 05 Nov 2024 12:38:49 -0600
Subject: [PATCH v6 27/27] tools/testing/cxl: Add DC Regions to mock mem
 data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-dcd-type2-upstream-v6-27-85c7fa2140fe@intel.com>
References: <20241105-dcd-type2-upstream-v6-0-85c7fa2140fe@intel.com>
In-Reply-To: <20241105-dcd-type2-upstream-v6-0-85c7fa2140fe@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Navneet Singh <navneet.singh@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730831904; l=22413;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=Gl4+oM0oWMTc1Saz64ZHVtwtMIF2STVm2KOIjGxxXcs=;
 b=wrcOpAQiSaQ+qqVBOKNbmodUvCZm2gdLt+a3/HNbfEr1LvBjcy2Cwwap+3PmCeNCsPAcF3O32
 bDCoSnxrXngB1VmgmgsCionPa3nlMmE5e88g6mTBq/Vcg/zCEocrku/
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=

cxl_test provides a good way to ensure quick smoke and regression
testing.  The complexity of Dynamic Capacity (DC) extent processing as
well as the complexity of the new sparse DAX regions can mostly be
tested through cxl_test.  This includes management of sparse regions and
DAX devices on those regions; the management of extent device lifetimes;
and the processing of DCD events.

The only missing functionality from this test is actual interrupt
processing.

Mock memory devices can easily mock DC information and manage fake
extent data.

Define mock_dc_region information within the mock memory data.  Add
sysfs entries on the mock device to inject and delete extents.

The inject format is <start>:<length>:<tag>:<more_flag>
The delete format is <start>:<length>

Directly call the event irq callback to simulate irqs to process the
test extents.

Add DC mailbox commands to the CEL and implement those commands.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 tools/testing/cxl/test/mem.c | 690 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 690 insertions(+)

diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
index 611cd9677cd0a63214322189efb4ef9fb3a1ceb6..d08e7296a9777fb3357058d50215df98defc030a 100644
--- a/tools/testing/cxl/test/mem.c
+++ b/tools/testing/cxl/test/mem.c
@@ -20,6 +20,7 @@
 #define FW_SLOTS 3
 #define DEV_SIZE SZ_2G
 #define EFFECT(x) (1U << x)
+#define BASE_DYNAMIC_CAP_DPA DEV_SIZE
 
 #define MOCK_INJECT_DEV_MAX 8
 #define MOCK_INJECT_TEST_MAX 128
@@ -97,6 +98,22 @@ static struct cxl_cel_entry mock_cel[] = {
 				      EFFECT(SECURITY_CHANGE_IMMEDIATE) |
 				      EFFECT(BACKGROUND_OP)),
 	},
+	{
+		.opcode = cpu_to_le16(CXL_MBOX_OP_GET_DC_CONFIG),
+		.effect = CXL_CMD_EFFECT_NONE,
+	},
+	{
+		.opcode = cpu_to_le16(CXL_MBOX_OP_GET_DC_EXTENT_LIST),
+		.effect = CXL_CMD_EFFECT_NONE,
+	},
+	{
+		.opcode = cpu_to_le16(CXL_MBOX_OP_ADD_DC_RESPONSE),
+		.effect = cpu_to_le16(EFFECT(CONF_CHANGE_IMMEDIATE)),
+	},
+	{
+		.opcode = cpu_to_le16(CXL_MBOX_OP_RELEASE_DC),
+		.effect = cpu_to_le16(EFFECT(CONF_CHANGE_IMMEDIATE)),
+	},
 };
 
 /* See CXL 2.0 Table 181 Get Health Info Output Payload */
@@ -153,6 +170,7 @@ struct mock_event_store {
 	u32 ev_status;
 };
 
+#define NUM_MOCK_DC_REGIONS 2
 struct cxl_mockmem_data {
 	void *lsa;
 	void *fw;
@@ -169,6 +187,11 @@ struct cxl_mockmem_data {
 	u8 event_buf[SZ_4K];
 	u64 timestamp;
 	unsigned long sanitize_timeout;
+	struct cxl_dc_region_config dc_regions[NUM_MOCK_DC_REGIONS];
+	u32 dc_ext_generation;
+	struct mutex ext_lock;
+	struct xarray dc_extents;
+	struct xarray dc_accepted_exts;
 };
 
 static struct mock_event_log *event_find_log(struct device *dev, int log_type)
@@ -568,6 +591,237 @@ static void cxl_mock_event_trigger(struct device *dev)
 	cxl_mem_get_event_records(mdata->mds, mes->ev_status);
 }
 
+struct cxl_extent_data {
+	u64 dpa_start;
+	u64 length;
+	u8 tag[CXL_EXTENT_TAG_LEN];
+	bool shared;
+};
+
+static int __devm_add_extent(struct device *dev, struct xarray *array,
+			     u64 start, u64 length, const char *tag,
+			     bool shared)
+{
+	struct cxl_extent_data *extent;
+
+	extent = devm_kzalloc(dev, sizeof(*extent), GFP_KERNEL);
+	if (!extent)
+		return -ENOMEM;
+
+	extent->dpa_start = start;
+	extent->length = length;
+	memcpy(extent->tag, tag, min(sizeof(extent->tag), strlen(tag)));
+	extent->shared = shared;
+
+	if (xa_insert(array, start, extent, GFP_KERNEL)) {
+		devm_kfree(dev, extent);
+		dev_err(dev, "Failed xarry insert %#llx\n", start);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int devm_add_extent(struct device *dev, u64 start, u64 length,
+			   const char *tag, bool shared)
+{
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+
+	guard(mutex)(&mdata->ext_lock);
+	return __devm_add_extent(dev, &mdata->dc_extents, start, length, tag,
+				 shared);
+}
+
+/* It is known that ext and the new range are not equal */
+static struct cxl_extent_data *
+split_ext(struct device *dev, struct xarray *array,
+	  struct cxl_extent_data *ext, u64 start, u64 length)
+{
+	u64 new_start, new_length;
+
+	if (ext->dpa_start == start) {
+		new_start = start + length;
+		new_length = (ext->dpa_start + ext->length) - new_start;
+
+		if (__devm_add_extent(dev, array, new_start, new_length,
+				      ext->tag, false))
+			return NULL;
+
+		ext = xa_erase(array, ext->dpa_start);
+		if (__devm_add_extent(dev, array, start, length, ext->tag,
+				      false))
+			return NULL;
+
+		return xa_load(array, start);
+	}
+
+	/* ext->dpa_start != start */
+
+	if (__devm_add_extent(dev, array, start, length, ext->tag, false))
+		return NULL;
+
+	new_start = ext->dpa_start;
+	new_length = start - ext->dpa_start;
+
+	ext = xa_erase(array, ext->dpa_start);
+	if (__devm_add_extent(dev, array, new_start, new_length, ext->tag,
+			      false))
+		return NULL;
+
+	return xa_load(array, start);
+}
+
+/*
+ * Do not handle extents which are not inside a single extent sent to
+ * the host.
+ */
+static struct cxl_extent_data *
+find_create_ext(struct device *dev, struct xarray *array, u64 start, u64 length)
+{
+	struct cxl_extent_data *ext;
+	unsigned long index;
+
+	xa_for_each(array, index, ext) {
+		u64 end = start + length;
+
+		/* start < [ext) <= start */
+		if (start < ext->dpa_start ||
+		    (ext->dpa_start + ext->length) <= start)
+			continue;
+
+		if (end <= ext->dpa_start ||
+		    (ext->dpa_start + ext->length) < end) {
+			dev_err(dev, "Invalid range %#llx-%#llx\n", start,
+				end);
+			return NULL;
+		}
+
+		break;
+	}
+
+	if (!ext)
+		return NULL;
+
+	if (start == ext->dpa_start && length == ext->length)
+		return ext;
+
+	return split_ext(dev, array, ext, start, length);
+}
+
+static int dc_accept_extent(struct device *dev, u64 start, u64 length)
+{
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+	struct cxl_extent_data *ext;
+
+	dev_dbg(dev, "Host accepting extent %#llx\n", start);
+	mdata->dc_ext_generation++;
+
+	guard(mutex)(&mdata->ext_lock);
+	ext = find_create_ext(dev, &mdata->dc_extents, start, length);
+	if (!ext) {
+		dev_err(dev, "Extent %#llx-%#llx not found\n",
+			start, start + length);
+		return -ENOMEM;
+	}
+	ext = xa_erase(&mdata->dc_extents, ext->dpa_start);
+	return xa_insert(&mdata->dc_accepted_exts, start, ext, GFP_KERNEL);
+}
+
+static void release_dc_ext(void *md)
+{
+	struct cxl_mockmem_data *mdata = md;
+
+	xa_destroy(&mdata->dc_extents);
+	xa_destroy(&mdata->dc_accepted_exts);
+}
+
+/* Pretend to have some previous accepted extents */
+struct pre_ext_info {
+	u64 offset;
+	u64 length;
+} pre_ext_info[] = {
+	{
+		.offset = SZ_128M,
+		.length = SZ_64M,
+	},
+	{
+		.offset = SZ_256M,
+		.length = SZ_64M,
+	},
+};
+
+static int inject_prev_extents(struct device *dev, u64 base_dpa)
+{
+	int rc;
+
+	dev_dbg(dev, "Adding %ld pre-extents for testing\n",
+		ARRAY_SIZE(pre_ext_info));
+
+	for (int i = 0; i < ARRAY_SIZE(pre_ext_info); i++) {
+		u64 ext_dpa = base_dpa + pre_ext_info[i].offset;
+		u64 ext_len = pre_ext_info[i].length;
+
+		dev_dbg(dev, "Adding pre-extent DPA:%#llx LEN:%#llx\n",
+			ext_dpa, ext_len);
+
+		rc = devm_add_extent(dev, ext_dpa, ext_len, "", false);
+		if (rc) {
+			dev_err(dev, "Failed to add pre-extent DPA:%#llx LEN:%#llx; %d\n",
+				ext_dpa, ext_len, rc);
+			return rc;
+		}
+
+		rc = dc_accept_extent(dev, ext_dpa, ext_len);
+		if (rc)
+			return rc;
+	}
+	return 0;
+}
+
+static int cxl_mock_dc_region_setup(struct device *dev)
+{
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+	u64 base_dpa = BASE_DYNAMIC_CAP_DPA;
+	u32 dsmad_handle = 0xFADE;
+	u64 decode_length = SZ_512M;
+	u64 block_size = SZ_512;
+	u64 length = SZ_512M;
+	int rc;
+
+	mutex_init(&mdata->ext_lock);
+	xa_init(&mdata->dc_extents);
+	xa_init(&mdata->dc_accepted_exts);
+
+	rc = devm_add_action_or_reset(dev, release_dc_ext, mdata);
+	if (rc)
+		return rc;
+
+	for (int i = 0; i < NUM_MOCK_DC_REGIONS; i++) {
+		struct cxl_dc_region_config *conf = &mdata->dc_regions[i];
+
+		dev_dbg(dev, "Creating DC region DC%d DPA:%#llx LEN:%#llx\n",
+			i, base_dpa, length);
+
+		conf->region_base = cpu_to_le64(base_dpa);
+		conf->region_decode_length = cpu_to_le64(decode_length /
+						CXL_CAPACITY_MULTIPLIER);
+		conf->region_length = cpu_to_le64(length);
+		conf->region_block_size = cpu_to_le64(block_size);
+		conf->region_dsmad_handle = cpu_to_le32(dsmad_handle);
+		dsmad_handle++;
+
+		rc = inject_prev_extents(dev, base_dpa);
+		if (rc) {
+			dev_err(dev, "Failed to add pre-extents for DC%d\n", i);
+			return rc;
+		}
+
+		base_dpa += decode_length;
+	}
+
+	return 0;
+}
+
 static int mock_gsl(struct cxl_mbox_cmd *cmd)
 {
 	if (cmd->size_out < sizeof(mock_gsl_payload))
@@ -1383,6 +1637,174 @@ static int mock_activate_fw(struct cxl_mockmem_data *mdata,
 	return -EINVAL;
 }
 
+static int mock_get_dc_config(struct device *dev,
+			      struct cxl_mbox_cmd *cmd)
+{
+	struct cxl_mbox_get_dc_config_in *dc_config = cmd->payload_in;
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+	u8 region_requested, region_start_idx, region_ret_cnt;
+	struct cxl_mbox_get_dc_config_out *resp;
+	int i;
+
+	region_requested = min(dc_config->region_count, NUM_MOCK_DC_REGIONS);
+
+	if (cmd->size_out < struct_size(resp, region, region_requested))
+		return -EINVAL;
+
+	memset(cmd->payload_out, 0, cmd->size_out);
+	resp = cmd->payload_out;
+
+	region_start_idx = dc_config->start_region_index;
+	region_ret_cnt = 0;
+	for (i = 0; i < NUM_MOCK_DC_REGIONS; i++) {
+		if (i >= region_start_idx) {
+			memcpy(&resp->region[region_ret_cnt],
+				&mdata->dc_regions[i],
+				sizeof(resp->region[region_ret_cnt]));
+			region_ret_cnt++;
+		}
+	}
+	resp->avail_region_count = NUM_MOCK_DC_REGIONS;
+	resp->regions_returned = i;
+
+	dev_dbg(dev, "Returning %d dc regions\n", region_ret_cnt);
+	return 0;
+}
+
+static int mock_get_dc_extent_list(struct device *dev,
+				   struct cxl_mbox_cmd *cmd)
+{
+	struct cxl_mbox_get_extent_out *resp = cmd->payload_out;
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+	struct cxl_mbox_get_extent_in *get = cmd->payload_in;
+	u32 total_avail = 0, total_ret = 0;
+	struct cxl_extent_data *ext;
+	u32 ext_count, start_idx;
+	unsigned long i;
+
+	ext_count = le32_to_cpu(get->extent_cnt);
+	start_idx = le32_to_cpu(get->start_extent_index);
+
+	memset(resp, 0, sizeof(*resp));
+
+	guard(mutex)(&mdata->ext_lock);
+	/*
+	 * Total available needs to be calculated and returned regardless of
+	 * how many can actually be returned.
+	 */
+	xa_for_each(&mdata->dc_accepted_exts, i, ext)
+		total_avail++;
+
+	if (start_idx > total_avail)
+		return -EINVAL;
+
+	xa_for_each(&mdata->dc_accepted_exts, i, ext) {
+		if (total_ret >= ext_count)
+			break;
+
+		if (total_ret >= start_idx) {
+			resp->extent[total_ret].start_dpa =
+						cpu_to_le64(ext->dpa_start);
+			resp->extent[total_ret].length =
+						cpu_to_le64(ext->length);
+			memcpy(&resp->extent[total_ret].tag, ext->tag,
+					sizeof(resp->extent[total_ret]));
+			total_ret++;
+		}
+	}
+
+	resp->returned_extent_count = cpu_to_le32(total_ret);
+	resp->total_extent_count = cpu_to_le32(total_avail);
+	resp->generation_num = cpu_to_le32(mdata->dc_ext_generation);
+
+	dev_dbg(dev, "Returning %d extents of %d total\n",
+		total_ret, total_avail);
+
+	return 0;
+}
+
+static int mock_add_dc_response(struct device *dev,
+				struct cxl_mbox_cmd *cmd)
+{
+	struct cxl_mbox_dc_response *req = cmd->payload_in;
+	u32 list_size = le32_to_cpu(req->extent_list_size);
+
+	for (int i = 0; i < list_size; i++) {
+		u64 start = le64_to_cpu(req->extent_list[i].dpa_start);
+		u64 length = le64_to_cpu(req->extent_list[i].length);
+		int rc;
+
+		rc = dc_accept_extent(dev, start, length);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static void dc_delete_extent(struct device *dev, unsigned long long start,
+			     unsigned long long length)
+{
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+	unsigned long long end = start + length;
+	struct cxl_extent_data *ext;
+	unsigned long index;
+
+	dev_dbg(dev, "Deleting extent at %#llx len:%#llx\n", start, length);
+
+	guard(mutex)(&mdata->ext_lock);
+	xa_for_each(&mdata->dc_extents, index, ext) {
+		u64 extent_end = ext->dpa_start + ext->length;
+
+		/*
+		 * Any extent which 'touches' the released delete range will be
+		 * removed.
+		 */
+		if ((start <= ext->dpa_start && ext->dpa_start < end) ||
+		    (start <= extent_end && extent_end < end))
+			xa_erase(&mdata->dc_extents, ext->dpa_start);
+	}
+
+	/*
+	 * If the extent was accepted let it be for the host to drop
+	 * later.
+	 */
+}
+
+static int release_accepted_extent(struct device *dev, u64 start, u64 length)
+{
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+	struct cxl_extent_data *ext;
+
+	guard(mutex)(&mdata->ext_lock);
+	ext = find_create_ext(dev, &mdata->dc_accepted_exts, start, length);
+	if (!ext) {
+		dev_err(dev, "Extent %#llx not in accepted state\n", start);
+		return -EINVAL;
+	}
+	xa_erase(&mdata->dc_accepted_exts, ext->dpa_start);
+	mdata->dc_ext_generation++;
+
+	return 0;
+}
+
+static int mock_dc_release(struct device *dev,
+			   struct cxl_mbox_cmd *cmd)
+{
+	struct cxl_mbox_dc_response *req = cmd->payload_in;
+	u32 list_size = le32_to_cpu(req->extent_list_size);
+
+	for (int i = 0; i < list_size; i++) {
+		u64 start = le64_to_cpu(req->extent_list[i].dpa_start);
+		u64 length = le64_to_cpu(req->extent_list[i].length);
+
+		dev_dbg(dev, "Extent %#llx released by host\n", start);
+		release_accepted_extent(dev, start, length);
+	}
+
+	return 0;
+}
+
 static int cxl_mock_mbox_send(struct cxl_mailbox *cxl_mbox,
 			      struct cxl_mbox_cmd *cmd)
 {
@@ -1468,6 +1890,18 @@ static int cxl_mock_mbox_send(struct cxl_mailbox *cxl_mbox,
 	case CXL_MBOX_OP_ACTIVATE_FW:
 		rc = mock_activate_fw(mdata, cmd);
 		break;
+	case CXL_MBOX_OP_GET_DC_CONFIG:
+		rc = mock_get_dc_config(dev, cmd);
+		break;
+	case CXL_MBOX_OP_GET_DC_EXTENT_LIST:
+		rc = mock_get_dc_extent_list(dev, cmd);
+		break;
+	case CXL_MBOX_OP_ADD_DC_RESPONSE:
+		rc = mock_add_dc_response(dev, cmd);
+		break;
+	case CXL_MBOX_OP_RELEASE_DC:
+		rc = mock_dc_release(dev, cmd);
+		break;
 	default:
 		break;
 	}
@@ -1538,6 +1972,10 @@ static int cxl_mock_mem_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	dev_set_drvdata(dev, mdata);
 
+	rc = cxl_mock_dc_region_setup(dev);
+	if (rc)
+		return rc;
+
 	mdata->lsa = vmalloc(LSA_SIZE);
 	if (!mdata->lsa)
 		return -ENOMEM;
@@ -1591,6 +2029,10 @@ static int cxl_mock_mem_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
+	rc = cxl_dev_dynamic_capacity_identify(mds);
+	if (rc)
+		return rc;
+
 	rc = cxl_mem_create_range_info(mds);
 	if (rc)
 		return rc;
@@ -1706,11 +2148,259 @@ static ssize_t sanitize_timeout_store(struct device *dev,
 
 static DEVICE_ATTR_RW(sanitize_timeout);
 
+/* Return if the proposed extent would break the test code */
+static bool new_extent_valid(struct device *dev, size_t new_start,
+			     size_t new_len)
+{
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+	struct cxl_extent_data *extent;
+	size_t new_end, i;
+
+	if (!new_len)
+		return false;
+
+	new_end = new_start + new_len;
+
+	dev_dbg(dev, "New extent %zx-%zx\n", new_start, new_end);
+
+	guard(mutex)(&mdata->ext_lock);
+	dev_dbg(dev, "Checking extents starts...\n");
+	xa_for_each(&mdata->dc_extents, i, extent) {
+		if (extent->dpa_start == new_start)
+			return false;
+	}
+
+	dev_dbg(dev, "Checking accepted extents starts...\n");
+	xa_for_each(&mdata->dc_accepted_exts, i, extent) {
+		if (extent->dpa_start == new_start)
+			return false;
+	}
+
+	return true;
+}
+
+struct cxl_test_dcd {
+	uuid_t id;
+	struct cxl_event_dcd rec;
+} __packed;
+
+struct cxl_test_dcd dcd_event_rec_template = {
+	.id = CXL_EVENT_DC_EVENT_UUID,
+	.rec = {
+		.hdr = {
+			.length = sizeof(struct cxl_test_dcd),
+		},
+	},
+};
+
+static int log_dc_event(struct cxl_mockmem_data *mdata, enum dc_event type,
+			u64 start, u64 length, const char *tag_str, bool more)
+{
+	struct device *dev = mdata->mds->cxlds.dev;
+	struct cxl_test_dcd *dcd_event;
+
+	dev_dbg(dev, "mock device log event %d\n", type);
+
+	dcd_event = devm_kmemdup(dev, &dcd_event_rec_template,
+				     sizeof(*dcd_event), GFP_KERNEL);
+	if (!dcd_event)
+		return -ENOMEM;
+
+	dcd_event->rec.flags = 0;
+	if (more)
+		dcd_event->rec.flags |= CXL_DCD_EVENT_MORE;
+	dcd_event->rec.event_type = type;
+	dcd_event->rec.extent.start_dpa = cpu_to_le64(start);
+	dcd_event->rec.extent.length = cpu_to_le64(length);
+	memcpy(dcd_event->rec.extent.tag, tag_str,
+	       min(sizeof(dcd_event->rec.extent.tag),
+		   strlen(tag_str)));
+
+	mes_add_event(mdata, CXL_EVENT_TYPE_DCD,
+		      (struct cxl_event_record_raw *)dcd_event);
+
+	/* Fake the irq */
+	cxl_mem_get_event_records(mdata->mds, CXLDEV_EVENT_STATUS_DCD);
+
+	return 0;
+}
+
+/*
+ * Format <start>:<length>:<tag>
+ *
+ * start and length must be a multiple of the configured region block size.
+ * Tag can be any string up to 16 bytes.
+ *
+ * Extents must be exclusive of other extents
+ */
+static ssize_t __dc_inject_extent_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count,
+					bool shared)
+{
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+	unsigned long long start, length, more;
+	char *len_str, *tag_str, *more_str;
+	size_t buf_len = count;
+	int rc;
+
+	char *start_str __free(kfree) = kstrdup(buf, GFP_KERNEL);
+	if (!start_str)
+		return -ENOMEM;
+
+	len_str = strnchr(start_str, buf_len, ':');
+	if (!len_str) {
+		dev_err(dev, "Extent failed to find len_str: %s\n", start_str);
+		return -EINVAL;
+	}
+
+	*len_str = '\0';
+	len_str += 1;
+	buf_len -= strlen(start_str);
+
+	tag_str = strnchr(len_str, buf_len, ':');
+	if (!tag_str) {
+		dev_err(dev, "Extent failed to find tag_str: %s\n", len_str);
+		return -EINVAL;
+	}
+	*tag_str = '\0';
+	tag_str += 1;
+
+	more_str = strnchr(tag_str, buf_len, ':');
+	if (!more_str) {
+		dev_err(dev, "Extent failed to find more_str: %s\n", tag_str);
+		return -EINVAL;
+	}
+	*more_str = '\0';
+	more_str += 1;
+
+	if (kstrtoull(start_str, 0, &start)) {
+		dev_err(dev, "Extent failed to parse start: %s\n", start_str);
+		return -EINVAL;
+	}
+
+	if (kstrtoull(len_str, 0, &length)) {
+		dev_err(dev, "Extent failed to parse length: %s\n", len_str);
+		return -EINVAL;
+	}
+
+	if (kstrtoull(more_str, 0, &more)) {
+		dev_err(dev, "Extent failed to parse more: %s\n", more_str);
+		return -EINVAL;
+	}
+
+	if (!new_extent_valid(dev, start, length))
+		return -EINVAL;
+
+	rc = devm_add_extent(dev, start, length, tag_str, shared);
+	if (rc) {
+		dev_err(dev, "Failed to add extent DPA:%#llx LEN:%#llx; %d\n",
+			start, length, rc);
+		return rc;
+	}
+
+	rc = log_dc_event(mdata, DCD_ADD_CAPACITY, start, length, tag_str, more);
+	if (rc) {
+		dev_err(dev, "Failed to add event %d\n", rc);
+		return rc;
+	}
+
+	return count;
+}
+
+static ssize_t dc_inject_extent_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	return __dc_inject_extent_store(dev, attr, buf, count, false);
+}
+static DEVICE_ATTR_WO(dc_inject_extent);
+
+static ssize_t dc_inject_shared_extent_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
+{
+	return __dc_inject_extent_store(dev, attr, buf, count, true);
+}
+static DEVICE_ATTR_WO(dc_inject_shared_extent);
+
+static ssize_t __dc_del_extent_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count,
+				     enum dc_event type)
+{
+	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
+	unsigned long long start, length;
+	char *len_str;
+	int rc;
+
+	char *start_str __free(kfree) = kstrdup(buf, GFP_KERNEL);
+	if (!start_str)
+		return -ENOMEM;
+
+	len_str = strnchr(start_str, count, ':');
+	if (!len_str) {
+		dev_err(dev, "Failed to find len_str: %s\n", start_str);
+		return -EINVAL;
+	}
+	*len_str = '\0';
+	len_str += 1;
+
+	if (kstrtoull(start_str, 0, &start)) {
+		dev_err(dev, "Failed to parse start: %s\n", start_str);
+		return -EINVAL;
+	}
+
+	if (kstrtoull(len_str, 0, &length)) {
+		dev_err(dev, "Failed to parse length: %s\n", len_str);
+		return -EINVAL;
+	}
+
+	dc_delete_extent(dev, start, length);
+
+	if (type == DCD_FORCED_CAPACITY_RELEASE)
+		dev_dbg(dev, "Forcing delete of extent %#llx len:%#llx\n",
+			start, length);
+
+	rc = log_dc_event(mdata, type, start, length, "", false);
+	if (rc) {
+		dev_err(dev, "Failed to add event %d\n", rc);
+		return rc;
+	}
+
+	return count;
+}
+
+/*
+ * Format <start>:<length>
+ */
+static ssize_t dc_del_extent_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	return __dc_del_extent_store(dev, attr, buf, count,
+				     DCD_RELEASE_CAPACITY);
+}
+static DEVICE_ATTR_WO(dc_del_extent);
+
+static ssize_t dc_force_del_extent_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	return __dc_del_extent_store(dev, attr, buf, count,
+				     DCD_FORCED_CAPACITY_RELEASE);
+}
+static DEVICE_ATTR_WO(dc_force_del_extent);
+
 static struct attribute *cxl_mock_mem_attrs[] = {
 	&dev_attr_security_lock.attr,
 	&dev_attr_event_trigger.attr,
 	&dev_attr_fw_buf_checksum.attr,
 	&dev_attr_sanitize_timeout.attr,
+	&dev_attr_dc_inject_extent.attr,
+	&dev_attr_dc_inject_shared_extent.attr,
+	&dev_attr_dc_del_extent.attr,
+	&dev_attr_dc_force_del_extent.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(cxl_mock_mem);

-- 
2.47.0


