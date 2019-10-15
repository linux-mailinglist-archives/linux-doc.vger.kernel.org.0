Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A208D7F93
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2019 21:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730729AbfJOTHN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Oct 2019 15:07:13 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:32934 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729457AbfJOTHM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 15:07:12 -0400
Received: by mail-ed1-f65.google.com with SMTP id c4so19088524edl.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 12:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I4IK030oFmsCmygErTaT3MgQ9pOoIszRkO6VB4j4UOY=;
        b=R+qTya5eG5tiSbZCsUVN6ZqoRR0qGQSr8Sge+JOl3WzHcv1StJ/UeYrR2bcppYZxU+
         CFg9vDTb+OKho9vnUt0a9dvw6yeOm3EovhyiACBm8QoKKzOb6AXjiMaBXht+0e3GIE/Y
         tllDnXi5MqNdzc8dxcEZH7NVLyY3+vLBKxOGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4IK030oFmsCmygErTaT3MgQ9pOoIszRkO6VB4j4UOY=;
        b=GYTRbGDBeCQLygcOhEBQVKKXPBUZUBRvSaOr4jT0ugpWbfVFpjP1SQ1bcmEtANFvon
         u0gu6xMg7YeEjUEQI8Zorjk+NmYovaySpLOtWz92kJB9LON18LGuPF5IjE3tBQwS688r
         /BA8uSKS5WpUCBioSPr5+59Z5WLAYqpAXcHf/lrlIgcWxdRPBT24D4aUx8TbEEJhN7gU
         46oGwWGLyWyXFp5Kk+SHXlykdd57qblZPbbPI9Mga4BfLuAWGCZrLajkl3saIRB7NtH5
         jAsTfqqB0gt3/lQ3fzL7gHcczs0ceCCvXd51BBz/8mFNx35cWc8xdFbQxcjEdiLg2lA1
         FSUA==
X-Gm-Message-State: APjAAAUEu5R/GEmODOX9OyT1qvEmWFHo2PBMS6NYPgZOdgXBi1jY/9h/
        IOs89stQdyK/lM9LulECrSsOKw==
X-Google-Smtp-Source: APXvYqzbADk1moMAsP6esHu4N/sWpehIxcS92mBrGTVhPTH5gRxXi4mJrKZnzOJJgA/Jo2m4QiOS3A==
X-Received: by 2002:aa7:cd43:: with SMTP id v3mr34519514edw.235.1571166430028;
        Tue, 15 Oct 2019 12:07:10 -0700 (PDT)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk. [5.186.115.54])
        by smtp.gmail.com with ESMTPSA id dt4sm2836888ejb.45.2019.10.15.12.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 12:07:09 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     Joe Perches <joe@perches.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org
Subject: [PATCH v5] printf: add support for printing symbolic error names
Date:   Tue, 15 Oct 2019 21:07:05 +0200
Message-Id: <20191015190706.15989-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011133617.9963-1-linux@rasmusvillemoes.dk>
References: <20191011133617.9963-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It has been suggested several times to extend vsnprintf() to be able
to convert the numeric value of ENOSPC to print "ENOSPC". This
implements that as a %p extension: With %pe, one can do

  if (IS_ERR(foo)) {
    pr_err("Sorry, can't do that: %pe\n", foo);
    return PTR_ERR(foo);
  }

instead of what is seen in quite a few places in the kernel:

  if (IS_ERR(foo)) {
    pr_err("Sorry, can't do that: %ld\n", PTR_ERR(foo));
    return PTR_ERR(foo);
  }

If the value passed to %pe is an ERR_PTR, but the library function
errname() added here doesn't know about the value, the value is simply
printed in decimal. If the value passed to %pe is not an ERR_PTR, we
treat it as an ordinary %p and thus print the hashed value (passing
non-ERR_PTR values to %pe indicates a bug in the caller, but we can't
do much about that).

With my embedded hat on, and because it's not very invasive to do,
I've made it possible to remove this. The errname() function and
associated lookup tables take up about 3K. For most, that's probably
quite acceptable and a price worth paying for more readable
dmesg (once this starts getting used), while for those that disable
printk() it's of very little use - I don't see a
procfs/sysfs/seq_printf() file reasonably making use of this - and
they clearly want to squeeze vmlinux as much as possible. Hence the
default y if PRINTK.

The symbols to include have been found by massaging the output of

  find arch include -iname 'errno*.h' | xargs grep -E 'define\s*E'

In the cases where some common aliasing exists
(e.g. EAGAIN=EWOULDBLOCK on all platforms, EDEADLOCK=EDEADLK on most),
I've moved the more popular one (in terms of 'git grep -w Efoo | wc)
to the bottom so that one takes precedence.

Acked-by: Uwe Kleine-König <uwe@kleine-koenig.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
Found a few more things, so sending new revision anyway.

