Return-Path: <linux-doc+bounces-12187-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DF287D871
	for <lists+linux-doc@lfdr.de>; Sat, 16 Mar 2024 04:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 679911C214C5
	for <lists+linux-doc@lfdr.de>; Sat, 16 Mar 2024 03:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908C71BF5C;
	Sat, 16 Mar 2024 03:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="kj14USb0"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA41CA62;
	Sat, 16 Mar 2024 03:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710560161; cv=none; b=lTWt8RwPs6TmLNVYpXO6XihAU8WAbBMc9nZF2DEzhWAV+7K2rYVMmhHglH0wHsYK15u06arR6HoBK1s175xl5oLkEMX4Lxa/tCRQ79rW3CUQxMzprrVLR3kNlSZ+rwNyQY5xpo74gfGV7M1zAwj+94T4r09Qv1ZRgUpqQIwPBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710560161; c=relaxed/simple;
	bh=6t9BEvWaMcIaCVEeeGnUIPJ/mMudkG4bOr8epzDYiq4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=g+Ge0gTyLmabjG0riuRP/6AM/DpSTvw+Vq+IsoXqa50HhXaelhpiYXSdAf46b/wklOJnwaVfplQeotnxyLSwbDc9kYUu/7kOoaAD5wgETXRQRtZ6B50mo+zKCeqtEDnMQhhCIOF8hGorZSqvCpvhHYUBWfVLW/t2zIwHsfaZIVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=kj14USb0; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1052)
	id BED1220B74D3; Fri, 15 Mar 2024 20:35:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BED1220B74D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1710560153;
	bh=j1PJ7f2wNKceGww3zk5/9GSWDNHp/DvwLwbB4Saq6ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kj14USb0VgJPgjVyOVbWyMD9AY/fyOB8nEfr4zh1gT1b4SSh2j9hvJxIPXDXwdIw3
	 NxxidVJX9VoKlVkevd32I0EjCchCta4I73c3AJcf67ZHtmX1WzIQAF/KfkoigoFZLq
	 N2XaFJHD2d2hXi/tcOArkRPEtw95ULqf+z1R/31o=
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
Subject: [RFC PATCH v15 10/21] ipe: add permissive toggle
Date: Fri, 15 Mar 2024 20:35:40 -0700
Message-Id: <1710560151-28904-11-git-send-email-wufan@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710560151-28904-1-git-send-email-wufan@linux.microsoft.com>
References: <1710560151-28904-1-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

From: Deven Bowers <deven.desai@linux.microsoft.com>

IPE, like SELinux, supports a permissive mode. This mode allows policy
authors to test and evaluate IPE policy without it effecting their
programs. When the mode is changed, a 1404 AUDIT_MAC_STATUS
be reported.

This patch adds the following audit records:

    audit: MAC_STATUS enforcing=0 old_enforcing=1 auid=4294967295
      ses=4294967295 enabled=1 old-enabled=1 lsm=ipe res=1
    audit: MAC_STATUS enforcing=1 old_enforcing=0 auid=4294967295
      ses=4294967295 enabled=1 old-enabled=1 lsm=ipe res=1

The audit record only emit when the value from the user input is
different from the current enforce value.

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
  + Further split lsm creation into a separate commit from the
    evaluation loop and audit system, for easier review.
  + Propagating changes to support the new ipe_context structure in the
    evaluation loop.
  + Split out permissive functionality into a separate patch for easier
    review.
  + Remove permissive switch compile-time configuration option - this
    is trivial to add later.

v8:
  + Remove "IPE" prefix from permissive audit record
  + align fields to the linux-audit field dictionary. This causes the
    following fields to change:
      enforce -> permissive

  + Remove duplicated information correlated with syscall record, that
    will always be present in the audit event.
  + Change audit types:
    + AUDIT_TRUST_STATUS -> AUDIT_MAC_STATUS
      + There is no significant difference in meaning between
        these types.

v9:
  + Clean up ipe_context related code

v10:
  + Change audit format to comform with the existing format selinux is
    using
  + Remove the audit record emission during init to align with selinux,
    which does not perform this action.

v11:
  + Remove redundant code

v12:
  + Remove redundant code

v13:
  + Remove audit format macro

v14:
  + No changes

v15:
  + No changes
