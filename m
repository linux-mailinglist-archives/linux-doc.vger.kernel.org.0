Return-Path: <linux-doc+bounces-45946-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F20D0AB3D7F
	for <lists+linux-doc@lfdr.de>; Mon, 12 May 2025 18:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7A4169A8F
	for <lists+linux-doc@lfdr.de>; Mon, 12 May 2025 16:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09AA29373F;
	Mon, 12 May 2025 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ByeXreV3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99912750FC
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066927; cv=none; b=RzV+p5DYSiH6hQ+/hr2Rsq8x4Dzvhl7PQFjZY84CTzeT3fHCfbRcAwjQWDQZBWvFaLLhYqDUYPR0bEjHXONYDLujqJ7kA/wRykD1k4zl94ZsnbHc9uUFw+t1GGx3JES2pM66Pi68mcrHUjlAM8dwl+27E91K+DobRlYCiomUiFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066927; c=relaxed/simple;
	bh=alRL+BnN7pA7RLLcp2eJAsPEVuznl19NxFJaEka+9wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxGiZZOBSKbX7l1+Dq8zf9peCLes51X/ngWS7zYAYGxa2tlCwoDtdgb4ycNdLLz+buppHn8lvrRXPpmmHUtS7FEeqqGFSRpXXr2K/BCaamz91a38HeKtDsulL7ymQjK+I262C994kFpaLzU/17bavTpuSGLajVRl9L+QXRTW2k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ByeXreV3; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4774193fdffso82260901cf.1
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747066924; x=1747671724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mmNdRpdNT2e5CioCKqjI7jQZuOdPNFPwu/aBvzKK6c=;
        b=ByeXreV3D7rxuAuI62OkxgSg/zHGh1SWk/Ir8lSJG+Y7G9h6NvZNeKGf3UAQSLg+E3
         DjUxOPsbH+hhFqly6ZLnfiDXxdB6EjnbpakrYSTJrjStmR9RandwYPh6pZsfX7qg8Esi
         Ccg5cYlr6pmTu0J3w9B51h3Niv4QfbXhogsL52xM6sBwdNJ7e3e7MjQiLsTlH1wzleUc
         /dIV2n3HQfIrDr1AooXQrP8S1/JDaLrExWpN5b3fwOuAX8aefDNIUuaAdpbHKdoELc2f
         WTajCCuzAflMCFfv6YRMLF68EnGGiz006DzHS0D2IgOBj8qCh+9IJkkahOUrhFGipbti
         9MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066924; x=1747671724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mmNdRpdNT2e5CioCKqjI7jQZuOdPNFPwu/aBvzKK6c=;
        b=qIYzOBTUW4p1AXGOZgvjvj0jyqyDFnTQEwcM9DCApMpFSd7PcO92YYX9d4mi59e7tH
         9F+MeC8exw4iiX2Cr8oOzAbIR4VE1r6VGRkQ+JHEKqSulaJ1d2GkdrMPWlYT3vbG+xHu
         qTyN8OFSbOOc1B+Fol7XZLn/gCM+QCbVB9CCu7Va/k6nKLNJuR9djF4cd3Hklz5C/Tkf
         oqgaUnCVJQYr95/hms0SwhzBIk7TrrAqhDXsvhNXZvIrKKJ121udTKYcC7Sx7dJhFH5s
         QeuwX+5t5fDLZU7OFPSiC/XVYAWoVg+ZeTBKEYDq6PVsNO0u1WaGcDC/eYrNysH54lme
         3z8g==
X-Gm-Message-State: AOJu0YyrefazTaR1G9F45ruU2h2BXEX0RiqGcEpQMnjX2Fwv+EP20TZQ
	aRGXZKTfuyt0XAt5H0y5dS/goLxjtehEdmF2r9iO/0DF62gFvZw6zfRESUjUxAQ=
X-Gm-Gg: ASbGncvspAi/2ygV/V9HBeoli1GxJCL34bmLwElQ0CUr2z0rWuvfXFS2/LXPU/93CV5
	z3v8sbXbBrMt5i89fgFF2Y9nyvNHIjz7q2YTpHnKPecdqQGJ0Adn7xT+ME7nIWeZ8xrfOGzGhPy
	IhDMN9vOqVmio49a0mLegYSyWYY/qo/dcm9KleT9mHcpYMuXQkWTH8u/ln/nrWrzCJI7ynRWpEh
	3eRWKVgzwrfMh7PyHnSYYd0T1Aq+AmIzcvaKr9lvrmZEieXc8RvMLf5Bh+rLilrTm5vOm8wClbh
	d0pgKCNNJD/GxXguVJygT1NLq8jxE6Ku1+mKV3BiKWs4nkM4LrW+Sf4zeG3Ovb9tM0V3IDZU0iu
	j1czm8cr57qs6eKLOlEVUcyHRq5eP993Bh2ke
