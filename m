Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8BA2E7471
	for <lists+linux-doc@lfdr.de>; Tue, 29 Dec 2020 22:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgL2Vc6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Dec 2020 16:32:58 -0500
Received: from mga03.intel.com ([134.134.136.65]:11891 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbgL2Vc6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Dec 2020 16:32:58 -0500
IronPort-SDR: 0ip6FS/7jORhMaslJr2sDc0UydizneZKN3RYcaPLUVjWLpCMw0MEqkfefulSgWfN+DKP2rM0pV
 ISwq6vU0Z7+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="176640497"
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="176640497"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 13:32:17 -0800
IronPort-SDR: siHl44mb3vT51tRq6qDm9TUMZ0HJXUQKOYOqK0PkXQYdAkRx2ameqqXPYPJ+bM7a1iE9qvqs+k
 eImvm7bWBZJA==
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="376189558"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 13:32:16 -0800
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH v17 00/26] Control-flow Enforcement: Shadow Stack
Date:   Tue, 29 Dec 2020 13:30:27 -0800
Message-Id: <20201229213053.16395-1-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Control-flow Enforcement (CET) is a new Intel processor feature that blocks
return/jump-oriented programming attacks.  Details are in "Intel 64 and
IA-32 Architectures Software Developer's Manual" [1].

CET can protect applications and the kernel.  This series enables only
application-level protection, and has three parts:

  - Shadow stack [2],
  - Indirect branch tracking [3], and
  - Selftests [4].

I have run tests on these patches for quite some time, and they have been
very stable.  Linux distributions with CET are available now, and Intel
processors with CET are already on the market.  It would be nice if CET
support can be accepted into the kernel.  I will be working to address any
issues should they come up.

Changes in v17:
- Rebase to v5.11-rc1.

[1] Intel 64 and IA-32 Architectures Software Developer's Manual:

    https://software.intel.com/en-us/download/intel-64-and-ia-32-
    architectures-sdm-combined-volumes-1-2a-2b-2c-2d-3a-3b-3c-3d-and-4

[2] CET Shadow Stack patches v16:

    https://lkml.kernel.org/r/20201209222320.1724-1-yu-cheng.yu@intel.com/

[3] Indirect Branch Tracking patches v16.

    https://lkml.kernel.org/r/20201209222752.2911-1-yu-cheng.yu@intel.com/

[4] I am holding off the selftests changes and working to get Acked-by's.
    The earlier version of the selftests patches:

    https://lkml.kernel.org/r/20200521211720.20236-1-yu-cheng.yu@intel.com/

[5] The kernel ptrace patch is tested with an Intel-internal updated GDB.
    I am holding off the kernel ptrace patch to re-test it with my earlier
    patch for fixing regset holes.