---
 security/ipe/audit.c | 27 ++++++++++++++++--
 security/ipe/audit.h |  1 +
 security/ipe/eval.c  | 11 +++++--
 security/ipe/eval.h  |  1 +
 security/ipe/fs.c    | 68 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 104 insertions(+), 4 deletions(-)

diff --git a/security/ipe/audit.c b/security/ipe/audit.c
index f167fdc87986..a480f27278df 100644
--- a/security/ipe/audit.c
+++ b/security/ipe/audit.c
@@ -93,8 +93,8 @@ void ipe_audit_match(const struct ipe_eval_ctx *const ctx,
 	if (!ab)
 		return;
 
-	audit_log_format(ab, "ipe_op=%s ipe_hook=%s pid=%d comm=",
-			 op, audit_hook_names[ctx->hook],
+	audit_log_format(ab, "ipe_op=%s ipe_hook=%s enforcing=%d pid=%d comm=",
+			 op, audit_hook_names[ctx->hook], READ_ONCE(enforce),
 			 task_tgid_nr(current));
 	audit_log_untrustedstring(ab, get_task_comm(comm, current));
 
@@ -212,3 +212,26 @@ void ipe_audit_policy_load(const struct ipe_policy *const p)
 
 	audit_log_end(ab);
 }
+
+/**
+ * ipe_audit_enforce - Audit a change in IPE's enforcement state.
+ * @new_enforce: The new value enforce to be set.
+ * @old_enforce: The old value currently in enforce.
+ */
+void ipe_audit_enforce(bool new_enforce, bool old_enforce)
+{
+	struct audit_buffer *ab;
+
+	ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_MAC_STATUS);
+	if (!ab)
+		return;
+
+	audit_log(audit_context(), GFP_KERNEL, AUDIT_MAC_STATUS,
+		  "enforcing=%d old_enforcing=%d auid=%u ses=%u"
+		  " enabled=1 old-enabled=1 lsm=ipe res=1",
+		  new_enforce, old_enforce,
+		  from_kuid(&init_user_ns, audit_get_loginuid(current)),
+		  audit_get_sessionid(current));
+
+	audit_log_end(ab);
+}
diff --git a/security/ipe/audit.h b/security/ipe/audit.h
index 0ff5a06808de..914f001e5286 100644
--- a/security/ipe/audit.h
+++ b/security/ipe/audit.h
@@ -14,5 +14,6 @@ void ipe_audit_match(const struct ipe_eval_ctx *const ctx,
 void ipe_audit_policy_load(const struct ipe_policy *const p);
 void ipe_audit_policy_activation(const struct ipe_policy *const op,
 				 const struct ipe_policy *const np);
+void ipe_audit_enforce(bool new_enforce, bool old_enforce);
 
 #endif /* _IPE_AUDIT_H */
diff --git a/security/ipe/eval.c b/security/ipe/eval.c
index 274f7346ef42..3f3125478dd0 100644
--- a/security/ipe/eval.c
+++ b/security/ipe/eval.c
@@ -18,6 +18,7 @@
 
 struct ipe_policy __rcu *ipe_active_policy;
 bool success_audit;
+bool enforce = true;
 
 #define FILE_SUPERBLOCK(f) ((f)->f_path.mnt->mnt_sb)
 
@@ -106,6 +107,7 @@ int ipe_evaluate_event(const struct ipe_eval_ctx *const ctx)
 	const struct ipe_rule *rule = NULL;
 	const struct ipe_op_table *rules = NULL;
 	struct ipe_prop *prop = NULL;
+	int rc = 0;
 
 	rcu_read_lock();
 
@@ -158,9 +160,12 @@ int ipe_evaluate_event(const struct ipe_eval_ctx *const ctx)
 	ipe_audit_match(ctx, match_type, action, rule);
 
 	if (action == IPE_ACTION_DENY)
-		return -EACCES;
+		rc = -EACCES;
 
-	return 0;
+	if (!READ_ONCE(enforce))
+		rc = 0;
+
+	return rc;
 }
 
 /* Set the right module name */
@@ -171,3 +176,5 @@ int ipe_evaluate_event(const struct ipe_eval_ctx *const ctx)
 
 module_param(success_audit, bool, 0400);
 MODULE_PARM_DESC(success_audit, "Start IPE with success auditing enabled");
