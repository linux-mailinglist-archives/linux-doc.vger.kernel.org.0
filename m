Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37B16E1225
	for <lists+linux-doc@lfdr.de>; Thu, 13 Apr 2023 18:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjDMQVj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Apr 2023 12:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjDMQVj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 12:21:39 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD9310F8
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:21:36 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e16so1497699wra.6
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681402895; x=1683994895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1fA6CDd78niyqln6Gu6KuEtFWyF8BCngFGkehjm11k=;
        b=KsuWtbuKE6kV5riIBT3dHBEvITKwn281TlmrvffMdwlKcOhpeCDLvKYlIo3gt41x+e
         gNOFiaGcZ4rPAtX8YwlpGRPAzSCF4xoumcC9a+Kd40rTBex44R94Y8Sq1Uutmd0TW95X
         JW0e2/wtHgBR6UJGxDpLoC2AEBxuKNejIm1wj7GgfNiw8AAj/xHXWSUJsdEzZ8xfPvCo
         5OSnbFlkH/ITAYKGe6SVZp7KIWRSRQkMcTOblIlmpgI5hYjTY2zx8kyn5+gb6VhfsdkR
         qRfF0rfBrjBBqivnoWdt+FoSXymtU5o3Cyg7IjfOndDhP8WIOUb5bdLPURXyYiZvCzoN
         +XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402895; x=1683994895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1fA6CDd78niyqln6Gu6KuEtFWyF8BCngFGkehjm11k=;
        b=bsUFDrKeL7gwKStwplVhvVdSB3aPnys3fZ7rvtxi2PKyqBVMX301Iz3EPiiAOINB3V
         Kq458d5dn7mxYeV4PMSWbHzgv9AtrFt+52QqAnSS+I6Z85TjjpSaDWc5vGozRd8K9W4y
         qXlSOAPd1bh16RC9S/wriPayDvV9q3yUVi1UBZyHfj1Bq0DPEWWaSuTB1KmOoGfa+1+p
         M9znYxkZIIyQosCBbI01Vmx/Vv52KzwRmbcRcZfJuwhfHref4/A9POdlJEN35ETj9aOF
         Mvg9yogt0K2noIz6Y/0dRjwtIdo0E3eqXhaPObs1kiE0PinbQ8Edzf5mxJ8BpxKEBE85
         ufvw==
X-Gm-Message-State: AAQBX9ds31HM1RjLzFbmZ9aQzgEGT+bzmXixZ6NATJGvOZFWs/Kp9DeW
        TEaQ3+luT1bTm9O1djREW2i9jQ==
X-Google-Smtp-Source: AKy350aMwTZAwm4ZoDHtxvOSlybdkNBxcexPxlBqyyK+uY1vBQgdEWdN6bipTzNuqAJSyEGnwLw6DQ==
X-Received: by 2002:a5d:6087:0:b0:2ce:a8d6:7fc0 with SMTP id w7-20020a5d6087000000b002cea8d67fc0mr1755693wrt.54.1681402894711;
        Thu, 13 Apr 2023 09:21:34 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c314700b003f07ef4e3e0sm10541452wmo.0.2023.04.13.09.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:21:34 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atishp@atishpatra.org>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 4/4] riscv: Enable perf counters user access only through perf
Date:   Thu, 13 Apr 2023 18:17:25 +0200
Message-Id: <20230413161725.195417-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413161725.195417-1-alexghiti@rivosinc.com>
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We used to unconditionnally expose the cycle and instret csrs to
userspace, which gives rise to security concerns.

So only allow access to hw counters from userspace through the perf
framework which will handle context switchs, per-task events...etc. But
as we cannot break userspace, we give the user the choice to go back to
the previous behaviour by setting the sysctl perf_user_access.

We also introduce a means to directly map the hardware counters to
userspace, thus avoiding the need for syscalls whenever an application
wants to access counters values.

Note that arch_perf_update_userpage is a copy of arm64 code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst |  23 +++-
 arch/riscv/include/asm/perf_event.h         |   3 +
 arch/riscv/kernel/Makefile                  |   2 +-
 arch/riscv/kernel/perf_event.c              |  65 +++++++++++
 drivers/perf/riscv_pmu.c                    |  42 ++++++++
 drivers/perf/riscv_pmu_legacy.c             |  17 +++
 drivers/perf/riscv_pmu_sbi.c                | 113 ++++++++++++++++++--
 include/linux/perf/riscv_pmu.h              |   3 +
 tools/lib/perf/mmap.c                       |  65 +++++++++++
 9 files changed, 322 insertions(+), 11 deletions(-)
 create mode 100644 arch/riscv/kernel/perf_event.c

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 4b7bfea28cd7..02b2a40a3647 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -941,16 +941,31 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
 The default value is 8.
 
 