Yu-cheng Yu (26):
  Documentation/x86: Add CET description
  x86/cet/shstk: Add Kconfig option for user-mode control-flow
    protection
  x86/cpufeatures: Add CET CPU feature flags for Control-flow
    Enforcement Technology (CET)
  x86/cpufeatures: Introduce X86_FEATURE_CET and setup functions
  x86/fpu/xstate: Introduce CET MSR and XSAVES supervisor states
  x86/cet: Add control-protection fault handler
  x86/mm: Remove _PAGE_DIRTY from kernel RO pages
  x86/mm: Introduce _PAGE_COW
  drm/i915/gvt: Change _PAGE_DIRTY to _PAGE_DIRTY_BITS
  x86/mm: Update pte_modify for _PAGE_COW
  x86/mm: Update ptep_set_wrprotect() and pmdp_set_wrprotect() for
    transition from _PAGE_DIRTY to _PAGE_COW
  mm: Introduce VM_SHSTK for shadow stack memory
  x86/mm: Shadow Stack page fault error checking
  x86/mm: Update maybe_mkwrite() for shadow stack
  mm: Fixup places that call pte_mkwrite() directly
  mm: Add guard pages around a shadow stack.
  mm/mmap: Add shadow stack pages to memory accounting
  mm: Update can_follow_write_pte() for shadow stack
  mm: Re-introduce vm_flags to do_mmap()
  x86/cet/shstk: User-mode shadow stack support
  x86/cet/shstk: Handle signals for shadow stack
  binfmt_elf: Define GNU_PROPERTY_X86_FEATURE_1_AND properties
  ELF: Introduce arch_setup_elf_property()
  x86/cet/shstk: Handle thread shadow stack
  x86/cet/shstk: Add arch_prctl functions for shadow stack
  mm: Introduce PROT_SHSTK for shadow stack

 .../admin-guide/kernel-parameters.txt         |   6 +
 Documentation/x86/index.rst                   |   1 +
 Documentation/x86/intel_cet.rst               | 136 +++++++
 arch/arm64/include/asm/elf.h                  |   5 +
 arch/x86/Kconfig                              |  28 ++
 arch/x86/Kconfig.assembler                    |   5 +
 arch/x86/ia32/ia32_signal.c                   |  17 +
 arch/x86/include/asm/cet.h                    |  42 +++
 arch/x86/include/asm/cpufeatures.h            |   4 +-
 arch/x86/include/asm/disabled-features.h      |  17 +-
 arch/x86/include/asm/elf.h                    |  13 +
 arch/x86/include/asm/fpu/internal.h           |  10 +
 arch/x86/include/asm/fpu/types.h              |  23 +-
 arch/x86/include/asm/fpu/xstate.h             |   6 +-
 arch/x86/include/asm/idtentry.h               |   4 +
 arch/x86/include/asm/mman.h                   |  83 +++++
 arch/x86/include/asm/mmu_context.h            |   3 +
 arch/x86/include/asm/msr-index.h              |  19 +
 arch/x86/include/asm/page_64_types.h          |  10 +
 arch/x86/include/asm/pgtable.h                | 202 ++++++++++-
 arch/x86/include/asm/pgtable_types.h          |  48 ++-
 arch/x86/include/asm/processor.h              |   5 +
 arch/x86/include/asm/special_insns.h          |  32 ++
 arch/x86/include/asm/trap_pf.h                |   2 +
 arch/x86/include/uapi/asm/mman.h              |  28 +-
 arch/x86/include/uapi/asm/prctl.h             |   4 +
 arch/x86/include/uapi/asm/processor-flags.h   |   2 +
 arch/x86/include/uapi/asm/sigcontext.h        |   9 +
 arch/x86/kernel/Makefile                      |   2 +
 arch/x86/kernel/cet.c                         | 343 ++++++++++++++++++
 arch/x86/kernel/cet_prctl.c                   |  68 ++++
 arch/x86/kernel/cpu/common.c                  |  40 +-
 arch/x86/kernel/cpu/cpuid-deps.c              |   2 +
 arch/x86/kernel/fpu/signal.c                  | 100 +++++
 arch/x86/kernel/fpu/xstate.c                  |  10 +-
 arch/x86/kernel/idt.c                         |   4 +
 arch/x86/kernel/process.c                     |  14 +-
 arch/x86/kernel/process_64.c                  |  32 ++
 arch/x86/kernel/signal.c                      |  10 +
 arch/x86/kernel/signal_compat.c               |   2 +-
 arch/x86/kernel/traps.c                       |  59 +++
 arch/x86/mm/fault.c                           |  19 +
 arch/x86/mm/mmap.c                            |   2 +
 arch/x86/mm/pat/set_memory.c                  |   2 +-
 arch/x86/mm/pgtable.c                         |  25 ++
 drivers/gpu/drm/i915/gvt/gtt.c                |   2 +-
 fs/aio.c                                      |   2 +-
 fs/binfmt_elf.c                               |   4 +
 fs/proc/task_mmu.c                            |   3 +
 include/linux/elf.h                           |   6 +
 include/linux/mm.h                            |  38 +-
 include/linux/pgtable.h                       |  35 ++
 include/uapi/asm-generic/siginfo.h            |   3 +-
 include/uapi/linux/elf.h                      |   9 +
 ipc/shm.c                                     |   2 +-
 mm/gup.c                                      |   8 +-
 mm/huge_memory.c                              |  10 +-
 mm/memory.c                                   |   5 +-
 mm/migrate.c                                  |   3 +-
 mm/mmap.c                                     |  23 +-
 mm/mprotect.c                                 |   2 +-
 mm/nommu.c                                    |   4 +-
 mm/util.c                                     |   2 +-
 63 files changed, 1576 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/x86/intel_cet.rst
 create mode 100644 arch/x86/include/asm/cet.h
 create mode 100644 arch/x86/include/asm/mman.h
 create mode 100644 arch/x86/kernel/cet.c
 create mode 100644 arch/x86/kernel/cet_prctl.c

-- 
2.21.0

