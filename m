Return-Path: <linux-doc+bounces-29959-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D89BD4F8
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 19:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD9F6B22D95
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 18:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299F81F76C3;
	Tue,  5 Nov 2024 18:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcJMYDM4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0141F76A2;
	Tue,  5 Nov 2024 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730831950; cv=none; b=kQfSeXBIr9C95I/CFhGN+jiCo8W9MK9ScuWyeJQr+RAbe4SXoNVS12MOweGEpK33JopbtT55QDTdtbKl7cfkCY/GCzWNRHARxl9kX0vN5SX+5P9xji1Gi9qzRxgNyGBR6/soLmb2KmG/Za7NJytxI91cnzU33lPS0RmJ2SAUbn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730831950; c=relaxed/simple;
	bh=GzCfvn26C5mrHL5WwnPnPzS48ogSS3cJREQLYZOgJ3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbctBY8Gmr3do8Zdc7V1vEjDhAMzW0Bc9wNfDVYqZeTEKn/CjmzXesc7fgYGidjEkrIRw7BZUb0BKdwtlJuqkqK0wN12R6iutS0qxdj5RwKbXmTOhfUvyZ0A6ZsI/6aNjIlXKOMBv4FwiQui4vhg61Q5WA+Km0Ovzf74JxA2C6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcJMYDM4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730831947; x=1762367947;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=GzCfvn26C5mrHL5WwnPnPzS48ogSS3cJREQLYZOgJ3I=;
  b=gcJMYDM4JpM9KzSw9iuvnCDPYtseXjuk+QaNvnge8NARKUzw+5hIv+Ux
   9j7KIAXvbLvLB7WxY3rwrYsSl3M8Zqjxq/W3QiATYX0uXopXSgLF3QHse
   svazUsMB/eokUWmAPDzS4nDLT0faowdMIPgT2XaTJaOfI8imruIX1fgLT
   P1x/1cm31J2wxiC8ydysrMAhKjjmKnSENLzbN9/WRXk1tCAovZHHDysTq
   k2aEfNTtybWSLM/mieJnICE2cpJxKTUemzo40TmE5aRZQcYQEma5qmoc7
   JxQELgMZEIRVPPDlOka60OshQGLxYUBDPPjDxOdGX6X+byRfpZ3aEtXxX
   w==;
X-CSE-ConnectionGUID: Of/0QOqxSsKIrxWj9+9zNw==
X-CSE-MsgGUID: heRWPEtrRamSNjt6NAJf8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41153303"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41153303"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 10:39:06 -0800
X-CSE-ConnectionGUID: UIZFWdX1R16iQgUqcbALag==
X-CSE-MsgGUID: wipB1TjJTvOBRE8Lud4vGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84235700"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO localhost) ([10.125.109.247])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 10:39:04 -0800
From: ira.weiny@intel.com
Date: Tue, 05 Nov 2024 12:38:36 -0600
Subject: [PATCH v6 14/27] cxl/port: Add endpoint decoder DC mode support to
 sysfs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-dcd-type2-upstream-v6-14-85c7fa2140fe@intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730831904; l=6176;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=eVdF00xK2YhLFkhWjHN/56TcA4k5ZqW0N12RsimW9GQ=;
 b=NM28pLErim3ufi6+nLB2reQ6YBZyHdnFZ43cgvNMCayI4PpG4zBHyjr4F+O37NjnW1t2t2p6U
 jxbEZ5jRLtAAjplkYDmhWHz9Hqe7LOwdVRCsik//QZpyFcvZ9lAu6rX
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=

From: Navneet Singh <navneet.singh@intel.com>

Endpoint decoder mode is used to represent the partition the decoder
points to such as ram or pmem.

Expand the mode to allow a decoder to point to a specific DC partition
(Region).

Signed-off-by: Navneet Singh <navneet.singh@intel.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Co-developed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 Documentation/ABI/testing/sysfs-bus-cxl | 25 +++++++++++++------------
 drivers/cxl/core/hdm.c                  | 16 ++++++++++++++++
 drivers/cxl/core/port.c                 | 16 +++++++++++-----
 drivers/cxl/cxl.h                       | 33 +++++++++++++++++----------------
 4 files changed, 57 insertions(+), 33 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-cxl b/Documentation/ABI/testing/sysfs-bus-cxl
index ff3ae83477f0876c0ee2d3955d27a11fa9d16d83..8d990d702f63363879150cf523c0be6229f315e0 100644
--- a/Documentation/ABI/testing/sysfs-bus-cxl
+++ b/Documentation/ABI/testing/sysfs-bus-cxl
@@ -361,23 +361,24 @@ Description:
 
 
 What:		/sys/bus/cxl/devices/decoderX.Y/mode
-Date:		May, 2022
-KernelVersion:	v6.0
+Date:		May, 2022, October 2024
+KernelVersion:	v6.0, v6.13 (dcY)
 Contact:	linux-cxl@vger.kernel.org
 Description:
 		(RW) When a CXL decoder is of devtype "cxl_decoder_endpoint" it
-		translates from a host physical address range, to a device local
-		address range. Device-local address ranges are further split
-		into a 'ram' (volatile memory) range and 'pmem' (persistent
-		memory) range. The 'mode' attribute emits one of 'ram', 'pmem',
-		'mixed', or 'none'. The 'mixed' indication is for error cases
-		when a decoder straddles the volatile/persistent partition
-		boundary, and 'none' indicates the decoder is not actively
-		decoding, or no DPA allocation policy has been set.
+		translates from a host physical address range, to a device
+		local address range. Device-local address ranges are further
+		split into a 'ram' (volatile memory) range, 'pmem' (persistent
+		memory) range, and Dynamic Capacity (DC) ranges. The 'mode'
+		attribute emits one of 'ram', 'pmem', 'dcY', 'mixed', or
+		'none'. The 'mixed' indication is for error cases when a
+		decoder straddles partition boundaries, and 'none' indicates
+		the decoder is not actively decoding, or no DPA allocation
+		policy has been set.
 
 		'mode' can be written, when the decoder is in the 'disabled'
