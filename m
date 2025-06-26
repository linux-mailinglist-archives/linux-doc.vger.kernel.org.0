Return-Path: <linux-doc+bounces-50648-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A99CDAE9261
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jun 2025 01:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7843A1C4359B
	for <lists+linux-doc@lfdr.de>; Wed, 25 Jun 2025 23:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671582DD5ED;
	Wed, 25 Jun 2025 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="hhwTiWjz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F102D97AB
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893556; cv=none; b=ms68IDl0PJzQWdeFbK10wSnTEtmhGsMhGR1ajei2lqOjkBAN3KFqgMBro3M05+0emY55+9vuxJukMv4eGR0IURQ9KP82Kp6T+TgOgEjVU+OPYdDtt/I1PQysS1tUF4bEyXv/rpRDSnMa080a0KPZOFGs9Nr9p4dhuZHQMT/QHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893556; c=relaxed/simple;
	bh=4uXFzkhAgls9Xj902YoK9MVGibAbK+dj8dD8nmwNbG0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8bAzdIv2S7bkjyDpHooYZWDZ4k5duP5V0ZrrQHpxKIBNk0KA2j+UyvD/zBThWs27tGGmvbOSoF7+QlGav45cSEz5/WiaK27LavdqkSnfvkFEfejOQu/ClMQmhwoyqKhEGRfhyumydzjDZc5rT9Kc9ccJuc158pj1fHFN6q0RQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=hhwTiWjz; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so341342276.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 16:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893553; x=1751498353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGXsAiDVkMVJtKH71i02C+/FO8+/QxHPULS+B5odwkM=;
        b=hhwTiWjz1STlhRISpXaDJdkVzPzWDl0Z7G7dvdSEJT0BNTyANX1GJc8Hl05HpBK8Uc
         dp6kAesaI4kmdzVrbXaswBGEkgQ9hvp9U5sFE9HYUIQIFTqrMPmecQ0jxssswZ3PGTbI
         /mbSRWp29SfL2PkxISna113cQYqTPAAYygnY2D5Q1iGWoyAE4cPRlnjdWLhcgklEBjLf
         EG1BZwbVqLzz9nTpQaVrBWEe77iwzlH+F681rjYSt9KcYuPtMle7tLnD/zFhShKfYfx0
         LCUeln0ONd1HEYxMuYLF8UX9zgB5ypOWhXpe5gTZ6RJz7uwWAGNKYaKDuvcUtItvVNPW
         AVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893553; x=1751498353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGXsAiDVkMVJtKH71i02C+/FO8+/QxHPULS+B5odwkM=;
        b=iVVOtnFzN5Da26VrPnHTYGbDjBFQ3QpbtoMQC+dmn/5GvniQhsxl/xghLiAtBFQfCd
         TmH0bOd7to0ZR0UgYd76bXkbGkOwav3Fo8vpgwQJlXrOGMehKUjMJYM9FguG7YNakio4
         4z4PsvjhR564E3tVbgMjk9t2dQcM+9VodzVtJ9pEvBI2NGaf1pXQDxWJEk97txaaZlGq
         z7dXByb2ZRU+/Gr6r7KwAJipFr1hn1EnBpFHM0o2EMSp9+fho0pUyaOKKiXE5UYAent/
         4uLDNxaYrIVFYFK0INzVba8ise1z0jEKh56O2oL/WXFamCkzuFQjVubQiKZwT60OPj83
         0HWw==
X-Forwarded-Encrypted: i=1; AJvYcCX+ezmuwhI9MaWIbNQdc0gd0ptqcdr5bcOQHfkxW7J3uYYaC9oQ1qaRyyCFRnkKbB6+j428Hs9M9nc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy//EEdw1u8ZXVTV94+jIv+mzbGlgXdRZPvX3yV9Yupls0c3Emj
	+gUwNSi7rh4f0saO863snpMkLOIje4vi0TcenCuJQlkBsRlicj6+siSUJkwrsup/7d8=
X-Gm-Gg: ASbGncvsyUpiZFPBnBY9OZgcxBdY9ruCx+AoaJr6twfpyo652iaU6W+UaYwATDBjBIu
	TBUm1BfkQb+nrpdFyQ0krPBvxvaEO15Jn8wTkCQpPP7M1FyjfGXeeobxAIIDJdsbYUkDHXE7Qdn
	WIPC5WYswr3ObQqN1qX7AmBzxDEzyMqaLrRn2M6KxypIK/i65Gkh6hLkyfh3QE5B0iZFTsZK03S
	oYY2EoTIvNoJ/bu3wdq6/rGN+2I+kd2uIlU3ionOZlPNoBVwZXmD2MucKAsyqxy33JEzrOsdlMD
	m+3WrR6Rh4i/95l5ex62iujnBtxtPb/+eD6U/cJEV2WW+QRlR2oe+dEajNEdKeJ52QVVcm8l4v3
	P4n6UR8h+fdJUljQ6MZzigrwLYsqXzItJF6xPWPd1Ny33uzcWQJi/
