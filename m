Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D932D3569
	for <lists+linux-doc@lfdr.de>; Tue,  8 Dec 2020 22:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730057AbgLHVhN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Dec 2020 16:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730026AbgLHVhL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Dec 2020 16:37:11 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1021CC0617B0
        for <linux-doc@vger.kernel.org>; Tue,  8 Dec 2020 13:36:08 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id a22so14922835qtx.20
        for <linux-doc@vger.kernel.org>; Tue, 08 Dec 2020 13:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=XhF5Hcc6koONhkWDQpHUqS395Llh4/sgpQP6VulQGUU=;
        b=Oam+VD+MNzs23sqT4/pWUG4RPE8321OvwxZHYq3AWTzjmcqI3tFstcSk3DaXMQzy8G
         VNTkZeXwWVpiidvPLQfACUOtNqF/9hMCfiOIV+HJLbLe9wjuVQujD/bfCZiXPCqeIF0w
         HZOE4CfMecoPpZ/b9NHxJ2aUlGlzV5bSlde4m+OGbn4O4BLQlquc8kpQTKdtCnxskX94
         KLIhKFhY3Qq/IlmkyyN4vqSzAVqAdvRjnW9XwFc5YoZYBW4ai7EnQWqIQBGG83kGZljs
         K7uXi1636ZmnCoTQ8FOizhpq/xH/ZewsmbTtqBJcjAO/Hrjy6A/pNHuq7WinaJwydRiz
         E3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XhF5Hcc6koONhkWDQpHUqS395Llh4/sgpQP6VulQGUU=;
        b=pZU9pQIu+oc/SVHYTxgLZkcl0yljCAR11wQeqDNc6GPFZ2aXs5Vramd/gVsGB4Vj6V
         Zym0yvc1nHd/HRjuOxlJnfqmcgfmn6puUZ8eU8PjRa8SRMNKFJSospFfZc3bCm/hu4no
         TnQGnlv7D7Cz6RnimGL+ZJUc1K/19O0CJejeXt0QVwPPKs1MTJlI1h0SK85Nb9x0oNUr
         UCtJ8Mx23HotXSNHlW37nIdEVDdKjnNzIIXnPdBTpy+zB0mwWJUoda4KwsAUj9aXQPrS
         FLNe7EWLkOjBDFG5nhVP1ZU5x4IFAz00q8P+n8yP229wcTmzStkFxyRhB3Vf4U44WDwK
         suJw==
X-Gm-Message-State: AOAM533wnvItgV3TlA6fQ44NEiUTDegj4Vwg0THrJkeSugfarSdlFCXQ
        TS3TRNa9ff5OPIEMG6NVqijDI1ED3sBD
X-Google-Smtp-Source: ABdhPJyIc4GgpUbmNcKmbE0TWlCzpJelQZRXkSG8BXyvghiZAkOqJx94UdyCbSNX+ZDDwnGOZvXpkqLzE5Ov
Sender: "vipinsh via sendgmr" <vipinsh@vipinsh.kir.corp.google.com>
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:1ea0:b8ff:fe75:b885])
 (user=vipinsh job=sendgmr) by 2002:ad4:5192:: with SMTP id
 b18mr3638093qvp.46.1607463366983; Tue, 08 Dec 2020 13:36:06 -0800 (PST)
Date:   Tue,  8 Dec 2020 13:35:30 -0800
In-Reply-To: <20201208213531.2626955-1-vipinsh@google.com>
Message-Id: <20201208213531.2626955-2-vipinsh@google.com>
Mime-Version: 1.0
References: <20201208213531.2626955-1-vipinsh@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [Patch v2 1/2] cgroup: SVM: Add Encryption ID controller
From:   Vipin Sharma <vipinsh@google.com>
To:     thomas.lendacky@amd.com, brijesh.singh@amd.com, jon.grimm@amd.com,
        eric.vantassell@amd.com, pbonzini@redhat.com, seanjc@google.com,
        tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        frankja@linux.ibm.com, borntraeger@de.ibm.com, corbet@lwn.net
Cc:     joro@8bytes.org, vkuznets@redhat.com, wanpengli@tencent.com,
        jmattson@google.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, gingell@google.com,
        rientjes@google.com, dionnaglaze@google.com, kvm@vger.kernel.org,
        x86@kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hardware memory encryption is available on multiple generic CPUs. For
