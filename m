Return-Path: <linux-doc+bounces-37169-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E96A2A9E8
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 14:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA1E3A966D
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044AB1EA7F0;
	Thu,  6 Feb 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qO1/AQOE"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCD41EA7E2;
	Thu,  6 Feb 2025 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848537; cv=none; b=jcyDsRvdHAgPHG/70Vdn76Hmeu+LzeOCcuDVohDAHyreFGW1mpqByvFWHHZ8hzsdcQ32yyBcphgmdXwjNrFtR5Tb/O7YY0mTdCKsg7hFNdfJZUmPImqIxT+LBry+2P6quQWPZEv1yVcQ59YIdteOrapvS0QNBxPvfIo2l3WlpaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848537; c=relaxed/simple;
	bh=+IdzFBU7Z+fpC01FoYQg0eFNpTL6GjRXJUD9Oo2kR0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NigRMcJfl6C2UI/EycND522N04qK/B0PHvSH5D0D/BAxQTNb2FWzWIW6EKWCnTi7x+0Cyf9Pc701YJopIvqivKDLh7u5iSMUhCpN2+YNQhDigCOSPfuNp3QTSgLHH1tEijlayEJlMGEVzxOCk1wFyXN6aQfBWMI9fssbdzAMKkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qO1/AQOE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDBBC4CEE2;
	Thu,  6 Feb 2025 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738848537;
	bh=+IdzFBU7Z+fpC01FoYQg0eFNpTL6GjRXJUD9Oo2kR0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qO1/AQOExODTqc8/VMNK0mku51Q1Qxx19wQiZod6uP2wusf0XmDoPGaWg/fpiAqFz
	 otFnLpYMQw7FkMH++7iXU+JPWl3DpRxdSzKIk5yP+NOx+hOd6pRYGoKzywSaGeAwbf
	 5HbxEDCQMEPGbkvVhd6iKrCuRQkGV0z6KLVB1l0WcrRcUNGh3F/ReSkEqdOG0XeOw6
	 CL+8d+ab1eBnSi5tGCaMutEPbWzvTEMfgu4tVGyVr4sUV3WpezfRg0weOOlgmXrHHX
	 66b9u2MUu39v+aik3GjPkTuAlaS554rHScEQZLLcXOKU1UGotfQHK3o6xMBKD/KsFK
	 3N+gwqvcbvAjw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v4 05/14] kexec: Add Kexec HandOver (KHO) generation helpers
Date: Thu,  6 Feb 2025 15:27:45 +0200
Message-ID: <20250206132754.2596694-6-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Graf <graf@amazon.com>

This patch adds the core infrastructure to generate Kexec HandOver
metadata. Kexec HandOver is a mechanism that allows Linux to preserve
state - arbitrary properties as well as memory locations - across kexec.

It does so using 2 concepts:

  1) Device Tree - Every KHO kexec carries a KHO specific flattened
     device tree blob that describes the state of the system. Device
     drivers can register to KHO to serialize their state before kexec.

  2) Scratch Regions - CMA regions that we allocate in the first kernel.
     CMA gives us the guarantee that no handover pages land in those
     regions, because handover pages must be at a static physical memory
     location. We use these regions as the place to load future kexec
     images so that they won't collide with any handover data.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 Documentation/ABI/testing/sysfs-kernel-kho    |  53 +++
 .../admin-guide/kernel-parameters.txt         |  24 +
 MAINTAINERS                                   |   1 +
 include/linux/cma.h                           |   2 +
 include/linux/kexec.h                         |  18 +
 include/linux/kexec_handover.h                |  10 +
 kernel/Makefile                               |   1 +
 kernel/kexec_handover.c                       | 450 ++++++++++++++++++
 mm/internal.h                                 |   3 -
 mm/mm_init.c                                  |   8 +
 10 files changed, 567 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kho
 create mode 100644 include/linux/kexec_handover.h
 create mode 100644 kernel/kexec_handover.c

