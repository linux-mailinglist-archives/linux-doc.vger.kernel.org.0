Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71901E6C1D
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2020 22:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406996AbgE1UOP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 28 May 2020 16:14:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406993AbgE1UOM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 28 May 2020 16:14:12 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0562E207D3;
        Thu, 28 May 2020 20:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590696851;
        bh=MV7WUd24PE8fRkx618Y03OhhvRP2m37PebgijiWKHpo=;
        h=From:To:Cc:Subject:Date:From;
        b=ueeAsD827pWGQvqI5b7jxY/rSr+PdlR7sS+n0uA9yL670GGJKgca4NXb7nWrvuRgZ
         NVJDD5tRdQI4vPhif+nVUg68Gk5NpqRVtgL2LY0o0CyCq3bvxmY1ZeDpwJPi6QAr7l
         n+Ol6RVDsreD6qoY9dcToC49VFgmAZyGW815QPQE=
From:   Sasha Levin <sashal@kernel.org>
To:     tglx@linutronix.de, luto@kernel.org, ak@linux.intel.com
Cc:     corbet@lwn.net, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        shuah@kernel.org, gregkh@linuxfoundation.org, tony.luck@intel.com,
        chang.seok.bae@intel.com, dave.hansen@linux.intel.com,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.sakkinen@linux.intel.com,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH v13 00/16] Enable FSGSBASE instructions
Date:   Thu, 28 May 2020 16:13:46 -0400
Message-Id: <20200528201402.1708239-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Benefits:
Currently a user process that wishes to read or write the FS/GS base must
make a system call. But recent X86 processors have added new instructions
for use in 64-bit mode that allow direct access to the FS and GS segment
base addresses.  The operating system controls whether applications can
use these instructions with a %cr4 control bit.

In addition to benefits to applications, performance improvements to the
OS context switch code are possible by making use of these instructions. A
third party reported out promising performance numbers out of their
initial benchmarking of the previous version of this patch series.

Enablement check:
The kernel provides information about the enabled state of FSGSBASE to
applications using the ELF_AUX vector. If the HWCAP2_FSGSBASE bit is set in
the AUX vector, the kernel has FSGSBASE instructions enabled and
applications can use them.

Kernel changes:
Major changes made in the kernel are in context switch, paranoid path, and
ptrace. In a context switch, a task's FS/GS base will be secured regardless
of its selector. In the paranoid path, GS base is unconditionally
overwritten to the kernel GS base on entry and the original GS base is
restored on exit. Ptrace includes divergence of FS/GS index and base
values.

Security:
For mitigating the Spectre v1 SWAPGS issue, LFENCE instructions were added
on most kernel entries. Those patches are dependent on previous behaviors
that users couldn't load a kernel address into the GS base. These patches
change that assumption since the user can load any address into GS base.
The changes to the kernel entry path in this patch series take account of
the SWAPGS issue.

Changes from v12:
 - Reformat the series to be closer to the reverted codebase for easier
   review.
 - Drop a few of the changes introduced in v8 and v9.


Andi Kleen (2):
  x86/fsgsbase/64: Add intrinsics for FSGSBASE instructions
  x86/elf: Enumerate kernel FSGSBASE capability in AT_HWCAP2

Andy Lutomirski (3):
  x86/cpu: Add 'unsafe_fsgsbase' to enable CR4.FSGSBASE
  x86/process/64: Use FSBSBASE in switch_to() if available
  x86/cpu: Enable FSGSBASE on 64bit by default and add a chicken bit

Chang S. Bae (8):
  x86/ptrace: Prevent ptrace from clearing the FS/GS selector
  x86/fsgsbase/64: Enable FSGSBASE instructions in helper functions
  x86/process/64: Use FSGSBASE instructions on thread copy and ptrace
  x86/entry/64: Switch CR3 before SWAPGS in paranoid entry
  x86/entry/64: Introduce the FIND_PERCPU_BASE macro
  x86/entry/64: Handle FSGSBASE enabled paranoid entry/exit
  selftests/x86/fsgsbase: Test GS selector on ptracer-induced GS base
    write
  selftests/x86/fsgsbase: Test ptracer-induced GS base write with
    FSGSBASE

Thomas Gleixner (2):
  x86/process/64: Make save_fsgs() public available
  Documentation/x86/64: Add documentation for GS/FS addressing mode

Tony Luck (1):
  x86/speculation/swapgs: Check FSGSBASE in enabling SWAPGS mitigation

 .../admin-guide/kernel-parameters.txt         |   2 +
 Documentation/x86/x86_64/fsgs.rst             | 199 ++++++++++++++++++
 Documentation/x86/x86_64/index.rst            |   1 +
 arch/x86/entry/calling.h                      |  40 ++++
 arch/x86/entry/entry_64.S                     | 135 +++++++++---
 arch/x86/include/asm/fsgsbase.h               |  45 +++-
 arch/x86/include/asm/inst.h                   |  15 ++
 arch/x86/include/asm/processor.h              |   4 +-
 arch/x86/include/uapi/asm/hwcap2.h            |   3 +
 arch/x86/kernel/cpu/bugs.c                    |   6 +-
 arch/x86/kernel/cpu/common.c                  |  22 ++
 arch/x86/kernel/process.c                     |  10 +-
 arch/x86/kernel/process_64.c                  | 119 +++++++++--
 arch/x86/kernel/ptrace.c                      |  17 +-
 arch/x86/kvm/vmx/vmx.c                        |   2 +-
 tools/testing/selftests/x86/fsgsbase.c        |  24 ++-
 16 files changed, 562 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/x86/x86_64/fsgs.rst

-- 
2.25.1

