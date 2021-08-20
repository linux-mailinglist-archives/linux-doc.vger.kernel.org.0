Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474C13F337C
	for <lists+linux-doc@lfdr.de>; Fri, 20 Aug 2021 20:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236139AbhHTSYT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 20 Aug 2021 14:24:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:48048 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236946AbhHTSXz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 20 Aug 2021 14:23:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="203964937"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; 
   d="scan'208";a="203964937"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 11:23:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; 
   d="scan'208";a="523799150"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 11:23:07 -0700
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
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>,
        Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH v29 00/10] Control-flow Enforcement: Indirect Branch Tracking
Date:   Fri, 20 Aug 2021 11:22:35 -0700
Message-Id: <20210820182245.1188-1-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Control-flow Enforcement (CET) is a new Intel processor feature that blocks
return/jump-oriented programming attacks.  Details are in "Intel 64 and
IA-32 Architectures Software Developer's Manual" [1].

This is the second part of CET and enables Indirect Branch Tracking (IBT).
It is built on top of the shadow stack series.

Changes in v29:
- Rebase to Linus tree v5.14-rc6.

Changes in v28:
- Patch #10: Update change log and comments.
- Rebase to Linus tree v5.14-rc2.

Changes in v27:
- Use a ucontext flag to save/restore IBT status.
- Disable IBT support for IA32.
- Rebase to Linus tree v5.13-rc2.

[1] Intel 64 and IA-32 Architectures Software Developer's Manual:

    https://software.intel.com/en-us/download/intel-64-and-ia-32-
    architectures-sdm-combined-volumes-1-2a-2b-2c-2d-3a-3b-3c-3d-and-4

H.J. Lu (3):
  x86/cet/ibt: Update arch_prctl functions for Indirect Branch Tracking
  x86/vdso: Insert endbr32/endbr64 to vDSO
  x86/vdso/32: Add ENDBR to __kernel_vsyscall entry point

Yu-cheng Yu (7):
  x86/cet/ibt: Add Kconfig option for Indirect Branch Tracking
  x86/cet/ibt: Add user-mode Indirect Branch Tracking support
  x86/cet/ibt: Handle signals for Indirect Branch Tracking
  x86/cet/ibt: Disable IBT for ia32
  x86/cet/ibt: Update ELF header parsing for Indirect Branch Tracking
  x86/vdso: Introduce ENDBR macro
  x86/vdso: Add ENDBR to __vdso_sgx_enter_enclave

 arch/x86/Kconfig                         | 19 +++++
 arch/x86/entry/vdso/Makefile             |  4 +
 arch/x86/entry/vdso/vdso32/system_call.S |  2 +
 arch/x86/entry/vdso/vsgx.S               |  4 +
 arch/x86/ia32/ia32_signal.c              | 22 +++++-
 arch/x86/include/asm/cet.h               | 13 ++++
 arch/x86/include/asm/disabled-features.h |  8 +-
 arch/x86/include/asm/elf.h               | 13 +++-
 arch/x86/include/asm/vdso.h              | 20 ++++-
 arch/x86/include/uapi/asm/ucontext.h     |  5 ++
 arch/x86/kernel/Makefile                 |  1 +
 arch/x86/kernel/cet_prctl.c              |  5 ++
 arch/x86/kernel/ibt.c                    | 99 ++++++++++++++++++++++++
 arch/x86/kernel/process_64.c             |  6 ++
 arch/x86/kernel/signal.c                 |  6 ++
 15 files changed, 221 insertions(+), 6 deletions(-)
 create mode 100644 arch/x86/kernel/ibt.c

-- 
2.21.0