-perf_user_access (arm64 only)
-=================================
+perf_user_access (arm64 and riscv only)
+=======================================
+
+Controls user space access for reading perf event counters.
 
-Controls user space access for reading perf event counters. When set to 1,
-user space can read performance monitor counter registers directly.
+arm64
+=====
 
 The default value is 0 (access disabled).
+When set to 1, user space can read performance monitor counter registers
+directly.
 
 See Documentation/arm64/perf.rst for more information.
 
+riscv
+=====
+
+When set to 0, user access is disabled.
+
+When set to 1, user space can read performance monitor counter registers
+directly only through perf, any direct access without perf intervention will
+trigger an illegal instruction.
+
+The default value is 2, it enables the legacy mode, that is user space has
+direct access to cycle, time and insret CSRs only.
 
 pid_max
 =======
diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index d42c901f9a97..9fdfdd9dc92d 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -9,5 +9,8 @@
 #define _ASM_RISCV_PERF_EVENT_H
 
 #include <linux/perf_event.h>
+
+#define PERF_EVENT_FLAG_LEGACY	1
+
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
 #endif /* _ASM_RISCV_PERF_EVENT_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index aa22f87faeae..9ae951b07847 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -70,7 +70,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
 obj-$(CONFIG_TRACE_IRQFLAGS)	+= trace_irq.o
 
-obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
+obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o perf_event.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o
 ifeq ($(CONFIG_RISCV_SBI), y)
diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
new file mode 100644
index 000000000000..4a75ab628bfb
--- /dev/null
+++ b/arch/riscv/kernel/perf_event.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/perf/riscv_pmu.h>
+#include <linux/sched_clock.h>
+
+void arch_perf_update_userpage(struct perf_event *event,
+			       struct perf_event_mmap_page *userpg, u64 now)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct clock_read_data *rd;
+	unsigned int seq;
+	u64 ns;
+
+	userpg->cap_user_time = 0;
+	userpg->cap_user_time_zero = 0;
+	userpg->cap_user_time_short = 0;
+	userpg->cap_user_rdpmc =
+		!!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT);
+
+	/*
+	 * The counters are 64-bit but the priv spec doesn't mandate all the
+	 * bits to be implemented: that's why, counter width can vary based on
+	 * the cpu vendor.
+	 */
+	userpg->pmc_width = rvpmu->ctr_get_width(event->hw.idx) + 1;
+
+	do {
+		rd = sched_clock_read_begin(&seq);
+
+		userpg->time_mult = rd->mult;
+		userpg->time_shift = rd->shift;
+		userpg->time_zero = rd->epoch_ns;
+		userpg->time_cycles = rd->epoch_cyc;
+		userpg->time_mask = rd->sched_clock_mask;
+
+		/*
+		 * Subtract the cycle base, such that software that
+		 * doesn't know about cap_user_time_short still 'works'
+		 * assuming no wraps.
+		 */
+		ns = mul_u64_u32_shr(rd->epoch_cyc, rd->mult, rd->shift);
+		userpg->time_zero -= ns;
+
+	} while (sched_clock_read_retry(seq));
+
+	userpg->time_offset = userpg->time_zero - now;
+
+	/*
+	 * time_shift is not expected to be greater than 31 due to
+	 * the original published conversion algorithm shifting a
+	 * 32-bit value (now specifies a 64-bit value) - refer
+	 * perf_event_mmap_page documentation in perf_event.h.
+	 */
+	if (userpg->time_shift == 32) {
+		userpg->time_shift = 31;
+		userpg->time_mult >>= 1;
+	}
+
+	/*
+	 * Internal timekeeping for enabled/running/stopped times
+	 * is always computed with the sched_clock.
+	 */
+	userpg->cap_user_time = 1;
+	userpg->cap_user_time_zero = 1;
+	userpg->cap_user_time_short = 1;
+}
diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index ebca5eab9c9b..12675ee1123c 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -171,6 +171,8 @@ int riscv_pmu_event_set_period(struct perf_event *event)
 
 	local64_set(&hwc->prev_count, (u64)-left);
 
+	perf_event_update_userpage(event);
+
 	return overflow;
 }
 
@@ -283,6 +285,43 @@ static int riscv_pmu_event_init(struct perf_event *event)
 	return 0;
 }
 
