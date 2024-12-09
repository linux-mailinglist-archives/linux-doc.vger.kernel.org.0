Return-Path: <linux-doc+bounces-32326-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF219E9F61
	for <lists+linux-doc@lfdr.de>; Mon,  9 Dec 2024 20:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3218A2822AA
	for <lists+linux-doc@lfdr.de>; Mon,  9 Dec 2024 19:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BF81990AD;
	Mon,  9 Dec 2024 19:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TGC3gepu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8C198A3F
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772180; cv=none; b=cxNb9Fsda+/TWXDRPCnDOIEJpWFK+3rCTJgyJs7kbdxXgXCWqPkmYgaW+JhmQrHGcsUV6QF4zEkfgThOptS1wDuioWmqfJUBZqVsHClrXmmYktS2P80hjrU12iuH/ZGNQjClhcBX8VsGAlSTiQTFkvsr8i4lvtBk4HyIYNfjJiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772180; c=relaxed/simple;
	bh=9fRocrd/U9wpjtmuV2DlKXD93yMnSkv0jrtzRqtkp3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeSt/x6r0S0dY9c0HhyhbvrlRYW7P6idcyDA1OuC3aRPNvhM0lWj5RMegjXVn949IcQYT6aOsjjBLk+liMWp4D0pmGXkR2B2Ges1WV9bhe4HyG5Ha1u66g93KMgZBqmQSMXu17rIZ+v6fa3psC50sVvdim+j2X9KX/pn6vaT4/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TGC3gepu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215770613dbso31244325ad.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2024 11:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733772176; x=1734376976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLFMgiWn0M/Bow/bFF/XQPoIbOEOGef03iAsZ0LfnTo=;
        b=TGC3gepuKWx6NTZoBqtF9NseN6+0BCpfhVfwWlOoYCioEl+ib//J+9vai9WzM23xLp
         DkevQDbLSYm6x0ZR3HYItondC4AvLqoupVmwRItJeEsEfR4u37WBnntHEBRJikB0kaRw
         SuH3uUabUOps9++HyPheK5uqNLVo6uSsHi0tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733772176; x=1734376976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLFMgiWn0M/Bow/bFF/XQPoIbOEOGef03iAsZ0LfnTo=;
        b=XjMdZ/xoyN7G+jq1Vrurvcq9F91mUUEzMH7S47qvfPCGkDGoKgandI+nqdxV2DtNsE
         34KfuN91szjQtNZ+QnBGA8fIhfmbL/fEmFVqy+uK4jtJe9gS4XqKLKhvzMrahnyIL28U
         5t3xQrK4tRixyHZ10Rj7OjDatABeQ+R1m2a6ias4s3QWqB+rUEVIUaAoF5DqgD6q8uJ8
         Y667n4A7uDhq/qShKijKO+WXoy3g9XCHvZMiWPwtgaOkrgmCyrlnhOdyuCs9yW80nEPB
         E1Th/deeAkRxVGgJqMuFydjGFvr3HaQLYr6z5wre/vFVBfv+ZQYsduasIiXgOWsrdJu4
         t5aA==
X-Forwarded-Encrypted: i=1; AJvYcCWy9FY71Xh94QYDOEOxWDctDtJOtbI8G266R4wf9HW41Tfy9cmkIJwa6WCUlYrMCilL8q4ehwc97AI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOmCkYE8NJBze4H1PUqAmuVSTwSlHlC2i0c55rNLOi4hF+uFE/
	IW1vrT1bm1f2757cZ8tTCB0WUQaaU5H/oPf1vuXr+3gxF2cKi5XsXRLdAtnCiA==
X-Gm-Gg: ASbGncuJBdY1roxSiLq0uAcbiDG0B2jUhO9l5Uhi5WqlQ4GP+rxy5R5RNfTP4G5GfKF
	solfne7STYwVGSSxGLTQKudSPd0JMRvQzjNYTsUdH5QMkfgGtYh7yAcH8ItahWAOEyEReWCcBKm
	agbwE5TVW6lcaOnLxJHvK/58tMYnSDtBjA7ORHBzDAxzOBYkOdpEPUOuJNk4ABkRDAK0R0XNkol
	Co9IMMZk1oMYBMrEXtkZwIviy/p0ra25TSSRcX3ob5sXIKptQXsVRf4Jq43KY5dGbrwVnh5F4U1
	BaAFzK2YhDV/EXKZABkH05+h/6AOzpJ7b9bEmPw=
