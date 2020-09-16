Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630FB26B7D1
	for <lists+linux-doc@lfdr.de>; Wed, 16 Sep 2020 02:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbgIPA3l (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Sep 2020 20:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgIONrx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:47:53 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2C8C06121F
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:21:14 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id w64so2828067qkc.14
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=odW0Nb/rci20hhf4qlLrsuqbfMVKw2n0jytc4nSfGLw=;
        b=Ic5gm/5J7H57rrbgi2KUAbxYzDNz8YdSq5ZJ/v6u4Ac5dg8OrDRQ+Pt7M915w+yRSh
         pxiTvbk/H4XBY/WQD2Uq5EFNOh0nrFP9uzxLfzmg1rs+AopLvLhBPW/q3vEjThD99dL7
         qrRJWuK823kI8mBCIvwjC68mmtOOJyAHLlvbSIybZDYGzy/xv8V3w6yjOsEBlCJM4KgJ
         vQRXFSOO1Zp2pI+L8K+dIx9YRoQbWq1vHeX5YUarWgO4WympBLwHXxV1p92l2ErDcbiS
         VWfBhw/z56liN0kg89Wfm6uq9cuGDYo3z5FUkd0Z3Noo9NtkiI8ggEYuytsJEvEGmROu
         3PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=odW0Nb/rci20hhf4qlLrsuqbfMVKw2n0jytc4nSfGLw=;
        b=a+wUNwcnA+ih0tTPWeET4jKEdNfpZnTlGwO5NdAdiqQa4A78iyhkvy92m2VkvTKh0X
         CKWP2RrnaNWUi6d8WF/84cusQ+sRgjKtvNvPaWf1lDWWOsDaFL08ytIxlTqm/8u+AngY
         aTweMAe4SqAlaKVAINAiWb02W53BNkRmfDvnWrm5aOeoO/naeAh9vk6TlX+zMa7SwHPk
         RMLw8nhD1sKNgNn1PBHn9qsNMVnxQMPabmzsfMVhjQXywrtq3vhSHsBdS+DWe04qOtWR
         XaS0pSknzgzo0KgVaL5yPBafGKufNIKXSTbA4CauBLbZ7G7WMmhQNaW5vFiZQ9gKZoyu
         hcRQ==
X-Gm-Message-State: AOAM532WLw72CyTPBodznnchMTX9aB2qs/BxDh2iwJr6sv91cHNvmNRX
        ADCVOMYls84CuDod8q4DZBsJOvziTQ==
X-Google-Smtp-Source: ABdhPJwGw5MfQEtCAAY9VjPztZBNrmyYKXs2SVdQU3S5qk954oiAUcTvB0kWyGpJ9tJe35EZN6Q4i0DPPg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a0c:b902:: with SMTP id u2mr17508718qvf.7.1600176063190;
 Tue, 15 Sep 2020 06:21:03 -0700 (PDT)
Date:   Tue, 15 Sep 2020 15:20:38 +0200
In-Reply-To: <20200915132046.3332537-1-elver@google.com>
Message-Id: <20200915132046.3332537-3-elver@google.com>
Mime-Version: 1.0
References: <20200915132046.3332537-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [PATCH v2 02/10] x86, kfence: enable KFENCE for x86
From:   Marco Elver <elver@google.com>
To:     elver@google.com, akpm@linux-foundation.org, glider@google.com
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        catalin.marinas@arm.com, cl@linux.com, dave.hansen@linux.intel.com,
        rientjes@google.com, dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, mingo@redhat.com, jannh@google.com,
        Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, keescook@chromium.org,
        mark.rutland@arm.com, penberg@kernel.org, peterz@infradead.org,
        cai@lca.pw, tglx@linutronix.de, vbabka@suse.cz, will@kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alexander Potapenko <glider@google.com>

Add architecture specific implementation details for KFENCE and enable
KFENCE for the x86 architecture. In particular, this implements the
required interface in <asm/kfence.h> for setting up the pool and
providing helper functions for protecting and unprotecting pages.

For x86, we need to ensure that the pool uses 4K pages, which is done
using the set_memory_4k() helper function.

Co-developed-by: Marco Elver <elver@google.com>
Signed-off-by: Marco Elver <elver@google.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 arch/x86/Kconfig              |  2 ++
 arch/x86/include/asm/kfence.h | 60 +++++++++++++++++++++++++++++++++++
 arch/x86/mm/fault.c           |  4 +++
 3 files changed, 66 insertions(+)
 create mode 100644 arch/x86/include/asm/kfence.h

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7101ac64bb20..e22dc722698c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -144,6 +144,8 @@ config X86
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN			if X86_64
 	select HAVE_ARCH_KASAN_VMALLOC		if X86_64
+	select HAVE_ARCH_KFENCE
+	select HAVE_ARCH_KFENCE_STATIC_POOL
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS		if MMU
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if MMU && COMPAT
diff --git a/arch/x86/include/asm/kfence.h b/arch/x86/include/asm/kfence.h
new file mode 100644
index 000000000000..cf09e377faf9
--- /dev/null
+++ b/arch/x86/include/asm/kfence.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_X86_KFENCE_H
+#define _ASM_X86_KFENCE_H
+
+#include <linux/bug.h>
+#include <linux/kfence.h>
+
+#include <asm/pgalloc.h>
+#include <asm/pgtable.h>
+#include <asm/set_memory.h>
+#include <asm/tlbflush.h>
+
+/* The alignment should be at least a 4K page. */
+#define KFENCE_POOL_ALIGNMENT PAGE_SIZE
+
+/*
+ * The page fault handler entry function, up to which the stack trace is
+ * truncated in reports.
+ */
+#define KFENCE_SKIP_ARCH_FAULT_HANDLER "asm_exc_page_fault"
+
+/* Force 4K pages for __kfence_pool. */
+static inline bool arch_kfence_initialize_pool(void)
+{
+	unsigned long addr;
+
+	for (addr = (unsigned long)__kfence_pool; is_kfence_address((void *)addr);
+	     addr += PAGE_SIZE) {
+		unsigned int level;
+
+		if (!lookup_address(addr, &level))
+			return false;
+
+		if (level != PG_LEVEL_4K)
+			set_memory_4k(addr, 1);
+	}
+
+	return true;
+}
+
+/* Protect the given page and flush TLBs. */
+static inline bool kfence_protect_page(unsigned long addr, bool protect)
+{
+	unsigned int level;
+	pte_t *pte = lookup_address(addr, &level);
+
+	if (!pte || level != PG_LEVEL_4K)
+		return false;
+
+	if (protect)
+		set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
+	else
+		set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
+
+	flush_tlb_one_kernel(addr);
+	return true;
+}
+
+#endif /* _ASM_X86_KFENCE_H */
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 6e3e8a124903..423e15ad5eb6 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -9,6 +9,7 @@
 #include <linux/kdebug.h>		/* oops_begin/end, ...		*/
 #include <linux/extable.h>		/* search_exception_tables	*/
 #include <linux/memblock.h>		/* max_low_pfn			*/
+#include <linux/kfence.h>		/* kfence_handle_page_fault	*/
 #include <linux/kprobes.h>		/* NOKPROBE_SYMBOL, ...		*/
 #include <linux/mmiotrace.h>		/* kmmio_handler, ...		*/
 #include <linux/perf_event.h>		/* perf_sw_event		*/
@@ -701,6 +702,9 @@ no_context(struct pt_regs *regs, unsigned long error_code,
 	}
 #endif
 
+	if (kfence_handle_page_fault(address))
+		return;
+
 	/*
 	 * 32-bit:
 	 *
-- 
2.28.0.618.gf4bc123cb7-goog

