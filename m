Return-Path: <linux-doc+bounces-4314-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78102807A81
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 22:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A93311C20ABA
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 21:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257DF70966;
	Wed,  6 Dec 2023 21:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="Yxvzotlq"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65ACD5C;
	Wed,  6 Dec 2023 13:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1701898408; x=1733434408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=olXMY6IT8d9dmgacsnRgFeTZm0WgXJ1U7yVx5NNY3To=;
  b=YxvzotlqmijvJgPVVPwxfkQbUystmXG3eLx/7xmblqPL4tGk6E3KCrU8
   JvuqXH2aDvDVhsVM0EnYOYjFvWpinKe4sP8HCtVMrC3HG7SJBbhrOGU9X
   HfRPRyI3681O3GRWMnMgLRdwyZA6RUyTqsI/VC3Hur4Gydyq3kNxgX6nj
   s=;
X-IronPort-AV: E=Sophos;i="6.04,256,1695686400"; 
   d="scan'208";a="257298916"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-ed19f671.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 21:33:28 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
	by email-inbound-relay-pdx-2b-m6i4x-ed19f671.us-west-2.amazon.com (Postfix) with ESMTPS id 32CEA82660;
	Wed,  6 Dec 2023 21:33:27 +0000 (UTC)
Received: from EX19MTAUWA002.ant.amazon.com [10.0.7.35:14806]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.56.214:2525] with esmtp (Farcaster)
 id 9e65d653-7053-45d0-8def-e5b76986597e; Wed, 6 Dec 2023 21:33:26 +0000 (UTC)
X-Farcaster-Flow-ID: 9e65d653-7053-45d0-8def-e5b76986597e
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 6 Dec 2023 21:33:26 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.253.83.51) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 6 Dec 2023 21:33:25 +0000
From: Alexander Graf <graf@amazon.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-doc@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, =?UTF-8?q?Jan=20H=20=2E=20Sch=C3=B6nherr?=
	<jschoenh@amazon.de>, James Gowans <jgowans@amazon.com>
Subject: [PATCH v2] initramfs: Expose retained initrd as sysfs file
Date: Wed, 6 Dec 2023 21:33:23 +0000
Message-ID: <20231206213323.78233-1-graf@amazon.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D036UWB004.ant.amazon.com (10.13.139.170) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the kernel command line option "retain_initrd" is set, we do not
free the initrd memory. However, we also don't expose it to anyone for
consumption. That leaves us in a weird situation where the only user of
this feature is ppc64 and arm64 specific kexec tooling.

To make it more generally useful, this patch adds a kobject to the
firmware object that contains the initrd context when "retain_initrd"
is set. That way, we can access the initrd any time after boot from
user space and for example hand it into kexec as --initrd parameter
if we want to reboot the same initrd. Or inspect it directly locally.

With this patch applied, there is a new /sys/firmware/initrd file when
the kernel was booted with an initrd and "retain_initrd" command line
option is set.

Signed-off-by: Alexander Graf <graf@amazon.com>

---

v1 -> v2:

  - Reword commit message to explain the new file path
  - Add a Documentation/ABI/testing/sysfs-firmware-initrd file
---
 .../ABI/testing/sysfs-firmware-initrd          |  8 ++++++++
 .../admin-guide/kernel-parameters.txt          |  5 +++--
 init/initramfs.c                               | 18 +++++++++++++++++-
 3 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-initrd

diff --git a/Documentation/ABI/testing/sysfs-firmware-initrd b/Documentation/ABI/testing/sysfs-firmware-initrd
new file mode 100644
index 000000000000..20bf7cf77a19
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-initrd
@@ -0,0 +1,8 @@
+What:		/sys/firmware/initrd
+Date:		December 2023
+Contact:	Alexander Graf <graf@amazon.com>
+Description:
+		When the kernel was booted with an initrd and the
+		"retain_initrd" option is set on the kernel command
+		line, /sys/firmware/initrd contains the contents of the
+		initrd that the kernel was booted with.
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 65731b060e3f..51575cd31741 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2438,7 +2438,7 @@
 			between unregistering the boot console and initializing
 			the real console.
 
-	keepinitrd	[HW,ARM]
+	keepinitrd	[HW,ARM] See retain_initrd.
 
 	kernelcore=	[KNL,X86,IA-64,PPC]
 			Format: nn[KMGTPE] | nn% | "mirror"
@@ -5580,7 +5580,8 @@
 			Useful for devices that are detected asynchronously
 			(e.g. USB and MMC devices).
 
-	retain_initrd	[RAM] Keep initrd memory after extraction
+	retain_initrd	[RAM] Keep initrd memory after extraction. After boot, it will
+			be accessible via /sys/firmware/initrd.
 
 	retbleed=	[X86] Control mitigation of RETBleed (Arbitrary
 			Speculative Code Execution with Return Instructions)
diff --git a/init/initramfs.c b/init/initramfs.c
index 8d0fd946cdd2..25244e2a5739 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -574,6 +574,16 @@ extern unsigned long __initramfs_size;
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+static ssize_t raw_read(struct file *file, struct kobject *kobj,
+			struct bin_attribute *attr, char *buf,
+			loff_t pos, size_t count)
+{
+	memcpy(buf, attr->private + pos, count);
+	return count;
+}
+
+static BIN_ATTR(initrd, 0440, raw_read, NULL, 0);
+
 void __init reserve_initrd_mem(void)
 {
 	phys_addr_t start;
@@ -715,8 +725,14 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	 * If the initrd region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
-	if (!do_retain_initrd && initrd_start && !kexec_free_initrd())
+	if (!do_retain_initrd && initrd_start && !kexec_free_initrd()) {
 		free_initrd_mem(initrd_start, initrd_end);
+	} else if (do_retain_initrd) {
+		bin_attr_initrd.size = initrd_end - initrd_start;
+		bin_attr_initrd.private = (void *)initrd_start;
+		if (sysfs_create_bin_file(firmware_kobj, &bin_attr_initrd))
+			pr_err("Failed to create initrd sysfs file");
+	}
 	initrd_start = 0;
 	initrd_end = 0;
 
-- 
2.40.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




