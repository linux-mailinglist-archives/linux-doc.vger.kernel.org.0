Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29EC0765E25
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jul 2023 23:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjG0V1C (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jul 2023 17:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbjG0V04 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 17:26:56 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0C01BE4
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 14:26:55 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-687087d8ddaso480398b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 14:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690493215; x=1691098015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxIryN+/nGnN7q5/mJrC1dQ+rinWckKL0IS2jYwlkeI=;
        b=HH7TEI0FKqELKzYIXsjAzNMOv7EmEk19k49xsmg5JJ2iJpQjJBUsJBektepS7kbqjA
         Vt/YOabaV+5seRyrTS+nQFfXRu/Rmc0qF/Cmuzi6vbvzfQQ7hYiZSyJOGxFRzI1tA3px
         fkP0ufFuAla153rOmkqGNp0bHyeGAvpUM3evTA9mfbdGVkW+96ufuS/f54M74SC3GCRo
         WqzWIVc8ARWe8/mWjw/9xYezMnJhgSJlmpSTw5U4/6ICvlMwjc3VVGpkITduwPQnE0vT
         zFsh4Tq4pcASeCN6YVhHilpdFEEvWGuxwZ4SH0AQAfZfQIb9FQNxijHErK3RcGa3TLoV
         6PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690493215; x=1691098015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxIryN+/nGnN7q5/mJrC1dQ+rinWckKL0IS2jYwlkeI=;
        b=DM5v43L3gg7ZYPRudPWeNxJfmCN1nGrrFNCcRvQwREY7IJE1WjU0Cng1C5E1G+9LHG
         PHZffbsrgxEklMT/9vtLSY4YmgP8mHV4iIntVIpOTYZpH4h1kLHom0eEEOWr6Nn4Cr/G
         U3INOJ+gx/uHcHhUVwPuArRlxEcrfLyjlZallnH9/QY18njvi/lMEWdaEX3wmhtLGOil
         /Ek3Yp6hwueVg8KBIiUMYj/sSXX19VcEOLnpnpOsTQ90Kk74txMHjGfN+eUqVCTD40mG
         z+dqiVvntmKPU6XBNvlkKLQQXYUQXo++VKEvdFeCjmXH81Qzz1D0miu9R5PhqNWv7On3
         6wgQ==
X-Gm-Message-State: ABy/qLbPtAYbtcFdo0WCpYcJw/65xwQH/eLM0UkSvwRHe+YqOWIPBGZs
        YKraDraB/mQzB+sAr6eKvLy3tQ==
X-Google-Smtp-Source: APBJJlH69UlfwIWPYbCOxQtQ76ua+pdw1/ixsjQRFRBQgUh0yQ7pLCSXX0UzINbZgQLjLL4GlXZWZw==
X-Received: by 2002:a05:6a00:2316:b0:668:82fe:16f1 with SMTP id h22-20020a056a00231600b0066882fe16f1mr369674pfh.1.1690493215262;
        Thu, 27 Jul 2023 14:26:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c5-20020aa78c05000000b00682562b1549sm1912312pfd.24.2023.07.27.14.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 14:26:54 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     charlie@rivosinc.com, conor@kernel.org, paul.walmsley@sifive.com,
        palmer@rivosinc.com, aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
        alexghiti@rivosinc.com
Subject: [PATCH v8 3/4] RISC-V: mm: Update pgtable comment documentation
Date:   Thu, 27 Jul 2023 14:26:28 -0700
Message-ID: <20230727212647.4182407-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212647.4182407-1-charlie@rivosinc.com>
References: <20230727212647.4182407-1-charlie@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

sv57 is supported in the kernel so pgtable.h should reflect that.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index c76a1ef094a4..b551467a1dd8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -848,14 +848,16 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
  * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
  * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
  * Task size is:
- * -     0x9fc00000 (~2.5GB) for RV32.
- * -   0x4000000000 ( 256GB) for RV64 using SV39 mmu
- * - 0x800000000000 ( 128TB) for RV64 using SV48 mmu
+ * -        0x9fc00000	(~2.5GB) for RV32.
+ * -      0x4000000000	( 256GB) for RV64 using SV39 mmu
+ * -    0x800000000000	( 128TB) for RV64 using SV48 mmu
+ * - 0x100000000000000	(  64PB) for RV64 using SV57 mmu
  *
  * Note that PGDIR_SIZE must evenly divide TASK_SIZE since "RISC-V
  * Instruction Set Manual Volume II: Privileged Architecture" states that
  * "load and store effective addresses, which are 64bits, must have bits
  * 63–48 all equal to bit 47, or else a page-fault exception will occur."
+ * Similarly for SV57, bits 63–57 must be equal to bit 56.
  */
 #ifdef CONFIG_64BIT
 #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
-- 
2.41.0

