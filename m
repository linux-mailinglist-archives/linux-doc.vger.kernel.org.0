Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57DEB716313
	for <lists+linux-doc@lfdr.de>; Tue, 30 May 2023 16:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjE3OF4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 May 2023 10:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbjE3OFy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:54 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E587AEC
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uWU3PWV3b+t6w/ma7OF0J+w5sjCRGf6skcM5pn98FwY=; b=aDKKQnRQ8+ZJpWlj2ZqsjqiADf
        /eqLsyw0VAjIrrvfsSfqNhXVtyzVkcgTmzKnTeV7htfhB3M3UiDOgsv7Bxil36tDWmBu7FptwGgzX
        mhGcHVX0U3xfZliQq+dDDSzLsN/9CX+pZG6bvGSblVf2p1oDY0RNnIvOpRazl3TzpUT2QW9rT+9JP
        7gIZaqybUSL56uMlaz7qLHIzGKRS5OYd19z1ErR28qiNTvI0KOfcnCSlUP3G31haGQmvUe0N72gFZ
        uR7UNp458aMem9GAL+6YrZkGvKbKlUvGHyHjM8LIkT0WBVgQNHPN1n0W50utfdgH/g2oU9lw1h/mi
        YI1aMYnQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48796 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zyo-0002sf-9c; Tue, 30 May 2023 15:05:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zyn-00A5Lo-Nm; Tue, 30 May 2023 15:05:41 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 14/17] arm64: text replication: setup page tables for
 copied kernel
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zyn-00A5Lo-Nm@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:41 +0100
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Setup page table entries in each non-boot NUMA node page table to
point at each node's own copy of the kernel text. This switches
each node to use its own unique copy of the kernel text.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/ktext.h |  1 +
 arch/arm64/mm/ktext.c          |  8 +++++
 arch/arm64/mm/mmu.c            | 53 ++++++++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/ktext.h b/arch/arm64/include/asm/ktext.h
index 386f9812d3c1..6ece59ca90a2 100644
--- a/arch/arm64/include/asm/ktext.h
+++ b/arch/arm64/include/asm/ktext.h
@@ -16,6 +16,7 @@ void __kprobes ktext_replication_patch(u32 *tp,  __le32 insn);
 void ktext_replication_patch_alternative(__le32 *src, int nr_inst);
 void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
 void ktext_replication_init_tramp(void);
+void create_kernel_nid_map(pgd_t *pgdp, void *ktext);
 
 #else
 
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 290012d2bd03..11eba88fdd49 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -136,6 +136,14 @@ void __init ktext_replication_init(void)
 
 		/* Copy initial swapper page directory */
 		memcpy(pgtables[nid]->swapper_pg_dir, swapper_pg_dir, PGD_SIZE);
+
+		/* Clear the kernel mapping */
+		memset(&pgtables[nid]->swapper_pg_dir[kidx], 0,
+		       sizeof(pgtables[nid]->swapper_pg_dir[kidx]));
+
+		/* Create kernel mapping pointing at our local copy */
+		create_kernel_nid_map(pgtables[nid]->swapper_pg_dir,
+				      kernel_texts[nid]);
 	}
 }
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 12fc3b1116e6..2ba5cdfa28ce 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -641,6 +641,16 @@ void mark_rodata_ro(void)
 	debug_checkwx();
 }
 
+static void __init create_kernel_mapping(pgd_t *pgdp, phys_addr_t pa_start,
+					 void *va_start, void *va_end,
+					 pgprot_t prot, int flags)
+{
+	size_t size = va_end - va_start;
+
+	__create_pgd_mapping(pgdp, pa_start, (unsigned long)va_start, size,
+			     prot, early_pgtable_alloc, flags);
+}
+
 static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
 				      pgprot_t prot, struct vm_struct *vma,
 				      int flags, unsigned long vm_flags)
@@ -651,8 +661,7 @@ static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
 	BUG_ON(!PAGE_ALIGNED(pa_start));
 	BUG_ON(!PAGE_ALIGNED(size));
 
-	__create_pgd_mapping(pgdp, pa_start, (unsigned long)va_start, size, prot,
-			     early_pgtable_alloc, flags);
+	create_kernel_mapping(pgdp, pa_start, va_start, va_end, prot, flags);
 
 	if (!(vm_flags & VM_NO_GUARD))
 		size += PAGE_SIZE;
@@ -721,14 +730,8 @@ static bool arm64_early_this_cpu_has_bti(void)
 						    ID_AA64PFR1_EL1_BT_SHIFT);
 }
 
-/*
- * Create fine-grained mappings for the kernel.
- */
-static void __init map_kernel(pgd_t *pgdp)
+static pgprot_t __init kernel_text_pgprot(void)
 {
-	static struct vm_struct vmlinux_text, vmlinux_rodata, vmlinux_inittext,
-				vmlinux_initdata, vmlinux_data;
-
 	/*
 	 * External debuggers may need to write directly to the text
 	 * mapping to install SW breakpoints. Allow this (only) when
@@ -744,6 +747,38 @@ static void __init map_kernel(pgd_t *pgdp)
 	if (arm64_early_this_cpu_has_bti())
 		text_prot = __pgprot_modify(text_prot, PTE_GP, PTE_GP);
 
+	return text_prot;
+}
+
+#ifdef CONFIG_REPLICATE_KTEXT
+void __init create_kernel_nid_map(pgd_t *pgdp, void *ktext)
+{
+	pgprot_t text_prot = kernel_text_pgprot();
+
+	create_kernel_mapping(pgdp, __pa(ktext), _stext, _etext, text_prot, 0);
+	create_kernel_mapping(pgdp, __pa_symbol(__start_rodata),
+			      __start_rodata, __inittext_begin,
+			      PAGE_KERNEL, NO_CONT_MAPPINGS);
+	create_kernel_mapping(pgdp, __pa_symbol(__inittext_begin),
+			      __inittext_begin, __inittext_end,
+			      text_prot, 0);
+	create_kernel_mapping(pgdp, __pa_symbol(__initdata_begin),
+			      __initdata_begin, __initdata_end,
+			      PAGE_KERNEL, 0);
+	create_kernel_mapping(pgdp, __pa_symbol(_data), _data, _end,
+			      PAGE_KERNEL, 0);
+}
+#endif
+
+/*
+ * Create fine-grained mappings for the kernel.
+ */
+static void __init map_kernel(pgd_t *pgdp)
+{
+	static struct vm_struct vmlinux_text, vmlinux_rodata, vmlinux_inittext,
+				vmlinux_initdata, vmlinux_data;
+	pgprot_t text_prot = kernel_text_pgprot();
+
 	/*
 	 * Only rodata will be remapped with different permissions later on,
 	 * all other segments are allowed to use contiguous mappings.
-- 
2.30.2

