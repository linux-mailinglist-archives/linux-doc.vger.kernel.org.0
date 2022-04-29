Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB10514AB0
	for <lists+linux-doc@lfdr.de>; Fri, 29 Apr 2022 15:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376322AbiD2NlY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Apr 2022 09:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344093AbiD2NlR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 09:41:17 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92152CB033
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:37:49 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id j8-20020a17090a060800b001cd4fb60dccso7299559pjj.2
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VvydQG5zjUSumdtIipaqFpls71i8yJoag+sGGmgO3rc=;
        b=7NbcGgSkwHrJY1tx3toqeV+Xk5yX2uYskO+z5MFj6UbbTYBe0q1WO97WvSjnChdIC7
         i1KaBtCoZvUzFuHqvg/yX7Sermx9dZh9Iowvqovf+yqAqOU9nR2rvNz8vX4p8YMW9Pr/
         lcrLnleXLlHf98P6UtW9P6LVIs3t/qYmRfgfSYvLdrou9KwvgQiL7q66BHZj/JDMNoUC
         D900OhH7LCn0E2x6kfYvQ9+i0goWdK5HbTs5N9gnfI5iJNzW/g4nC1cnBFMZbnmGJu/U
         3ZC4/cu0R2dvf0oaLfZZa5zTEhGLX+Dy1LhFT0O/TkQEjvp4dUTJFE4jWAq0xK4ZGERA
         XgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VvydQG5zjUSumdtIipaqFpls71i8yJoag+sGGmgO3rc=;
        b=BzsZpZDwWXXaR8K4TxGB7LUCyX/HI/Dx//Zs3AXyXUIypWNKkHVZN4+I6P/IpUqXPD
         TCVIgE7yN/ERWhSgpujzhWQeMjyDtoABwNveO7gezxoTMHN7jSpzcq/dYW7kw7CKPaQN
         PHi4OLOTFYXYhPcrdlbOitWzwT8SU0p2a60etcpsQajeKyGMle6CJ3sXnAHdY7y5Bzju
         NZJN/9xesOLp0120hkr5KQi3mS4HhjUQhcLtmQVsVrBf++zFTK0Hpz5XAefkHW9w6Ydf
         mYrB9PzU1cKdFKLyuHrNvn25VN+F1kp3DDKhiGuyzD8SofdPUO71KvJX6yh1Oo7DkXN+
         nrMw==
X-Gm-Message-State: AOAM53267TPdYpJODzuIPi+qxciy9/9KNivqnO4DepWi4aNjJUN72uHL
        PKn5tAnmPGMMG3bngtHb/khHjw==
X-Google-Smtp-Source: ABdhPJzNnW/PfivTTKMAdGz8oCU9UxMQX9vEZMqhPr9ijXGFPd76Q1h9afEdGPE6Q5AkyqAGhbs2Cw==
X-Received: by 2002:a17:90a:784b:b0:1db:dfe6:5d54 with SMTP id y11-20020a17090a784b00b001dbdfe65d54mr3938283pjl.112.1651239468914;
        Fri, 29 Apr 2022 06:37:48 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a414800b001d81a30c437sm10681977pjg.50.2022.04.29.06.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 06:37:48 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com, tj@kernel.org, dennis@kernel.org,
        ming.lei@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [RFC PATCH 16/18] pte_ref: add track_pte_{set, clear}() helper
Date:   Fri, 29 Apr 2022 21:35:50 +0800
Message-Id: <20220429133552.33768-17-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
References: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The track_pte_set() is used to track the setting of the PTE page table
entry, and the percpu_ref of the PTE page table page will be incremented
when the entry changes from pte_none() to !pte_none().

The track_pte_clear() is used to track the clearing of the PTE page
table entry, and the percpu_ref of the PTE page table page will be
decremented when the entry changes from !pte_none() to pte_none().

In this way, the usage of the PTE page table page can be tracked by
its percpu_ref.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/pte_ref.h | 14 ++++++++++++++
 mm/pte_ref.c            | 30 ++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/linux/pte_ref.h b/include/linux/pte_ref.h
index 379c3b45a6ab..6ab740e1b989 100644
--- a/include/linux/pte_ref.h
+++ b/include/linux/pte_ref.h
@@ -18,6 +18,10 @@ void __pte_put(pgtable_t page);
 void pte_put(pte_t *ptep);
 void try_to_free_user_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
 			  bool switch_back);
+void track_pte_set(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		   pte_t pte);
+void track_pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		     pte_t pte);
 
 #else /* !CONFIG_FREE_USER_PTE */
 
@@ -54,6 +58,16 @@ static inline void try_to_free_user_pte(struct mm_struct *mm, pmd_t *pmd,
 {
 }
 
+static inline void track_pte_set(struct mm_struct *mm, unsigned long addr,
+				 pte_t *ptep, pte_t pte)
+{
+}
+
+static inline void track_pte_clear(struct mm_struct *mm, unsigned long addr,
+				   pte_t *ptep, pte_t pte)
+{
+}
+
 #endif /* CONFIG_FREE_USER_PTE */
 
 #endif /* _LINUX_PTE_REF_H */
diff --git a/mm/pte_ref.c b/mm/pte_ref.c
index bf9629272c71..e92510deda0b 100644
--- a/mm/pte_ref.c
+++ b/mm/pte_ref.c
@@ -197,4 +197,34 @@ void try_to_free_user_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
 	}
 }
 
+void track_pte_set(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		   pte_t pte)
+{
+	pgtable_t page;
+
+	if (&init_mm == mm || pte_huge(pte))
+		return;
+
+	page = pte_to_page(ptep);
+	BUG_ON(percpu_ref_is_zero(page->pte_ref));
+	if (pte_none(*ptep) && !pte_none(pte))
+		percpu_ref_get(page->pte_ref);
+}
+EXPORT_SYMBOL(track_pte_set);
+
+void track_pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		     pte_t pte)
+{
+	pgtable_t page;
+
+	if (&init_mm == mm || pte_huge(pte))
+		return;
+
+	page = pte_to_page(ptep);
+	BUG_ON(percpu_ref_is_zero(page->pte_ref));
+	if (!pte_none(pte))
+		percpu_ref_put(page->pte_ref);
+}
+EXPORT_SYMBOL(track_pte_clear);
+
 #endif /* CONFIG_FREE_USER_PTE */
-- 
2.20.1

