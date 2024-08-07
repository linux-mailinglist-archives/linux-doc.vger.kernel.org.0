Return-Path: <linux-doc+bounces-22375-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2F994A03C
	for <lists+linux-doc@lfdr.de>; Wed,  7 Aug 2024 08:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51E0E287EA4
	for <lists+linux-doc@lfdr.de>; Wed,  7 Aug 2024 06:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CA91C57B2;
	Wed,  7 Aug 2024 06:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mmq4Fb6l"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F11B8E91;
	Wed,  7 Aug 2024 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723012977; cv=none; b=VVumyySMV9bJ/54vKQ9okGId8ZCOIjAKYYNMwIHPrEFGg92sSy65IAmAugH9Kljge77nKSRkqsHcBJLjeXRTaflBWPcwQi1TW+8GyfI7MIb3n86o8dyj7acy3FAmAce7kdttgJbiaab+fG08zu11UAl05L7mH1tC2w4dIN93Oew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723012977; c=relaxed/simple;
	bh=8yy1QmnFGpq6td8t1/gt5nL6WxUWVn9wAnHedtaKMAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WslY9yTJSkk+4KP2dGNykohPSjv99WqaePmqTcTjsKOpS9FApVdM4ineKAIMBMtaYtEegmSHI4fgBWIwT1vZwLDle16g7FdOBqZKQWAbOBqlc/4RacvDQ914T82quzYrR4JLy7NNSzphqWssvPoo34QhmfjEhnxG4NViocpFPEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mmq4Fb6l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2152EC4AF0D;
	Wed,  7 Aug 2024 06:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723012976;
	bh=8yy1QmnFGpq6td8t1/gt5nL6WxUWVn9wAnHedtaKMAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mmq4Fb6lMM4UBj/vS1nGtaL+oIMhDXBx5vB/BBSLc6yDBBW7uGw9OEYTqaJleyUUQ
	 oDJHhw0fcfSP0HkmCap0i6pcif8CW0ux+5nGtGP6LaCxwpnExs5r4kQYXdOVrHhGFd
	 lw9AboQo/XLKldlLitL1C8DQVaDtn3pE+6WtCNGV7/gL30lNYBYkLKaME54jrDx/pJ
	 lX7nJ00Qrd3NvIiQpvXO39ZEcSy6Uhos+tsZBwOcY8v1IoJS2fVvh1z9jJHFDbgL1P
	 wIR+uWKIjCzfwu8sBT2QJOj6nvOfYZ2rrpmBzgwxaTmBJbQm2E3kODGCx+IJEc84IC
	 0kusL2tCuikig==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v4 07/26] arch, mm: move definition of node_data to generic code
Date: Wed,  7 Aug 2024 09:40:51 +0300
Message-ID: <20240807064110.1003856-8-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807064110.1003856-1-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Every architecture that supports NUMA defines node_data in the same way:

	struct pglist_data *node_data[MAX_NUMNODES];

No reason to keep multiple copies of this definition and its forward
declarations, especially when such forward declaration is the only thing
in include/asm/mmzone.h for many architectures.

