Return-Path: <linux-doc+bounces-29967-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3019BD514
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 19:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B0951F25C31
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 18:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42131F8EE2;
	Tue,  5 Nov 2024 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcCx48TZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D7A1EF087;
	Tue,  5 Nov 2024 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730831970; cv=none; b=Q2nawinWR9sIouxSFRIGOcABjevZPsWW8MJvDHt6M7ao1dlMt0MAd0ZH7ge3GZjIYE3yPSQSoRsFWpw/Kiu171z43bvRTdmWIUoCR3ttUfornQPgD1lTzfTft5kLhx6UezC8mTtO8SB+jyWVpiIlkD61LwfBZmZKRvAyuEQ2QEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730831970; c=relaxed/simple;
	bh=bnEctiqnhcq8DDFcZJSlzCJp/l6KgaL6xctnE6VOTwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aG2nfGhMGNnQ+UcA5IvEnr0YYiQbCFynmrzQ7qaAzPIW5yz0bfaFL1bHiGT6gGIfiHkiL1zz0mGJbAO6WoAI0uTgWQXB33iMu9zqBAizue5pI4Z9BOwoBDLThCWbm/nIx5vezL5KPDQx7dAGcRmPKtmx/9eX70VVSLaaC80UXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcCx48TZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730831969; x=1762367969;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=bnEctiqnhcq8DDFcZJSlzCJp/l6KgaL6xctnE6VOTwM=;
  b=TcCx48TZJtssqg5bxhZ+KotQWPU48AS44fWf/UTxUN1JMqYJMVP0eQdR
   qA6bkBmXdCvpI9M4pxJdaYXYRLgAGLDQGV/LwUvKW610HzWKA/C2WGt07
   MZWbEmrUMcD0zDMIlyfng+06bF+u9hqz/81O7G3MtFPHwRmnUMNN/U1A0
   rbfljoPDlO0d+/gNEMTaNJ7xWQeWqE7Y3lCe46NArtz1jxNSWbnVOBpGE
   3nTvvnXRyfGtG+nJWpbddxI1JjilmZC5sD5LRo10Wd3Dj/otcbZbzSx/b
   NzHvp1jvoMjvjNmhHdJhNsPaKSi653vIg/f7KUmjZg1kUbyEnvlBcJBJd
   w==;
X-CSE-ConnectionGUID: PVMbkRKDS7axDxu0gE9b1w==
X-CSE-MsgGUID: eoJ6MM4dRWqsDvV0/prW1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30012794"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30012794"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 10:39:28 -0800
X-CSE-ConnectionGUID: G1UVw/S8QbWunDfPxAmHpQ==
X-CSE-MsgGUID: irdCJ9nTT6CtPxDTw9YSrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="88624706"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO localhost) ([10.125.109.247])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 10:39:26 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Tue, 05 Nov 2024 12:38:44 -0600
Subject: [PATCH v6 22/27] dax/bus: Factor out dev dax resize logic
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-dcd-type2-upstream-v6-22-85c7fa2140fe@intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730831904; l=8814;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=bnEctiqnhcq8DDFcZJSlzCJp/l6KgaL6xctnE6VOTwM=;
 b=feH+6MtVYLvxcTW5NotMw6hp5x/w7aktveNJZTe5SVEHERiv3Rt2tdR9iy3Nwb8V2V7RVTlcd
 kZNZjN7/7W3A7OGoady6+ZXZVBF6Oazbv8a4NEvjhwFjOCpOg7jQI9l
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=

Dynamic Capacity regions must limit dev dax resources to those areas
which have extents backing real memory.  Such DAX regions are dubbed
'sparse' regions.  In order to manage where memory is available four
alternatives were considered:

1) Create a single region resource child on region creation which
   reserves the entire region.  Then as extents are added punch holes in
   this reservation.  This requires new resource manipulation to punch
   the holes and still requires an additional iteration over the extent
   areas which may already have existing dev dax resources used.

2) Maintain an ordered xarray of extents which can be queried while
   processing the resize logic.  The issue is that existing region->res
   children may artificially limit the allocation size sent to
   alloc_dev_dax_range().  IE the resource children can't be directly
   used in the resize logic to find where space in the region is.  This
   also poses a problem of managing the available size in 2 places.

