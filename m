Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A445741C799
	for <lists+linux-doc@lfdr.de>; Wed, 29 Sep 2021 16:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344885AbhI2PA1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Sep 2021 11:00:27 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60470
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344884AbhI2PA0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Sep 2021 11:00:26 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DC9DD402F6
        for <linux-doc@vger.kernel.org>; Wed, 29 Sep 2021 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632927524;
        bh=RA0oQ/GNq6rz6phpPIFpMyTQ81TXHbN7QIZjBCAB7To=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=JY12piwZ/3UKEfgZtLJVxTXeNfFgxEuADeCOFfrqNbCqQqUx2Pz5oeQmk9NvbUCCp
         TtrwnDQhPnbIs5yE3ceKWAMEBW7qmGz7E4wt0pCUFA0tqElirjTF9pcdYCc3Jy/AwK
         j/Up4GEtC2Tz5+cHJgU0OGS9NjPfL1mk5CkIbpRRair0EdGRh6UbyXJbZ/kCGHjUVE
         NHmW+RMMZjUkoP1NeHPQYQfiUBfO86aAsfg+oSv6XW7jx0XFuFdRMqFkP/odWW89qC
         eOugnU0BbzP6suD3xx4ZxJh5kByOCITC/MRxXmRa2EJbokakPHT2JpPfTljYiyVqd2
         w3kuNxTEvNgjg==
Received: by mail-wm1-f71.google.com with SMTP id z137-20020a1c7e8f000000b0030cd1800d86so1349436wmc.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Sep 2021 07:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RA0oQ/GNq6rz6phpPIFpMyTQ81TXHbN7QIZjBCAB7To=;
        b=XTfMman2zBG2C7W1tiGV3lJ5qSfi5tMzOoejks8xlvUs10uEdNQhuUb0u1mLI3QeFl
         7mOODpB4W4rOY8/4feUc1rEZ5MgASujXGcktFJlRCXqZ6SJABgllWA6m2s20BYlH49if
         hD37DzrsMO1UoD4JLxbNE5ruoaqVvVCUptaBTaoQJxqISYWxRfViNUxKWYmiCkvrjrLM
         dsveeCqUzZ7XF7v+pghYSOhwSYEQzlkvZvB0Cnyn9b8oyQNJBrtEENntlAGcDqCemLRJ
         JDJnaNQZfCXdGGnwrOWbp198R5VwgsHNfBWCK6VCZF87H8I+ojPlePPVoDixqlH24LKw
         3eoQ==
X-Gm-Message-State: AOAM5318CEvchyFTPmCyhD1zt6iECWJYmBDI4TBMZycq5dLq4EW+130A
        Y9jYn8dezvaiQX0XFEVxAgNV+PnUMv6iq+dGSvLiws+dATSCV8ctp3G+DQpcrirFNN/VU3xwfpE
        Ttn28/sWDtPdK4YrnL2qc6Y+CEjmjqc9wP212lg==
X-Received: by 2002:a5d:4601:: with SMTP id t1mr337456wrq.298.1632927523937;
        Wed, 29 Sep 2021 07:58:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+Xul4YkTp0i2000EdwnyM/dfQJdSoDvVKFV41EJ96ssAvHUBnlQjrNR56d8PaVsoSbDyBOQ==
X-Received: by 2002:a5d:4601:: with SMTP id t1mr337419wrq.298.1632927523734;
        Wed, 29 Sep 2021 07:58:43 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id c7sm142194wmq.13.2021.09.29.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:58:43 -0700 (PDT)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
        Atish Patra <Atish.Patra@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        Mayuresh Chitale <mchitale@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 07/10] riscv: Improve virtual kernel memory layout dump
Date:   Wed, 29 Sep 2021 16:51:10 +0200
Message-Id: <20210929145113.1935778-8-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With the arrival of sv48 and its large address space, it would be
cumbersome to statically define the unit size to use to print the different
portions of the virtual memory layout: instead, determine it dynamically.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/init.c  | 65 +++++++++++++++++++++++++++++++++----------
 include/linux/sizes.h |  1 +
 2 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d7de414c6500..a304f2b3c178 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -90,34 +90,71 @@ static void __init zone_sizes_init(void)
 }
 
 #if defined(CONFIG_MMU) && defined(CONFIG_DEBUG_VM)
