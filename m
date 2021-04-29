Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7FA36F16D
	for <lists+linux-doc@lfdr.de>; Thu, 29 Apr 2021 22:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236847AbhD2UwU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Apr 2021 16:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237288AbhD2UwN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Apr 2021 16:52:13 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13B5C06134A
        for <linux-doc@vger.kernel.org>; Thu, 29 Apr 2021 13:51:21 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id f17-20020a05621400d1b029019a6fc802f7so31410591qvs.7
        for <linux-doc@vger.kernel.org>; Thu, 29 Apr 2021 13:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HDU3fipI2jIYDh7sBk6Haj682lgh4FX1OTAOz5rXBjE=;
        b=VeNMi853XgTR4ZwjSKWeWZuMZT/uXhbsLUHgqCEBiTm+tUFXgXnoASbHoG35P5WbXc
         SzDwqVMcH6jW1fHi0TwZ9me6Ro1qBgGgGypMF6UkWVgyAHRlTpASDKwZ9f8cXFayswQr
         7+zODIxeNotj4t6CnPVzIxySK3W5YTet/jQyRV0mwQHOJub3U0rDuOE7t1COGeTSQwz+
         iAqgKrVHTX3oREq8abD1LJhHq8usujK5hQYp2jb7n28twW8+G+nASLqSxFFpT5PrvAcF
         YBqWduQpYUfpHDiEkmuaNrMvuMkwFC93KmWaFXT+3ojNYK9kla53DVD0EHLbjaam15lm
         EVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HDU3fipI2jIYDh7sBk6Haj682lgh4FX1OTAOz5rXBjE=;
        b=ZhE/i+FefE8/OzPMZuD04jzPCTModfxJs+UEmEWxwVhacsKeRy+OC4vzaSMzrg1pHZ
         PbmRHrdM6uCdmm0Hyymv/hYWHkNXrnTeFTcEHHyl8w/BmyxQ3vvsgI5qekNMUi5KRm1/
         kLx/2up1M7MNp6IG3KK/MwDdYFLuGpFPHkSkrZnQQxgWLRzXDTD8NbUUd/v6kptoY8E2
         EmsNufpTyz1za7iWXf1E/hSmzcWNgGTQVgZdRIzjh4XqtM0Y3EZCceML36Lrk0cswL5a
         yQuYzbi6zPf/PjOi2olCdxGcI47O/ZQrZOQ79pqXlBYmtIn5GWKirpfj9ad/RPhBDwWb
         kWRg==
X-Gm-Message-State: AOAM5310B42G6QPIWSUToFT3Ykge/qM5Y05hzysIgzDvJYUsSsS4FXLp
        hUyg0fgjVIaeI21pdkS+kuincLzp7ArvsTxGIEa3iQ==
X-Google-Smtp-Source: ABdhPJyczsqt0L1kdH5oIPdV6BbHXgNmTZ19a4myQKyLHjLLIPiLuVdM3HOvyO/rJh9EfN7C8i5Q/JqxLoPeuUqu81n1+A==
X-Received: from mactruck.svl.corp.google.com ([2620:15c:2cb:201:bab5:c64e:5a6c:36bd])
 (user=brendanhiggins job=sendgmr) by 2002:a0c:c20b:: with SMTP id
 l11mr1999080qvh.1.1619729480971; Thu, 29 Apr 2021 13:51:20 -0700 (PDT)
Date:   Thu, 29 Apr 2021 13:51:09 -0700
In-Reply-To: <20210429205109.2847831-1-brendanhiggins@google.com>
Message-Id: <20210429205109.2847831-5-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20210429205109.2847831-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [RFC v2 4/4] Documentation: kunit: document support for QEMU in kunit_tool
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, sboyd@kernel.org, keescook@chromium.org,
        frowand.list@gmail.com, dlatypov@google.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document QEMU support, what it does, and how to use it in kunit_tool.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 Documentation/dev-tools/kunit/usage.rst | 37 +++++++++++++++++++++----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 650f99590df57..b74bd7c87cc20 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -612,14 +612,39 @@ only things to be aware of when doing so.
 The biggest impediment will likely be that certain KUnit features and
 infrastructure may not support your target environment. For example, at this
 time the KUnit Wrapper (``tools/testing/kunit/kunit.py``) does not work outside
-of UML. Unfortunately, there is no way around this. Using UML (or even just a
-particular architecture) allows us to make a lot of assumptions that make it
-possible to do things which might otherwise be impossible.
+of UML and QEMU. Unfortunately, there is no way around this. Using UML and QEMU
+(or even just a particular architecture) allows us to make a lot of assumptions
+that make it possible to do things which might otherwise be impossible.
 
 Nevertheless, all core KUnit framework features are fully supported on all
-architectures, and using them is straightforward: all you need to do is to take
-your kunitconfig, your Kconfig options for the tests you would like to run, and
-merge them into whatever config your are using for your platform. That's it!
+architectures, and using them is straightforward: Most popular architectures
+are supported directly in the KUnit Wrapper via QEMU.  Currently, supported
+architectures on QEMU include:
+
+*   i386
+*   x86_64
+*   arm
+*   arm64
+*   alpha
+*   powerpc
+*   riscv
+*   s390
+*   sparc
+
+In order to run KUnit tests on one of these architectures via QEMU with the
+KUnit wrapper, all you need to do is specify the flags ``--arch`` and
+``--cross_compile`` when invoking the KUnit Wrapper. For example, we could run
+the default KUnit tests on ARM in the following manner (assuming we have an ARM
+toolchain installed):
+
+.. code-block:: bash
+
+	tools/testing/kunit/kunit.py run --timeout=60 --jobs=12 --arch=arm --cross_compile=arm-linux-gnueabihf-
+
+Alternatively, if you want to run your tests on real hardware or in some other
+emulation environment, all you need to do is to take your kunitconfig, your
+Kconfig options for the tests you would like to run, and merge them into
+whatever config your are using for your platform. That's it!
 
 For example, let's say you have the following kunitconfig:
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