diff --git a/Documentation/ABI/testing/sysfs-kernel-kho b/Documentation/ABI/testing/sysfs-kernel-kho
new file mode 100644
index 000000000000..f13b252bc303
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-kho
@@ -0,0 +1,53 @@
+What:		/sys/kernel/kho/active
+Date:		December 2023
+Contact:	Alexander Graf <graf@amazon.com>
+Description:
+		Kexec HandOver (KHO) allows Linux to transition the state of
+		compatible drivers into the next kexec'ed kernel. To do so,
+		device drivers will serialize their current state into a DT.
+		While the state is serialized, they are unable to perform
+		any modifications to state that was serialized, such as
+		handed over memory allocations.
+
+		When this file contains "1", the system is in the transition
+		state. When contains "0", it is not. To switch between the
+		two states, echo the respective number into this file.
+
+What:		/sys/kernel/kho/dt_max
+Date:		December 2023
+Contact:	Alexander Graf <graf@amazon.com>
+Description:
+		KHO needs to allocate a buffer for the DT that gets
+		generated before it knows the final size. By default, it
+		will allocate 10 MiB for it. You can write to this file
+		to modify the size of that allocation.
+
+What:		/sys/kernel/kho/dt
+Date:		December 2023
+Contact:	Alexander Graf <graf@amazon.com>
+Description:
+		When KHO is active, the kernel exposes the generated DT that
+		carries its current KHO state in this file. Kexec user space
+		tooling can use this as input file for the KHO payload image.
+
+What:		/sys/kernel/kho/scratch_len
+Date:		December 2023
+Contact:	Alexander Graf <graf@amazon.com>
+Description:
+		To support continuous KHO kexecs, we need to reserve
+		physically contiguous memory regions that will always stay
+		available for future kexec allocations. This file describes
+		the length of these memory regions. Kexec user space tooling
+		can use this to determine where it should place its payload
+		images.
+
+What:		/sys/kernel/kho/scratch_phys
+Date:		December 2023
+Contact:	Alexander Graf <graf@amazon.com>
+Description:
+		To support continuous KHO kexecs, we need to reserve
+		physically contiguous memory regions that will always stay
+		available for future kexec allocations. This file describes
+		the physical location of these memory regions. Kexec user space
+		tooling can use this to determine where it should place its
+		payload images.
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec8..ed656e2fb05e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2698,6 +2698,30 @@
 	kgdbwait	[KGDB,EARLY] Stop kernel execution and enter the
 			kernel debugger at the earliest opportunity.
 
+	kho=		[KEXEC,EARLY]
+			Format: { "0" | "1" | "off" | "on" | "y" | "n" }
+			Enables or disables Kexec HandOver.
+			"0" | "off" | "n" - kexec handover is disabled
+			"1" | "on" | "y" - kexec handover is enabled
+
+	kho_scratch=	[KEXEC,EARLY]
+			Format: nn[KMG],mm[KMG] | nn%
+			Defines the size of the KHO scratch region. The KHO
+			scratch regions are physically contiguous memory
+			ranges that can only be used for non-kernel
+			allocations. That way, even when memory is heavily
+			fragmented with handed over memory, the kexeced
+			kernel will always have enough contiguous ranges to
+			bootstrap itself.
+
+			It is possible to specify the exact amount of
+			memory in the form of "nn[KMG],mm[KMG]" where the
+			first parameter defines the size of a global
+			scratch area and the second parameter defines the
+			size of additional per-node scratch areas.
+			The form "nn%" defines scale factor (in percents)
+			of memory that was used during boot.
+
 	kmac=		[MIPS] Korina ethernet MAC address.
 			Configure the RouterBoard 532 series on-chip
 			Ethernet adapter MAC address.
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..8327795e8899 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12826,6 +12826,7 @@ M:	Eric Biederman <ebiederm@xmission.com>
 L:	kexec@lists.infradead.org
 S:	Maintained
 W:	http://kernel.org/pub/linux/utils/kernel/kexec/
+F:	Documentation/ABI/testing/sysfs-kernel-kho
 F:	include/linux/kexec.h
 F:	include/uapi/linux/kexec.h
 F:	kernel/kexec*
diff --git a/include/linux/cma.h b/include/linux/cma.h
index d15b64f51336..828a3c17504b 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -56,6 +56,8 @@ extern void cma_reserve_pages_on_error(struct cma *cma);
 #ifdef CONFIG_CMA
 struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp);
 bool cma_free_folio(struct cma *cma, const struct folio *folio);
