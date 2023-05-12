Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2615770032D
	for <lists+linux-doc@lfdr.de>; Fri, 12 May 2023 11:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240273AbjELJBG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 May 2023 05:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239962AbjELJBF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 May 2023 05:01:05 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D10E43
        for <linux-doc@vger.kernel.org>; Fri, 12 May 2023 02:01:03 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3078c092056so4704460f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 12 May 2023 02:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683882061; x=1686474061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geE8HPp9yIoGl81YEdzrEKEA+MzRoXfjCjx/56eMQdw=;
        b=MjGjwl7ewqyej+0djf9VzVlRSoVs7D1th4qC5kP7g6zo6vV08Vw5MpyGN9b5xYJopr
         uMNkVk7n0+gLUYjOoCcX6KrodscG8GMaO1aW1a05WeHOQDedpQkbqbf1hsxd9OTB6s98
         PSyWZJVKYd/nj0TuTe6rM5evpVaEHG9jFqIdlumd8WFwK6elzf9f2CmoP8iXBJ+53KZA
         JsFknggcI1RpRrRq1a8IhawyNrwUVoRikqrrlsABaIcKG4CBp6TkZ2wCuoVsJPVyGaDG
         +TeGd8rss86jBVyHFXuMWCU3ms3X5iWSNcdpFwC0b7yUEvb98tODOuYnmvpD7Ca6ec8R
         kxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683882061; x=1686474061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geE8HPp9yIoGl81YEdzrEKEA+MzRoXfjCjx/56eMQdw=;
        b=XGYiLBIivMfUucg8d+9X8vDNsgv85nTUB97S/Vd/3cHxnVntGuqUxhnQpYRxFrn6eI
         RQ3DD2dF7KXVBc3t0pYTm7SnCtCYDAsIrRvdKAR+I42PscuWTWEJJCs3gonVUxFd7Aqw
         SgEkOGhpBtLEgBZAoDv2GCdocJZ6VZ+Q/LXLDXkOp1nZ9O9uzY9HHr8JeqPoic68P3g6
         dqc+Lq7zo/+rU++WY5SRUhkAgjDcIgWOmcrVXNWZpbNKjZx4I4LvAx2eo1VBU3S2pp4/
         kz9DHoxuR/tqmOaxy8apVntqXCtSqqth0Eap+1xl23nvsicFnvR34p1TXN0QSOgOg60Q
         QhAQ==
X-Gm-Message-State: AC+VfDwhfNo1h4Iv51sfK4DMKWxF34veOLwPssx6Jv0/+hqUcDjC8d2B
        p7dEyzD7einj7XDFWr9EqNUWuw==
X-Google-Smtp-Source: ACHHUZ7cYQVS7JGJnsFJmUwr1w5+Vy+3iSTGPCujEXveU3w03No4A5jnQHDuppZwKIe/bmP1wZLLkg==
X-Received: by 2002:adf:e603:0:b0:307:41a1:a125 with SMTP id p3-20020adfe603000000b0030741a1a125mr15635613wrm.12.1683882061517;
        Fri, 12 May 2023 02:01:01 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y12-20020adffa4c000000b00306281cfa59sm22748458wrr.47.2023.05.12.02.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 02:01:01 -0700 (PDT)
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
        Andrew Jones <ajones@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 07/10] drivers: perf: Implement perf event mmap support in the SBI backend
Date:   Fri, 12 May 2023 10:53:18 +0200
Message-Id: <20230512085321.13259-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We used to unconditionnally expose the cycle and instret csrs to
userspace, which gives rise to security concerns.

So now we only allow access to hw counters from userspace through the perf
framework which will handle context switches, per-task events...etc. But
as we cannot break userspace, we give the user the choice to go back to
the previous behaviour by setting the sysctl perf_user_access.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/perf_event.c |  18 ++-
 drivers/perf/riscv_pmu_sbi.c   | 194 ++++++++++++++++++++++++++++++++-
 2 files changed, 205 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
