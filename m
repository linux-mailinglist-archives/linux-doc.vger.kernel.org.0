Return-Path: <linux-doc+bounces-30255-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918A19C107D
	for <lists+linux-doc@lfdr.de>; Thu,  7 Nov 2024 22:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5107A28183C
	for <lists+linux-doc@lfdr.de>; Thu,  7 Nov 2024 21:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBF8218D86;
	Thu,  7 Nov 2024 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3/t4ENN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41160226251;
	Thu,  7 Nov 2024 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731013165; cv=none; b=UqftRQ+59yUZpA96nqZr48LHejwT6/BKJk42qiWirnLBIO96j0eNe60Bc4675Z+0RMIIsl7ViQnvn0513VPp5/IhYDG+Z6NQ3Fs6JsxAb3U9X07dJR+ogMSYd3QuPVOrUG9jcPsDCDoFNd5Fd3Ng0dKT9sMgPMy4F1qgZfzJJCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731013165; c=relaxed/simple;
	bh=YL8gieVgJUrtJTQckolrvXAf+U1Thtz2NC/7S2sQJco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESR6RQ+EN5btQbNDqL0qGCFGRNyKqgRd+qCBU1R6n2YdlRiIZ513t15gf66LUgGfCp34rVEHWHUVlLYc2AbPx+2OQDM9fEPZ+9gPFlvBbOfE66E7dDUr9NvFP+S5y/7ipFTPweA3H63zclnXGqir4J8EaNh9G/LRlG6HIdC3VgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3/t4ENN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731013163; x=1762549163;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=YL8gieVgJUrtJTQckolrvXAf+U1Thtz2NC/7S2sQJco=;
  b=e3/t4ENNMcqB90+aYeiJuptGE1wpf6Y/X7ftaXSdtXyqZy3MhwtJ1JXM
   0MOka9yY8MjEg5y8ZRYs7+zjNgEgDI1T3+/7vHhRh9UiwtpGBiTRmfSat
   rn7nYhV82ZNgOwJPMOOWQrAICi9h1UEmxqZ+pokcPSxakEfsOuvPAvd9o
   BYcj+02WQblLy/ha0Lf+0E8xVAbfLfpEwf6nrrzkBD4aaDhYa8pPeWgLU
   QOKV55kZdKbDxS/vMxA0xvPa96X0ir05triYgmXS5eDEcFu+o8vU6XL7U
   pMJR5YLd0bEw5k23dMj4ft+PQELne1qCYIG2DwHR3mTofBewnjKtcZA5V
   g==;
X-CSE-ConnectionGUID: sXLv7tzcS2ac6vB/R/E55w==
X-CSE-MsgGUID: HYn/8ForT4SIekVaZNujfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33727880"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="33727880"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 12:59:23 -0800
X-CSE-ConnectionGUID: 3FzPCOiWSM+HUsMAe3XYKw==
X-CSE-MsgGUID: FUqFIWxATs+oTPxZDFrM4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89875979"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost) ([10.125.110.195])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 12:59:20 -0800
From: ira.weiny@intel.com
Date: Thu, 07 Nov 2024 14:58:41 -0600
Subject: [PATCH v7 23/27] dax/region: Create resources on sparse DAX
 regions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-dcd-type2-upstream-v7-23-56a84e66bc36@intel.com>
References: <20241107-dcd-type2-upstream-v7-0-56a84e66bc36@intel.com>
In-Reply-To: <20241107-dcd-type2-upstream-v7-0-56a84e66bc36@intel.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731013104; l=30187;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=Uj79rOCwTA7iwFH1fj2KpTFYqkohy5bZvWtkj/ZlLN8=;
 b=2wNA2Yx7CByAO4e6sFSxXxLGxA1/3ZEZolUC2gpaHAySDj0sjbjTlFWfvD7J3i7fVXVvOJGWa
 G4eK+OyPVv5BT2CXQicsJfWKW+IXsUJgWyOuEQTwduONV7dygKcIStC
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=

From: Navneet Singh <navneet.singh@intel.com>

DAX regions which map dynamic capacity partitions require that memory be
allowed to come and go.  Recall sparse regions were created for this
purpose.  Now that extents can be realized within DAX regions the DAX
region driver can start tracking sub-resource information.

The tight relationship between DAX region operations and extent
operations require memory changes to be controlled synchronously with
the user of the region.  Synchronize through the dax_region_rwsem and by
having the region driver drive both the region device as well as the
extent sub-devices.

Recall requests to remove extents can happen at any time and that a host
is not obligated to release the memory until it is not being used.  If
an extent is not used allow a release response.

When extents are eligible for release.  No mappings exist but data may
reside in caches not yet written to the device.  Call
cxl_region_invalidate_memregion() to write back data to the device prior
to signaling the release complete.