v5: Fix cosmetic issues per Petr. Fix missing "-" in "EDQUOT". Fix a
few comments on at the end of the names_0 array. Add A-b Uwe, R-b Petr.

 Documentation/core-api/printk-formats.rst |  12 ++
 include/linux/errname.h                   |  16 ++
 lib/Kconfig.debug                         |   9 +
 lib/Makefile                              |   1 +
 lib/errname.c                             | 223 ++++++++++++++++++++++
 lib/test_printf.c                         |  21 ++
 lib/vsprintf.c                            |  27 +++
 7 files changed, 309 insertions(+)
 create mode 100644 include/linux/errname.h
 create mode 100644 lib/errname.c

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index ecbebf4ca8e7..050f34f3a70f 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -79,6 +79,18 @@ has the added benefit of providing a unique identifier. On 64-bit machines
 the first 32 bits are zeroed. The kernel will print ``(ptrval)`` until it
 gathers enough entropy. If you *really* want the address see %px below.
 
+Error Pointers
+--------------
+
+::
+
+	%pe	-ENOSPC
+
+For printing error pointers (i.e. a pointer for which IS_ERR() is true)
+as a symbolic error name. Error values for which no symbolic name is
+known are printed in decimal, while a non-ERR_PTR passed as the
+argument to %pe gets treated as ordinary %p.
+
 Symbols/Function Pointers
 -------------------------
 
diff --git a/include/linux/errname.h b/include/linux/errname.h
new file mode 100644
index 000000000000..e8576ad90cb7
--- /dev/null
+++ b/include/linux/errname.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_ERRNAME_H
+#define _LINUX_ERRNAME_H
+
+#include <linux/stddef.h>
+
+#ifdef CONFIG_SYMBOLIC_ERRNAME
+const char *errname(int err);
+#else
+static inline const char *errname(int err)
+{
+	return NULL;
+}
+#endif
+
+#endif /* _LINUX_ERRNAME_H */
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 93d97f9b0157..99a6cf677140 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -164,6 +164,15 @@ config DYNAMIC_DEBUG
 	  See Documentation/admin-guide/dynamic-debug-howto.rst for additional
 	  information.
 
+config SYMBOLIC_ERRNAME
+	bool "Support symbolic error names in printf"
+	default y if PRINTK
+	help
+	  If you say Y here, the kernel's printf implementation will
+	  be able to print symbolic error names such as ENOSPC instead
+	  of the number 28. It makes the kernel image slightly larger
+	  (about 3KB), but can make the kernel logs easier to read.
+
 endmenu # "printk and dmesg options"
 
 menu "Compile-time checks and compiler options"
diff --git a/lib/Makefile b/lib/Makefile
index c5892807e06f..d740534057ed 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -181,6 +181,7 @@ lib-$(CONFIG_GENERIC_BUG) += bug.o
 obj-$(CONFIG_HAVE_ARCH_TRACEHOOK) += syscall.o
 
 obj-$(CONFIG_DYNAMIC_DEBUG) += dynamic_debug.o
+obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
 
 obj-$(CONFIG_NLATTR) += nlattr.o
 
