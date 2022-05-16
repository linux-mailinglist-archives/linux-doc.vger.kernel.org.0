Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF595281E6
	for <lists+linux-doc@lfdr.de>; Mon, 16 May 2022 12:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242514AbiEPKXr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 May 2022 06:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242517AbiEPKXk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 06:23:40 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBF6DF0C
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:23:25 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d25so13599367pfo.10
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7JtnflfEJKqY3LT1d1QkIpZrqHmFAbtgKUqGlXFNu5E=;
        b=zRkfLhylUGkW87aY79564FT+hxq3E8o3xWGXVlFy5/+agN802xij4IQ2Jukpjml3jf
         ORGeN/u+DCHrINLpyO1K7vYpgkzZVHv/9TiCbQrCrWYBJchQkMGaD5Jxbv+1sDvPOgub
         HgJpIdm+FEqbItSW8SVZm4pinzoXxQrmnAr3mAiQcicfuGRE3b8XU60z/l0F6xw6x1Uh
         V1KWKntZlX/ldkdrHqYKR2UpfYWKHum3iOuKJT6xzzKSTel5YDB7QPb8VvKK8e+FLFQ7
         ctexPvxj0Bx3IUyNlRl12y9lYXgNrpmXYR7apL32qy2Sfp1iE8+cVeu4e+Smsn61v50t
         RwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7JtnflfEJKqY3LT1d1QkIpZrqHmFAbtgKUqGlXFNu5E=;
        b=uhlJOIedA7mP9ZLDK2LtMHewKcNltSEt4ag2FZO8R3k0Rts4CwACVU1ZriNCcx/8CO
         T9fd6pNDbd6MjAk44aSyzGp1ERYeyDvsEcTR2Pwx63i00jQhAMk9JPSNhAiSnpEnasgC
         A12SG78qRqaEQ87Xq1wgcFMfuIsjlnzn/yrYoBEjGK5KnRtFGh/OkLPvg4y+ogQaABpL
         he2lujwpm6Ah+yfmUW5eDRBe0cgRnSs9O6VNaHBSIb9H5qLpgWEYb3EfJ0/MS9pBkyx8
         OkOK3Z49vOj9AAkMoH7uuLexpWncnOdt9UXZDWQtft79hxJjrG46Je3DHNshe2aRhOKC
         NFpA==
X-Gm-Message-State: AOAM533X/v1gHJYOciEeB0MlzAf1oCKB7YVFphn39mBxa7qWrIxMBWvq
        bHzB3AsoQ99aULAILK5eU8aKBw==
X-Google-Smtp-Source: ABdhPJxVdKZZYlQsIfygts/ghRsAOYGQgWuAMSj1u7mQPP1e+E/GnmSwo7g+ZIlowU+ehRCdMmkPDg==
X-Received: by 2002:a05:6a00:2295:b0:510:635b:5eee with SMTP id f21-20020a056a00229500b00510635b5eeemr16796975pfe.20.1652696605396;
        Mon, 16 May 2022 03:23:25 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id i9-20020aa79089000000b0050dc76281e4sm6472731pfa.190.2022.05.16.03.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 03:23:25 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v12 4/7] mm: hotplug: introduce SECTION_CANNOT_OPTIMIZE_VMEMMAP
Date:   Mon, 16 May 2022 18:22:08 +0800
Message-Id: <20220516102211.41557-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220516102211.41557-1-songmuchun@bytedance.com>
References: <20220516102211.41557-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For now, the feature of hugetlb_free_vmemmap is not compatible with the
feature of memory_hotplug.memmap_on_memory, and hugetlb_free_vmemmap
takes precedence over memory_hotplug.memmap_on_memory. However, someone
wants to make memory_hotplug.memmap_on_memory takes precedence over
hugetlb_free_vmemmap since memmap_on_memory makes it more likely to
succeed memory hotplug in close-to-OOM situations.  So the decision
of making hugetlb_free_vmemmap take precedence is not wise and elegant.
The proper approach is to have hugetlb_vmemmap.c do the check whether
the section which the HugeTLB pages belong to can be optimized.  If
the section's vmemmap pages are allocated from the added memory block
itself, hugetlb_free_vmemmap should refuse to optimize the vmemmap,
otherwise, do the optimization.  Then both kernel parameters are
compatible.  So this patch introduces SECTION_CANNOT_OPTIMIZE_VMEMMAP
to indicate whether the section could be optimized.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 22 +++++++++++-----------
 include/linux/mmzone.h                          | 17 +++++++++++++++++
 mm/hugetlb_vmemmap.c                            | 16 +++++++++++++++-
 mm/memory_hotplug.c                             |  1 -
 mm/sparse.c                                     |  7 +++++++
 5 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 308da668bbb1..a0a014f2104c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1711,9 +1711,11 @@
 			Built with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y,
 			the default is on.
 
-			This is not compatible with memory_hotplug.memmap_on_memory.
-			If both parameters are enabled, hugetlb_free_vmemmap takes
-			precedence over memory_hotplug.memmap_on_memory.
+			Note that the vmemmap pages may be allocated from the added
+			memory block itself when memory_hotplug.memmap_on_memory is
+			enabled, those vmemmap pages cannot be optimized even if this
+			feature is enabled.  Other vmemmap pages not allocated from
+			the added memory block itself do not be affected.
 
 	hung_task_panic=
 			[KNL] Should the hung task detector generate panics.
