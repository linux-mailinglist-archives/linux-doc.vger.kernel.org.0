Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CA14FF95A
	for <lists+linux-doc@lfdr.de>; Wed, 13 Apr 2022 16:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236289AbiDMOu7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Apr 2022 10:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236284AbiDMOu4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 10:50:56 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04292644DF
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 07:48:35 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id e8-20020a17090a118800b001cb13402ea2so2496236pja.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wzudrV45q6zi3Aa2lP4e9vSlvpqaHzUTvfK2vJ9QrmY=;
        b=fky8LNA9FUVJ/dBlEU0cJVH6m3R1P8rsWI+MS2++Z9uWhKn+oIQyjRsCMp61O9Z3S3
         RbXndwfzCIM0T27I3GA8fL20AZkHkHcyCT9NqNJC4aXG7PuG3CAGIfgqm6vdm6z7tFCM
         Xa4cpzcZ2PdChT3I1ao7B0WLGkKOCyPe0keKB0774uElyHAxPCWB2yQENchFF9P1yvP2
         ZEZAGFlKhEZX3mU3hCEIYp+cUYuY60AlIosuJcChM8QmDEzMeX4LsiYS8VZwLXSuM260
         gpOAo1WCAlZXeQRdYQvrXcHc1IShBPwR0PHte641H5ggBQ1S0MFi89xKOubw0oQaXFw7
         G7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wzudrV45q6zi3Aa2lP4e9vSlvpqaHzUTvfK2vJ9QrmY=;
        b=sMnBAGAq2/c1rjXYGQhvMLiScC9PlwfKCXDL7pAXZpuaZcGq8It7rLExmD3IaKi9mM
         w3o6ZNDMO6VJkJgIon3rlR5bv3ZWsbah7qqhlIt8IjF6Y6Cl6UjYTZxti8iLIrWzBjof
         OrRSyy88Sof3k9VIjGyhcX3wNisLzUtqFI48oJVMrcHoXgJxMo+F+8itFoEtvl76ZVDU
         r5C+lTvcDRPjaQ8a5N5KuRK9rqDzxc/hdLVieR2a24cYYpAI9iJBq30yrD8F/vZjmsHd
         Jnby95v9Tytg+e/aVMN5hbu8gQQ4Sn8obPNfO7BxlGyqYB/CMqGQjBmIyWysVNjUTk1w
         TG5g==
X-Gm-Message-State: AOAM532Pia759ydxnfwfcLifsnmwF1+rCpHJH52K3nAYcrU+edqWIv6J
        fHJBBXxwxqW0X5LQFm/o6OezUg==
X-Google-Smtp-Source: ABdhPJwzwm1n18p78CamL33qrvfFAMUpojtWkwa+L0pqwaKdhS70fN63EPpwCvouUW4+2Nlv0u9egg==
X-Received: by 2002:a17:90a:8591:b0:1b9:da10:2127 with SMTP id m17-20020a17090a859100b001b9da102127mr11290399pjn.13.1649861314495;
        Wed, 13 Apr 2022 07:48:34 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id p27-20020a056a000a1b00b004f3f63e3cf2sm47817257pfh.58.2022.04.13.07.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 07:48:34 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v8 1/4] mm: hugetlb_vmemmap: introduce CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