diff --git a/lib/errname.c b/lib/errname.c
new file mode 100644
index 000000000000..b67f58e29729
--- /dev/null
+++ b/lib/errname.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/build_bug.h>
+#include <linux/errno.h>
+#include <linux/errname.h>
+#include <linux/kernel.h>
+
+/*
+ * Ensure these tables do not accidentally become gigantic if some
+ * huge errno makes it in. On most architectures, the first table will
+ * only have about 140 entries, but mips and parisc have more sparsely
+ * allocated errnos (with EHWPOISON = 257 on parisc, and EDQUOT = 1133
+ * on mips), so this wastes a bit of space on those - though we
+ * special case the EDQUOT case.
+ */
+#define E(err) [err + BUILD_BUG_ON_ZERO(err <= 0 || err > 300)] = "-" #err
+static const char *names_0[] = {
+	E(E2BIG),
+	E(EACCES),
+	E(EADDRINUSE),
+	E(EADDRNOTAVAIL),
+	E(EADV),
+	E(EAFNOSUPPORT),
+	E(EALREADY),
+	E(EBADE),
+	E(EBADF),
+	E(EBADFD),
+	E(EBADMSG),
+	E(EBADR),
+	E(EBADRQC),
+	E(EBADSLT),
+	E(EBFONT),
+	E(EBUSY),
+#ifdef ECANCELLED
+	E(ECANCELLED),
+#endif
+	E(ECHILD),
+	E(ECHRNG),
+	E(ECOMM),
+	E(ECONNABORTED),
+	E(ECONNRESET),
+	E(EDEADLOCK),
+	E(EDESTADDRREQ),
+	E(EDOM),
+	E(EDOTDOT),
+#ifndef CONFIG_MIPS
+	E(EDQUOT),
+#endif
+	E(EEXIST),
+	E(EFAULT),
+	E(EFBIG),
+	E(EHOSTDOWN),
+	E(EHOSTUNREACH),
+	E(EHWPOISON),
+	E(EIDRM),
+	E(EILSEQ),
+#ifdef EINIT
+	E(EINIT),
+#endif
+	E(EINPROGRESS),
+	E(EINTR),
+	E(EINVAL),
+	E(EIO),
+	E(EISCONN),
+	E(EISDIR),
+	E(EISNAM),
+	E(EKEYEXPIRED),
+	E(EKEYREJECTED),
+	E(EKEYREVOKED),
+	E(EL2HLT),
+	E(EL2NSYNC),
+	E(EL3HLT),
+	E(EL3RST),
+	E(ELIBACC),
+	E(ELIBBAD),
+	E(ELIBEXEC),
+	E(ELIBMAX),
+	E(ELIBSCN),
+	E(ELNRNG),
+	E(ELOOP),
+	E(EMEDIUMTYPE),
+	E(EMFILE),
+	E(EMLINK),
+	E(EMSGSIZE),
+	E(EMULTIHOP),
+	E(ENAMETOOLONG),
+	E(ENAVAIL),
+	E(ENETDOWN),
+	E(ENETRESET),
+	E(ENETUNREACH),
+	E(ENFILE),
+	E(ENOANO),
+	E(ENOBUFS),
+	E(ENOCSI),
+	E(ENODATA),
+	E(ENODEV),
+	E(ENOENT),
+	E(ENOEXEC),
+	E(ENOKEY),
+	E(ENOLCK),
+	E(ENOLINK),
+	E(ENOMEDIUM),
+	E(ENOMEM),
+	E(ENOMSG),
+	E(ENONET),
+	E(ENOPKG),
+	E(ENOPROTOOPT),
+	E(ENOSPC),
+	E(ENOSR),
+	E(ENOSTR),
+#ifdef ENOSYM
+	E(ENOSYM),
+#endif
+	E(ENOSYS),
+	E(ENOTBLK),
+	E(ENOTCONN),
+	E(ENOTDIR),
+	E(ENOTEMPTY),
+	E(ENOTNAM),
+	E(ENOTRECOVERABLE),
+	E(ENOTSOCK),
+	E(ENOTTY),
+	E(ENOTUNIQ),
+	E(ENXIO),
+	E(EOPNOTSUPP),
+	E(EOVERFLOW),
+	E(EOWNERDEAD),
+	E(EPERM),
+	E(EPFNOSUPPORT),
+	E(EPIPE),
+#ifdef EPROCLIM
+	E(EPROCLIM),
+#endif
+	E(EPROTO),
+	E(EPROTONOSUPPORT),
+	E(EPROTOTYPE),
+	E(ERANGE),
+	E(EREMCHG),
+#ifdef EREMDEV
+	E(EREMDEV),
+#endif
+	E(EREMOTE),
+	E(EREMOTEIO),
+#ifdef EREMOTERELEASE
+	E(EREMOTERELEASE),
+#endif
+	E(ERESTART),
+	E(ERFKILL),
+	E(EROFS),
+#ifdef ERREMOTE
+	E(ERREMOTE),
+#endif
+	E(ESHUTDOWN),
+	E(ESOCKTNOSUPPORT),
+	E(ESPIPE),
+	E(ESRCH),
+	E(ESRMNT),
+	E(ESTALE),
+	E(ESTRPIPE),
+	E(ETIME),
+	E(ETIMEDOUT),
+	E(ETOOMANYREFS),
+	E(ETXTBSY),
+	E(EUCLEAN),
+	E(EUNATCH),
+	E(EUSERS),
+	E(EXDEV),
+	E(EXFULL),
+
+	E(ECANCELED), /* ECANCELLED */
+	E(EAGAIN), /* EWOULDBLOCK */
+	E(ECONNREFUSED), /* EREFUSED */
+	E(EDEADLK), /* EDEADLOCK */
+};
+#undef E
+
+#define E(err) [err - 512 + BUILD_BUG_ON_ZERO(err < 512 || err > 550)] = "-" #err
+static const char *names_512[] = {
+	E(ERESTARTSYS),
+	E(ERESTARTNOINTR),
+	E(ERESTARTNOHAND),
+	E(ENOIOCTLCMD),
+	E(ERESTART_RESTARTBLOCK),
+	E(EPROBE_DEFER),
+	E(EOPENSTALE),
+	E(ENOPARAM),
+
+	E(EBADHANDLE),
+	E(ENOTSYNC),
+	E(EBADCOOKIE),
+	E(ENOTSUPP),
+	E(ETOOSMALL),
+	E(ESERVERFAULT),
+	E(EBADTYPE),
+	E(EJUKEBOX),
+	E(EIOCBQUEUED),
+	E(ERECALLCONFLICT),
+};
+#undef E
+
+static const char *__errname(unsigned err)
+{
+	if (err < ARRAY_SIZE(names_0))
+		return names_0[err];
+	if (err >= 512 && err - 512 < ARRAY_SIZE(names_512))
+		return names_512[err - 512];
+	/* But why? */
+	if (IS_ENABLED(CONFIG_MIPS) && err == EDQUOT) /* 1133 */
+		return "-EDQUOT";
+	return NULL;
+}
+
+/*
+ * errname(EIO) -> "EIO"
+ * errname(-EIO) -> "-EIO"
+ */
+const char *errname(int err)
+{
+	const char *name = __errname(err > 0 ? err : -err);
+	if (!name)
+		return NULL;
+
+	return err > 0 ? name + 1 : name;
+}
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 5d94cbff2120..030daeb4fe21 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -593,6 +593,26 @@ flags(void)
 	kfree(cmp_buffer);
 }
 
