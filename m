Return-Path: <linux-doc+bounces-9265-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F9085417E
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 03:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 565F11C286E6
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 02:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540F910A34;
	Wed, 14 Feb 2024 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJJxKrxl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC2D10A25;
	Wed, 14 Feb 2024 02:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707877348; cv=none; b=klb90+mRi0CVPuT8sgkz/N3OIZFth6w1vhq1Ys6pO2JzxDUvAk0h5Jtn5etws0giFe6CKT4eq4h3yKBRHNMQrk1jWmAJtLTfrnqdAL3kAHyy0pepIXAXJL9wrQIapCbrFRnsvvXvn5NEoTjPuz5YlHTziv2/aaZk1k0btjX9Ho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707877348; c=relaxed/simple;
	bh=+qrAwU7Ai29jF1VMtksHOHSiDckKmD+ywwD6BI5fBYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVn7RCsGi7KLHX/yHIzhcgCs1weXxCVWF0PtnV2GMycYKB67ihAPq1gz0QZYlyP4n3AI73lJ6DfR+0GzOrRU3M+m73t5jPAgoHy7KdLOsO2iz67fccANUVsc8YlB5lscQEk7aBtwqdI/cSzGFRejh3VXQnmEyCvubD7isGHXFs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJJxKrxl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707877346; x=1739413346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+qrAwU7Ai29jF1VMtksHOHSiDckKmD+ywwD6BI5fBYw=;
  b=GJJxKrxlKDAzDgtJ+zEVhIWH8ayJTMEo5Ar/1WGV43kJDdoYUDGAN933
   pf4hwihtYbBTthQpGVLOkWZEv77eGijVQ15OelB0kuHbTTOEhKeFOBgmE
   YIPdNoS6c7IFyH89wuAtD1dmKOrN5oEbOdhTMBVR3V6DVgTfYPftKEXUJ
   NvCiJ1a6QxW0zWDLbL02d0REj6+BQRyHRxs6/7OM9tH/QFAXpCUkyGI8z
   RLSTEHK6rYTjoy4Wbn+3OB0SVTLqsyqPQ5AFzduibSNH/j8KpZSBMqYXV
   EFVijmudC1EhL97MJ5dK6HBHbitkMrb3MFrrQOWELWm3OIvyoLVtp+rAn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13297980"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="13297980"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 18:22:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="826284913"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="826284913"
Received: from diegoavi-mobl.amr.corp.intel.com (HELO desk) ([10.255.230.185])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 18:22:24 -0800
Date: Tue, 13 Feb 2024 18:22:24 -0800
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
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Nikolay Borisov <nik.borisov@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com
Subject: [PATCH  v8 4/6] x86/bugs: Use ALTERNATIVE() instead of
 mds_user_clear static key
Message-ID: <20240213-delay-verw-v8-4-a6216d83edb7@linux.intel.com>
X-Mailer: b4 0.12.3
References: <20240213-delay-verw-v8-0-a6216d83edb7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213-delay-verw-v8-0-a6216d83edb7@linux.intel.com>

The VERW mitigation at exit-to-user is enabled via a static branch
mds_user_clear. This static branch is never toggled after boot, and can
be safely replaced with an ALTERNATIVE() which is convenient to use in
asm.

Switch to ALTERNATIVE() to use the VERW mitigation late in exit-to-user
path. Also remove the now redundant VERW in exc_nmi() and
arch_exit_to_user_mode().

Cc: stable@kernel.org
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 Documentation/arch/x86/mds.rst       | 38 +++++++++++++++++++++++++-----------
 arch/x86/include/asm/entry-common.h  |  1 -
 arch/x86/include/asm/nospec-branch.h | 12 ------------
 arch/x86/kernel/cpu/bugs.c           | 15 ++++++--------
 arch/x86/kernel/nmi.c                |  3 ---
 arch/x86/kvm/vmx/vmx.c               |  2 +-
 6 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/Documentation/arch/x86/mds.rst b/Documentation/arch/x86/mds.rst
