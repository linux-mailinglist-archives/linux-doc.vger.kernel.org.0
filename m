Return-Path: <linux-doc+bounces-9474-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D589C8557B9
	for <lists+linux-doc@lfdr.de>; Thu, 15 Feb 2024 00:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91D8A28F1F7
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 23:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8797F148314;
	Wed, 14 Feb 2024 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b="Tx3FeU36"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.codeweavers.com (mail.codeweavers.com [4.36.192.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C522D1474DB;
	Wed, 14 Feb 2024 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.36.192.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707954816; cv=none; b=iOkRGCq0oGoq9elvMXMsvdpJQUbC7PxQ0R8awRvvuaC1Me98V2ANrkQrWL9bLnSfCFe0UX2jsT19f8WIqVycstxGuVORz99/NmYW9JQYlLNJiGIptz2YL0FtKaFakiEiHIBnodhx4Sj2rJtHRbSYlfqVjicTNs9qGUsikW151Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707954816; c=relaxed/simple;
	bh=I4trA2JfrK9wBwFoc8bTAUMVwA5tJ+kKV0vPGN6dfHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5U50vVFdqQsw20QQhmeYbXOH1sR3e4SjpK23To1yNMJ4T7ir/UtGSEz6vL3kGi21YYIZS4eEWUQDBx/4DBdldfHZ31CYEjxlQL3JAQf8gDN6VwIKiCA2P2qyP0TrlI42ON0MiciWSg0re9tRbxLOCM/+5g++3v6x7Y5DNi+t/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com; spf=pass smtp.mailfrom=codeweavers.com; dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b=Tx3FeU36; arc=none smtp.client-ip=4.36.192.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeweavers.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codeweavers.com; s=s1; h=Message-ID:Date:Subject:Cc:To:From:Sender;
	bh=X/IZwfYWP9znQfddabnSoi+xBA9zWsqNxvzC3bQDVaM=; b=Tx3FeU36Xq2ZUqbwOw5gKia8RC
	I+KdCplVS2o4/O6CjoEVbGmOmvXv1cd8SoGO5MPi4hbWJh4WOyxaQssM8x8BTNgCKITP5zdHC9ZKJ
	WkecUFN9f9Ph9S0NDVyl63Jgns+5yWJ855ZOXKSMfuYW2FDIKlixl4HD/8eyIk1cXNIqqvYVqvAqb
	g00v7uT2y+RrMm9auQ6uH0hwivRq9McI7Ny8oB1juCnPfq8WHXJMxrnytr+XUFMO+mn3Grzg7TNb/
	H47/nAUyuKcFUR3ETIH/rjgO5rKUUHTUlMr1jmRfrju7IXy5P1pc0ydj7JYFCNbCv1t1iJEth2fYH
	DyO0ofDw==;
Received: from cw137ip160.mn.codeweavers.com ([10.69.137.160] helo=camazotz.mn.codeweavers.com)
	by mail.codeweavers.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <zfigura@codeweavers.com>)
	id 1raOoV-00GbiL-2O;
	Wed, 14 Feb 2024 17:37:15 -0600
From: Elizabeth Figura <zfigura@codeweavers.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	wine-devel@winehq.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Wolfram Sang <wsa@kernel.org>,
	Arkadiusz Hiler <ahiler@codeweavers.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Elizabeth Figura <zfigura@codeweavers.com>
Subject: [PATCH 01/31] ntsync: Introduce the ntsync driver and character device.
Date: Wed, 14 Feb 2024 17:36:37 -0600
Message-ID: <20240214233645.9273-2-zfigura@codeweavers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214233645.9273-1-zfigura@codeweavers.com>
References: <20240214233645.9273-1-zfigura@codeweavers.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntsync uses a misc device as the simplest and least intrusive uAPI interface.

Each file description on the device represents an isolated NT instance, intended
to correspond to a single NT virtual machine.

Signed-off-by: Elizabeth Figura <zfigura@codeweavers.com>
---
 drivers/misc/Kconfig  |  9 ++++++++
 drivers/misc/Makefile |  1 +
 drivers/misc/ntsync.c | 52 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 drivers/misc/ntsync.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4fb291f0bf7c..bdd8a71bd853 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -504,6 +504,15 @@ config OPEN_DICE
 	  measured boot flow. Userspace can use CDIs for remote attestation
 	  and sealing.
 
+config NTSYNC
+	tristate "NT synchronization primitive emulation"
+	help
+	  This module provides kernel support for emulation of Windows NT
+	  synchronization primitives. It is not a hardware driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ntsync.
+
 	  If unsure, say N.
 
 config VCPU_STALL_DETECTOR
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index ea6ea5bbbc9c..153a3f4837e8 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -59,6 +59,7 @@ obj-$(CONFIG_PVPANIC)   	+= pvpanic/
 obj-$(CONFIG_UACCE)		+= uacce/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
+obj-$(CONFIG_NTSYNC)		+= ntsync.o
 obj-$(CONFIG_HI6421V600_IRQ)	+= hi6421v600-irq.o
 obj-$(CONFIG_OPEN_DICE)		+= open-dice.o
 obj-$(CONFIG_GP_PCI1XXXX)	+= mchp_pci1xxxx/
diff --git a/drivers/misc/ntsync.c b/drivers/misc/ntsync.c
new file mode 100644
index 000000000000..e4969ef90722
--- /dev/null
+++ b/drivers/misc/ntsync.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ntsync.c - Kernel driver for NT synchronization primitives
+ *
+ * Copyright (C) 2024 Elizabeth Figura
+ */
+
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+
+#define NTSYNC_NAME	"ntsync"
+
+static int ntsync_char_open(struct inode *inode, struct file *file)
+{
+	return nonseekable_open(inode, file);
+}
+
+static int ntsync_char_release(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static long ntsync_char_ioctl(struct file *file, unsigned int cmd,
+			      unsigned long parm)
+{
+	switch (cmd) {
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
+static const struct file_operations ntsync_fops = {
+	.owner		= THIS_MODULE,
+	.open		= ntsync_char_open,
+	.release	= ntsync_char_release,
+	.unlocked_ioctl	= ntsync_char_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+	.llseek		= no_llseek,
+};
+
+static struct miscdevice ntsync_misc = {
+	.minor		= MISC_DYNAMIC_MINOR,
+	.name		= NTSYNC_NAME,
+	.fops		= &ntsync_fops,
+};
+
+module_misc_device(ntsync_misc);
+
+MODULE_AUTHOR("Elizabeth Figura");
+MODULE_DESCRIPTION("Kernel driver for NT synchronization primitives");
+MODULE_LICENSE("GPL");
-- 
2.43.0