+/* Free whole pageblock and set its migration type to MIGRATE_CMA. */
+void init_cma_reserved_pageblock(struct page *page);
 #else
 static inline struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp)
 {
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index f0e9f8eda7a3..ef5c90abafd1 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -483,6 +483,24 @@ void set_kexec_sig_enforced(void);
 static inline void set_kexec_sig_enforced(void) {}
 #endif
 
+/* KHO Notifier index */
+enum kho_event {
+	KEXEC_KHO_DUMP = 0,
+	KEXEC_KHO_ABORT = 1,
+};
+
+struct notifier_block;
+
+#ifdef CONFIG_KEXEC_HANDOVER
+int register_kho_notifier(struct notifier_block *nb);
+int unregister_kho_notifier(struct notifier_block *nb);
+void kho_memory_init(void);
+#else
+static inline int register_kho_notifier(struct notifier_block *nb) { return 0; }
+static inline int unregister_kho_notifier(struct notifier_block *nb) { return 0; }
+static inline void kho_memory_init(void) {}
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 #endif /* !defined(__ASSEBMLY__) */
 
 #endif /* LINUX_KEXEC_H */
diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
new file mode 100644
index 000000000000..c4b0aab823dc
--- /dev/null
+++ b/include/linux/kexec_handover.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_KEXEC_HANDOVER_H
+#define LINUX_KEXEC_HANDOVER_H
+
+struct kho_mem {
+	phys_addr_t addr;
+	phys_addr_t size;
+};
+
+#endif /* LINUX_KEXEC_HANDOVER_H */
diff --git a/kernel/Makefile b/kernel/Makefile
index 87866b037fbe..cef5377c25cd 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_CRASH_DUMP) += crash_core.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
 obj-$(CONFIG_KEXEC_ELF) += kexec_elf.o