index e73fdff62c0a..c58c72362911 100644
--- a/Documentation/arch/x86/mds.rst
+++ b/Documentation/arch/x86/mds.rst
@@ -95,6 +95,9 @@ The kernel provides a function to invoke the buffer clearing:
 
     mds_clear_cpu_buffers()
 
+Also macro CLEAR_CPU_BUFFERS can be used in ASM late in exit-to-user path.
+Other than CFLAGS.ZF, this macro doesn't clobber any registers.
+
 The mitigation is invoked on kernel/userspace, hypervisor/guest and C-state
 (idle) transitions.
 
@@ -138,17 +141,30 @@ Mitigation points
 
    When transitioning from kernel to user space the CPU buffers are flushed
    on affected CPUs when the mitigation is not disabled on the kernel
-   command line. The migitation is enabled through the static key
-   mds_user_clear.
-
-   The mitigation is invoked in prepare_exit_to_usermode() which covers
-   all but one of the kernel to user space transitions.  The exception
-   is when we return from a Non Maskable Interrupt (NMI), which is
-   handled directly in do_nmi().
-
-   (The reason that NMI is special is that prepare_exit_to_usermode() can
-    enable IRQs.  In NMI context, NMIs are blocked, and we don't want to
-    enable IRQs with NMIs blocked.)
+   command line. The mitigation is enabled through the feature flag
+   X86_FEATURE_CLEAR_CPU_BUF.
+
+   The mitigation is invoked just before transitioning to userspace after
+   user registers are restored. This is done to minimize the window in
+   which kernel data could be accessed after VERW e.g. via an NMI after
+   VERW.
+
+   **Corner case not handled**
+   Interrupts returning to kernel don't clear CPUs buffers since the
+   exit-to-user path is expected to do that anyways. But, there could be
+   a case when an NMI is generated in kernel after the exit-to-user path
+   has cleared the buffers. This case is not handled and NMI returning to
+   kernel don't clear CPU buffers because:
+
+   1. It is rare to get an NMI after VERW, but before returning to userspace.
+   2. For an unprivileged user, there is no known way to make that NMI
+      less rare or target it.
+   3. It would take a large number of these precisely-timed NMIs to mount
+      an actual attack.  There's presumably not enough bandwidth.
+   4. The NMI in question occurs after a VERW, i.e. when user state is
+      restored and most interesting data is already scrubbed. Whats left
+      is only the data that NMI touches, and that may or may not be of
+      any interest.
 
 
 2. C-State transition
diff --git a/arch/x86/include/asm/entry-common.h b/arch/x86/include/asm/entry-common.h
index ce8f50192ae3..7e523bb3d2d3 100644
--- a/arch/x86/include/asm/entry-common.h
+++ b/arch/x86/include/asm/entry-common.h
@@ -91,7 +91,6 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 
 static __always_inline void arch_exit_to_user_mode(void)
 {
-	mds_user_clear_cpu_buffers();
 	amd_clear_divider();
 }
 #define arch_exit_to_user_mode arch_exit_to_user_mode
diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
index da1b5a20dea2..fc3a8a3c7ffe 100644
--- a/arch/x86/include/asm/nospec-branch.h
+++ b/arch/x86/include/asm/nospec-branch.h
@@ -533,7 +533,6 @@ DECLARE_STATIC_KEY_FALSE(switch_to_cond_stibp);
 DECLARE_STATIC_KEY_FALSE(switch_mm_cond_ibpb);
 DECLARE_STATIC_KEY_FALSE(switch_mm_always_ibpb);
 
-DECLARE_STATIC_KEY_FALSE(mds_user_clear);
 DECLARE_STATIC_KEY_FALSE(mds_idle_clear);
 
 DECLARE_STATIC_KEY_FALSE(switch_mm_cond_l1d_flush);
@@ -567,17 +566,6 @@ static __always_inline void mds_clear_cpu_buffers(void)
 	asm volatile("verw %[ds]" : : [ds] "m" (ds) : "cc");
 }
 