Add definition and declaration of node_data to generic code and drop
architecture-specific versions.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Davidlohr Bueso <dave@stgolabs.net>
Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/arm64/include/asm/Kbuild                  |  1 +
 arch/arm64/include/asm/mmzone.h                | 13 -------------
 arch/arm64/include/asm/topology.h              |  1 +
 arch/loongarch/include/asm/Kbuild              |  1 +
 arch/loongarch/include/asm/mmzone.h            | 16 ----------------
 arch/loongarch/include/asm/topology.h          |  1 +
 arch/loongarch/kernel/numa.c                   |  3 ---
 arch/mips/include/asm/mach-ip27/mmzone.h       |  4 ----
 arch/mips/include/asm/mach-loongson64/mmzone.h |  4 ----
 arch/mips/loongson64/numa.c                    |  2 --
 arch/mips/sgi-ip27/ip27-memory.c               |  3 ---
 arch/powerpc/include/asm/mmzone.h              |  6 ------
 arch/powerpc/mm/numa.c                         |  2 --
 arch/riscv/include/asm/Kbuild                  |  1 +
 arch/riscv/include/asm/mmzone.h                | 13 -------------
 arch/riscv/include/asm/topology.h              |  4 ++++
 arch/s390/include/asm/Kbuild                   |  1 +
 arch/s390/include/asm/mmzone.h                 | 17 -----------------
 arch/s390/kernel/numa.c                        |  3 ---
 arch/sh/include/asm/mmzone.h                   |  3 ---
 arch/sh/mm/numa.c                              |  3 ---
 arch/sparc/include/asm/mmzone.h                |  4 ----
 arch/sparc/mm/init_64.c                        |  2 --
 arch/x86/include/asm/Kbuild                    |  1 +
 arch/x86/include/asm/mmzone.h                  |  6 ------
 arch/x86/include/asm/mmzone_32.h               | 17 -----------------
 arch/x86/include/asm/mmzone_64.h               | 18 ------------------
 arch/x86/mm/numa.c                             |  3 ---
 drivers/base/arch_numa.c                       |  2 --
 include/asm-generic/mmzone.h                   |  5 +++++
 include/linux/numa.h                           |  3 +++
 mm/numa.c                                      |  3 +++
 32 files changed, 22 insertions(+), 144 deletions(-)
 delete mode 100644 arch/arm64/include/asm/mmzone.h
 delete mode 100644 arch/loongarch/include/asm/mmzone.h
 delete mode 100644 arch/riscv/include/asm/mmzone.h
 delete mode 100644 arch/s390/include/asm/mmzone.h
 delete mode 100644 arch/x86/include/asm/mmzone.h
 delete mode 100644 arch/x86/include/asm/mmzone_32.h
 delete mode 100644 arch/x86/include/asm/mmzone_64.h
 create mode 100644 include/asm-generic/mmzone.h

diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
index 7d7d97ad3cd5..4e350df9a02d 100644
--- a/arch/arm64/include/asm/Kbuild
+++ b/arch/arm64/include/asm/Kbuild
@@ -9,6 +9,7 @@ syscall-y += unistd_compat_32.h
 
 generic-y += early_ioremap.h
 generic-y += mcs_spinlock.h
+generic-y += mmzone.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
 generic-y += parport.h
diff --git a/arch/arm64/include/asm/mmzone.h b/arch/arm64/include/asm/mmzone.h
deleted file mode 100644
index fa17e01d9ab2..000000000000
--- a/arch/arm64/include/asm/mmzone.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_MMZONE_H
-#define __ASM_MMZONE_H
-
-#ifdef CONFIG_NUMA
-
-#include <asm/numa.h>
-
-extern struct pglist_data *node_data[];
-#define NODE_DATA(nid)		(node_data[(nid)])
-
-#endif /* CONFIG_NUMA */
-#endif /* __ASM_MMZONE_H */
diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index 0f6ef432fb84..5fc3af9f8f29 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -5,6 +5,7 @@
 #include <linux/cpumask.h>
 
 #ifdef CONFIG_NUMA
+#include <asm/numa.h>
 
 struct pci_bus;
 int pcibus_to_node(struct pci_bus *bus);
diff --git a/arch/loongarch/include/asm/Kbuild b/arch/loongarch/include/asm/Kbuild
index 2bb3676429c0..8fa22cc52774 100644
--- a/arch/loongarch/include/asm/Kbuild
+++ b/arch/loongarch/include/asm/Kbuild
@@ -9,5 +9,6 @@ generic-y += qrwlock.h
 generic-y += qspinlock.h
 generic-y += user.h
 generic-y += ioctl.h
+generic-y += mmzone.h
 generic-y += statfs.h
 generic-y += param.h
diff --git a/arch/loongarch/include/asm/mmzone.h b/arch/loongarch/include/asm/mmzone.h
deleted file mode 100644
index 2b9a90727e19..000000000000
--- a/arch/loongarch/include/asm/mmzone.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Author: Huacai Chen (chenhuacai@loongson.cn)
- * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
- */
-#ifndef _ASM_MMZONE_H_
-#define _ASM_MMZONE_H_
-
-#include <asm/page.h>
-#include <asm/numa.h>
-
-extern struct pglist_data *node_data[];
-
-#define NODE_DATA(nid)	(node_data[(nid)])
-
-#endif /* _ASM_MMZONE_H_ */
diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/include/asm/topology.h
index 66128dec0bf6..50273c9187d0 100644
--- a/arch/loongarch/include/asm/topology.h
+++ b/arch/loongarch/include/asm/topology.h
@@ -8,6 +8,7 @@
 #include <linux/smp.h>
 
 #ifdef CONFIG_NUMA
