Return-Path: <linux-doc+bounces-14073-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 518AF8A3977
	for <lists+linux-doc@lfdr.de>; Sat, 13 Apr 2024 02:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06161F21CB4
	for <lists+linux-doc@lfdr.de>; Sat, 13 Apr 2024 00:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF48333EE;
	Sat, 13 Apr 2024 00:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ow1wgNq/"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31604A31;
	Sat, 13 Apr 2024 00:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712969767; cv=none; b=UcvL+XEqZ2rzJ+NrmDRU2sPgQaFx8a14vdC8T4UqI5FIPmpWSKp5ErMRodgco5sHXSlH1pm8P4NHWIFX7pOu3/U6eraYslor5fxDfsDdmDNulxtmCG5n8m73ON/4AEKkyCcGl3eTceMqMkYFc7HJlJLAZQncHPs8ncObYZGBK+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712969767; c=relaxed/simple;
	bh=zSH+16UFgnroTmY3CH9ifexvAXXSOPhT76XaoocKK4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=QMuWctwowZF8p1DHO46TNQvTq+Aw+yqYkEnNpxZ+zrNrXIkLMW4pUXAm/kSgG0HUh3eVeGGF3Jf6Nr0gm028tz47JcTnTQIN3ugzq8+XcVzRSnmkMOusmzi+Ryx3EuOwjINv+oiecwYuZYELLqNGuT4K453r/mLiNMozPlY0dWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=ow1wgNq/; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1052)
	id 82BC120F2687; Fri, 12 Apr 2024 17:56:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 82BC120F2687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1712969765;
	bh=vuy/C/IHX8DZR9bX8mCHnZBlRDsV8pGfigebuT0GufY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ow1wgNq/QsiFS0sQaoHIGxgZfiA7fbL+YHibOh7uctIxgpmSgu4K0x8InPgpqpYSh
	 BLfH3XCitg1qdMQC0WsI05kIMhss1/bSvEKEQKZyNJKsF+u8r4EOnRUUmCsHAk8Qus
	 9QHOW4xq7beevpDFWC1uAR/poM21fdtFMpsNrwJE=
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
Subject: [PATCH v17 01/21] security: add ipe lsm
Date: Fri, 12 Apr 2024 17:55:44 -0700
Message-Id: <1712969764-31039-2-git-send-email-wufan@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712969764-31039-1-git-send-email-wufan@linux.microsoft.com>
References: <1712969764-31039-1-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

From: Deven Bowers <deven.desai@linux.microsoft.com>

Integrity Policy Enforcement (IPE) is an LSM that provides an
complimentary approach to Mandatory Access Control than existing LSMs
today.

Existing LSMs have centered around the concept of access to a resource
should be controlled by the current user's credentials. IPE's approach,
is that access to a resource should be controlled by the system's trust
of a current resource.

The basis of this approach is defining a global policy to specify which
resource can be trusted.

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

  + Introduce the concept of an ipe_context, a scoped way to
    introduce execution policies, used initially for allowing for
    kunit tests in isolation.

v8:
  + Follow lsmname_hook_name convention for lsm hooks.
  + Move LSM blob accessors to ipe.c and mark LSM blobs as static.

v9:
  + Remove ipe_context for simplification

v10:
  + Add github url

v11:
  + Correct github url
  + Move ipe before bpf

v12:
  + Switch to use lsm_id instead of string for lsm name

v13:
  + No changes

v14:
  + No changes

v15:
  + Add missing code in tools/testing/selftests/lsm/lsm_list_modules_test.c

v16:
  + No changes

v17:
  + Add years to license header
  + Fix code and documentation style issues
---
 include/uapi/linux/lsm.h                      |  1 +
 security/Kconfig                              | 11 ++---
 security/Makefile                             |  1 +
 security/ipe/Kconfig                          | 17 ++++++++
 security/ipe/Makefile                         |  9 ++++
 security/ipe/ipe.c                            | 42 +++++++++++++++++++
 security/ipe/ipe.h                            | 16 +++++++
 security/security.c                           |  3 +-
 .../selftests/lsm/lsm_list_modules_test.c     |  3 ++
 9 files changed, 97 insertions(+), 6 deletions(-)
 create mode 100644 security/ipe/Kconfig
 create mode 100644 security/ipe/Makefile
 create mode 100644 security/ipe/ipe.c
 create mode 100644 security/ipe/ipe.h

diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
index 33d8c9f4aa6b..938593dfd5da 100644
--- a/include/uapi/linux/lsm.h
+++ b/include/uapi/linux/lsm.h
@@ -64,6 +64,7 @@ struct lsm_ctx {
 #define LSM_ID_LANDLOCK		110
 #define LSM_ID_IMA		111
 #define LSM_ID_EVM		112
+#define LSM_ID_IPE		113
 
 /*
  * LSM_ATTR_XXX definitions identify different LSM attributes
diff --git a/security/Kconfig b/security/Kconfig
index 412e76f1575d..9fb8f9b14972 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -192,6 +192,7 @@ source "security/yama/Kconfig"
 source "security/safesetid/Kconfig"
 source "security/lockdown/Kconfig"
 source "security/landlock/Kconfig"
+source "security/ipe/Kconfig"
 
 source "security/integrity/Kconfig"
 
@@ -231,11 +232,11 @@ endchoice
 
 config LSM
 	string "Ordered list of enabled LSMs"
-	default "landlock,lockdown,yama,loadpin,safesetid,smack,selinux,tomoyo,apparmor,bpf" if DEFAULT_SECURITY_SMACK
-	default "landlock,lockdown,yama,loadpin,safesetid,apparmor,selinux,smack,tomoyo,bpf" if DEFAULT_SECURITY_APPARMOR
-	default "landlock,lockdown,yama,loadpin,safesetid,tomoyo,bpf" if DEFAULT_SECURITY_TOMOYO
-	default "landlock,lockdown,yama,loadpin,safesetid,bpf" if DEFAULT_SECURITY_DAC
-	default "landlock,lockdown,yama,loadpin,safesetid,selinux,smack,tomoyo,apparmor,bpf"
+	default "landlock,lockdown,yama,loadpin,safesetid,smack,selinux,tomoyo,apparmor,ipe,bpf" if DEFAULT_SECURITY_SMACK
+	default "landlock,lockdown,yama,loadpin,safesetid,apparmor,selinux,smack,tomoyo,ipe,bpf" if DEFAULT_SECURITY_APPARMOR
+	default "landlock,lockdown,yama,loadpin,safesetid,tomoyo,ipe,bpf" if DEFAULT_SECURITY_TOMOYO
+	default "landlock,lockdown,yama,loadpin,safesetid,ipe,bpf" if DEFAULT_SECURITY_DAC
+	default "landlock,lockdown,yama,loadpin,safesetid,selinux,smack,tomoyo,apparmor,ipe,bpf"
 	help
 	  A comma-separated list of LSMs, in initialization order.
 	  Any LSMs left off this list, except for those with order
diff --git a/security/Makefile b/security/Makefile
index 59f238490665..cc0982214b84 100644
--- a/security/Makefile
+++ b/security/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_SECURITY_LOCKDOWN_LSM)	+= lockdown/
 obj-$(CONFIG_CGROUPS)			+= device_cgroup.o
 obj-$(CONFIG_BPF_LSM)			+= bpf/
 obj-$(CONFIG_SECURITY_LANDLOCK)		+= landlock/
+obj-$(CONFIG_SECURITY_IPE)		+= ipe/
 
 # Object integrity file lists
 obj-$(CONFIG_INTEGRITY)			+= integrity/
diff --git a/security/ipe/Kconfig b/security/ipe/Kconfig
new file mode 100644
index 000000000000..e4875fb04883
--- /dev/null
+++ b/security/ipe/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Integrity Policy Enforcement (IPE) configuration
+#
+
+menuconfig SECURITY_IPE
+	bool "Integrity Policy Enforcement (IPE)"
+	depends on SECURITY && SECURITYFS
+	select PKCS7_MESSAGE_PARSER
+	select SYSTEM_DATA_VERIFICATION
+	help
+	  This option enables the Integrity Policy Enforcement LSM
+	  allowing users to define a policy to enforce a trust-based access
+	  control. A key feature of IPE is a customizable policy to allow
+	  admins to reconfigure trust requirements on the fly.
+
+	  If unsure, answer N.
diff --git a/security/ipe/Makefile b/security/ipe/Makefile
new file mode 100644
index 000000000000..5486398a69e9
--- /dev/null
+++ b/security/ipe/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) 2020-2024 Microsoft Corporation. All rights reserved.
+#
+# Makefile for building the IPE module as part of the kernel tree.
+#
+
+obj-$(CONFIG_SECURITY_IPE) += \
+	ipe.o \
diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
new file mode 100644
index 000000000000..8d4ea372873e
--- /dev/null
+++ b/security/ipe/ipe.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020-2024 Microsoft Corporation. All rights reserved.
+ */
+#include <uapi/linux/lsm.h>
+
+#include "ipe.h"
+
+static struct lsm_blob_sizes ipe_blobs __ro_after_init = {
+};
+
+static const struct lsm_id ipe_lsmid = {
+	.name = "ipe",
+	.id = LSM_ID_IPE,
+};
+
+static struct security_hook_list ipe_hooks[] __ro_after_init = {
+};
+
+/**
+ * ipe_init() - Entry point of IPE.
+ *
+ * This is called at LSM init, which happens occurs early during kernel
+ * start up. During this phase, IPE registers its hooks and loads the
+ * builtin boot policy.
+ *
+ * Return:
+ * * %0		- OK
+ * * %-ENOMEM	- Out of memory (OOM)
+ */
+static int __init ipe_init(void)
+{
+	security_add_hooks(ipe_hooks, ARRAY_SIZE(ipe_hooks), &ipe_lsmid);
+
+	return 0;
+}
+
+DEFINE_LSM(ipe) = {
+	.name = "ipe",
+	.init = ipe_init,
+	.blobs = &ipe_blobs,
+};
diff --git a/security/ipe/ipe.h b/security/ipe/ipe.h
new file mode 100644
index 000000000000..adc3c45e9f53
--- /dev/null
+++ b/security/ipe/ipe.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020-2024 Microsoft Corporation. All rights reserved.
+ */
+
+#ifndef _IPE_H
+#define _IPE_H
+
+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+#define pr_fmt(fmt) "ipe: " fmt
+
+#include <linux/lsm_hooks.h>
+
+#endif /* _IPE_H */
diff --git a/security/security.c b/security/security.c
index 0a9a0ac3f266..820e0d437452 100644
--- a/security/security.c
+++ b/security/security.c
@@ -51,7 +51,8 @@
 	(IS_ENABLED(CONFIG_BPF_LSM) ? 1 : 0) + \
 	(IS_ENABLED(CONFIG_SECURITY_LANDLOCK) ? 1 : 0) + \
 	(IS_ENABLED(CONFIG_IMA) ? 1 : 0) + \
-	(IS_ENABLED(CONFIG_EVM) ? 1 : 0))
+	(IS_ENABLED(CONFIG_EVM) ? 1 : 0) + \
+	(IS_ENABLED(CONFIG_SECURITY_IPE) ? 1 : 0))
 
 /*
  * These are descriptions of the reasons that can be passed to the
diff --git a/tools/testing/selftests/lsm/lsm_list_modules_test.c b/tools/testing/selftests/lsm/lsm_list_modules_test.c
index 06d24d4679a6..1cc8a977c711 100644
--- a/tools/testing/selftests/lsm/lsm_list_modules_test.c
+++ b/tools/testing/selftests/lsm/lsm_list_modules_test.c
@@ -128,6 +128,9 @@ TEST(correct_lsm_list_modules)
 		case LSM_ID_EVM:
 			name = "evm";
 			break;
+		case LSM_ID_IPE:
+			name = "ipe";
+			break;
 		default:
 			name = "INVALID";
 			break;
-- 
2.44.0


