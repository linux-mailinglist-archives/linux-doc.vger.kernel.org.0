Return-Path: <linux-doc+bounces-31822-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8849E010B
	for <lists+linux-doc@lfdr.de>; Mon,  2 Dec 2024 12:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AEEB162BFF
	for <lists+linux-doc@lfdr.de>; Mon,  2 Dec 2024 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C2A1FE460;
	Mon,  2 Dec 2024 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTG74Dfp"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E240F1C6F56;
	Mon,  2 Dec 2024 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733140711; cv=none; b=dOoWGY2FDLNfFcdTGLL3/M8HByXtJgm+drJdRN+KIJ6KqQZDvBjSYDhBstt5jdagnTVyLU/4lZwSSTyahsCPlrF8/ojSSwi65sxw7ZCe8m8ik3LGGRKCN5d5BxH7lmV6nS2myUAsQx4i0WDsI7WriRGd08l8iCWNIQqu+yFulag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733140711; c=relaxed/simple;
	bh=xWdd34sIxw1QC1x4Q76ZWScjmX8Hy+8IhaCa3EtPKkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CLw58KWRQLitmxTCRZ0ZFxjVVxCxL0reoTyS+CafRk81yoy08XgnnON/XJPlVbZOY+BeyM13TuAQTRml59G1KCUqBJoLT74MTDbc12L63uUXBLiBQLF9H9WOkF9jXWUSAFMg434YW58kKz5DSyo5mUE6w1TED9LFbCVfD3yKdIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTG74Dfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3FBC4CED1;
	Mon,  2 Dec 2024 11:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733140710;
	bh=xWdd34sIxw1QC1x4Q76ZWScjmX8Hy+8IhaCa3EtPKkg=;
	h=From:To:Cc:Subject:Date:From;
	b=pTG74DfpO7n6pT6UlLdkSl6z8ruFuFabicESGoIsGLuFdOAEJz5VHSsCx7HBZqw4i
	 0dgtTI/hbPMOBs0miUx4pIcVFWR+jxDuYwITDqzh2e8kkTgZIVw6Fn2jGjIn02YNRT
	 uqLPMxjp5KRnAUBpaCC5smc3PrSXYUA7b7J3UXIe75C4tPax25Vf4nYgkVYRD8ikk1
	 ay+XCU0hQ0DWFGWWfX9m4qKw/Gge0DXZJCyAniIX6+0Xz8rAPx17XWjDn6kiZZHDE7
	 MXWoH/tkYjJTPwwDvclNVJPdsDOrnCqbmHEh7d4aRfU3HzZpz/JS+YtIV6PIdhSY/m
	 3WiXN4BwAiFNg==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] Documentation: dma-buf: heaps: Add heap name definitions
Date: Mon,  2 Dec 2024 12:58:27 +0100
Message-ID: <20241202115827.50388-1-mripard@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Following a recent discussion at last Plumbers, John Stultz, Sumit
Sewal, TJ Mercier and I came to an agreement that we should document
what the dma-buf heaps names are expected to be, and what the buffers
attributes you'll get should be documented.

Let's create that doc to make sure those attributes and names are
guaranteed going forward.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
Changes from v1:
  - Add the mention that the cma / reserved heap is optional.

To: Jonathan Corbet <corbet@lwn.net>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: John Stultz <jstultz@google.com>
Cc: "T.J. Mercier" <tjmercier@google.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
 Documentation/userspace-api/dma-buf-heaps.rst | 76 +++++++++++++++++++
 Documentation/userspace-api/index.rst         |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
