Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB7A52002E
	for <lists+linux-doc@lfdr.de>; Mon,  9 May 2022 16:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237593AbiEIOrw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 May 2022 10:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237572AbiEIOru (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 10:47:50 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA989219346;
        Mon,  9 May 2022 07:43:56 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95490153B;
        Mon,  9 May 2022 07:43:56 -0700 (PDT)
Received: from e121896.arm.com (unknown [10.57.4.213])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 435393F73D;
        Mon,  9 May 2022 07:43:54 -0700 (PDT)
From:   James Clark <james.clark@arm.com>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, broonie@kernel.org
Cc:     german.gomez@arm.com, James Clark <james.clark@arm.com>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>, linux-doc@vger.kernel.org
Subject: [PATCH v1 6/6] perf tools: arm64: Add support for VG register
Date:   Mon,  9 May 2022 15:42:54 +0100
Message-Id: <20220509144257.1623063-7-james.clark@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20220509144257.1623063-1-james.clark@arm.com>
References: <20220509144257.1623063-1-james.clark@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the name of the VG register so it can be used in --user-regs

The event will fail to open if the register is requested but not
available so only add it to the mask if the kernel supports sve and also
if it supports that specific register.

Signed-off-by: James Clark <james.clark@arm.com>
---
 tools/perf/arch/arm64/util/perf_regs.c | 34 ++++++++++++++++++++++++++
 tools/perf/util/perf_regs.c            |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch/arm64/util/perf_regs.c
index 476b037eea1c..c0a921512a90 100644
--- a/tools/perf/arch/arm64/util/perf_regs.c
+++ b/tools/perf/arch/arm64/util/perf_regs.c
@@ -2,9 +2,11 @@
 #include <errno.h>
 #include <regex.h>
 #include <string.h>
+#include <sys/auxv.h>
 #include <linux/kernel.h>
 #include <linux/zalloc.h>
 
+#include "../../../perf-sys.h"
 #include "../../../util/debug.h"
 #include "../../../util/event.h"
 #include "../../../util/perf_regs.h"
@@ -43,6 +45,7 @@ const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(lr, PERF_REG_ARM64_LR),
 	SMPL_REG(sp, PERF_REG_ARM64_SP),
 	SMPL_REG(pc, PERF_REG_ARM64_PC),
+	SMPL_REG(vg, PERF_REG_ARM64_VG),
 	SMPL_REG_END
 };
 
@@ -131,3 +134,34 @@ int arch_sdt_arg_parse_op(char *old_op, char **new_op)
 
 	return SDT_ARG_VALID;
 }
+
+uint64_t arch__user_reg_mask(void)
+{
+	struct perf_event_attr attr = {
+		.type                   = PERF_TYPE_HARDWARE,
+		.config                 = PERF_COUNT_HW_CPU_CYCLES,
+		.sample_type            = PERF_SAMPLE_REGS_USER,
+		.disabled               = 1,
+		.exclude_kernel         = 1,
+		.sample_period		= 1,
+		.sample_regs_user	= PERF_REGS_MASK
+	};
+	int fd;
+
+	if (getauxval(AT_HWCAP) & HWCAP_SVE)
+		attr.sample_regs_user |= SMPL_REG_MASK(PERF_REG_ARM64_VG);
+
+	/*
+	 * Check if the pmu supports perf extended regs, before
+	 * returning the register mask to sample.
+	 */
+	if (attr.sample_regs_user != PERF_REGS_MASK) {
+		event_attr_init(&attr);
+		fd = sys_perf_event_open(&attr, 0, -1, -1, 0);
+		if (fd != -1) {
+			close(fd);
+			return attr.sample_regs_user;
+		}
+	}
+	return PERF_REGS_MASK;
+}
diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
index a982e40ee5a9..872dd3d38782 100644
--- a/tools/perf/util/perf_regs.c
+++ b/tools/perf/util/perf_regs.c
@@ -103,6 +103,8 @@ static const char *__perf_reg_name_arm64(int id)
 		return "lr";
 	case PERF_REG_ARM64_PC:
 		return "pc";
+	case PERF_REG_ARM64_VG:
+		return "vg";
 	default:
 		return NULL;
 	}
-- 
2.28.0