3) Maintain a separate resource tree with extents.  This option is the
   same as 2) but with the different data structure.  Most ideally there
   should be a unified representation of the resource tree not two places
   to look for space.

4) Create region resource children for each extent.  Manage the dax dev
   resize logic in the same way as before but use a region child
   (extent) resource as the parents to find space within each extent.

Option 4 can leverage the existing resize algorithm to find space within
the extents.  It manages the available space in a singular resource tree
which is less complicated for finding space.

In preparation for this change, factor out the dev_dax_resize logic.
For static regions use dax_region->res as the parent to find space for
the dax ranges.  Future patches will use the same algorithm with
individual extent resources as the parent.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/dax/bus.c | 130 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 80 insertions(+), 50 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index d8cb5195a227c0f6194cb210510e006327e1b35b..c25942a3d1255cb5e5bf8d213e62933281ff3e4f 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -844,11 +844,9 @@ static int devm_register_dax_mapping(struct dev_dax *dev_dax, int range_id)
 	return 0;
 }
 
-static int alloc_dev_dax_range(struct dev_dax *dev_dax, u64 start,
-		resource_size_t size)
+static int alloc_dev_dax_range(struct resource *parent, struct dev_dax *dev_dax,
+			       u64 start, resource_size_t size)
 {
-	struct dax_region *dax_region = dev_dax->region;
-	struct resource *res = &dax_region->res;
 	struct device *dev = &dev_dax->dev;
 	struct dev_dax_range *ranges;
 	unsigned long pgoff = 0;
@@ -866,14 +864,14 @@ static int alloc_dev_dax_range(struct dev_dax *dev_dax, u64 start,
 		return 0;
 	}
 
-	alloc = __request_region(res, start, size, dev_name(dev), 0);
+	alloc = __request_region(parent, start, size, dev_name(dev), 0);
 	if (!alloc)
 		return -ENOMEM;
 
 	ranges = krealloc(dev_dax->ranges, sizeof(*ranges)
 			* (dev_dax->nr_range + 1), GFP_KERNEL);
 	if (!ranges) {
-		__release_region(res, alloc->start, resource_size(alloc));
+		__release_region(parent, alloc->start, resource_size(alloc));
 		return -ENOMEM;
 	}
 
@@ -1026,50 +1024,45 @@ static bool adjust_ok(struct dev_dax *dev_dax, struct resource *res)
 	return true;
 }
 