+module_param(enforce, bool, 0400);
+MODULE_PARM_DESC(enforce, "Start IPE in enforce or permissive mode");
diff --git a/security/ipe/eval.h b/security/ipe/eval.h
index 4631b236358e..0b50302611a4 100644
--- a/security/ipe/eval.h
+++ b/security/ipe/eval.h
@@ -16,6 +16,7 @@
 
 extern struct ipe_policy __rcu *ipe_active_policy;
 extern bool success_audit;
+extern bool enforce;
 
 struct ipe_superblock {
 	bool initramfs;
diff --git a/security/ipe/fs.c b/security/ipe/fs.c
index 95407997cf0c..b16d87443a3b 100644
--- a/security/ipe/fs.c
+++ b/security/ipe/fs.c
@@ -16,6 +16,7 @@ static struct dentry *np __ro_after_init;
 static struct dentry *root __ro_after_init;
 struct dentry *policy_root __ro_after_init;
 static struct dentry *audit_node __ro_after_init;
+static struct dentry *enforce_node __ro_after_init;
 
 /**
  * setaudit - Write handler for the securityfs node, "ipe/success_audit"
@@ -67,6 +68,60 @@ static ssize_t getaudit(struct file *f, char __user *data,
 	return simple_read_from_buffer(data, len, offset, result, 1);
 }
 
+/**
+ * setenforce - Write handler for the securityfs node, "ipe/enforce"
+ * @f: Supplies a file structure representing the securityfs node.
+ * @data: Supplies a buffer passed to the write syscall.
+ * @len: Supplies the length of @data.
+ * @offset: unused.
+ *
+ * Return:
+ * * >0	- Success, Length of buffer written
+ * * <0	- Error
+ */
+static ssize_t setenforce(struct file *f, const char __user *data,
+			  size_t len, loff_t *offset)
+{
+	int rc = 0;
+	bool new_value, old_value;
+
+	if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN))
+		return -EPERM;
+
+	old_value = READ_ONCE(enforce);
+	rc = kstrtobool_from_user(data, len, &new_value);
+	if (rc)
+		return rc;
+
+	if (new_value != old_value) {
+		ipe_audit_enforce(new_value, old_value);
+		WRITE_ONCE(enforce, new_value);
+	}
+
+	return len;
+}
+
+/**
+ * getenforce - Read handler for the securityfs node, "ipe/enforce"
+ * @f: Supplies a file structure representing the securityfs node.
+ * @data: Supplies a buffer passed to the read syscall.
+ * @len: Supplies the length of @data.
+ * @offset: unused.
+ *
+ * Return:
+ * * >0	- Success, Length of buffer written
+ * * <0	- Error
+ */
+static ssize_t getenforce(struct file *f, char __user *data,
+			  size_t len, loff_t *offset)
+{
+	const char *result;
+
+	result = ((READ_ONCE(enforce)) ? "1" : "0");
+
+	return simple_read_from_buffer(data, len, offset, result, 1);
+}
+
 /**
  * new_policy - Write handler for the securityfs node, "ipe/new_policy".
  * @f: Supplies a file structure representing the securityfs node.
@@ -120,6 +175,11 @@ static const struct file_operations audit_fops = {
 	.read = getaudit,
 };
 
+static const struct file_operations enforce_fops = {
+	.write = setenforce,
+	.read = getenforce,
+};
+
 /**
  * ipe_init_securityfs - Initialize IPE's securityfs tree at fsinit.
  *
@@ -147,6 +207,13 @@ static int __init ipe_init_securityfs(void)
 		goto err;
 	}
 
+	enforce_node = securityfs_create_file("enforce", 0600, root, NULL,
+					      &enforce_fops);
+	if (IS_ERR(enforce_node)) {
+		rc = PTR_ERR(enforce_node);
+		goto err;
+	}
+
 	policy_root = securityfs_create_dir("policies", root);
 	if (IS_ERR(policy_root)) {
 		rc = PTR_ERR(policy_root);
@@ -163,6 +230,7 @@ static int __init ipe_init_securityfs(void)
 err:
 	securityfs_remove(np);
 	securityfs_remove(policy_root);
+	securityfs_remove(enforce_node);
 	securityfs_remove(audit_node);
 	securityfs_remove(root);
 	return rc;
-- 
2.44.0


