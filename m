Return-Path: <linux-doc+bounces-14075-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13E68A3982
	for <lists+linux-doc@lfdr.de>; Sat, 13 Apr 2024 02:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1374DB21A16
	for <lists+linux-doc@lfdr.de>; Sat, 13 Apr 2024 00:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401D1FBE8;
	Sat, 13 Apr 2024 00:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Cnb54LmU"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4894C80;
	Sat, 13 Apr 2024 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712969768; cv=none; b=LYBxYeZF3m/CbGEZwCi9pWxSW2cQdUPtHMCORVuyKyLwsZltBnsaGe+lmlVfOSRCQ6mIH8o1XhO1jb7wMLpXgqsRUAHc1s/T3qauRTadqeXdwJgQf5K4Ech4vKJoTqUKnE1PJ2kFt2t2fmQKAIFxPtqzCXaTtcmJI6CdGZ/BKPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712969768; c=relaxed/simple;
	bh=gmEt2sutQjEVevRnsWhhoIbwqEiORmj8a9PpjwQMbzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=kZt9TJbjUI/SfgAaStXQStviKI04Y/3JNl8spnHug9Qd0WP+yYMOb9/OtGSenrgHgk1xg54H6ZbSd6/oNiuscNN/IYCe1rpccMCsZfTiSLbYCUJTpQgaVEIJWm5St9NKXNPv2GfiXn6D/IoW+tb2/W5duZJifEnfvCOGnjzcAEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Cnb54LmU; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1052)
	id AD89A20F32A0; Fri, 12 Apr 2024 17:56:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AD89A20F32A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1712969765;
	bh=QvP6KwxJnbSapD66zBYQRGzBp/jqCWs+OasE/1PXqS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cnb54LmUYXdsS8gDGxTlCP686+MJ8kuxq7BeOXACRwtdNqHRdjbaW8cPJ6eS3OV7d
	 F+JQBlxgXVcUNsTVuIh87xxSBRtSsCfHNXnooRrBitRNqY1dxkhIrrCHn2s9aR5ntK
	 DHgjsLVXmdAMI6pPrus7cVHEaGiSNu4Mf4QPhL7E=
From: Fan Wu <wufan@linux.microsoft.com>
To: corbet@lwn.net,
	zohar@linux.ibm.com,
	jmorris@namei.org,
	serge@hallyn.com,
	tytso@mit.edu,
	ebiggers@kernel.org,
	axboe@kernel.dk,
	agk@redhat.com,
	snitzer@kernel.org,
	eparis@redhat.com,
	paul@paul-moore.com
Cc: linux-doc@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	fsverity@lists.linux.dev,
	linux-block@vger.kernel.org,
	dm-devel@lists.linux.dev,
	audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deven Bowers <deven.desai@linux.microsoft.com>,
	Fan Wu <wufan@linux.microsoft.com>
Subject: [PATCH v17 04/21] ipe: add LSM hooks on execution and kernel read
Date: Fri, 12 Apr 2024 17:55:47 -0700
Message-Id: <1712969764-31039-5-git-send-email-wufan@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712969764-31039-1-git-send-email-wufan@linux.microsoft.com>
References: <1712969764-31039-1-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

From: Deven Bowers <deven.desai@linux.microsoft.com>

IPE's initial goal is to control both execution and the loading of
kernel modules based on the system's definition of trust. It
accomplishes this by plugging into the security hooks for
bprm_check_security, file_mprotect, mmap_file, kernel_load_data,
and kernel_read_data.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
Signed-off-by: Fan Wu <wufan@linux.microsoft.com>

---
v2:
  + Split evaluation loop, access control hooks,
    and evaluation loop from policy parser and userspace
    interface to pass mailing list character limit

v3:
  + Move ipe_load_properties to patch 04.
  + Remove useless 0-initializations
  + Prefix extern variables with ipe_
  + Remove kernel module parameters, as these are
    exposed through sysctls.
  + Add more prose to the IPE base config option
    help text.
  + Use GFP_KERNEL for audit_log_start.
  + Remove unnecessary caching system.
  + Remove comments from headers
  + Use rcu_access_pointer for rcu-pointer null check
  + Remove usage of reqprot; use prot only.
  + Move policy load and activation audit event to 03/12

