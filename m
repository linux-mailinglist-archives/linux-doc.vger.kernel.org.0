Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09230752E34
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jul 2023 02:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234497AbjGNAPG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Jul 2023 20:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbjGNAPE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jul 2023 20:15:04 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E222D63
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 17:15:00 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6686c74183cso1329806b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 17:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689293700; x=1689898500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WogNqZmM5qIDEUwvyRv9RC9FRo2r68Wx4DIsyw3FtoM=;
        b=scmvmusinfT3X+K4TbCSiNrHD6GpfF3g/xu+9lahYYjU4ktFpp9PuohAB7wYjo2/7I
         /Mw7Dgl25dGudOqR4ayvcdQwHPhIOUDVymcob+uLiwh7kXLYl9glDGllZn9xoAMoP1is
         JCHFj5AIY7Nq6ca/fp7M1KmHBu5NUIQcKKnZx+xUDj2awa23VFRB8c4lTb/leJGEhfER
         4S0RS8ULwsXWaVxCTPqOQTgpYI4hHeBp8dZ5ZB4/0RGM+X4cJLHMcheFvejUGBiL9t9M
         gCwPO8pH+w5DPvkfsvoLXokFvSLh0QIFcQB6sb4P+NguJuj4IrWxEgEI6vt33bo0OBbj
         FTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689293700; x=1689898500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WogNqZmM5qIDEUwvyRv9RC9FRo2r68Wx4DIsyw3FtoM=;
        b=UxLrclK6BNtqjcb8SoIVPYKZYAzMyVtXbGk8LfMRUihD+EQYhf/1bqgo4hm1A6wEae
         eyZEG6BB6RuhZdBM/E7A4OB/5BabtQ4tJuhRGVFY4QI7Z8lsXyqDCQbzV6itCwum+o3h
         HPN0sZJl+JrjHPmel3rVPHhw73MenKMIAWx8c0h0BdU8s2hCzJ8qmiY9W0g6QpLbiHBd
         VSStN4bFOdNcPNNoLkFVGL9cMX44Lxl3C55BnwgEHGIHhZUWM+T5dB6RCZ91t2l9JpSt
         93YJ6WuiY/xiD7zbCzwyloeppQxcSQQDyC/3D23n9kxZl4OzLTHWW0CF7OC7LgCz/q6i
         4h5Q==
X-Gm-Message-State: ABy/qLZoG34qL0IRd8FK0DoNzZnYODfz2K+cwLDn3LDuu1sRwpEOWqem
        bCtKCRjHU9brNCH/MA167DV9zQULCl1qP2WPVpE=
X-Google-Smtp-Source: APBJJlF99rw3p+D/V7h80wItL1ogt7q2SWOZln6YuZpHDidkN54eC97ZWfBnsDKm67js+3dBZPQKGw==
X-Received: by 2002:a05:6a20:1445:b0:130:52c5:5123 with SMTP id a5-20020a056a20144500b0013052c55123mr3737553pzi.3.1689293699862;
        Thu, 13 Jul 2023 17:14:59 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x25-20020aa793b9000000b00673e652985esm5938107pff.44.2023.07.13.17.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 17:14:59 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     charlie@rivosinc.com, conor@kernel.org, paul.walmsley@sifive.com,
        palmer@rivosinc.com, aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
        alexghiti@rivosinc.com
Subject: [PATCH v5 3/4] RISC-V: mm: Update pgtable comment documentation
Date:   Thu, 13 Jul 2023 17:14:02 -0700
Message-ID: <20230714001430.75798-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714001430.75798-1-charlie@rivosinc.com>
References: <20230714001430.75798-1-charlie@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

sv57 is supported in the kernel so pgtable.h should reflect that.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e13f5872bfe9..28660bab754c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -840,14 +840,16 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
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

