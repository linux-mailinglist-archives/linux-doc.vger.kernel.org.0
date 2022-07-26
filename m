Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB9958100A
	for <lists+linux-doc@lfdr.de>; Tue, 26 Jul 2022 11:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiGZJhj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 26 Jul 2022 05:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiGZJhj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 05:37:39 -0400
Received: from out30-44.freemail.mail.aliyun.com (out30-44.freemail.mail.aliyun.com [115.124.30.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BEB5FEE;
        Tue, 26 Jul 2022 02:37:37 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0VKV.3Oq_1658828251;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VKV.3Oq_1658828251)
          by smtp.aliyun-inc.com;
          Tue, 26 Jul 2022 17:37:32 +0800
From:   Xianting Tian <xianting.tian@linux.alibaba.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, anup@brainfault.org, heiko@sntech.de,
        guoren@kernel.org, mick@ics.forth.gr,
        alexandre.ghiti@canonical.com, bhe@redhat.com, vgoyal@redhat.com,
        dyoung@redhat.com, corbet@lwn.net
Cc:     kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        crash-utility@redhat.com, huanyi.xj@alibaba-inc.com,
        heinrich.schuchardt@canonical.com, k-hagio-ab@nec.com,
        hschauhan@nulltrace.org,
        Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH V4 0/5] RISC-V fixups to work with crash tool
Date:   Tue, 26 Jul 2022 17:37:24 +0800
Message-Id: <20220726093729.1231867-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I ever sent the patch 1 in the link:
https://patchwork.kernel.org/project/linux-riscv/patch/20220708073150.352830-3-xianting.tian@linux.alibaba.com/
And patch 2,3 in the link:
https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-2-xianting.tian@linux.alibaba.com/
https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-3-xianting.tian@linux.alibaba.com/

This patch series just put these patches together, and with two new patch 4, 5.
these five patches are the fixups for machine_kexec, kernel mode PC for vmcore
and improvements for vmcoreinfo and memory layout dump.

The main changes in the five patchs as below,
Patch 1: use __smp_processor_id() instead of smp_processor_id() to cleanup
         the console prints.
Patch 2: Add VM layout, va bits, ram base to vmcoreinfo, which can simplify
         the development of crash tool as ARM64 already did
         (arch/arm64/kernel/crash_core.c).
Patch 3: Add modules to virtual kernel memory layout dump.
Patch 4: Fixup to get correct kernel mode PC for vmcore.
Patch 5: Updates vmcoreinfo.rst.

With these 5 patches(patch 2 is must), crash tool can work well to analyze
a vmcore. The patches for crash tool for RISCV64 is in the link:
https://lore.kernel.org/linux-riscv/20220718025346.411758-1-xianting.tian@linux.alibaba.com/

Changes v1 -> v2:
 1, remove the patch "Add a fast call path of crash_kexec()" from this series
 of patches, as it already applied to riscv git.
 https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=3f1901110a89b0e2e13adb2ac8d1a7102879ea98
 2, add 'Reviewed-by' based on the comments of v1.
Changes v2 -> v3:
 use "riscv" instead of "riscv64" in patch 5 subject line.
Changes v3 -> v4:
 use "riscv" instead of "riscv64" in the summary of patch 5 subject line.

Xianting Tian (5):
  RISC-V: use __smp_processor_id() instead of smp_processor_id()
  RISC-V: Add arch_crash_save_vmcoreinfo support
  riscv: Add modules to virtual kernel memory layout dump
  RISC-V: Fixup getting correct current pc
  riscv: crash_core: Export kernel vm layout, phys_ram_base

 .../admin-guide/kdump/vmcoreinfo.rst          | 31 +++++++++++++++++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/crash_core.c                | 29 +++++++++++++++++
 arch/riscv/kernel/crash_save_regs.S           |  2 +-
 arch/riscv/kernel/machine_kexec.c             |  2 +-
 arch/riscv/mm/init.c                          |  4 +++
 6 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/kernel/crash_core.c

-- 
2.17.1