+static void __init
+errptr(void)
+{
+	test("-1234", "%pe", ERR_PTR(-1234));
+
+	/* Check that %pe with a non-ERR_PTR gets treated as ordinary %p. */
+	BUILD_BUG_ON(IS_ERR(PTR));
+	test_hashed("%pe", PTR);
+
+#ifdef CONFIG_SYMBOLIC_ERRNAME
+	test("(-ENOTSOCK)", "(%pe)", ERR_PTR(-ENOTSOCK));
+	test("(-EAGAIN)", "(%pe)", ERR_PTR(-EAGAIN));
+	BUILD_BUG_ON(EAGAIN != EWOULDBLOCK);
+	test("(-EAGAIN)", "(%pe)", ERR_PTR(-EWOULDBLOCK));
+	test("[-EIO    ]", "[%-8pe]", ERR_PTR(-EIO));
+	test("[    -EIO]", "[%8pe]", ERR_PTR(-EIO));
+	test("-EPROBE_DEFER", "%pe", ERR_PTR(-EPROBE_DEFER));
+#endif
+}
+
 static void __init
 test_pointer(void)
 {
@@ -615,6 +635,7 @@ test_pointer(void)
 	bitmap();
 	netdev_features();
 	flags();
+	errptr();
 }
 
 static void __init selftest(void)
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index e78017a3e1bd..b54d252b398e 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -21,6 +21,7 @@
 #include <linux/build_bug.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/errname.h>
 #include <linux/module.h>	/* for KSYM_SYMBOL_LEN */
 #include <linux/types.h>
 #include <linux/string.h>
@@ -613,6 +614,25 @@ static char *string_nocheck(char *buf, char *end, const char *s,
 	return widen_string(buf, len, end, spec);
 }
 
+static char *err_ptr(char *buf, char *end, void *ptr,
+		     struct printf_spec spec)
+{
+	int err = PTR_ERR(ptr);
+	const char *sym = errname(err);
+
+	if (sym)
+		return string_nocheck(buf, end, sym, spec);
+
+	/*
+	 * Somebody passed ERR_PTR(-1234) or some other non-existing
+	 * Efoo - or perhaps CONFIG_SYMBOLIC_ERRNAME=n. Fall back to
+	 * printing it as its decimal representation.
+	 */
+	spec.flags |= SIGN;
+	spec.base = 10;
+	return number(buf, end, err, spec);
+}
+
 /* Be careful: error messages must fit into the given buffer. */
 static char *error_string(char *buf, char *end, const char *s,
 			  struct printf_spec spec)
@@ -2187,6 +2207,11 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		return kobject_string(buf, end, ptr, spec, fmt);
 	case 'x':
 		return pointer_string(buf, end, ptr, spec);
+	case 'e':
+		/* %pe with a non-ERR_PTR gets treated as plain %p */
+		if (!IS_ERR(ptr))
+			break;
+		return err_ptr(buf, end, ptr, spec);
 	}
 
 	/* default is to _not_ leak addresses, hash before printing */
@@ -2823,6 +2848,7 @@ int vbin_printf(u32 *bin_buf, size_t size, const char *fmt, va_list args)
 			case 'f':
 			case 'x':
 			case 'K':
+			case 'e':
 				save_arg(void *);
 				break;
 			default:
@@ -2999,6 +3025,7 @@ int bstr_printf(char *buf, size_t size, const char *fmt, const u32 *bin_buf)
 			case 'f':
 			case 'x':
 			case 'K':
+			case 'e':
 				process = true;
 				break;
 			default:
-- 
2.20.1