+#include <asm/numa.h>
 
 extern cpumask_t cpus_on_node[];
 
diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 8fe21f868f72..acada671e020 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -27,10 +27,7 @@
 #include <asm/time.h>
 
 int numa_off;
-struct pglist_data *node_data[MAX_NUMNODES];
 unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
-
-EXPORT_SYMBOL(node_data);
 EXPORT_SYMBOL(node_distances);
 
 static struct numa_meminfo numa_meminfo;
diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
index 629c3f290203..56959eb9cb26 100644
--- a/arch/mips/include/asm/mach-ip27/mmzone.h
+++ b/arch/mips/include/asm/mach-ip27/mmzone.h
@@ -24,8 +24,4 @@ extern struct node_data *__node_data[];
 
 #define hub_data(n)		(&__node_data[(n)]->hub)
 
-extern struct pglist_data *node_data[];
-
-#define NODE_DATA(nid)		(node_data[nid])
-
 #endif /* _ASM_MACH_MMZONE_H */
diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
index 2effd5f8ed62..8fb70fd3c9c4 100644
--- a/arch/mips/include/asm/mach-loongson64/mmzone.h
+++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
@@ -14,10 +14,6 @@
 #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
 #define nid_to_addrbase(nid) ((unsigned long)(nid) << NODE_ADDRSPACE_SHIFT)
 
-extern struct pglist_data *node_data[];
-
-#define NODE_DATA(n)		(node_data[n])
-
 extern void __init prom_init_numa_memory(void);
 
 #endif /* _ASM_MACH_MMZONE_H */
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 64fcfaa885b6..d56238745744 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -29,8 +29,6 @@
 
 unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
 EXPORT_SYMBOL(__node_distances);
-struct pglist_data *node_data[MAX_NUMNODES];
-EXPORT_SYMBOL(node_data);
 
 cpumask_t __node_cpumask[MAX_NUMNODES];
 EXPORT_SYMBOL(__node_cpumask);
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index eb6d2fa41a8a..1963313f55d8 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -34,9 +34,6 @@
 #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
 #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
 
-struct pglist_data *node_data[MAX_NUMNODES];
-EXPORT_SYMBOL(node_data);
-
 struct node_data *__node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(__node_data);
 
diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
index da827d2d0866..d99863cd6cde 100644
--- a/arch/powerpc/include/asm/mmzone.h
+++ b/arch/powerpc/include/asm/mmzone.h
@@ -20,12 +20,6 @@
 
 #ifdef CONFIG_NUMA
 
-extern struct pglist_data *node_data[];
-/*
- * Return a pointer to the node data for node n.
- */
-#define NODE_DATA(nid)		(node_data[nid])
-
 /*
  * Following are specific to this numa platform.
  */
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index aa89899f0c1a..0744a9a2944b 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -43,11 +43,9 @@ static char *cmdline __initdata;
 
 int numa_cpu_lookup_table[NR_CPUS];
 cpumask_var_t node_to_cpumask_map[MAX_NUMNODES];
-struct pglist_data *node_data[MAX_NUMNODES];
 
 EXPORT_SYMBOL(numa_cpu_lookup_table);
 EXPORT_SYMBOL(node_to_cpumask_map);
-EXPORT_SYMBOL(node_data);
 
 static int primary_domain_index;
 static int n_mem_addr_cells, n_mem_size_cells;
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 5c589770f2a8..1461af12da6e 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -5,6 +5,7 @@ syscall-y += syscall_table_64.h
 generic-y += early_ioremap.h
 generic-y += flat.h
 generic-y += kvm_para.h
+generic-y += mmzone.h
 generic-y += parport.h
 generic-y += spinlock.h
 generic-y += spinlock_types.h
diff --git a/arch/riscv/include/asm/mmzone.h b/arch/riscv/include/asm/mmzone.h
deleted file mode 100644
index fa17e01d9ab2..000000000000
--- a/arch/riscv/include/asm/mmzone.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_MMZONE_H
-#define __ASM_MMZONE_H
-
-#ifdef CONFIG_NUMA
-
-#include <asm/numa.h>
-
-extern struct pglist_data *node_data[];
-#define NODE_DATA(nid)		(node_data[(nid)])
-
-#endif /* CONFIG_NUMA */
-#endif /* __ASM_MMZONE_H */
diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
index 61183688bdd5..fe1a8bf6902d 100644
--- a/arch/riscv/include/asm/topology.h
+++ b/arch/riscv/include/asm/topology.h
@@ -4,6 +4,10 @@
 
 #include <linux/arch_topology.h>
 
