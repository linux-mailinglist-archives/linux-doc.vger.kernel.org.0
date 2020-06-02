Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983401EB568
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2020 07:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbgFBFm3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Jun 2020 01:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgFBFm2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jun 2020 01:42:28 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8B9C05BD43
        for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2020 22:42:28 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id y7so15804344ybj.15
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2020 22:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=bk5osaVJiGNv6HMFDDoa1BeWBizOC8AFnfdcBnX83HE=;
        b=MNwj43DNaxUfUwQ0rovjHIMZ1fTtleyHscFem2vWH5sI07j7Uv41fBVGKRbTXU0oWw
         j1F4Pwb5+/QYPcVef9jk/i96jtWKgFNe7jRGGUQ6bUOFkLugEihxCBRPmTWNOUioFbFe
         Bd8sM/zraHTpC736DqEwu7g+TQJW61V4ToQakrrYqLPOzbH64L+bUmz6QAUwBq47rLUd
         NhUQR19oBeZ+ny6qikeZL/jYnxwgLcDqHoIzqqLGOKfCg8+73A3BvSjxs7k/ppWJ8w/U
         U5xSqOSp4Tef13PWaNBeZ0un/Tk32Tc5lZ3FaTkFDgU2HKq6pLF+29weT6bmc/e6XCYt
         pofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=bk5osaVJiGNv6HMFDDoa1BeWBizOC8AFnfdcBnX83HE=;
        b=WosHXgIFy0BKd6e9/SKIb076Npe3trH1Xypieb7zVulTidal0rZF+Pr/skLB5VioDh
         yF7Hj7R57RtBArg5ylNJMIpAdyhVr4WYdQBD7sG8OPe8Ql20SuaYja0N7r+BQceMTaCG
         puKJ0BrKOIyEJ4kUvJFf/bXL6LHSyuHUPyXjy37UL5RcpsQVsbb3hysVF/DmV3skJMqH
         Sh/n71Jo/mMBsWB2sLLuvpO49/5qJHr3Fl8FFhohJWDepJwDuqaiiHvsDM5a0BAK8CJ8
         qIzzloiM9//DUE/EH8u9d2xESN9MF0jv2HTF5+nyVM/fJfEAVLC0dgta5YVLTbCmdqkf
         1ChQ==
X-Gm-Message-State: AOAM532p30FIvf7WwHPCgJmy2ywjGboM4ey+qmhiBmI2JrXv9bnXebqt
        bxHRS9a53kgXdTNU8eRHX73dSqcOu53KRA==
X-Google-Smtp-Source: ABdhPJx9vDHTXUY+CzoW3/vdoqwLoI1FfZ6/ud5mLimm+OjfZFVFhjoAVLYr/Go8lxvT6G+52qhwMG5A9nIiHQ==
X-Received: by 2002:a25:d295:: with SMTP id j143mr6686782ybg.65.1591076547649;
 Mon, 01 Jun 2020 22:42:27 -0700 (PDT)
Date:   Mon,  1 Jun 2020 22:42:16 -0700
Message-Id: <20200602054216.93122-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
Subject: [PATCH] Documentation: kunit: Add some troubleshooting tips to the FAQ
From:   David Gow <davidgow@google.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        alan.maguire@oracle.com, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an FAQ entry to the KUnit documentation with some tips for
troubleshooting KUnit and kunit_tool.

These suggestions largely came from an email thread:
https://lore.kernel.org/linux-kselftest/41db8bbd-3ba0-8bde-7352-083bf4b947ff@intel.com/T/#m23213d4e156db6d59b0b460a9014950f5ff6eb03

Signed-off-by: David Gow <davidgow@google.com>
---
 Documentation/dev-tools/kunit/faq.rst | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/dev-tools/kunit/faq.rst b/Documentation/dev-tools/kunit/faq.rst
index ea55b2467653..40109d425988 100644
--- a/Documentation/dev-tools/kunit/faq.rst
+++ b/Documentation/dev-tools/kunit/faq.rst
@@ -61,3 +61,35 @@ test, or an end-to-end test.
   kernel by installing a production configuration of the kernel on production
   hardware with a production userspace and then trying to exercise some behavior
   that depends on interactions between the hardware, the kernel, and userspace.
+
+KUnit isn't working, what should I do?
+======================================
+
+Unfortunately, there are a number of things which can break, but here are some
+things to try.
+
+1. Try running ``./tools/testing/kunit/kunit.py run`` with the ``--raw_output``
+   parameter. This might show details or error messages hidden by the kunit_tool
+   parser.
+2. Instead of running ``kunit.py run``, try running ``kunit.py config``,
+   ``kunit.py build``, and ``kunit.py exec`` independently. This can help track
+   down where an issue is occurring. (If you think the parser is at fault, you
+   can run it manually against stdin or a file with ``kunit.py parse``.)
+3. Running the UML kernel directly can often reveal issues or error messages
+   kunit_tool ignores. This should be as simple as running ``./vmlinux`` after
+   building the UML kernel (e.g., by using ``kunit.py build``). Note that UML
+   has some unusual requirements (such as the host having a tmpfs filesystem
+   mounted), and has had issues in the past when built statically and the host
+   has KASLR enabled. (On older host kernels, you may need to run ``setarch
+   `uname -m` -R ./vmlinux`` to disable KASLR.)
+4. Make sure the kernel .config has ``CONFIG_KUNIT=y`` and at least one test
+   (e.g. ``CONFIG_KUNIT_EXAMPLE_TEST=y``). kunit_tool will keep its .config
+   around, so you can see what config was used after running ``kunit.py run``.
+   It also preserves any config changes you might make, so you can
+   enable/disable things with ``make ARCH=um menuconfig`` or similar, and then
+   re-run kunit_tool.
+5. Finally, running ``make ARCH=um defconfig`` before running ``kunit.py run``
+   may help clean up any residual config items which could be causing problems.
+
+If none of the above tricks help, you are always welcome to email any issues to
+kunit-dev@googlegroups.com.
-- 
2.27.0.rc2.251.g90737beb825-goog

