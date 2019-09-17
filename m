Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8709BB4F93
	for <lists+linux-doc@lfdr.de>; Tue, 17 Sep 2019 15:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbfIQNnr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 17 Sep 2019 09:43:47 -0400
Received: from foss.arm.com ([217.140.110.172]:56224 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbfIQNnr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Sep 2019 09:43:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F97928;
        Tue, 17 Sep 2019 06:43:46 -0700 (PDT)
Received: from e108754-lin.cambridge.arm.com (e108754-lin.cambridge.arm.com [10.1.199.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 713B33F575;
        Tue, 17 Sep 2019 06:43:45 -0700 (PDT)
From:   Ionela Voinescu <ionela.voinescu@arm.com>
To:     catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
        corbet@lwn.net
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ionela Voinescu <ionela.voinescu@arm.com>
Subject: [PATCH 4/4] Documentation: arm64: document support for the AMU extension
Date:   Tue, 17 Sep 2019 14:42:28 +0100
Message-Id: <20190917134228.5369-5-ionela.voinescu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917134228.5369-1-ionela.voinescu@arm.com>
References: <20190917134228.5369-1-ionela.voinescu@arm.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The activity monitors extension is an optional extension introduced
by the ARMv8.4 CPU architecture.

Add initial documentation for the AMUv1 extension:
 - arm64/amu.txt: AMUv1 documentation
 - arm64/booting.txt: system registers initialisation
 - arm64/cpu-feature-registers.txt: visibility to userspace

Signed-off-by: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/arm64/amu.rst                   | 107 ++++++++++++++++++
 Documentation/arm64/booting.rst               |  14 +++
 Documentation/arm64/cpu-feature-registers.rst |   2 +
 Documentation/arm64/index.rst                 |   1 +
 4 files changed, 124 insertions(+)
 create mode 100644 Documentation/arm64/amu.rst

diff --git a/Documentation/arm64/amu.rst b/Documentation/arm64/amu.rst
new file mode 100644
index 000000000000..62a6635522e1
--- /dev/null
+++ b/Documentation/arm64/amu.rst
@@ -0,0 +1,107 @@
+=======================================================
+Activity Monitors Unit (AMU) extension in AArch64 Linux
+=======================================================
+
+Author: Ionela Voinescu <ionela.voinescu@arm.com>
+
+Date: 2019-09-10
+
+This document briefly describes the provision of Activity Monitors Unit
+support in AArch64 Linux.
+
+
+Architecture overview
+---------------------
+
+The activity monitors extension is an optional extension introduced by the
+ARMv8.4 CPU architecture.
+
+The activity monitors unit, implemented in each CPU, provides performance
+counters intended for system management use. The AMU extension provides a
+system register interface to the counter registers and also supports an
+optional external memory-mapped interface.
+
+Version 1 of the Activity Monitors architecture implements a counter group
+of four fixed and architecturally defined 64-bit event counters.
+  - CPU cycle counter: increments at the frequency of the CPU.
+  - Constant counter: increments at the fixed frequency of the system
+    clock.
+  - Instructions retired: increments with every architecturally executed
+    instruction.
+  - Memory stall cycles: counts instruction dispatch stall cycles caused by
+    misses in the last level cache within the clock domain.
+
+When in WFI or WFE these counters do not increment.
+
+The Activity Monitors architecture provides space for up to 16 architected
+event counters. Future versions of the architecture may use this space to
+implement additional architected event counters.
+
+Additionally, version 1 implements a counter group of up to 16 auxiliary
+64-bit event counters.
+
+On cold reset all counters reset to 0.
+
+
+Basic support
+-------------
+
+The kernel can safely run a mix of CPUs with and without support for the
+activity monitors extension. Therefore, when CONFIG_ARM64_AMU_EXTN is
+selected we unconditionally enable the capability to allow any late CPU
+(secondary or hotplugged) to detect and use the feature.
+
+When the feature is detected on a CPU, a per-CPU variable (amu_feat) is
+set, but this does not guarantee the correct functionality of the
+counters, only the presence of the extension.
+
+Firmware (code running at higher exception levels, e.g. arm-tf) support is
+needed to:
+ - Enable access for lower exception levels (EL2 and EL1) to the AMU
+   registers.
+ - Enable the counters. If not enabled these will read as 0.
+ - Save/restore the counters before/after the CPU is being put/brought up
+   from the 'off' power state.
+
+When using kernels that have this configuration enabled but boot with
+broken firmware the user may experience panics or lockups when accessing
+the counter registers. Even if these symptoms are not observed, the
+values returned by the register reads might not correctly reflect reality.
+Most commonly, the counters will read as 0, indicating that they are not
+enabled. If proper support is not provided in firmware it's best to disable
+CONFIG_ARM64_AMU_EXTN.
+
+The fixed counters of AMUv1 are accessible though the following system
+register definitions:
+ - SYS_AMEVCNTR0_CORE_EL0
+ - SYS_AMEVCNTR0_CONST_EL0
+ - SYS_AMEVCNTR0_INST_RET_EL0
+ - SYS_AMEVCNTR0_MEM_STALL_EL0
+
+Auxiliary platform specific counters can be accessed using
+SYS_AMEVCNTR1_EL0(n), where n is a value between 0 and 15.
+
+Details can be found in: arch/arm64/include/asm/sysreg.h.
+
+
+Userspace access
+----------------
+
+Currently, access from userspace to the AMU registers is disabled due to:
+ - Security reasons: they might expose information about code executed in
+   secure mode.
+ - Purpose: AMU counters are intended for system management use.
+
+Also, the presence of the feature is not visible to userspace.
+
+
+Virtualization
+--------------
+
+Currently, access from userspace (EL0) and kernelspace (EL1) on the KVM
+guest side is disabled due to:
+ - Security reasons: they might expose information about code executed
+   by other guests or the host.
+
+Any attempt to access the AMU registers will result in an UNDEFINED
+exception being injected into the guest.
diff --git a/Documentation/arm64/booting.rst b/Documentation/arm64/booting.rst
index d3f3a60fbf25..a17f427990d6 100644
--- a/Documentation/arm64/booting.rst
+++ b/Documentation/arm64/booting.rst
@@ -245,6 +245,20 @@ Before jumping into the kernel, the following conditions must be met:
     - HCR_EL2.APK (bit 40) must be initialised to 0b1
     - HCR_EL2.API (bit 41) must be initialised to 0b1
 
+  For CPUs with Activity Monitors Unit v1 (AMUv1) extension present:
+  - If EL3 is present:
+    CPTR_EL3.TAM (bit 30) must be initialised to 0b0
+    CPTR_EL2.TAM (bit 30) must be initialised to 0b0
+    AMCNTENSET0_EL0 must be initialised to 0b1111
+    AMCNTENSET1_EL0 must be initialised to a platform specific value
+    having 0b1 set for the corresponding bit for each of the auxiliary
+    counters present.
+  - If the kernel is entered at EL1:
+    AMCNTENSET0_EL0 must be initialised to 0b1111
+    AMCNTENSET1_EL0 must be initialised to a platform specific value
+    having 0b1 set for the corresponding bit for each of the auxiliary
+    counters present.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.
diff --git a/Documentation/arm64/cpu-feature-registers.rst b/Documentation/arm64/cpu-feature-registers.rst
index 2955287e9acc..c0effe36e54c 100644
--- a/Documentation/arm64/cpu-feature-registers.rst
+++ b/Documentation/arm64/cpu-feature-registers.rst
@@ -150,6 +150,8 @@ infrastructure:
      +------------------------------+---------+---------+
      | DIT                          | [51-48] |    y    |
      +------------------------------+---------+---------+
+     | AMU                          | [47-44] |    n    |
+     +------------------------------+---------+---------+
      | SVE                          | [35-32] |    y    |
      +------------------------------+---------+---------+
      | GIC                          | [27-24] |    n    |
diff --git a/Documentation/arm64/index.rst b/Documentation/arm64/index.rst
index 5c0c69dc58aa..09cbb4ed2237 100644
--- a/Documentation/arm64/index.rst
+++ b/Documentation/arm64/index.rst
@@ -6,6 +6,7 @@ ARM64 Architecture
     :maxdepth: 1
 
     acpi_object_usage
+    amu
     arm-acpi
     booting
     cpu-feature-registers
-- 
2.17.1