v4:
  + Remove sysctls in favor of securityfs nodes
  + Re-add kernel module parameters, as these are now
    exposed through securityfs.
  + Refactor property audit loop to a separate function.

v5:
  + fix minor grammatical errors
  + do not group rule by curly-brace in audit record,
    reconstruct the exact rule.

v6:
  + No changes

v7:
  + Further split lsm creation, the audit system, the evaluation loop
    and access control hooks into separate commits.

v8:
  + Rename hook functions to follow the lsmname_hook_name convention
  + Remove ipe_hook enumeration, can be derived from correlation with
    syscall audit record.

v9:
  + Minor changes for adapting to the new parser

v10:
  + Remove @reqprot part

v11:
  + Fix code style issues

v12:
  + Correct WARN usages

v13:
  + No changes

v14:
  + No changes

v15:
  + No changes

v16:
  + No changes

v17:
  + Add years to license header
  + Fix code and documentation style issues
---
 security/ipe/Makefile |   1 +
 security/ipe/eval.c   |  14 ++++
 security/ipe/eval.h   |   5 ++
 security/ipe/hooks.c  | 184 ++++++++++++++++++++++++++++++++++++++++++
 security/ipe/hooks.h  |  25 ++++++
 security/ipe/ipe.c    |   6 ++
 6 files changed, 235 insertions(+)
 create mode 100644 security/ipe/hooks.c
 create mode 100644 security/ipe/hooks.h

diff --git a/security/ipe/Makefile b/security/ipe/Makefile
index 4cc17eb92060..e1c27e974c5c 100644
--- a/security/ipe/Makefile
+++ b/security/ipe/Makefile
@@ -7,6 +7,7 @@
 
 obj-$(CONFIG_SECURITY_IPE) += \
 	eval.o \
+	hooks.o \
 	ipe.o \
 	policy.o \
 	policy_parser.o \
diff --git a/security/ipe/eval.c b/security/ipe/eval.c
index 41331afdef7c..cc3b3f6583ad 100644
--- a/security/ipe/eval.c
+++ b/security/ipe/eval.c
@@ -16,6 +16,20 @@
 
 struct ipe_policy __rcu *ipe_active_policy;
 
+/**
+ * ipe_build_eval_ctx() - Build an ipe evaluation context.
+ * @ctx: Supplies a pointer to the context to be populated.
+ * @file: Supplies a pointer to the file to associated with the evaluation.
+ * @op: Supplies the IPE policy operation associated with the evaluation.
+ */
+void ipe_build_eval_ctx(struct ipe_eval_ctx *ctx,
+			const struct file *file,
+			enum ipe_op_type op)
+{
+	ctx->file = file;
+	ctx->op = op;
+}
+
 /**
  * evaluate_property() - Analyze @ctx against a rule property.
  * @ctx: Supplies a pointer to the context to be evaluated.
diff --git a/security/ipe/eval.h b/security/ipe/eval.h
index b137f2107852..00ed8ceca10e 100644
--- a/security/ipe/eval.h
+++ b/security/ipe/eval.h
@@ -11,6 +11,8 @@
 
 #include "policy.h"
 
+#define IPE_EVAL_CTX_INIT ((struct ipe_eval_ctx){ 0 })
+
 extern struct ipe_policy __rcu *ipe_active_policy;
 
 struct ipe_eval_ctx {
@@ -19,6 +21,9 @@ struct ipe_eval_ctx {
 	const struct file *file;
 };
 
+void ipe_build_eval_ctx(struct ipe_eval_ctx *ctx,
+			const struct file *file,
+			enum ipe_op_type op);
 int ipe_evaluate_event(const struct ipe_eval_ctx *const ctx);
 
 #endif /* _IPE_EVAL_H */