+#ifdef CONFIG_NUMA
+#include <asm/numa.h>
+#endif
+
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick		topology_scale_freq_tick
 #define arch_set_freq_scale		topology_set_freq_scale
diff --git a/arch/s390/include/asm/Kbuild b/arch/s390/include/asm/Kbuild
index 4b904110d27c..297bf7157968 100644
--- a/arch/s390/include/asm/Kbuild
+++ b/arch/s390/include/asm/Kbuild
@@ -7,3 +7,4 @@ generated-y += unistd_nr.h
 generic-y += asm-offsets.h
 generic-y += kvm_types.h
 generic-y += mcs_spinlock.h
+generic-y += mmzone.h
diff --git a/arch/s390/include/asm/mmzone.h b/arch/s390/include/asm/mmzone.h
deleted file mode 100644
index 73e3e7c6976c..000000000000
--- a/arch/s390/include/asm/mmzone.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * NUMA support for s390
- *
- * Copyright IBM Corp. 2015
- */
-
-#ifndef _ASM_S390_MMZONE_H
-#define _ASM_S390_MMZONE_H
-
-#ifdef CONFIG_NUMA
-
-extern struct pglist_data *node_data[];
-#define NODE_DATA(nid) (node_data[nid])
-
-#endif /* CONFIG_NUMA */
-#endif /* _ASM_S390_MMZONE_H */
diff --git a/arch/s390/kernel/numa.c b/arch/s390/kernel/numa.c
index 23ab9f02f278..ddc1448ea2e1 100644
--- a/arch/s390/kernel/numa.c
+++ b/arch/s390/kernel/numa.c
@@ -14,9 +14,6 @@
 #include <linux/node.h>
 #include <asm/numa.h>
 
