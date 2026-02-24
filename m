Return-Path: <linux-doc+bounces-76873-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOxOFsDqnWlDSgQAu9opvQ
	(envelope-from <linux-doc+bounces-76873-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 19:15:28 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C80EF18B1F5
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 19:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3197F31801F9
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 18:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7DC3AE715;
	Tue, 24 Feb 2026 18:00:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8795F3AE6FF;
	Tue, 24 Feb 2026 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956043; cv=none; b=WqzILnYj3oAUCL0fdlO1erVNzmgK2qc+b7T4Jj2FHcRoGd+zN/f/mbtq0vD9uxrP8iv2ychpzUGJwAP5mRJanhaNpTOFns1B+d3PL/IY2HHERJzEURQ1ai/VJcbQZZrdFXZBizJX21vpWhVUIuXp01wcuUzgt+eR0hG8GCAIJGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956043; c=relaxed/simple;
	bh=aeoayjhR4Env2BNgftLhVVIzl3HS70cLB7bRb+1LXBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cS1otvmJHCwYdeWlLTxdjqZwvHZIBSaTQzanA5nK5rq8tMPIr2S6qpkeROB7c83HUQSOGFCMymxh0X2kcbKSPwpWCAl++mffhSAU4fGw6HOoBupMCeolDRGfYtP7gw73bMAXuSDecqnj4mGN1U0gU5Bj2WIjP3jIBoOBIJMht/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A61BC1595;
	Tue, 24 Feb 2026 10:00:35 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40D733F59E;
	Tue, 24 Feb 2026 10:00:36 -0800 (PST)
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
Subject: [PATCH v5 34/41] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
Date: Tue, 24 Feb 2026 17:57:13 +0000
Message-ID: <20260224175720.2663924-35-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-76873-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,arm.com:mid,arm.com:email,fujitsu.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C80EF18B1F5
X-Rspamd-Action: no action

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