Date:   Wed, 13 Apr 2022 22:47:45 +0800
Message-Id: <20220413144748.84106-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220413144748.84106-1-songmuchun@bytedance.com>
References: <20220413144748.84106-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the size of "struct page" is not the power of two but with the feature
of minimizing overhead of struct page associated with each HugeTLB is
enabled, then the vmemmap pages of HugeTLB will be corrupted after
remapping (panic is about to happen in theory).  But this only exists when
!CONFIG_MEMCG && !CONFIG_SLUB on x86_64.  However, it is not a conventional
configuration nowadays.  So it is not a real word issue, just the result
of a code review.  But we have to prevent anyone from configuring that
combined configurations.  In order to avoid many checks like "is_power_of_2
(sizeof(struct page))" through mm/hugetlb_vmemmap.c.  Introduce a new macro
CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP to represent the size of struct
page is power of two and CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is
configured.  Then make the codes of this feature depends on this new macro.
Then we could prevent anyone do any unexpected configurations.  A new
autoconf_ext.h is introduced as well, which serves as an extension for
autoconf.h since those special configurations (e.g.
CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP here) are rely on the autoconf.h
(generated from Kconfig), so we cannot embed those configurations into
Kconfig.  After this change, it would be easy if someone want to do the
similar thing (add a new CONFIG) in the future.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
---
 Kbuild                     | 19 +++++++++++++++++++
 arch/x86/mm/init_64.c      |  2 +-
 include/linux/hugetlb.h    |  2 +-
 include/linux/kconfig.h    |  4 ++++
 include/linux/mm.h         |  2 +-
 include/linux/page-flags.h |  2 +-
 kernel/autoconf_ext.c      | 26 ++++++++++++++++++++++++++
 mm/hugetlb_vmemmap.c       |  8 ++------
 mm/hugetlb_vmemmap.h       |  4 ++--
 mm/sparse-vmemmap.c        |  4 ++--
 scripts/mod/Makefile       |  2 ++
 11 files changed, 61 insertions(+), 14 deletions(-)
 create mode 100644 kernel/autoconf_ext.c

diff --git a/Kbuild b/Kbuild
index fa441b98c9f6..83c0d5a418d1 100644
--- a/Kbuild
+++ b/Kbuild
@@ -2,6 +2,12 @@
 #
 # Kbuild for top-level directory of the kernel
 
+# autoconf_ext.h is generated last since it depends on other generated headers,
+# however those other generated headers may include autoconf_ext.h. Use the
+# following macro to avoid circular dependency.
+
+KBUILD_CFLAGS_KERNEL += -D__EXCLUDE_AUTOCONF_EXT_H
+
 #####
 # Generate bounds.h
 