example AMD has Secure Encrypted Virtualization (SEV) and SEV -
Encrypted State (SEV-ES).

These memory encryptions are useful in creating encrypted virtual
machines (VMs) and user space programs.

There are limited number of encryption IDs that can be used
simultaneously on a machine for encryption. This generates a need for
the system admin to track, limit, allocate resources, and optimally
schedule VMs and user workloads in the cloud infrastructure. Some
malicious programs can exhaust all of these resources on a host causing
starvation of other workloads.

Encryption ID controller allows control of these resources using
Cgroups.

Controller is enabled by CGROUP_ENCRYPTION_IDS config option.
Encryption controller provide 3 interface files for each encryption ID
type. For example, in SEV:

1. encryption_ids.sev.stat
	Shown only at the root cgroup. Displays total SEV IDs available
	on the platform and current usage count.
2. encrpytion_ids.sev.max
	Sets the maximum usage of SEV IDs in the cgroup.
3. encryption_ids.sev.current
	Current usage of SEV IDs in the cgroup and its children.

Other ID types can be easily added in the controller in the same way.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Reviewed-by: David Rientjes <rientjes@google.com>
Reviewed-by: Dionna Glaze <dionnaglaze@google.com>
---
 arch/x86/kvm/svm/sev.c                |  28 +-
 include/linux/cgroup_subsys.h         |   4 +
 include/linux/encryption_ids_cgroup.h |  70 +++++
 include/linux/kvm_host.h              |   4 +
 init/Kconfig                          |  14 +
 kernel/cgroup/Makefile                |   1 +
 kernel/cgroup/encryption_ids.c        | 430 ++++++++++++++++++++++++++
 7 files changed, 544 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/encryption_ids_cgroup.h
 create mode 100644 kernel/cgroup/encryption_ids.c

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 566f4d18185b..83c23d1d568a 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -14,6 +14,7 @@
 #include <linux/psp-sev.h>
 #include <linux/pagemap.h>
 #include <linux/swap.h>
+#include <linux/encryption_ids_cgroup.h>
 
 #include "x86.h"
 #include "svm.h"
@@ -77,10 +78,14 @@ static bool __sev_recycle_asids(void)
 	return true;
 }
 
-static int sev_asid_new(void)
+static int sev_asid_new(struct kvm *kvm)
 {
 	bool retry = true;
-	int pos;
+	int pos, ret;
+
+	ret = enc_id_cg_try_charge(kvm, ENCRYPTION_ID_SEV, 1);
+	if (ret)
+		return ret;
 
 	mutex_lock(&sev_bitmap_lock);
 
@@ -95,7 +100,8 @@ static int sev_asid_new(void)
 			goto again;
 		}
 		mutex_unlock(&sev_bitmap_lock);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto e_uncharge;
 	}
 
 	__set_bit(pos, sev_asid_bitmap);
@@ -103,6 +109,9 @@ static int sev_asid_new(void)
 	mutex_unlock(&sev_bitmap_lock);
 
 	return pos + 1;
+e_uncharge:
+	enc_id_cg_uncharge(kvm, ENCRYPTION_ID_SEV, 1);
+	return ret;
 }
 
 static int sev_get_asid(struct kvm *kvm)
@@ -112,7 +121,7 @@ static int sev_get_asid(struct kvm *kvm)
 	return sev->asid;
 }
 
-static void sev_asid_free(int asid)
+static void sev_asid_free(struct kvm *kvm, int asid)
 {
 	struct svm_cpu_data *sd;
 	int cpu, pos;
@@ -128,6 +137,7 @@ static void sev_asid_free(int asid)
 	}
 
 	mutex_unlock(&sev_bitmap_lock);
+	enc_id_cg_uncharge(kvm, ENCRYPTION_ID_SEV, 1);
 }
 
 static void sev_unbind_asid(struct kvm *kvm, unsigned int handle)
@@ -172,7 +182,7 @@ static int sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	if (unlikely(sev->active))
 		return ret;
 
-	asid = sev_asid_new();
+	asid = sev_asid_new(kvm);
 	if (asid < 0)
 		return ret;
 
@@ -187,7 +197,7 @@ static int sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	return 0;
 
 e_free:
-	sev_asid_free(asid);
+	sev_asid_free(kvm, asid);
 	return ret;
 }
 
@@ -1122,7 +1132,7 @@ void sev_vm_destroy(struct kvm *kvm)
 	mutex_unlock(&kvm->lock);
 
 	sev_unbind_asid(kvm, sev->handle);
