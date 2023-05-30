Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE38E716310
	for <lists+linux-doc@lfdr.de>; Tue, 30 May 2023 16:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbjE3OFf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 May 2023 10:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbjE3OFc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:32 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA39102
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Db19HrZuPZw4+5KBCaIs6xv1CNqiis+vz1vgIyiDv9Y=; b=NNbN4IwrkkbXaXTdMY8G7qTzaV
        u+KnUt6mA8epo4YWGZkuLv6nhEmi2KFc9yP+Qk14+VJn5afMoO3RKQjA8BBJ2WUiuDWcQixSboU/o
        P8Ud3/Gb1rOVr8s0eGnjRZV5c988VG9wPQh6FLmURwiWr6bJW6SBBPwhAhgOkLU1WBxIVTPpEdtIB
        yGOeq9G02fgZsRQJrwWeb8fXwwKL6ItSiuAiB1ep+JcwSqd9pQ6D6Q0uAVPaXI4zKWoXA91nOO9a6
        A2mDLsbvYSe2APLuigrrpUyKVC0pz85aIGCRiJqWgxevlGXJCLYkk2J9cLpPkDAVCENXENePSeyyQ
        ogG5ZLCQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47486 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zyZ-0002sA-0T; Tue, 30 May 2023 15:05:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zyY-00A5LM-D8; Tue, 30 May 2023 15:05:26 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 11/17] arm64: text replication: create per-node kernel
 page tables
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zyY-00A5LM-D8@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:26 +0100
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Allocate the level 0 page tables for the per-node kernel text
replication, but copy all level 0 table entries from the NUMA node 0
table. Therefore, for the time being, each node's level 0 page tables
will contain identical entries, and thus other nodes will continue
to use the node 0 kernel text.

Since the level 0 page tables can be updated at runtime to add entries
for vmalloc and module space, propagate these updates to the other
swapper page tables. The exception is if we see an update for the
level 0 entry which points to the kernel mapping.

We also need to setup a copy of the trampoline page tables as well, as
the assembly code relies on the two page tables being a fixed offset
apart.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/ktext.h | 12 ++++++++++
 arch/arm64/mm/ktext.c          | 42 +++++++++++++++++++++++++++++++++-
 arch/arm64/mm/mmu.c            |  5 ++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ktext.h b/arch/arm64/include/asm/ktext.h
index 289e11289c06..386f9812d3c1 100644
--- a/arch/arm64/include/asm/ktext.h
+++ b/arch/arm64/include/asm/ktext.h
@@ -7,11 +7,15 @@
 
 #include <linux/kprobes.h>
 
+#include <asm/pgtable-types.h>
+
 #ifdef CONFIG_REPLICATE_KTEXT
 
 void ktext_replication_init(void);
 void __kprobes ktext_replication_patch(u32 *tp,  __le32 insn);
 void ktext_replication_patch_alternative(__le32 *src, int nr_inst);
+void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
+void ktext_replication_init_tramp(void);
 
 #else
 
@@ -27,6 +31,14 @@ static inline void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
 {
 }
 
+static inline void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
+{
+}
+
+static inline void ktext_replication_init_tramp(void)
+{
+}
+
 #endif
 
 #endif
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index ac5754972a09..290012d2bd03 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -14,6 +14,7 @@
 #include <asm/cacheflush.h>
 #include <asm/ktext.h>
 #include <asm/memory.h>
+#include <asm/pgalloc.h>
 
 struct pgtables *pgtables[MAX_NUMNODES] = {
 	[0 ... MAX_NUMNODES - 1] = &pgtable_node0,
@@ -97,7 +98,7 @@ void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
 	}
 }
 
-/* Allocate memory for the replicated kernel texts. */
+/* Allocate page tables and memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
 	size_t size = _etext - _stext;
@@ -128,5 +129,44 @@ void __init ktext_replication_init(void)
 		memcpy(kernel_texts[nid], _stext, size);
 		caches_clean_inval_pou((u64)kernel_texts[nid],
 				       (u64)kernel_texts[nid] + size);
+
+		/* Allocate the pagetables for this node */
+		pgtables[nid] = memblock_alloc_node(sizeof(*pgtables[0]),
+						    PGD_SIZE, nid);
+
+		/* Copy initial swapper page directory */
+		memcpy(pgtables[nid]->swapper_pg_dir, swapper_pg_dir, PGD_SIZE);
+	}
+}
+
+void ktext_replication_set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
+{
+	unsigned long idx = pgdp - swapper_pg_dir;
+	int nid;
+
+	if (WARN_ON_ONCE(idx >= PTRS_PER_PGD) ||
+	    WARN_ON_ONCE(idx == pgd_index((phys_addr_t)KERNEL_START)))
+		return;
+
+	for_each_node(nid) {
+		if (pgtables[nid]->swapper_pg_dir == swapper_pg_dir)
+			continue;
+
+		WRITE_ONCE(pgtables[nid]->swapper_pg_dir[idx], pgd);
+	}
+}
+
+#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
+void __init ktext_replication_init_tramp(void)
+{
+	int nid;
+
+	for_each_node(nid) {
+		/* Nothing to do for node 0 */
+		if (pgtables[nid]->tramp_pg_dir == tramp_pg_dir)
+			continue;
+
+		memcpy(pgtables[nid]->tramp_pg_dir, tramp_pg_dir, PGD_SIZE);
 	}
 }
+#endif
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index baf74d0c43c9..12fc3b1116e6 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -31,6 +31,7 @@
 #include <asm/fixmap.h>
 #include <asm/kasan.h>
 #include <asm/kernel-pgtable.h>
+#include <asm/ktext.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
 #include <linux/sizes.h>
@@ -81,6 +82,7 @@ void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
 	pgd_t *fixmap_pgdp;
 
 	spin_lock(&swapper_pgdir_lock);
+	ktext_replication_set_swapper_pgd(pgdp, pgd);
 	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
 	WRITE_ONCE(*fixmap_pgdp, pgd);
 	/*
@@ -695,6 +697,9 @@ static int __init map_entry_trampoline(void)
 		__set_fixmap(FIX_ENTRY_TRAMP_TEXT1 - i,
 			     pa_start + i * PAGE_SIZE, PAGE_KERNEL_RO);
 
+	/* Copy trampoline page tables to other numa nodes */
+	ktext_replication_init_tramp();
+
 	return 0;
 }
 core_initcall(map_entry_trampoline);
-- 
2.30.2

