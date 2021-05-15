Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4558381912
	for <lists+linux-doc@lfdr.de>; Sat, 15 May 2021 15:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhEONZ2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 15 May 2021 09:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhEONZ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 May 2021 09:25:27 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C181C061573;
        Sat, 15 May 2021 06:24:12 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id lj11-20020a17090b344bb029015bc3073608so1179493pjb.3;
        Sat, 15 May 2021 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W4hf3u12PlcZB6Z2XAoOoHVKZLL/o1vJSpAvXe3XWn8=;
        b=DqV/a2ggkCBs+djxtfrI0zTGsy8/sT5/nQmjBmAfJtvbPktBj86tLb4I+9OuK23zJi
         MXYDWYTsoDhfbelOaK9AtUVsDIOQFFFUAxl4VhlAc2H4JEOE9K8l4t/t3LzrAQaGfY1w
         V67m5Srl26orAA+6DNtPFQSmJKIpmOqk0EgEcDwCv4Z4YzojDWA8sn3H+c7Qy6fgaEjt
         fX7i9428j4D9lzZ0G1SUf6TX/LmgcfEdJ6NjI72+Ky9Y/jidHByCEbwm42Co+Qezac6P
         KaMkzVjQ1iLot2jjj8Vgfh2O+gUfPlXpwEznBPOn43R3wNnE/4cLNpErPZndRlWMhrfl
         gjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W4hf3u12PlcZB6Z2XAoOoHVKZLL/o1vJSpAvXe3XWn8=;
        b=H6T91fGEkYuQx4MsM0t6i3bfSepGN09fLSrLtjTrmu3jlp5/nSdk711fwTZcAEUmXS
         Csjau6ChA+jgoa4quPWWWSZAXghtoU2NXwZpQXGGfwBVxdguYQDYd6sSJlPDIa0PwdZt
         KfJw75gdJshS7+rU7QV8VVjIokdSK6tI68KSa1+AlCo4y5wbFpKzXi+VC+d1YLjI4PrR
         /OBi/DHRzRc7r9+d8mutlUlakmjxbyW5IM3c6eZPl2XMbxwoUbQPGx5pWG9FEwvlavR2
         IUvIEWk6M+tovEH7NdR9/Qyr6YL2Lbr6Xe7hL6d9p9iIOLHVVrXgGVgQOuV/uf9mIboT
         jdMQ==
X-Gm-Message-State: AOAM530illxiWxjxg0bm3SIJK9OpCWvrVD++PiCE5ZDBl8J7zYsA/IYB
        Ud7sFncoDnke+UJyMH79/awWsrKYE9CheAIK
X-Google-Smtp-Source: ABdhPJxMT8S0/fopgM38KMaZb5F62pjy0YV96qMkUJFD4Adh3Hg2RgKE6BT+4S/1PrxR6dJVdyJBWA==
X-Received: by 2002:a17:902:b7ca:b029:f0:b0ea:db44 with SMTP id v10-20020a170902b7cab02900f0b0eadb44mr4874287plz.59.1621085051720;
        Sat, 15 May 2021 06:24:11 -0700 (PDT)
Received: from localhost.localdomain ([49.37.7.11])
        by smtp.gmail.com with ESMTPSA id y64sm5969937pfy.204.2021.05.15.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 06:24:11 -0700 (PDT)
From:   Dwaipayan Ray <dwaipayanray1@gmail.com>
To:     corbet@lwn.net, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
        linux-doc@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [PATCH] docs: Add more message type documentations for checkpatch
Date:   Sat, 15 May 2021 18:53:48 +0530
Message-Id: <20210515132348.19082-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Document a couple of more checkpatch message types.
- Add a blank line before all `See:` lines to improve the
  rst output.
- Create a new subsection `Permissions` and move a few types
  to it.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 170 ++++++++++++++++++++++++-
 1 file changed, 163 insertions(+), 7 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 51fed1bd72ec..e409f27f48b6 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -246,6 +246,7 @@ Allocation style
     The first argument for kcalloc or kmalloc_array should be the
     number of elements.  sizeof() as the first argument is generally
     wrong.
