Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4462E74C5
	for <lists+linux-doc@lfdr.de>; Tue, 29 Dec 2020 22:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgL2VfT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Dec 2020 16:35:19 -0500
Received: from mga09.intel.com ([134.134.136.24]:31873 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727250AbgL2VfR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Dec 2020 16:35:17 -0500
IronPort-SDR: GRTS3S3TxjjnHaMnq96s1/gdHRczAtc9Svdu4AMSyXI0Cwp183RuLKHW5sZ3NwW3KoOEwzjx1s
 xapKWzR199vA==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="176695627"
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="176695627"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 13:34:20 -0800
IronPort-SDR: EBqVUruKrLL9PCjCNgGQ0Hqf2tWRGQJTHACWCirAETqjSWPR+fxkD1HPMPrOBCIv0+8HYd30Lw
 KvaTBjT4S+6A==
X-IronPort-AV: E=Sophos;i="5.78,459,1599548400"; 
   d="scan'208";a="376190126"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 13:34:19 -0800
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
Subject: [PATCH v17 3/7] x86/cet/ibt: Handle signals for Indirect Branch Tracking
Date:   Tue, 29 Dec 2020 13:33:46 -0800
Message-Id: <20201229213350.17010-4-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201229213350.17010-1-yu-cheng.yu@intel.com>
References: <20201229213350.17010-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When an indirect CALL/JMP instruction is executed and before it reaches
the target, it is in 'WAIT_ENDBR' status, which can be read from
MSR_IA32_U_CET.  The status is part of a task's status before a signal is
raised and preserved in the signal frame.  It is restored for sigreturn.

IBT state machine is described in Intel SDM Vol. 1, Sec. 18.3.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
 arch/x86/kernel/cet.c        | 27 +++++++++++++++++++++++++--
 arch/x86/kernel/fpu/signal.c |  8 +++++---
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
index fff0b35ed0d9..68d602aecb1c 100644
--- a/arch/x86/kernel/cet.c
+++ b/arch/x86/kernel/cet.c
@@ -295,6 +295,13 @@ void cet_restore_signal(struct sc_ext *sc_ext)
 		msr_val |= CET_SHSTK_EN;
 	}
 
+	if (cet->ibt_enabled) {
+		msr_val |= (CET_ENDBR_EN | CET_NO_TRACK_EN);
+
+		if (sc_ext->wait_endbr)
+			msr_val |= CET_WAIT_ENDBR;
+	}
+
 	if (test_thread_flag(TIF_NEED_FPU_LOAD))
 		cet_user_state->user_cet = msr_val;
 	else
@@ -335,9 +342,25 @@ int cet_setup_signal(bool ia32, unsigned long rstor_addr, struct sc_ext *sc_ext)
 		sc_ext->ssp = new_ssp;
 	}
 
-	if (ssp) {
+	if (ssp || cet->ibt_enabled) {
+
 		start_update_msrs();
-		wrmsrl(MSR_IA32_PL3_SSP, ssp);
+
+		if (ssp)
+			wrmsrl(MSR_IA32_PL3_SSP, ssp);
+
+		if (cet->ibt_enabled) {
+			u64 r;
+
+			rdmsrl(MSR_IA32_U_CET, r);
+
+			if (r & CET_WAIT_ENDBR) {
+				sc_ext->wait_endbr = 1;
+				r &= ~CET_WAIT_ENDBR;
+				wrmsrl(MSR_IA32_U_CET, r);
+			}
+		}
+
 		end_update_msrs();
 	}
 
diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index d5d02b34f516..50f28b37e093 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -57,7 +57,8 @@ int save_cet_to_sigframe(int ia32, void __user *fp, unsigned long restorer)
 {
 	int err = 0;
 
-	if (!current->thread.cet.shstk_size)
+	if (!current->thread.cet.shstk_size &&
+	    !current->thread.cet.ibt_enabled)
 		return 0;
 
 	if (fp) {
@@ -89,7 +90,8 @@ static int get_cet_from_sigframe(int ia32, void __user *fp, struct sc_ext *ext)
 
 	memset(ext, 0, sizeof(*ext));
 
-	if (!current->thread.cet.shstk_size)
+	if (!current->thread.cet.shstk_size &&
+	    !current->thread.cet.ibt_enabled)
 		return 0;
 
 	if (fp) {
@@ -577,7 +579,7 @@ static unsigned long fpu__alloc_sigcontext_ext(unsigned long sp)
 	 * sigcontext_ext is at: fpu + fpu_user_xstate_size +
 	 * FP_XSTATE_MAGIC2_SIZE, then aligned to 8.
 	 */
-	if (cet->shstk_size)
+	if (cet->shstk_size || cet->ibt_enabled)
 		sp -= (sizeof(struct sc_ext) + 8);
 
 	return sp;
-- 
2.21.0

