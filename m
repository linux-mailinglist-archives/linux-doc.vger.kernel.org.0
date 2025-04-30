Return-Path: <linux-doc+bounces-44841-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD3AA3ECE
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 02:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4B1E3B18BB
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 00:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6611E0DF5;
	Wed, 30 Apr 2025 00:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WzyfWRHE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C701DE88C
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 00:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971981; cv=none; b=usJFrU4XbelOIk80bnPY4W5PN+JciaDUoSQ0ttgfQI9IaAT7XB0rRgmwI4j4urZxlGoGBlVTSk60C9mHHc6BqhHybb0g9FfkW0aQ+2+wSyJzkKsg5r6sa4czxC3gR8/CyLFA6L5jsEdNjSkt2ctiPu0oUelg6yvpkikDLdkm3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971981; c=relaxed/simple;
	bh=a+GV4Qvg58wFX6J8gIoD1XrpMv0xTANuNhUoKbpPvI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHl3kKYi9CtFt96ZB1F1blhVrlkXeUq8q/GMHN9NEQbcv045stVN0WN0bj3lykc63DjP9ImlJI3lC8LNvPECs5c+eUcuk/hgnVKQHoCRZFDFD/mDOdSv3Ok3if/X3SHjwc2vjupB6dovJGI9YFOJq0uDbX20RLePEx4aK04A/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WzyfWRHE; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4774d68c670so114321941cf.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 17:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971978; x=1746576778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0kd+zs7VCCg/bGrnqeB4WDWKHo0gBjI+E1y3uIR3P8=;
        b=WzyfWRHEeEpF5mqagsUAMfclfmFDbXYtwrPjsvCwQ3fjGjv+Ao5RCMR+2MUUDStxe1
         lTU6Z61eHs5cvE34TkImNC4WEkneDztPg2IJZ8x/+5q4Hf5JBpCCe3sqBtj7euoQYtD7
         H3zFwULmEG7LMeeHp+rnWC6IRAqh+aiZEAZQExPgtnJ46KP9pGiVpIEAPpG7ZHbvJ5EG
         /45DjR+2qR6kqbDOnW+TdjppoCCFjYZTAbn+86HgvsYiZjDNHIK9JrDYD+INJyebVygQ
         jRBKGvrjUsmhQ9YU/Os7GE4UVpM18denrTebK08IxWDoUyUg1azmVLAVLioj12IjPhZP
         TjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971978; x=1746576778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0kd+zs7VCCg/bGrnqeB4WDWKHo0gBjI+E1y3uIR3P8=;
        b=i6+iKnaY98zL9L2v42P4EP1dC97fCEXBDfiiF0h5dBhv99IbGZNPd63ab1elIgGxzt
         Pjp896/EAJSPPTK4yyeERe686yZAIn06JWMPgudK2MyU4u0KfUFk0fVnQwSyDon5u2pG
         ijmFMYZJrD8PtltYLe2iGghK0ioeCKNzAH2t01yWcxA+QqtEZJvFK4ZiqIgzwdW4UfSt
         he8n3VztDmAq/Q+7gRn+D/j+VFV91sy9NX5MSyuwE+E5QW/LLJIoB/dfpcwdBwHNytEm
         Z8FCUAxUSpcsjqAaCCV9cvmcnrlMdcU8Dl84Zgah6EcSYhY4FBptnUUX69SHlmgyNWgs
         beZA==
X-Gm-Message-State: AOJu0YxY7NEUDCqeTW50cD4ZSXuHZyN4lhw32t3qhztb+kqKQ6dMxwZh
	W5ERE+Y9XVxjsSFWiCoKAVAfkoHfaeSaXShLQJTRRmgDhIKd/kXiyt3uHV3natw=
X-Gm-Gg: ASbGncsLTWHwStyeuGhxwnflHuAbUTMB5noFBXzYNEJAbGVMHUCCrlJwUiXroiEpGVD
	VHsmkhtXnBLm85IS8ITjv/rasD9+kVMGR5Zr4Ib8imJskBZSsq90MPI+bGKx8FuFfP++4jXljQK
	J/MKdS1wh67APQ8M/ywKLhPtAHd5IN7eP0CnT8o+619csL5Zij9iV9Mby892Jqmq35uj+z9tqTm
	V6Tgo75D9FZcGZOuoJILOkl6S8CvYz1BCySqCY3ZIXdJh0VXZgcFb3dfMQqBAOQXBePIncRNh1/
	zoDhUGcl3dsy+5tKfpWNUnKwEdnOITKFb3L/0Ff3wufa4b638XjCOkA7LBjeXN7rDZ0+kdWdnDz
	I/Z5ZOpSLZUVKEkOsz6Uk12lvw31G
X-Google-Smtp-Source: AGHT+IFPXNoBiM4Jy+i0CEayph3Il4BP1VbXTa+vimVibIrLsan89vSi39bk9GCS3u8Af1GG6zcFdw==
X-Received: by 2002:a05:622a:4d85:b0:476:6b20:2cef with SMTP id d75a77b69052e-489e60f0c66mr9962821cf.41.1745971978489;
        Tue, 29 Apr 2025 17:12:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:12:58 -0700 (PDT)
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
Subject: [RFC PATCH 13/17] cxl: docs/allocation/page-allocator
Date: Tue, 29 Apr 2025 20:12:20 -0400
Message-ID: <20250430001224.1028656-14-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430001224.1028656-1-gourry@gourry.net>
References: <20250430001224.1028656-1-gourry@gourry.net>
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
index 000000000000..e913dfa5ff3f
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/page-allocator.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The Page Allocator
+##################
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
+************************
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
+************
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
+********************
+Lets consider a configuration where the local DRAM capacity is largely onlined
+into :code:`ZONE_NORMAL`, with no :code:`ZONE_MOVABLE` capacity present. The
+CXL capacity has the opposite configuration - all onlined in
+:code:`ZONE_MOVABLE`.
+
+Under the default allocation policy, the page allocator will completely skip
+:code:`ZONE_MOVABLE` has a valid allocation target.  This is because, as of
+Linux v6.15, the page allocator does approximately the following: ::
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
+We may wish to invert these configurations in future Linux versions.
+
+If `demotion` and `swap` are disabled, Linux will begin to cause OOM crashes
+when the DRAM nodes are depleted. This will be covered amore in depth in the
+reclaim section.
+
+
+CGroups and CPUSets
+*******************
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
index d19148be3087..52bc444506bc 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -47,5 +47,6 @@ that have impacts on each other.  The docs here break up configurations steps.
    :caption: Memory Allocation
 
    allocation/dax
+   allocation/page-allocator
 
 .. only::  subproject and html
-- 
2.49.0