-	sev_asid_free(sev->asid);
+	sev_asid_free(kvm, sev->asid);
 }
 
 int __init sev_hardware_setup(void)
@@ -1148,6 +1158,9 @@ int __init sev_hardware_setup(void)
 	if (!sev_reclaim_asid_bitmap)
 		return 1;
 
+	if (enc_id_cg_set_capacity(ENCRYPTION_ID_SEV, max_sev_asid))
+		return 1;
+
 	status = kmalloc(sizeof(*status), GFP_KERNEL);
 	if (!status)
 		return 1;
@@ -1177,6 +1190,7 @@ void sev_hardware_teardown(void)
 
 	bitmap_free(sev_asid_bitmap);
 	bitmap_free(sev_reclaim_asid_bitmap);
+	enc_id_cg_set_capacity(ENCRYPTION_ID_SEV, 0);
 
 	sev_flush_asids();
 }
diff --git a/include/linux/cgroup_subsys.h b/include/linux/cgroup_subsys.h
index acb77dcff3b4..83754f58c05e 100644
--- a/include/linux/cgroup_subsys.h
+++ b/include/linux/cgroup_subsys.h
@@ -61,6 +61,10 @@ SUBSYS(pids)
 SUBSYS(rdma)
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_ENCRYPTION_IDS)
+SUBSYS(encryption_ids)
+#endif
+
 /*
  * The following subsystems are not supported on the default hierarchy.
  */
diff --git a/include/linux/encryption_ids_cgroup.h b/include/linux/encryption_ids_cgroup.h
new file mode 100644
index 000000000000..f3d23d85bad7
--- /dev/null
+++ b/include/linux/encryption_ids_cgroup.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Encryption IDs cgroup controller.
+ *
+ * Copyright 2020 Google LLC
+ * Author: Vipin Sharma <vipinsh@google.com>
+ */
+#ifndef _ENCRYPTION_IDS_CGROUP_H_
+#define _ENCRYPTION_IDS_CGROUP_H_
+
+#include <linux/cgroup-defs.h>
+#include <linux/kvm_types.h>
+
+/**
+ * Types of encryption IDs supported by the host.
+ */
+enum encryption_id_type {
+#ifdef CONFIG_KVM_AMD_SEV
+	ENCRYPTION_ID_SEV,
+#endif
+	ENCRYPTION_ID_TYPES
+};
+
+/**
+ * struct encryption_id_res: Per cgroup per encryption ID resource
+ * @max: Maximum count of encryption ID that can be used.
+ * @usage: Current usage of encryption ID in the cgroup.
+ */
+struct encryption_id_res {
+	unsigned int max;
+	unsigned int usage;
+};
+
+/**
+ * struct encryption_id_cgroup - Encryption IDs controller's cgroup structure.
+ * @css: cgroup subsys state object.
+ * @ids: Array of encryption IDs resource usage in the cgroup.
+ */
+struct encryption_id_cgroup {
+	struct cgroup_subsys_state css;
+	struct encryption_id_res res[ENCRYPTION_ID_TYPES];
+};
+
+#ifdef CONFIG_CGROUP_ENCRYPTION_IDS
+int enc_id_cg_set_capacity(enum encryption_id_type type, unsigned int capacity);
+int enc_id_cg_try_charge(struct kvm *kvm, enum encryption_id_type type,
+			 unsigned int amount);
+void enc_id_cg_uncharge(struct kvm *kvm, enum encryption_id_type type,
+			unsigned int amount);
+#else
+static inline int enc_id_cg_set_capacity(enum encryption_id_type type,
+					 unsigned int capacity)
+{
+	return 0;
+}
+
+static inline int enc_id_cg_try_charge(struct kvm *kvm,
+				       enum encryption_id_type type,
+				       unsigned int amount)
+{
+	return 0;
+}
+
+static inline void enc_id_cg_uncharge(struct kvm *kvm,
+				      enum encryption_id_type type,
+				      unsigned int amount)
+{
+}
+#endif /* CONFIG_CGROUP_ENCRYPTION_IDS */
+#endif /* _ENCRYPTION_CGROUP_H_ */
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7f2e2a09ebbd..4c20b8fb1374 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -27,6 +27,7 @@
 #include <linux/refcount.h>
 #include <linux/nospec.h>
 #include <asm/signal.h>