+static int riscv_pmu_event_idx(struct perf_event *event)
+{
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+
+	if (!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT))
+		return 0;
+
+	/*
+	 * cycle and instret can either be retrieved from their fixed counters
+	 * or from programmable counters, the latter being the preferred way
+	 * since cycle and instret counters do not support sampling.
+	 */
+
+	return rvpmu->csr_index(event) + 1;
+}
+
+static void riscv_pmu_event_mapped(struct perf_event *event, struct mm_struct *mm)
+{
+	/*
+	 * The user mmapped the event to directly access it: this is where
+	 * we determine based on sysctl_perf_user_access if we grant userspace
+	 * the direct access to this event. That means that within the same
+	 * task, some events may be directly accessible and some other may not,
+	 * if the user changes the value of sysctl_perf_user_accesss in the
+	 * meantime.
+	 */
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+
+	event->hw.flags |= rvpmu->event_flags(event);
+	perf_event_update_userpage(event);
+}
+
+static void riscv_pmu_event_unmapped(struct perf_event *event, struct mm_struct *mm)
+{
+	event->hw.flags &= ~PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
 struct riscv_pmu *riscv_pmu_alloc(void)
 {
 	struct riscv_pmu *pmu;
@@ -307,6 +346,9 @@ struct riscv_pmu *riscv_pmu_alloc(void)
 	}
 	pmu->pmu = (struct pmu) {
 		.event_init	= riscv_pmu_event_init,
+		.event_mapped	= riscv_pmu_event_mapped,
+		.event_unmapped	= riscv_pmu_event_unmapped,
+		.event_idx	= riscv_pmu_event_idx,
 		.add		= riscv_pmu_add,
 		.del		= riscv_pmu_del,
 		.start		= riscv_pmu_start,
diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 0d8c9d8849ee..35c4c9097a0f 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -74,6 +74,21 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
 	local64_set(&hwc->prev_count, initial_val);
 }
 
+static uint8_t pmu_legacy_csr_index(struct perf_event *event)
+{
+	return event->hw.idx;
+}
+
+static int pmu_legacy_event_flags(struct perf_event *event)
+{
+	/* In legacy mode, the first 3 CSRs are available. */
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return 0;
+
+	return PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
 /*
  * This is just a simple implementation to allow legacy implementations
  * compatible with new RISC-V PMU driver framework.
@@ -94,6 +109,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->ctr_get_width = NULL;
 	pmu->ctr_clear_idx = NULL;
 	pmu->ctr_read = pmu_legacy_read_ctr;
+	pmu->event_flags = pmu_legacy_event_flags;
+	pmu->csr_index = pmu_legacy_csr_index;
 
 	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 }
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 70cb50fd41c2..af7f3128b6b8 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -24,6 +24,10 @@
 #include <asm/sbi.h>
 #include <asm/hwcap.h>
 
+#define SYSCTL_NO_USER_ACCESS	0
+#define SYSCTL_USER_ACCESS	1
+#define SYSCTL_LEGACY		2
+
 PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:63");
 
@@ -43,6 +47,9 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
 	NULL,
 };
 
+/* Allow legacy access by default */
+static int sysctl_perf_user_access __read_mostly = SYSCTL_LEGACY;
+
 /*
  * RISC-V doesn't have heterogeneous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
@@ -301,6 +308,11 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
 }
 EXPORT_SYMBOL_GPL(riscv_pmu_get_hpm_info);
 
+static uint8_t pmu_sbi_csr_index(struct perf_event *event)
+{
+	return pmu_ctr_list[event->hw.idx].csr - CSR_CYCLE;
+}
+
 static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
 {
 	unsigned long cflags = 0;
@@ -329,18 +341,30 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
 	struct sbiret ret;
 	int idx;
-	uint64_t cbase = 0;
+	uint64_t cbase = 0, cmask = rvpmu->cmask;
 	unsigned long cflags = 0;
 
 	cflags = pmu_sbi_get_filter_flags(event);
+
+	/* In legacy mode, we have to force the fixed counters for those events */
+	if (hwc->flags & PERF_EVENT_FLAG_LEGACY) {
+		if (event->attr.config == PERF_COUNT_HW_CPU_CYCLES) {
+			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
+			cmask = 1;
+		} else if (event->attr.config == PERF_COUNT_HW_INSTRUCTIONS) {
+			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
+			cmask = 1UL << (CSR_INSTRET - CSR_CYCLE);
+		}
+	}
+
 	/* retrieve the available counter index */
 #if defined(CONFIG_32BIT)
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
-			rvpmu->cmask, cflags, hwc->event_base, hwc->config,
+			cmask, cflags, hwc->event_base, hwc->config,
 			hwc->config >> 32);
 #else
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
-			rvpmu->cmask, cflags, hwc->event_base, hwc->config, 0);
+			cmask, cflags, hwc->event_base, hwc->config, 0);
 #endif
 	if (ret.error) {
 		pr_debug("Not able to find a counter for event %lx config %llx\n",
@@ -490,6 +514,11 @@ static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STARTED))
 		pr_err("Starting counter idx %d failed with error %d\n",
 			hwc->idx, sbi_err_map_linux_errno(ret.error));
