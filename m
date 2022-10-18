Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE2F60230B
	for <lists+linux-doc@lfdr.de>; Tue, 18 Oct 2022 06:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiJREEO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Oct 2022 00:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiJREEL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 00:04:11 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A512511464
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 21:04:09 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id n56-20020a056a000d7800b00562b27194d1so7141595pfv.19
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 21:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBGrBoKi837i2zswbu7Rf6b2rdpiSWUxA28Nl+zNkpc=;
        b=hzrmMNtS8FOWe9YbpzRI1Wj5f9veGuCoo74TckHljPRK+1Wc8BncrJ1p36Kju/GDNw
         Jot2X9dNIv2qmrHkh1QcUrMlJUSkjXlHkewRoRnXRzV59YC3EKrJ2sVmdCkfU/50Rq+B
         d2OAjxUYGF0LQgxIRAjgh7A9mzemxVIXuSqqWPWX7fTWcuB2w1FOHv14scEVYvfyXj/+
         oM7xd4TbkKsQWOFK/A2sAaav/NehmpK3B7FpDVwhwfJFivmEMtToGW8eEC35CmSehL5d
         RjLrqwYkoX7KZh6O3s74Z/P9MsKQcjSZ4CEGlXOPVzquoMR138DBVp/x5+X+nYDUI204
         BUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBGrBoKi837i2zswbu7Rf6b2rdpiSWUxA28Nl+zNkpc=;
        b=exI5fwfIsOyTtxABdnL9VxnqupleSvh7SeWMq9GbXoVTltfgKRTPytH8itnsOM1I1w
         r8vA10FIBPmFeRlyQ6L3RFPfS+AlbWrWeDVd86tDCTuWtEXoAZGTQVQDyIyRCgHe47tH
         DhT+pVKaS7xwC/x8FN9E7TCeA0paWle6JVRnlK3tPuMmb/uYHVLgm7Ru4zxB4iukGhVa
         nAP7sBBYM5fiVHF4kC1FhfR+WR60Eh5CW/ksL9ovdGW45YkW0Eq1j5mFZDPkJ03J2UEz
         WRj9YhAlXiV24CmtvT0WHm0JoDDIzHhsFspYc16JqUmitpy7ytZkAIe6odzE/RE+fhHo
         cFvQ==
X-Gm-Message-State: ACrzQf1rgWQbsU7S+LGJ1izYfqAhZXNEsyvW/v21I5eaZA0sd5x+Nswh
        lnSA/fD5ZSgMqPApskj30uRjmyqnVor7gSrn
X-Google-Smtp-Source: AMsMyM6SRY4B2lrLPB5dWDNau74cl2QfxmJ5eJ2A20EbJKdk/KZ/znzoQzWR6J/0N0SoHQqXPFrlvVsKzd912Jbq
X-Received: from skazigti.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:411e])
 (user=sadiyakazi job=sendgmr) by 2002:a05:6a00:1344:b0:565:e95c:6da4 with
 SMTP id k4-20020a056a00134400b00565e95c6da4mr913549pfu.45.1666065849211; Mon,
 17 Oct 2022 21:04:09 -0700 (PDT)
Date:   Tue, 18 Oct 2022 04:03:33 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
Message-ID: <20221018040332.2384436-1-sadiyakazi@google.com>
Subject: [PATCH v4] Documentation: Kunit: Update architecture.rst for minor fixes
From:   Sadiya Kazi <sadiyakazi@google.com>
To:     brendanhiggins@google.com, davidgow@google.com,
        skhan@linuxfoundation.org, corbet@lwn.net, bagasdotme@gmail.com
Cc:     Sadiya Kazi <sadiyakazi@google.com>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Updated the architecture.rst page with the following changes:
-Add missing article _the_ across the document.
-Reword content across for style and standard.
-Update all occurrences of Command Line to Command-line
 across the document.
-Correct grammatical issues, for example,
 added _it_wherever missing.
