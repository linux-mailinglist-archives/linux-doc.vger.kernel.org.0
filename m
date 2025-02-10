Return-Path: <linux-doc+bounces-37508-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5321A2E358
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 06:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3536160892
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 05:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDAD19007D;
	Mon, 10 Feb 2025 05:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q94hiX7o"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6719A18CC1D;
	Mon, 10 Feb 2025 05:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163877; cv=none; b=LAmSb1WLeQ1CZGt15vHKN/5SWgmGPcZ+NNQEW9BrRuV19Ng54dLByMb05dKmyAko7M4DPFDhZ2RWrjxkJqVZnvVTRDfBL1yeYdYS0H4dvNhKpu//MbXRtyGgE1hHbPjuxXb7NkuyApKOiB1vH6M0YF6FkbD3KUSA2zGPgt+xQNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163877; c=relaxed/simple;
	bh=lXnHQogEmGMJQi1neQwdfYeWkUx0B3xCb1duJK0bZjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aa5/6Bh/QZCuOCirynAX1SwSgAmbWOPUMhZm2Kkdvf+nRc9UuNAlVGAt31fi5v8XEKb1k3ZctA1R3amaphq9Y+KyPsEmE+cyfXV/F6iSwXYZYCU44EDCcyO190FgoudmwrOcYjdKA3/hzMfdCwyufuIr2yWfxZOJFdiSxLfxVQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q94hiX7o; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739163875; x=1770699875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lXnHQogEmGMJQi1neQwdfYeWkUx0B3xCb1duJK0bZjQ=;
  b=Q94hiX7oUaYXAk8urzek13QtJ6A5bQmz1CqukoPyeqXs2GExEfaug1gc
   KZ6UT2UnciHjaBBmsBt6D3M1Lp3zKNwZSMDRm+CQ4eYXqDqeaQr2kMEsZ
   MuZBHjXELBO7eXJUmmbEddp51GLIi/1shj2mTTL7PKE0w/Nov68zHtQ3V
   bB8OBs6XM03t9yRFuCyNJc8XNk4V5aLO2u42CJmFlqTbX2vrEyNReWvbl
   BeLM37YXcvYaShsFJv3XdVB+xZRuTaGR/vdG/rxQU/dLxXIQ5ibvtCKaQ
   lJbx/UZQAnIOkY3HCA+/23T5tMefAzvKxRyyBGbtBRLko5VOm4zaLPSuV
   Q==;
X-CSE-ConnectionGUID: Z2+U1GGlT6CBHf7gx8VgGQ==
X-CSE-MsgGUID: /j4jctY/QQyuIrcB21tAEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50369444"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="50369444"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:04:35 -0800
X-CSE-ConnectionGUID: XFBp/oHCR+S0105bMU8VIw==
X-CSE-MsgGUID: rywHNbp3SFGkyKTCDspWBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112312207"
Received: from inlubt0246.iind.intel.com ([10.191.24.87])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 21:04:31 -0800
From: subramanian.mohan@intel.com
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	giometti@enneenne.com,
	tglx@linutronix.de,
	corbet@lwn.net
Cc: eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com,
	david.zage@intel.com,
	srinivasan.chinnadurai@intel.com,
	subramanian.mohan@intel.com
Subject: [PATCH v13 2/4] pps: generators: Add PPS Generator TIO Driver
Date: Mon, 10 Feb 2025 10:34:19 +0530
Message-Id: <20250210050421.29256-3-subramanian.mohan@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250210050421.29256-1-subramanian.mohan@intel.com>
References: <20250210050421.29256-1-subramanian.mohan@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Subramanian Mohan <subramanian.mohan@intel.com>

The Intel Timed IO PPS generator driver outputs a PPS signal using
dedicated hardware that is more accurate than software actuated PPS.
The Timed IO hardware generates output events using the ART timer.
The ART timer period varies based on platform type, but is less than 100
nanoseconds for all current platforms. Timed IO output accuracy is
within 1 ART period.

