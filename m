Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B437753FFF
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jul 2023 18:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbjGNQz5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Jul 2023 12:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235405AbjGNQz4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 12:55:56 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6201FC8
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 09:55:55 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b8a44ee159so13165185ad.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689353755; x=1689958555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u86Vccu0MjIpV1lk8gugdD4Hj3xwuyAB97KWj8HD83Y=;
        b=DcSFI3El+kQ7LUhr7I9CNLzPEPRrFlKiPN0ROzCgA+1cx5EXlSbbSIgcwQR813I1L+
         3uvoKmq2u01aQ1HX/F+kykKZKylNNs2J3TaYWmJfiC83cJEInBDz4UCDaT5YwZ28E5St
         H4SWKBVBsD2CZuKTjWB7EmNUDRNO0LJL6JSIOLpEXHgP2Y0TUROAagLq2gTnozEMMH92
         2lDqhD+T+AR9CiYZ0dScRh/n98YBFJOdLfHH+j2EkhhSk32EX6cf10DVILFLv9++ETt4
         wXVVrJ8jvwSLjrVIHuumet2G6Uj24MK9BtcXy0zdk2NFm15eYGcfgjfjwSJyXAwIkWWZ
         Nr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689353755; x=1689958555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u86Vccu0MjIpV1lk8gugdD4Hj3xwuyAB97KWj8HD83Y=;
        b=QSYVnrWGR/B6sw/ImkdLCHuvOBl/AakBrE60qiYjX5pzvQyM6XvtVrqjdtkl0ViYM8
         pCmRm/qj59n+XJjEHI26QunZAjlhVGhVSGU/UjQP/rCnMftKHpfaTjCkVaYYkKN97hOw
         attkpSDJQXP8xFxU4RQ4pIPcUVpyfYwwaEExPpxeR5Z8GnaKE42QeqdSiJdnzBrwTnub
         vHvVI86Pcr1GIIHymlZsyRZQTP2634FXNfzSgVL59wIhCVtFMFs/3io1C7VxlPhfWQeA
         t4m9oVot32VxvWn/Uw53YmoQZHEW0eExISmXnRv+mrnp1nN+sbUQhmEQBxbvoOCotUCA
         NBQA==
X-Gm-Message-State: ABy/qLbXhk/M9BTAw8ZBPB5KdMuj1UURS1MqAm+IAIUsRp6WaoyH1AZ2
        FKhP7obWAdku1NOc7WT6g7H6gw==
X-Google-Smtp-Source: APBJJlGGxbl6qGLIF7f2rYJjwvRaITLsmSOC7pkB9qZSGRIv+YlRfSsJaker/tHyOogKYwVG0JmwNg==
X-Received: by 2002:a17:903:2288:b0:1b8:af85:e959 with SMTP id b8-20020a170903228800b001b8af85e959mr4250415plh.53.1689353755192;
        Fri, 14 Jul 2023 09:55:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902b18800b001b694140d96sm8008081plr.170.2023.07.14.09.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:55:54 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     charlie@rivosinc.com, conor@kernel.org, paul.walmsley@sifive.com,
        palmer@rivosinc.com, aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
        alexghiti@rivosinc.com
Subject: [PATCH v6 0/4] RISC-V: mm: Make SV48 the default address space
Date:   Fri, 14 Jul 2023 09:54:48 -0700
Message-ID: <20230714165508.94561-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Make sv48 the default address space for mmap as some applications
currently depend on this assumption. Users can now select a
desired address space using a non-zero hint address to mmap. Previously,
requesting the default address space from mmap by passing zero as the hint
address would result in using the largest address space possible. Some
applications depend on empty bits in the virtual address space, like Go and
Java, so this patch provides more flexibility for application developers.

-Charlie

---
v6:
- Rebase onto the correct base

v5:
- Minor wording change in documentation
- Change some parenthesis in arch_get_mmap_ macros
- Added case for addr==0 in arch_get_mmap_ because without this, programs would
  crash if RLIMIT_STACK was modified before executing the program. This was
  tested using the libhugetlbfs tests. 

v4:
- Split testcases/document patch into test cases, in-code documentation, and
  formal documentation patches
- Modified the mmap_base macro to be more legible and better represent memory
  layout
- Fixed documentation to better reflect the implmentation
- Renamed DEFAULT_VA_BITS to MMAP_VA_BITS
- Added additional test case for rlimit changes
---

Charlie Jenkins (4):
  RISC-V: mm: Restrict address space for sv39,sv48,sv57
  RISC-V: mm: Add tests for RISC-V mm
  RISC-V: mm: Update pgtable comment documentation
  RISC-V: mm: Document mmap changes

 Documentation/riscv/vm-layout.rst             |  22 +++
 arch/riscv/include/asm/elf.h                  |   2 +-
 arch/riscv/include/asm/pgtable.h              |  20 ++-
 arch/riscv/include/asm/processor.h            |  46 +++++-
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/mm/.gitignore   |   1 +
 tools/testing/selftests/riscv/mm/Makefile     |  21 +++
 .../selftests/riscv/mm/testcases/mmap.c       | 133 ++++++++++++++++++
 8 files changed, 234 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c

-- 
2.41.0

