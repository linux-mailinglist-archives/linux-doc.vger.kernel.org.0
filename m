Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3819B74BAE7
	for <lists+linux-doc@lfdr.de>; Sat,  8 Jul 2023 03:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjGHBMQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Jul 2023 21:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjGHBMP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 21:12:15 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15701210B
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 18:12:12 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1737224a12.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 18:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688778731; x=1691370731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hG/AQXuxFAN1krhx66y6oqNvLxTmXg3B48rFR/wju6k=;
        b=kSdi/rNNNHfMSpMFIlfOp/mOBJADnhFaAkk66ucVjag4lVze23mZCljnN+xyusXAE6
         uwi+Cq9yHV8Xj1AjwIfBaestAxuDhlSvML5JIt51GA0wKM7W21y+lYcRF4pZHqSVfbHX
         kmLPAFzBPN3Le+mo2dUUh4iy5dqdffKDbShbJ6jD6thbA18ssPldJ1ftLXv0aVtbzLQH
         TKFlwOixvLICPJGYOuUyJ3onYj6xf+6ObnIn6JGO3uDdE2/T4PAkD57OnrAqIEoeFH1+
         uUaTIeoPDPz1mdI5fua3omzz/1t0033c4GVajNsi4GqNXKBlUYF+Hc7pLj5490GIGTga
         shYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778731; x=1691370731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hG/AQXuxFAN1krhx66y6oqNvLxTmXg3B48rFR/wju6k=;
        b=IlRzDQKkfHhdTN6Lf3VBq9HSyLrrcGnk/KiZAa41IJWeiwxOKGLRbckOxsKHnRobDF
         zbaW5lX2GR4i3mR61HPt9H/KPV7w97oxBQvzdd1fOwPdRQd/eSg3votR6kqBf2C45Wmt
         8/FLEICcDAKF3R2kI4SjtWQOsNXwXPcymcF/mN6lVF8+VRLJ2eVaA19jYTVK8llTh87z
         42zJMXcWylmLfYRcJ046YpQReHX95VVgRA6qZYNbLVlY+DQp/mWhzfwZ/JaBcvkghmZ9
         j3a9q7sUgm4FE8URq5VGQDYuhWrl7ma7sbBoDvwOm+yzSoRB2h3UHk0gtYzI+1QIjTYZ
         RsVw==
X-Gm-Message-State: ABy/qLZ6Qgt3lx7inyCZpISDlm0Hhbm7VOxXMEtWNgZ1E2Ai7aXRGeKL
        rvLrVdFygjhRmgPe/nJlx4xfrA==
X-Google-Smtp-Source: APBJJlEfIeSIG6gg4bQuj7jzvSYRUPZTMB4e5Z3mxa32edquCBC5onRLyiJegqwpT1yjoKYrnzvs8g==
X-Received: by 2002:a17:902:eacc:b0:1b8:ae12:5610 with SMTP id p12-20020a170902eacc00b001b8ae125610mr6450652pld.7.1688778731557;
        Fri, 07 Jul 2023 18:12:11 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x24-20020a170902b41800b001b87d3e845bsm3830654plr.149.2023.07.07.18.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:12:10 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     charlie@rivosinc.com, conor@kernel.org, paul.walmsley@sifive.com,
        palmer@rivosinc.com, aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org
Subject: [PATCH v4 0/4] RISC-V: mm: Make SV48 the default address space
Date:   Fri,  7 Jul 2023 18:11:31 -0700
Message-ID: <20230708011156.2697409-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
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

Make sv48 the default address space for mmap as some applications
currently depend on this assumption. Also enable users to select
desired address space using a non-zero hint address to mmap. Previous
kernel changes caused Java and other applications to be broken on sv57
which this patch fixes.

Documentation is also added to the RISC-V virtual memory section to explain
these changes.

-Charlie

---
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
 arch/riscv/include/asm/pgtable.h              |  21 ++-
 arch/riscv/include/asm/processor.h            |  43 +++++-
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/mm/.gitignore   |   1 +
 tools/testing/selftests/riscv/mm/Makefile     |  21 +++
 .../selftests/riscv/mm/testcases/mmap.c       | 133 ++++++++++++++++++
 8 files changed, 232 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c

-- 
2.41.0

