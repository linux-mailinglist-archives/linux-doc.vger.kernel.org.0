Return-Path: <linux-doc+bounces-44838-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C13D7AA3EAB
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 02:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2628618865A9
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 00:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932AB1D8E1A;
	Wed, 30 Apr 2025 00:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HRKo3CI/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4701CDA3F
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 00:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971976; cv=none; b=KAAwWxOWwxta2YirccDuTyeyJiWSzIo192cih1+nyCNpd0QqMhzHrlJbNR9deDiwIaGlrJg/281pbQN8KW3AxUxjcV7GjvEScc6xja5EQGhWfF0b4AbK6D0kvxQrt8P3WEk88lRAJ0t/goNl9dHrJuGJ5S7Kkeq2VZwx2ywkqXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971976; c=relaxed/simple;
	bh=TjuLcwK+M6LLMZ5Wff/rzBDXZJiMEDSOuoY3CLkuI+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZZIDC+BvzJOV9ByFPIZimS6GdZbLJhvB43wjBFo7SXgMp1bvkCFipAmgRc9qe2LRskRBmLToUrUIxsHVEAiHwgy2IVhx/0wxsQQ2ZkI5xTZs7OKKw8qOY2Z1IURMqkF+mJxSaOsM4KWrYs0v0S3WKz7qCW9pXFJynIX87rznUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HRKo3CI/; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47677b77725so85865761cf.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 17:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971973; x=1746576773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48IBIQBS5H0eCikVfx3jlLOYBAjND5JFsqhmRr8kgFs=;
        b=HRKo3CI/VTUikbT0AAmZ8xINJDyGeKvzQbecVnhyh0c6mGsC7MVd0JKmGKVhcfTlzW
         zHOzBn1EV/g/oP+CNUl0NgwR1FrZGPYeFOdT07OqObUZINn/IaLrCVZQ9eDoguhst2Lb
         8rTT/OaXY/Uw0XyF0G/4TcwFC8HGQcZnezOj5F+9rhWuMmYOuZU2vUDFGfawdWad7SFg
         sGCtOBeZLhZgHHqF1Pe1LqiJvwj9vgRtTUexbe4UOC0Ew1rokg9USGwLZPI7JJf4DvV7
         jnEz3O548XsEMWKcZnUvIqUJHGIYM7SbIRcWAj8NJLbvickevwL3/3/dtDhBVwM11/Z+
         JetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971973; x=1746576773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48IBIQBS5H0eCikVfx3jlLOYBAjND5JFsqhmRr8kgFs=;
        b=SNH+bw2R7qjhIXqh8yqjOmb4HPv80CEOyL+TaIUXH3hf1asuvnMyGCKbLvkj6/i86L
         BDDGoYyQqxlP2JPmBsYCWHdQ3Fjvd06E50rtmP2J5yNe+CbDA0GObNsYhRs+DBsGzbYl
         AC/U58aP5GK/Ynoj4FLk+WqgXiFQ2kczASBVQzvxuxaZ6kT/NQet0GdD045dhjvlTeVx
         fLCfBwp3pfKzzw28Ys+GIDjLkMfBJuC4HWrqB/mINQzFjyXnI4b1GaMCzVMKrRchxeDF
         uWApgr1pvp07TF21rRpjQvr6/ovtjHLz0wu40baxr0BI72mhQbzRSqIEQzwi+mHz4cZy
         oTAw==
X-Gm-Message-State: AOJu0YyCsKFaD1c7n/o4DiwIljM34KHtrZt1Fwl+dd61F37LktNLZEQo
	ozBkixILfqeUCEgpXBabBl+2dfvgR9LWFenmRMslTLUwl4MAwxNZVB3R3ywm1NY=