X-Google-Smtp-Source: AGHT+IFpE1rqYXyxV/cb0cRTJ/cBbuIDYpyiymqlW3k/kc8mR99n1DUmq7L5t0l5gOCIT3D7o50sUA==
X-Received: by 2002:a17:902:fc46:b0:215:83e1:99ff with SMTP id d9443c01a7336-2166a00836bmr22960905ad.27.1733772176442;
        Mon, 09 Dec 2024 11:22:56 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (141.161.16.34.bc.googleusercontent.com. [34.16.161.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21645b94602sm27363375ad.96.2024.12.09.11.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:22:55 -0800 (PST)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	hridya@google.com,
	smoreland@google.com
Cc: kernel-team@android.com
Subject: [PATCH net-next v9 1/1] binder: report txn errors via generic netlink
Date: Mon,  9 Dec 2024 11:22:47 -0800
Message-ID: <20241209192247.3371436-2-dualli@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209192247.3371436-1-dualli@chromium.org>
References: <20241209192247.3371436-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

Frozen tasks can't process binder transactions, so sync binder
transactions will fail with BR_FROZEN_REPLY and async binder
transactions will be queued in the kernel async binder buffer.
As these queued async transactions accumulates over time, the async
buffer will eventually be running out, denying all new transactions
after that with BR_FAILED_REPLY.

In addition to the above cases, different kinds of binder error codes
might be returned to the sender. However, the core Linux, or Android,
system administration process never knows what's actually happening.

Introduce generic netlink messages into the binder driver so that the
Linux/Android system administration process can listen to important
events and take corresponding actions, like stopping a broken app from
attacking the OS by sending huge amount of spamming binder transactions.

The new binder genl sources and headers are automatically generated from
the corresponding binder_genl YAML spec. Don't modify them directly.

Signed-off-by: Li Li <dualli@google.com>
---
 Documentation/admin-guide/binder_genl.rst    |  96 +++++++
 Documentation/admin-guide/index.rst          |   1 +
 Documentation/netlink/specs/binder_genl.yaml | 108 ++++++++
 drivers/android/Kconfig                      |   1 +
 drivers/android/Makefile                     |   2 +-
 drivers/android/binder.c                     | 277 ++++++++++++++++++-
 drivers/android/binder_genl.c                |  39 +++
 drivers/android/binder_genl.h                |  18 ++
 drivers/android/binder_internal.h            |  27 +-
 drivers/android/binder_trace.h               |  35 +++
 drivers/android/binderfs.c                   |   2 +
 include/uapi/linux/android/binder_genl.h     |  55 ++++
 12 files changed, 655 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/admin-guide/binder_genl.rst
 create mode 100644 Documentation/netlink/specs/binder_genl.yaml
 create mode 100644 drivers/android/binder_genl.c
 create mode 100644 drivers/android/binder_genl.h
 create mode 100644 include/uapi/linux/android/binder_genl.h

diff --git a/Documentation/admin-guide/binder_genl.rst b/Documentation/admin-guide/binder_genl.rst
new file mode 100644
index 000000000000..b395d7a9849b
--- /dev/null
+++ b/Documentation/admin-guide/binder_genl.rst
@@ -0,0 +1,96 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================================
+Generic Netlink for the Android Binder Driver (Binder Genl)
+===========================================================
+
+The Generic Netlink subsystem in the Linux kernel provides a generic way for
+the Linux kernel to communicate to the user space applications via binder
+driver. It is used to report various kinds of binder transactions to user
+space administration process. The driver allows multiple binder devices and
+their corresponding binder contexts. Each context has an independent Generic
+Netlink for security reason. To prevent untrusted user applications from
+accessing the netlink data, the kernel driver uses unicast mode instead of
+multicast.
+
+Basically, the user space code uses the "set" command to request what kind
+of binder transactions should be reported by the kernel binder driver. The
+driver then echoes the attributes in a reply message to acknowledge the
+request. The "set" command also registers the current user space process to
+receive the reports. When the user space process exits, the previous request
+will be reset to prevent any potential leaks.
+
+Currently the driver can report binder transactions that "failed" to reach
+the target process, or that are "delayed" due to the target process being
+frozen by cgroup freezer, or that are considered "spam" according to existing
+logic in binder_alloc.c.
+
+When the specified binder transactions happen, the driver uses the "report"
+command to send a generic netlink message to the registered process,
+containing the payload struct binder_report.
+
+More details about the flags, attributes and operations can be found at the
+the doc sections in Documentations/netlink/specs/binder_genl.yaml and the
+kernel-doc comments of the new source code in binder.{h|c}.
+
+Using Binder Genl
+-----------------
+
+The Binder Genl can be used in the same way as any other generic netlink
+drivers. Userspace application uses a raw netlink socket to send commands
+to and receive packets from the kernel driver.
+
+.. note::
+    If the userspace application that talks to the driver exits, the kernel
+    driver will automatically reset the configuration to the default and
+    stop sending more reports to prevent leaking memory.
+
+Usage example (user space pseudo code):
+
+::
+
+    // open netlink socket
+    int fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
+
+    // bind netlink socket
+    bind(fd, struct socketaddr);
+
+    // get the family id of the binder genl
+    send(fd, CTRL_CMD_GETFAMILY, CTRL_ATTR_FAMILY_NAME,
+            BINDER_GENL_FAMILY_NAME);
+    void *data = recv(CTRL_CMD_NEWFAMILY);
+    __u16 id = nla(data)[CTRL_ATTR_FAMILY_ID];
+
+    // enable per-context binder report
+    send(fd, id, BINDER_GENL_CMD_SET, "binder", 0, BINDER_GENL_FLAG_FAILED |
+            BINDER_GENL_FLAG_DELAYED);
+
+    // confirm the per-context configuration
+    data = recv(fd, BINDER_GENL_CMD_REPLY);
+    char *context = nla(data)[BINDER_GENL_A_CMD_CONTEXT];
+    __u32 pid =  nla(data)[BINDER_GENL_A_CMD_PID];
+    __u32 flags = nla(data)[BINDER_GENL_A_CMD_FLAGS];
+
+    // set optional per-process report, overriding the per-context one
+    send(fd, id, BINDER_GENL_CMD_SET, "binder", getpid(),
+            BINDER_GENL_FLAG_SPAM | BINDER_REPORT_OVERRIDE);
+
+    // confirm the optional per-process configuration
+    data = recv(fd, BINDER_GENL_CMD_REPLY);
+    context = nla(data)[BINDER_GENL_A_CMD_CONTEXT];
+    pid =  nla(data)[BINDER_GENL_A_CMD_PID];
+    flags = nla(data)[BINDER_GENL_A_CMD_FLAGS];
+
+    // wait and read all binder reports
+    while (running) {
+            data = recv(fd, BINDER_GENL_CMD_REPORT);
+            auto *attr = nla(data)[BINDER_GENL_A_REPORT_XXX];
+
+            // process binder report
+            do_something(*attr);
+    }
+
+    // clean up
+    send(fd, id, BINDER_GENL_CMD_SET, 0, 0);
+    send(fd, id, BINDER_GENL_CMD_SET, getpid(), 0);
+    close(fd);
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index e85b1adf5908..b3b5cfadffe5 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -79,6 +79,7 @@ configure specific aspects of kernel behavior to your liking.
    aoe/index
    auxdisplay/index
    bcache
+   binder_genl
    binderfs
    binfmt-misc
    blockdev/index
diff --git a/Documentation/netlink/specs/binder_genl.yaml b/Documentation/netlink/specs/binder_genl.yaml
new file mode 100644
index 000000000000..3c6024b9a689
--- /dev/null
+++ b/Documentation/netlink/specs/binder_genl.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+
+name: binder_genl
+protocol: genetlink
+uapi-header: linux/android/binder_genl.h
+doc: Netlink protocol to report binder transaction errors and warnings.
+
+definitions:
+  -
+    type: flags
+    name: flag
+    doc: Define what kind of binder transactions should be reported.
+    entries: [ failed, delayed, spam, override ]
+
+attribute-sets:
+  -
+    name: cmd
+    doc: The supported attributes of "set" and "reply" commands
+    attributes:
+      -
+        name: context
+        type: string
+        doc: The binder context to enable binder genl report.
+      -
+        name: pid
+        type: u32
+        doc: The binder proc to enable binder genl report.
+      -
+        name: flags
+        type: u32
+        enum: flag
+        doc: What kind of binder transactions should be reported.
+  -
+    name: report
+    doc: The supported attributes of "report" command
+    attributes:
+      -
+        name: context
+        type: string
+        doc: The binder context where the binder genl report happens.
+      -
+        name: err
+        type: u32
+        doc: Copy of binder_driver_return_protocol returned to the sender.
+      -
+        name: from_pid
+        type: u32
+        doc: Sender pid of the corresponding binder transaction.
+      -
+        name: from_tid
+        type: u32
+        doc: Sender tid of the corresponding binder transaction.
+      -
+        name: to_pid
+        type: u32
+        doc: Target pid of the corresponding binder transaction.
+      -
+        name: to_tid
+        type: u32
+        doc: Target tid of the corresponding binder transaction.
+      -
+        name: reply
+        type: u32
+        doc: 1 means the transaction is a reply, 0 otherwise.
+      -
+        name: flags
+        type: u32
+        doc: Copy of binder_transaction_data->flags.
+      -
+        name: code
+        type: u32
+        doc: Copy of binder_transaction_data->code.
+      -
+        name: data_size
+        type: u32
+        doc: Copy of binder_transaction_data->data_size.
+
+operations:
+  list:
+    -
+      name: set
+      doc: Set flags from user space.
+      attribute-set: cmd
+
+      do:
+        request: &params
+          attributes:
+            - context
+            - pid
+            - flags
+        reply: *params
+    -
+      name: report
+      doc: Send the requested reports to user space.
+      attribute-set: report
+
+      event:
+        attributes:
+          - context
+          - err
+          - from_pid
+          - from_tid
+          - to_pid
+          - to_tid
+          - reply
+          - flags
+          - code
+          - data_size
diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
index 07aa8ae0a058..e2fa620934e2 100644
--- a/drivers/android/Kconfig
+++ b/drivers/android/Kconfig
@@ -4,6 +4,7 @@ menu "Android"
 config ANDROID_BINDER_IPC
 	bool "Android Binder IPC Driver"
 	depends on MMU
+	depends on NET
 	default n
 	help
 	  Binder is used in Android for both communication between processes,
diff --git a/drivers/android/Makefile b/drivers/android/Makefile
index c9d3d0c99c25..d818447fbc4c 100644
--- a/drivers/android/Makefile
+++ b/drivers/android/Makefile
@@ -2,5 +2,5 @@
 ccflags-y += -I$(src)			# needed for trace events
 
 obj-$(CONFIG_ANDROID_BINDERFS)		+= binderfs.o
-obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder.o binder_alloc.o
+obj-$(CONFIG_ANDROID_BINDER_IPC)	+= binder.o binder_alloc.o binder_genl.o
 obj-$(CONFIG_ANDROID_BINDER_IPC_SELFTEST) += binder_alloc_selftest.o
diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index ef353ca13c35..eaa9b763ef20 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -72,6 +72,7 @@
 
 #include <linux/cacheflush.h>
 
+#include "binder_genl.h"
 #include "binder_internal.h"
 #include "binder_trace.h"
 
@@ -2990,6 +2991,150 @@ static void binder_set_txn_from_error(struct binder_transaction *t, int id,
 	binder_thread_dec_tmpref(from);
 }
 
+/**
+ * binder_find_proc() - set binder report flags
+ * @pid:	the target process
+ */
+static struct binder_proc *binder_find_proc(int pid)
+{
+	struct binder_proc *proc;
+
+	mutex_lock(&binder_procs_lock);
+	hlist_for_each_entry(proc, &binder_procs, proc_node) {
+		if (proc->pid == pid) {
+			mutex_unlock(&binder_procs_lock);
+			return proc;
+		}
+	}
+	mutex_unlock(&binder_procs_lock);
+
+	return NULL;
+}
+
+/**
+ * binder_genl_set_report() - set binder report flags
+ * @context:	the binder context to set the flags
+ * @pid:	the target process
+ * @flags:	the flags to set
+ *
+ * If pid is 0, the flags are applied to the whole binder context.
+ * Otherwise, the flags are applied to the specific process only.
+ */
+static int binder_genl_set_report(struct binder_context *context, u32 pid,
+				  u32 flags)
+{
+	struct binder_proc *proc;
+
+	if (flags != (flags & (BINDER_GENL_FLAG_OVERRIDE
+			| BINDER_GENL_FLAG_FAILED
+			| BINDER_GENL_FLAG_DELAYED
+			| BINDER_GENL_FLAG_SPAM))) {
+		pr_err("Invalid binder report flags: %u\n", flags);
+		return -EINVAL;
+	}
+
+	if (!pid) {
+		/* Set the global flags for the whole binder context */
+		context->report_flags = flags;
+	} else {
+		/* Set the per-process flags */
+		proc = binder_find_proc(pid);
+		if (!proc) {
+			pr_err("Invalid binder report pid %u\n", pid);
+			return -EINVAL;
+		}
+
+		proc->report_flags = flags;
+	}
+
+	return 0;
+}
+
+/**
+ * binder_genl_report_enabled() - check if binder genl reports are enabled
+ * @proc:	the binder_proc to check
+ * @mask:	the categories of binder genl reports
+ *
+ * Returns true if certain binder genl reports are enabled for this binder
+ * proc (when per-process overriding takes effect) or context.
+ */
+static bool binder_genl_report_enabled(struct binder_proc *proc, u32 mask)
+{
+	struct binder_context *context = proc->context;
+
+	if (!context->report_portid)
+		return false;
+
+	if (proc->report_flags & BINDER_GENL_FLAG_OVERRIDE)
+		return (proc->report_flags & mask) != 0;
+	else
+		return (context->report_flags & mask) != 0;
+}
+
+/**
+ * binder_genl_send_report() - send one binder genl report
+ * @context:	the binder context
+ * @err:	copy of binder_driver_return_protocol returned to the sender
+ * @pid:	sender process
+ * @tid:	sender thread
+ * @to_pid:	target process
+ * @to_tid:	target thread
+ * @reply:	whether the binder transaction is a reply
+ * @tr:		the binder transaction data
+ *
+ * Packs the report data into a "report" binder genl message and send it.
+ */
+static void binder_genl_send_report(struct binder_context *context, u32 err,
+				    u32 pid, u32 tid, u32 to_pid, u32 to_tid,
+				    u32 reply,
+				    struct binder_transaction_data *tr)
+{
+	int ret;
+	struct sk_buff *skb;
+	void *hdr;
+
+	trace_binder_send_report(context->name, err, pid, tid, to_pid, to_tid,
+				 reply, tr);
+
+	skb = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (!skb) {
+		pr_err("Failed to alloc binder genl message\n");
+		return;
+	}
+
+	hdr = genlmsg_put(skb, 0, atomic_inc_return(&context->report_seq),
+			  &binder_genl_nl_family, 0, BINDER_GENL_CMD_REPORT);
+	if (!hdr)
+		goto free_skb;
+
+	if (nla_put_string(skb, BINDER_GENL_A_REPORT_CONTEXT, context->name) ||
+	    nla_put_u32(skb, BINDER_GENL_A_REPORT_ERR, err) ||
+	    nla_put_u32(skb, BINDER_GENL_A_REPORT_FROM_PID, pid) ||
+	    nla_put_u32(skb, BINDER_GENL_A_REPORT_FROM_TID, tid) ||
+	    nla_put_u32(skb, BINDER_GENL_A_REPORT_TO_PID, to_pid) ||
+	    nla_put_u32(skb, BINDER_GENL_A_REPORT_TO_TID, to_tid) ||
+	    nla_put_u32(skb, BINDER_GENL_A_REPORT_REPLY, reply) ||
+	    nla_put_u32(skb, BINDER_GENL_A_REPORT_FLAGS, tr->flags) ||
+	    nla_put_u32(skb, BINDER_GENL_A_REPORT_CODE, tr->code) ||
+	    nla_put_u32(skb, BINDER_GENL_A_REPORT_DATA_SIZE, tr->data_size))
+		goto cancel_skb;
+
+	genlmsg_end(skb, hdr);
+
+	ret = genlmsg_unicast(&init_net, skb, context->report_portid);
+	if (ret < 0)
+		pr_err("Failed to send binder genl message to %d: %d\n",
+		       context->report_portid, ret);
+	return;
+
+cancel_skb:
+	pr_err("Failed to add report attributes to binder genl message\n");
+	genlmsg_cancel(skb, hdr);
+free_skb:
+	pr_err("Free binder genl report message on error\n");
+	nlmsg_free(skb);
+}
+
 static void binder_transaction(struct binder_proc *proc,
 			       struct binder_thread *thread,
 			       struct binder_transaction_data *tr, int reply,
@@ -3684,10 +3829,18 @@ static void binder_transaction(struct binder_proc *proc,
 		return_error_line = __LINE__;
 		goto err_copy_data_failed;
 	}
-	if (t->buffer->oneway_spam_suspect)
+	if (t->buffer->oneway_spam_suspect) {
 		tcomplete->type = BINDER_WORK_TRANSACTION_ONEWAY_SPAM_SUSPECT;
-	else
+		if (binder_genl_report_enabled(proc, BINDER_GENL_FLAG_SPAM))
+			binder_genl_send_report(context,
+						BR_ONEWAY_SPAM_SUSPECT,
+						proc->pid, thread->pid,
+						target_proc ? target_proc->pid : 0,
+						target_thread ? target_thread->pid : 0,
+						reply, tr);
+	} else {
 		tcomplete->type = BINDER_WORK_TRANSACTION_COMPLETE;
+	}
 	t->work.type = BINDER_WORK_TRANSACTION;
 
 	if (reply) {
@@ -3737,8 +3890,15 @@ static void binder_transaction(struct binder_proc *proc,
 		 * process and is put in a pending queue, waiting for the target
 		 * process to be unfrozen.
 		 */
-		if (return_error == BR_TRANSACTION_PENDING_FROZEN)
+		if (return_error == BR_TRANSACTION_PENDING_FROZEN) {
 			tcomplete->type = BINDER_WORK_TRANSACTION_PENDING;
+			if (binder_genl_report_enabled(proc, BINDER_GENL_FLAG_DELAYED))
+				binder_genl_send_report(context, return_error,
+							proc->pid, thread->pid,
+							target_proc ? target_proc->pid : 0,
+							target_thread ? target_thread->pid : 0,
+							reply, tr);
+		}
 		binder_enqueue_thread_work(thread, tcomplete);
 		if (return_error &&
 		    return_error != BR_TRANSACTION_PENDING_FROZEN)
@@ -3800,6 +3960,13 @@ static void binder_transaction(struct binder_proc *proc,
 		binder_dec_node_tmpref(target_node);
 	}
 
+	if (binder_genl_report_enabled(proc, BINDER_GENL_FLAG_FAILED))
+		binder_genl_send_report(context, return_error,
+					proc->pid, thread->pid,
+					target_proc ? target_proc->pid : 0,
+					target_thread ? target_thread->pid : 0,
+					reply, tr);
+
 	binder_debug(BINDER_DEBUG_FAILED_TRANSACTION,
 		     "%d:%d transaction %s to %d:%d failed %d/%d/%d, size %lld-%lld line %d\n",
 		     proc->pid, thread->pid, reply ? "reply" :
@@ -6137,6 +6304,11 @@ static int binder_release(struct inode *nodp, struct file *filp)
 
 	binder_defer_work(proc, BINDER_DEFERRED_RELEASE);
 
+	if (proc->pid == proc->context->report_portid) {
+		proc->context->report_portid = 0;
+		proc->context->report_flags = 0;
+	}
+
 	return 0;
 }
 
@@ -6335,6 +6507,87 @@ binder_defer_work(struct binder_proc *proc, enum binder_deferred_state defer)
 	mutex_unlock(&binder_deferred_lock);
 }
 
+/**
+ * binder_genl_nl_set_doit() - .doit handler for BINDER_GENL_CMD_SET
+ * @skb:	the metadata struct passed from netlink driver
+ * @info:	the generic netlink struct passed from netlink driver
+ *
+ * Implements the .doit function to process binder genl commands.
+ */
+int binder_genl_nl_set_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	int portid;
+	u32 pid;
+	u32 flags;
+	void *hdr;
+	struct binder_device *device;
+	struct binder_context *context = NULL;
+
+	hlist_for_each_entry(device, &binder_devices, hlist) {
+		if (!nla_strcmp(info->attrs[BINDER_GENL_A_CMD_CONTEXT],
+				device->context.name)) {
+			context = &device->context;
+			break;
+		}
+	}
+
+	if (!context) {
+		NL_SET_ERR_MSG(info->extack, "Unknown binder context\n");
+		return -EINVAL;
+	}
+
+	portid = nlmsg_hdr(skb)->nlmsg_pid;
+	pid = nla_get_u32(info->attrs[BINDER_GENL_A_CMD_PID]);
+	flags = nla_get_u32(info->attrs[BINDER_GENL_A_CMD_FLAGS]);
+
+	if (context->report_portid && context->report_portid != portid) {
+		NL_SET_ERR_MSG_FMT(info->extack,
+				   "No permission to set flags from %d\n",
+				   portid);
+		return -EPERM;
+	}
+
+	if (binder_genl_set_report(context, pid, flags) < 0) {
+		pr_err("Failed to set report flags %u for %u\n", flags, pid);
+		return -EINVAL;
+	}
+
+	skb = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (!skb) {
+		pr_err("Failed to alloc binder genl reply message\n");
+		return -ENOMEM;
+	}
+
+	hdr = genlmsg_iput(skb, info);
+	if (!hdr)
+		goto free_skb;
+
+	if (nla_put_string(skb, BINDER_GENL_A_CMD_CONTEXT, context->name) ||
+	    nla_put_u32(skb, BINDER_GENL_A_CMD_PID, pid) ||
+	    nla_put_u32(skb, BINDER_GENL_A_CMD_FLAGS, flags))
+		goto cancel_skb;
+
+	genlmsg_end(skb, hdr);
+
+	if (genlmsg_reply(skb, info)) {
+		pr_err("Failed to send binder genl reply message\n");
+		return -EFAULT;
+	}
+
+	if (!context->report_portid)
+		context->report_portid = portid;
+
+	return 0;
+
+cancel_skb:
+	pr_err("Failed to add reply attributes to binder genl message\n");
+	genlmsg_cancel(skb, hdr);
+free_skb:
+	pr_err("Free binder genl reply message on error\n");
+	nlmsg_free(skb);
+	return -EMSGSIZE;
+}
+
 static void print_binder_transaction_ilocked(struct seq_file *m,
 					     struct binder_proc *proc,
 					     const char *prefix,
@@ -6928,6 +7181,17 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
 	{} /* terminator */
 };
 
+/**
+ * Add a binder device to binder_devices
+ * @device: the new binder device to add to the global list
+ *
+ * Not reentrant as the list is not protected by any locks
+ */
+void binder_add_device(struct binder_device *device)
+{
+	hlist_add_head(&device->hlist, &binder_devices);
+}
+
 static int __init init_binder_device(const char *name)
 {
 	int ret;
@@ -6953,6 +7217,7 @@ static int __init init_binder_device(const char *name)
 	}
 
 	hlist_add_head(&binder_device->hlist, &binder_devices);
+	binder_device->context.report_seq = (atomic_t)ATOMIC_INIT(0);
 
 	return ret;
 }
@@ -7009,6 +7274,12 @@ static int __init binder_init(void)
 	if (ret)
 		goto err_init_binder_device_failed;
 
+	ret = genl_register_family(&binder_genl_nl_family);
+	if (ret) {
+		pr_err("Failed to register binder genl family\n");
+		goto err_init_binder_device_failed;
+	}
+
 	return ret;
 
 err_init_binder_device_failed:
diff --git a/drivers/android/binder_genl.c b/drivers/android/binder_genl.c
new file mode 100644
index 000000000000..29d79bdd9649
--- /dev/null
+++ b/drivers/android/binder_genl.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/binder_genl.yaml */
+/* YNL-GEN kernel source */
+
+#include <net/netlink.h>
+#include <net/genetlink.h>
+
+#include "binder_genl.h"
+
+#include <uapi/linux/android/binder_genl.h>
+
+/* BINDER_GENL_CMD_SET - do */
+static const struct nla_policy binder_genl_set_nl_policy[BINDER_GENL_A_CMD_FLAGS + 1] = {
+	[BINDER_GENL_A_CMD_CONTEXT] = { .type = NLA_NUL_STRING, },
+	[BINDER_GENL_A_CMD_PID] = { .type = NLA_U32, },
+	[BINDER_GENL_A_CMD_FLAGS] = NLA_POLICY_MASK(NLA_U32, 0xf),
+};
+
+/* Ops table for binder_genl */
+static const struct genl_split_ops binder_genl_nl_ops[] = {
+	{
+		.cmd		= BINDER_GENL_CMD_SET,
+		.doit		= binder_genl_nl_set_doit,
+		.policy		= binder_genl_set_nl_policy,
+		.maxattr	= BINDER_GENL_A_CMD_FLAGS,
+		.flags		= GENL_CMD_CAP_DO,
+	},
+};
+
+struct genl_family binder_genl_nl_family __ro_after_init = {
+	.name		= BINDER_GENL_FAMILY_NAME,
+	.version	= BINDER_GENL_FAMILY_VERSION,
+	.netnsok	= true,
+	.parallel_ops	= true,
+	.module		= THIS_MODULE,
+	.split_ops	= binder_genl_nl_ops,
+	.n_split_ops	= ARRAY_SIZE(binder_genl_nl_ops),
+};
diff --git a/drivers/android/binder_genl.h b/drivers/android/binder_genl.h
new file mode 100644
index 000000000000..9d68c155b7c4
--- /dev/null
+++ b/drivers/android/binder_genl.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/binder_genl.yaml */
+/* YNL-GEN kernel header */
+
+#ifndef _LINUX_BINDER_GENL_GEN_H
+#define _LINUX_BINDER_GENL_GEN_H
+
+#include <net/netlink.h>
+#include <net/genetlink.h>
+
+#include <uapi/linux/android/binder_genl.h>
+
+int binder_genl_nl_set_doit(struct sk_buff *skb, struct genl_info *info);
+
+extern struct genl_family binder_genl_nl_family;
+
+#endif /* _LINUX_BINDER_GENL_GEN_H */
diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
index f8d6be682f23..cc745367a519 100644
--- a/drivers/android/binder_internal.h
+++ b/drivers/android/binder_internal.h
@@ -12,21 +12,35 @@
 #include <linux/stddef.h>
 #include <linux/types.h>
 #include <linux/uidgid.h>
+#include <net/genetlink.h>
 #include <uapi/linux/android/binderfs.h>
 #include "binder_alloc.h"
 #include "dbitmap.h"
 
+/**
+ * struct binder_context - information about a binder domain
+ * @binder_context_mgr_node: the context manager
+ * @context_mgr_node_lock:   the lock protecting the above context manager node
+ * @binder_context_mgr_uid:  the uid of the above context manager
+ * @name:                    the name of the binder device
+ * @report_portid:           the netlink socket to receive binder reports
+ * @report_flags:            the categories of binder transactions that would
+ *                           be reported (see enum binder_report_flag).
+ * @report_seq:              the seq number of the generic netlink report
+ */
 struct binder_context {
 	struct binder_node *binder_context_mgr_node;
 	struct mutex context_mgr_node_lock;
 	kuid_t binder_context_mgr_uid;
 	const char *name;
+	u32 report_portid;
+	u32 report_flags;
+	atomic_t report_seq;
 };
 
 /**
  * struct binder_device - information about a binder device node
- * @hlist:          list of binder devices (only used for devices requested via
- *                  CONFIG_ANDROID_BINDER_DEVICES)
+ * @hlist:          list of binder devices
  * @miscdev:        information about a binder character device node
  * @context:        binder context information
  * @binderfs_inode: This is the inode of the root dentry of the super block
@@ -415,6 +429,8 @@ struct binder_ref {
  * @binderfs_entry:       process-specific binderfs log file
  * @oneway_spam_detection_enabled: process enabled oneway spam detection
  *                        or not
+ * @report_flags:         the categories of binder transactions that would
+ *                        be reported (see enum binder_genl_flag).
  *
  * Bookkeeping structure for binder processes
  */
@@ -453,6 +469,7 @@ struct binder_proc {
 	spinlock_t outer_lock;
 	struct dentry *binderfs_entry;
 	bool oneway_spam_detection_enabled;
+	u32 report_flags;
 };
 
 /**
@@ -582,4 +599,10 @@ struct binder_object {
 	};
 };
 
+/**
+ * Add a binder device to binder_devices
+ * @device: the new binder device to add to the global list
+ */
+void binder_add_device(struct binder_device *device);
+
 #endif /* _LINUX_BINDER_INTERNAL_H */
diff --git a/drivers/android/binder_trace.h b/drivers/android/binder_trace.h
index fe38c6fc65d0..551b6c9d9f73 100644
--- a/drivers/android/binder_trace.h
+++ b/drivers/android/binder_trace.h
@@ -423,6 +423,41 @@ TRACE_EVENT(binder_return,
 			  "unknown")
 );
 
+TRACE_EVENT(binder_send_report,
+	TP_PROTO(const char *name, u32 err, u32 pid, u32 tid, u32 to_pid,
+		 u32 to_tid, u32 reply, struct binder_transaction_data *tr),
+	TP_ARGS(name, err, pid, tid, to_pid, to_tid, reply, tr),
+	TP_STRUCT__entry(
+		__field(const char *, name)
+		__field(u32, err)
+		__field(u32, pid)
+		__field(u32, tid)
+		__field(u32, to_pid)
+		__field(u32, to_tid)
+		__field(u32, reply)
+		__field(u32, flags)
+		__field(u32, code)
+		__field(binder_size_t, data_size)
+	),
+	TP_fast_assign(
+		__entry->name = name;
+		__entry->err = err;
+		__entry->pid = pid;
+		__entry->tid = tid;
+		__entry->to_pid = to_pid;
+		__entry->to_tid = to_tid;
+		__entry->reply = reply;
+		__entry->flags = tr->flags;
+		__entry->code = tr->code;
+		__entry->data_size = tr->data_size;
+	),
+	TP_printk("%s: %d %d:%d -> %d:%d %s flags=0x08%x code=%d %llu",
+		  __entry->name, __entry->err, __entry->pid, __entry->tid,
+		  __entry->to_pid, __entry->to_tid,
+		  __entry->reply ? "reply" : "",
+		  __entry->flags, __entry->code, __entry->data_size)
+);
+
 #endif /* _BINDER_TRACE_H */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index ad1fa7abc323..bc6bae76ccaf 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -207,6 +207,8 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
 	fsnotify_create(root->d_inode, dentry);
 	inode_unlock(d_inode(root));
 
+	binder_add_device(device);
+
 	return 0;
 
 err:
diff --git a/include/uapi/linux/android/binder_genl.h b/include/uapi/linux/android/binder_genl.h
new file mode 100644
index 000000000000..f39b5c81e477
--- /dev/null
+++ b/include/uapi/linux/android/binder_genl.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/binder_genl.yaml */
+/* YNL-GEN uapi header */
+
+#ifndef _UAPI_LINUX_ANDROID_BINDER_GENL_H
+#define _UAPI_LINUX_ANDROID_BINDER_GENL_H
+
+#define BINDER_GENL_FAMILY_NAME		"binder_genl"
+#define BINDER_GENL_FAMILY_VERSION	1
+
+/*
+ * Define what kind of binder transactions should be reported.
+ */
+enum binder_genl_flag {
+	BINDER_GENL_FLAG_FAILED = 1,
+	BINDER_GENL_FLAG_DELAYED = 2,
+	BINDER_GENL_FLAG_SPAM = 4,
+	BINDER_GENL_FLAG_OVERRIDE = 8,
+};
+
+enum {
+	BINDER_GENL_A_CMD_CONTEXT = 1,
+	BINDER_GENL_A_CMD_PID,
+	BINDER_GENL_A_CMD_FLAGS,
+
+	__BINDER_GENL_A_CMD_MAX,
+	BINDER_GENL_A_CMD_MAX = (__BINDER_GENL_A_CMD_MAX - 1)
+};
+
+enum {
+	BINDER_GENL_A_REPORT_CONTEXT = 1,
+	BINDER_GENL_A_REPORT_ERR,
+	BINDER_GENL_A_REPORT_FROM_PID,
+	BINDER_GENL_A_REPORT_FROM_TID,
+	BINDER_GENL_A_REPORT_TO_PID,
+	BINDER_GENL_A_REPORT_TO_TID,
+	BINDER_GENL_A_REPORT_REPLY,
+	BINDER_GENL_A_REPORT_FLAGS,
+	BINDER_GENL_A_REPORT_CODE,
+	BINDER_GENL_A_REPORT_DATA_SIZE,
+
+	__BINDER_GENL_A_REPORT_MAX,
+	BINDER_GENL_A_REPORT_MAX = (__BINDER_GENL_A_REPORT_MAX - 1)
+};
+
+enum {
+	BINDER_GENL_CMD_SET = 1,
+	BINDER_GENL_CMD_REPORT,
+
+	__BINDER_GENL_CMD_MAX,
+	BINDER_GENL_CMD_MAX = (__BINDER_GENL_CMD_MAX - 1)
+};
+
+#endif /* _UAPI_LINUX_ANDROID_BINDER_GENL_H */
-- 
2.47.0.338.g60cca15819-goog