X-Google-Smtp-Source: AGHT+IHdS1AStvuIn7CbxKX1ftelfPKYabeTwO6G58N8aQkbNpg+M43jhUkLMwJemZXj4yOKAfCWAg==
X-Received: by 2002:a05:6902:114a:b0:e82:ff8:e6a1 with SMTP id 3f1490d57ef6-e86017a7afemr5969375276.2.1750893552587;
        Wed, 25 Jun 2025 16:19:12 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:19:12 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 17/32] liveupdate: luo_sysfs: add sysfs state monitoring
Date: Wed, 25 Jun 2025 23:18:04 +0000
Message-ID: <20250625231838.1897085-18-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a sysfs interface for the Live Update Orchestrator
under /sys/kernel/liveupdate/. This interface provides a way for
userspace tools and scripts to monitor the current state of the LUO
state machine.

The main feature is a read-only file, state, which displays the
current LUO state as a string ("normal", "prepared", "frozen",
"updated"). The interface uses sysfs_notify to allow userspace
listeners (e.g., via poll) to be efficiently notified of state changes.

ABI documentation for this new sysfs interface is added in
Documentation/ABI/testing/sysfs-kernel-liveupdate.

This read-only sysfs interface complements the main ioctl interface
provided by /dev/liveupdate, which handles LUO control operations and
resource management.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../ABI/testing/sysfs-kernel-liveupdate       | 51 ++++++++++
 kernel/liveupdate/Kconfig                     | 18 ++++
 kernel/liveupdate/Makefile                    |  1 +
 kernel/liveupdate/luo_core.c                  |  1 +
 kernel/liveupdate/luo_internal.h              |  6 ++
 kernel/liveupdate/luo_sysfs.c                 | 92 +++++++++++++++++++
 6 files changed, 169 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-liveupdate
 create mode 100644 kernel/liveupdate/luo_sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-kernel-liveupdate b/Documentation/ABI/testing/sysfs-kernel-liveupdate
new file mode 100644
index 000000000000..4cd4a4fe2f93
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-liveupdate
@@ -0,0 +1,51 @@
+What:		/sys/kernel/liveupdate/
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	pasha.tatashin@soleen.com
+Description:	Directory containing interfaces to query the live
+		update orchestrator. Live update is the ability to reboot the
+		host kernel (e.g., via kexec, without a full power cycle) while
+		keeping specifically designated devices operational ("alive")
+		across the transition. After the new kernel boots, these devices
+		can be re-attached to their original workloads (e.g., virtual
+		machines) with their state preserved. This is particularly
+		useful, for example, for quick hypervisor updates without
+		terminating running virtual machines.
+
+
+What:		/sys/kernel/liveupdate/state
+Date:		May 2025
+KernelVersion:	6.16.0
+Contact:	pasha.tatashin@soleen.com
+Description:	Read-only file that displays the current state of the live
+		update orchestrator as a string. Possible values are:
+
+		"normal":	No live update operation is in progress. This is
+				the default operational state.
+
+		"prepared":	The live update preparation phase has completed
+				successfully (e.g., triggered via the
+				/dev/liveupdate event). Kernel subsystems have
+				been notified via the %LIVEUPDATE_PREPARE
+				event/callback and should have initiated state
+				saving. User workloads (e.g., VMs) are generally
+				still running, but some operations (like device
+				unbinding or new DMA mappings) might be
+				restricted. The system is ready for the reboot
+				trigger.
+
+		"frozen":	The final reboot notification has been sent
+				(e.g., triggered via the 'reboot()' syscall),
+				corresponding to the %LIVEUPDATE_REBOOT kernel
+				event. Subsystems have had their final chance to
+				save state. User workloads must be suspended.
+				The system is about to execute the reboot into
+				the new kernel (imminent kexec). This state
+				corresponds to the "blackout window".
+
+		"updated":	The system has successfully rebooted into the
+				new kernel via live update. Restoration of
+				preserved resources can now occur (typically via
+				ioctl commands). The system is awaiting the
+				final 'finish' signal after user space completes
+				restoration tasks.
diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index f6b0bde188d9..75a17ca8a592 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -29,6 +29,24 @@ config LIVEUPDATE
 
 	  If unsure, say N.
 
