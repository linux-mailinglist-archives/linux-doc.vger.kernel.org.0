Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D46F19A753
	for <lists+linux-doc@lfdr.de>; Wed,  1 Apr 2020 10:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDAIbq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Apr 2020 04:31:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55252 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgDAIbq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Apr 2020 04:31:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 2DEA2296726
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org, pmladek@suse.com
Cc:     kernel@collabora.com,
        =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Subject: [PATCH] docs: pr_*() kerneldocs and basic printk docs
Date:   Wed,  1 Apr 2020 10:31:21 +0200
Message-Id: <20200401083121.20961-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add kerneldocs comments to the pr_*() macros in printk.h.

Add a new rst node in the core-api manual describing the basic usage of
printk and the related macro aliases.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
Hi,

I'm taking over this task which my colleague André Almeida proposed a
while ago: https://patchwork.kernel.org/patch/11145385/

I created kerneldoc comments for all the pr_*() macros and a new rst
node for printk basics in the core-api linking to them. The printk
documentation I added is targeted at newcomers and simply covers the
usage of printk et al from a functional perspective.

Initially I thought about having all the printk-related docs in one
single node in the core-api, but I think having the basics of printk in
a separate node works better as a first draft, and there's also the
chance to grow this file further with more specific information,
examples and use cases if needed.

Best,
Ricardo

 Documentation/core-api/index.rst          |   1 +
 Documentation/core-api/printk-basics.rst  | 141 ++++++++++++++++++++++
 Documentation/core-api/printk-formats.rst |   2 +
 include/linux/printk.h                    | 102 ++++++++++++++--
 4 files changed, 234 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/core-api/printk-basics.rst

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 0897ad12c119..49e3da910d9e 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -18,6 +18,7 @@ it.
 
    kernel-api
    workqueue
+   printk-basics
    printk-formats
    symbol-namespaces
 
diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-api/printk-basics.rst
new file mode 100644
index 000000000000..fbc6745503ec
--- /dev/null
+++ b/Documentation/core-api/printk-basics.rst
@@ -0,0 +1,141 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+Message logging with printk
+===========================
+
+printk() is one of the most widely known functions in the Linux kernel. It's the
+standard tool we have for printing messages and usually the most basic way of
+tracing and debugging. If you're familiar with printf(3) you can tell printk()
+is based on it, although it has two functional differences:
+
+  - printk() messages can specify a log level
+  - the format string has some extensions over C99 (see :ref:`How to get printk
+    format specifiers right <printk-specifiers>`)
+
+All printk() messages are printed to the kernel log buffer, which is a ring
+buffer exported to userspace through /dev/kmsg. The usual way to read it is
+using ``dmesg``.
+
+printk() is typically used like this::
+
+  printk(KERN_INFO "Message: %s\n", arg);
+
+where ``KERN_INFO`` is the log level (note that it's concatenated to the format
+string, the log level is not a separate argument). The available log levels are:
+
++----------------+--------+-----------------------------------------------+
+| Name           | String |  Alias function                               |
++================+========+===============================================+
+| KERN_EMERG     | "0"    | pr_emerg()                                    |
++----------------+--------+-----------------------------------------------+
+| KERN_ALERT     | "1"    | pr_alert()                                    |
++----------------+--------+-----------------------------------------------+
+| KERN_CRIT      | "2"    | pr_crit()                                     |
++----------------+--------+-----------------------------------------------+
+| KERN_ERR       | "3"    | pr_err()                                      |
++----------------+--------+-----------------------------------------------+
+| KERN_WARNING   | "4"    | pr_warn()                                     |
++----------------+--------+-----------------------------------------------+
+| KERN_NOTICE    | "5"    | pr_notice()                                   |
++----------------+--------+-----------------------------------------------+
+| KERN_INFO      | "6"    | pr_info()                                     |
++----------------+--------+-----------------------------------------------+
+| KERN_DEBUG     | "7"    | pr_debug() and pr_devel() if DEBUG is defined |
++----------------+--------+-----------------------------------------------+
+| KERN_DEFAULT   | ""     |                                               |
++----------------+--------+-----------------------------------------------+
+| KERN_CONT      | "c"    | pr_cont()                                     |
++----------------+--------+-----------------------------------------------+
+
+
+The log level determines the importance of a message. The kernel decides whether
+to show the message immediately (printing it to the current console) depending
+on its log level and the current *console_loglevel* (a kernel variable). If the
+message priority is higher (lower log level value) than the *console_loglevel*
+the message will be printed to the console.
+
+If the log level is omitted, the message is printed with ``KERN_DEFAULT``
+level.
+
+You can check the current *console_loglevel* with::
+
+  $ cat /proc/sys/kernel/printk
+  4        4        1        7
+
+The result shows the *current*, *default*, *minimum* and *boot-time-default* log
+levels.
+
+To change the current console_loglevel simply write the the desired level to
+``/proc/sys/kernel/printk``. For example, to print all messages to the console::
+
+  # echo 8 > /proc/sys/kernel/printk
+
+Another way, using ``dmesg``::
+
+  # dmesg -n 5
+
+would set the console_loglevel to print KERN_WARNING (4) or more severe messages
+to console. See ``dmesg(1)`` for more information.
+
+As an alternative to printk() you can use the ``pr_*()`` aliases for
+logging. This family of macros embed the log level in the macro names. For
+example::
+
+  pr_info("Info message no. %d\n", msg_num);
+
+would print a ``KERN_INFO`` message.
+
+Besides being more concise than the equivalent printk() calls, they can use a
+common definition for the format string through the pr_fmt() macro. For
+instance, defining this at the top of a source file (before any ``#include``
+directive)::
+
+  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
+
+would prefix every pr_*() message in that file with the module and function name
+that originated the message.
+
+For debugging purposes there are also two conditionally-compiled macros:
+pr_debug() and pr_devel(), which are compiled-out unless ``DEBUG`` (or
+also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.
+
+
+Function reference
+==================
+
+.. kernel-doc:: kernel/printk/printk.c
+   :functions: printk
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_emerg
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_alert
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_crit
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_err
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_warn
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_notice
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_info
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_fmt
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_debug
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_devel
+
+.. kernel-doc:: include/linux/printk.h
+   :functions: pr_cont
diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 8ebe46b1af39..1e3838652348 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -2,6 +2,8 @@
 How to get printk format specifiers right
 =========================================
 
+.. _printk-specifiers:
+
 :Author: Randy Dunlap <rdunlap@infradead.org>
 :Author: Andrew Murray <amurray@mpc-data.co.uk>
 
diff --git a/include/linux/printk.h b/include/linux/printk.h
index 1e6108b8d15f..7d2f27d10288 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -284,39 +284,107 @@ static inline void printk_safe_flush_on_panic(void)
 
 extern int kptr_restrict;
 
+/**
+ * pr_fmt - used by the pr_*() macros to generate the printk format string
+ * @fmt: format string passed from a pr_*() macro
+ *
+ * This macro can be used to generate a unified format string for pr_*()
+ * macros. A common use is to prefix all pr_*() messages in a file with a common
+ * string. For example, defining this at the top of a source file:
+ *
+ *        #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+ *
+ * would prefix all pr_info, pr_emerg... messages in the file with the module
+ * name.
+ */
 #ifndef pr_fmt
 #define pr_fmt(fmt) fmt
 #endif
 
-/*
- * These can be used to print at the various log levels.
- * All of these will print unconditionally, although note that pr_debug()
- * and other debug macros are compiled out unless either DEBUG is defined
- * or CONFIG_DYNAMIC_DEBUG is set.
+/**
+ * pr_emerg - Print an emergency-level message
+ * @fmt: format string
+ *
+ * This macro expands to a printk with KERN_EMERG loglevel. It uses pr_fmt() to
+ * generate the format string.
  */
 #define pr_emerg(fmt, ...) \
 	printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
+/**
+ * pr_alert - Print an alert-level message
+ * @fmt: format string
+ *
+ * This macro expands to a printk with KERN_ALERT loglevel. It uses pr_fmt() to
+ * generate the format string.
+ */
 #define pr_alert(fmt, ...) \
 	printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
+/**
+ * pr_crit - Print a critical-level message
+ * @fmt: format string
+ *
+ * This macro expands to a printk with KERN_CRIT loglevel. It uses pr_fmt() to
+ * generate the format string.
+ */
 #define pr_crit(fmt, ...) \
 	printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
+/**
+ * pr_err - Print an error-level message
+ * @fmt: format string
+ *
+ * This macro expands to a printk with KERN_ERR loglevel. It uses pr_fmt() to
+ * generate the format string.
+ */
 #define pr_err(fmt, ...) \
 	printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
+/**
+ * pr_warn - Print a warning-level message
+ * @fmt: format string
+ *
+ * This macro expands to a printk with KERN_WARNING loglevel. It uses pr_fmt()
+ * to generate the format string.
+ */
 #define pr_warn(fmt, ...) \
 	printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
+/**
+ * pr_notice - Print a notice-level message
+ * @fmt: format string
+ *
+ * This macro expands to a printk with KERN_NOTICE loglevel. It uses pr_fmt() to
+ * generate the format string.
+ */
 #define pr_notice(fmt, ...) \
 	printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
+/**
+ * pr_info - Print an info-level message
+ * @fmt: format string
+ *
+ * This macro expands to a printk with KERN_INFO loglevel. It uses pr_fmt() to
+ * generate the format string.
+ */
 #define pr_info(fmt, ...) \
 	printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
-/*
- * Like KERN_CONT, pr_cont() should only be used when continuing
- * a line with no newline ('\n') enclosed. Otherwise it defaults
- * back to KERN_DEFAULT.
+
+/**
+ * pr_cont - Continues a previous log message in the same line.
+ * @fmt: format string
+ *
+ * This macro expands to a printk with KERN_CONT loglevel. It should only be
+ * used when continuing a log message with no newline ('\n') enclosed. Otherwise
+ * it defaults back to KERN_DEFAULT loglevel.
  */
 #define pr_cont(fmt, ...) \
 	printk(KERN_CONT fmt, ##__VA_ARGS__)
 
-/* pr_devel() should produce zero code unless DEBUG is defined */
+/**
+ * pr_devel - Print a debug-level message conditionally
+ * @fmt: format string
+ *
+ * This macro expands to a printk with KERN_DEBUG loglevel if DEBUG is
+ * defined. Otherwise it does nothing.
+ *
+ * It uses pr_fmt() to generate the format string.
+ */
 #ifdef DEBUG
 #define pr_devel(fmt, ...) \
 	printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
@@ -330,8 +398,18 @@ extern int kptr_restrict;
 #if defined(CONFIG_DYNAMIC_DEBUG)
 #include <linux/dynamic_debug.h>
 
-/* dynamic_pr_debug() uses pr_fmt() internally so we don't need it here */
-#define pr_debug(fmt, ...) \
+/**
+ * pr_debug - Print a debug-level message conditionally
+ * @fmt: format string
+ *
+ * This macro expands to dynamic_pr_debug() if CONFIG_DYNAMIC_DEBUG is
+ * set. Otherwise, if DEBUG is defined, it's equivalent to a printk with
+ * KERN_DEBUG loglevel. If DEBUG is not defined it does nothing.
+ *
+ * It uses pr_fmt() to generate the format string (dynamic_pr_debug() uses
+ * pr_fmt() internally).
+ */
+#define pr_debug(fmt, ...)			\
 	dynamic_pr_debug(fmt, ##__VA_ARGS__)
 #elif defined(DEBUG)
 #define pr_debug(fmt, ...) \
-- 
2.18.0

