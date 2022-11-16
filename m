Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0FE62C093
	for <lists+linux-doc@lfdr.de>; Wed, 16 Nov 2022 15:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbiKPOKb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Nov 2022 09:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbiKPOKN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 09:10:13 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5DD6FBA3;
        Wed, 16 Nov 2022 06:09:29 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 276401477;
        Wed, 16 Nov 2022 06:09:35 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.40.231])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFF573F663;
        Wed, 16 Nov 2022 06:09:25 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Morse <james.morse@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org
Subject: [PATCH V3 0/2] arm64: errata: Workaround Cortex-A715 errata #2645198
Date:   Wed, 16 Nov 2022 19:39:13 +0530
Message-Id: <20221116140915.356601-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series adds Cortex-A715 partnumber and workarounds the errata #2645198
which gets triggered when an userspace page mapping permission changes from
executable to non-executable, corrupting both ESR_EL1/FAR_EL1 registers
when an instruction abort is taken.

This series applies on v6.1-rc5.

The errata description can be found here.

https://developer.arm.com/documentation/SDEN2148827/1000/?lang=en

Cc: Catalin Marinas <catalin.marinas@arm.com> 
Cc: Will Deacon <will@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mark Rutland <mark.rutland@arm.com> 
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

Changes in V3:

- Replaced __set_pte_at() with set_pte_at() in ptep_modify_prot_commit()
- Dropped local variable 'pte_t pte', replaced with direct READ_ONCE(*ptep)
- Moved cpus_have_const_cap() earlier as per Catalin

Changes in V2:

https://lore.kernel.org/all/20221113012645.190301-1-anshuman.khandual@arm.com/

- Added ptep_modify_prot_start/commit declaration into [asm/pgtable.h]
- Moved ptep_modify_prot_start/commit definitions into [arch/arm64/mm/mmu.c]
- Above code movements solved ptep_clear_flush() related build dependency
- Replaced __flush_tlb_range() with ptep_clear_flush()/huge_ptep_clear_flush()

Changes in V1:

https://lore.kernel.org/all/20221027023915.1318100-1-anshuman.khandual@arm.com/


Anshuman Khandual (2):
  arm64: Add Cortex-715 CPU part definition
  arm64: errata: Workaround possible Cortex-A715 [ESR|FAR]_ELx corruption

 Documentation/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                     | 16 ++++++++++++++++
 arch/arm64/include/asm/cputype.h       |  2 ++
 arch/arm64/include/asm/hugetlb.h       |  9 +++++++++
 arch/arm64/include/asm/pgtable.h       |  9 +++++++++
 arch/arm64/kernel/cpu_errata.c         |  7 +++++++
 arch/arm64/mm/hugetlbpage.c            | 21 +++++++++++++++++++++
 arch/arm64/mm/mmu.c                    | 21 +++++++++++++++++++++
 arch/arm64/tools/cpucaps               |  1 +
 9 files changed, 88 insertions(+)

-- 
2.25.1