index 94174a0fc251..3af9ca45b43f 100644
--- a/arch/riscv/kernel/perf_event.c
+++ b/arch/riscv/kernel/perf_event.c
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/perf/riscv_pmu.h>
 #include <linux/sched_clock.h>
 
 void arch_perf_update_userpage(struct perf_event *event,
 			       struct perf_event_mmap_page *userpg, u64 now)
 {
+#ifdef CONFIG_RISCV_PMU_SBI
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+#endif
 	struct clock_read_data *rd;
 	unsigned int seq;
 	u64 ns;
@@ -14,7 +18,19 @@ void arch_perf_update_userpage(struct perf_event *event,
 	userpg->cap_user_rdpmc =
 		!!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT);
 
-	userpg->pmc_width = 64;
+#ifdef CONFIG_RISCV_PMU_SBI
+	/*
+	 * The counters are 64-bit but the priv spec doesn't mandate all the
+	 * bits to be implemented: that's why, counter width can vary based on
+	 * the cpu vendor.
+	 */
+	if (event->pmu->name &&
+	    !strncmp(event->pmu->name,
+		     RISCV_PMU_PDEV_NAME, sizeof(RISCV_PMU_PDEV_NAME)))
+		userpg->pmc_width = rvpmu->ctr_get_width(event->hw.idx) + 1;
+	else
+#endif
+		userpg->pmc_width = 64;
 
 	do {
 		rd = sched_clock_read_begin(&seq);
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 3b0ee2148054..d9bcc5cc6df5 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -24,6 +24,14 @@
 #include <asm/sbi.h>
 #include <asm/hwcap.h>
 
+#define SYSCTL_NO_USER_ACCESS	0
+#define SYSCTL_USER_ACCESS	1
+#define SYSCTL_LEGACY		2
+
+#define PERF_EVENT_FLAG_NO_USER_ACCESS	BIT(SYSCTL_NO_USER_ACCESS)
+#define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
+#define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
+
 PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:63");
 
@@ -43,6 +51,9 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
 	NULL,
 };
 
+/* Allow legacy access by default */
+static int sysctl_perf_user_access __read_mostly = SYSCTL_LEGACY;
+
 /*
  * RISC-V doesn't have heterogeneous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
@@ -301,6 +312,11 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
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
@@ -329,18 +345,34 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
 	struct sbiret ret;
 	int idx;
-	uint64_t cbase = 0;
+	uint64_t cbase = 0, cmask = rvpmu->cmask;
 	unsigned long cflags = 0;
 
 	cflags = pmu_sbi_get_filter_flags(event);
+
+	/*
+	 * In legacy mode, we have to force the fixed counters for those events
+	 * but not in the user access mode as we want to use the other counters
+	 * that support sampling/filtering.
+	 */
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
@@ -474,6 +506,14 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 	return val;
 }
 
+static void pmu_sbi_set_scounteren(void *arg)
+{
+	struct perf_event *event = (struct perf_event *)arg;
+
+	csr_write(CSR_SCOUNTEREN,
+		  csr_read(CSR_SCOUNTEREN) | (1 << pmu_sbi_csr_index(event)));
+}
+
 static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 {
 	struct sbiret ret;
@@ -490,6 +530,18 @@ static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STARTED))
 		pr_err("Starting counter idx %d failed with error %d\n",
 			hwc->idx, sbi_err_map_linux_errno(ret.error));
+
+	if (hwc->flags & PERF_EVENT_FLAG_USER_ACCESS &&
+	    hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT)
+		pmu_sbi_set_scounteren((void *)event);
+}
+
+static void pmu_sbi_reset_scounteren(void *arg)
+{
+	struct perf_event *event = (struct perf_event *)arg;
+
+	csr_write(CSR_SCOUNTEREN,
+		  csr_read(CSR_SCOUNTEREN) & ~(1 << pmu_sbi_csr_index(event)));
 }
 
 static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
@@ -497,6 +549,10 @@ static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 	struct sbiret ret;
 	struct hw_perf_event *hwc = &event->hw;
 
+	if (hwc->flags & PERF_EVENT_FLAG_USER_ACCESS &&
+	    hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT)
+		pmu_sbi_reset_scounteren((void *)event);
+
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, 1, flag, 0, 0, 0);
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STOPPED) &&
 		flag != SBI_PMU_STOP_FLAG_RESET)