+obj-$(CONFIG_KEXEC_HANDOVER) += kexec_handover.o
 obj-$(CONFIG_BACKTRACE_SELF_TEST) += backtracetest.o
 obj-$(CONFIG_COMPAT) += compat.o
 obj-$(CONFIG_CGROUPS) += cgroup/
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
new file mode 100644
index 000000000000..eccfe3a25798
--- /dev/null
+++ b/kernel/kexec_handover.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * kexec_handover.c - kexec handover metadata processing
+ * Copyright (C) 2023 Alexander Graf <graf@amazon.com>
+ * Copyright (C) 2025 Microsoft Corporation, Mike Rapoport <rppt@kernel.org>
+ */
+
+#define pr_fmt(fmt) "KHO: " fmt
+
+#include <linux/cma.h>
+#include <linux/kexec.h>
+#include <linux/sysfs.h>
+#include <linux/libfdt.h>
+#include <linux/memblock.h>
+#include <linux/notifier.h>
+#include <linux/kexec_handover.h>
+#include <linux/page-isolation.h>
+
+static bool kho_enable __ro_after_init;
+
+static int __init kho_parse_enable(char *p)
+{
+	return kstrtobool(p, &kho_enable);
+}
+early_param("kho", kho_parse_enable);
+
+/*
+ * With KHO enabled, memory can become fragmented because KHO regions may
+ * be anywhere in physical address space. The scratch regions give us a
+ * safe zones that we will never see KHO allocations from. This is where we
+ * can later safely load our new kexec images into and then use the scratch
+ * area for early allocations that happen before page allocator is
+ * initialized.
+ */
+static struct kho_mem *kho_scratch;
+static unsigned int kho_scratch_cnt;
+
+struct kho_out {
+	struct blocking_notifier_head chain_head;
+	struct kobject *kobj;
+	struct mutex lock;
+	void *dt;
+	u64 dt_len;
+	u64 dt_max;
+	bool active;
+};
+
+static struct kho_out kho_out = {
+	.chain_head = BLOCKING_NOTIFIER_INIT(kho_out.chain_head),
+	.lock = __MUTEX_INITIALIZER(kho_out.lock),
+	.dt_max = 10 * SZ_1M,
+};
+
+int register_kho_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&kho_out.chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(register_kho_notifier);
+
+int unregister_kho_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&kho_out.chain_head, nb);
+}
+EXPORT_SYMBOL_GPL(unregister_kho_notifier);
+
+static ssize_t dt_read(struct file *file, struct kobject *kobj,
+		       struct bin_attribute *attr, char *buf,
+		       loff_t pos, size_t count)
+{
+	mutex_lock(&kho_out.lock);
+	memcpy(buf, attr->private + pos, count);
+	mutex_unlock(&kho_out.lock);
+
+	return count;
+}
+
+struct bin_attribute bin_attr_dt_kern = __BIN_ATTR(dt, 0400, dt_read, NULL, 0);
+
+static int kho_expose_dt(void *fdt)
+{
+	long fdt_len = fdt_totalsize(fdt);
+	int err;
+
+	kho_out.dt = fdt;
+	kho_out.dt_len = fdt_len;
+
+	bin_attr_dt_kern.size = fdt_totalsize(fdt);
+	bin_attr_dt_kern.private = fdt;
+	err = sysfs_create_bin_file(kho_out.kobj, &bin_attr_dt_kern);
+
+	return err;
+}
+
+static void kho_abort(void)
+{
+	if (!kho_out.active)
+		return;
+
+	sysfs_remove_bin_file(kho_out.kobj, &bin_attr_dt_kern);
+
+	kvfree(kho_out.dt);
+	kho_out.dt = NULL;
+	kho_out.dt_len = 0;
+
+	blocking_notifier_call_chain(&kho_out.chain_head, KEXEC_KHO_ABORT, NULL);
+
+	kho_out.active = false;
+}
+
+static int kho_serialize(void)
+{
+	void *fdt = NULL;
+	int err = -ENOMEM;
+
+	fdt = kvmalloc(kho_out.dt_max, GFP_KERNEL);
+	if (!fdt)
+		goto out;
+
+	if (fdt_create(fdt, kho_out.dt_max)) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	err = fdt_finish_reservemap(fdt);
+	if (err)
+		goto out;
+
+	err = fdt_begin_node(fdt, "");
+	if (err)
+		goto out;
+
+	err = fdt_property_string(fdt, "compatible", "kho-v1");
+	if (err)
+		goto out;
+
+	/* Loop through all kho dump functions */
+	err = blocking_notifier_call_chain(&kho_out.chain_head, KEXEC_KHO_DUMP, fdt);
+	err = notifier_to_errno(err);
+	if (err)
+		goto out;
+
+	/* Close / */
+	err =  fdt_end_node(fdt);
+	if (err)
+		goto out;
+
+	err = fdt_finish(fdt);
+	if (err)
+		goto out;
+
+	if (WARN_ON(fdt_check_header(fdt))) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	err = kho_expose_dt(fdt);
+
+out:
+	if (err) {
+		pr_err("failed to serialize state: %d", err);
+		kho_abort();
+	}
+	return err;
+}
+
+/* Handling for /sys/kernel/kho */
+
+#define KHO_ATTR_RO(_name) \
+	static struct kobj_attribute _name##_attr = __ATTR_RO_MODE(_name, 0400)
+#define KHO_ATTR_RW(_name) \
+	static struct kobj_attribute _name##_attr = __ATTR_RW_MODE(_name, 0600)
+
+static ssize_t active_store(struct kobject *dev, struct kobj_attribute *attr,
+			    const char *buf, size_t size)
+{
+	ssize_t retsize = size;
+	bool val = false;
+	int ret;
+
+	if (kstrtobool(buf, &val) < 0)
+		return -EINVAL;
+
+	if (!kho_enable)
+		return -EOPNOTSUPP;
+	if (!kho_scratch_cnt)
+		return -ENOMEM;
+
+	mutex_lock(&kho_out.lock);
+	if (val != kho_out.active) {
+		if (val) {
+			ret = kho_serialize();
+			if (ret) {
+				retsize = -EINVAL;
+				goto out;
+			}
+			kho_out.active = true;
+		} else {
+			kho_abort();
+		}
+	}
+
+out:
+	mutex_unlock(&kho_out.lock);
+	return retsize;
+}
+
+static ssize_t active_show(struct kobject *dev, struct kobj_attribute *attr,
+			   char *buf)
+{
+	ssize_t ret;
+
+	mutex_lock(&kho_out.lock);
+	ret = sysfs_emit(buf, "%d\n", kho_out.active);
+	mutex_unlock(&kho_out.lock);
+
+	return ret;
+}
+KHO_ATTR_RW(active);
+
+static ssize_t dt_max_store(struct kobject *dev, struct kobj_attribute *attr,
+			    const char *buf, size_t size)
+{
+	u64 val;
+
+	if (kstrtoull(buf, 0, &val))
+		return -EINVAL;
+
+	/* FDT already exists, it's too late to change dt_max */
+	if (kho_out.dt_len)
+		return -EBUSY;
+
+	kho_out.dt_max = val;
+
+	return size;
+}
+
+static ssize_t dt_max_show(struct kobject *dev, struct kobj_attribute *attr,
+			   char *buf)
+{
+	return sysfs_emit(buf, "0x%llx\n", kho_out.dt_max);
+}
+KHO_ATTR_RW(dt_max);
+
+static ssize_t scratch_len_show(struct kobject *dev, struct kobj_attribute *attr,
+				char *buf)
+{
+	ssize_t count = 0;
+
+	for (int i = 0; i < kho_scratch_cnt; i++)
+		count += sysfs_emit_at(buf, count, "0x%llx\n", kho_scratch[i].size);
+
+	return count;
+}
+KHO_ATTR_RO(scratch_len);
+
+static ssize_t scratch_phys_show(struct kobject *dev, struct kobj_attribute *attr,
+				 char *buf)
+{
+	ssize_t count = 0;
+
+	for (int i = 0; i < kho_scratch_cnt; i++)
+		count += sysfs_emit_at(buf, count, "0x%llx\n", kho_scratch[i].addr);
+
+	return count;
+}
+KHO_ATTR_RO(scratch_phys);
+
+static const struct attribute *kho_out_attrs[] = {
+	&active_attr.attr,
+	&dt_max_attr.attr,
+	&scratch_phys_attr.attr,
+	&scratch_len_attr.attr,
+	NULL,
+};
+
+static __init int kho_out_sysfs_init(void)
+{
+	int err;
+
+	kho_out.kobj = kobject_create_and_add("kho", kernel_kobj);
+	if (!kho_out.kobj)
+		return -ENOMEM;
+
+	err = sysfs_create_files(kho_out.kobj, kho_out_attrs);
+	if (err)
+		goto err_put_kobj;
+
+	return 0;
+
+err_put_kobj:
+	kobject_put(kho_out.kobj);
+	return err;
+}
+
+static __init int kho_init(void)
+{
+	int err;
+
+	if (!kho_enable)
+		return -EINVAL;
+
+	err = kho_out_sysfs_init();
+	if (err)
+		return err;
+
+	for (int i = 0; i < kho_scratch_cnt; i++) {
+		unsigned long base_pfn = PHYS_PFN(kho_scratch[i].addr);
+		unsigned long count = kho_scratch[i].size >> PAGE_SHIFT;
+		unsigned long pfn;
+
+		for (pfn = base_pfn; pfn < base_pfn + count;
+		     pfn += pageblock_nr_pages)
+			init_cma_reserved_pageblock(pfn_to_page(pfn));
+	}
+
+	return 0;
+}
+late_initcall(kho_init);
+
+/*
+ * The scratch areas are scaled by default as percent of memory allocated from
+ * memblock. A user can override the scale with command line parameter:
+ *
+ * kho_scratch=N%
+ *
+ * It is also possible to explicitly define size for a global and per-node
+ * scratch areas:
+ *
+ * kho_scratch=n[KMG],m[KMG]
+ *
+ * The explicit size definition takes precedence over scale definition.
+ */
+static unsigned int scratch_scale __initdata = 200;
+static phys_addr_t scratch_size_global __initdata;
+static phys_addr_t scratch_size_pernode __initdata;
+
+static int __init kho_parse_scratch_size(char *p)
+{
+	unsigned long size, size_pernode;
+	char *endptr, *oldp = p;
+
+	if (!p)
+		return -EINVAL;
+
+	size = simple_strtoul(p, &endptr, 0);
+	if (*endptr == '%') {
+		scratch_scale = size;
+		pr_notice("scratch scale is %d percent\n", scratch_scale);
+	} else {
+		size = memparse(p, &p);
+		if (!size || p == oldp)
+			return -EINVAL;
+
+		if (*p != ',')
+			return -EINVAL;
+
+		size_pernode = memparse(p + 1, &p);
+		if (!size_pernode)
+			return -EINVAL;
+
+		scratch_size_global = size;
+		scratch_size_pernode = size_pernode;
+		scratch_scale = 0;
+
+		pr_notice("scratch areas: global: %lluMB pernode: %lldMB\n",
+			  (u64)(scratch_size_global >> 20),
+			  (u64)(scratch_size_pernode >> 20));
+	}
+
+	return 0;
+}
+early_param("kho_scratch", kho_parse_scratch_size);
+
+static phys_addr_t __init scratch_size(int nid)
+{
+	phys_addr_t size;
+
+	if (scratch_scale) {
+		size = memblock_reserved_kern_size(nid) * scratch_scale / 100;
+	} else {
+		if (numa_valid_node(nid))
+			size = scratch_size_pernode;
+		else
+			size = scratch_size_global;
+	}
+
+	return round_up(size, CMA_MIN_ALIGNMENT_BYTES);
+}
+
+/**
+ * kho_reserve_scratch - Reserve a contiguous chunk of memory for kexec
+ *
+ * With KHO we can preserve arbitrary pages in the system. To ensure we still
+ * have a large contiguous region of memory when we search the physical address
+ * space for target memory, let's make sure we always have a large CMA region
+ * active. This CMA region will only be used for movable pages which are not a
+ * problem for us during KHO because we can just move them somewhere else.
+ */
+static void kho_reserve_scratch(void)
+{
+	phys_addr_t addr, size;
+	int nid, i = 1;
+
+	if (!kho_enable)
+		return;
+
+	/* FIXME: deal with node hot-plug/remove */
+	kho_scratch_cnt = num_online_nodes() + 1;
+	size = kho_scratch_cnt * sizeof(*kho_scratch);
+	kho_scratch = memblock_alloc(size, PAGE_SIZE);
+	if (!kho_scratch)
+		goto err_disable_kho;
+
+	/* reserve large contiguous area for allocations without nid */
+	size = scratch_size(NUMA_NO_NODE);
+	addr = memblock_phys_alloc(size, CMA_MIN_ALIGNMENT_BYTES);
+	if (!addr)
+		goto err_free_scratch_desc;
+
+	kho_scratch[0].addr = addr;
+	kho_scratch[0].size = size;
+
+	for_each_online_node(nid) {
+		size = scratch_size(nid);
+		addr = memblock_alloc_range_nid(size, CMA_MIN_ALIGNMENT_BYTES,
+						0, MEMBLOCK_ALLOC_ACCESSIBLE,
+						nid, true);
+		if (!addr)
+			goto err_free_scratch_areas;
+
+		kho_scratch[i].addr = addr;
+		kho_scratch[i].size = size;
+		i++;
+	}
+
+	return;
+
+err_free_scratch_areas:
+	for (i--; i >= 0; i--)
+		memblock_phys_free(kho_scratch[i].addr, kho_scratch[i].size);
+err_free_scratch_desc:
+	memblock_free(kho_scratch, kho_scratch_cnt * sizeof(*kho_scratch));
+err_disable_kho:
+	kho_enable = false;
+}
+
+void __init kho_memory_init(void)
+{
+	kho_reserve_scratch();
+}
diff --git a/mm/internal.h b/mm/internal.h
index 986ad9c2a8b2..fdd379fddf6d 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -841,9 +841,6 @@ int
 isolate_migratepages_range(struct compact_control *cc,
 			   unsigned long low_pfn, unsigned long end_pfn);
 
-/* Free whole pageblock and set its migration type to MIGRATE_CMA. */
-void init_cma_reserved_pageblock(struct page *page);
-
 #endif /* CONFIG_COMPACTION || CONFIG_CMA */
 
 int find_suitable_fallback(struct free_area *area, unsigned int order,
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 04441c258b05..60f08930e434 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -30,6 +30,7 @@
 #include <linux/crash_dump.h>
 #include <linux/execmem.h>
 #include <linux/vmstat.h>
+#include <linux/kexec.h>
 #include "internal.h"
 #include "slab.h"
 #include "shuffle.h"
@@ -2661,6 +2662,13 @@ void __init mm_core_init(void)
 	report_meminit();
 	kmsan_init_shadow();
 	stack_depot_early_init();
+
+	/*
+	 * KHO memory setup must happen while memblock is still active, but
+	 * as close as possible to buddy initialization
+	 */
+	kho_memory_init();
+
 	mem_init();
 	kmem_cache_init();
 	/*
-- 
2.47.2