+
+	if (!(event->hw.flags & PERF_EVENT_FLAG_LEGACY) &&
+	    event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT)
+		csr_write(CSR_SCOUNTEREN,
+			  csr_read(CSR_SCOUNTEREN) | (1 << pmu_sbi_csr_index(event)));
 }
 
 static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
@@ -497,6 +526,11 @@ static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 	struct sbiret ret;
 	struct hw_perf_event *hwc = &event->hw;
 
+	if (!(event->hw.flags & PERF_EVENT_FLAG_LEGACY) &&
+	    event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT)
+		csr_write(CSR_SCOUNTEREN,
+			  csr_read(CSR_SCOUNTEREN) & ~(1 << pmu_sbi_csr_index(event)));
+
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, 1, flag, 0, 0, 0);
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STOPPED) &&
 		flag != SBI_PMU_STOP_FLAG_RESET)
@@ -704,10 +738,13 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 
 	/*
-	 * Enable the access for CYCLE, TIME, and INSTRET CSRs from userspace,
-	 * as is necessary to maintain uABI compatibility.
+	 * We keep enabling userspace access to CYCLE, TIME and INSRET via the
+	 * legacy option but that will be removed in the future.
 	 */
-	csr_write(CSR_SCOUNTEREN, 0x7);
+	if (sysctl_perf_user_access == SYSCTL_LEGACY)
+		csr_write(CSR_SCOUNTEREN, 0x7);
+	else
+		csr_write(CSR_SCOUNTEREN, 0x2);
 
 	/* Stop all the counters so that they can be enabled from perf */
 	pmu_sbi_stop_all(pmu);
@@ -851,6 +888,66 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
 	cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 }
 