+
     See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
 
   **ALLOC_SIZEOF_STRUCT**
@@ -264,6 +265,7 @@ Allocation style
   **ALLOC_WITH_MULTIPLY**
     Prefer kmalloc_array/kcalloc over kmalloc/kzalloc with a
     sizeof multiply.
+
     See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
 
 
@@ -284,6 +286,7 @@ API usage
     BUG() or BUG_ON() should be avoided totally.
     Use WARN() and WARN_ON() instead, and handle the "impossible"
     error condition as gracefully as possible.
+
     See: https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on
 
   **CONSIDER_KSTRTO**
@@ -292,12 +295,23 @@ API usage
     may lead to unexpected results in callers.  The respective kstrtol(),
     kstrtoll(), kstrtoul(), and kstrtoull() functions tend to be the
     correct replacements.
+
     See: https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
 
+  **IN_ATOMIC**
+    in_atomic() is not for driver use so any such use is reported as an ERROR.
+    Also in_atomic() is often used to determine if we may sleep, but it is not
+    reliable in this use model therefore its use is strongly discouraged.
+
+    However, in_atomic() is ok for core kernel use.
+
+    See: https://lore.kernel.org/lkml/20080320201723.b87b3732.akpm@linux-foundation.org/
+
   **LOCKDEP**
     The lockdep_no_validate class was added as a temporary measure to
     prevent warnings on conversion of device->sem to device->mutex.
     It should not be used for any other purpose.
+
     See: https://lore.kernel.org/lkml/1268959062.9440.467.camel@laptop/
 
   **MALFORMED_INCLUDE**
@@ -308,11 +322,18 @@ API usage
   **USE_LOCKDEP**
     lockdep_assert_held() annotations should be preferred over
     assertions based on spin_is_locked()
+
     See: https://www.kernel.org/doc/html/latest/locking/lockdep-design.html#annotations
 
   **UAPI_INCLUDE**
     No #include statements in include/uapi should use a uapi/ path.
 
+  **USLEEP_RANGE**
+    usleep_range() should be preferred over udelay(). The proper way of
+    using usleep_range() is mentioned in the kernel docs.
+
+    See: https://www.kernel.org/doc/html/latest/timers/timers-howto.html#delays-information-on-the-various-kernel-delay-sleep-mechanisms
+
 
 Comment style
 -------------
@@ -338,6 +359,7 @@ Comment style
   **C99_COMMENTS**
     C99 style single line comments (//) should not be used.
     Prefer the block comment style instead.
+
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
 
 
@@ -347,6 +369,7 @@ Commit message
   **BAD_SIGN_OFF**
     The signed-off-by line does not fall in line with the standards
     specified by the community.
+
     See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
 
   **BAD_STABLE_ADDRESS_STYLE**
@@ -368,12 +391,26 @@ Commit message
   **COMMIT_MESSAGE**
     The patch is missing a commit description.  A brief
     description of the changes made by the patch should be added.
+
     See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
 
+  **FROM_SIGN_OFF_MISMATCH**
+    The author's email does not match with that in the Signed-off-by:
+    line(s). This can be sometimes caused due to an improperly configured
+    email client.
+
+    This message is emitted due to any of the following reasons::
+
+      - The email names do not match.
+      - The email addresses do not match.
+      - The email subaddresses do not match.
+      - The email comments do not match.
+
   **MISSING_SIGN_OFF**
     The patch is missing a Signed-off-by line.  A signed-off-by
     line should be added according to Developer's certificate of
     Origin.
+
     See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
 
   **NO_AUTHOR_SIGN_OFF**
@@ -382,6 +419,7 @@ Commit message
     end of explanation of the patch to denote that the author has
     written it or otherwise has the rights to pass it on as an open
     source patch.
+
     See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
 
   **DIFF_IN_COMMIT_MSG**
@@ -389,6 +427,7 @@ Commit message
     This causes problems when one tries to apply a file containing both
     the changelog and the diff because patch(1) tries to apply the diff
     which it found in the changelog.
+
     See: https://lore.kernel.org/lkml/20150611134006.9df79a893e3636019ad2759e@linux-foundation.org/
 
   **GERRIT_CHANGE_ID**
@@ -431,6 +470,7 @@ Comparison style
   **BOOL_COMPARISON**
     Comparisons of A to true and false are better written
     as A and !A.
+
     See: https://lore.kernel.org/lkml/1365563834.27174.12.camel@joe-AO722/
 
   **COMPARISON_TO_NULL**
@@ -492,6 +532,7 @@ Macros, Attributes and Symbols
     The kernel does *not* use the ``__DATE__`` and ``__TIME__`` macros,
     and enables warnings if they are used as they can lead to
     non-deterministic builds.
+
     See: https://www.kernel.org/doc/html/latest/kbuild/reproducible-builds.html#timestamps
 
   **DEFINE_ARCH_HAS**
@@ -502,6 +543,7 @@ Macros, Attributes and Symbols
     want architectures able to override them with optimized ones, we
     should either use weak functions (appropriate for some cases), or
     the symbol that protects them should be the same symbol we use.
+
     See: https://lore.kernel.org/lkml/CA+55aFycQ9XJvEOsiM3txHL5bjUc8CeKWJNR_H+MiicaddB42Q@mail.gmail.com/
 
   **INIT_ATTRIBUTE**
@@ -528,6 +570,20 @@ Macros, Attributes and Symbols
               ...
       }
 
