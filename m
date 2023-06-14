Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BE671630F
	for <lists+linux-doc@lfdr.de>; Tue, 30 May 2023 16:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjE3OFe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 May 2023 10:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbjE3OF0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:26 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D00F107
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nBBrF3BbR5Lwl8Cc/QvChlKOe5ANaMj83t0gXJYwyIY=; b=oQ5cbCl+2ssMheOt0eV7lHvx6M
        dxxhnEXbZLp54vSQvkkdmNayzD2ZdDqYEi+j40AJGCzdcpK6k0HSV09c7BMAYsbZ1EbGC+gYpeyNa
        Zyt7am/soPWFwXgQLdnyFYrPOC5N2U+dJmIwKTv0MWyMkJfsVpHst1jgl+XuWSwe98fQ+Big+sIJy
        Ecf2sWV1+2w4/U+X0BZnqqHLaV7r3WqnT5EViQ74qgW1ord8v7UJQuW90GiNZ2tcfBa0+9/k+Djwm
        gufjuMo5Y4yxyT/ob+tuFBHAMCtLl+1dq2iQk+B2wera0WoVCGbZ0obIXxdEIMETFv1YOKZiVE91S
        YI5xLVQA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48812 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zyT-0002rc-TN; Tue, 30 May 2023 15:05:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zyT-00A5LC-9X; Tue, 30 May 2023 15:05:21 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 10/17] arm64: text replication: add swapper page directory
 helpers
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zyT-00A5LC-9X@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:21 +0100
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a series of helpers for the swapper page directories - a set which
return those for the calling CPU, and those which take the NUMA node
number.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/pgtable.h | 19 +++++++++++++++++++
 arch/arm64/kernel/hibernate.c    |  2 +-
 arch/arm64/mm/ktext.c            | 20 ++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 1e72067d1e9e..5cfff64e4944 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -627,6 +627,25 @@ extern struct pgtables pgtable_node0;
 
 #ifdef CONFIG_REPLICATE_KTEXT
 extern struct pgtables *pgtables[MAX_NUMNODES];
+
+pgd_t *swapper_pg_dir_node(void);
+phys_addr_t __swapper_pg_dir_node_phys(int nid);
+phys_addr_t swapper_pg_dir_node_phys(void);
+#else
+static inline pgd_t *swapper_pg_dir_node(void)
+{
+	return swapper_pg_dir;
+}
+
+static inline phys_addr_t __swapper_pg_dir_node_phys(int nid)
+{
+	return __pa_symbol(swapper_pg_dir);
+}
+
+static inline phys_addr_t swapper_pg_dir_node_phys(void)
+{
+	return __pa_symbol(swapper_pg_dir);
+}
 #endif
 
 extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 788597a6b6a2..2236119bf16d 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -114,7 +114,7 @@ int arch_hibernation_header_save(void *addr, unsigned int max_size)
 		return -EOVERFLOW;
 
 	arch_hdr_invariants(&hdr->invariants);
-	hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
+	hdr->ttbr1_el1		= swapper_pg_dir_node_phys();
 	hdr->reenter_kernel	= _cpu_resume;
 
 	/* We can't use __hyp_get_vectors() because kvm may still be loaded */
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 85fc97877d75..ac5754972a09 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -21,6 +21,26 @@ struct pgtables *pgtables[MAX_NUMNODES] = {
 
 static void *kernel_texts[MAX_NUMNODES];
 
+static pgd_t *__swapper_pg_dir_node(int nid)
+{
+	return pgtables[nid]->swapper_pg_dir;
+}
+
+pgd_t *swapper_pg_dir_node(void)
+{
+	return __swapper_pg_dir_node(numa_node_id());
+}
+
+phys_addr_t __swapper_pg_dir_node_phys(int nid)
+{
+	return __pa(__swapper_pg_dir_node(nid));
+}
+
+phys_addr_t swapper_pg_dir_node_phys(void)
+{
+	return __swapper_pg_dir_node_phys(numa_node_id());
+}
+
 void __kprobes ktext_replication_patch(u32 *tp, __le32 insn)
 {
 	unsigned long offset;
-- 
2.30.2