PPS output is enabled by writing '1' the 'enable' sysfs attribute. The
driver uses hrtimers to schedule a wake-up 10 ms before each event
(edge) target time. At wakeup, the driver converts the target time in
terms of CLOCK_REALTIME to ART trigger time and writes this to the Timed
IO hardware. The Timed IO hardware generates an event precisely at the
requested system time without software involvement.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Co-developed-by: Pandith N <pandith.n@intel.com>
Signed-off-by: Pandith N <pandith.n@intel.com>
Co-developed-by: Thejesh Reddy T R <thejesh.reddy.t.r@intel.com>
Signed-off-by: Thejesh Reddy T R <thejesh.reddy.t.r@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Signed-off-by: Subramanian Mohan <subramanian.mohan@intel.com>
---
 drivers/pps/generators/Kconfig       |  16 ++
 drivers/pps/generators/Makefile      |   1 +
 drivers/pps/generators/pps_gen_tio.c | 272 +++++++++++++++++++++++++++
 3 files changed, 289 insertions(+)
 create mode 100644 drivers/pps/generators/pps_gen_tio.c

diff --git a/drivers/pps/generators/Kconfig b/drivers/pps/generators/Kconfig
index cd94bf3bfaf2..b3f340ed3163 100644
--- a/drivers/pps/generators/Kconfig
+++ b/drivers/pps/generators/Kconfig
@@ -31,4 +31,20 @@ config PPS_GENERATOR_PARPORT
 	  utilizes STROBE pin of a parallel port to send PPS signals. It uses
 	  parport abstraction layer and hrtimers to precisely control the signal.
 
+config PPS_GENERATOR_TIO
+	tristate "TIO PPS signal generator"
+	depends on X86 && CPU_SUP_INTEL
+	help
+	  If you say yes here you get support for a PPS TIO signal generator
+	  which generates a pulse at a prescribed time based on the system clock.
+	  It uses time translation and hrtimers to precisely generate a pulse.
+	  This hardware is present on 2019 and newer Intel CPUs. However, this
+	  driver is not useful without adding highly specialized hardware outside
+	  the Linux system to observe these pulses.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pps_gen_tio.
+
+	  If unsure, say N.
+
 endif # PPS_GENERATOR
diff --git a/drivers/pps/generators/Makefile b/drivers/pps/generators/Makefile
index dc1aa5a4688b..e109920e8a2d 100644
--- a/drivers/pps/generators/Makefile
+++ b/drivers/pps/generators/Makefile
@@ -8,5 +8,6 @@ obj-$(CONFIG_PPS_GENERATOR)	:= pps_gen_core.o
 
 obj-$(CONFIG_PPS_GENERATOR_DUMMY)   += pps_gen-dummy.o
 obj-$(CONFIG_PPS_GENERATOR_PARPORT) += pps_gen_parport.o
+obj-$(CONFIG_PPS_GENERATOR_TIO)     += pps_gen_tio.o
 
 ccflags-$(CONFIG_PPS_DEBUG) := -DDEBUG
