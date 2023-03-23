Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B83D06C6DC9
	for <lists+linux-doc@lfdr.de>; Thu, 23 Mar 2023 17:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232354AbjCWQgt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Mar 2023 12:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjCWQg3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 12:36:29 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD6D367C5
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 09:35:00 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r29so21252888wra.13
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679589299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4qXDule2Q2bm4m/tvaeO5IXD5ibTcdOO6060VBTFFk=;
        b=ojVXZraQtG6MVGn6DcrcvVU6Ki7ve4ragp2UjfMM79R7W5wSlp/cAUQA41VhPYanKa
         FLqLrWJWLsV6UnGDgy1nHEd92Ez9nFil9kLUNnFV7Lh2lmz5UwkLrRd85v7901SrWBvT
         6U684vP4ESzL4e0OW2iwdEM9u0E+MC9Z5WOw/RWMw+C4kuzy7UmRsHfsDZK+yBx10lxG
         sCgqGtjcwZbxNFwFU3Y0eeyh0CMvgblKtrvbir8T5HvOEOviyvuM5+4WTDug8yJzX2q7
         kwnVxG4SUomz5YsK76JUZDHqyVjJqDLG1/vfeldQh3NKqDzLy35OWNeLTQ6VYRj46FrX
         Zd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4qXDule2Q2bm4m/tvaeO5IXD5ibTcdOO6060VBTFFk=;
        b=bThOvDQDMw7rsOZOGchEbMnSy7T0M8pkncC3A5FHKZxEmLoO0m3zRSHei9seibOFnZ
         6p9yosMm3rB5VRZHCjaQUJ+y8eHfKJIX8wmCloLGXYBWD92KbWCCk+Pwn5j8FLJO7qJ2
         hAT93hYGK3XaS472uJAakVJw/ukOUcd5hnP1AR/wPoUpYOcemIqxnRlVK3DCRHF+DoeA
         sohggBGPW8j2RtbYvPBOupeaaXB+1Q/X1jhymhKvNIkH+DciOCKGmRf7S/yBY+G4uik2
         3eWBfYhxDDMDjGjZQECi31sCIZQ2PFpO5puNd+LUmkdyERTkzSq/D+bt42aY2ARuUHn5
         ziYw==
X-Gm-Message-State: AAQBX9d6dpm7xjxlgZMQBfBTL7AlkXSlygwto5paX+8wyNZNx/6VPBFu
        C7Re4yZU+zcKUa1uTJeU01e/dQ==
X-Google-Smtp-Source: AKy350aZeDXuopq3BMX5NmMCdXbkTWhL7byBF6Byyz7/sbbbPuoIeYi49K2YGsOrYrJNtF6npMd+qQ==
X-Received: by 2002:a5d:6643:0:b0:2cf:e29f:d7f5 with SMTP id f3-20020a5d6643000000b002cfe29fd7f5mr2937437wrw.25.1679589298832;
        Thu, 23 Mar 2023 09:34:58 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x4-20020a1c7c04000000b003ee0d191539sm2342889wmc.10.2023.03.23.09.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:34:58 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley <Conor.Dooley@microchip.com>
Subject: [PATCH -fixes 1/2] riscv: Move early dtb mapping into the fixmap region
Date:   Thu, 23 Mar 2023 17:33:46 +0100
Message-Id: <20230323163347.182895-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230323163347.182895-1-alexghiti@rivosinc.com>
References: <20230323163347.182895-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

riscv establishes 2 virtual mappings:

- early_pg_dir maps the kernel which allows to discover the system
  memory
- swapper_pg_dir installs the final mapping (linear mapping included)

We used to map the dtb in early_pg_dir using DTB_EARLY_BASE_VA, and this
mapping was not carried over in swapper_pg_dir. It happens that
early_init_fdt_scan_reserved_mem must be called before swapper_pg_dir is
setup otherwise we could allocate reserved memory defined in the dtb.
And this function initializes reserved_mem variable with addresses that
lie in the early_pg_dir dtb mapping: when those addresses are reused
with swapper_pg_dir, this mapping does not exist and then we trap.

So move the dtb mapping in the fixmap region which is established in
early_pg_dir and handed over to swapper_pg_dir.

Fixes: 50e63dd8ed92 ("riscv: fix reserved memory setup")
Reported-by: Conor Dooley <Conor.Dooley@microchip.com>
Link: https://lore.kernel.org/all/f8e67f82-103d-156c-deb0-d6d6e2756f5e@microchip.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/riscv/vm-layout.rst |  6 +--
 arch/riscv/include/asm/fixmap.h   |  8 ++++
 arch/riscv/include/asm/pgtable.h  |  8 +++-
 arch/riscv/kernel/setup.c         |  1 -
 arch/riscv/mm/init.c              | 61 +++++++++++++++++--------------
 5 files changed, 51 insertions(+), 33 deletions(-)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 3be44e74ec5d..5462c84f4723 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -47,7 +47,7 @@ RISC-V Linux Kernel SV39
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffffffc6fee00000 | -228    GB | ffffffc6feffffff |    2 MB | fixmap
+   ffffffc6fea00000 | -228    GB | ffffffc6feffffff |    6 MB | fixmap
    ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
    ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
    ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