-static ssize_t dev_dax_resize(struct dax_region *dax_region,
-		struct dev_dax *dev_dax, resource_size_t size)
+/**
+ * dev_dax_resize_static - Expand the device into the unused portion of the
+ * region. This may involve adjusting the end of an existing resource, or
+ * allocating a new resource.
+ *
+ * @parent: parent resource to allocate this range in
+ * @dev_dax: DAX device to be expanded
+ * @to_alloc: amount of space to alloc; must be <= space available in @parent
+ *
+ * Return the amount of space allocated or -ERRNO on failure
+ */
+static ssize_t dev_dax_resize_static(struct resource *parent,
+				     struct dev_dax *dev_dax,
+				     resource_size_t to_alloc)
 {
-	resource_size_t avail = dax_region_avail_size(dax_region), to_alloc;
-	resource_size_t dev_size = dev_dax_size(dev_dax);
-	struct resource *region_res = &dax_region->res;
-	struct device *dev = &dev_dax->dev;
 	struct resource *res, *first;
-	resource_size_t alloc = 0;
 	int rc;
 
-	if (dev->driver)
-		return -EBUSY;
-	if (size == dev_size)
-		return 0;
-	if (size > dev_size && size - dev_size > avail)
-		return -ENOSPC;
-	if (size < dev_size)
-		return dev_dax_shrink(dev_dax, size);
-
-	to_alloc = size - dev_size;
-	if (dev_WARN_ONCE(dev, !alloc_is_aligned(dev_dax, to_alloc),
-			"resize of %pa misaligned\n", &to_alloc))
-		return -ENXIO;
-
-	/*
-	 * Expand the device into the unused portion of the region. This
-	 * may involve adjusting the end of an existing resource, or
-	 * allocating a new resource.
-	 */
-retry:
-	first = region_res->child;
-	if (!first)
-		return alloc_dev_dax_range(dev_dax, dax_region->res.start, to_alloc);
+	first = parent->child;
+	if (!first) {
+		rc = alloc_dev_dax_range(parent, dev_dax,
+					   parent->start, to_alloc);
+		if (rc)
+			return rc;
+		return to_alloc;
+	}
 
-	rc = -ENOSPC;
 	for (res = first; res; res = res->sibling) {
 		struct resource *next = res->sibling;
+		resource_size_t alloc;
 
 		/* space at the beginning of the region */
-		if (res == first && res->start > dax_region->res.start) {
-			alloc = min(res->start - dax_region->res.start, to_alloc);
-			rc = alloc_dev_dax_range(dev_dax, dax_region->res.start, alloc);
-			break;
+		if (res == first && res->start > parent->start) {
+			alloc = min(res->start - parent->start, to_alloc);
+			rc = alloc_dev_dax_range(parent, dev_dax,
+						 parent->start, alloc);
+			if (rc)
+				return rc;
+			return alloc;
 		}
 
 		alloc = 0;
@@ -1078,21 +1071,56 @@ static ssize_t dev_dax_resize(struct dax_region *dax_region,
 			alloc = min(next->start - (res->end + 1), to_alloc);
 
 		/* space at the end of the region */
-		if (!alloc && !next && res->end < region_res->end)
-			alloc = min(region_res->end - res->end, to_alloc);
+		if (!alloc && !next && res->end < parent->end)
+			alloc = min(parent->end - res->end, to_alloc);
 
 		if (!alloc)
 			continue;
 
 		if (adjust_ok(dev_dax, res)) {
 			rc = adjust_dev_dax_range(dev_dax, res, resource_size(res) + alloc);
-			break;
+			if (rc)
+				return rc;
+			return alloc;
 		}
-		rc = alloc_dev_dax_range(dev_dax, res->end + 1, alloc);
-		break;
+		rc = alloc_dev_dax_range(parent, dev_dax, res->end + 1, alloc);
+		if (rc)
+			return rc;
+		return alloc;
 	}
-	if (rc)
-		return rc;
+
+	/* available was already calculated and should never be an issue */
+	dev_WARN_ONCE(&dev_dax->dev, 1, "space not found?");
+	return 0;
+}
+
+static ssize_t dev_dax_resize(struct dax_region *dax_region,
+		struct dev_dax *dev_dax, resource_size_t size)
+{
+	resource_size_t avail = dax_region_avail_size(dax_region);
+	resource_size_t dev_size = dev_dax_size(dev_dax);
+	struct device *dev = &dev_dax->dev;
+	resource_size_t to_alloc;
+	resource_size_t alloc;
+
+	if (dev->driver)
+		return -EBUSY;
+	if (size == dev_size)
+		return 0;
+	if (size > dev_size && size - dev_size > avail)
+		return -ENOSPC;
+	if (size < dev_size)
+		return dev_dax_shrink(dev_dax, size);
+
+	to_alloc = size - dev_size;
+	if (dev_WARN_ONCE(dev, !alloc_is_aligned(dev_dax, to_alloc),
+			"resize of %pa misaligned\n", &to_alloc))
+		return -ENXIO;
+
+retry:
+	alloc = dev_dax_resize_static(&dax_region->res, dev_dax, to_alloc);
+	if (alloc <= 0)
+		return alloc;
 	to_alloc -= alloc;
 	if (to_alloc)
 		goto retry;
@@ -1198,7 +1226,8 @@ static ssize_t mapping_store(struct device *dev, struct device_attribute *attr,
 
 	to_alloc = range_len(&r);
 	if (alloc_is_aligned(dev_dax, to_alloc))
-		rc = alloc_dev_dax_range(dev_dax, r.start, to_alloc);
+		rc = alloc_dev_dax_range(&dax_region->res, dev_dax, r.start,
+					 to_alloc);
 	up_write(&dax_dev_rwsem);
 	up_write(&dax_region_rwsem);
 
@@ -1466,7 +1495,8 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 	device_initialize(dev);
 	dev_set_name(dev, "dax%d.%d", dax_region->id, dev_dax->id);
 
-	rc = alloc_dev_dax_range(dev_dax, dax_region->res.start, data->size);
+	rc = alloc_dev_dax_range(&dax_region->res, dev_dax, dax_region->res.start,
+				 data->size);
 	if (rc)
 		goto err_range;
 

-- 
2.47.0


