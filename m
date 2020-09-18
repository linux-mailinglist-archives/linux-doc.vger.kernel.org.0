Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B530270567
	for <lists+linux-doc@lfdr.de>; Fri, 18 Sep 2020 21:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgIRTYP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Sep 2020 15:24:15 -0400
Received: from mga14.intel.com ([192.55.52.115]:44696 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbgIRTXb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 Sep 2020 15:23:31 -0400
IronPort-SDR: QiSsVwJn+Pj1Inb7h6sFJJeSeG0f91yaxAUu7EdmpX9x/TqB4FcwAa8Nj64K7M01RX89FV5DPh
 hZCpAUCr/J4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="159330589"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="159330589"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 12:23:28 -0700
IronPort-SDR: iTI1oTeGP0XU2orD/l/BiUgBjXvA+znthWyoGimUXtajQowUtnDe5V1GH35G7gSo/POPWAD5z+
 68yV13JReIPw==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="484332727"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 12:23:27 -0700
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
        Weijiang Yang <weijiang.yang@intel.com>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH v12 0/8] Control-flow Enforcement: Indirect Branch Tracking
Date:   Fri, 18 Sep 2020 12:23:04 -0700
Message-Id: <20200918192312.25978-1-yu-cheng.yu@intel.com>
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

Changes in v12:

- Replace obj file list with $(vobjs) $(vobjs32) in VDSO Makefile.
- Disable vsyscall emulation only when it is attempted.
- Split out ptrace patch.

[1] Intel 64 and IA-32 Architectures Software Developer's Manual:

    https://software.intel.com/en-us/download/intel-64-and-ia-32-
    architectures-sdm-combined-volumes-1-2a-2b-2c-2d-3a-3b-3c-3d-and-4

[2] Indirect Branch Tracking patches v11.

    https://lkml.kernel.org/r/20200825002645.3658-1-yu-cheng.yu@intel.com/

H.J. Lu (3):
  x86/cet/ibt: Update arch_prctl functions for Indirect Branch Tracking
  x86/vdso/32: Add ENDBR32 to __kernel_vsyscall entry point
  x86/vdso: Insert endbr32/endbr64 to vDSO

Yu-cheng Yu (5):
  x86/cet/ibt: Add Kconfig option for user-mode Indirect Branch Tracking
  x86/cet/ibt: User-mode Indirect Branch Tracking support
  x86/cet/ibt: Handle signals for Indirect Branch Tracking
  x86/cet/ibt: ELF header parsing for Indirect Branch Tracking
  x86: Disallow vsyscall emulation when CET is enabled

 arch/x86/Kconfig                              | 18 ++++++
 arch/x86/entry/vdso/Makefile                  |  4 ++
 arch/x86/entry/vdso/vdso32/system_call.S      |  3 +
 arch/x86/entry/vsyscall/vsyscall_64.c         |  9 +++
 arch/x86/include/asm/cet.h                    |  3 +
 arch/x86/include/asm/disabled-features.h      |  8 ++-
 arch/x86/kernel/cet.c                         | 60 ++++++++++++++++++-
 arch/x86/kernel/cet_prctl.c                   |  8 ++-
 arch/x86/kernel/cpu/common.c                  | 17 ++++++
 arch/x86/kernel/fpu/signal.c                  |  8 ++-
 arch/x86/kernel/process_64.c                  |  8 +++
 .../arch/x86/include/asm/disabled-features.h  |  8 ++-
 12 files changed, 146 insertions(+), 8 deletions(-)

-- 
2.21.0