new file mode 100644
index 000000000000..68be7ddea150
--- /dev/null
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -0,0 +1,76 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Allocating dma-buf using heaps
+==============================
+
+Dma-buf Heaps are a way for userspace to allocate dma-buf objects. They are
+typically used to allocate buffers from a specific allocation pool, or to share
+buffers across frameworks.
+
+Heaps
+=====
+
+A heap represent a specific allocator. The Linux kernel currently supports the
+following heaps:
+
+ - The ``system`` heap allocates virtually contiguous, cacheable, buffers
+
+ - The ``reserved`` heap allocates physically contiguous, cacheable,
+   buffers. Only present if a CMA region is present. Such a region is
+   usually created either through the kernel commandline through the
+   `cma` parameter, a memory region Device-Tree node with the
+   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
+   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
+   might be called differently:
+
+    - Acer Iconia Tab A500: ``linux,cma``
+    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
+    - Amlogic A1: ``linux,cma``
+    - Amlogic G12A/G12B/SM1: ``linux,cma``
+    - Amlogic GXBB/GXL: ``linux,cma``
+    - ASUS EeePad Transformer TF101: ``linux,cma``
+    - ASUS Google Nexus 7 (Project Bach / ME370TG) E1565: ``linux,cma``
+    - ASUS Google Nexus 7 (Project Nakasi / ME370T) E1565: ``linux,cma``
+    - ASUS Google Nexus 7 (Project Nakasi / ME370T) PM269: ``linux,cma``
+    - Asus Transformer Infinity TF700T: ``linux,cma``
+    - Asus Transformer Pad 3G TF300TG: ``linux,cma``
+    - Asus Transformer Pad TF300T: ``linux,cma``
+    - Asus Transformer Pad TF701T: ``linux,cma``
+    - Asus Transformer Prime TF201: ``linux,cma``
+    - ASUS Vivobook S 15: ``linux,cma``
+    - Cadence KC705: ``linux,cma``
+    - Digi International ConnectCore 6UL: ``linux,cma``
+    - Freescale i.MX8DXL EVK: ``linux,cma``
+    - Freescale TQMa8Xx: ``linux,cma``
+    - Hisilicon Hikey: ``linux,cma``
+    - Lenovo ThinkPad T14s Gen 6: ``linux,cma``
+    - Lenovo ThinkPad X13s: ``linux,cma``
+    - Lenovo Yoga Slim 7x: ``linux,cma``
+    - LG Optimus 4X HD P880: ``linux,cma``
+    - LG Optimus Vu P895: ``linux,cma``
+    - Loongson 2k0500, 2k1000 and 2k2000: ``linux,cma``
+    - Microsoft Romulus: ``linux,cma``
+    - NXP i.MX8ULP EVK: ``linux,cma``
+    - NXP i.MX93 9x9 QSB: ``linux,cma``
+    - NXP i.MX93 11X11 EVK: ``linux,cma``
+    - NXP i.MX93 14X14 EVK: ``linux,cma``
+    - NXP i.MX95 19X19 EVK: ``linux,cma``
+    - Ouya Game Console: ``linux,cma``
+    - Pegatron Chagall: ``linux,cma``
+    - PHYTEC phyCORE-AM62A SOM: ``linux,cma``
+    - PHYTEC phyCORE-i.MX93 SOM: ``linux,cma``
+    - Qualcomm SC8280XP CRD: ``linux,cma``
+    - Qualcomm X1E80100 CRD: ``linux,cma``
+    - Qualcomm X1E80100 QCP: ``linux,cma``
+    - RaspberryPi: ``linux,cma``
+    - Texas Instruments AM62x SK board family: ``linux,cma``
+    - Texas Instruments AM62A7 SK: ``linux,cma``
+    - Toradex Apalis iMX8: ``linux,cma``
+    - TQ-Systems i.MX8MM TQMa8MxML: ``linux,cma``
+    - TQ-Systems i.MX8MN TQMa8MxNL: ``linux,cma``
+    - TQ-Systems i.MX8MPlus TQMa8MPxL: ``linux,cma``
+    - TQ-Systems i.MX8MQ TQMa8MQ: ``linux,cma``
+    - TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM: ``linux,cma``
+    - TQ-Systems MBA6ULx Baseboard: ``linux,cma``
+
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index 274cc7546efc..4901ce7c6cb7 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -41,10 +41,11 @@ Devices and I/O
 
 .. toctree::
    :maxdepth: 1
 
    accelerators/ocxl
+   dma-buf-heaps
    dma-buf-alloc-exchange
    gpio/index
    iommufd
    media/index
    dcdbas
-- 
2.47.1