+config LIVEUPDATE_SYSFS_API
+	bool "Live Update sysfs monitoring interface"
+	depends on SYSFS
+	depends on LIVEUPDATE
+	help
+	  Enable a sysfs interface for the Live Update Orchestrator
+	  at /sys/kernel/liveupdate/.
+
+	  This allows monitoring the LUO state ('normal', 'prepared',
+	  'frozen', 'updated') via the read-only 'state' file.
+
+	  This interface complements the primary /dev/liveupdate ioctl
+	  interface, which handles the full update process.
+	  This sysfs API may be useful for scripting, or userspace monitoring
+	  needed to coordinate application restarts and minimize downtime.
+
+	  If unsure, say N.
+
 config KEXEC_HANDOVER
 	bool "kexec handover"
 	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index cb3ea380f6b9..e35ddc51ab2b 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_LIVEUPDATE)		+= luo_core.o
 obj-$(CONFIG_LIVEUPDATE)		+= luo_files.o
 obj-$(CONFIG_LIVEUPDATE)		+= luo_ioctl.o
 obj-$(CONFIG_LIVEUPDATE)		+= luo_subsystems.o
+obj-$(CONFIG_LIVEUPDATE_SYSFS_API)	+= luo_sysfs.o
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index fff84c51d986..41dbe784445e 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -100,6 +100,7 @@ static inline bool is_current_luo_state(enum liveupdate_state expected_state)
 static void __luo_set_state(enum liveupdate_state state)
 {
 	WRITE_ONCE(luo_state, state);
+	luo_sysfs_notify();
 }
 
 static inline void luo_set_state(enum liveupdate_state state)
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index f77e8b3044f9..05cd861ed2a8 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -29,4 +29,10 @@ int luo_retrieve_file(u64 token, struct file **filep);
 int luo_register_file(u64 token, int fd);
 int luo_unregister_file(u64 token);
 
+#ifdef CONFIG_LIVEUPDATE_SYSFS_API
+void luo_sysfs_notify(void);
+#else
+static inline void luo_sysfs_notify(void) {}
+#endif
+
 #endif /* _LINUX_LUO_INTERNAL_H */
diff --git a/kernel/liveupdate/luo_sysfs.c b/kernel/liveupdate/luo_sysfs.c
new file mode 100644
index 000000000000..935946bb741b
--- /dev/null
+++ b/kernel/liveupdate/luo_sysfs.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: LUO sysfs interface
+ *
+ * Provides a sysfs interface at ``/sys/kernel/liveupdate/`` for monitoring LUO
+ * state.  Live update allows rebooting the kernel (via kexec) while preserving
+ * designated device state for attached workloads (e.g., VMs), useful for
+ * minimizing downtime during hypervisor updates.
+ *
+ * /sys/kernel/liveupdate/state
+ * ----------------------------
+ * - Permissions:  Read-only
+ * - Description:  Displays the current LUO state string.
+ * - Valid States:
+ *     @normal
+ *       Idle state.
+ *     @prepared
+ *       Preparation phase complete (triggered via '/dev/liveupdate'). Resources
+ *       checked, state saving initiated via %LIVEUPDATE_PREPARE event.
+ *       Workloads mostly running but may be restricted. Ready forreboot
+ *       trigger.
+ *     @frozen
+ *       Final reboot notification sent (triggered via 'reboot'). Corresponds to
+ *       %LIVEUPDATE_REBOOT event. Final state saving. Workloads must be
+ *       suspended. System about to kexec ("blackout window").
+ *     @updated
+ *       New kernel booted via live update. Awaiting 'finish' signal.
+ *
+ * Userspace Interaction & Blackout Window Reduction
+ * -------------------------------------------------
+ * Userspace monitors the ``state`` file to coordinate actions:
+ *   - Suspend workloads before @frozen state is entered.
+ *   - Initiate resource restoration upon entering @updated state.
+ *   - Resume workloads after restoration, minimizing downtime.
+ */
+
+#include <linux/kobject.h>
+#include <linux/liveupdate.h>
+#include <linux/sysfs.h>
+#include "luo_internal.h"
+
+static bool luo_sysfs_initialized;
+
+#define LUO_DIR_NAME	"liveupdate"
+
+void luo_sysfs_notify(void)
+{
+	if (luo_sysfs_initialized)
+		sysfs_notify(kernel_kobj, LUO_DIR_NAME, "state");
+}
+
+/* Show the current live update state */
+static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	return sysfs_emit(buf, "%s\n", luo_current_state_str());
+}
+
+static struct kobj_attribute state_attribute = __ATTR_RO(state);
+
+static struct attribute *luo_attrs[] = {
+	&state_attribute.attr,
+	NULL
+};
+
+static struct attribute_group luo_attr_group = {
+	.attrs = luo_attrs,
+	.name = LUO_DIR_NAME,
+};
+
+static int __init luo_init(void)
+{
+	int ret;
+
+	ret = sysfs_create_group(kernel_kobj, &luo_attr_group);
+	if (ret) {
+		pr_err("Failed to create group\n");
+		return ret;
+	}
+
+	luo_sysfs_initialized = true;
+	pr_info("Initialized\n");
+
+	return 0;
+}
+subsys_initcall(luo_init);
-- 
2.50.0.727.gbf7dc18ff4-goog