@@ -83,7 +83,7 @@ RISC-V Linux Kernel SV48
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffff8d7ffee00000 |  -114.5 TB | ffff8d7ffeffffff |    2 MB | fixmap
+   ffff8d7ffea00000 |  -114.5 TB | ffff8d7ffeffffff |    6 MB | fixmap
    ffff8d7fff000000 |  -114.5 TB | ffff8d7fffffffff |   16 MB | PCI io
    ffff8d8000000000 |  -114.5 TB | ffff8f7fffffffff |    2 TB | vmemmap
    ffff8f8000000000 |  -112.5 TB | ffffaf7fffffffff |   32 TB | vmalloc/ioremap space
@@ -119,7 +119,7 @@ RISC-V Linux Kernel SV57
                                                               | Kernel-space virtual memory, shared between all processes:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ff1bfffffee00000 | -57     PB | ff1bfffffeffffff |    2 MB | fixmap
+   ff1bfffffea00000 | -57     PB | ff1bfffffeffffff |    6 MB | fixmap
    ff1bffffff000000 | -57     PB | ff1bffffffffffff |   16 MB | PCI io
    ff1c000000000000 | -57     PB | ff1fffffffffffff |    1 PB | vmemmap
    ff20000000000000 | -56     PB | ff5fffffffffffff |   16 PB | vmalloc/ioremap space
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 5c3e7b97fcc6..0a55099bb734 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -22,6 +22,14 @@
  */
 enum fixed_addresses {
 	FIX_HOLE,
+	/*
+	 * The fdt fixmap mapping must be PMD aligned and will be mapped
+	 * using PMD entries in fixmap_pmd in 64-bit and a PGD entry in 32-bit.
+	 */
+	FIX_FDT_END,
+	FIX_FDT = FIX_FDT_END + FIX_FDT_SIZE / PAGE_SIZE - 1,
+
+	/* Below fixmaps will be mapped using fixmap_pte */
 	FIX_PTE,
 	FIX_PMD,
 	FIX_PUD,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ab05f892d317..f641837ccf31 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -87,9 +87,13 @@
 
 #define FIXADDR_TOP      PCI_IO_START
 #ifdef CONFIG_64BIT
-#define FIXADDR_SIZE     PMD_SIZE
+#define MAX_FDT_SIZE	 PMD_SIZE
+#define FIX_FDT_SIZE	 (MAX_FDT_SIZE + SZ_2M)
+#define FIXADDR_SIZE     (PMD_SIZE + FIX_FDT_SIZE)
 #else
-#define FIXADDR_SIZE     PGDIR_SIZE
+#define MAX_FDT_SIZE	 PGDIR_SIZE
+#define FIX_FDT_SIZE	 MAX_FDT_SIZE
+#define FIXADDR_SIZE     (PGDIR_SIZE + FIX_FDT_SIZE)
 #endif
 #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 376d2827e736..542eed85ad2c 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -283,7 +283,6 @@ void __init setup_arch(char **cmdline_p)
 	else
 		pr_err("No DTB found in kernel mappings\n");
 #endif
-	early_init_fdt_scan_reserved_mem();
 	misc_mem_init();
 
 	init_resources();
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 478d6763a01a..fb78d6bbabae 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -57,7 +57,6 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 EXPORT_SYMBOL(empty_zero_page);
 
 extern char _start[];
-#define DTB_EARLY_BASE_VA      PGDIR_SIZE
 void *_dtb_early_va __initdata;
 uintptr_t _dtb_early_pa __initdata;
 
@@ -236,6 +235,14 @@ static void __init setup_bootmem(void)
 	set_max_mapnr(max_low_pfn - ARCH_PFN_OFFSET);
 
 	reserve_initrd_mem();
+
+	/*
+	 * No allocation should be done before reserving the memory as defined
+	 * in the device tree, otherwise the allocation could end up in a
+	 * reserved region.
+	 */
+	early_init_fdt_scan_reserved_mem();
+
 	/*
 	 * If DTB is built in, no need to reserve its memblock.
 	 * Otherwise, do reserve it but avoid using
@@ -279,9 +286,6 @@ pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 
 pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
-static p4d_t __maybe_unused early_dtb_p4d[PTRS_PER_P4D] __initdata __aligned(PAGE_SIZE);
-static pud_t __maybe_unused early_dtb_pud[PTRS_PER_PUD] __initdata __aligned(PAGE_SIZE);
-static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
 #ifdef CONFIG_XIP_KERNEL
 #define pt_ops			(*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
@@ -626,9 +630,6 @@ static void __init create_p4d_mapping(p4d_t *p4dp,
 #define trampoline_pgd_next	(pgtable_l5_enabled ?			\
 		(uintptr_t)trampoline_p4d : (pgtable_l4_enabled ?	\
 		(uintptr_t)trampoline_pud : (uintptr_t)trampoline_pmd))
-#define early_dtb_pgd_next	(pgtable_l5_enabled ?			\
-		(uintptr_t)early_dtb_p4d : (pgtable_l4_enabled ?	\
-		(uintptr_t)early_dtb_pud : (uintptr_t)early_dtb_pmd))
 #else
 #define pgd_next_t		pte_t
 #define alloc_pgd_next(__va)	pt_ops.alloc_pte(__va)
@@ -636,7 +637,6 @@ static void __init create_p4d_mapping(p4d_t *p4dp,
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
 	create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
 #define fixmap_pgd_next		((uintptr_t)fixmap_pte)
-#define early_dtb_pgd_next	((uintptr_t)early_dtb_pmd)
 #define create_p4d_mapping(__pmdp, __va, __pa, __sz, __prot) do {} while(0)
 #define create_pud_mapping(__pmdp, __va, __pa, __sz, __prot) do {} while(0)
 #define create_pmd_mapping(__pmdp, __va, __pa, __sz, __prot) do {} while(0)
@@ -860,32 +860,28 @@ static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
  * this means 2 PMD entries whereas for 32-bit kernel, this is only 1 PGDIR
  * entry.
  */
-static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
+static void __init create_fdt_early_page_table(pgd_t *pgdir,
+					       uintptr_t fix_fdt_va,
+					       uintptr_t dtb_pa)
 {
-#ifndef CONFIG_BUILTIN_DTB
 	uintptr_t pa = dtb_pa & ~(PMD_SIZE - 1);
 
-	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
-			   IS_ENABLED(CONFIG_64BIT) ? early_dtb_pgd_next : pa,
-			   PGDIR_SIZE,
-			   IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
-
-	if (pgtable_l5_enabled)
-		create_p4d_mapping(early_dtb_p4d, DTB_EARLY_BASE_VA,
-				   (uintptr_t)early_dtb_pud, P4D_SIZE, PAGE_TABLE);
-
-	if (pgtable_l4_enabled)
-		create_pud_mapping(early_dtb_pud, DTB_EARLY_BASE_VA,
-				   (uintptr_t)early_dtb_pmd, PUD_SIZE, PAGE_TABLE);
+#ifndef CONFIG_BUILTIN_DTB
+	/* Make sure the fdt fixmap address is always aligned on PMD size */
+	BUILD_BUG_ON(FIX_FDT % (PMD_SIZE / PAGE_SIZE));
 
-	if (IS_ENABLED(CONFIG_64BIT)) {
-		create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
+	/* In 32-bit only, the fdt lies in its own PGD */
+	if (!IS_ENABLED(CONFIG_64BIT)) {
+		create_pgd_mapping(early_pg_dir, fix_fdt_va,
+				   pa, MAX_FDT_SIZE, PAGE_KERNEL);
+	} else {
+		create_pmd_mapping(fixmap_pmd, fix_fdt_va,
 				   pa, PMD_SIZE, PAGE_KERNEL);
-		create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
+		create_pmd_mapping(fixmap_pmd, fix_fdt_va + PMD_SIZE,
 				   pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
 	}
 
-	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
+	dtb_early_va = (void *)fix_fdt_va + (dtb_pa & (PMD_SIZE - 1));
 #else
 	/*
 	 * For 64-bit kernel, __va can't be used since it would return a linear
@@ -1055,7 +1051,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	create_kernel_page_table(early_pg_dir, true);
 
 	/* Setup early mapping for FDT early scan */
-	create_fdt_early_page_table(early_pg_dir, dtb_pa);
+	create_fdt_early_page_table(early_pg_dir,
+				    __fix_to_virt(FIX_FDT), dtb_pa);
 
 	/*
 	 * Bootime fixmap only can handle PMD_SIZE mapping. Thus, boot-ioremap
@@ -1097,6 +1094,16 @@ static void __init setup_vm_final(void)
 	u64 i;
 
 	/* Setup swapper PGD for fixmap */
+#if !defined(CONFIG_64BIT)
+	/*
+	 * In 32-bit, the device tree lies in a pgd entry, so it must be copied
+	 * directly in swapper_pg_dir in addition to the pgd entry that points
+	 * to fixmap_pte.
+	 */
+	unsigned long idx = pgd_index(__fix_to_virt(FIX_FDT));
+
+	set_pgd(&swapper_pg_dir[idx], early_pg_dir[idx]);
+#endif
 	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
 			   __pa_symbol(fixmap_pgd_next),
 			   PGDIR_SIZE, PAGE_TABLE);
-- 
2.37.2