diff --git a/drivers/pps/generators/pps_gen_tio.c b/drivers/pps/generators/pps_gen_tio.c
new file mode 100644
index 000000000000..6c46b46c66cd
--- /dev/null
+++ b/drivers/pps/generators/pps_gen_tio.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel PPS signal Generator Driver
+ *
+ * Copyright (C) 2024 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/hrtimer.h>
+#include <linux/io-64-nonatomic-hi-lo.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pps_gen_kernel.h>
+#include <linux/timekeeping.h>
+#include <linux/types.h>
+
+#include <asm/cpu_device_id.h>
+
+#define TIOCTL			0x00
+#define TIOCOMPV		0x10
+#define TIOEC			0x30
+
+/* Control Register */
+#define TIOCTL_EN			BIT(0)
+#define TIOCTL_DIR			BIT(1)
+#define TIOCTL_EP			GENMASK(3, 2)
+#define TIOCTL_EP_RISING_EDGE		FIELD_PREP(TIOCTL_EP, 0)
+#define TIOCTL_EP_FALLING_EDGE		FIELD_PREP(TIOCTL_EP, 1)
+#define TIOCTL_EP_TOGGLE_EDGE		FIELD_PREP(TIOCTL_EP, 2)
+
+/* Safety time to set hrtimer early */
+#define SAFE_TIME_NS			(10 * NSEC_PER_MSEC)
+
+#define MAGIC_CONST			(NSEC_PER_SEC - SAFE_TIME_NS)
+#define ART_HW_DELAY_CYCLES		2
+
+struct pps_tio {
+	struct pps_gen_source_info gen_info;
+	struct pps_gen_device *pps_gen;
+	struct hrtimer timer;
+	void __iomem *base;
+	u32 prev_count;
+	spinlock_t lock;
+	struct device *dev;
+};
+
+static inline u32 pps_tio_read(u32 offset, struct pps_tio *tio)
+{
+	return readl(tio->base + offset);
+}
+
+static inline void pps_ctl_write(u32 value, struct pps_tio *tio)
+{
+	writel(value, tio->base + TIOCTL);
+}
+
+/*
+ * For COMPV register, It's safer to write
+ * higher 32-bit followed by lower 32-bit
+ */
+static inline void pps_compv_write(u64 value, struct pps_tio *tio)
+{
+	hi_lo_writeq(value, tio->base + TIOCOMPV);
+}
+
+static inline ktime_t first_event(struct pps_tio *tio)
+{
+	return ktime_set(ktime_get_real_seconds() + 1, MAGIC_CONST);
+}
+
+static u32 pps_tio_disable(struct pps_tio *tio)
+{
+	u32 ctrl;
+
+	ctrl = pps_tio_read(TIOCTL, tio);
+	pps_compv_write(0, tio);
+
+	ctrl &= ~TIOCTL_EN;
+	pps_ctl_write(ctrl, tio);
+	tio->pps_gen->enabled = false;
+	tio->prev_count = 0;
+	return ctrl;
+}
+
+static void pps_tio_enable(struct pps_tio *tio)
+{
+	u32 ctrl;
+
+	ctrl = pps_tio_read(TIOCTL, tio);
+	ctrl |= TIOCTL_EN;
+	pps_ctl_write(ctrl, tio);
+	tio->pps_gen->enabled = true;
+}
+
+static void pps_tio_direction_output(struct pps_tio *tio)
+{
+	u32 ctrl;
+
+	ctrl = pps_tio_disable(tio);
+
+	/*
+	 * We enable the device, be sure that the
+	 * 'compare' value is invalid
+	 */
+	pps_compv_write(0, tio);
+
+	ctrl &= ~(TIOCTL_DIR | TIOCTL_EP);
+	ctrl |= TIOCTL_EP_TOGGLE_EDGE;
+	pps_ctl_write(ctrl, tio);
+	pps_tio_enable(tio);
+}
+
+static bool pps_generate_next_pulse(ktime_t expires, struct pps_tio *tio)
+{
+	u64 art;
+
+	if (!ktime_real_to_base_clock(expires, CSID_X86_ART, &art)) {
+		pps_tio_disable(tio);
+		return false;
+	}
+
+	pps_compv_write(art - ART_HW_DELAY_CYCLES, tio);
+	return true;
+}
+
+static enum hrtimer_restart hrtimer_callback(struct hrtimer *timer)
+{
+	ktime_t expires, now;
+	u32 event_count;
+	struct pps_tio *tio = container_of(timer, struct pps_tio, timer);
+
+	guard(spinlock)(&tio->lock);
+
+	/*
+	 * Check if any event is missed.
+	 * If an event is missed, TIO will be disabled.
+	 */
+	event_count = pps_tio_read(TIOEC, tio);
+	if (tio->prev_count && tio->prev_count == event_count)
+		goto err;
+	tio->prev_count = event_count;
+
+	expires = hrtimer_get_expires(timer);
+
+	now = ktime_get_real();
+	if (now - expires >= SAFE_TIME_NS)
+		goto err;
+
+	tio->pps_gen->enabled = pps_generate_next_pulse(expires + SAFE_TIME_NS, tio);
+	if (!tio->pps_gen->enabled)
+		return HRTIMER_NORESTART;
+
+	hrtimer_forward(timer, now, NSEC_PER_SEC / 2);
+	return HRTIMER_RESTART;
+
+err:
+	dev_err(tio->dev, "Event missed, Disabling Timed I/O");
+	pps_tio_disable(tio);
+	pps_gen_event(tio->pps_gen, PPS_GEN_EVENT_MISSEDPULSE, NULL);
+	return HRTIMER_NORESTART;
+}
+
+static int pps_tio_gen_enable(struct pps_gen_device *pps_gen, bool enable)
+{
+	struct pps_tio *tio = container_of(pps_gen->info, struct pps_tio, gen_info);
+
+	if (!timekeeping_clocksource_has_base(CSID_X86_ART)) {
+		dev_err_once(tio->dev, "PPS cannot be used as clock is not related to ART");
+		return -ENODEV;
+	}
+
+	guard(spinlock_irqsave)(&tio->lock);
+	if (enable && !pps_gen->enabled) {
+		pps_tio_direction_output(tio);
+		hrtimer_start(&tio->timer, first_event(tio), HRTIMER_MODE_ABS);
+	} else if (!enable && pps_gen->enabled) {
+		hrtimer_cancel(&tio->timer);
+		pps_tio_disable(tio);
+	}
+
+	return 0;
+}
+
+static int pps_tio_get_time(struct pps_gen_device *pps_gen,
+			    struct timespec64 *time)
+{
+	struct system_time_snapshot snap;
+
+	ktime_get_snapshot(&snap);
+	*time = ktime_to_timespec64(snap.real);
+
+	return 0;
+}
+
+static int pps_gen_tio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pps_tio *tio;
+
+	if (!(cpu_feature_enabled(X86_FEATURE_TSC_KNOWN_FREQ) &&
+	      cpu_feature_enabled(X86_FEATURE_ART))) {
+		dev_warn(dev, "TSC/ART is not enabled");
+		return -ENODEV;
+	}
+
+	tio = devm_kzalloc(dev, sizeof(*tio), GFP_KERNEL);
+	if (!tio)
+		return -ENOMEM;
+
+	tio->gen_info.use_system_clock = true;
+	tio->gen_info.enable = pps_tio_gen_enable;
+	tio->gen_info.get_time = pps_tio_get_time;
+	tio->gen_info.owner = THIS_MODULE;
+
+	tio->pps_gen = pps_gen_register_source(&tio->gen_info);
+	if (IS_ERR(tio->pps_gen))
+		return PTR_ERR(tio->pps_gen);
+
+	tio->dev = dev;
+	tio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(tio->base))
+		return PTR_ERR(tio->base);
+
+	pps_tio_disable(tio);
+	hrtimer_init(&tio->timer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
+	tio->timer.function = hrtimer_callback;
+	spin_lock_init(&tio->lock);
+	platform_set_drvdata(pdev, &tio);
+
+	return 0;
+}
+
+static void pps_gen_tio_remove(struct platform_device *pdev)
+{
+	struct pps_tio *tio = platform_get_drvdata(pdev);
+
+	hrtimer_cancel(&tio->timer);
+	pps_tio_disable(tio);
+	pps_gen_unregister_source(tio->pps_gen);
+}
+
+static const struct acpi_device_id intel_pmc_tio_acpi_match[] = {
+	{ "INTC1021" },
+	{ "INTC1022" },
+	{ "INTC1023" },
+	{ "INTC1024" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, intel_pmc_tio_acpi_match);
+
+static struct platform_driver pps_gen_tio_driver = {
+	.probe          = pps_gen_tio_probe,
+	.remove         = pps_gen_tio_remove,
+	.driver         = {
+		.name                   = "intel-pps-gen-tio",
+		.acpi_match_table       = intel_pmc_tio_acpi_match,
+	},
+};
+module_platform_driver(pps_gen_tio_driver);
+
+MODULE_AUTHOR("Christopher Hall <christopher.s.hall@intel.com>");
+MODULE_AUTHOR("Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>");
+MODULE_AUTHOR("Pandith N <pandith.n@intel.com>");
+MODULE_AUTHOR("Thejesh Reddy T R <thejesh.reddy.t.r@intel.com>");
+MODULE_AUTHOR("Subramanian Mohan <subramanian.mohan@intel.com>");
+MODULE_DESCRIPTION("Intel PMC Time-Aware IO Generator Driver");
+MODULE_LICENSE("GPL");
-- 
2.35.3


