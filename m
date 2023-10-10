Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33BB37BFEE6
	for <lists+linux-doc@lfdr.de>; Tue, 10 Oct 2023 16:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbjJJOQe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Oct 2023 10:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjJJOQb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 10:16:31 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C1FB5C9;
        Tue, 10 Oct 2023 07:16:27 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 425B51FB;
        Tue, 10 Oct 2023 07:17:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 082A63F762;
        Tue, 10 Oct 2023 07:16:24 -0700 (PDT)
From:   James Clark <james.clark@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-perf-users@vger.kernel.org, suzuki.poulose@arm.com
Cc:     James Clark <james.clark@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Reiji Watanabe <reijiw@google.com>,
        Zaid Al-Bassam <zalbassam@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvmarm@lists.linux.dev
Subject: [PATCH v3 2/3] arm64: perf: Add support for event counting threshold
Date:   Tue, 10 Oct 2023 15:15:42 +0100
Message-Id: <20231010141551.2262059-3-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010141551.2262059-1-james.clark@arm.com>
References: <20231010141551.2262059-1-james.clark@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

FEAT_PMUv3_TH (Armv8.8) permits a PMU counter to increment only on
events whose count meets a specified threshold condition. For example if
PMEVTYPERn.TC (Threshold Control) is set to 0b101 (Greater than or
equal, count), and the threshold is set to 2, then the PMU counter will
now only increment by 1 when an event would have previously incremented
the PMU counter by 2 or more on a single processor cycle.

Three new Perf event config fields, 'threshold', 'threshold_compare' and
'threshold_count' have been added to control the feature.
threshold_compare maps to the upper two bits of PMEVTYPERn.TC and
threshold_count maps to the first bit of TC. These separate attributes
have been picked rather than enumerating all the possible combinations
of the TC field as in the Arm ARM. The attributes would be used on a
Perf command line like this:

  $ perf stat -e stall_slot/threshold=2,threshold_compare=2/

A new capability for reading out the maximum supported threshold value
has also been added:

  $ cat /sys/bus/event_source/devices/armv8_pmuv3/caps/threshold_max

  0x000000ff

If a threshold higher than threshold_max is provided, then no error is
generated but the threshold is clamped to the max value. If
FEAT_PMUv3_TH isn't implemented or a 32 bit kernel is running, then
threshold_max reads zero, and neither the 'threshold' nor
'threshold_control' parameters will be used.

The threshold is per PMU counter, and there are potentially different
threshold_max values per PMU type on heterogeneous systems.

Bits higher than 32 now need to be written into PMEVTYPER, so
armv8pmu_write_evtype() has to be updated to take an unsigned long value
rather than u32 which gives the correct behavior on both aarch32 and 64.

Signed-off-by: James Clark <james.clark@arm.com>
---
 drivers/perf/arm_pmuv3.c       | 79 +++++++++++++++++++++++++++++++++-
 include/linux/perf/arm_pmuv3.h |  1 +
 2 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8fcaa26f0f8a..f72598417cc7 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -15,6 +15,7 @@
 #include <clocksource/arm_arch_timer.h>
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/clocksource.h>
 #include <linux/of.h>
 #include <linux/perf/arm_pmu.h>
@@ -294,9 +295,18 @@ static const struct attribute_group armv8_pmuv3_events_attr_group = {
 	.is_visible = armv8pmu_event_attr_is_visible,
 };
 
+#define TH_LO	2
+#define TH_HI	13
+#define TH_CNT	14
+#define TH_CMP_LO	15
+#define TH_CMP_HI	16
+
 PMU_FORMAT_ATTR(event, "config:0-15");
 PMU_FORMAT_ATTR(long, "config1:0");
 PMU_FORMAT_ATTR(rdpmc, "config1:1");
+PMU_FORMAT_ATTR(threshold, "config1:" __stringify(TH_LO) "-" __stringify(TH_HI));
+PMU_FORMAT_ATTR(threshold_compare, "config1:" __stringify(TH_CMP_LO) "-" __stringify(TH_CMP_HI));
+PMU_FORMAT_ATTR(threshold_count, "config1:" __stringify(TH_CNT));
 
 static int sysctl_perf_user_access __read_mostly;
 
@@ -310,10 +320,32 @@ static inline bool armv8pmu_event_want_user_access(struct perf_event *event)
 	return event->attr.config1 & 0x2;
 }
 