+
+#define LOG2_SZ_1K  ilog2(SZ_1K)
+#define LOG2_SZ_1M  ilog2(SZ_1M)
+#define LOG2_SZ_1G  ilog2(SZ_1G)
+#define LOG2_SZ_1T  ilog2(SZ_1T)
+
 static inline void print_mlk(char *name, unsigned long b, unsigned long t)
 {
 	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld kB)\n", name, b, t,
-		  (((t) - (b)) >> 10));
+		  (((t) - (b)) >> LOG2_SZ_1K));
 }
 
 static inline void print_mlm(char *name, unsigned long b, unsigned long t)
 {
 	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld MB)\n", name, b, t,
-		  (((t) - (b)) >> 20));
+		  (((t) - (b)) >> LOG2_SZ_1M));
+}
+
+static inline void print_mlg(char *name, unsigned long b, unsigned long t)
+{
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld GB)\n", name, b, t,
+		  (((t) - (b)) >> LOG2_SZ_1G));
+}
+
+#ifdef CONFIG_64BIT
+static inline void print_mlt(char *name, unsigned long b, unsigned long t)
+{
+	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld TB)\n", name, b, t,
+		  (((t) - (b)) >> LOG2_SZ_1T));
+}
+#endif
+
+static inline void print_ml(char *name, unsigned long b, unsigned long t)
+{
+	unsigned long diff = t - b;
+
+#ifdef CONFIG_64BIT
+	if ((diff >> LOG2_SZ_1T) >= 10)
+		print_mlt(name, b, t);
+	else
+#endif
+	if ((diff >> LOG2_SZ_1G) >= 10)
+		print_mlg(name, b, t);
+	else if ((diff >> LOG2_SZ_1M) >= 10)
+		print_mlm(name, b, t);
+	else
+		print_mlk(name, b, t);
 }
 
 static void __init print_vm_layout(void)
 {
 	pr_notice("Virtual kernel memory layout:\n");
-	print_mlk("fixmap", (unsigned long)FIXADDR_START,
-		  (unsigned long)FIXADDR_TOP);
-	print_mlm("pci io", (unsigned long)PCI_IO_START,
-		  (unsigned long)PCI_IO_END);
-	print_mlm("vmemmap", (unsigned long)VMEMMAP_START,
-		  (unsigned long)VMEMMAP_END);
-	print_mlm("vmalloc", (unsigned long)VMALLOC_START,
-		  (unsigned long)VMALLOC_END);
-	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
-		  (unsigned long)high_memory);
+	print_ml("fixmap", (unsigned long)FIXADDR_START,
+		 (unsigned long)FIXADDR_TOP);
+	print_ml("pci io", (unsigned long)PCI_IO_START,
+		 (unsigned long)PCI_IO_END);
+	print_ml("vmemmap", (unsigned long)VMEMMAP_START,
+		 (unsigned long)VMEMMAP_END);
+	print_ml("vmalloc", (unsigned long)VMALLOC_START,
+		 (unsigned long)VMALLOC_END);
+	print_ml("lowmem", (unsigned long)PAGE_OFFSET,
+		 (unsigned long)high_memory);
 #ifdef CONFIG_64BIT
-	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
-		  (unsigned long)ADDRESS_SPACE_END);
+	print_ml("kernel", (unsigned long)KERNEL_LINK_ADDR,
+		 (unsigned long)ADDRESS_SPACE_END);
 #endif
 }
 #else
diff --git a/include/linux/sizes.h b/include/linux/sizes.h
index 1ac79bcee2bb..0bc6cf394b08 100644
--- a/include/linux/sizes.h
+++ b/include/linux/sizes.h
@@ -47,6 +47,7 @@
 #define SZ_8G				_AC(0x200000000, ULL)
 #define SZ_16G				_AC(0x400000000, ULL)
 #define SZ_32G				_AC(0x800000000, ULL)
+#define SZ_1T				_AC(0x10000000000, ULL)
 #define SZ_64T				_AC(0x400000000000, ULL)
 
 #endif /* __LINUX_SIZES_H__ */
-- 
2.30.2

