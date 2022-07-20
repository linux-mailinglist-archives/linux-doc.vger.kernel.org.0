Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFF957AB7A
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jul 2022 03:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240477AbiGTBMN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jul 2022 21:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240629AbiGTBLv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 21:11:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9B96557E;
        Tue, 19 Jul 2022 18:11:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 92B3AB81DE3;
        Wed, 20 Jul 2022 01:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35137C341C6;
        Wed, 20 Jul 2022 01:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658279488;
        bh=fcEcJLBFvHhRWMODgSxdDfFs8k1/PcJfi4V45C8Q/Ds=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=inr3z6/nfT0G3isbdocnoWQRl3Hb4y6DDt4x9si0JFFKq5kCkkzpFKsrVTZuljSWC
         xk6ZgjzgsYRIQwWfGA5wVMYTNDeryYQMz7ez5hacd5CXfF+XoZh6kE/e/P1KgiOJAG
         FcNXUr7Kofr+31gsZT7NZz+SlMavrtFYhedHza2ljDVNz2A5lrcwYpz2xk+NxgtDB8
         mKFp0zsNujfrhzbZDtILFyEAUAF4g8JKpIHL+Dt9RLd2ZyP+hzexZeXBT6FYb/4+8i
         kIBgrAmV0Li56LqmeGzlWQj7KUXxLTurj7Y8rLMaSCbo5EHDgIKkK8O0KEAyGMp0IV
         6iqU/wNRQDTRA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alexandre Chartre <alexandre.chartre@oracle.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, paulmck@kernel.org,
        keescook@chromium.org, akpm@linux-foundation.org,
        rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
        pawan.kumar.gupta@linux.intel.com, kim.phillips@amd.com,
        sblbir@amazon.com, linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 14/54] x86/bugs: Add AMD retbleed= boot parameter
Date:   Tue, 19 Jul 2022 21:09:51 -0400
Message-Id: <20220720011031.1023305-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011031.1023305-1-sashal@kernel.org>
References: <20220720011031.1023305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alexandre Chartre <alexandre.chartre@oracle.com>

[ Upstream commit 7fbf47c7ce50b38a64576b150e7011ae73d54669 ]

Add the "retbleed=<value>" boot parameter to select a mitigation for
RETBleed. Possible values are "off", "auto" and "unret"
(JMP2RET mitigation). The default value is "auto".

Currently, "retbleed=auto" will select the unret mitigation on
AMD and Hygon and no mitigation on Intel (JMP2RET is not effective on
Intel).

  [peterz: rebase; add hygon]
  [jpoimboe: cleanups]

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../admin-guide/kernel-parameters.txt         |  15 +++
 arch/x86/Kconfig                              |   3 +
 arch/x86/kernel/cpu/bugs.c                    | 108 +++++++++++++++++-
 3 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c4893782055b..1af5341eb233 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5124,6 +5124,21 @@
 
 	retain_initrd	[RAM] Keep initrd memory after extraction
 
+	retbleed=	[X86] Control mitigation of RETBleed (Arbitrary
+			Speculative Code Execution with Return Instructions)
+			vulnerability.
+
+			off         - unconditionally disable
+			auto        - automatically select a migitation
+			unret       - force enable untrained return thunks,
+				      only effective on AMD Zen {1,2}
+				      based systems.
+
+			Selecting 'auto' will choose a mitigation method at run
+			time according to the CPU.
+
+			Not specifying this option is equivalent to retbleed=auto.
+
 	rfkill.default_state=
 		0	"airplane mode".  All wifi, bluetooth, wimax, gps, fm,
 			etc. communication is blocked by default.
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index b2c65f573353..c429a5c4f945 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -469,6 +469,9 @@ config RETPOLINE
 config CC_HAS_SLS
 	def_bool $(cc-option,-mharden-sls=all)
 
+config CC_HAS_RETURN_THUNK
+	def_bool $(cc-option,-mfunction-return=thunk-extern)
+
 config SLS
 	bool "Mitigate Straight-Line-Speculation"
 	depends on CC_HAS_SLS && X86_64
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 425ff2f32669..5fdf031fd694 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -37,6 +37,7 @@
 #include "cpu.h"
 
 static void __init spectre_v1_select_mitigation(void);
+static void __init retbleed_select_mitigation(void);
 static void __init spectre_v2_select_mitigation(void);
 static void __init ssb_select_mitigation(void);
 static void __init l1tf_select_mitigation(void);
@@ -120,6 +121,12 @@ void __init check_bugs(void)
 
 	/* Select the proper CPU mitigations before patching alternatives: */
 	spectre_v1_select_mitigation();
