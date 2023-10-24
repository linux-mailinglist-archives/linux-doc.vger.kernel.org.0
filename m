Return-Path: <linux-doc+bounces-907-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D57D494C
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 10:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE00C1F225CA
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 08:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD4615AD9;
	Tue, 24 Oct 2023 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7fdfk71"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A477A13AE0
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 08:08:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA9E111;
	Tue, 24 Oct 2023 01:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698134898; x=1729670898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9rCyLGSdVulRiJpx/JNudLmp34NwQVv3IZ33EiSu+4=;
  b=R7fdfk71NMH6n6WlHwA65OCKjSzTszV4JqZIf0AwrmvzpkKbsord7JfA
   Hj+bv1lKyAbl8e8I9HAsoSlx+THJUL791iZcNK+pa92z6kyFGkFR2eT5S
   fbJj/KNaBeqKsHBL3c7E73dZFhSqbLjxqIYd77NgT56BhFJLauJZyG3/D
   C8Pm+aiEoT+CEPCwGeMYNmX73tUhD0+YNZvmGAQpnnqJfWpRvJqUk0OzE
   TimbIMQL/RJWHkIr2YR9lnmUTqtXag+XPdO+XsDQXahiAHXhos2tloi/e
   v0AhR4379GF+vxM4nm4tLwI8/watBX+W91TYdU4E1jY3bn52wrA/ZM5zk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="5632674"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="5632674"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="824215388"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="824215388"
Received: from zijianw1-mobl.amr.corp.intel.com (HELO desk) ([10.209.109.187])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 01:08:16 -0700
Date: Tue, 24 Oct 2023 01:08:14 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Alyssa Milburn <alyssa.milburn@intel.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: [PATCH v2 0/6] Delay VERW
Message-ID: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAFZ2N2UC/03MSw6CMBSF4a2QO7akD6ziyH0YBthe5CZYTIsVQ
 rp3mzpxeP7kfDsE9IQBLtUOHiMFml0e8lCBGXv3QEY2b5BcKsGFYBanfmMR/YdZ3pya9qzv0ij
 Ih5fHgdaC3QC6XEYKy+y3okdR+g+S/B+KgnFmhuHY8FYrqe11Ivdea3ILTrWZn9CllL7H3khrr
 AAAAA==
X-Mailer: b4 0.12.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: *

v2:
- Removed the extra EXEC_VERW macro layers. (Sean)
- Move NOPL before VERW. (Sean)
- s/USER_CLEAR_CPU_BUFFERS/CLEAR_CPU_BUFFERS/. (Josh/Dave)
- Removed the comments before CLEAR_CPU_BUFFERS. (Josh)
- Remove CLEAR_CPU_BUFFERS from NMI returning to kernel and document the
  reason. (Josh/Dave)
- Reformat comment in md_clear_update_mitigation(). (Josh)
- Squash "x86/bugs: Cleanup mds_user_clear" patch. (Nikolay)
- s/GUEST_CLEAR_CPU_BUFFERS/CLEAR_CPU_BUFFERS/. (Josh)
- Added a patch from Sean to use CFLAGS.CF for VMLAUNCH/VMRESUME
  selection. This facilitates a single CLEAR_CPU_BUFFERS location for both
  VMLAUNCH and VMRESUME. (Sean)

v1: https://lore.kernel.org/r/20231020-delay-verw-v1-0-cff54096326d@linux.intel.com

Hi,

Legacy instruction VERW was overloaded by some processors to clear
micro-architectural CPU buffers as a mitigation of CPU bugs. This series
moves VERW execution to a later point in exit-to-user path. This is
needed because in some cases it may be possible for kernel data to be
accessed after VERW in arch_exit_to_user_mode(). Such accesses may put
data into MDS affected CPU buffers, for example:

  1. Kernel data accessed by an NMI between VERW and return-to-user can
     remain in CPU buffers (since NMI returning to kernel does not
     execute VERW to clear CPU buffers).
  2. Alyssa reported that after VERW is executed,
     CONFIG_GCC_PLUGIN_STACKLEAK=y scrubs the stack used by a system
     call. Memory accesses during stack scrubbing can move kernel stack
     contents into CPU buffers.
  3. When caller saved registers are restored after a return from
     function executing VERW, the kernel stack accesses can remain in
     CPU buffers(since they occur after VERW).

Although these cases are less practical to exploit, moving VERW closer
to ring transition reduces the attack surface.

Overview of the series:

Patch 1: Prepares VERW macros for use in asm.
Patch 2: Adds macros to 64-bit entry/exit points.
Patch 3: Adds macros to 32-bit entry/exit points.
Patch 4: Enables the new macros.
Patch 5: Uses CFLAGS.CF for VMLAUNCH/VMRESUME selection.
Patch 6: Adds macro to VMenter.

Below is some performance data collected with v1 on a Skylake client
compared with previous implementation:

Baseline: v6.6-rc5

| Test               | Configuration          | Relative |
| ------------------ | ---------------------- | -------- |
| build-linux-kernel | defconfig              | 1.00     |
| hackbench          | 32 - Process           | 1.02     |
| nginx              | Short Connection - 500 | 1.01     |

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
Pawan Gupta (5):
      x86/bugs: Add asm helpers for executing VERW
      x86/entry_64: Add VERW just before userspace transition
      x86/entry_32: Add VERW just before userspace transition
      x86/bugs: Use ALTERNATIVE() instead of mds_user_clear static key
      KVM: VMX: Move VERW closer to VMentry for MDS mitigation

Sean Christopherson (1):
      KVM: VMX: Use BT+JNC, i.e. EFLAGS.CF to select VMRESUME vs. VMLAUNCH

 Documentation/arch/x86/mds.rst       | 39 ++++++++++++++++++++++++++----------
 arch/x86/entry/entry_32.S            |  3 +++
 arch/x86/entry/entry_64.S            | 11 ++++++++++
 arch/x86/entry/entry_64_compat.S     |  1 +
 arch/x86/include/asm/cpufeatures.h   |  2 +-
 arch/x86/include/asm/entry-common.h  |  1 -
 arch/x86/include/asm/nospec-branch.h | 31 +++++++++++++++++-----------
 arch/x86/kernel/cpu/bugs.c           | 15 ++++++--------
 arch/x86/kernel/nmi.c                |  2 --
 arch/x86/kvm/vmx/run_flags.h         |  7 +++++--
 arch/x86/kvm/vmx/vmenter.S           | 10 ++++++---
 arch/x86/kvm/vmx/vmx.c               | 10 ++++++---
 12 files changed, 88 insertions(+), 44 deletions(-)
---
base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
change-id: 20231011-delay-verw-d0474986b2c3

Best regards,
-- 
Thanks,
Pawan



