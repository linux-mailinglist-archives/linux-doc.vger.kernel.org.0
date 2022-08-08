Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB5158BF63
	for <lists+linux-doc@lfdr.de>; Mon,  8 Aug 2022 03:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242598AbiHHBio (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 7 Aug 2022 21:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242445AbiHHBiI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 7 Aug 2022 21:38:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CB0E099;
        Sun,  7 Aug 2022 18:33:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B242760DE1;
        Mon,  8 Aug 2022 01:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E787C433C1;
        Mon,  8 Aug 2022 01:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659922434;
        bh=FWv5uPftX5X9X1NDJjuD0spInpQjykRjrgL+U5sBl1E=;
        h=From:To:Cc:Subject:Date:From;
        b=pX9BDYyxAd9JvU3xGyU8/uD6k6j5BWYhBt05dKlW7RIHIRsWH3f7D+TTU7KRBnvhP
         LciVozSZy+dEp3b+MvKFaFhJvskcIIKSyrOIT84XJUodTMgrC9AHz3GG+Kwm6ICSKH
         yd8QuSBWwQo4P4d2deSCopN2C23jI/NHG+KmBMRQlFAWXftLrcPMcupvmVcVXtx4xv
         eLSB8/dZXLsYyAvFy9YHL47Eo9DCH+x+m1KrHJxTBeQdPCClTSBDuZIOJCNBqudk/i
         GxUDs9g4++KROBZFDiKFXU/NV4xaUw3TtkV+OZjpwF9YOQpFrKEI0NbIAhuglX6INd
         VXfGHGXskQAog==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wyes Karny <wyes.karny@amd.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Sasha Levin <sashal@kernel.org>, rafael@kernel.org,
        daniel.lezcano@linaro.org, corbet@lwn.net, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        peterz@infradead.org, chang.seok.bae@intel.com,
        ebiederm@xmission.com, zhengqi.arch@bytedance.com,
        linux-pm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 01/53] x86: Handle idle=nomwait cmdline properly for x86_idle
Date:   Sun,  7 Aug 2022 21:32:56 -0400
Message-Id: <20220808013350.314757-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wyes Karny <wyes.karny@amd.com>

[ Upstream commit 8bcedb4ce04750e1ccc9a6b6433387f6a9166a56 ]

When kernel is booted with idle=nomwait do not use MWAIT as the
default idle state.

If the user boots the kernel with idle=nomwait, it is a clear
direction to not use mwait as the default idle state.
However, the current code does not take this into consideration
while selecting the default idle state on x86.

Fix it by checking for the idle=nomwait boot option in
prefer_mwait_c1_over_halt().

Also update the documentation around idle=nomwait appropriately.

[ dhansen: tweak commit message ]

Signed-off-by: Wyes Karny <wyes.karny@amd.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Tested-by: Zhang Rui <rui.zhang@intel.com>
Link: https://lkml.kernel.org/r/fdc2dc2d0a1bc21c2f53d989ea2d2ee3ccbc0dbe.1654538381.git-series.wyes.karny@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/admin-guide/pm/cpuidle.rst | 15 +++++++++------
 arch/x86/kernel/process.c                |  9 ++++++---
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/pm/cpuidle.rst b/Documentation/admin-guide/pm/cpuidle.rst
index aec2cd2aaea7..19754beb5a4e 100644
--- a/Documentation/admin-guide/pm/cpuidle.rst
+++ b/Documentation/admin-guide/pm/cpuidle.rst
@@ -612,8 +612,8 @@ the ``menu`` governor to be used on the systems that use the ``ladder`` governor
 by default this way, for example.
 
 The other kernel command line parameters controlling CPU idle time management
-described below are only relevant for the *x86* architecture and some of
-them affect Intel processors only.
+described below are only relevant for the *x86* architecture and references
+to ``intel_idle`` affect Intel processors only.
 
 The *x86* architecture support code recognizes three kernel command line
 options related to CPU idle time management: ``idle=poll``, ``idle=halt``,
@@ -635,10 +635,13 @@ idle, so it very well may hurt single-thread computations performance as well as
 energy-efficiency.  Thus using it for performance reasons may not be a good idea
 at all.]
 
-The ``idle=nomwait`` option disables the ``intel_idle`` driver and causes
-``acpi_idle`` to be used (as long as all of the information needed by it is
-there in the system's ACPI tables), but it is not allowed to use the
-``MWAIT`` instruction of the CPUs to ask the hardware to enter idle states.
+The ``idle=nomwait`` option prevents the use of ``MWAIT`` instruction of
+the CPU to enter idle states. When this option is used, the ``acpi_idle``
+driver will use the ``HLT`` instruction instead of ``MWAIT``. On systems
+running Intel processors, this option disables the ``intel_idle`` driver
+and forces the use of the ``acpi_idle`` driver instead. Note that in either
+case, ``acpi_idle`` driver will function only if all the information needed
+by it is in the system's ACPI tables.
 
 In addition to the architecture-level kernel command line options affecting CPU
 idle time management, there are parameters affecting individual ``CPUIdle``
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 622dc3673c37..8011536ba5c4 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -824,6 +824,10 @@ static void amd_e400_idle(void)
  */
 static int prefer_mwait_c1_over_halt(const struct cpuinfo_x86 *c)
 {
+	/* User has disallowed the use of MWAIT. Fallback to HALT */
+	if (boot_option_idle_override == IDLE_NOMWAIT)
+		return 0;
+
 	if (c->x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
@@ -932,9 +936,8 @@ static int __init idle_setup(char *str)
 	} else if (!strcmp(str, "nomwait")) {
 		/*
 		 * If the boot option of "idle=nomwait" is added,
-		 * it means that mwait will be disabled for CPU C2/C3
-		 * states. In such case it won't touch the variable
-		 * of boot_option_idle_override.
+		 * it means that mwait will be disabled for CPU C1/C2/C3
+		 * states.
 		 */
 		boot_option_idle_override = IDLE_NOMWAIT;
 	} else
-- 
2.35.1

