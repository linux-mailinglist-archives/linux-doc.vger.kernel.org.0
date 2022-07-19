Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04B1257963A
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jul 2022 11:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbiGSJWe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jul 2022 05:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237289AbiGSJWY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 05:22:24 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA2CF3E
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 02:22:21 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id q75-20020a25d94e000000b00670834a0102so726168ybg.8
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 02:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=KovM5m9Iu+8wBRMriioge8BEE5ifITpdRRU2nQEdeDk=;
        b=kDYGB4RydVygHc+YAmyBVD8txGmKH2WudLiJiTqu7qOhG/e7lQZsTPTZ5/FDBj2ieQ
         li6ymq8ImnMB8etvsp4FbDjajNykpVJsOPiB2vmDlC6jLoPgZ+u8VDuGgbruJXTtuVvl
         MydfGqW+adgx+dBr4xdUAjzIH9lL+QVmMtPsWJz5eSppfx/zzA+DOa1uaCdqsqT3maC6
         LMyJsJTot5FPa8CBI1Yxl0QM2JWsp9BK5JgBSglSK1WudskNYgM1PF/JW5gOtwbplNra
         RjBSRqoAiW2Ye7Ye5IxXjZgBeLRNjuggB+RvOoeKEvvegXGun5/AJlDy+dyaK15Favp+
         OVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=KovM5m9Iu+8wBRMriioge8BEE5ifITpdRRU2nQEdeDk=;
        b=4SUE5Op87qWK5CGPDvSjZKrbWTyP+O/5i4PtTLCMuIOGqX+ht6QvduzMhzBIiYveI9
         yLEzMQalNEatBaG0mvID0VgE1QD9d18iTfkf6ZLuVVZcIE8yg9JnW7Vh8QlHuXn4VjNn
         09/rjXVOjgmxyLEpyxTPHLFJQHx4LqfZRXDh9YFEKQO/D0egpgu/s6Ju//p83cKyZQCe
         DEEKrXuFML/O9jlYp0E6mQps2X3WjOTfJF+2ZRtc3frPStIO3E6/u1A1dg959kWzcNTP
         Qck7Fws+FV6zJWHrReyi+PtwjRCOeksnGHsKon4dYA8a5kPX5ZZAFKgRTpE0KwnI+gVJ
         Ti2w==
X-Gm-Message-State: AJIora/9DXdY9Y/hfoVukmlTa6f0XZNENUMmp7TIXe3XiYV+RaY0FqPe
        8h9gzRAC7PdIn9fFpv/fn/QVelBLEll6DPx4
X-Google-Smtp-Source: AGRyM1tX4ntzL6CFfgsSFEX41qDpN6AJFpHeZHzP+J3yvd15fGv8FVkzS1S/ofZm2aLIFJZaud3B0DYoK3Irb4dL
X-Received: from skazigti.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:411e])
 (user=sadiyakazi job=sendgmr) by 2002:a25:8749:0:b0:66f:28a9:7595 with SMTP
 id e9-20020a258749000000b0066f28a97595mr29048736ybn.568.1658222540969; Tue,
 19 Jul 2022 02:22:20 -0700 (PDT)
Date:   Tue, 19 Jul 2022 09:22:14 +0000
Message-Id: <20220719092214.995965-1-sadiyakazi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH] Documentation: kunit: Add CLI args for kunit_tool
From:   Sadiya Kazi <sadiyakazi@google.com>
To:     brendanhiggins@google.com, davidgow@google.com,
        skhan@linuxfoundation.org, corbet@lwn.net,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sadiya Kazi <sadiyakazi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Run_wrapper.rst was missing some command line arguments. Added
additional args in the file. Included all initial review comments.

Signed-off-by: Sadiya Kazi <sadiyakazi@google.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index 5e560f2c5fca..91f5dda36e83 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -257,3 +257,51 @@ command line arguments:
             added or modified. Instead, enable all tests
             which have satisfied dependencies by adding
             ``CONFIG_KUNIT_ALL_TESTS=y`` to your ``.kunitconfig``.
+- ``--kunitconfig``: Specifies the path to the ``.kunitconfig`` file.
+  This Kconfig fragment enables KUnit tests. The "/.kunitconfig" gets
+  appended to the path specified. For example, If a directory path "lib/kunit"
+  is given, the complete path will be "lib/kunit/.kunitconfig".
+
+- ``--kconfig_add``: Specifies additional configuration options to be
+  appended to the ``.kunitconfig`` file. For example, ``CONFIG_KASAN=y``.
+
+- ``--arch``: Runs tests with the specified architecture. The architecture
+  specified must match the string passed to the ARCH make parameter.
+  For example, i386, x86_64, arm, um, etc. Non-UML architectures run on QEMU.
+  Default to 'um'.
+
+- ``--cross_compile``: Specifies the Kbuild toolchain. It passes the
+  same argument as passed to the ``CROSS_COMPILE`` variable used by
+  Kbuild. This will be the prefix for the toolchain
+  binaries such as GCC. For example:
+
+  - ``sparc64-linux-gnu`` if we have the sparc toolchain installed on
+    our system.
+
+  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
+    if we have downloaded the microblaze toolchain from the 0-day
+    website to a specified path in our home directory called toolchains.
+
+- ``--qemu_config``: Specifies the path to the file containing a
+  custom qemu architecture definition. This should be a python file
+  containing a QemuArchParams object.
+
+- ``--qemu_args``: Specifies additional QEMU arguments, for example, "-smp 8".
+
+- ``--jobs``: Specifies the number of jobs (commands) to run simultaneously.
+  By default, this is set to the number of cores on your system.
+
+- ``--timeout``: Specifies the maximum number of seconds allowed for all tests to run.
+  This does not include the time taken to build the tests.
+
+- ``--kernel_args``: Specifies the kernel command-line arguments. Might be repeated.
+
+- ``--run_isolated``: If set, boots the kernel for each individual suite/test.
+  This is useful for debugging a non-hermetic test, one that
+  might pass/fail based on what ran before it.
+
+- ``--raw_output``: If set, generates unformatted output from kernel.
+  If set to ``--raw_output=kunit``, filters to just KUnit output.
+
+- ``--json``: If set, it stores the test results in a JSON format and prints to stdout or
+  saves to a file if a filename is specified.
-- 
2.37.0.170.g444d1eabd0-goog