+  **MISPLACED_INIT**
+    It is possible to use section markers on variables in a way
+    which gcc doesn't understand (or at least not the way the
+    developer intended)::
+
+      static struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
+
+    does not put exynos4_plls in the .initdata section. The __initdata
+    marker can be virtually anywhere on the line, except right after
+    "struct". The preferred location is before the "=" sign if there is
+    one, or before the trailing ";" otherwise.
+
+    See: https://lore.kernel.org/lkml/1377655732.3619.19.camel@joe-AO722/
+
   **MULTISTATEMENT_MACRO_USE_DO_WHILE**
     Macros with multiple statements should be enclosed in a
     do - while block.  Same should also be the case for macros
@@ -541,6 +597,10 @@ Macros, Attributes and Symbols
 
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#macros-enums-and-rtl
 
+  **PREFER_FALLTHROUGH**
+    Use the `fallthrough;` pseudo keyword instead of
+    `/* fallthrough */` like comments.
+
   **WEAK_DECLARATION**
     Using weak declarations like __attribute__((weak)) or __weak
     can have unintended link defects.  Avoid using them.
@@ -551,6 +611,7 @@ Functions and Variables
 
   **CAMELCASE**
     Avoid CamelCase Identifiers.
+
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#naming
 
   **FUNCTION_WITHOUT_ARGS**
@@ -583,6 +644,27 @@ Functions and Variables
       return bar;
 
 
+Permissions
+-----------
+
+  **EXECUTE_PERMISSIONS**
+    There is no reason for source files to be executable.  The executable
+    bit can be removed safely.
+
+  **EXPORTED_WORLD_WRITABLE**
+    Exporting world writable sysfs/debugfs files is usually a bad thing.
+    When done arbitrarily they can introduce serious security bugs.
+    In the past, some of the debugfs vulnerabilities would seemingly allow
+    any local user to write arbitrary values into device registers - a
+    situation from which little good can be expected to emerge.
+
+    See: https://lore.kernel.org/linux-arm-kernel/cover.1296818921.git.segoon@openwall.com/
+
+  **NON_OCTAL_PERMISSIONS**
+    Permission bits should use 4 digit octal permissions (like 0700 or 0444).
+    Avoid using any other base like decimal.
+
+
 Spacing and Brackets
 --------------------
 
@@ -616,7 +698,7 @@ Spacing and Brackets
 
     1. With a type on the left::
 
-        ;int [] a;
+        int [] a;
 
     2. At the beginning of a line for slice initialisers::
 
@@ -630,6 +712,7 @@ Spacing and Brackets
     Code indent should use tabs instead of spaces.
     Outside of comments, documentation and Kconfig,
     spaces are never used for indentation.
+
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#indentation
 
   **CONCATENATED_STRING**
@@ -644,17 +727,20 @@ Spacing and Brackets
 
   **ELSE_AFTER_BRACE**
     `else {` should follow the closing block `}` on the same line.
