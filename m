Return-Path: <linux-doc+bounces-711-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4016C7D1737
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 22:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6344B1C20FAD
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 20:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41428200C4;
	Fri, 20 Oct 2023 20:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e36Z8xLN"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686D21802E
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 20:44:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAF8D65;
	Fri, 20 Oct 2023 13:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697834692; x=1729370692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=38wj3+AjNVxWWV3WPeb/jr+UC7EuSUjYbl9ae7BtyNQ=;
  b=e36Z8xLNLl1oM53jLwKz5bUamHO4f3LS/s+kx57CdBaeFcwbVtaXKrLO
   YkxQFXGGwSOjVTGH3V2COIS4bVmfGyyHNQLothNxLr9/KdLNV45SDsKbp
   zwlgzy6uS/JHbf+dMWNkpN4qPxhiXBoruCDZ/wO7VIQwV3hflvhw9+4YK
   NT7JR42alSEwU1EuiwyWBs8H43wNJzzXyJN/8mO//4RB+k2NfL08ZHvdM
   VfA3EqeYKJAGrJjOESUygw3+ZM7dvOyPeBWUCKNqO5hBGBjT2ypj4/4Le
   bcELsdemZFjjVLkO9Ad6ouSV2bWdrHBRnEpmlM5GG8u3JA81fEkTNY4b1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371640165"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="371640165"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="931117461"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="931117461"
Received: from hkchanda-mobl.amr.corp.intel.com (HELO desk) ([10.209.90.113])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:44:51 -0700
Date: Fri, 20 Oct 2023 13:44:51 -0700
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
Subject: [PATCH 0/6] Delay VERW
Message-ID: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAMvlMmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA0ND3ZTUnMRK3bLUonLdFAMTcxNLC7Mko2RjJaCGgqLUtMwKsGHRSkq
 xtbUAkPe9LV4AAAA=
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
Patch 5: Cleans up C implementation.
Patch 6: Adds macro to VMenter.

Below is some performance data collected on a Skylake client compared
with previous implementation:

Baseline: v6.6-rc5

| Test               | Configuration          | Relative |
| ------------------ | ---------------------- | -------- |
| build-linux-kernel | defconfig              | 1.00     |
| hackbench          | 32 - Process           | 1.02     |
| nginx              | Short Connection - 500 | 1.01     |

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
Pawan Gupta (6):
      x86/bugs: Add asm helpers for executing VERW
      x86/entry_64: Add VERW just before userspace transition
      x86/entry_32: Add VERW just before userspace transition
      x86/bugs: Use ALTERNATIVE() instead of mds_user_clear static key
      x86/bugs: Cleanup mds_user_clear
      KVM: VMX: Move VERW closer to VMentry for MDS mitigation

 Documentation/arch/x86/mds.rst       | 20 +++++++++----------
 arch/x86/entry/entry_32.S            |  8 ++++++++
 arch/x86/entry/entry_64.S            | 14 ++++++++++++++
 arch/x86/entry/entry_64_compat.S     |  2 ++
 arch/x86/include/asm/cpufeatures.h   |  2 +-
 arch/x86/include/asm/entry-common.h  |  1 -
 arch/x86/include/asm/nospec-branch.h | 37 ++++++++++++++++++++++++------------
 arch/x86/kernel/cpu/bugs.c           | 13 +++++--------
 arch/x86/kernel/nmi.c                |  2 --
 arch/x86/kvm/vmx/vmenter.S           |  9 +++++++++
 arch/x86/kvm/vmx/vmx.c               | 10 +++++++---
 11 files changed, 80 insertions(+), 38 deletions(-)
---
base-commit: 58720809f52779dc0f08e53e54b014209d13eebb
change-id: 20231011-delay-verw-d0474986b2c3

Best regards,
-- 
Thanks,
Pawan