@@ -704,10 +760,13 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
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
@@ -851,6 +910,123 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
 	cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 }
 
+static void pmu_sbi_event_init(struct perf_event *event)
+{
+	/*
+	 * The permissions are set at event_init so that we do not depend
+	 * on the sysctl value that can change.
+	 */
+	if (sysctl_perf_user_access == SYSCTL_NO_USER_ACCESS)
+		event->hw.flags |= PERF_EVENT_FLAG_NO_USER_ACCESS;
+	else if (sysctl_perf_user_access == SYSCTL_USER_ACCESS)
+		event->hw.flags |= PERF_EVENT_FLAG_USER_ACCESS;
+	else
+		event->hw.flags |= PERF_EVENT_FLAG_LEGACY;
+}
+
+static void pmu_sbi_event_mapped(struct perf_event *event, struct mm_struct *mm)
+{
+	if (event->hw.flags & PERF_EVENT_FLAG_NO_USER_ACCESS)
+		return;
+
+	/* In legacy mode, the first 3 CSRs are available. */
+	if (event->hw.flags & PERF_EVENT_FLAG_LEGACY) {
+		if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+		    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS) {
+			return;
+		}
+	}
+
+	/*
+	 * The user mmapped the event to directly access it: this is where
+	 * we determine based on sysctl_perf_user_access if we grant userspace
+	 * the direct access to this event. That means that within the same
+	 * task, some events may be directly accessible and some other may not,
+	 * if the user changes the value of sysctl_perf_user_accesss in the
+	 * meantime.
+	 */
+
+	event->hw.flags |= PERF_EVENT_FLAG_USER_READ_CNT;
+
+	/*
+	 * We must enable userspace access *before* advertising in the user page
+	 * that it is possible to do so to avoid any race.
+	 * And we must notify all cpus here because threads that currently run
+	 * on other cpus will try to directly access the counter too without
+	 * calling pmu_sbi_ctr_start.
+	 */
+	if (event->hw.flags & PERF_EVENT_FLAG_USER_ACCESS)
+		on_each_cpu_mask(mm_cpumask(mm),
+				 pmu_sbi_set_scounteren, (void *)event, 1);
+}
+
+static void pmu_sbi_event_unmapped(struct perf_event *event, struct mm_struct *mm)
+{
+	if (event->hw.flags & PERF_EVENT_FLAG_NO_USER_ACCESS)
+		return;
+
+	/* In legacy mode, the first 3 CSRs are available. */
+	if (event->hw.flags & PERF_EVENT_FLAG_LEGACY) {
+		if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+		    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS) {
+			return;
+		}
+	}
+
+	/*
+	 * Here we can directly remove user access since the user does not have
+	 * access to the user page anymore so we avoid the racy window where the
+	 * user could have read cap_user_rdpmc to true right before we disable
+	 * it.
+	 */
+	event->hw.flags &= ~PERF_EVENT_FLAG_USER_READ_CNT;
+
+	if (event->hw.flags & PERF_EVENT_FLAG_USER_ACCESS)
+		on_each_cpu_mask(mm_cpumask(mm),
+				 pmu_sbi_reset_scounteren, (void *)event, 1);
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
@@ -888,6 +1064,10 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	pmu->ctr_get_width = pmu_sbi_ctr_get_width;
 	pmu->ctr_clear_idx = pmu_sbi_ctr_clear_idx;
 	pmu->ctr_read = pmu_sbi_ctr_read;
+	pmu->event_init = pmu_sbi_event_init;
+	pmu->event_mapped = pmu_sbi_event_mapped;
+	pmu->event_unmapped = pmu_sbi_event_unmapped;
+	pmu->csr_index = pmu_sbi_csr_index;
 
 	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 	if (ret)
@@ -901,6 +1081,8 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_unregister;
 
+	register_sysctl("kernel", sbi_pmu_sysctl_table);
+
 	return 0;
 
 out_unregister:
-- 
2.37.2

