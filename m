Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275522A4EA0
	for <lists+linux-doc@lfdr.de>; Tue,  3 Nov 2020 19:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgKCSWh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Nov 2020 13:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729379AbgKCSVZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Nov 2020 13:21:25 -0500
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [IPv6:2001:1600:4:17::42a8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285BAC061A4C
        for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2020 10:21:20 -0800 (PST)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4CQdQQ5nsLzlhHh7;
        Tue,  3 Nov 2020 19:21:18 +0100 (CET)
Received: from localhost (unknown [94.23.54.103])
        by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4CQdQQ3XLhzlh8TK;
        Tue,  3 Nov 2020 19:21:18 +0100 (CET)
From:   =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>
Cc:     =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andy Lutomirski <luto@amacapital.net>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Jann Horn <jannh@google.com>, Jeff Dike <jdike@addtoit.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Shuah Khan <shuah@kernel.org>,
        Vincent Dagonneau <vincent.dagonneau@ssi.gouv.fr>,
        kernel-hardening@lists.openwall.com, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        linux-security-module@vger.kernel.org, x86@kernel.org,
        =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>
Subject: [PATCH v23 03/12] landlock: Set up the security framework and manage credentials
Date:   Tue,  3 Nov 2020 19:21:00 +0100
Message-Id: <20201103182109.1014179-4-mic@digikod.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103182109.1014179-1-mic@digikod.net>
References: <20201103182109.1014179-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mickaël Salaün <mic@linux.microsoft.com>

Process's credentials point to a Landlock domain, which is underneath
implemented with a ruleset.  In the following commits, this domain is
used to check and enforce the ptrace and filesystem security policies.
A domain is inherited from a parent to its child the same way a thread
inherits a seccomp policy.

Cc: James Morris <jmorris@namei.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Serge E. Hallyn <serge@hallyn.com>
Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
Reviewed-by: Jann Horn <jannh@google.com>
---

Changes since v21:
* Fix copyright dates.

Changes since v17:
* Constify returned domain pointers from landlock_get_current_domain()
  and landlock_get_task_domain() helpers.

Changes since v15:
* Optimize landlocked() for current thread.
* Display the greeting message when everything is initialized.

Changes since v14:
* Uses pr_fmt from common.h .
* Constify variables.
* Remove useless NULL initialization.

Changes since v13:
* totally get ride of the seccomp dependency
* only keep credential management and LSM setup.

Previous changes:
https://lore.kernel.org/lkml/20191104172146.30797-4-mic@digikod.net/
---
 security/Kconfig           | 10 +++----
 security/landlock/Makefile |  3 +-
 security/landlock/common.h | 20 +++++++++++++
 security/landlock/cred.c   | 46 ++++++++++++++++++++++++++++++
 security/landlock/cred.h   | 58 ++++++++++++++++++++++++++++++++++++++
 security/landlock/setup.c  | 31 ++++++++++++++++++++
 security/landlock/setup.h  | 16 +++++++++++
 7 files changed, 178 insertions(+), 6 deletions(-)
 create mode 100644 security/landlock/common.h
 create mode 100644 security/landlock/cred.c
 create mode 100644 security/landlock/cred.h
 create mode 100644 security/landlock/setup.c
 create mode 100644 security/landlock/setup.h

diff --git a/security/Kconfig b/security/Kconfig
index 15a4342b5d01..0ced7fd33e4d 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -278,11 +278,11 @@ endchoice
 
 config LSM
 	string "Ordered list of enabled LSMs"
-	default "lockdown,yama,loadpin,safesetid,integrity,smack,selinux,tomoyo,apparmor,bpf" if DEFAULT_SECURITY_SMACK
-	default "lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,smack,tomoyo,bpf" if DEFAULT_SECURITY_APPARMOR
-	default "lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf" if DEFAULT_SECURITY_TOMOYO
-	default "lockdown,yama,loadpin,safesetid,integrity,bpf" if DEFAULT_SECURITY_DAC
-	default "lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor,bpf"
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,smack,selinux,tomoyo,apparmor,bpf" if DEFAULT_SECURITY_SMACK
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,smack,tomoyo,bpf" if DEFAULT_SECURITY_APPARMOR
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf" if DEFAULT_SECURITY_TOMOYO
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,bpf" if DEFAULT_SECURITY_DAC
+	default "landlock,lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor,bpf"
 	help
 	  A comma-separated list of LSMs, in initialization order.
 	  Any LSMs left off this list will be ignored. This can be
diff --git a/security/landlock/Makefile b/security/landlock/Makefile
index d846eba445bb..041ea242e627 100644
--- a/security/landlock/Makefile
+++ b/security/landlock/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_SECURITY_LANDLOCK) := landlock.o
 