-Update all occurrences of =E2=80=9Cvia" to either use
 =E2=80=9Cthrough=E2=80=9D or =E2=80=9Cusing=E2=80=9D.
-Update the text preceding the external links and pushed the full
 link to a new line for better readability.
-Reword content under the config command to make it more clear and concise.

Signed-off-by: Sadiya Kazi <sadiyakazi@google.com>
Reviewed-by: David Gow <davidgow@google.com>
---
Thank you David. I have made the changes as per your feedback.
Changes since V3:
https://lore.kernel.org/linux-kselftest/20221017070820.2253501-1-sadiyakazi=
@google.com/

- Added the missing full stop
- Reworded content around the ``kunit_try_catch_run()`` funtion

Regards,
Sadiya

---
 .../dev-tools/kunit/architecture.rst          | 115 +++++++++---------
 1 file changed, 58 insertions(+), 57 deletions(-)

diff --git a/Documentation/dev-tools/kunit/architecture.rst b/Documentation=
/dev-tools/kunit/architecture.rst
index 8efe792bdcb9..e95ab05342bb 100644
--- a/Documentation/dev-tools/kunit/architecture.rst
+++ b/Documentation/dev-tools/kunit/architecture.rst
@@ -4,16 +4,17 @@
 KUnit Architecture
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-The KUnit architecture can be divided into two parts:
+The KUnit architecture is divided into two parts:
=20
 - `In-Kernel Testing Framework`_
-- `kunit_tool (Command Line Test Harness)`_
+- `kunit_tool (Command-line Test Harness)`_
=20
 In-Kernel Testing Framework
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
 The kernel testing library supports KUnit tests written in C using
-KUnit. KUnit tests are kernel code. KUnit does several things:
+KUnit. These KUnit tests are kernel code. KUnit performs the following
+tasks:
=20
 - Organizes tests
 - Reports test results
@@ -22,19 +23,17 @@ KUnit. KUnit tests are kernel code. KUnit does several =
things:
 Test Cases
 ----------
=20
-The fundamental unit in KUnit is the test case. The KUnit test cases are
-grouped into KUnit suites. A KUnit test case is a function with type
-signature ``void (*)(struct kunit *test)``.
-These test case functions are wrapped in a struct called
-struct kunit_case.
+The test case is the fundamental unit in KUnit. KUnit test cases are organ=
ised
+into suites. A KUnit test case is a function with type signature
+``void (*)(struct kunit *test)``. These test case functions are wrapped in=
 a
+struct called struct kunit_case.
=20
 .. note:
 	``generate_params`` is optional for non-parameterized tests.
=20
-Each KUnit test case gets a ``struct kunit`` context
-object passed to it that tracks a running test. The KUnit assertion
-macros and other KUnit utilities use the ``struct kunit`` context
-object. As an exception, there are two fields:
+Each KUnit test case receives a ``struct kunit`` context object that track=
s a
+running test. The KUnit assertion macros and other KUnit utilities use the
+``struct kunit`` context object. As an exception, there are two fields:
=20
 - ``->priv``: The setup functions can use it to store arbitrary test
   user data.
@@ -77,12 +76,13 @@ Executor
=20
 The KUnit executor can list and run built-in KUnit tests on boot.
 The Test suites are stored in a linker section
-called ``.kunit_test_suites``. For code, see:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/in=
clude/asm-generic/vmlinux.lds.h?h=3Dv5.15#n945.
+called ``.kunit_test_suites``. For the code, see ``KUNIT_TABLE()`` macro
+definition in
+`include/asm-generic/vmlinux.lds.h <https://git.kernel.org/pub/scm/linux/k=
ernel/git/torvalds/linux.git/tree/include/asm-generic/vmlinux.lds.h?h=3Dv6.=
0#n950>`_.
 The linker section consists of an array of pointers to
 ``struct kunit_suite``, and is populated by the ``kunit_test_suites()``
