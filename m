Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2E3278B82
	for <lists+linux-doc@lfdr.de>; Fri, 25 Sep 2020 16:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729167AbgIYO6R (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Sep 2020 10:58:17 -0400
Received: from mga07.intel.com ([134.134.136.100]:47916 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729123AbgIYO6O (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Sep 2020 10:58:14 -0400
IronPort-SDR: MrXJ7xGY8+7ECUF0FjZFGr/TEL082SvcJdOiJZUsErwWsUlW6lZ+3F5783LT4MXxClGJUtoOVP
 62hwNZ7FctYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="225704482"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="225704482"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 07:58:14 -0700
IronPort-SDR: dfbruIsKSdLkIzJd2sNrV54uUbD038MUuLRSp0Cl1fv5L55B1OtnAuoPQEM4ZkLFx7Fcd8WGtj
 9ug7hOcugZ5g==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="512916962"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 07:58:13 -0700
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
Subject: [PATCH v13 2/8] x86/cet/ibt: User-mode Indirect Branch Tracking support
Date:   Fri, 25 Sep 2020 07:57:58 -0700
Message-Id: <20200925145804.5821-3-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925145804.5821-1-yu-cheng.yu@intel.com>
References: <20200925145804.5821-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introduce user-mode Indirect Branch Tracking (IBT) support.  Update setup
routines to include IBT.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
v10:
- Change no_cet_ibt to no_user_ibt.

v9:
- Change cpu_feature_enabled() to static_cpu_has().

v2:
- Change noibt to no_cet_ibt.

 arch/x86/include/asm/cet.h                    |  3 ++
 arch/x86/include/asm/disabled-features.h      |  8 ++++-
 arch/x86/kernel/cet.c                         | 33 +++++++++++++++++++
 arch/x86/kernel/cpu/common.c                  | 17 ++++++++++
 .../arch/x86/include/asm/disabled-features.h  |  8 ++++-
 5 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cet.h b/arch/x86/include/asm/cet.h
index 16870e5bc8eb..3a1cba579cb2 100644
--- a/arch/x86/include/asm/cet.h
+++ b/arch/x86/include/asm/cet.h
@@ -15,6 +15,7 @@ struct cet_status {
 	unsigned long	shstk_base;
 	unsigned long	shstk_size;
 	unsigned int	locked:1;
+	unsigned int	ibt_enabled:1;
 };
 
 #ifdef CONFIG_X86_CET
@@ -26,6 +27,8 @@ void cet_free_shstk(struct task_struct *p);
 int cet_verify_rstor_token(bool ia32, unsigned long ssp, unsigned long *new_ssp);
 void cet_restore_signal(struct sc_ext *sc);
 int cet_setup_signal(bool ia32, unsigned long rstor, struct sc_ext *sc);
+int cet_setup_ibt(void);
+void cet_disable_ibt(void);
 #else
 static inline int prctl_cet(int option, u64 arg2) { return -EINVAL; }
 static inline int cet_setup_thread_shstk(struct task_struct *p,
diff --git a/arch/x86/include/asm/disabled-features.h b/arch/x86/include/asm/disabled-features.h
index edac76ed75e7..e7096a1e2698 100644
--- a/arch/x86/include/asm/disabled-features.h
+++ b/arch/x86/include/asm/disabled-features.h
@@ -62,6 +62,12 @@
 #define DISABLE_SHSTK	(1<<(X86_FEATURE_SHSTK & 31))
 #endif
 
+#ifdef CONFIG_X86_BRANCH_TRACKING_USER
+#define DISABLE_IBT	0
+#else
+#define DISABLE_IBT	(1<<(X86_FEATURE_IBT & 31))
+#endif
+
 /*
  * Make sure to add features to the correct mask
  */
@@ -83,7 +89,7 @@
 #define DISABLED_MASK15	0
 #define DISABLED_MASK16	(DISABLE_PKU|DISABLE_OSPKE|DISABLE_LA57|DISABLE_UMIP|DISABLE_SHSTK)
 #define DISABLED_MASK17	0
-#define DISABLED_MASK18	0
+#define DISABLED_MASK18	(DISABLE_IBT)
 #define DISABLED_MASK_CHECK BUILD_BUG_ON_ZERO(NCAPINTS != 19)
 
 #endif /* _ASM_X86_DISABLED_FEATURES_H */
diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
index b285c726bb88..e95fadb264f7 100644
--- a/arch/x86/kernel/cet.c
+++ b/arch/x86/kernel/cet.c
@@ -13,6 +13,8 @@
 #include <linux/uaccess.h>
 #include <linux/sched/signal.h>
 #include <linux/compat.h>
+#include <linux/vmalloc.h>
+#include <linux/bitops.h>
 #include <asm/msr.h>
 #include <asm/user.h>
 #include <asm/fpu/internal.h>
@@ -341,3 +343,34 @@ int cet_setup_signal(bool ia32, unsigned long rstor_addr, struct sc_ext *sc_ext)
 
 	return 0;
 }
+
+int cet_setup_ibt(void)
+{
+	u64 msr_val;
+
+	if (!static_cpu_has(X86_FEATURE_IBT))
+		return -EOPNOTSUPP;
+
+	start_update_msrs();
+	rdmsrl(MSR_IA32_U_CET, msr_val);
+	msr_val |= (CET_ENDBR_EN | CET_NO_TRACK_EN);
+	wrmsrl(MSR_IA32_U_CET, msr_val);
+	end_update_msrs();
+	current->thread.cet.ibt_enabled = 1;
+	return 0;
+}
+
+void cet_disable_ibt(void)
+{
+	u64 msr_val;
+
+	if (!static_cpu_has(X86_FEATURE_IBT))
+		return;
+
+	start_update_msrs();
+	rdmsrl(MSR_IA32_U_CET, msr_val);
+	msr_val &= CET_SHSTK_EN;
+	wrmsrl(MSR_IA32_U_CET, msr_val);
+	end_update_msrs();
+	current->thread.cet.ibt_enabled = 0;
+}
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 084480f975aa..909b4160a2d2 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -536,6 +536,23 @@ static __init int setup_disable_shstk(char *s)
 __setup("no_user_shstk", setup_disable_shstk);
 #endif
 
+#ifdef CONFIG_X86_BRANCH_TRACKING_USER
+static __init int setup_disable_ibt(char *s)
+{
+	/* require an exact match without trailing characters */
+	if (s[0] != '\0')
+		return 0;
+
+	if (!boot_cpu_has(X86_FEATURE_IBT))
+		return 1;
+
+	setup_clear_cpu_cap(X86_FEATURE_IBT);
+	pr_info("x86: 'no_user_ibt' specified, disabling user Branch Tracking\n");
+	return 1;
+}
+__setup("no_user_ibt", setup_disable_ibt);
+#endif
+
 /*
  * Some CPU features depend on higher CPUID levels, which may not always
  * be available due to CPUID level capping or broken virtualization
diff --git a/tools/arch/x86/include/asm/disabled-features.h b/tools/arch/x86/include/asm/disabled-features.h
index edac76ed75e7..e7096a1e2698 100644
--- a/tools/arch/x86/include/asm/disabled-features.h
+++ b/tools/arch/x86/include/asm/disabled-features.h
@@ -62,6 +62,12 @@
 #define DISABLE_SHSTK	(1<<(X86_FEATURE_SHSTK & 31))
 #endif
 
+#ifdef CONFIG_X86_BRANCH_TRACKING_USER
+#define DISABLE_IBT	0
+#else
+#define DISABLE_IBT	(1<<(X86_FEATURE_IBT & 31))
+#endif
+
 /*
  * Make sure to add features to the correct mask
  */
@@ -83,7 +89,7 @@
 #define DISABLED_MASK15	0
 #define DISABLED_MASK16	(DISABLE_PKU|DISABLE_OSPKE|DISABLE_LA57|DISABLE_UMIP|DISABLE_SHSTK)
 #define DISABLED_MASK17	0
-#define DISABLED_MASK18	0
+#define DISABLED_MASK18	(DISABLE_IBT)
 #define DISABLED_MASK_CHECK BUILD_BUG_ON_ZERO(NCAPINTS != 19)
 
 #endif /* _ASM_X86_DISABLED_FEATURES_H */
-- 
2.21.0

