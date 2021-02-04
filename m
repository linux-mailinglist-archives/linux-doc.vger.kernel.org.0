Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBFC30EB49
	for <lists+linux-doc@lfdr.de>; Thu,  4 Feb 2021 04:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhBDD5B (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 Feb 2021 22:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbhBDD4N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Feb 2021 22:56:13 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4630DC061793
        for <linux-doc@vger.kernel.org>; Wed,  3 Feb 2021 19:55:32 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id g3so1050052plp.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Feb 2021 19:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zwPSy3xaz2ygLc8F0EEvzUcUfzPRqv7+jHlrmdqCzjc=;
        b=v5kc7WwUbJ4SxZoErP44Ut/YnimhGLmSGr8Q0pMvjK5MyOeqBjchjsm0dHwo9qTxiL
         L6o92hOcgljhXYgPK7t24RMk26k8jSQAl6t0nHe4iuHxFQhkqed+9AGjRwOSYiBtkWta
         lWJgGumyexzq2I5hO4O8GVm9ptnIJfHGx37Vb9jlOKvWqgy8ZUQlug/dNU2UVlfX72v8
         iNPfFEKzU4oPA4XIv/ckuMhQVgjqgzksq5w4MhnAGMpW8l8TvHOTfSVIQIVZD2d2nAvD
         MnL3T49dN822vH1juzrinW1+AMA0T5yeOrtJ8cjhYfM9Nwn9BDHlhwhToPundS0A0pGD
         V5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zwPSy3xaz2ygLc8F0EEvzUcUfzPRqv7+jHlrmdqCzjc=;
        b=aDoECk3h/tUWMzCDYKOc2EOoa1lM6JTU/i9SxodSwg4i1dRxFAPX78960UNWcji0cx
         rU633oEklfPkr+kVdyQ/0tE2rsp4/xcBTYMVaBybrO/a68LlYEDQWyD8bPw1WBYcPVRo
         qTCs65lbTxJnXGRbi/n6P1MFdgLPyrAuJarPbSVzv3EZ/C00Ofob0Ppy9FXdcLUYW6nJ
         lCm7iNOf/0a4/cf8i8DDdMzvcNz2GIivBloI7PiiDUY69A3o18GGutpve0Sb+9FoWXHV
         fQ0mKsdZPzwh9NQ/SP3tFR6pwuTa2OKQU1+5hiE2egv04y/hRLwFuze2acvqMUyJRCLT
         hnZA==
X-Gm-Message-State: AOAM531cqxJnOt3Yx9FT2SDE1Oll2lv3BQYGRE3EdC0Di0mB6cS97Et0
        GSoqRkQTyfSQWtUZ0ScZkWptsQ==
X-Google-Smtp-Source: ABdhPJy4MLo6bnYUrOasPbRmFl1je+GxUk4n9GPPf9oQIxXGXHU1yRbe2z30qs735BvQJrsnJluAFQ==
X-Received: by 2002:a17:90b:4004:: with SMTP id ie4mr6140969pjb.114.1612410931841;
        Wed, 03 Feb 2021 19:55:31 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id 9sm3747466pfy.110.2021.02.03.19.55.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 19:55:31 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, naoya.horiguchi@nec.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v14 8/8] mm: hugetlb: optimize the code with the help of the compiler
Date:   Thu,  4 Feb 2021 11:50:43 +0800
Message-Id: <20210204035043.36609-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210204035043.36609-1-songmuchun@bytedance.com>
References: <20210204035043.36609-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We cannot optimize if a "struct page" crosses page boundaries. If
it is true, we can optimize the code with the help of a compiler.
When free_vmemmap_pages_per_hpage() returns zero, most functions are
optimized by the compiler.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/hugetlb.h |  3 ++-
 mm/hugetlb_vmemmap.c    | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 822ab2f5542a..7bfb06e16298 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -878,7 +878,8 @@ extern bool hugetlb_free_vmemmap_enabled;
 
 static inline bool is_hugetlb_free_vmemmap_enabled(void)
 {
-	return hugetlb_free_vmemmap_enabled;
+	return hugetlb_free_vmemmap_enabled &&
+	       is_power_of_2(sizeof(struct page));
 }
 #else
 static inline bool is_hugetlb_free_vmemmap_enabled(void)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 8efad9978821..068d0e0cebc8 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -211,6 +211,12 @@ early_param("hugetlb_free_vmemmap", early_hugetlb_free_vmemmap_param);
  */
 static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
 {
+	/*
+	 * This check aims to let the compiler help us optimize the code as
+	 * much as possible.
+	 */
+	if (!is_power_of_2(sizeof(struct page)))
+		return 0;
 	return h->nr_free_vmemmap_pages;
 }
 
@@ -280,6 +286,13 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	BUILD_BUG_ON(NR_USED_SUBPAGE >=
 		     RESERVE_VMEMMAP_SIZE / sizeof(struct page));
 
+	/*
+	 * The compiler can help us to optimize this function to null
+	 * when the size of the struct page is not power of 2.
+	 */
+	if (!is_power_of_2(sizeof(struct page)))
+		return;
+
 	if (!hugetlb_free_vmemmap_enabled)
 		return;
 
-- 
2.11.0