+static inline u32 armv8pmu_event_threshold(struct perf_event_attr *attr)
+{
+	return FIELD_GET(GENMASK(TH_HI, TH_LO), attr->config1);
+}
+
+static inline u8 armv8pmu_event_threshold_control(struct perf_event_attr *attr)
+{
+	u8 th_compare = FIELD_GET(GENMASK(TH_CMP_HI, TH_CMP_LO), attr->config1);
+	u8 th_count = FIELD_GET(BIT(TH_CNT), attr->config1);
+
+	/*
+	 * The count bit is always the bottom bit of the full control field, and
+	 * the comparison is the upper two bits, but it's not explicitly
+	 * labelled in the Arm ARM. For the Perf interface we split it into two
+	 * fields, so reconstruct it here.
+	 */
+	return (th_compare << 1) | th_count;
+}
+
 static struct attribute *armv8_pmuv3_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_long.attr,
 	&format_attr_rdpmc.attr,
+	&format_attr_threshold.attr,
+	&format_attr_threshold_compare.attr,
+	&format_attr_threshold_count.attr,
 	NULL,
 };
 
@@ -365,10 +397,38 @@ static ssize_t bus_width_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(bus_width);
 
+static u32 threshold_max(struct arm_pmu *cpu_pmu)
+{
+	/*
+	 * PMMIR.WIDTH is readable and non-zero on aarch32, but it would be
+	 * impossible to write the threshold in the upper 32 bits of PMEVTYPER.
+	 */
+	if (IS_ENABLED(CONFIG_ARM))
+		return 0;
+
+	/*
+	 * The largest value that can be written to PMEVTYPER<n>_EL0.TH is
+	 * (2 ^ PMMIR.THWIDTH) - 1.
+	 */
+	return (1 << FIELD_GET(ARMV8_PMU_THWIDTH, cpu_pmu->reg_pmmir)) - 1;
+}
+
+static ssize_t threshold_max_show(struct device *dev,
+				  struct device_attribute *attr, char *page)
+{
+	struct pmu *pmu = dev_get_drvdata(dev);
+	struct arm_pmu *cpu_pmu = container_of(pmu, struct arm_pmu, pmu);
+
+	return sysfs_emit(page, "0x%08x\n", threshold_max(cpu_pmu));
+}
+
+static DEVICE_ATTR_RO(threshold_max);
+
 static struct attribute *armv8_pmuv3_caps_attrs[] = {
 	&dev_attr_slots.attr,
 	&dev_attr_bus_slots.attr,
 	&dev_attr_bus_width.attr,
+	&dev_attr_threshold_max.attr,
 	NULL,
 };
 
@@ -552,7 +612,7 @@ static void armv8pmu_write_counter(struct perf_event *event, u64 value)
 		armv8pmu_write_hw_counter(event, value);
 }
 
-static inline void armv8pmu_write_evtype(int idx, u32 val)
+static inline void armv8pmu_write_evtype(int idx, unsigned long val)
 {
 	u32 counter = ARMV8_IDX_TO_COUNTER(idx);
 
@@ -914,6 +974,10 @@ static int armv8pmu_set_event_filter(struct hw_perf_event *event,
 				     struct perf_event_attr *attr)
 {
 	unsigned long config_base = 0;
+	struct perf_event *perf_event = container_of(attr, struct perf_event,
+						     attr);
+	struct arm_pmu *cpu_pmu = to_arm_pmu(perf_event->pmu);
+	u32 th, th_max;
 
 	if (attr->exclude_idle)
 		return -EPERM;
@@ -945,6 +1009,19 @@ static int armv8pmu_set_event_filter(struct hw_perf_event *event,
 	if (attr->exclude_user)
 		config_base |= ARMV8_PMU_EXCLUDE_EL0;
 
+	/*
+	 * Insert event counting threshold (FEAT_PMUv3_TH) values. If
+	 * FEAT_PMUv3_TH isn't implemented, then THWIDTH (threshold_max) will be
+	 * 0 and no values will be written.
+	 */
+	th_max = threshold_max(cpu_pmu);
+	if (IS_ENABLED(CONFIG_ARM64) && th_max) {
+		th = min(armv8pmu_event_threshold(attr), th_max);
+		config_base |= FIELD_PREP(ARMV8_PMU_EVTYPE_TH, th);
+		config_base |= FIELD_PREP(ARMV8_PMU_EVTYPE_TC,
+					  armv8pmu_event_threshold_control(attr));
+	}
+
 	/*
 	 * Install the filter into config_base as this is used to
 	 * construct the event type.
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index ec3a01502e7c..753f8dbd9d10 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -255,6 +255,7 @@
 #define ARMV8_PMU_BUS_SLOTS_MASK 0xff
 #define ARMV8_PMU_BUS_WIDTH_SHIFT 16
 #define ARMV8_PMU_BUS_WIDTH_MASK 0xf
+#define ARMV8_PMU_THWIDTH GENMASK(23, 20)
 
 /*
  * This code is really good
-- 
2.34.1