-macro. To run all tests compiled into the kernel, the KUnit executor
-iterates over the linker section array.
+macro. The KUnit executor iterates over the linker section array in order =
to
+run all the tests that are compiled into the kernel.
=20
 .. kernel-figure:: kunit_suitememorydiagram.svg
 	:alt:	KUnit Suite Memory
@@ -90,17 +90,17 @@ iterates over the linker section array.
 	KUnit Suite Memory Diagram
=20
 On the kernel boot, the KUnit executor uses the start and end addresses
-of this section to iterate over and run all tests. For code, see:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/li=
b/kunit/executor.c
-
+of this section to iterate over and run all tests. For the implementation =
of the
+executor, see
+`lib/kunit/executor.c <https://git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git/tree/lib/kunit/executor.c>`_.
 When built as a module, the ``kunit_test_suites()`` macro defines a
 ``module_init()`` function, which runs all the tests in the compilation
 unit instead of utilizing the executor.
=20
 In KUnit tests, some error classes do not affect other tests
 or parts of the kernel, each KUnit case executes in a separate thread
-context. For code, see:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/li=
b/kunit/try-catch.c?h=3Dv5.15#n58
+context. See the ``kunit_try_catch_run()`` function in
+`lib/kunit/try-catch.c <https://git.kernel.org/pub/scm/linux/kernel/git/to=
rvalds/linux.git/tree/lib/kunit/try-catch.c?h=3Dv5.15#n58>`_.
=20
 Assertion Macros
 ----------------
@@ -111,37 +111,36 @@ All expectations/assertions are formatted as:
=20
 - ``{EXPECT|ASSERT}`` determines whether the check is an assertion or an
   expectation.
+  In the event of a failure, the testing flow differs as follows:
=20
-	- For an expectation, if the check fails, marks the test as failed
-	  and logs the failure.
+	- For expectations, the test is marked as failed and the failure is logge=
d.
=20
-	- An assertion, on failure, causes the test case to terminate
-	  immediately.
+	- Failing assertions, on the other hand, result in the test case being
+	  terminated immediately.
=20
-		- Assertions call function:
+		- Assertions call the function:
 		  ``void __noreturn kunit_abort(struct kunit *)``.
=20
-		- ``kunit_abort`` calls function:
+		- ``kunit_abort`` calls the function:
 		  ``void __noreturn kunit_try_catch_throw(struct kunit_try_catch *try_ca=
tch)``.
=20
-		- ``kunit_try_catch_throw`` calls function:
+		- ``kunit_try_catch_throw`` calls the function:
 		  ``void kthread_complete_and_exit(struct completion *, long) __noreturn=
;``
 		  and terminates the special thread context.
=20
 - ``<op>`` denotes a check with options: ``TRUE`` (supplied property
-  has the boolean value =E2=80=9Ctrue=E2=80=9D), ``EQ`` (two supplied prop=
erties are
+  has the boolean value "true"), ``EQ`` (two supplied properties are
   equal), ``NOT_ERR_OR_NULL`` (supplied pointer is not null and does not
-  contain an =E2=80=9Cerr=E2=80=9D value).
+  contain an "err" value).
=20
 - ``[_MSG]`` prints a custom message on failure.
=20
 Test Result Reporting
 ---------------------
-KUnit prints test results in KTAP format. KTAP is based on TAP14, see:
-https://github.com/isaacs/testanything.github.io/blob/tap14/tap-version-14=
-specification.md.
-KTAP (yet to be standardized format) works with KUnit and Kselftest.
-The KUnit executor prints KTAP results to dmesg, and debugfs
-(if configured).
+KUnit prints the test results in KTAP format. KTAP is based on TAP14, see
+Documentation/dev-tools/ktap.rst.
+KTAP works with KUnit and Kselftest. The KUnit executor prints KTAP result=
s to
+dmesg, and debugfs (if configured).
=20
 Parameterized Tests
 -------------------
@@ -150,33 +149,35 @@ Each KUnit parameterized test is associated with a co=
llection of
 parameters. The test is invoked multiple times, once for each parameter
 value and the parameter is stored in the ``param_value`` field.
 The test case includes a KUNIT_CASE_PARAM() macro that accepts a
