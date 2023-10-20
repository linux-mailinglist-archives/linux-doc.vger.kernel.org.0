Return-Path: <linux-doc+bounces-713-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BEE7D1740
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 22:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3EF21C20F1A
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 20:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE7C200C4;
	Fri, 20 Oct 2023 20:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtQId4Tq"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDFE1802E
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 20:45:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA248D72;
	Fri, 20 Oct 2023 13:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697834704; x=1729370704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uGr8ClT2h4Zv+dGb/ooumBjLtEvJ/qtZo0hY1GnJHiw=;
  b=JtQId4Tq+iQT8NvWsje/7gQ+4wjmiFSQjQoSYO3NTHzd+QxGHX2E4WYI
   femvCycQI5en2W0y0weDxNYO9IStc15L2wbz5a8mtpUja2R15r/IOGqJM
   FWgiWue0E/yxhsNcDLd1YC4lgNAJ3tCO8eekbtpNfReSDNKFL6gYSn7O+
   8jj4E3GQQRsdsqHasxx8I/cwY6nV5khn990lJ3qTVpPvb2QNF+gNTh+RJ
   7z3LMW5LTxWCI2uqal+hxPNCQlW1RWiDcpumRNzdwsAv1FFZBOa+EYQKu
   AjhJ5cDllDFVcH0WdcebcdhLvf+6eEeSQ/ul4MWOguoCiM6JddsF5JQbU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="453048206"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="453048206"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5217189"
Received: from hkchanda-mobl.amr.corp.intel.com (HELO desk) ([10.209.90.113])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 13:43:52 -0700
Date: Fri, 20 Oct 2023 13:45:03 -0700
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
	Dave Hansen <dave.hansen@intel.com>
Subject: [PATCH  2/6] x86/entry_64: Add VERW just before userspace transition
Message-ID: <20231020-delay-verw-v1-2-cff54096326d@linux.intel.com>
X-Mailer: b4 0.12.3
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>

Mitigation for MDS is to use VERW instruction to clear any secrets in
CPU Buffers. Any memory accesses after VERW execution can still remain
in CPU buffers. It is safer to execute VERW late in return to user path
to minimize the window in which kernel data can end up in CPU buffers.
There are not many kernel secrets to be had after SWITCH_TO_USER_CR3.

Add support for deploying VERW mitigation after user register state is
restored. This helps minimize the chances of kernel data ending up into
CPU buffers after executing VERW.

Note that the mitigation at the new location is not yet enabled.

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/entry/entry_64.S        | 14 ++++++++++++++
 arch/x86/entry/entry_64_compat.S |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 43606de22511..e72ac30f0714 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -223,6 +223,8 @@ syscall_return_via_sysret:
 SYM_INNER_LABEL(entry_SYSRETQ_unsafe_stack, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	swapgs
+	/* Mitigate CPU data sampling attacks .e.g. MDS */
+	USER_CLEAR_CPU_BUFFERS
 	sysretq
 SYM_INNER_LABEL(entry_SYSRETQ_end, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
@@ -663,6 +665,10 @@ SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL)
 	/* Restore RDI. */
 	popq	%rdi
 	swapgs
+
+	/* Mitigate CPU data sampling attacks .e.g. MDS */
+	USER_CLEAR_CPU_BUFFERS
+
 	jmp	.Lnative_iret
 
 
@@ -774,6 +780,9 @@ native_irq_return_ldt:
 	 */
 	popq	%rax				/* Restore user RAX */
 
+	/* Mitigate CPU data sampling attacks .e.g. MDS */
+	USER_CLEAR_CPU_BUFFERS
+
 	/*
 	 * RSP now points to an ordinary IRET frame, except that the page
 	 * is read-only and RSP[31:16] are preloaded with the userspace
@@ -1502,6 +1511,9 @@ nmi_restore:
 	std
 	movq	$0, 5*8(%rsp)		/* clear "NMI executing" */
 
+	/* Mitigate CPU data sampling attacks .e.g. MDS */
+	USER_CLEAR_CPU_BUFFERS
+
 	/*
 	 * iretq reads the "iret" frame and exits the NMI stack in a
 	 * single instruction.  We are returning to kernel mode, so this
@@ -1520,6 +1532,8 @@ SYM_CODE_START(ignore_sysret)
 	UNWIND_HINT_END_OF_STACK
 	ENDBR
 	mov	$-ENOSYS, %eax
+	/* Mitigate CPU data sampling attacks .e.g. MDS */
+	USER_CLEAR_CPU_BUFFERS
 	sysretl
 SYM_CODE_END(ignore_sysret)
 #endif
diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
index 70150298f8bd..d2ccd9148239 100644
--- a/arch/x86/entry/entry_64_compat.S
+++ b/arch/x86/entry/entry_64_compat.S
@@ -271,6 +271,8 @@ SYM_INNER_LABEL(entry_SYSRETL_compat_unsafe_stack, SYM_L_GLOBAL)
 	xorl	%r9d, %r9d
 	xorl	%r10d, %r10d
 	swapgs
+	/* Mitigate CPU data sampling attacks .e.g. MDS */
+	USER_CLEAR_CPU_BUFFERS
 	sysretl
 SYM_INNER_LABEL(entry_SYSRETL_compat_end, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR

-- 
2.34.1