X-Google-Smtp-Source: AGHT+IGWTZBftJjnQ8DcvuqUwpD3a6TCMt8kbFUpNWIl3gGiOiMusJaygR3wQdoazycEU1zccxqVUA==
X-Received: by 2002:ac8:57d3:0:b0:476:87f6:3ce4 with SMTP id d75a77b69052e-494527b8112mr197827301cf.39.1747066923532;
        Mon, 12 May 2025 09:22:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583961sm52461791cf.58.2025.05.12.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:22:03 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [PATCH v3 14/17] cxl: docs/allocation/page-allocator
Date: Mon, 12 May 2025 12:21:31 -0400
Message-ID: <20250512162134.3596150-15-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512162134.3596150-1-gourry@gourry.net>
References: <20250512162134.3596150-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document some interesting interactions that occur when exposing CXL
memory capacity to page allocator.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../cxl/allocation/page-allocator.rst         | 85 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/page-allocator.rst

diff --git a/Documentation/driver-api/cxl/allocation/page-allocator.rst b/Documentation/driver-api/cxl/allocation/page-allocator.rst
new file mode 100644
index 000000000000..7b8fe1b8d5bb
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/page-allocator.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================
+The Page Allocator
+==================
+
+The kernel page allocator services all general page allocation requests, such
+as :code:`kmalloc`.  CXL configuration steps affect the behavior of the page
+allocator based on the selected `Memory Zone` and `NUMA node` the capacity is
+placed in.
+
+This section mostly focuses on how these configurations affect the page
+allocator (as of Linux v6.15) rather than the overall page allocator behavior.
+
+NUMA nodes and mempolicy
+========================
+Unless a task explicitly registers a mempolicy, the default memory policy
+of the linux kernel is to allocate memory from the `local NUMA node` first,
+and fall back to other nodes only if the local node is pressured.
+
+Generally, we expect to see local DRAM and CXL memory on separate NUMA nodes,
+with the CXL memory being non-local.  Technically, however, it is possible
+for a compute node to have no local DRAM, and for CXL memory to be the
+`local` capacity for that compute node.
+
+
+Memory Zones
+============
+CXL capacity may be onlined in :code:`ZONE_NORMAL` or :code:`ZONE_MOVABLE`.
+
+As of v6.15, the page allocator attempts to allocate from the highest
+available and compatible ZONE for an allocation from the local node first.
+
+An example of a `zone incompatibility` is attempting to service an allocation
+marked :code:`GFP_KERNEL` from :code:`ZONE_MOVABLE`.  Kernel allocations are
+typically not migratable, and as a result can only be serviced from
+:code:`ZONE_NORMAL` or lower.
+
+To simplify this, the page allocator will prefer :code:`ZONE_MOVABLE` over
+:code:`ZONE_NORMAL` by default, but if :code:`ZONE_MOVABLE` is depleted, it
+will fallback to allocate from :code:`ZONE_NORMAL`.
+
+
+Zone and Node Quirks
+====================
+Let's consider a configuration where the local DRAM capacity is largely onlined
+into :code:`ZONE_NORMAL`, with no :code:`ZONE_MOVABLE` capacity present. The
+CXL capacity has the opposite configuration - all onlined in
+:code:`ZONE_MOVABLE`.
+
+Under the default allocation policy, the page allocator will completely skip
+:code:`ZONE_MOVABLE` as a valid allocation target.  This is because, as of
+Linux v6.15, the page allocator does (approximately) the following: ::
+
+  for (each zone in local_node):
+
+    for (each node in fallback_order):
+
+      attempt_allocation(gfp_flags);
+
+Because the local node does not have :code:`ZONE_MOVABLE`, the CXL node is
+functionally unreachable for direct allocation.  As a result, the only way
+for CXL capacity to be used is via `demotion` in the reclaim path.
+
+This configuration also means that if the DRAM ndoe has :code:`ZONE_MOVABLE`
+capacity - when that capacity is depleted, the page allocator will actually
+prefer CXL :code:`ZONE_MOVABLE` pages over DRAM :code:`ZONE_NORMAL` pages.
+
+We may wish to invert this priority in future Linux versions.
+
+If `demotion` and `swap` are disabled, Linux will begin to cause OOM crashes
+when the DRAM nodes are depleted. See the reclaim section for more details.
+
+
+CGroups and CPUSets
+===================
+Finally, assuming CXL memory is reachable via the page allocation (i.e. onlined
+in :code:`ZONE_NORMAL`), the :code:`cpusets.mems_allowed` may be used by
+containers to limit the accessibility of certain NUMA nodes for tasks in that
+container.  Users may wish to utilize this in multi-tenant systems where some
+tasks prefer not to use slower memory.
+
+In the reclaim section we'll discuss some limitations of this interface to
+prevent demotions of shared data to CXL memory (if demotions are enabled).
+
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 6e7497f4811a..7acab7e7df96 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -45,5 +45,6 @@ that have impacts on each other.  The docs here break up configurations steps.
    :caption: Memory Allocation
 
    allocation/dax
+   allocation/page-allocator
 
 .. only::  subproject and html
-- 
2.49.0


