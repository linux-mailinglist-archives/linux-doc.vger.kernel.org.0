Return-Path: <linux-doc+bounces-3069-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A68D47F79C7
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 17:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D87DF1C20A37
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 16:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82FA2C869;
	Fri, 24 Nov 2023 16:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YFT93xtH"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CA019B7;
	Fri, 24 Nov 2023 08:59:45 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1700845183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NktJjNztL6a9VBLs/6z7OLOrm+oRflq1cbNxypOGnd4=;
	b=YFT93xtHAazANu0N84o4LWWKdsAnfTk6pK4xImBlQtc9k3KFTOjQY/b/w2MT43T6dW76SG
	Loqz4kq2trnfHkMGdyF4Ex+M0xi96S0bCg8O8oNgwug27jMU33BtBtOK6WkQoKL5ETXQe8
	d43K/RdHTOCYWhC4Cd4b9xSVy5eIuAg=
From: Sergei Shtepa <sergei.shtepa@linux.dev>
To: axboe@kernel.dk,
	hch@infradead.org,
	corbet@lwn.net,
	snitzer@kernel.org
Cc: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Sergei Shtepa <sergei.shtepa@veeam.com>
Subject: [PATCH v6 01/11] documentation: Block Device Filtering Mechanism
Date: Fri, 24 Nov 2023 17:59:23 +0100
Message-Id: <20231124165933.27580-2-sergei.shtepa@linux.dev>
In-Reply-To: <20231124165933.27580-1-sergei.shtepa@linux.dev>
References: <20231124165933.27580-1-sergei.shtepa@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Sergei Shtepa <sergei.shtepa@veeam.com>

The document contains:
* Describes the purpose of the mechanism
* A little historical background on the capabilities of handling I/O
  units of the Linux kernel
* Brief description of the design
* Reference to interface description

Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>
---
 Documentation/block/blkfilter.rst | 66 +++++++++++++++++++++++++++++++
 Documentation/block/index.rst     |  1 +
 MAINTAINERS                       |  6 +++
 3 files changed, 73 insertions(+)
 create mode 100644 Documentation/block/blkfilter.rst

diff --git a/Documentation/block/blkfilter.rst b/Documentation/block/blkfilter.rst
new file mode 100644
index 000000000000..4e148e78f3d4
--- /dev/null
+++ b/Documentation/block/blkfilter.rst
@@ -0,0 +1,66 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================================
+Block Device Filtering Mechanism
+================================
+
+The block device filtering mechanism provides the ability to attach block
+device filters. Block device filters allow performing additional processing
+for I/O units.
+
+Introduction
+============
+
+The idea of handling I/O units on block devices is not new. Back in the
+2.6 kernel, there was an undocumented possibility of handling I/O units
+by substituting the make_request_fn() function, which belonged to the
+request_queue structure. But none of the in-tree kernel modules used this
+feature, and it was eliminated in the 5.10 kernel.
+
+The block device filtering mechanism returns the ability to handle I/O units.
+It is possible to safely attach a filter to a block device "on the fly" without
+changing the structure of the block device's stack.
+
+It supports attaching one filter to one block device, because there is only
+one filter implementation in the kernel yet.
+See Documentation/block/blksnap.rst.
+
+Design
+======
+
+The block device filtering mechanism provides registration and unregistration
+for filter operations. The struct blkfilter_operations contains a pointer to
+the callback functions for the filter. After registering the filter operations,
+the filter can be managed using block device ioctls BLKFILTER_ATTACH,
+BLKFILTER_DETACH and BLKFILTER_CTL.
+
+When the filter is attached, the callback function is called for each I/O unit
+for a block device, providing I/O unit filtering. Depending on the result of
+filtering the I/O unit, it can either be passed for subsequent processing by
+the block layer, or skipped.
+
+The filter can be implemented as a loadable module. In this case, the filter
+module cannot be unloaded while the filter is attached to at least one of the
+block devices.
+
+Interface description
+=====================
+
+The ioctl BLKFILTER_ATTACH allows user-space programs to attach a block device
+filter to a block device. The ioctl BLKFILTER_DETACH allows user-space programs
+to detach it. Both ioctls use &struct blkfilter_name. The ioctl BLKFILTER_CTL
+allows user-space programs to send a filter-specific command. It use &struct
+blkfilter_ctl.
+
+.. kernel-doc:: include/uapi/linux/blk-filter.h
+
+To register in the system, the filter uses the &struct blkfilter_operations,
+which contains callback functions, unique filter name and module owner. When
+attaching a filter to a block device, the filter creates a &struct blkfilter.
+The pointer to the &struct blkfilter allows the filter to determine for which
+block device the callback functions are being called.
+
+.. kernel-doc:: include/linux/blk-filter.h
+
+.. kernel-doc:: block/blk-filter.c
+   :export:
diff --git a/Documentation/block/index.rst b/Documentation/block/index.rst
index 9fea696f9daa..e9712f72cd6d 100644
--- a/Documentation/block/index.rst
+++ b/Documentation/block/index.rst
@@ -10,6 +10,7 @@ Block
    bfq-iosched
    biovecs
    blk-mq
+   blkfilter
    cmdline-partition
    data-integrity
    deadline-iosched
diff --git a/MAINTAINERS b/MAINTAINERS
index 97f51d5ec1cf..c20cbec81b58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3584,6 +3584,12 @@ M:	Jan-Simon Moeller <jansimon.moeller@gmx.de>
 S:	Maintained
 F:	drivers/leds/leds-blinkm.c
 
+BLOCK DEVICE FILTERING MECHANISM
+M:	Sergei Shtepa <sergei.shtepa@veeam.com>
+L:	linux-block@vger.kernel.org
+S:	Supported
+F:	Documentation/block/blkfilter.rst
+
 BLOCK LAYER
 M:	Jens Axboe <axboe@kernel.dk>
 L:	linux-block@vger.kernel.org
-- 
2.20.1