-landlock-y := object.o ruleset.o
+landlock-y := setup.o object.o ruleset.o \
+	cred.o
diff --git a/security/landlock/common.h b/security/landlock/common.h
new file mode 100644
index 000000000000..5dc0fe15707d
--- /dev/null
+++ b/security/landlock/common.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Landlock LSM - Common constants and helpers
+ *
+ * Copyright © 2016-2020 Mickaël Salaün <mic@digikod.net>
+ * Copyright © 2018-2020 ANSSI
+ */
+
+#ifndef _SECURITY_LANDLOCK_COMMON_H
+#define _SECURITY_LANDLOCK_COMMON_H
+
+#define LANDLOCK_NAME "landlock"
+
+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+
+#define pr_fmt(fmt) LANDLOCK_NAME ": " fmt
+
+#endif /* _SECURITY_LANDLOCK_COMMON_H */
diff --git a/security/landlock/cred.c b/security/landlock/cred.c
new file mode 100644
index 000000000000..7074149d2517
--- /dev/null
+++ b/security/landlock/cred.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Landlock LSM - Credential hooks
+ *
+ * Copyright © 2017-2020 Mickaël Salaün <mic@digikod.net>
+ * Copyright © 2018-2020 ANSSI
+ */
+
+#include <linux/cred.h>
+#include <linux/lsm_hooks.h>
+
+#include "common.h"
+#include "cred.h"
+#include "ruleset.h"
+#include "setup.h"
+
+static int hook_cred_prepare(struct cred *const new,
+		const struct cred *const old, const gfp_t gfp)
+{
+	const struct landlock_cred_security *cred_old = landlock_cred(old);
+	struct landlock_cred_security *cred_new = landlock_cred(new);
+	struct landlock_ruleset *dom_old;
+
+	dom_old = cred_old->domain;
+	if (dom_old) {
+		landlock_get_ruleset(dom_old);
+		cred_new->domain = dom_old;
+	}
+	return 0;
+}
+
+static void hook_cred_free(struct cred *const cred)
+{
+	landlock_put_ruleset_deferred(landlock_cred(cred)->domain);
+}
+
+static struct security_hook_list landlock_hooks[] __lsm_ro_after_init = {
+	LSM_HOOK_INIT(cred_prepare, hook_cred_prepare),
+	LSM_HOOK_INIT(cred_free, hook_cred_free),
+};
+
+__init void landlock_add_hooks_cred(void)
+{
+	security_add_hooks(landlock_hooks, ARRAY_SIZE(landlock_hooks),
+			LANDLOCK_NAME);
+}
diff --git a/security/landlock/cred.h b/security/landlock/cred.h
new file mode 100644
index 000000000000..f059c5c49583
--- /dev/null
+++ b/security/landlock/cred.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Landlock LSM - Credential hooks
+ *
+ * Copyright © 2019-2020 Mickaël Salaün <mic@digikod.net>
+ * Copyright © 2019-2020 ANSSI
+ */
+
+#ifndef _SECURITY_LANDLOCK_CRED_H
+#define _SECURITY_LANDLOCK_CRED_H
+
+#include <linux/cred.h>
+#include <linux/init.h>
+#include <linux/rcupdate.h>
+
+#include "ruleset.h"
+#include "setup.h"
+
+struct landlock_cred_security {
+	struct landlock_ruleset *domain;
+};
+
+static inline struct landlock_cred_security *landlock_cred(
+		const struct cred *cred)
+{
+	return cred->security + landlock_blob_sizes.lbs_cred;
+}
+
+static inline const struct landlock_ruleset *landlock_get_current_domain(void)
+{
+	return landlock_cred(current_cred())->domain;
+}
+
+/*
+ * The call needs to come from an RCU read-side critical section.
+ */
+static inline const struct landlock_ruleset *landlock_get_task_domain(
+		const struct task_struct *const task)
+{
+	return landlock_cred(__task_cred(task))->domain;
+}
+
+static inline bool landlocked(const struct task_struct *const task)
+{
+	bool has_dom;
+
+	if (task == current)
+		return !!landlock_get_current_domain();
+
+	rcu_read_lock();
+	has_dom = !!landlock_get_task_domain(task);
+	rcu_read_unlock();
+	return has_dom;
+}
+
+__init void landlock_add_hooks_cred(void);
+
+#endif /* _SECURITY_LANDLOCK_CRED_H */
diff --git a/security/landlock/setup.c b/security/landlock/setup.c
new file mode 100644
index 000000000000..39ee1766f175
--- /dev/null
+++ b/security/landlock/setup.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Landlock LSM - Security framework setup
+ *
+ * Copyright © 2016-2020 Mickaël Salaün <mic@digikod.net>
+ * Copyright © 2018-2020 ANSSI
+ */
+
+#include <linux/init.h>
+#include <linux/lsm_hooks.h>
+
+#include "common.h"
+#include "cred.h"
+#include "setup.h"
+
+struct lsm_blob_sizes landlock_blob_sizes __lsm_ro_after_init = {
+	.lbs_cred = sizeof(struct landlock_cred_security),
+};
+
+static int __init landlock_init(void)
+{
+	landlock_add_hooks_cred();
+	pr_info("Up and running.\n");
+	return 0;
+}
+
+DEFINE_LSM(LANDLOCK_NAME) = {
+	.name = LANDLOCK_NAME,
+	.init = landlock_init,
+	.blobs = &landlock_blob_sizes,
+};
diff --git a/security/landlock/setup.h b/security/landlock/setup.h
new file mode 100644
index 000000000000..9fdbf33fcc33
--- /dev/null
+++ b/security/landlock/setup.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Landlock LSM - Security framework setup
+ *
+ * Copyright © 2016-2020 Mickaël Salaün <mic@digikod.net>
+ * Copyright © 2018-2020 ANSSI
+ */
+
+#ifndef _SECURITY_LANDLOCK_SETUP_H
+#define _SECURITY_LANDLOCK_SETUP_H
+
+#include <linux/lsm_hooks.h>
+
+extern struct lsm_blob_sizes landlock_blob_sizes;
+
+#endif /* _SECURITY_LANDLOCK_SETUP_H */
-- 
2.28.0