@@ -3038,10 +3040,12 @@
 			[KNL,X86,ARM] Boolean flag to enable this feature.
 			Format: {on | off (default)}
 			When enabled, runtime hotplugged memory will
-			allocate its internal metadata (struct pages)
-			from the hotadded memory which will allow to
-			hotadd a lot of memory without requiring
-			additional memory to do so.
+			allocate its internal metadata (struct pages,
+			those vmemmap pages cannot be optimized even
+			if hugetlb_free_vmemmap is enabled) from the
+			hotadded memory which will allow to hotadd a
+			lot of memory without requiring additional
+			memory to do so.
 			This feature is disabled by default because it
 			has some implication on large (e.g. GB)
 			allocations in some configurations (e.g. small
@@ -3051,10 +3055,6 @@
 			Note that even when enabled, there are a few cases where
 			the feature is not effective.
 
-			This is not compatible with hugetlb_free_vmemmap. If
-			both parameters are enabled, hugetlb_free_vmemmap takes
-			precedence over memory_hotplug.memmap_on_memory.
-
 	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV] Enable memtest
 			Format: <integer>
 			default : 0 <disable>
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index af057e20b9d7..7b69acc5c2a9 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1430,6 +1430,7 @@ extern size_t mem_section_usage_size(void);
 	MAPPER(IS_ONLINE)							\
 	MAPPER(IS_EARLY)							\
 	MAPPER(TAINT_ZONE_DEVICE, CONFIG_ZONE_DEVICE)				\
+	MAPPER(CANNOT_OPTIMIZE_VMEMMAP, CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP)	\
 	MAPPER(MAP_LAST_BIT)
 
 #define __SECTION_SHIFT_FLAG_MAPPER_0(x)
@@ -1457,6 +1458,22 @@ static inline struct page *__section_mem_map_addr(struct mem_section *section)
 	return (struct page *)map;
 }
 
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+static inline void section_mark_cannot_optimize_vmemmap(struct mem_section *ms)
+{
+	ms->section_mem_map |= SECTION_CANNOT_OPTIMIZE_VMEMMAP;
+}
+
+static inline int section_cannot_optimize_vmemmap(struct mem_section *ms)
+{
+	return (ms && (ms->section_mem_map & SECTION_CANNOT_OPTIMIZE_VMEMMAP));
+}
+#else
+static inline void section_mark_cannot_optimize_vmemmap(struct mem_section *ms)
+{
+}
+#endif
+
 static inline int present_section(struct mem_section *section)
 {
 	return (section && (section->section_mem_map & SECTION_MARKED_PRESENT));
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index cc4ec752ec16..970c36b8935f 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -75,12 +75,26 @@ int hugetlb_vmemmap_alloc(struct hstate *h, struct page *head)
 	return ret;
 }
 
+static unsigned int optimizable_vmemmap_pages(struct hstate *h,
+					      struct page *head)
+{
+	unsigned long pfn = page_to_pfn(head);
+	unsigned long end = pfn + pages_per_huge_page(h);
+
+	for (; pfn < end; pfn += PAGES_PER_SECTION) {
+		if (section_cannot_optimize_vmemmap(__pfn_to_section(pfn)))
+			return 0;
+	}
+
+	return hugetlb_optimize_vmemmap_pages(h);
+}
+
 void hugetlb_vmemmap_free(struct hstate *h, struct page *head)
 {
 	unsigned long vmemmap_addr = (unsigned long)head;
 	unsigned long vmemmap_end, vmemmap_reuse, vmemmap_pages;
 
-	vmemmap_pages = hugetlb_optimize_vmemmap_pages(h);
+	vmemmap_pages = optimizable_vmemmap_pages(h, head);
 	if (!vmemmap_pages)
 		return;
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index aef3f041dec7..1d0225d57166 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1270,7 +1270,6 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       populate a single PMD.
 	 */
 	return memmap_on_memory &&
-	       !hugetlb_optimize_vmemmap_enabled() &&
 	       IS_ENABLED(CONFIG_MHP_MEMMAP_ON_MEMORY) &&
 	       size == memory_block_size_bytes() &&
 	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
diff --git a/mm/sparse.c b/mm/sparse.c
index d2d76d158b39..8197ef9b7c4c 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -913,6 +913,13 @@ int __meminit sparse_add_section(int nid, unsigned long start_pfn,
 	ms = __nr_to_section(section_nr);
 	set_section_nid(section_nr, nid);
 	__section_mark_present(ms, section_nr);
+	/*
+	 * Mark whole section as non-optimizable once there is a subsection
+	 * whose vmemmap pages are allocated from alternative allocator. The
+	 * early section is always optimizable.
+	 */
+	if (!early_section(ms) && altmap)
+		section_mark_cannot_optimize_vmemmap(ms);
 
 	/* Align memmap to section boundary in the subsection case */
 	if (section_nr_to_pfn(section_nr) != start_pfn)
-- 
2.11.0