@@ -37,6 +43,19 @@ $(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s FORCE
 	$(call filechk,offsets,__ASM_OFFSETS_H__)
 
 #####
+# Generate autoconf_ext.h.
+
+autoconf_ext-file := include/generated/autoconf_ext.h
+
+always-y += $(autoconf_ext-file)
+targets += kernel/autoconf_ext.s
+
+kernel/autoconf_ext.s: $(bounds-file) $(timeconst-file) $(offsets-file)
+
+$(autoconf_ext-file): kernel/autoconf_ext.s FORCE
+	$(call filechk,offsets,__LINUX_AUTOCONF_EXT_H__)
+
+#####
 # Check for missing system calls
 
 always-y += missing-syscalls
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 4b9e0012bbbf..9b8dfa6e4da8 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1268,7 +1268,7 @@ static struct kcore_list kcore_vsyscall;
 
 static void __init register_page_bootmem_info(void)
 {
-#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP)
+#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP)
 	int i;
 
 	for_each_online_node(i)
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index ac2ece9e9c79..d42de8abd2b6 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -623,7 +623,7 @@ struct hstate {
 	unsigned int nr_huge_pages_node[MAX_NUMNODES];
 	unsigned int free_huge_pages_node[MAX_NUMNODES];
 	unsigned int surplus_huge_pages_node[MAX_NUMNODES];
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
 	unsigned int optimize_vmemmap_pages;
 #endif
 #ifdef CONFIG_CGROUP_HUGETLB
diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
index 20d1079e92b4..00796794f177 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -4,6 +4,10 @@
 
 #include <generated/autoconf.h>
 
+#if defined(__KERNEL__) && !defined(__EXCLUDE_AUTOCONF_EXT_H)
+#include <generated/autoconf_ext.h>
+#endif
+
 #ifdef CONFIG_CPU_BIG_ENDIAN
 #define __BIG_ENDIAN 4321
 #else
diff --git a/include/linux/mm.h b/include/linux/mm.h
index e0ad13486035..4c36f77a5745 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3186,7 +3186,7 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
 }
 #endif
 
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
 int vmemmap_remap_free(unsigned long start, unsigned long end,
 		       unsigned long reuse);
 int vmemmap_remap_alloc(unsigned long start, unsigned long end,
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index b70124b9c7c1..e409b10cd677 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -199,7 +199,7 @@ enum pageflags {
 
 #ifndef __GENERATING_BOUNDS_H
 
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
 DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
 			 hugetlb_optimize_vmemmap_key);
 
diff --git a/kernel/autoconf_ext.c b/kernel/autoconf_ext.c
new file mode 100644
index 000000000000..8475735c6fc9
--- /dev/null
+++ b/kernel/autoconf_ext.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generate definitions needed by the preprocessor.
+ * This code generates raw asm output which is post-processed
+ * to extract and format the required data.
+ */
+#include <linux/mm_types.h>
+#include <linux/kbuild.h>
+#include <linux/log2.h>
+
+int main(void)
+{
+	if (IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) &&
+	    is_power_of_2(sizeof(struct page))) {
+		/*
+		 * The 2nd parameter of DEFINE() will go into the comments. Do
+		 * not pass 1 directly to it to make the generated macro more
+		 * clear for the readers.
+		 */
+		DEFINE(CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP,
+		       IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) &&
+		       is_power_of_2(sizeof(struct page)));
+	}
+
+	return 0;
+}
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 2655434a946b..be73782cc1cf 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -178,6 +178,7 @@
 
 #include "hugetlb_vmemmap.h"
 
+#ifdef CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
 /*
  * There are a lot of struct page structures associated with each HugeTLB page.
  * For tail pages, the value of compound_head is the same. So we can reuse first
@@ -194,12 +195,6 @@ EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
 
 static int __init hugetlb_vmemmap_early_param(char *buf)
 {
-	/* We cannot optimize if a "struct page" crosses page boundaries. */
-	if (!is_power_of_2(sizeof(struct page))) {
-		pr_warn("cannot free vmemmap pages because \"struct page\" crosses page boundaries\n");
-		return 0;
-	}
-
 	if (!buf)
 		return -EINVAL;
 
@@ -300,3 +295,4 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	pr_info("can optimize %d vmemmap pages for %s\n",
 		h->optimize_vmemmap_pages, h->name);
 }
+#endif /* CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP */
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 109b0a53b6fe..3afae3ff37fa 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -10,7 +10,7 @@
 #define _LINUX_HUGETLB_VMEMMAP_H
 #include <linux/hugetlb.h>
 
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
 int hugetlb_vmemmap_alloc(struct hstate *h, struct page *head);
 void hugetlb_vmemmap_free(struct hstate *h, struct page *head);
 void hugetlb_vmemmap_init(struct hstate *h);
@@ -41,5 +41,5 @@ static inline unsigned int hugetlb_optimize_vmemmap_pages(struct hstate *h)
 {
 	return 0;
 }
-#endif /* CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP */
+#endif /* CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP */
 #endif /* _LINUX_HUGETLB_VMEMMAP_H */
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 52f36527bab3..6c7f1a9ce2dd 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -34,7 +34,7 @@
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
-#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+#ifdef CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
 /**
  * struct vmemmap_remap_walk - walk vmemmap page table
  *
@@ -420,7 +420,7 @@ int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 
 	return 0;
 }
-#endif /* CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP */
+#endif /* CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP */
 
 /*
  * Allocate a block of memory to be used to back the virtual memory map
diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index c9e38ad937fd..f82ab128c086 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 OBJECT_FILES_NON_STANDARD := y
 CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
+# See comments in Kbuild
+KBUILD_CFLAGS_KERNEL += -D__EXCLUDE_AUTOCONF_EXT_H
 
 hostprogs-always-y	+= modpost mk_elfconfig
 always-y		+= empty.o
-- 
2.11.0