+
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
 
   **LINE_SPACING**
     Vertical space is wasted given the limited number of lines an
     editor window can display when multiple blank lines are used.
+
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
 
   **OPEN_BRACE**
     The opening brace should be following the function definitions on the
     next line.  For any non-functional block it should be on the same line
     as the last construct.
+
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
 
   **POINTER_LOCATION**
@@ -671,6 +757,7 @@ Spacing and Brackets
 
   **SPACING**
     Whitespace style used in the kernel sources is described in kernel docs.
+
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
 
   **SWITCH_CASE_INDENT_LEVEL**
@@ -700,8 +787,40 @@ Spacing and Brackets
     Trailing whitespace should always be removed.
     Some editors highlight the trailing whitespace and cause visual
     distractions when editing files.
+
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#spaces
 
+  **UNNECESSARY_PARENTHESES**
+    Parentheses are not required in the following cases::
+
+      1. Function pointer uses::
+
+          (foo->bar)();
+
+        could be::
+
+          foo->bar();
+
+      2. Comparisons in if::
+
+          if ((foo->bar) && (foo->baz))
+          if ((foo == bar))
+
+        could be::
+
+          if (foo->bar && foo->baz)
+          if (foo == bar)
+
+      3. addressof/dereference single Lvalues::
+
+          &(foo->bar)
+          *(foo->bar)
+
+        could be::
+
+          &foo->bar
+          *foo->bar
+
   **WHILE_AFTER_BRACE**
     while should follow the closing bracket on the same line::
 
@@ -727,13 +846,40 @@ Others
     For DOS-formatted patches, there are extra ^M symbols at the end of
     the line.  These should be removed.
 
-  **EXECUTE_PERMISSIONS**
-    There is no reason for source files to be executable.  The executable
-    bit can be removed safely.
+  **FSF_MAILING_ADDRESS**
+    Kernel maintainers reject new instances of the GPL boilerplate paragraph
+    directing people to write to the FSF for a copy of the GPL, since the
+    FSF has moved in the past and may do so again.
+    So do not write paragraphs about writing to the Free Software Foundation's
+    mailing address.
 
-  **NON_OCTAL_PERMISSIONS**
-    Permission bits should use 4 digit octal permissions (like 0700 or 0444).
-    Avoid using any other base like decimal.
+    See: https://lore.kernel.org/lkml/20131006222342.GT19510@leaf/
+
+  **LONG_LINE**
+    The line has exceeded the specified maximum length. Consider refactoring
+    it.
+    To use a different maximum line length, the --max-line-length=n option
+    may be added while invoking checkpatch.
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings
+
+  **LONG_LINE_STRING**
+    A string starts before but extends beyond the maximum line length.
+    To use a different maximum line length, the --max-line-length=n option
+    may be added while invoking checkpatch.
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings
+
+  **LONG_LINE_COMMENT**
+    A comment starts before but extends beyond the maximum line length.
+    To use a different maximum line length, the --max-line-length=n option
+    may be added while invoking checkpatch.
+
+    See: https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings
+
+  **MEMSET**
+    The memset use appears to be incorrect.  This may be caused due to
+    badly ordered parameters.  Please recheck the usage.
 
   **NOT_UNIFIED_DIFF**
     The patch file does not appear to be in unified-diff format.  Please
@@ -742,6 +888,13 @@ Others
   **PRINTF_0XDECIMAL**
     Prefixing 0x with decimal output is defective and should be corrected.
 
+  **SPDX_LICENSE_TAG**
+    The source file is missing or has an improper SPDX identifier tag.
+    The Linux kernel requires the precise SPDX identifier in all source files,
+    and it is thoroughly documented in the kernel docs.
+
+    See: https://www.kernel.org/doc/html/latest/process/license-rules.html
+
   **TRAILING_STATEMENTS**
     Trailing statements (for example after any conditional) should be
     on the next line.
@@ -753,3 +906,6 @@ Others
 
       if (x == y)
               break;
+
+  **TYPO_SPELLING**
+    Some words may have been misspelled.  Consider reviewing them.
-- 
2.28.0