+#include <linux/encryption_ids_cgroup.h>
 
 #include <linux/kvm.h>
 #include <linux/kvm_para.h>
@@ -505,6 +506,9 @@ struct kvm {
 	struct srcu_struct irq_srcu;
 	pid_t userspace_pid;
 	unsigned int max_halt_poll_ns;
+#ifdef CONFIG_CGROUP_ENCRYPTION_IDS
+	struct encryption_id_cgroup *enc_id_cg;
+#endif
 };
 
 #define kvm_err(fmt, ...) \
diff --git a/init/Kconfig b/init/Kconfig
index 0872a5a2e759..8266acf92a54 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1106,6 +1106,20 @@ config CGROUP_BPF
 	  BPF_CGROUP_INET_INGRESS will be executed on the ingress path of
 	  inet sockets.
 
+config CGROUP_ENCRYPTION_IDS
+	bool "Encryption IDs controller"
+	depends on KVM_AMD_SEV
+	default n
+	help
+	  Provides a controller for CPU encryption IDs on a host.
+
+	  Some platforms have limited number of encryption IDs which can be
+	  used simultaneously, e.g., AMD's Secure Encrypted Virtualization
+	  (SEV). This controller tracks and limits the total number of IDs used
+	  by processes attached to a cgroup hierarchy. For more information,
+	  please check Encryption IDs section in
+	  /Documentation/admin-guide/cgroup-v2.rst.
+
 config CGROUP_DEBUG
 	bool "Debug controller"
 	default n
diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
index 5d7a76bfbbb7..6c19208dfb7f 100644
--- a/kernel/cgroup/Makefile
+++ b/kernel/cgroup/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_CGROUP_FREEZER) += legacy_freezer.o
 obj-$(CONFIG_CGROUP_PIDS) += pids.o
 obj-$(CONFIG_CGROUP_RDMA) += rdma.o
 obj-$(CONFIG_CPUSETS) += cpuset.o
+obj-$(CONFIG_CGROUP_ENCRYPTION_IDS) += encryption_ids.o
 obj-$(CONFIG_CGROUP_DEBUG) += debug.o
