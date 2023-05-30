Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D815716306
	for <lists+linux-doc@lfdr.de>; Tue, 30 May 2023 16:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbjE3OFO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 May 2023 10:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbjE3OFC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:02 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646C1EA
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tKmg1wvbWm3Sut3X0el13kLY6MXHU/o3mbUv4cgLoEE=; b=Sgcy602VpQu91gcslBmraZ86HK
        6BOF7iIqExdi/Wawa7+JOiWK8dU5qxa2TR7QlXS37GD/XhpI3mr1ZmGD3ZwlcfDBG/lpTAails8dw
        hf3ofAk4zHH10zCyNNyXqN9EQfPEbjUYdtMeUZv+xEyVr4ZUfdR/uWmwGuW+LTHod/D4hCz/2sKcs
        XNRUx8mUvh8uxwkYLQh3uhnsM9Ug05Yd3KiZEMQF9aaHOE5frfGUbt09y05HnNzVCVpkfpb1//Gzc
        T9rsrC+qML/DNV6Cg2Y1z101LXYXLWziUTzWqUqzj+XP0xzWreXWFwX0+hGyhOA3c0duaEOb/p7F7
        tyOQnnVA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59738 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zy4-0002qS-B6; Tue, 30 May 2023 15:04:56 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zy3-00A5KM-JA; Tue, 30 May 2023 15:04:55 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 05/17] arm64: text replication: add init function
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zy3-00A5KM-JA@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:04:55 +0100
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A simple patch that adds an empty function for kernel text replication
initialisation and hooks it into the initialisation path.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/ktext.h | 20 ++++++++++++++++++++
 arch/arm64/mm/Makefile         |  2 ++
 arch/arm64/mm/init.c           |  3 +++
 arch/arm64/mm/ktext.c          |  8 ++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/include/asm/ktext.h
 create mode 100644 arch/arm64/mm/ktext.c

diff --git a/arch/arm64/include/asm/ktext.h b/arch/arm64/include/asm/ktext.h
new file mode 100644
index 000000000000..1a5f7452a3bf
--- /dev/null
+++ b/arch/arm64/include/asm/ktext.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022, Oracle and/or its affiliates.
+ */
+#ifndef ASM_KTEXT_H
+#define ASM_KTEXT_H
+
+#ifdef CONFIG_REPLICATE_KTEXT
+
+void ktext_replication_init(void);
+
+#else
+
+static inline void ktext_replication_init(void)
+{
+}
+
+#endif
+
+#endif
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index dbd1bc95967d..41e705027c57 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -14,3 +14,5 @@ KASAN_SANITIZE_physaddr.o	+= n
 
 obj-$(CONFIG_KASAN)		+= kasan_init.o
 KASAN_SANITIZE_kasan_init.o	:= n
+
+obj-$(CONFIG_REPLICATE_KTEXT)	+= ktext.o
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 66e70ca47680..a0e4f2d93ee6 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -36,6 +36,7 @@
 #include <asm/fixmap.h>
 #include <asm/kasan.h>
 #include <asm/kernel-pgtable.h>
+#include <asm/ktext.h>
 #include <asm/kvm_host.h>
 #include <asm/memory.h>
 #include <asm/numa.h>
@@ -401,6 +402,8 @@ void __init bootmem_init(void)
 
 	arch_numa_init();
 
+	ktext_replication_init();
+
 	/*
 	 * must be done after arch_numa_init() which calls numa_init() to
 	 * initialize node_online_map that gets used in hugetlb_cma_reserve()
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
new file mode 100644
index 000000000000..3a8d37c9abc4
--- /dev/null
+++ b/arch/arm64/mm/ktext.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022, Oracle and/or its affiliates.
+ */
+
+void __init ktext_replication_init(void)
+{
+}
-- 
2.30.2