-generator function.
-The generator function is passed the previous parameter and returns the ne=
xt
-parameter. It also provides a macro to generate common-case generators bas=
ed on
-arrays.
+generator function. The generator function is passed the previous paramete=
r
+and returns the next parameter. It also includes a macro for generating
+array-based common-case generators.
=20
-kunit_tool (Command Line Test Harness)
+kunit_tool (Command-line Test Harness)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-kunit_tool is a Python script ``(tools/testing/kunit/kunit.py)``
-that can be used to configure, build, exec, parse and run (runs other
-commands in order) test results. You can either run KUnit tests using
-kunit_tool or can include KUnit in kernel and parse manually.
+``kunit_tool`` is a Python script, found in ``tools/testing/kunit/kunit.py=
``. It
+is used to configure, build, execute, parse test results and run all of th=
e
+previous commands in correct order (i.e., configure, build, execute and pa=
rse).
+You have two options for running KUnit tests: either build the kernel with=
 KUnit
+enabled and manually parse the results (see
+Documentation/dev-tools/kunit/run_manual.rst) or use ``kunit_tool``
+(see Documentation/dev-tools/kunit/run_wrapper.rst).
=20
 - ``configure`` command generates the kernel ``.config`` from a
   ``.kunitconfig`` file (and any architecture-specific options).
-  For some architectures, additional config options are specified in the
-  ``qemu_config`` Python script
-  (For example: ``tools/testing/kunit/qemu_configs/powerpc.py``).
+  The Python scripts available in ``qemu_configs`` folder
+  (for example, ``tools/testing/kunit/qemu configs/powerpc.py``) contains
+  additional configuration options for specific architectures.
   It parses both the existing ``.config`` and the ``.kunitconfig`` files
-  and ensures that ``.config`` is a superset of ``.kunitconfig``.
-  If this is not the case, it will combine the two and run
-  ``make olddefconfig`` to regenerate the ``.config`` file. It then
-  verifies that ``.config`` is now a superset. This checks if all
-  Kconfig dependencies are correctly specified in ``.kunitconfig``.
-  ``kunit_config.py`` includes the parsing Kconfigs code. The code which
-  runs ``make olddefconfig`` is a part of ``kunit_kernel.py``. You can
-  invoke this command via: ``./tools/testing/kunit/kunit.py config`` and
+  to ensure that ``.config`` is a superset of ``.kunitconfig``.
+  If not, it will combine the two and run ``make olddefconfig`` to regener=
ate
+  the ``.config`` file. It then checks to see if ``.config`` has become a =
superset.
+  This verifies that all the Kconfig dependencies are correctly specified =
in the
+  file ``.kunitconfig``. The ``kunit_config.py`` script contains the code =
for parsing
+  Kconfigs. The code which runs ``make olddefconfig`` is part of the
+  ``kunit_kernel.py`` script. You can invoke this command through:
+  ``./tools/testing/kunit/kunit.py config`` and
   generate a ``.config`` file.
 - ``build`` runs ``make`` on the kernel tree with required options
   (depends on the architecture and some options, for example: build_dir)
@@ -184,8 +185,8 @@ kunit_tool or can include KUnit in kernel and parse man=
ually.
   To build a KUnit kernel from the current ``.config``, you can use the
   ``build`` argument: ``./tools/testing/kunit/kunit.py build``.
 - ``exec`` command executes kernel results either directly (using
-  User-mode Linux configuration), or via an emulator such
-  as QEMU. It reads results from the log via standard
+  User-mode Linux configuration), or through an emulator such
+  as QEMU. It reads results from the log using standard
   output (stdout), and passes them to ``parse`` to be parsed.
   If you already have built a kernel with built-in KUnit tests,
   you can run the kernel and display the test results with the ``exec``
--=20
2.38.0.413.g74048e4d9e-goog

