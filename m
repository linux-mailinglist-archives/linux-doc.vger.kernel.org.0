Return-Path: <linux-doc+bounces-44958-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB6AA5375
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 20:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F231F9E3735
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 18:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C40528031D;
	Wed, 30 Apr 2025 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jKR0MMC9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5200E27A46E
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036683; cv=none; b=RH1sNFPi4FZpVqz3Z/8jQT6ncbFrctlPu3GdcEd/aAB605e6qSAoRNXxoaFjZ0QMxYnIat15b1BEWfyxz/2GBCwrccZEPR0339258FsYtFuIAG2MGqYYUl/wZ0rzHui9Cl6Jh3N+xrvauyWO3iSfdjrbgQ9vu2KyUlDqho0Xs/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036683; c=relaxed/simple;
	bh=yfrC0Eme8BmQ1/OHJ9XQ1ZL+snR+lO3XBR/5UUcZJfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qlim/rh6+hCHKV3lYXhdOEoZhFXCOEfrFEPIl3Rhj6fRmhM60hr5Vr5k/V63RAXCpl/gkYhiBf2sL2b0M2uRR6eNi4f9Oq3XBbSBJGBUZ956oKHj70EtnVxDnjh+GiG6pKM31APv6hkcqFrbF3FwOZV7JcwrABFzAEb9A5kfEXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jKR0MMC9; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4772f48f516so14874201cf.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036680; x=1746641480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvC2rs3uihn14TnY/NB2X/a9ksGTd6adbUOlhi/H5xc=;
        b=jKR0MMC9vUO+cTHFNR9O/Mq4rW9izXl1/pEOs0z9h5Zbs+UPtLWfdIdTIZOV6EUtAV
         ohGcItTO1tBCob7Xw6kLk4qX03UHoCnoyrBUKqRoVqQBAkL/c0sZyM5M6JmNEotAJ+6W
         4e5Z5QXrd73iVPZMiJSM6J1Kx/0Ar6FNiiw1T1quCWJPMWU5ndXntQBNhYRMa8wDWs8L
         md/Nmajw2yHPMbRjeINPpwnbxFwVfvGqOlDgT3wnes55TKdcmbf5JjU7gDppnj74N4v9
         2zCJa685cVyDVHMK12w9H/IyxcDKCjpLpwZTvbZGG+h5SAQXCLO+9LBlrrbMt7qSrMFh
         wPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036680; x=1746641480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvC2rs3uihn14TnY/NB2X/a9ksGTd6adbUOlhi/H5xc=;
        b=rwbjx50EcxWSDXAE033+msYHXFv6v5cqaLJO5cwyVUP4mZ9S3y60cQgqNRB+DvJlwo
         Kp6T9SUBKvMLf2QHaCo+OnzzbmlFHFUxTFhniSAbSAfLxqZSPJR/nAoY+VYaXkq7bNVB
         omiqTcbgB+bXBfDB3khXPqreVEn/49oRxfxKvFaIqWycnMcTSgAssU9nMWGkJi874FKw
         Zs/ATEfvt7L3hgVPHHMVkg2GsyB2Ut4RLEr3lhzbQeeSDkVdhgK/5dUNc+6mAAoT/WrO
         AYF3GtLP1CcC7dqntoJfw84G3cOCUjgK5v9JJHBCGAp29hwJk7ueTYsAg5qMju4krLUM
         RROg==
X-Gm-Message-State: AOJu0YxFF82YAmYJy3JcQzIT47DE5bJNkympqN9IveEhNwfUWV+Em5vV
	BAlSBpB2tjlBPGwx3U6qsPCYxGl3aeALLLuGzUzGoN9ZhVVLcO1FTDU2RL/9Ykg=
X-Gm-Gg: ASbGnctMwS4a34/zZRzwrdeFI0ui7yI+KnT24qTJNuXo/3T0v6SMXWpxAgWjYd0Hsj1
	G6P7g0+8J0H4H/1IO0TsLB1kOv82j/uTvNA/j4ckVrzeK19G1VSyEgc79MwxkF223Onr5ia0iWH
	liwRl7SpXi54aJCWmDAHEBxFikkCAXU3hYKeAZUhy7szmSNUr7nG0k1/tE/4GfCUqyS3A/PbPtg
	Sz9WAYBuvjBztuLmTEVnOm/S3Rj2tKVoDy7IqHEEsTz0Qm8hOJmrLDucWVzJwFyA4lOGZ+y/f3C
	rSo9jLvjw6183pTitUXobDxtWSh9Rv9QPDpwemHa8vIIXWSU0zvWWn/9ypxge34K6utzxkY4IU4
	wLEhn43uzJCIRrU37kGfxk7Tlgwj/
X-Google-Smtp-Source: AGHT+IFz5WPodsmmRrFPGLR1bzkZlvspw+qAXKgayP3FunFG0J4oFtDaOJOklbA327O2PgMdv3UdIg==
X-Received: by 2002:a05:622a:228e:b0:471:80ef:35e7 with SMTP id d75a77b69052e-48ad7e8d24fmr6910221cf.4.1746036680313;
        Wed, 30 Apr 2025 11:11:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:19 -0700 (PDT)
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
Subject: [RFC PATCH v2 13/18] cxl: docs/allocation/page-allocator
Date: Wed, 30 Apr 2025 14:10:43 -0400
Message-ID: <20250430181048.1197475-14-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181048.1197475-1-gourry@gourry.net>
References: <20250430181048.1197475-1-gourry@gourry.net>
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
 .../cxl/allocation/page-allocator.rst         | 86 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/page-allocator.rst

diff --git a/Documentation/driver-api/cxl/allocation/page-allocator.rst b/Documentation/driver-api/cxl/allocation/page-allocator.rst
new file mode 100644
index 000000000000..f5b21d3eb63f
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/page-allocator.rst
@@ -0,0 +1,86 @@
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
index f779dfb0cd64..2be2855e5870 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -46,5 +46,6 @@ that have impacts on each other.  The docs here break up configurations steps.
    :caption: Memory Allocation
 
    allocation/dax
+   allocation/page-allocator
 
 .. only::  subproject and html
-- 
2.49.0


