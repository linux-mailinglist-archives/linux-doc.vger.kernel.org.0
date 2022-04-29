Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37414514AA2
	for <lists+linux-doc@lfdr.de>; Fri, 29 Apr 2022 15:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359844AbiD2Nkq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Apr 2022 09:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359812AbiD2Nkd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 09:40:33 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8D0CB006
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:37:15 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 7so2669553pga.12
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ti47oOTvJFCNXT5uBN/QcWBt/mztyaSPv2YCzaUIEks=;
        b=3g9d4G3AVSSQh+94A2C6QzQqKt1PRF8js91ZL0nJcPA3Z2pqrsS736awrXrhB5qPNL
         sUEJ1N/4NDvBYvnmd6ICC5/nmqG4YbNK2tVYSwte7tSPMcq+itTorKQlC5NV96S78vve
         49KHlqBtvfS6ikyeLIE98STuW16ozIxTWc4DS49i0ZPiYyllxwnGRYZcxC6V30CKju9o
         CL9fjfO7XWQ7Yvc9MmOIn0mD/1tlgEEmvZfM2zZieTtyLlokUilgkaABmZykB1TcatHq
         pjHEGHSkjNa+P+/dvoKyd/UP7gMxeI4LAtJltzdrP0xKNx+P2UQhK6u7RqFWZSdZOLE4
         X8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ti47oOTvJFCNXT5uBN/QcWBt/mztyaSPv2YCzaUIEks=;
        b=RcwNnZ+rdur4AmtZaMsE90xKb/66T8fMPySzHEnsOrrezQJV910N9dZ+FokRyV0WTg
         OyQjfedgaRSiM6U8z294Yb1+gx6YymJzbGzOnkL5PHM3gaVPDRne7uu0+NebblDmyPdd
         zsmCPW78NQnZgnzvOkd4Kz+8zRaRhysijf7iKyDy9OHaOgg+4T/OHNHdhSq46l34wPpM
         2tDskQgKjbalxIy71WZIrYFWDgbjFweMFGPgkUkN9epj0pAjQktCV0CT8B9WK3AIKiJ7
         n9UdTcrBXHpFKs0EWHgFopdKIkABOSXv/ifqCjxJwb9C1Fokcuus2GjziYLZj96/s1hD
         DTrQ==
X-Gm-Message-State: AOAM533dBuJGm7hht3dJLENyABODEcL8eAOBLdmrzcHq0BNatkB1J5y/
        3RD1FREb1jeQsrOnakD0zIS/rw==
X-Google-Smtp-Source: ABdhPJxMIKA/P0RDHv9STrZjiOvbOSFfoH4N5N3pT1umtFqilIbIuxsCtayDjWtKg053GReSSR2iXA==
X-Received: by 2002:a65:4006:0:b0:3aa:1cb6:e2f8 with SMTP id f6-20020a654006000000b003aa1cb6e2f8mr32435549pgp.274.1651239435027;
        Fri, 29 Apr 2022 06:37:15 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a414800b001d81a30c437sm10681977pjg.50.2022.04.29.06.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 06:37:14 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com, tj@kernel.org, dennis@kernel.org,
        ming.lei@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [RFC PATCH 10/18] mm: add pte_tryget_map{_lock}() helper
Date:   Fri, 29 Apr 2022 21:35:44 +0800
Message-Id: <20220429133552.33768-11-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
References: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now, we usually use pte_offset_map{_lock}() to get the pte_t pointer
before accessing the PTE page table page. After adding the
FREE_USER_PTE, we also need to call the pte_tryget() before calling
pte_offset_map{_lock}(), which is used to try to get the reference
count of the PTE to prevent the PTE page table page from being freed
during the access process.

This patch adds pte_tryget_map{_lock}() to help us to do that. A
return value of NULL indicates that we failed to get the percpu_ref,
and there is a concurrent thread that is releasing this PTE (or has
already been released). It needs to be treated as the case of pte_none().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/pgtable.h | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index d1218cb1013e..6f205fee6348 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -228,6 +228,8 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
 	return ptl;
 }
 
+#include <linux/pte_ref.h>
+
 #ifndef pte_offset_kernel
 static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 {
@@ -240,12 +242,38 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 #define pte_offset_map(dir, address)				\
 	((pte_t *)kmap_atomic(pmd_page(*(dir))) +		\
 	 pte_index((address)))
-#define pte_unmap(pte) kunmap_atomic((pte))
+#define __pte_unmap(pte) kunmap_atomic((pte))
 #else
 #define pte_offset_map(dir, address)	pte_offset_kernel((dir), (address))
-#define pte_unmap(pte) ((void)(pte))	/* NOP */
+#define __pte_unmap(pte) ((void)(pte))	/* NOP */
 #endif
 
+#define pte_tryget_map(mm, pmd, address)		\
+({							\
+	pte_t *__pte = NULL;				\
+	if (pte_tryget(mm, pmd, address))		\
+		__pte = pte_offset_map(pmd, address);	\
+	__pte;						\
+})
+
+#define pte_unmap(pte)	do {				\
+	pte_put(pte);					\
+	__pte_unmap(pte);				\
+} while (0)
+
+#define pte_tryget_map_lock(mm, pmd, address, ptlp)	\
+({							\
+	spinlock_t *__ptl = NULL;			\
+	pte_t *__pte = NULL;				\
+	if (pte_tryget(mm, pmd, address)) {		\
+		__ptl = pte_lockptr(mm, pmd);		\
+		__pte = pte_offset_map(pmd, address);	\
+		*(ptlp) = __ptl;			\
+		spin_lock(__ptl);			\
+	}						\
+	__pte;						\
+})
+
 #define pte_offset_map_lock(mm, pmd, address, ptlp)	\
 ({							\
 	spinlock_t *__ptl = pte_lockptr(mm, pmd);	\
@@ -260,6 +288,11 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 	pte_unmap(pte);					\
 } while (0)
 
+#define __pte_unmap_unlock(pte, ptl)	do {		\
+	spin_unlock(ptl);				\
+	__pte_unmap(pte);				\
+} while (0)
+
 /* Find an entry in the second-level page table.. */
 #ifndef pmd_offset
 static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
-- 
2.20.1

