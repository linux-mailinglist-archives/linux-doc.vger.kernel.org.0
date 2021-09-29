Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E17141C773
	for <lists+linux-doc@lfdr.de>; Wed, 29 Sep 2021 16:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344795AbhI2O4X (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Sep 2021 10:56:23 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54140
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344798AbhI2O4U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Sep 2021 10:56:20 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6D811402BC
        for <linux-doc@vger.kernel.org>; Wed, 29 Sep 2021 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632927278;
        bh=KeLkiElzlzQvNNsdjcFFS61hMwkuiVlVaM0dpBDB2C8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=AA67gU2cxJXMMRaO8pbCndiNI7QUFQFjL0S63L4aKUJSdbJGDqDGhSQp6QS9y92yS
         dnGtXy+gfpE2uAhU4RrbM9qiHGTTEPw6c8aQusgiXWR+bL5SQjBzw4r/QPBqhLK6Az
         UBXfb+T8ZYUbMz8zjg6+a4uRuw3xU2VV7x5W5UQWAYQpPofvJxPOLY7QKesV/tmdxU
         5bvZnRoey63Rm7gmjDY+iwKbW0Gm6yEMDc26v/Eze4F0cfS/gK3P5y80IyLLCQUhaI
         FqUyPBLsLNEhTgIeB5V0VOo6UFWfwpTdfczoCpn2KXvBxwIWSQfQH1rojNAZtH5/QV
         PzzYCnAU8n79Q==
Received: by mail-wm1-f72.google.com with SMTP id l42-20020a05600c1d2a00b0030d02f09530so945641wms.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Sep 2021 07:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KeLkiElzlzQvNNsdjcFFS61hMwkuiVlVaM0dpBDB2C8=;
        b=sV4/Ec1L27mVNFjHDjG4IImHEdKFM24edWKX2fot6IvIg/ob6/HgL2a/VLq/f189Zt
         rAkq05beHVqkuRHXJP5f2S/xtO3jpJGOHZwGACOHXlaO8hZqkp+OXZraOF5C/Z4eWN/O
         MxTJqfQJfex1pjiEiiVO7VgO4nEbsUJ+Uztqf5dxCTs4nuekW12gjP5chAHxbF4+FXEb
         JEM+707fo9iuaHW4NEO3J1G7D7XG3pzGQWsnhFi9TJ6l7kn9mlHyRTGnenYGsCnK4m8R
         Gw2/qKKzA3lx6oR+TlRtHs1qbWkco7jBE/6Nz3GyCo6PC+TOsEEWwzX2btJRf/DGcWc/
         ALgA==
X-Gm-Message-State: AOAM532R7Nlu37/mZ4rgfI+NsEvl+GeHGUUgnlA2MPq+eDWZw0dn7dwz
        WAgdyuB70RLYoWI94aWOcyu3OWF65wOHAldzw3W+1wCFj+t/qWXKved6TnIU1Yq5tJM90N/qxm6
        DwwTSHve0WhPWS7QuXPGJBg5JmZ6dkwNrYh1Pqw==
X-Received: by 2002:a05:6000:186a:: with SMTP id d10mr293237wri.113.1632927277897;
        Wed, 29 Sep 2021 07:54:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznSOSKp7IsVxoGkS1FzlBdLKaSOLFFxwn3CJ2ynXMOJFl6ygDinvXG42wU0gmBr6aiM6e8Lg==
X-Received: by 2002:a05:6000:186a:: with SMTP id d10mr293200wri.113.1632927277749;
        Wed, 29 Sep 2021 07:54:37 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id e8sm127119wrr.42.2021.09.29.07.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:54:37 -0700 (PDT)
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
Subject: [PATCH v2 03/10] asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
Date:   Wed, 29 Sep 2021 16:51:06 +0200
Message-Id: <20210929145113.1935778-4-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the following commits, riscv will almost use the generic versions of
pud_alloc_one and pud_free but an additional check is required since those
functions are only relevant when using at least a 4-level page table, which
will be determined at runtime on riscv.

So move the content of those functions into other functions that riscv
can use without duplicating code.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 include/asm-generic/pgalloc.h | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 02932efad3ab..977bea16cf1b 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -147,6 +147,15 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
+static inline pud_t *__pud_alloc_one(struct mm_struct *mm, unsigned long addr)
+{
+	gfp_t gfp = GFP_PGTABLE_USER;
+
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (pud_t *)get_zeroed_page(gfp);
+}
+
 #ifndef __HAVE_ARCH_PUD_ALLOC_ONE
 /**
  * pud_alloc_one - allocate a page for PUD-level page table
@@ -159,20 +168,23 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
  */
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	gfp_t gfp = GFP_PGTABLE_USER;
-
-	if (mm == &init_mm)
-		gfp = GFP_PGTABLE_KERNEL;
-	return (pud_t *)get_zeroed_page(gfp);
+	return __pud_alloc_one(mm, addr);
 }
 #endif
 
-static inline void pud_free(struct mm_struct *mm, pud_t *pud)
+static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 {
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
 	free_page((unsigned long)pud);
 }
 
+#ifndef __HAVE_ARCH_PUD_FREE
+static inline void pud_free(struct mm_struct *mm, pud_t *pud)
+{
+	__pud_free(mm, pud);
+}
+#endif
+
 #endif /* CONFIG_PGTABLE_LEVELS > 3 */
 
 #ifndef __HAVE_ARCH_PGD_FREE
-- 
2.30.2