-/**
- * mds_user_clear_cpu_buffers - Mitigation for MDS and TAA vulnerability
- *
- * Clear CPU buffers if the corresponding static key is enabled
- */
-static __always_inline void mds_user_clear_cpu_buffers(void)
-{
-	if (static_branch_likely(&mds_user_clear))
-		mds_clear_cpu_buffers();
-}
-
 /**
  * mds_idle_clear_cpu_buffers - Mitigation for MDS vulnerability
  *
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index a78892b0f823..b34c21d73239 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -111,9 +111,6 @@ DEFINE_STATIC_KEY_FALSE(switch_mm_cond_ibpb);
 /* Control unconditional IBPB in switch_mm() */
 DEFINE_STATIC_KEY_FALSE(switch_mm_always_ibpb);
 
-/* Control MDS CPU buffer clear before returning to user space */
-DEFINE_STATIC_KEY_FALSE(mds_user_clear);
-EXPORT_SYMBOL_GPL(mds_user_clear);
 /* Control MDS CPU buffer clear before idling (halt, mwait) */
 DEFINE_STATIC_KEY_FALSE(mds_idle_clear);
 EXPORT_SYMBOL_GPL(mds_idle_clear);
@@ -252,7 +249,7 @@ static void __init mds_select_mitigation(void)
 		if (!boot_cpu_has(X86_FEATURE_MD_CLEAR))
 			mds_mitigation = MDS_MITIGATION_VMWERV;
 
-		static_branch_enable(&mds_user_clear);
+		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
 
 		if (!boot_cpu_has(X86_BUG_MSBDS_ONLY) &&
 		    (mds_nosmt || cpu_mitigations_auto_nosmt()))
@@ -356,7 +353,7 @@ static void __init taa_select_mitigation(void)
 	 * For guests that can't determine whether the correct microcode is
 	 * present on host, enable the mitigation for UCODE_NEEDED as well.
 	 */
-	static_branch_enable(&mds_user_clear);
+	setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
 
 	if (taa_nosmt || cpu_mitigations_auto_nosmt())
 		cpu_smt_disable(false);
@@ -424,7 +421,7 @@ static void __init mmio_select_mitigation(void)
 	 */
 	if (boot_cpu_has_bug(X86_BUG_MDS) || (boot_cpu_has_bug(X86_BUG_TAA) &&
 					      boot_cpu_has(X86_FEATURE_RTM)))
-		static_branch_enable(&mds_user_clear);
+		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
 	else
 		static_branch_enable(&mmio_stale_data_clear);
 
@@ -484,12 +481,12 @@ static void __init md_clear_update_mitigation(void)
 	if (cpu_mitigations_off())
 		return;
 
-	if (!static_key_enabled(&mds_user_clear))
+	if (!boot_cpu_has(X86_FEATURE_CLEAR_CPU_BUF))
 		goto out;
 
 	/*
-	 * mds_user_clear is now enabled. Update MDS, TAA and MMIO Stale Data
-	 * mitigation, if necessary.
+	 * X86_FEATURE_CLEAR_CPU_BUF is now enabled. Update MDS, TAA and MMIO
+	 * Stale Data mitigation, if necessary.
 	 */
 	if (mds_mitigation == MDS_MITIGATION_OFF &&
 	    boot_cpu_has_bug(X86_BUG_MDS)) {
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index db1c1848a1e6..604d8c996d9c 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -564,9 +564,6 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
 	}
 	if (this_cpu_dec_return(nmi_state))
 		goto nmi_restart;
-
-	if (user_mode(regs))
-		mds_user_clear_cpu_buffers();
 }
 
 #if IS_ENABLED(CONFIG_KVM_INTEL)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index fd19ef314bcb..40594eae2cd3 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7230,7 +7230,7 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	/* L1D Flush includes CPU buffer clear to mitigate MDS */
 	if (static_branch_unlikely(&vmx_l1d_should_flush))
 		vmx_l1d_flush(vcpu);
-	else if (static_branch_unlikely(&mds_user_clear))
+	else if (cpu_feature_enabled(X86_FEATURE_CLEAR_CPU_BUF))
 		mds_clear_cpu_buffers();
 	else if (static_branch_unlikely(&mmio_stale_data_clear) &&
 		 kvm_arch_has_assigned_device(vcpu->kvm))

-- 
2.34.1



