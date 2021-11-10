Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3E344BD22
	for <lists+linux-doc@lfdr.de>; Wed, 10 Nov 2021 09:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhKJIok (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Nov 2021 03:44:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbhKJIoj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 03:44:39 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F97C061764
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 00:41:52 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id y1so2375391plk.10
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 00:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zr0rEdADAEaJn1N2dbntb6SW/6iRFYHNNestGTjHAUw=;
        b=ubGR+OzFQ1TuYh0c6CA+SlJu3HO0Uah7CnGKzJCfJu6uWyLALl57f74EMNw9FiVeff
         CECiPlLygsN1QKh3rW+QCRe3UWyfzSQnk6/ek9aO+rJbhaurLSzt87t7wit714RzlXTe
         TVTZFUEn6AoWADenerWODZseHbsWy26B26IGj1PneiDRSmVfPNjHF4XlW7A2zZMQd9yQ
         c6K1Vyo0SOdS2IhZo1JcIlyaIQq15WH978qktCMNP4oaOM7sn+0fYLtLEJGFvUwWafnI
         O2wYFfuhal6E36gjjKFWMUzwu8VnPQgb7kccubvTpMpjEMUBOn4vA3eh07VpmOe0FGB1
         OZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zr0rEdADAEaJn1N2dbntb6SW/6iRFYHNNestGTjHAUw=;
        b=VjfxZUVpP1TsGzHdTxvrdSidhhdE+icUtMZHjWLn56yiUQKSXLvSQ/DAErdPSjqDtV
         ucIUG/34S5mp4TBZ7vocA60KtLIvTKmo4vquvazg+cUcdEkskg9SJKtr8Yc771mZbs7g
         ktNp7ug2SrR4fY/5H732pRsRnq2f8gcPeRZ9g+cLAAQRkWY348qXzF06/3mHCU+Cpx20
         IuAAOJN1JgnSg+C4weAo2MdBJsLAAzukptzzWidF9i7mOOUkKhu7mJq4V2wqvoeqYShE
         HDvRkIqejmQtaZl9QNfkg80iIRbCrsSMmngGI9AxKpO6+nX/fifNQFY9U5tY6BRe/DEW
         rB1w==
X-Gm-Message-State: AOAM533QWmgxbC94g1OAFSKDTD5j5La9bzZ1O67rYB35fmpFveoigppr
        tZpLTk7efV/Xs+MAyGjs40WXRw==
X-Google-Smtp-Source: ABdhPJzko2PpH9xf7ZWwbrHIa+6g5wVf4MnCYY4L1qk7EoSuHUGvbcCC2UzIffZfGim9pxrN9eZawA==
X-Received: by 2002:a17:90a:6a82:: with SMTP id u2mr15066090pjj.105.1636533712190;
        Wed, 10 Nov 2021 00:41:52 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id v38sm5485368pgl.38.2021.11.10.00.41.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 00:41:51 -0800 (PST)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 04/15] mm: rework the parameter of lock_page_or_retry()
Date:   Wed, 10 Nov 2021 16:40:46 +0800
Message-Id: <20211110084057.27676-5-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20211110084057.27676-1-zhengqi.arch@bytedance.com>
References: <20211110084057.27676-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We need the vmf in lock_page_or_retry() in the subsequent patch,
so pass in it directly.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/pagemap.h | 8 +++-----
 mm/filemap.c            | 6 ++++--
 mm/memory.c             | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 6a30916b76e5..94f9547b4411 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -709,8 +709,7 @@ static inline bool wake_page_match(struct wait_page_queue *wait_page,
 
 void __folio_lock(struct folio *folio);
 int __folio_lock_killable(struct folio *folio);
-bool __folio_lock_or_retry(struct folio *folio, struct mm_struct *mm,
-				unsigned int flags);
+bool __folio_lock_or_retry(struct folio *folio, struct vm_fault *vmf);
 void unlock_page(struct page *page);
 void folio_unlock(struct folio *folio);
 
@@ -772,14 +771,13 @@ static inline int lock_page_killable(struct page *page)
  * Return value and mmap_lock implications depend on flags; see
  * __folio_lock_or_retry().
  */
-static inline bool lock_page_or_retry(struct page *page, struct mm_struct *mm,
-				     unsigned int flags)
+static inline bool lock_page_or_retry(struct page *page, struct vm_fault *vmf)
 {
 	struct folio *folio;
 	might_sleep();
 
 	folio = page_folio(page);
-	return folio_trylock(folio) || __folio_lock_or_retry(folio, mm, flags);
+	return folio_trylock(folio) || __folio_lock_or_retry(folio, vmf);
 }
 
 /*
diff --git a/mm/filemap.c b/mm/filemap.c
index 07c654202870..ff8d19b7ce1d 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1695,9 +1695,11 @@ static int __folio_lock_async(struct folio *folio, struct wait_page_queue *wait)
  * If neither ALLOW_RETRY nor KILLABLE are set, will always return true
  * with the folio locked and the mmap_lock unperturbed.
  */
-bool __folio_lock_or_retry(struct folio *folio, struct mm_struct *mm,
-			 unsigned int flags)
+bool __folio_lock_or_retry(struct folio *folio, struct vm_fault *vmf)
 {
+	unsigned int flags = vmf->flags;
+	struct mm_struct *mm = vmf->vma->vm_mm;
+
 	if (fault_flag_allow_retry_first(flags)) {
 		/*
 		 * CAUTION! In this case, mmap_lock is not released
diff --git a/mm/memory.c b/mm/memory.c
index b00cd60fc368..bec6a5d5ee7c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3443,7 +3443,7 @@ static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct mmu_notifier_range range;
 
-	if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags))
+	if (!lock_page_or_retry(page, vmf))
 		return VM_FAULT_RETRY;
 	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
 				vma->vm_mm, vmf->address & PAGE_MASK,
@@ -3576,7 +3576,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		goto out_release;
 	}
 
-	locked = lock_page_or_retry(page, vma->vm_mm, vmf->flags);
+	locked = lock_page_or_retry(page, vmf);
 
 	delayacct_clear_flag(current, DELAYACCT_PF_SWAPIN);
 	if (!locked) {
-- 
2.11.0