+static int pmu_sbi_event_flags(struct perf_event *event)
+{
+	if (sysctl_perf_user_access == SYSCTL_NO_USER_ACCESS)
+		return 0;
+
+	/* In legacy mode, the first 3 CSRs are available. */
+	if (sysctl_perf_user_access == SYSCTL_LEGACY) {
+		int flags = PERF_EVENT_FLAG_LEGACY;
+
+		if (event->attr.config == PERF_COUNT_HW_CPU_CYCLES ||
+		    event->attr.config == PERF_COUNT_HW_INSTRUCTIONS)
+			flags |= PERF_EVENT_FLAG_USER_READ_CNT;
+
+		return flags;
+	}
+
+	return PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
+static void riscv_pmu_update_counter_access(void *info)
+{
+	if (sysctl_perf_user_access == SYSCTL_LEGACY)
+		csr_write(CSR_SCOUNTEREN, 0x7);
+	else
+		csr_write(CSR_SCOUNTEREN, 0x2);
+}
+
+static int riscv_pmu_proc_user_access_handler(struct ctl_table *table,
+					      int write, void *buffer,
+					      size_t *lenp, loff_t *ppos)
+{
+	int prev = sysctl_perf_user_access;
+	int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+
+	/*
+	 * Test against the previous value since we clear SCOUNTEREN when
+	 * sysctl_perf_user_access is set to SYSCTL_USER_ACCESS, but we should
+	 * not do that if that was already the case.
+	 */
+	if (ret || !write || prev == sysctl_perf_user_access)
+		return ret;
+
+	on_each_cpu(riscv_pmu_update_counter_access, (void *)&prev, 1);
+
+	return 0;
+}
+
+static struct ctl_table sbi_pmu_sysctl_table[] = {
+	{
+		.procname       = "perf_user_access",
+		.data		= &sysctl_perf_user_access,
+		.maxlen		= sizeof(unsigned int),
+		.mode           = 0644,
+		.proc_handler	= riscv_pmu_proc_user_access_handler,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_TWO,
+	},
+	{ }
+};
+
 static int pmu_sbi_device_probe(struct platform_device *pdev)
 {
 	struct riscv_pmu *pmu = NULL;
@@ -888,6 +985,8 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	pmu->ctr_get_width = pmu_sbi_ctr_get_width;
 	pmu->ctr_clear_idx = pmu_sbi_ctr_clear_idx;
 	pmu->ctr_read = pmu_sbi_ctr_read;
+	pmu->event_flags = pmu_sbi_event_flags;
+	pmu->csr_index = pmu_sbi_csr_index;
 
 	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 	if (ret)
@@ -901,6 +1000,8 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_unregister;
 
+	register_sysctl("kernel", sbi_pmu_sysctl_table);
+
 	return 0;
 
 out_unregister:
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 9f70d94942e0..ba19634d815c 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -12,6 +12,7 @@
 #include <linux/perf_event.h>
 #include <linux/ptrace.h>
 #include <linux/interrupt.h>
+#include <asm/perf_event.h>
 
 #ifdef CONFIG_RISCV_PMU
 
@@ -55,6 +56,8 @@ struct riscv_pmu {
 	void		(*ctr_start)(struct perf_event *event, u64 init_val);
 	void		(*ctr_stop)(struct perf_event *event, unsigned long flag);
 	int		(*event_map)(struct perf_event *event, u64 *config);
+	int		(*event_flags)(struct perf_event *event);
+	uint8_t		(*csr_index)(struct perf_event *event);
 
 	struct cpu_hw_events	__percpu *hw_events;
 	struct hlist_node	node;
diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
index 0d1634cedf44..18f2abb1584a 100644
--- a/tools/lib/perf/mmap.c
+++ b/tools/lib/perf/mmap.c
@@ -392,6 +392,71 @@ static u64 read_perf_counter(unsigned int counter)
 
 static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
 
+#elif defined(__riscv) && __riscv_xlen == 64
+
+#define CSR_CYCLE	0xc00
+#define CSR_TIME	0xc01
+#define CSR_CYCLEH	0xc80
+
+#define csr_read(csr)						\
+({								\
+	register unsigned long __v;				\
+		__asm__ __volatile__ ("csrr %0, " #csr		\
+		 : "=r" (__v) :					\
+		 : "memory");					\
+		 __v;						\
+})
+
+static unsigned long csr_read_num(int csr_num)
+{
+#define switchcase_csr_read(__csr_num, __val)           {\
+	case __csr_num:                                 \
+		__val = csr_read(__csr_num);            \
+		break; }
+#define switchcase_csr_read_2(__csr_num, __val)         {\
+	switchcase_csr_read(__csr_num + 0, __val)        \
+	switchcase_csr_read(__csr_num + 1, __val)}
+#define switchcase_csr_read_4(__csr_num, __val)         {\
+	switchcase_csr_read_2(__csr_num + 0, __val)      \
+	switchcase_csr_read_2(__csr_num + 2, __val)}
+#define switchcase_csr_read_8(__csr_num, __val)         {\
+	switchcase_csr_read_4(__csr_num + 0, __val)      \
+	switchcase_csr_read_4(__csr_num + 4, __val)}
+#define switchcase_csr_read_16(__csr_num, __val)        {\
+	switchcase_csr_read_8(__csr_num + 0, __val)      \
+	switchcase_csr_read_8(__csr_num + 8, __val)}
+#define switchcase_csr_read_32(__csr_num, __val)        {\
+	switchcase_csr_read_16(__csr_num + 0, __val)     \
+	switchcase_csr_read_16(__csr_num + 16, __val)}
+
+	unsigned long ret = 0;
+
+	switch (csr_num) {
+	switchcase_csr_read_32(CSR_CYCLE, ret)
+	switchcase_csr_read_32(CSR_CYCLEH, ret)
+	default :
+		break;
+	}
+
+	return ret;
+#undef switchcase_csr_read_32
+#undef switchcase_csr_read_16
+#undef switchcase_csr_read_8
+#undef switchcase_csr_read_4
+#undef switchcase_csr_read_2
+#undef switchcase_csr_read
+}
+
+static u64 read_perf_counter(unsigned int counter)
+{
+	return csr_read_num(CSR_CYCLE + counter);
+}
+
+static u64 read_timestamp(void)
+{
+	return csr_read_num(CSR_TIME);
+}
+
 #else
 static u64 read_perf_counter(unsigned int counter __maybe_unused) { return 0; }
 static u64 read_timestamp(void) { return 0; }
-- 
2.37.2

