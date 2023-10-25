Return-Path: <linux-doc+bounces-1095-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C427D67AB
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 11:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 091EB281247
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 09:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB9B23773;
	Wed, 25 Oct 2023 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6778224F1;
	Wed, 25 Oct 2023 09:57:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 54EEFDD;
	Wed, 25 Oct 2023 02:57:36 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 937582F4;
	Wed, 25 Oct 2023 02:58:17 -0700 (PDT)
Received: from e127643.arm.com (unknown [10.57.70.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB5953F738;
	Wed, 25 Oct 2023 02:57:33 -0700 (PDT)
From: James Clark <james.clark@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	suzuki.poulose@arm.com,
	oliver.upton@linux.dev
Cc: kvmarm@lists.linux.dev,
	James Clark <james.clark@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zaid Al-Bassam <zalbassam@google.com>,
	Reiji Watanabe <reijiw@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] arm: perf: Include threshold control fields valid in PMEVTYPER mask
Date: Wed, 25 Oct 2023 10:57:03 +0100
Message-Id: <20231025095710.1559601-2-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025095710.1559601-1-james.clark@arm.com>
References: <20231025095710.1559601-1-james.clark@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FEAT_PMUv3_TH (Armv8.8) adds two new fields to PMEVTYPER, so include
them in the mask. These aren't writable on 32 bit kernels as they are in
the high part of the register, so split the mask definition to the asm
files for each platform.

Despite not being used on aarch32, TH and TC macros are added to the
shared header file, because will be used in arm_pmuv3.c which is
compiled for both platforms.

Signed-off-by: James Clark <james.clark@arm.com>
---
 arch/arm/include/asm/arm_pmuv3.h   | 3 +++
 arch/arm64/include/asm/arm_pmuv3.h | 4 ++++
 include/linux/perf/arm_pmuv3.h     | 3 ++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 72529f5e2bed..491310133d09 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -9,6 +9,9 @@
 #include <asm/cp15.h>
 #include <asm/cputype.h>
 
+/* Mask for writable bits */
+#define ARMV8_PMU_EVTYPE_MASK	0xc800ffff
+
 #define PMCCNTR			__ACCESS_CP15_64(0, c9)
 
 #define PMCR			__ACCESS_CP15(c9,  0, c12, 0)
diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 18dc2fb3d7b7..4faf4f7385a5 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -11,6 +11,10 @@
 #include <asm/cpufeature.h>
 #include <asm/sysreg.h>
 
+/* Mask for writable bits */
+#define ARMV8_PMU_EVTYPE_MASK	(0xc800ffffUL | ARMV8_PMU_EVTYPE_TH | \
+				ARMV8_PMU_EVTYPE_TC)
+
 #define RETURN_READ_PMEVCNTRN(n) \
 	return read_sysreg(pmevcntr##n##_el0)
 static inline unsigned long read_pmevcntrn(int n)
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index 9c226adf938a..ddd1fec86739 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -228,7 +228,8 @@
 /*
  * PMXEVTYPER: Event selection reg
  */
-#define ARMV8_PMU_EVTYPE_MASK	0xc800ffff	/* Mask for writable bits */
+#define ARMV8_PMU_EVTYPE_TH	GENMASK(43, 32)
+#define ARMV8_PMU_EVTYPE_TC	GENMASK(63, 61)
 #define ARMV8_PMU_EVTYPE_EVENT	0xffff		/* Mask for EVENT bits */
 
 /*
-- 
2.34.1