-struct pglist_data *node_data[MAX_NUMNODES];
-EXPORT_SYMBOL(node_data);
-
 void __init numa_setup(void)
 {
 	int nid;
diff --git a/arch/sh/include/asm/mmzone.h b/arch/sh/include/asm/mmzone.h
index 7b8dead2723d..63f88b465e39 100644
--- a/arch/sh/include/asm/mmzone.h
+++ b/arch/sh/include/asm/mmzone.h
@@ -5,9 +5,6 @@
 #ifdef CONFIG_NUMA
 #include <linux/numa.h>
 
-extern struct pglist_data *node_data[];
-#define NODE_DATA(nid)		(node_data[nid])
-
 static inline int pfn_to_nid(unsigned long pfn)
 {
 	int nid;
diff --git a/arch/sh/mm/numa.c b/arch/sh/mm/numa.c
index 50f0dc1744d0..9bc212b5e762 100644
--- a/arch/sh/mm/numa.c
+++ b/arch/sh/mm/numa.c
@@ -14,9 +14,6 @@
 #include <linux/pfn.h>
 #include <asm/sections.h>
 
-struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
-EXPORT_SYMBOL_GPL(node_data);
-
 /*
  * On SH machines the conventional approach is to stash system RAM
  * in node 0, and other memory blocks in to node 1 and up, ordered by
diff --git a/arch/sparc/include/asm/mmzone.h b/arch/sparc/include/asm/mmzone.h
index a236d8aa893a..74eb2c71d077 100644
--- a/arch/sparc/include/asm/mmzone.h
+++ b/arch/sparc/include/asm/mmzone.h
@@ -6,10 +6,6 @@
 
 #include <linux/cpumask.h>
 
-extern struct pglist_data *node_data[];
-
-#define NODE_DATA(nid)		(node_data[nid])
-
 extern int numa_cpu_lookup_table[];
 extern cpumask_t numa_cpumask_lookup_table[];
 
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 53d7cb5bbffe..c6c7f43cb1e8 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -1115,11 +1115,9 @@ static void init_node_masks_nonnuma(void)
 }
 
 #ifdef CONFIG_NUMA
-struct pglist_data *node_data[MAX_NUMNODES];
 
 EXPORT_SYMBOL(numa_cpu_lookup_table);
 EXPORT_SYMBOL(numa_cpumask_lookup_table);
-EXPORT_SYMBOL(node_data);
 
 static int scan_pio_for_cfg_handle(struct mdesc_handle *md, u64 pio,
 				   u32 cfg_handle)
diff --git a/arch/x86/include/asm/Kbuild b/arch/x86/include/asm/Kbuild
index a192bdea69e2..6c23d1661b17 100644
--- a/arch/x86/include/asm/Kbuild
+++ b/arch/x86/include/asm/Kbuild
@@ -11,3 +11,4 @@ generated-y += xen-hypercalls.h
 
 generic-y += early_ioremap.h
 generic-y += mcs_spinlock.h
+generic-y += mmzone.h
diff --git a/arch/x86/include/asm/mmzone.h b/arch/x86/include/asm/mmzone.h
deleted file mode 100644
index c41b41edd691..000000000000
--- a/arch/x86/include/asm/mmzone.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifdef CONFIG_X86_32
-# include <asm/mmzone_32.h>
-#else
-# include <asm/mmzone_64.h>
-#endif
diff --git a/arch/x86/include/asm/mmzone_32.h b/arch/x86/include/asm/mmzone_32.h
deleted file mode 100644
index 2d4515e8b7df..000000000000
--- a/arch/x86/include/asm/mmzone_32.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Written by Pat Gaughen (gone@us.ibm.com) Mar 2002
- *
- */
-
-#ifndef _ASM_X86_MMZONE_32_H
-#define _ASM_X86_MMZONE_32_H
-
-#include <asm/smp.h>
-
-#ifdef CONFIG_NUMA
-extern struct pglist_data *node_data[];
-#define NODE_DATA(nid)	(node_data[nid])
-#endif /* CONFIG_NUMA */
-
-#endif /* _ASM_X86_MMZONE_32_H */
diff --git a/arch/x86/include/asm/mmzone_64.h b/arch/x86/include/asm/mmzone_64.h
deleted file mode 100644
index 0c585046f744..000000000000
--- a/arch/x86/include/asm/mmzone_64.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* K8 NUMA support */
-/* Copyright 2002,2003 by Andi Kleen, SuSE Labs */
-/* 2.5 Version loosely based on the NUMAQ Code by Pat Gaughen. */
-#ifndef _ASM_X86_MMZONE_64_H
-#define _ASM_X86_MMZONE_64_H
-
-#ifdef CONFIG_NUMA
-
-#include <linux/mmdebug.h>
-#include <asm/smp.h>
-
-extern struct pglist_data *node_data[];
-
-#define NODE_DATA(nid)		(node_data[nid])
-
-#endif
-#endif /* _ASM_X86_MMZONE_64_H */
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 6ce10e3c6228..7de725d6bb05 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -24,9 +24,6 @@
 int numa_off;
 nodemask_t numa_nodes_parsed __initdata;
 
-struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
-EXPORT_SYMBOL(node_data);
-
 static struct numa_meminfo numa_meminfo __initdata_or_meminfo;
 static struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
 
diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 555aee3ee8e7..ceac5b59bf2b 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -15,8 +15,6 @@
 
 #include <asm/sections.h>
 
-struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
-EXPORT_SYMBOL(node_data);
 nodemask_t numa_nodes_parsed __initdata;
 static int cpu_to_node_map[NR_CPUS] = { [0 ... NR_CPUS-1] = NUMA_NO_NODE };
 
diff --git a/include/asm-generic/mmzone.h b/include/asm-generic/mmzone.h
new file mode 100644
index 000000000000..2ab5193e8394
--- /dev/null
+++ b/include/asm-generic/mmzone.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_MMZONE_H
+#define _ASM_GENERIC_MMZONE_H
+
+#endif
diff --git a/include/linux/numa.h b/include/linux/numa.h
index eb19503604fe..e5841d4057ab 100644
--- a/include/linux/numa.h
+++ b/include/linux/numa.h
@@ -30,6 +30,9 @@ static inline bool numa_valid_node(int nid)
 #ifdef CONFIG_NUMA
 #include <asm/sparsemem.h>
 
+extern struct pglist_data *node_data[];
+#define NODE_DATA(nid)	(node_data[nid])
+
 /* Generic implementation available */
 int numa_nearest_node(int node, unsigned int state);
 
diff --git a/mm/numa.c b/mm/numa.c
index 67ca6b8585c0..8c157d41c026 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -3,6 +3,9 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 
+struct pglist_data *node_data[MAX_NUMNODES];
+EXPORT_SYMBOL(node_data);
+
 /* Stub functions: */
 
 #ifndef memory_add_physaddr_to_nid
-- 
2.43.0