Speculative writes after a release may dirty the cache such that a read
from a newly surfaced extent may not come from the device.  Call
cxl_region_invalidate_memregion() prior to bringing a new extent online
to ensure the cache is marked invalid.

While these invalidate calls are inefficient they are the best we can do
to ensure cache consistency without back invalidate.  Furthermore this
should occur infrequently with sufficiently large extents and work loads
to not be too bad of an impact.

The DAX layer has no need for the details of the CXL memory extent
devices.  Expose extents to the DAX layer as device children of the DAX
region device.  A single callback from the driver aids the DAX layer to
determine if the child device is an extent.  The DAX layer also
registers a devres function to automatically clean up when the device is
removed from the region.

There is a race between extents being surfaced and the dax_cxl driver
being loaded.  The driver must therefore scan for any existing extents
while still under the device lock.

Respond to extent notifications.  Manage the DAX region resource tree
based on the extents lifetime.  Return the status of remove
notifications to lower layers such that it can manage the hardware
appropriately.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Navneet Singh <navneet.singh@intel.com>
Co-developed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/cxl/core/core.h   |   2 +
 drivers/cxl/core/extent.c |  85 ++++++++++++++--
 drivers/cxl/core/region.c |   2 +-
 drivers/cxl/cxl.h         |   6 ++
 drivers/dax/bus.c         | 246 +++++++++++++++++++++++++++++++++++++++++-----
 drivers/dax/bus.h         |   3 +-
 drivers/dax/cxl.c         |  61 +++++++++++-
 drivers/dax/dax-private.h |  40 ++++++++
 drivers/dax/hmem/hmem.c   |   2 +-
 drivers/dax/pmem.c        |   2 +-
 include/linux/ioport.h    |   3 +
 11 files changed, 413 insertions(+), 39 deletions(-)

diff --git a/drivers/cxl/core/core.h b/drivers/cxl/core/core.h
index 0eccdd0b9261467fe762aa665776c87c5cb9ce24..c5951018f8ff590627676eeb7a430b6acbf516d8 100644
--- a/drivers/cxl/core/core.h
+++ b/drivers/cxl/core/core.h
@@ -21,6 +21,8 @@ cxled_to_mds(struct cxl_endpoint_decoder *cxled)
 	return container_of(cxlds, struct cxl_memdev_state, cxlds);
 }
 
+int cxl_region_invalidate_memregion(struct cxl_region *cxlr);
+
 #ifdef CONFIG_CXL_REGION
 extern struct device_attribute dev_attr_create_pmem_region;
 extern struct device_attribute dev_attr_create_ram_region;
diff --git a/drivers/cxl/core/extent.c b/drivers/cxl/core/extent.c
index 9f493aa8a5a26ca1dbaae48a396f67f0e644e1ce..841cede20d508eaa907af62dc245149b8b37d5bd 100644
--- a/drivers/cxl/core/extent.c
+++ b/drivers/cxl/core/extent.c
@@ -117,6 +117,12 @@ static void region_extent_unregister(void *ext)
 
 	dev_dbg(&region_extent->dev, "DAX region rm extent HPA [range 0x%016llx-0x%016llx]\n",
 		region_extent->hpa_range.start, region_extent->hpa_range.end);
+	/*
+	 * Extent is not in use or an error has occur.  No mappings
+	 * exist at this point.  Write and invalidate caches to ensure
+	 * the device has all data prior to final release.
+	 */
+	cxl_region_invalidate_memregion(region_extent->cxlr_dax->cxlr);
 	device_unregister(&region_extent->dev);
 }
 
@@ -270,20 +276,67 @@ static void calc_hpa_range(struct cxl_endpoint_decoder *cxled,
 	hpa_range->end = hpa_range->start + range_len(dpa_range) - 1;
 }
 