+	retbleed_select_mitigation();
+	/*
+	 * spectre_v2_select_mitigation() relies on the state set by
+	 * retbleed_select_mitigation(); specifically the STIBP selection is
+	 * forced for UNRET.
+	 */
 	spectre_v2_select_mitigation();
 	ssb_select_mitigation();
 	l1tf_select_mitigation();
@@ -745,6 +752,100 @@ static int __init nospectre_v1_cmdline(char *str)
 }
 early_param("nospectre_v1", nospectre_v1_cmdline);
 
+#undef pr_fmt
+#define pr_fmt(fmt)     "RETBleed: " fmt
+
+enum retbleed_mitigation {
+	RETBLEED_MITIGATION_NONE,
+	RETBLEED_MITIGATION_UNRET,
+};
+
+enum retbleed_mitigation_cmd {
+	RETBLEED_CMD_OFF,
+	RETBLEED_CMD_AUTO,
+	RETBLEED_CMD_UNRET,
+};
+
+const char * const retbleed_strings[] = {
+	[RETBLEED_MITIGATION_NONE]	= "Vulnerable",
+	[RETBLEED_MITIGATION_UNRET]	= "Mitigation: untrained return thunk",
+};
+
+static enum retbleed_mitigation retbleed_mitigation __ro_after_init =
+	RETBLEED_MITIGATION_NONE;
+static enum retbleed_mitigation_cmd retbleed_cmd __ro_after_init =
+	RETBLEED_CMD_AUTO;
+
+static int __init retbleed_parse_cmdline(char *str)
+{
+	if (!str)
+		return -EINVAL;
+
+	if (!strcmp(str, "off"))
+		retbleed_cmd = RETBLEED_CMD_OFF;
+	else if (!strcmp(str, "auto"))
+		retbleed_cmd = RETBLEED_CMD_AUTO;
+	else if (!strcmp(str, "unret"))
+		retbleed_cmd = RETBLEED_CMD_UNRET;
+	else
+		pr_err("Unknown retbleed option (%s). Defaulting to 'auto'\n", str);
+
+	return 0;
+}
+early_param("retbleed", retbleed_parse_cmdline);
+
+#define RETBLEED_UNTRAIN_MSG "WARNING: BTB untrained return thunk mitigation is only effective on AMD/Hygon!\n"
+#define RETBLEED_COMPILER_MSG "WARNING: kernel not compiled with RETPOLINE or -mfunction-return capable compiler!\n"
+
+static void __init retbleed_select_mitigation(void)
+{
+	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off())
+		return;
+
+	switch (retbleed_cmd) {
+	case RETBLEED_CMD_OFF:
+		return;
+
+	case RETBLEED_CMD_UNRET:
+		retbleed_mitigation = RETBLEED_MITIGATION_UNRET;
+		break;
+
+	case RETBLEED_CMD_AUTO:
+	default:
+		if (!boot_cpu_has_bug(X86_BUG_RETBLEED))
+			break;
+
+		if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
+		    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
+			retbleed_mitigation = RETBLEED_MITIGATION_UNRET;
+		break;
+	}
+
+	switch (retbleed_mitigation) {
+	case RETBLEED_MITIGATION_UNRET:
+
+		if (!IS_ENABLED(CONFIG_RETPOLINE) ||
+		    !IS_ENABLED(CONFIG_CC_HAS_RETURN_THUNK)) {
+			pr_err(RETBLEED_COMPILER_MSG);
+			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
+			break;
+		}
+
+		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
+		setup_force_cpu_cap(X86_FEATURE_UNRET);
+
+		if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
+		    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
+			pr_err(RETBLEED_UNTRAIN_MSG);
+		break;
+
+	default:
+		break;
+	}
+
+	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
+}
+
 #undef pr_fmt
 #define pr_fmt(fmt)     "Spectre V2 : " fmt
 
@@ -1989,7 +2090,12 @@ static ssize_t srbds_show_state(char *buf)
 
 static ssize_t retbleed_show_state(char *buf)
 {
-	return sprintf(buf, "Vulnerable\n");
+	if (retbleed_mitigation == RETBLEED_MITIGATION_UNRET &&
+	    (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
+	     boot_cpu_data.x86_vendor != X86_VENDOR_HYGON))
+		return sprintf(buf, "Vulnerable: untrained return thunk on non-Zen uarch\n");
+
+	return sprintf(buf, "%s\n", retbleed_strings[retbleed_mitigation]);
 }
 
 static ssize_t cpu_show_common(struct device *dev, struct device_attribute *attr,
-- 
2.35.1

