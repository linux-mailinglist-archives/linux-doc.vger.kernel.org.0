Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D64A2891EC
	for <lists+linux-doc@lfdr.de>; Fri,  9 Oct 2020 21:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390743AbgJITnG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Oct 2020 15:43:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:2875 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733093AbgJITnG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Oct 2020 15:43:06 -0400
IronPort-SDR: tUjRtORwTjrUlBBEQQi0XdPxK/uGFHRwa20ORdL3aWFRlaxlDE+UeFB2eWFs4hK4bBDFN10NxY
 avF5se2UBLXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182975322"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="182975322"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:43:04 -0700
IronPort-SDR: rMdjjxowOVNBlu7aeC3rxeSAfOjMt26FkSg07m7V85+JIoYQHT8XGRHWJYiXG8+tNUyd0OV/IV
 R48BN9FuohTw==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="462299345"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:43:03 -0700
From:   ira.weiny@intel.com
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Ira Weiny <ira.weiny@intel.com>, x86@kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Fenghua Yu <fenghua.yu@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH RFC V3 0/9] PKS: Add Protection Keys Supervisor (PKS) support RFC v3
Date:   Fri,  9 Oct 2020 12:42:49 -0700
Message-Id: <20201009194258.3207172-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

This RFC series has been reviewed by Dave Hansen.

Introduce a new page protection mechanism for supervisor pages, Protection Key
Supervisor (PKS).

2 use cases for PKS are being developed, trusted keys and PMEM.  Trusted keys
is a newer use case which is still being explored.  PMEM was submitted as part
of the RFC (v2) series[1].  However, since then it was found that some callers
of kmap() require a global implementation of PKS.  Specifically some users of
kmap() expect mappings to be available to all kernel threads.  While global use
of PKS is rare it needs to be included for correctness.  Unfortunately the
kmap() updates required a large patch series to make the needed changes at the
various kmap() call sites so that patch set has been split out.  Because the
global PKS feature is only required for that use case it will be deferred to
that set as well.[2]  This patch set is being submitted as a precursor to both
of the use cases.

For an overview of the entire PKS ecosystem, a git tree including this series
and the 2 use cases can be found here:

	https://github.com/weiny2/linux-kernel/tree/pks-rfc-v3


PKS enables protections on 'domains' of supervisor pages to limit supervisor
mode access to those pages beyond the normal paging protections.  PKS works in
a similar fashion to user space pkeys, PKU.  As with PKU, supervisor pkeys are
checked in addition to normal paging protections and Access or Writes can be
disabled via a MSR update without TLB flushes when permissions change.  Also
like PKU, a page mapping is assigned to a domain by setting pkey bits in the
page table entry for that mapping.

Access is controlled through a PKRS register which is updated via WRMSR/RDMSR.

XSAVE is not supported for the PKRS MSR.  Therefore the implementation
saves/restores the MSR across context switches and during exceptions.  Nested
exceptions are supported by each exception getting a new PKS state.

For consistent behavior with current paging protections, pkey 0 is reserved and
configured to allow full access via the pkey mechanism, thus preserving the
default paging protections on mappings with the default pkey value of 0.

Other keys, (1-15) are allocated by an allocator which prepares us for key
contention from day one.  Kernel users should be prepared for the allocator to
fail either because of key exhaustion or due to PKS not being supported on the
arch and/or CPU instance.

The following are key attributes of PKS.

   1) Fast switching of permissions
	1a) Prevents access without page table manipulations
	1b) No TLB flushes required
   2) Works on a per thread basis

PKS is available with 4 and 5 level paging.  Like PKRU it consumes 4 bits from
the PTE to store the pkey within the entry.


[1] https://lore.kernel.org/lkml/20200717072056.73134-1-ira.weiny@intel.com/
[2] https://github.com/weiny2/linux-kernel/commit/f10abb0f0d7b4e14f03fc8890313a5830cde1e49
	and a testing patch
    https://github.com/weiny2/linux-kernel/commit/2a8e0fc7654a7c69b243d628f63b01ff26a5a797


Fenghua Yu (3):
  x86/fpu: Refactor arch_set_user_pkey_access() for PKS support
  x86/pks: Enable Protection Keys Supervisor (PKS)
  x86/pks: Add PKS kernel API

Ira Weiny (6):
  x86/pkeys: Create pkeys_common.h
  x86/pks: Preserve the PKRS MSR on context switch
  x86/entry: Pass irqentry_state_t by reference
  x86/entry: Preserve PKRS MSR across exceptions
  x86/fault: Report the PKRS state on fault
  x86/pks: Add PKS test code

 Documentation/core-api/protection-keys.rst  | 102 ++-
 arch/x86/Kconfig                            |   1 +
 arch/x86/entry/common.c                     |  57 +-
 arch/x86/include/asm/cpufeatures.h          |   1 +
 arch/x86/include/asm/idtentry.h             |  29 +-
 arch/x86/include/asm/msr-index.h            |   1 +
 arch/x86/include/asm/pgtable.h              |  13 +-
 arch/x86/include/asm/pgtable_types.h        |  12 +
 arch/x86/include/asm/pkeys.h                |  15 +
 arch/x86/include/asm/pkeys_common.h         |  36 +
 arch/x86/include/asm/processor.h            |  13 +
 arch/x86/include/uapi/asm/processor-flags.h |   2 +
 arch/x86/kernel/cpu/common.c                |  17 +
 arch/x86/kernel/cpu/mce/core.c              |   4 +
 arch/x86/kernel/fpu/xstate.c                |  22 +-
 arch/x86/kernel/kvm.c                       |   4 +-
 arch/x86/kernel/nmi.c                       |   7 +-
 arch/x86/kernel/process.c                   |  21 +
 arch/x86/kernel/traps.c                     |  21 +-
 arch/x86/mm/fault.c                         |  86 ++-
 arch/x86/mm/pkeys.c                         | 188 +++++-
 include/linux/entry-common.h                |  19 +-
 include/linux/pgtable.h                     |   4 +
 include/linux/pkeys.h                       |  23 +-
 kernel/entry/common.c                       |  28 +-
 lib/Kconfig.debug                           |  12 +
 lib/Makefile                                |   3 +
 lib/pks/Makefile                            |   3 +
 lib/pks/pks_test.c                          | 690 ++++++++++++++++++++
 mm/Kconfig                                  |   2 +
 tools/testing/selftests/x86/Makefile        |   3 +-
 tools/testing/selftests/x86/test_pks.c      |  65 ++
 32 files changed, 1376 insertions(+), 128 deletions(-)
 create mode 100644 arch/x86/include/asm/pkeys_common.h
 create mode 100644 lib/pks/Makefile
 create mode 100644 lib/pks/pks_test.c
 create mode 100644 tools/testing/selftests/x86/test_pks.c

-- 
2.28.0.rc0.12.gb6a658bd00c9