+static int cxlr_notify_extent(struct cxl_region *cxlr, enum dc_event event,
+			      struct region_extent *region_extent)
+{
+	struct device *dev = &cxlr->cxlr_dax->dev;
+	struct cxl_notify_data notify_data;
+	struct cxl_driver *driver;
+
+	dev_dbg(dev, "Trying notify: type %d HPA [range 0x%016llx-0x%016llx]\n",
+		event,
+		region_extent->hpa_range.start, region_extent->hpa_range.end);
+
+	guard(device)(dev);
+
+	/*
+	 * The lack of a driver indicates a notification has failed.  No user
+	 * space coordination was possible.
+	 */
+	if (!dev->driver)
+		return 0;
+	driver = to_cxl_drv(dev->driver);
+	if (!driver->notify)
+		return 0;
+
+	notify_data = (struct cxl_notify_data) {
+		.event = event,
+		.region_extent = region_extent,
+	};
+
+	dev_dbg(dev, "Notify: type %d HPA [range 0x%016llx-0x%016llx]\n",
+		event,
+		region_extent->hpa_range.start, region_extent->hpa_range.end);
+	return driver->notify(dev, &notify_data);
+}
+
+struct rm_data {
+	struct cxl_region *cxlr;
+	struct range *range;
+};
+
 static int cxlr_rm_extent(struct device *dev, void *data)
 {
 	struct region_extent *region_extent = to_region_extent(dev);
-	struct range *region_hpa_range = data;
+	struct rm_data *rm_data = data;
+	int rc;
 
 	if (!region_extent)
 		return 0;
 
 	/*
-	 * Any extent which 'touches' the released range is removed.
+	 * Any extent which 'touches' the released range is attempted to be
+	 * removed.
 	 */
-	if (range_overlaps(region_hpa_range, &region_extent->hpa_range)) {
+	if (range_overlaps(rm_data->range, &region_extent->hpa_range)) {
+		struct cxl_region *cxlr = rm_data->cxlr;
+
 		dev_dbg(dev, "Remove region extent HPA [range 0x%016llx-0x%016llx]\n",
 			region_extent->hpa_range.start, region_extent->hpa_range.end);
+		rc = cxlr_notify_extent(cxlr, DCD_RELEASE_CAPACITY, region_extent);
+		if (rc == -EBUSY)
+			return 0;
+
 		region_rm_extent(region_extent);
 	}
 	return 0;
@@ -328,8 +381,13 @@ int cxl_rm_extent(struct cxl_memdev_state *mds, struct cxl_extent *extent)
 
 	calc_hpa_range(cxled, cxlr->cxlr_dax, &dpa_range, &hpa_range);
 
+	struct rm_data rm_data = {
+		.cxlr = cxlr,
+		.range = &hpa_range,
+	};
+
 	/* Remove region extents which overlap */
-	return device_for_each_child(&cxlr->cxlr_dax->dev, &hpa_range,
+	return device_for_each_child(&cxlr->cxlr_dax->dev, &rm_data,
 				     cxlr_rm_extent);
 }
 
@@ -354,8 +412,23 @@ static int cxlr_add_extent(struct cxl_dax_region *cxlr_dax,
 		return rc;
 	}
 
-	/* device model handles freeing region_extent */
-	return online_region_extent(region_extent);
+	/* Ensure caches are clean prior onlining */
+	cxl_region_invalidate_memregion(cxlr_dax->cxlr);
+
+	rc = online_region_extent(region_extent);
+	/* device model handled freeing region_extent */
+	if (rc)
+		return rc;
+
+	rc = cxlr_notify_extent(cxlr_dax->cxlr, DCD_ADD_CAPACITY, region_extent);
+	/*
+	 * The region device was briefly live but DAX layer ensures it was not
+	 * used
+	 */
+	if (rc)
+		region_rm_extent(region_extent);
+
+	return rc;
 }
 
 /* Callers are expected to ensure cxled has been attached to a region */
diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index 6ae51fc2bdae22fc25cc73773916714171512e92..7de9d7bd85a3d45567885874cc1d61cb10b816a5 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -223,7 +223,7 @@ static struct cxl_region_ref *cxl_rr_load(struct cxl_port *port,
 	return xa_load(&port->regions, (unsigned long)cxlr);
 }
 
-static int cxl_region_invalidate_memregion(struct cxl_region *cxlr)
+int cxl_region_invalidate_memregion(struct cxl_region *cxlr)
 {
 	if (!cpu_cache_has_invalidate_memregion()) {
 		if (IS_ENABLED(CONFIG_CXL_REGION_INVALIDATION_TEST)) {
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index 8a4c24ee7d216752a3351e29b9e5782a1a262f19..984554e9e8c255f9ceab18e9b0d57f0536b4e15f 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -918,10 +918,16 @@ bool is_cxl_region(struct device *dev);
 
 extern struct bus_type cxl_bus_type;
 
+struct cxl_notify_data {
+	enum dc_event event;
+	struct region_extent *region_extent;
+};
+
 struct cxl_driver {
 	const char *name;
 	int (*probe)(struct device *dev);
 	void (*remove)(struct device *dev);
+	int (*notify)(struct device *dev, struct cxl_notify_data *notify_data);
 	struct device_driver drv;
 	int id;
 };
diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index c25942a3d1255cb5e5bf8d213e62933281ff3e4f..a54961fc393d71eda4a26f871597c6ffbb2023f8 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -183,6 +183,93 @@ static bool is_sparse(struct dax_region *dax_region)
 	return (dax_region->res.flags & IORESOURCE_DAX_SPARSE_CAP) != 0;
 }
 
+static void __dax_release_resource(struct dax_resource *dax_resource)
+{
+	struct dax_region *dax_region = dax_resource->region;
+
+	lockdep_assert_held_write(&dax_region_rwsem);
+	dev_dbg(dax_region->dev, "Extent release resource %pr\n",
+		dax_resource->res);
+	if (dax_resource->res)
+		__release_region(&dax_region->res, dax_resource->res->start,
+				 resource_size(dax_resource->res));
+	dax_resource->res = NULL;
+}
+
+static void dax_release_resource(void *res)
+{
+	struct dax_resource *dax_resource = res;
+
+	guard(rwsem_write)(&dax_region_rwsem);
+	__dax_release_resource(dax_resource);
+	kfree(dax_resource);
+}
+
+int dax_region_add_resource(struct dax_region *dax_region,
+			    struct device *device,
+			    resource_size_t start, resource_size_t length)
+{
+	struct resource *new_resource;
+	int rc;
+
+	struct dax_resource *dax_resource __free(kfree) =
+				kzalloc(sizeof(*dax_resource), GFP_KERNEL);
+	if (!dax_resource)
+		return -ENOMEM;
+
+	guard(rwsem_write)(&dax_region_rwsem);
+
+	dev_dbg(dax_region->dev, "DAX region resource %pr\n", &dax_region->res);
+	new_resource = __request_region(&dax_region->res, start, length, "extent", 0);
+	if (!new_resource) {
+		dev_err(dax_region->dev, "Failed to add region s:%pa l:%pa\n",
+			&start, &length);
+		return -ENOSPC;
+	}
+
+	dev_dbg(dax_region->dev, "add resource %pr\n", new_resource);
+	dax_resource->region = dax_region;
+	dax_resource->res = new_resource;
+
+	/*
+	 * open code devm_add_action_or_reset() to avoid recursive write lock
+	 * of dax_region_rwsem in the error case.
+	 */
+	rc = devm_add_action(device, dax_release_resource, dax_resource);
+	if (rc) {
+		__dax_release_resource(dax_resource);
+		return rc;
+	}
+
+	dev_set_drvdata(device, no_free_ptr(dax_resource));
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dax_region_add_resource);
+
+int dax_region_rm_resource(struct dax_region *dax_region,
+			   struct device *dev)
+{
+	struct dax_resource *dax_resource;
+
+	guard(rwsem_write)(&dax_region_rwsem);
+
+	dax_resource = dev_get_drvdata(dev);
+	if (!dax_resource)
+		return 0;
+
+	if (dax_resource->use_cnt)
+		return -EBUSY;
+
+	/*
+	 * release the resource under dax_region_rwsem to avoid races with
+	 * users trying to use the extent
+	 */
+	__dax_release_resource(dax_resource);
+	dev_set_drvdata(dev, NULL);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dax_region_rm_resource);
+
 bool static_dev_dax(struct dev_dax *dev_dax)
 {
 	return is_static(dev_dax->region);
@@ -296,19 +383,41 @@ static ssize_t region_align_show(struct device *dev,
 static struct device_attribute dev_attr_region_align =
 		__ATTR(align, 0400, region_align_show, NULL);
 
+resource_size_t
+dax_avail_size(struct resource *dax_resource)
+{
+	resource_size_t rc;
+	struct resource *used_res;
+
+	rc = resource_size(dax_resource);
+	for_each_child_resource(dax_resource, used_res)
+		rc -= resource_size(used_res);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(dax_avail_size);
+
 #define for_each_dax_region_resource(dax_region, res) \
 	for (res = (dax_region)->res.child; res; res = res->sibling)
 
 static unsigned long long dax_region_avail_size(struct dax_region *dax_region)
 {
-	resource_size_t size = resource_size(&dax_region->res);
+	resource_size_t size;
 	struct resource *res;
 
 	lockdep_assert_held(&dax_region_rwsem);
 
-	if (is_sparse(dax_region))
-		return 0;
+	if (is_sparse(dax_region)) {
+		/*
+		 * Children of a sparse region represent available space not
+		 * used space.
+		 */
+		size = 0;
+		for_each_dax_region_resource(dax_region, res)
+			size += dax_avail_size(res);
+		return size;
+	}
 
+	size = resource_size(&dax_region->res);
 	for_each_dax_region_resource(dax_region, res)
 		size -= resource_size(res);
 	return size;
@@ -449,15 +558,26 @@ EXPORT_SYMBOL_GPL(kill_dev_dax);
 static void trim_dev_dax_range(struct dev_dax *dev_dax)
 {
 	int i = dev_dax->nr_range - 1;
-	struct range *range = &dev_dax->ranges[i].range;
+	struct dev_dax_range *dev_range = &dev_dax->ranges[i];
+	struct range *range = &dev_range->range;
 	struct dax_region *dax_region = dev_dax->region;
+	struct resource *res = &dax_region->res;
 
 	lockdep_assert_held_write(&dax_region_rwsem);
 	dev_dbg(&dev_dax->dev, "delete range[%d]: %#llx:%#llx\n", i,
 		(unsigned long long)range->start,
 		(unsigned long long)range->end);
 
-	__release_region(&dax_region->res, range->start, range_len(range));
+	if (dev_range->dax_resource) {
+		res = dev_range->dax_resource->res;
+		dev_dbg(&dev_dax->dev, "Trim sparse extent %pr\n", res);
+	}
+
+	__release_region(res, range->start, range_len(range));
+
+	if (dev_range->dax_resource)
+		dev_range->dax_resource->use_cnt--;
+
 	if (--dev_dax->nr_range == 0) {
 		kfree(dev_dax->ranges);
 		dev_dax->ranges = NULL;
@@ -640,7 +760,7 @@ static void dax_region_unregister(void *region)
 
 struct dax_region *alloc_dax_region(struct device *parent, int region_id,
 		struct range *range, int target_node, unsigned int align,
-		unsigned long flags)
+		unsigned long flags, struct dax_sparse_ops *sparse_ops)
 {
 	struct dax_region *dax_region;
 
@@ -658,12 +778,16 @@ struct dax_region *alloc_dax_region(struct device *parent, int region_id,
 			|| !IS_ALIGNED(range_len(range), align))
 		return NULL;
 
+	if (!sparse_ops && (flags & IORESOURCE_DAX_SPARSE_CAP))
+		return NULL;
+
 	dax_region = kzalloc(sizeof(*dax_region), GFP_KERNEL);
 	if (!dax_region)
 		return NULL;
 
 	dev_set_drvdata(parent, dax_region);
 	kref_init(&dax_region->kref);
+	dax_region->sparse_ops = sparse_ops;
 	dax_region->id = region_id;
 	dax_region->align = align;
 	dax_region->dev = parent;
@@ -845,7 +969,8 @@ static int devm_register_dax_mapping(struct dev_dax *dev_dax, int range_id)
 }
 
 static int alloc_dev_dax_range(struct resource *parent, struct dev_dax *dev_dax,
-			       u64 start, resource_size_t size)
+			       u64 start, resource_size_t size,
+			       struct dax_resource *dax_resource)
 {
 	struct device *dev = &dev_dax->dev;
 	struct dev_dax_range *ranges;
@@ -884,6 +1009,7 @@ static int alloc_dev_dax_range(struct resource *parent, struct dev_dax *dev_dax,
 			.start = alloc->start,
 			.end = alloc->end,
 		},
+		.dax_resource = dax_resource,
 	};
 
 	dev_dbg(dev, "alloc range[%d]: %pa:%pa\n", dev_dax->nr_range - 1,
@@ -966,7 +1092,8 @@ static int dev_dax_shrink(struct dev_dax *dev_dax, resource_size_t size)
 	int i;
 
 	for (i = dev_dax->nr_range - 1; i >= 0; i--) {
-		struct range *range = &dev_dax->ranges[i].range;
+		struct dev_dax_range *dev_range = &dev_dax->ranges[i];
+		struct range *range = &dev_range->range;
 		struct dax_mapping *mapping = dev_dax->ranges[i].mapping;
 		struct resource *adjust = NULL, *res;
 		resource_size_t shrink;
@@ -982,12 +1109,21 @@ static int dev_dax_shrink(struct dev_dax *dev_dax, resource_size_t size)
 			continue;
 		}
 
-		for_each_dax_region_resource(dax_region, res)
-			if (strcmp(res->name, dev_name(dev)) == 0
-					&& res->start == range->start) {
-				adjust = res;
-				break;
-			}
+		if (dev_range->dax_resource) {
+			for_each_child_resource(dev_range->dax_resource->res, res)
+				if (strcmp(res->name, dev_name(dev)) == 0
+						&& res->start == range->start) {
+					adjust = res;
+					break;
+				}
+		} else {
+			for_each_dax_region_resource(dax_region, res)
+				if (strcmp(res->name, dev_name(dev)) == 0
+						&& res->start == range->start) {
+					adjust = res;
+					break;
+				}
+		}
 
 		if (dev_WARN_ONCE(dev, !adjust || i != dev_dax->nr_range - 1,
 					"failed to find matching resource\n"))
@@ -1025,19 +1161,21 @@ static bool adjust_ok(struct dev_dax *dev_dax, struct resource *res)
 }
 
 /**
- * dev_dax_resize_static - Expand the device into the unused portion of the
- * region. This may involve adjusting the end of an existing resource, or
- * allocating a new resource.
+ * __dev_dax_resize - Expand the device into the unused portion of the region.
+ * This may involve adjusting the end of an existing resource, or allocating a
+ * new resource.
  *
  * @parent: parent resource to allocate this range in
  * @dev_dax: DAX device to be expanded
  * @to_alloc: amount of space to alloc; must be <= space available in @parent
+ * @dax_resource: if sparse; the parent resource
  *
  * Return the amount of space allocated or -ERRNO on failure
  */
-static ssize_t dev_dax_resize_static(struct resource *parent,
-				     struct dev_dax *dev_dax,
-				     resource_size_t to_alloc)
+static ssize_t __dev_dax_resize(struct resource *parent,
+				struct dev_dax *dev_dax,
+				resource_size_t to_alloc,
+				struct dax_resource *dax_resource)
 {
 	struct resource *res, *first;
 	int rc;
@@ -1045,7 +1183,8 @@ static ssize_t dev_dax_resize_static(struct resource *parent,
 	first = parent->child;
 	if (!first) {
 		rc = alloc_dev_dax_range(parent, dev_dax,
-					   parent->start, to_alloc);
+					   parent->start, to_alloc,
+					   dax_resource);
 		if (rc)
 			return rc;
 		return to_alloc;
@@ -1059,7 +1198,8 @@ static ssize_t dev_dax_resize_static(struct resource *parent,
 		if (res == first && res->start > parent->start) {
 			alloc = min(res->start - parent->start, to_alloc);
 			rc = alloc_dev_dax_range(parent, dev_dax,
-						 parent->start, alloc);
+						 parent->start, alloc,
+						 dax_resource);
 			if (rc)
 				return rc;
 			return alloc;
@@ -1083,7 +1223,8 @@ static ssize_t dev_dax_resize_static(struct resource *parent,
 				return rc;
 			return alloc;
 		}
-		rc = alloc_dev_dax_range(parent, dev_dax, res->end + 1, alloc);
+		rc = alloc_dev_dax_range(parent, dev_dax, res->end + 1, alloc,
+					 dax_resource);
 		if (rc)
 			return rc;
 		return alloc;
@@ -1094,6 +1235,51 @@ static ssize_t dev_dax_resize_static(struct resource *parent,
 	return 0;
 }
 
+static ssize_t dev_dax_resize_static(struct dax_region *dax_region,
+				     struct dev_dax *dev_dax,
+				     resource_size_t to_alloc)
+{
+	return __dev_dax_resize(&dax_region->res, dev_dax, to_alloc, NULL);
+}
+
+static int find_free_extent(struct device *dev, void *data)
+{
+	struct dax_region *dax_region = data;
+	struct dax_resource *dax_resource;
+
+	if (!dax_region->sparse_ops->is_extent(dev))
+		return 0;
+
+	dax_resource = dev_get_drvdata(dev);
+	if (!dax_resource || !dax_avail_size(dax_resource->res))
+		return 0;
+	return 1;
+}
+
+static ssize_t dev_dax_resize_sparse(struct dax_region *dax_region,
+				     struct dev_dax *dev_dax,
+				     resource_size_t to_alloc)
+{
+	struct dax_resource *dax_resource;
+	ssize_t alloc;
+
+	struct device *extent_dev __free(put_device) =
+			device_find_child(dax_region->dev, dax_region,
+					  find_free_extent);
+	if (!extent_dev)
+		return 0;
+
+	dax_resource = dev_get_drvdata(extent_dev);
+	if (!dax_resource)
+		return 0;
+
+	to_alloc = min(dax_avail_size(dax_resource->res), to_alloc);
+	alloc = __dev_dax_resize(dax_resource->res, dev_dax, to_alloc, dax_resource);
+	if (alloc > 0)
+		dax_resource->use_cnt++;
+	return alloc;
+}
+
 static ssize_t dev_dax_resize(struct dax_region *dax_region,
 		struct dev_dax *dev_dax, resource_size_t size)
 {
@@ -1118,7 +1304,10 @@ static ssize_t dev_dax_resize(struct dax_region *dax_region,
 		return -ENXIO;
 
 retry:
-	alloc = dev_dax_resize_static(&dax_region->res, dev_dax, to_alloc);
+	if (is_sparse(dax_region))
+		alloc = dev_dax_resize_sparse(dax_region, dev_dax, to_alloc);
+	else
+		alloc = dev_dax_resize_static(dax_region, dev_dax, to_alloc);
 	if (alloc <= 0)
 		return alloc;
 	to_alloc -= alloc;
@@ -1227,7 +1416,7 @@ static ssize_t mapping_store(struct device *dev, struct device_attribute *attr,
 	to_alloc = range_len(&r);
 	if (alloc_is_aligned(dev_dax, to_alloc))
 		rc = alloc_dev_dax_range(&dax_region->res, dev_dax, r.start,
-					 to_alloc);
+					 to_alloc, NULL);
 	up_write(&dax_dev_rwsem);
 	up_write(&dax_region_rwsem);
 
@@ -1466,6 +1655,11 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 	struct device *dev;
 	int rc;
 
+	if (is_sparse(dax_region) && data->size) {
+		dev_err(parent, "Sparse DAX region devices must be created initially with 0 size");
+		return ERR_PTR(-EINVAL);
+	}
+
 	dev_dax = kzalloc(sizeof(*dev_dax), GFP_KERNEL);
 	if (!dev_dax)
 		return ERR_PTR(-ENOMEM);
@@ -1496,7 +1690,7 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 	dev_set_name(dev, "dax%d.%d", dax_region->id, dev_dax->id);
 
 	rc = alloc_dev_dax_range(&dax_region->res, dev_dax, dax_region->res.start,
-				 data->size);
+				 data->size, NULL);
 	if (rc)
 		goto err_range;
 
diff --git a/drivers/dax/bus.h b/drivers/dax/bus.h
index 783bfeef42cc6c4d74f24e0a69dac5598eaf1664..ae5029ea6047c5c640a504e1bb3d815a75498a3a 100644
--- a/drivers/dax/bus.h
+++ b/drivers/dax/bus.h
@@ -9,6 +9,7 @@ struct dev_dax;
 struct resource;
 struct dax_device;
 struct dax_region;
+struct dax_sparse_ops;
 
 /* dax bus specific ioresource flags */
 #define IORESOURCE_DAX_STATIC BIT(0)
@@ -17,7 +18,7 @@ struct dax_region;
 
 struct dax_region *alloc_dax_region(struct device *parent, int region_id,
 		struct range *range, int target_node, unsigned int align,
-		unsigned long flags);
+		unsigned long flags, struct dax_sparse_ops *sparse_ops);
 
 struct dev_dax_data {
 	struct dax_region *dax_region;
diff --git a/drivers/dax/cxl.c b/drivers/dax/cxl.c
index 367e86b1c22a2a0af7070677a7b7fc54bc2b0214..bd2034c3090110525fdc0520d55a9a25fa4739f8 100644
--- a/drivers/dax/cxl.c
+++ b/drivers/dax/cxl.c
@@ -5,6 +5,57 @@
 
 #include "../cxl/cxl.h"
 #include "bus.h"
+#include "dax-private.h"
+
+static int __cxl_dax_add_resource(struct dax_region *dax_region,
+				  struct region_extent *region_extent)
+{
+	struct device *dev = &region_extent->dev;
+	resource_size_t start, length;
+
+	start = dax_region->res.start + region_extent->hpa_range.start;
+	length = range_len(&region_extent->hpa_range);
+	return dax_region_add_resource(dax_region, dev, start, length);
+}
+
+static int cxl_dax_add_resource(struct device *dev, void *data)
+{
+	struct dax_region *dax_region = data;
+	struct region_extent *region_extent;
+
+	region_extent = to_region_extent(dev);
+	if (!region_extent)
+		return 0;
+
+	dev_dbg(dax_region->dev, "Adding resource HPA %pra\n",
+		&region_extent->hpa_range);
+
+	return __cxl_dax_add_resource(dax_region, region_extent);
+}
+
+static int cxl_dax_region_notify(struct device *dev,
+				 struct cxl_notify_data *notify_data)
+{
+	struct cxl_dax_region *cxlr_dax = to_cxl_dax_region(dev);
+	struct dax_region *dax_region = dev_get_drvdata(dev);
+	struct region_extent *region_extent = notify_data->region_extent;
+
+	switch (notify_data->event) {
+	case DCD_ADD_CAPACITY:
+		return __cxl_dax_add_resource(dax_region, region_extent);
+	case DCD_RELEASE_CAPACITY:
+		return dax_region_rm_resource(dax_region, &region_extent->dev);
+	case DCD_FORCED_CAPACITY_RELEASE:
+	default:
+		dev_err(&cxlr_dax->dev, "Unknown DC event %d\n",
+			notify_data->event);
+		return -ENXIO;
+	}
+}
+
+struct dax_sparse_ops sparse_ops = {
+	.is_extent = is_region_extent,
+};
 
 static int cxl_dax_region_probe(struct device *dev)
 {
@@ -24,15 +75,18 @@ static int cxl_dax_region_probe(struct device *dev)
 		flags |= IORESOURCE_DAX_SPARSE_CAP;
 
 	dax_region = alloc_dax_region(dev, cxlr->id, &cxlr_dax->hpa_range, nid,
-				      PMD_SIZE, flags);
+				      PMD_SIZE, flags, &sparse_ops);
 	if (!dax_region)
 		return -ENOMEM;
 
-	if (cxlr->mode == CXL_REGION_DC)
+	if (cxlr->mode == CXL_REGION_DC) {
+		device_for_each_child(&cxlr_dax->dev, dax_region,
+				      cxl_dax_add_resource);
 		/* Add empty seed dax device */
 		dev_size = 0;
-	else
+	} else {
 		dev_size = range_len(&cxlr_dax->hpa_range);
+	}
 
 	data = (struct dev_dax_data) {
 		.dax_region = dax_region,
@@ -47,6 +101,7 @@ static int cxl_dax_region_probe(struct device *dev)
 static struct cxl_driver cxl_dax_region_driver = {
 	.name = "cxl_dax_region",
 	.probe = cxl_dax_region_probe,
+	.notify = cxl_dax_region_notify,
 	.id = CXL_DEVICE_DAX_REGION,
 	.drv = {
 		.suppress_bind_attrs = true,
diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
index 0867115aeef2e1b2d4c88b5c38b6648a404b1060..39fb587561f802b813c1763293820307520d6adf 100644
--- a/drivers/dax/dax-private.h
+++ b/drivers/dax/dax-private.h
@@ -16,6 +16,14 @@ struct inode *dax_inode(struct dax_device *dax_dev);
 int dax_bus_init(void);
 void dax_bus_exit(void);
 
+/**
+ * struct dax_sparse_ops - Operations for sparse regions
+ * @is_extent: return if the device is an extent
+ */
+struct dax_sparse_ops {
+	bool (*is_extent)(struct device *dev);
+};
+
 /**
  * struct dax_region - mapping infrastructure for dax devices
  * @id: kernel-wide unique region for a memory range
@@ -27,6 +35,7 @@ void dax_bus_exit(void);
  * @res: resource tree to track instance allocations
  * @seed: allow userspace to find the first unbound seed device
  * @youngest: allow userspace to find the most recently created device
+ * @sparse_ops: operations required for sparse regions
  */
 struct dax_region {
 	int id;
@@ -38,6 +47,7 @@ struct dax_region {
 	struct resource res;
 	struct device *seed;
 	struct device *youngest;
+	struct dax_sparse_ops *sparse_ops;
 };
 
 /**
@@ -57,11 +67,13 @@ struct dax_mapping {
  * @pgoff: page offset
  * @range: resource-span
  * @mapping: reference to the dax_mapping for this range
+ * @dax_resource: if not NULL; dax sparse resource containing this range
  */
 struct dev_dax_range {
 	unsigned long pgoff;
 	struct range range;
 	struct dax_mapping *mapping;
+	struct dax_resource *dax_resource;
 };
 
 /**
@@ -100,6 +112,34 @@ struct dev_dax {
  */
 void run_dax(struct dax_device *dax_dev);
 
+/**
+ * struct dax_resource - For sparse regions; an active resource
+ * @region: dax_region this resources is in
+ * @res: resource
+ * @use_cnt: count the number of uses of this resource
+ *
+ * Changes to the dax_region and the dax_resources within it are protected by
+ * dax_region_rwsem
+ *
+ * dax_resource's are not intended to be used outside the dax layer.
+ */
+struct dax_resource {
+	struct dax_region *region;
+	struct resource *res;
+	unsigned int use_cnt;
+};
+
+/*
+ * Similar to run_dax() dax_region_{add,rm}_resource() and dax_avail_size() are
+ * exported but are not intended to be generic operations outside the dax
+ * subsystem.  They are only generic between the dax layer and the dax drivers.
+ */
+int dax_region_add_resource(struct dax_region *dax_region, struct device *dev,
+			    resource_size_t start, resource_size_t length);
+int dax_region_rm_resource(struct dax_region *dax_region,
+			   struct device *dev);
+resource_size_t dax_avail_size(struct resource *dax_resource);
+
 static inline struct dev_dax *to_dev_dax(struct device *dev)
 {
 	return container_of(dev, struct dev_dax, dev);
diff --git a/drivers/dax/hmem/hmem.c b/drivers/dax/hmem/hmem.c
index 5e7c53f18491622408adeab9d354ea869dbc71de..0eea65052874edc983690e1fe071ae2f7bc6aa7e 100644
--- a/drivers/dax/hmem/hmem.c
+++ b/drivers/dax/hmem/hmem.c
@@ -28,7 +28,7 @@ static int dax_hmem_probe(struct platform_device *pdev)
 
 	mri = dev->platform_data;
 	dax_region = alloc_dax_region(dev, pdev->id, &mri->range,
-				      mri->target_node, PMD_SIZE, flags);
+				      mri->target_node, PMD_SIZE, flags, NULL);
 	if (!dax_region)
 		return -ENOMEM;
 
diff --git a/drivers/dax/pmem.c b/drivers/dax/pmem.c
index c8ebf4e281f2405034065014ecdb830afda66906..f927e855f240007276612674448c155d89494746 100644
--- a/drivers/dax/pmem.c
+++ b/drivers/dax/pmem.c
@@ -54,7 +54,7 @@ static struct dev_dax *__dax_pmem_probe(struct device *dev)
 	range.start += offset;
 	dax_region = alloc_dax_region(dev, region_id, &range,
 			nd_region->target_node, le32_to_cpu(pfn_sb->align),
-			IORESOURCE_DAX_STATIC);
+			IORESOURCE_DAX_STATIC, NULL);
 	if (!dax_region)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 6e9fb667a1c5a5d5f7b415ac1e21ac082569f256..6a328772591143e72221cec6b0ed0772f88b6641 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -27,6 +27,9 @@ struct resource {
 	struct resource *parent, *sibling, *child;
 };
 
+#define for_each_child_resource(parent, res) \
+	for (res = (parent)->child; res; res = res->sibling)
+
 /*
  * IO resources have these defined flags.
  *

-- 
2.47.0


