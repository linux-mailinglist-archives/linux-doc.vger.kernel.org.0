Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9A9278B7B
	for <lists+linux-doc@lfdr.de>; Fri, 25 Sep 2020 16:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgIYO6Q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Sep 2020 10:58:16 -0400
Received: from mga07.intel.com ([134.134.136.100]:47925 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729134AbgIYO6P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Sep 2020 10:58:15 -0400
IronPort-SDR: mhH12wAkb6euEdyEz7mpTa4gdNuNmYN5LME8MzqTojXey5+ICnWjWRlvbhUANdqdulSfrRXImf
 8XhRCS8nQVvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="225704488"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="225704488"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 07:58:14 -0700
IronPort-SDR: ByVBDmZe8R5Q3jrRfTehXGSoT6vkekq7Lm3P1KyPfW08+oqHmsDNW/FLh/n30+RzNplFg8ef9d
 HneBCcCXhWCw==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="512916971"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 07:58:14 -0700
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
Subject: [PATCH v13 4/8] x86/cet/ibt: ELF header parsing for Indirect Branch Tracking
Date:   Fri, 25 Sep 2020 07:58:00 -0700
Message-Id: <20200925145804.5821-5-yu-cheng.yu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925145804.5821-1-yu-cheng.yu@intel.com>
References: <20200925145804.5821-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update arch_setup_elf_property() for Indirect Branch Tracking.

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
---
v9:
- Change cpu_feature_enabled() to static_cpu_has().

 arch/x86/Kconfig             | 2 ++
 arch/x86/kernel/process_64.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15c7f2606c9d..cc9876f85e91 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1972,6 +1972,8 @@ config X86_BRANCH_TRACKING_USER
 	depends on CPU_SUP_INTEL && X86_64
 	depends on $(cc-option,-fcf-protection)
 	select X86_CET
+	select ARCH_USE_GNU_PROPERTY
+	select ARCH_BINFMT_ELF_STATE
 	help
 	  Indirect Branch Tracking (IBT) provides protection against
 	  CALL-/JMP-oriented programming attacks.  It is active when
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 8725e67bcd44..1147a1052a07 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -866,6 +866,14 @@ int arch_setup_elf_property(struct arch_elf_state *state)
 			r = cet_setup_shstk();
 	}
 
+	if (r < 0)
+		return r;
+
+	if (static_cpu_has(X86_FEATURE_IBT)) {
+		if (state->gnu_property & GNU_PROPERTY_X86_FEATURE_1_IBT)
+			r = cet_setup_ibt();
+	}
+
 	return r;
 }
 #endif
-- 
2.21.0