-		state, with either 'ram' or 'pmem' to set the boundaries for the
-		next allocation.
+		state, with 'ram', 'pmem', or 'dcY' to set the boundaries for
+		the next allocation.
 
 
 What:		/sys/bus/cxl/devices/decoderX.Y/dpa_resource
diff --git a/drivers/cxl/core/hdm.c b/drivers/cxl/core/hdm.c
index 998aed17d7e47fc18a05fb2e8cca25de0e92a6d4..40799a0ca1d7af89b9af53cc098381e83b8c7e82 100644
--- a/drivers/cxl/core/hdm.c
+++ b/drivers/cxl/core/hdm.c
@@ -548,6 +548,7 @@ int cxl_dpa_set_mode(struct cxl_endpoint_decoder *cxled,
 	switch (mode) {
 	case CXL_DECODER_RAM:
 	case CXL_DECODER_PMEM:
+	case CXL_DECODER_DC0 ... CXL_DECODER_DC7:
 		break;
 	default:
 		dev_dbg(dev, "unsupported mode: %d\n", mode);
@@ -571,6 +572,21 @@ int cxl_dpa_set_mode(struct cxl_endpoint_decoder *cxled,
 		return -ENXIO;
 	}
 
+	if (mode >= CXL_DECODER_DC0 && mode <= CXL_DECODER_DC7) {
+		struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
+		int index;
+
+		index = dc_mode_to_region_index(mode);
+		if (!resource_size(&cxlds->dc_res[index])) {
+			dev_dbg(dev, "no available dynamic capacity\n");
+			return -ENXIO;
+		}
+		if (mds->dc_region[index].shareable) {
+			dev_err(dev, "DC region %d is shareable\n", index);
+			return -EINVAL;
+		}
+	}
+
 	cxled->mode = mode;
 	return 0;
 }
diff --git a/drivers/cxl/core/port.c b/drivers/cxl/core/port.c
index 85b912c11f04d2c743936eaac1f356975cb3cc71..2f42c8717a65586c769f0fd2016e8addc2552f9d 100644
--- a/drivers/cxl/core/port.c
+++ b/drivers/cxl/core/port.c
@@ -205,11 +205,17 @@ static ssize_t mode_store(struct device *dev, struct device_attribute *attr,
 	enum cxl_decoder_mode mode;
 	ssize_t rc;
 
-	if (sysfs_streq(buf, "pmem"))
-		mode = CXL_DECODER_PMEM;
-	else if (sysfs_streq(buf, "ram"))
-		mode = CXL_DECODER_RAM;
-	else
+	for (mode = 0; mode < CXL_DECODER_MODE_MAX; mode++)
+		if (sysfs_streq(buf, cxl_decoder_mode_names[mode]))
+			break;
+
+	if (mode == CXL_DECODER_NONE ||
+	    mode == CXL_DECODER_DEAD ||
+	    mode == CXL_DECODER_MODE_MAX)
+		return -EINVAL;
+
+	/* Not yet supported */
+	if (mode >= CXL_DECODER_MIXED)
 		return -EINVAL;
 
 	rc = cxl_dpa_set_mode(cxled, mode);
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index 8b7099c38a40d842e4f11137c3e9107031fbdf6a..486ceaafa85c3ac1efd438b6d6b9ccd0860dde45 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -380,27 +380,28 @@ enum cxl_decoder_mode {
 	CXL_DECODER_DC7,
 	CXL_DECODER_MIXED,
 	CXL_DECODER_DEAD,
+	CXL_DECODER_MODE_MAX,
+};
+
+static const char * const cxl_decoder_mode_names[] = {
+	[CXL_DECODER_NONE] = "none",
+	[CXL_DECODER_RAM] = "ram",
+	[CXL_DECODER_PMEM] = "pmem",
+	[CXL_DECODER_DC0] = "dc0",
+	[CXL_DECODER_DC1] = "dc1",
+	[CXL_DECODER_DC2] = "dc2",
+	[CXL_DECODER_DC3] = "dc3",
+	[CXL_DECODER_DC4] = "dc4",
+	[CXL_DECODER_DC5] = "dc5",
+	[CXL_DECODER_DC6] = "dc6",
+	[CXL_DECODER_DC7] = "dc7",
+	[CXL_DECODER_MIXED] = "mixed",
 };
 
 static inline const char *cxl_decoder_mode_name(enum cxl_decoder_mode mode)
 {
-	static const char * const names[] = {
-		[CXL_DECODER_NONE] = "none",
-		[CXL_DECODER_RAM] = "ram",
-		[CXL_DECODER_PMEM] = "pmem",
-		[CXL_DECODER_DC0] = "dc0",
-		[CXL_DECODER_DC1] = "dc1",
-		[CXL_DECODER_DC2] = "dc2",
-		[CXL_DECODER_DC3] = "dc3",
-		[CXL_DECODER_DC4] = "dc4",
-		[CXL_DECODER_DC5] = "dc5",
-		[CXL_DECODER_DC6] = "dc6",
-		[CXL_DECODER_DC7] = "dc7",
-		[CXL_DECODER_MIXED] = "mixed",
-	};
-
 	if (mode >= CXL_DECODER_NONE && mode <= CXL_DECODER_MIXED)
-		return names[mode];
+		return cxl_decoder_mode_names[mode];
 	return "mixed";
 }
 

-- 
2.47.0


