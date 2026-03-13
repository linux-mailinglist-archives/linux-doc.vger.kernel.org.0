Return-Path: <linux-doc+bounces-79301-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLyYHYImtGl7hwAAu9opvQ
	(envelope-from <linux-doc+bounces-79301-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 16:00:18 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA80285741
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 16:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D673306FE66
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 14:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DAE3B6BFC;
	Fri, 13 Mar 2026 14:48:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76E23AE19E;
	Fri, 13 Mar 2026 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413334; cv=none; b=QGaJ70W4k10/rF4RU5pLDasqT7wo+ehRanczd8hT3BdBk1lge5ZURxAKyBdIxdLNYZrrf6QZipi+Sp8GRKMwQCpU1d52pJ8gH4UpXgiyxfjzZWbaWNFscjDbBVr7n1bpVQhXBILEC5GRN/eRPQnv+WyBkBV2wSvzlWiTBbLJvKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413334; c=relaxed/simple;
	bh=Gf6rIBzAnLvTYVlpYrbBCjaTIS2fwWVhjplvZafTaEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoKKRp3eeMrqqdeCXt6YKnUXAGhaw1r3IPWEV8pm90oPFy4bX7AeL3k4UpQ1e+83/sqyv+GR2J12+zFvFxNB4V2w1Uxp1+xc5O1M0if7mP9rbtgpIR/B7MDWnYF5eDSOP+zXVtVdS5R1q8p/qdDF3e3QI0kt5sLlVRXRk+Fyubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F94024E9;
	Fri, 13 Mar 2026 07:48:45 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F4763F7BD;
	Fri, 13 Mar 2026 07:48:47 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v6 33/40] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
Date: Fri, 13 Mar 2026 14:46:10 +0000
Message-ID: <20260313144617.3420416-34-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-79301-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.921];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fujitsu.com:email,arm.com:email,arm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,huawei.com:email]
X-Rspamd-Queue-Id: 2FA80285741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: James Morse <james.morse@arm.com>

Enough MPAM support is present to enable ARCH_HAS_CPU_RESCTRL.  Let it
rip^Wlink!

ARCH_HAS_CPU_RESCTRL indicates resctrl can be enabled. It is enabled by the
arch code simply because it has 'arch' in its name.

This removes ARM_CPU_RESCTRL as a mimic of X86_CPU_RESCTRL.  While here,
move the ACPI dependency to the driver's Kconfig file.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Reviewed-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 arch/arm64/Kconfig               | 2 +-
 arch/arm64/include/asm/resctrl.h | 2 ++
 drivers/resctrl/Kconfig          | 7 +++++++
 drivers/resctrl/Makefile         | 2 +-
 4 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/include/asm/resctrl.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3170c67464fb..41a5b4ef86b4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2017,7 +2017,7 @@ config ARM64_TLB_RANGE
 config ARM64_MPAM
 	bool "Enable support for MPAM"
 	select ARM64_MPAM_DRIVER
-	select ACPI_MPAM if ACPI
+	select ARCH_HAS_CPU_RESCTRL
 	help
 	  Memory System Resource Partitioning and Monitoring (MPAM) is an
 	  optional extension to the Arm architecture that allows each
diff --git a/arch/arm64/include/asm/resctrl.h b/arch/arm64/include/asm/resctrl.h
new file mode 100644
index 000000000000..b506e95cf6e3
--- /dev/null
+++ b/arch/arm64/include/asm/resctrl.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/arm_mpam.h>
diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index c34e059c6e41..672abea3b03c 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -1,6 +1,7 @@
 menuconfig ARM64_MPAM_DRIVER
 	bool "MPAM driver"
 	depends on ARM64 && ARM64_MPAM
+	select ACPI_MPAM if ACPI
 	help
 	  Memory System Resource Partitioning and Monitoring (MPAM) driver for
 	  System IP, e.g. caches and memory controllers.
@@ -22,3 +23,9 @@ config MPAM_KUNIT_TEST
 	  If unsure, say N.
 
 endif
+
+config ARM64_MPAM_RESCTRL_FS
+	bool
+	default y if ARM64_MPAM_DRIVER && RESCTRL_FS
+	select RESCTRL_RMID_DEPENDS_ON_CLOSID
+	select RESCTRL_ASSIGN_FIXED
diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index 40beaf999582..4f6d0e81f9b8 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -1,5 +1,5 @@
 obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
 mpam-y						+= mpam_devices.o
-mpam-$(CONFIG_ARM_CPU_RESCTRL)			+= mpam_resctrl.o
+mpam-$(CONFIG_ARM64_MPAM_RESCTRL_FS)		+= mpam_resctrl.o
 
 ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
-- 
2.43.0