diff --git a/kernel/cgroup/encryption_ids.c b/kernel/cgroup/encryption_ids.c
new file mode 100644
index 000000000000..2a3ae6b45d7c
--- /dev/null
+++ b/kernel/cgroup/encryption_ids.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Encryption IDs cgroup controller
+ *
+ * Copyright 2020 Google LLC
+ * Author: Vipin Sharma <vipinsh@google.com>
+ */
+
+#include <linux/limits.h>
+#include <linux/cgroup.h>
+#include <linux/errno.h>
+#include <linux/spinlock.h>
+#include <linux/lockdep.h>
+#include <linux/slab.h>
+#include <linux/kvm_host.h>
+#include <linux/encryption_ids_cgroup.h>
+
+#define MAX_STR "max"
+#define MAX_NUM UINT_MAX
+
+/* Root Encryption ID cgroup */
+static struct encryption_id_cgroup root_cg;
+
+/* Lock for tracking and updating encryption ID resources. */
+static DEFINE_SPINLOCK(enc_id_cg_lock);
+
+/* Encryption ID types capacity. */
+static unsigned int enc_id_capacity[ENCRYPTION_ID_TYPES];
+
+/**
+ * css_enc() - Get encryption ID cgroup from the css.
+ * @css: cgroup subsys state object.
+ *
+ * Context: Any context.
+ * Return:
+ * * %NULL - If @css is null.
+ * * struct encryption_id_cgroup* - Encryption ID cgroup pointer of the passed
+ *				    css.
+ */
+static struct encryption_id_cgroup *css_enc(struct cgroup_subsys_state *css)
+{
+	return css ? container_of(css, struct encryption_id_cgroup, css) : NULL;
+}
+
+/**
+ * parent_enc() - Get the parent of the passed encryption ID cgroup.
+ * @cgroup: cgroup whose parent needs to be fetched.
+ *
+ * Context: Any context.
+ * Return:
+ * * struct encryption_id_cgroup* - Parent of the @cgroup.
+ * * %NULL - If @cgroup is null or the passed cgroup does not have a parent.
+ */
+static struct encryption_id_cgroup *
+parent_enc(struct encryption_id_cgroup *cgroup)
+{
+	return cgroup ? css_enc(cgroup->css.parent) : NULL;
+}
+
+/**
+ * valid_type() - Check if @type is valid or not.
+ * @type: encryption ID type.
+ *
+ * Context: Any context.
+ * Return:
+ * * true - If valid type.
+ * * false - If not valid type.
+ */
+static inline bool valid_type(enum encryption_id_type type)
+{
+	return type >= 0 && type < ENCRYPTION_ID_TYPES;
+}
+
+/**
+ * enc_id_cg_uncharge_hierarchy() - Uncharge the enryption ID cgroup hierarchy.
+ * @start_cg: Starting cgroup.
+ * @stop_cg: cgroup at which uncharge stops.
+ * @type: type of encryption ID to uncharge.
+ * @amount: Charge amount.
+ *
+ * Uncharge the cgroup tree from the given start cgroup to the stop cgroup.
+ *
+ * Context: Any context. Expects enc_id_cg_lock to be held by the caller.
+ */
+static void enc_id_cg_uncharge_hierarchy(struct encryption_id_cgroup *start_cg,
+					 struct encryption_id_cgroup *stop_cg,
+					 enum encryption_id_type type,
+					 unsigned int amount)
+{
+	struct encryption_id_cgroup *i;
+
+	lockdep_assert_held(&enc_id_cg_lock);
+
+	for (i = start_cg; i != stop_cg; i = parent_enc(i)) {
+		WARN_ON_ONCE(i->res[type].usage < amount);
+		i->res[type].usage -= amount;
+	}
+	css_put(&start_cg->css);
+}
+
+/**
+ * enc_id_cg_set_capacity() - Set the capacity of the encryption ID.
+ * @type: Type of the encryption ID.
+ * @capacity: Supported capacity of the encryption ID on the host.
+ *
+ * If capacity is 0 then the charging a cgroup fails for the encryption ID.
+ *
+ * Context: Any context. Takes and releases enc_id_cg_lock.
+ * Return:
+ * * %0 - Successfully registered the capacity.
+ * * %-EINVAL - If @type is invalid.
+ * * %-EBUSY - If current usage is more than the capacity.
+ */
+int enc_id_cg_set_capacity(enum encryption_id_type type, unsigned int capacity)
+{
+	int ret = 0;
+	unsigned long flags;
+
+	if (!valid_type(type))
+		return -EINVAL;
+
+	spin_lock_irqsave(&enc_id_cg_lock, flags);
+
+	if (WARN_ON_ONCE(root_cg.res[type].usage > capacity))
+		ret = -EBUSY;
+	else
+		enc_id_capacity[type] = capacity;
+
+	spin_unlock_irqrestore(&enc_id_cg_lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(enc_id_cg_set_capacity);
+
+/**
+ * enc_id_cg_try_charge() - Try charging encryption ID cgroup.
+ * @kvm: kvm to store charged cgroup.
+ * @type: Encryption ID type to charge.
+ * @amount: Amount to charge.
+ *
+ * Charge @amount to the cgroup to which the current task belongs to. Charged
+ * cgroup will be pointed by @cg. Caller must use the same cgroup during
+ * uncharge call.
+ *
+ * Context: Any context. Takes and releases enc_id_cg_lock.
+ * Return:
+ * * %0 - If successfully charged.
+ * * -EINVAL - If @type is invalid or encryption ID has 0 capacity.
+ * * -EBUSY - If max limit will be crossed or total usage will be more than the
+ *	      capacity.
+ */
+int enc_id_cg_try_charge(struct kvm *kvm, enum encryption_id_type type,
+			 unsigned int amount)
+{
+	struct encryption_id_cgroup *task_cg, *i;
+	struct encryption_id_res *id_res;
+	int ret;
+	unsigned int new_usage;
+	unsigned long flags;
+
+	if (!valid_type(type) || !kvm)
+		return -EINVAL;
+
+	if (!amount)
+		return 0;
+
+	spin_lock_irqsave(&enc_id_cg_lock, flags);
+
+	if (!enc_id_capacity[type]) {
+		ret = -EINVAL;
+		goto err_capacity;
+	}
+
+	task_cg = css_enc(task_get_css(current, encryption_ids_cgrp_id));
+
+	for (i = task_cg; i; i = parent_enc(i)) {
+		id_res = &i->res[type];
+
+		new_usage = id_res->usage + amount;
+		WARN_ON_ONCE(new_usage < id_res->usage);
+
+		if (new_usage > id_res->max ||
+		    new_usage > enc_id_capacity[type]) {
+			ret = -EBUSY;
+			goto err_charge;
+		}
+
+		id_res->usage = new_usage;
+	}
+
+	kvm->enc_id_cg = task_cg;
+	spin_unlock_irqrestore(&enc_id_cg_lock, flags);
+	return 0;
+
+err_charge:
+	enc_id_cg_uncharge_hierarchy(task_cg, i, type, amount);
+err_capacity:
+	spin_unlock_irqrestore(&enc_id_cg_lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL(enc_id_cg_try_charge);
+
+/**
+ * enc_id_cg_uncharge() - Uncharge the encryption ID cgroup.
+ * @kvm: kvm containing the corresponding encryption ID cgroup.
+ * @type: Encryption ID which was charged.
+ * @amount: Charged amount.
+ *
+ * Context: Any context. Takes and releases enc_id_cg_lock.
+ */
+void enc_id_cg_uncharge(struct kvm *kvm, enum encryption_id_type type,
+			unsigned int amount)
+{
+	unsigned long flags;
+
+	if (!amount)
+		return;
+	if (!valid_type(type))
+		return;
+	if (!kvm || WARN_ON_ONCE(!(kvm->enc_id_cg)))
+		return;
+
+	spin_lock_irqsave(&enc_id_cg_lock, flags);
+	enc_id_cg_uncharge_hierarchy(kvm->enc_id_cg, NULL, type, amount);
+	spin_unlock_irqrestore(&enc_id_cg_lock, flags);
+
+	kvm->enc_id_cg = NULL;
+}
+EXPORT_SYMBOL(enc_id_cg_uncharge);
+
+/**
+ * enc_id_cg_max_show() - Show encryption ID cgroup max limit.
+ * @sf: Interface file
+ * @v: Arguments passed
+ *
+ * Uses cft->private value to determine for which enryption ID type results be
+ * shown.
+ *
+ * Context: Any context.
+ * Return: 0 to denote successful print.
+ */
+static int enc_id_cg_max_show(struct seq_file *sf, void *v)
+{
+	struct encryption_id_cgroup *cg = css_enc(seq_css(sf));
+	enum encryption_id_type type = seq_cft(sf)->private;
+
+	if (cg->res[type].max == MAX_NUM)
+		seq_printf(sf, "%s\n", MAX_STR);
+	else
+		seq_printf(sf, "%u\n", cg->res[type].max);
+
+	return 0;
+}
+
+/**
+ * enc_id_cg_max_write() - Update the maximum limit of the cgroup.
+ * @of: Handler for the file.
+ * @buf: Data from the user. It should be either "max", 0, or a positive
+ *	 integer.
+ * @nbytes: Number of bytes of the data.
+ * @off: Offset in the file.
+ *
+ * Uses cft->private value to determine for which enryption ID type results be
+ * shown.
+ *
+ * Context: Any context. Takes and releases enc_id_cg_lock.
+ * Return:
+ * * >= 0 - Number of bytes processed in the input.
+ * * -EINVAL - If buf is not valid.
+ * * -ERANGE - If number is bigger than unsigned int capacity.
+ * * -EBUSY - If usage can become more than max limit.
+ */
+static ssize_t enc_id_cg_max_write(struct kernfs_open_file *of, char *buf,
+				   size_t nbytes, loff_t off)
+{
+	struct encryption_id_cgroup *cg;
+	unsigned int max;
+	int ret = 0;
+	unsigned long flags;
+	enum encryption_id_type type;
+
+	buf = strstrip(buf);
+	if (!strcmp(MAX_STR, buf)) {
+		max = UINT_MAX;
+	} else {
+		ret = kstrtouint(buf, 0, &max);
+		if (ret)
+			return ret;
+	}
+
+	cg = css_enc(of_css(of));
+	type = of_cft(of)->private;
+
+	spin_lock_irqsave(&enc_id_cg_lock, flags);
+
+	if (cg->res[type].usage <= max)
+		cg->res[type].max = max;
+	else
+		ret = -EBUSY;
+
+	spin_unlock_irqrestore(&enc_id_cg_lock, flags);
+
+	return ret ? ret : nbytes;
+}
+
+/**
+ * enc_id_cg_current_read() - Show current usage of the encryption ID.
+ * @css: css pointer of the cgroup.
+ * @cft: cft pointer of the cgroup.
+ *
+ * Uses cft->private value to determine for which enryption ID type results be
+ * shown.
+ *
+ * Context: Any context.
+ * Return: 0 to denote successful print.
+ */
+static u64 enc_id_cg_current_read(struct cgroup_subsys_state *css,
+				  struct cftype *cft)
+{
+	struct encryption_id_cgroup *cg = css_enc(css);
+	enum encryption_id_type type = cft->private;
+
+	return cg->res[type].usage;
+}
+
+/**
+ * enc_id_cg_stat_show() - Show the current stat of the cgroup.
+ * @sf: Interface file
+ * @v: Arguments passed
+ *
+ * Shows the total capacity of the encryption ID and its current usage.
+ * Only shows in root cgroup directory.
+ *
+ * Uses cft->private value to determine for which enryption ID type results be
+ * shown.
+ *
+ * Context: Any context. Takes and releases enc_id_cg_lock.
+ * Return: 0 to denote successful print.
+ */
+static int enc_id_cg_stat_show(struct seq_file *sf, void *v)
+{
+	unsigned long flags;
+	enum encryption_id_type type = seq_cft(sf)->private;
+
+	spin_lock_irqsave(&enc_id_cg_lock, flags);
+
+	seq_printf(sf, "total %u\n", enc_id_capacity[type]);
+	seq_printf(sf, "used %u\n", root_cg.res[type].usage);
+
+	spin_unlock_irqrestore(&enc_id_cg_lock, flags);
+	return 0;
+}
+
+/* Each encryption ID type has these cgroup files. */
+#define ENC_ID_CGROUP_FILES(id_name, id_type)		\
+	[(id_type) * 3] = {				\
+		.name = id_name ".max",			\
+		.write = enc_id_cg_max_write,		\
+		.seq_show = enc_id_cg_max_show,		\
+		.flags = CFTYPE_NOT_ON_ROOT,		\
+		.private = id_type,			\
+	},						\
+	[((id_type) * 3) + 1] = {			\
+		.name = id_name ".current",		\
+		.read_u64 = enc_id_cg_current_read,	\
+		.flags = CFTYPE_NOT_ON_ROOT,		\
+		.private = id_type,			\
+	},						\
+	[((id_type) * 3) + 2] = {			\
+		.name = id_name ".stat",		\
+		.seq_show = enc_id_cg_stat_show,	\
+		.flags = CFTYPE_ONLY_ON_ROOT,		\
+		.private = id_type,			\
+	}
+
+/* Encryption ID cgroup interface files */
+static struct cftype enc_id_cg_files[] = {
+#ifdef CONFIG_KVM_AMD_SEV
+	ENC_ID_CGROUP_FILES("sev", ENCRYPTION_ID_SEV),
+#endif
+	{}
+};
+
+/**
+ * enc_id_cg_alloc() - Allocate encryption ID cgroup.
+ * @parent_css: Parent cgroup.
+ *
+ * Context: Process context.
+ * Return:
+ * * struct cgroup_subsys_state* - css of the allocated cgroup.
+ * * ERR_PTR(-ENOMEM) - No memory available to allocate.
+ */
+static struct cgroup_subsys_state *
+enc_id_cg_alloc(struct cgroup_subsys_state *parent_css)
+{
+	enum encryption_id_type i;
+	struct encryption_id_cgroup *cg;
+
+	if (!parent_css) {
+		cg = &root_cg;
+	} else {
+		cg = kzalloc(sizeof(*cg), GFP_KERNEL);
+		if (!cg)
+			return ERR_PTR(-ENOMEM);
+	}
+
+	for (i = 0; i < ENCRYPTION_ID_TYPES; i++)
+		cg->res[i].max = MAX_NUM;
+
+	return &cg->css;
+}
+
+/**
+ * enc_id_cg_free() - Free the encryption ID cgroup.
+ * @css: cgroup subsys object.
+ *
+ * Context: Any context.
+ */
+static void enc_id_cg_free(struct cgroup_subsys_state *css)
+{
+	kfree(css_enc(css));
+}
+
+/* Cgroup controller callbacks */
+struct cgroup_subsys encryption_ids_cgrp_subsys = {
+	.css_alloc = enc_id_cg_alloc,
+	.css_free = enc_id_cg_free,
+	.legacy_cftypes = enc_id_cg_files,
+	.dfl_cftypes = enc_id_cg_files,
+};
-- 
2.29.2.576.ga3fc446d84-goog