diff --git a/security/ipe/hooks.c b/security/ipe/hooks.c
new file mode 100644
index 000000000000..f2aaa749dd7b
--- /dev/null
+++ b/security/ipe/hooks.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020-2024 Microsoft Corporation. All rights reserved.
+ */
+
+#include <linux/fs.h>
+#include <linux/types.h>
+#include <linux/binfmts.h>
+#include <linux/mman.h>
+
+#include "ipe.h"
+#include "hooks.h"
+#include "eval.h"
+
+/**
+ * ipe_bprm_check_security() - ipe security hook function for bprm check.
+ * @bprm: Supplies a pointer to a linux_binprm structure to source the file
+ *	  being evaluated.
+ *
+ * This LSM hook is called when a binary is loaded through the exec
+ * family of system calls.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-EACCES	- Did not pass IPE policy
+ */
+int ipe_bprm_check_security(struct linux_binprm *bprm)
+{
+	struct ipe_eval_ctx ctx = IPE_EVAL_CTX_INIT;
+
+	ipe_build_eval_ctx(&ctx, bprm->file, IPE_OP_EXEC);
+	return ipe_evaluate_event(&ctx);
+}
+
+/**
+ * ipe_mmap_file() - ipe security hook function for mmap check.
+ * @f: File being mmap'd. Can be NULL in the case of anonymous memory.
+ * @reqprot: The requested protection on the mmap, passed from usermode.
+ * @prot: The effective protection on the mmap, resolved from reqprot and
+ *	  system configuration.
+ * @flags: Unused.
+ *
+ * This hook is called when a file is loaded through the mmap
+ * family of system calls.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-EACCES	- Did not pass IPE policy
+ */
+int ipe_mmap_file(struct file *f, unsigned long reqprot __always_unused,
+		  unsigned long prot, unsigned long flags)
+{
+	struct ipe_eval_ctx ctx = IPE_EVAL_CTX_INIT;
+
+	if (prot & PROT_EXEC) {
+		ipe_build_eval_ctx(&ctx, f, IPE_OP_EXEC);
+		return ipe_evaluate_event(&ctx);
+	}
+
+	return 0;
+}
+
+/**
+ * ipe_file_mprotect() - ipe security hook function for mprotect check.
+ * @vma: Existing virtual memory area created by mmap or similar.
+ * @reqprot: The requested protection on the mmap, passed from usermode.
+ * @prot: The effective protection on the mmap, resolved from reqprot and
+ *	  system configuration.
+ *
+ * This LSM hook is called when a mmap'd region of memory is changing
+ * its protections via mprotect.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-EACCES	- Did not pass IPE policy
+ */
+int ipe_file_mprotect(struct vm_area_struct *vma,
+		      unsigned long reqprot __always_unused,
+		      unsigned long prot)
+{
+	struct ipe_eval_ctx ctx = IPE_EVAL_CTX_INIT;
+
+	/* Already Executable */
+	if (vma->vm_flags & VM_EXEC)
+		return 0;
+
+	if (prot & PROT_EXEC) {
+		ipe_build_eval_ctx(&ctx, vma->vm_file, IPE_OP_EXEC);
+		return ipe_evaluate_event(&ctx);
+	}
+
+	return 0;
+}
+
+/**
+ * ipe_kernel_read_file() - ipe security hook function for kernel read.
+ * @file: Supplies a pointer to the file structure being read in from disk.
+ * @id: Supplies the enumeration identifying the purpose of the read.
+ * @contents: Unused.
+ *
+ * This LSM hook is called when a file is being read in from disk from
+ * the kernel.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-EACCES	- Did not pass IPE policy
+ */
+int ipe_kernel_read_file(struct file *file, enum kernel_read_file_id id,
+			 bool contents)
+{
+	struct ipe_eval_ctx ctx = IPE_EVAL_CTX_INIT;
+	enum ipe_op_type op;
+
+	switch (id) {
+	case READING_FIRMWARE:
+		op = IPE_OP_FIRMWARE;
+		break;
+	case READING_MODULE:
+		op = IPE_OP_KERNEL_MODULE;
+		break;
+	case READING_KEXEC_INITRAMFS:
+		op = IPE_OP_KEXEC_INITRAMFS;
+		break;
+	case READING_KEXEC_IMAGE:
+		op = IPE_OP_KEXEC_IMAGE;
+		break;
+	case READING_POLICY:
+		op = IPE_OP_POLICY;
+		break;
+	case READING_X509_CERTIFICATE:
+		op = IPE_OP_X509;
+		break;
+	default:
+		op = IPE_OP_INVALID;
+		WARN(1, "no rule setup for kernel_read_file enum %d", id);
+	}
+
+	ipe_build_eval_ctx(&ctx, file, op);
+	return ipe_evaluate_event(&ctx);
+}
+
+/**
+ * ipe_kernel_load_data() - ipe security hook function for kernel load data.
+ * @id: Supplies the enumeration identifying the purpose of the read.
+ * @contents: Unused.
+ *
+ * This LSM hook is called when a buffer is being read in from disk.
+ *
+ * Return:
+ * * %0		- Success
+ * * %-EACCES	- Did not pass IPE policy
+ */
+int ipe_kernel_load_data(enum kernel_load_data_id id, bool contents)
+{
+	struct ipe_eval_ctx ctx = IPE_EVAL_CTX_INIT;
+	enum ipe_op_type op;
+
+	switch (id) {
+	case LOADING_FIRMWARE:
+		op = IPE_OP_FIRMWARE;
+		break;
+	case LOADING_MODULE:
+		op = IPE_OP_KERNEL_MODULE;
+		break;
+	case LOADING_KEXEC_INITRAMFS:
+		op = IPE_OP_KEXEC_INITRAMFS;
+		break;
+	case LOADING_KEXEC_IMAGE:
+		op = IPE_OP_KEXEC_IMAGE;
+		break;
+	case LOADING_POLICY:
+		op = IPE_OP_POLICY;
+		break;
+	case LOADING_X509_CERTIFICATE:
+		op = IPE_OP_X509;
+		break;
+	default:
+		op = IPE_OP_INVALID;
+		WARN(1, "no rule setup for kernel_load_data enum %d", id);
+	}
+
+	ipe_build_eval_ctx(&ctx, NULL, op);
+	return ipe_evaluate_event(&ctx);
+}
diff --git a/security/ipe/hooks.h b/security/ipe/hooks.h
new file mode 100644
index 000000000000..c22c3336d27c
--- /dev/null
+++ b/security/ipe/hooks.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020-2024 Microsoft Corporation. All rights reserved.
+ */
+#ifndef _IPE_HOOKS_H
+#define _IPE_HOOKS_H
+
+#include <linux/fs.h>
+#include <linux/binfmts.h>
+#include <linux/security.h>
+
+int ipe_bprm_check_security(struct linux_binprm *bprm);
+
+int ipe_mmap_file(struct file *f, unsigned long reqprot, unsigned long prot,
+		  unsigned long flags);
+
+int ipe_file_mprotect(struct vm_area_struct *vma, unsigned long reqprot,
+		      unsigned long prot);
+
+int ipe_kernel_read_file(struct file *file, enum kernel_read_file_id id,
+			 bool contents);
+
+int ipe_kernel_load_data(enum kernel_load_data_id id, bool contents);
+
+#endif /* _IPE_HOOKS_H */
diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
index 8d4ea372873e..729334812636 100644
--- a/security/ipe/ipe.c
+++ b/security/ipe/ipe.c
@@ -5,6 +5,7 @@
 #include <uapi/linux/lsm.h>
 
 #include "ipe.h"
+#include "hooks.h"
 
 static struct lsm_blob_sizes ipe_blobs __ro_after_init = {
 };
@@ -15,6 +16,11 @@ static const struct lsm_id ipe_lsmid = {
 };
 
 static struct security_hook_list ipe_hooks[] __ro_after_init = {
+	LSM_HOOK_INIT(bprm_check_security, ipe_bprm_check_security),
+	LSM_HOOK_INIT(mmap_file, ipe_mmap_file),
+	LSM_HOOK_INIT(file_mprotect, ipe_file_mprotect),
+	LSM_HOOK_INIT(kernel_read_file, ipe_kernel_read_file),
+	LSM_HOOK_INIT(kernel_load_data, ipe_kernel_load_data),
 };
 
 /**
-- 
2.44.0