X-Gm-Gg: ASbGncvSxG8w007+Is2fZRFZjAcwh20LsNDBOJ/doIDqulXKMq+YkSgza5DK2MRWi8m
	PtMIKEddH/ITd6i2Pr6r5ES+ZMFnFvTM1qQaqN0ybQyaF66vLFLQECz/W+QUJ9p/OvAYrBIwMb9
	tRBZH2A8xE4NPLxMzIPP+8wcXFV7nbMBnG5rdo/hhYfswcepLvYWxvMNSZEUrAfKknzAQ/pxKKf
	us50UsKmS4SjfyKPopLg5tT/WLtFSvnGhIXuf9BiNoByzIsrmfqBYnI0tMqLwgpyihKj+zFT6Bc
	81L+9ZErNQJQDxEW7/afTPR5TOMBZIBHahcODN0JwZi+dRMhyEwnA98/21r9y6Vze9BUby4hEbP
	m7p62Q/5YaSPs7IimZ894fyUZzYLzhT2nU3YQ+0A=
X-Google-Smtp-Source: AGHT+IFzgkOauRvlDmL11rMMrtVN8v6NuHdseJxsSrQzs6ks2JKTqOLcs6++Jr/SBAfN9hT/VjYF6w==
X-Received: by 2002:a05:622a:244e:b0:476:b7e2:385c with SMTP id d75a77b69052e-489c38aa1fbmr17532591cf.2.1745971972868;
        Tue, 29 Apr 2025 17:12:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:12:52 -0700 (PDT)
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
Subject: [RFC PATCH 10/17] cxl: docs/linux/dax-driver documentation
Date: Tue, 29 Apr 2025 20:12:17 -0400
Message-ID: <20250430001224.1028656-11-gourry@gourry.net>
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

Add documentation on how the CXL driver interacts with the DAX driver.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        |  1 +
 .../driver-api/cxl/linux/dax-driver.rst       | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/linux/dax-driver.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index b915ce982048..bfaf0e2ebfc0 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -38,6 +38,7 @@ that have impacts on each other.  The docs here break up configurations steps.
    linux/overview
    linux/early-boot
    linux/cxl-driver
+   linux/dax-driver
    linux/access-coordinates
 
 
diff --git a/Documentation/driver-api/cxl/linux/dax-driver.rst b/Documentation/driver-api/cxl/linux/dax-driver.rst
new file mode 100644
index 000000000000..56addd5fa71e
--- /dev/null
+++ b/Documentation/driver-api/cxl/linux/dax-driver.rst
@@ -0,0 +1,42 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+DAX Driver Operation
+====================
+The `Direct Access Device` driver was originally designed to provide a
+memory-like access mechanism to memory-like block-devices.  It was
+extended to support CXL Memory Devices, which provide user-configured
+memory devices.
+
+The CXL subsystem depends on the DAX subsystem to generate either:
+
+- A file-like interface to userland via :code:`/dev/daxN.Y`, or
+- Engaging the memory-hotplug interface to add CXL memory to page allocator.
+
+The DAX subsystem exposes this ability through the `cxl_dax_region` driver.
+A `dax_region` provides the translation between a CXL `memory_region` and
+a `DAX Device`.
+
+DAX Device
+----------
+A `DAX Device` is a file-like interface exposed in :code:`/dev/daxN.Y`. A
+memory region exposed via dax device can be accessed via userland software
+via the :code:`mmap()` system-call.  The result is direct mappings to the
+CXL capacity in the task's page tables.
+
+Users wishing to manually handle allocation of CXL memory should use this
+interface.
+
+kmem conversion
+---------------
+The :code:`dax_kmem` driver converts a `DAX Device` into a series of `hotplug
+memory blocks` managed by :code:`kernel/memory-hotplug.c`.  This capacity
+will be exposed to the kernel page allocator in the user-selected memory
+zone.
+
+The :code:`memmap_on_memory` setting (both global and DAX device local) dictate
+where the kernell will allocate the :code:`struct folio` descriptors for this
+memory will come from.  If :code:`memmap_on_memory` is set, memory hotplug
+will set aside a portion of the memory block capacity to allocate folios.  If
+unset, the memory is allocated via a normal :code:`GFP_KERNEL` allocation -
+and as a result will most likely land on the local NUM node of the cpu executing
+the hotplug operation.
-- 
2.49.0


