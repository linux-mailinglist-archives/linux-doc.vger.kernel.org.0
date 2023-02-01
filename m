Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43EC3686EDF
	for <lists+linux-doc@lfdr.de>; Wed,  1 Feb 2023 20:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjBATZ2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Feb 2023 14:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjBATZW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Feb 2023 14:25:22 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0954761E4
        for <linux-doc@vger.kernel.org>; Wed,  1 Feb 2023 11:25:20 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-507aac99fdfso211117147b3.11
        for <linux-doc@vger.kernel.org>; Wed, 01 Feb 2023 11:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ncv2AWcbqOMo4MNaMipLFizY1qd9n4hGfaa8OZXFvS8=;
        b=m/Mdjwp3dUBf6VTBiurB9nnwzOZ33uzAOOtgQWT1q7NhzRZbEoLo1RBSR3nW3rknZM
         zY9fMllht/v8RTpIIbi7oqFIcv/J4pZ8rBukmC6I8fiLmiOrgvxZ7BgzSv9wM2j2H+X3
         dmAOpdl91GMZO7trXBfqh/m+UkQkjVXWG3fmgWw0HAxa+ry70hRn0OCU9/YwPuqDr3VA
         pqTK0jRxYizC19yumQ2L61GEeshHNcGyMXh0fPqJAuyhjMlR6yffgATHJN9bePTWbWHh
         Sc81tDSlLkkPa67jv2WCyBrfrj2bIGeBz/l/foGmEf5oFxIDhmz/06BH2fegZ7psB/zz
         loFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncv2AWcbqOMo4MNaMipLFizY1qd9n4hGfaa8OZXFvS8=;
        b=N36amGArabjVP6VbwRagtnZf243IcSvTayMvSw9fvtVzt4X0qda2S0MFuvPOB94ec1
         M+ZfaDpjCv23u+4tSADr5gBcfJP3vlOrzrcuu7/HAhvyHsgKkJpsPDkCYvO1PUvR0wlm
         5T3i0SPG6UBcCeKPtjUlryviaD+/QjKFni8e8O69aEcbI+0TNRtdxB/aXFBuJYhhMUaK
         CCxNiLBfGtsYm9IksE7Ck5EDhtlbxds+cQqCwVr6nWylSYP11Z5+Y/QpMGmPDNboSZQQ
         MLFGxTuMFnXmq9KopTO1G7k9unGOzoUf1FoA5jq2n0WVEAFb+BFB1MF9q2zinFsI1Fsk
         14og==
X-Gm-Message-State: AO0yUKX3EEMHQNfgrJOQlqMW8b56p4x0GHXOqhDlygotNJ0eeCFn7L2B
        Guc6RyubyFiiHbkz4RmmaJBl6tNo8/kR5/JBq5A=
X-Google-Smtp-Source: AK7set/c1inzpZ7TQCOJc5TB6xx5wuHuM8dE93kXMIu+AFUmDrtZ7hC7fXOzY+3KheWl2FZsdzwQkK/TYBXPBu0hdNA=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:341e:6979:102e:c9d9])
 (user=ndesaulniers job=sendgmr) by 2002:a81:91cf:0:b0:521:db3f:a116 with SMTP
 id i198-20020a8191cf000000b00521db3fa116mr0ywg.0.1675279519542; Wed, 01 Feb
 2023 11:25:19 -0800 (PST)
Date:   Wed,  1 Feb 2023 11:25:09 -0800
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675279509; l=2134;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=6sFm896c1fl0Nm5FPB/sT4t9TM1yBeKr5pt0TQ/7JMg=;
 b=w6Zh7GjRYNUZDcP6eQUWslQfi/JP1bRYJZhHA1IUNgOJ00ldWR8TQhiN6NeXLCxVZxG06cyUE5Fd
 T8g8MOJ7CgazzzkKFG3wSpq7qMFnQXr9/8LXaz2eepLWvwhl6qaN
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230201192509.4124319-1-ndesaulniers@google.com>
Subject: [PATCH] Documentation/llvm: add Chimera Linux, Google and Meta datacenters
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Yonghong Song <yhs@fb.com>,
        Daniel Kolesa <q66@chimera-linux.org>,
        Chris Mason <clm@meta.com>
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

Chimera Linux is a Linux distribution from 2021 that builds its kernels
with Clang.

Google transitioned its data center fleet to run Clang built kernels in
2021, and Meta did so as well in 2022.  Meta talked about this at LPC
2022 at a talk titled Kernel Live Patching at Scale.

These were important milestones for building the kernel with Clang.
Making note of them helps improve confidence in the project.

Signed-off-by: Yonghong Song <yhs@fb.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Cc: Daniel Kolesa <q66@chimera-linux.org>
Cc: Chris Mason <clm@meta.com>
---
 Documentation/kbuild/llvm.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index 6b2bac8e9ce0..6a37ab903e45 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -15,12 +15,15 @@ such as GCC and binutils. Ongoing work has allowed for `Clang
 <https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
 used as viable substitutes. Distributions such as `Android
 <https://www.android.com/>`_, `ChromeOS
-<https://www.chromium.org/chromium-os>`_, and `OpenMandriva
-<https://www.openmandriva.org/>`_ use Clang built kernels.  `LLVM is a
-collection of toolchain components implemented in terms of C++ objects
-<https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM that
-supports C and the GNU C extensions required by the kernel, and is pronounced
-"klang," not "see-lang."
+https://www.chromium.org/chromium-os>`_, `OpenMandriva
+<https://www.openmandriva.org/>`_, and `Chimera Linux
+<https://chimera-linux.org/>`_ use Clang built kernels. Google's and Meta's
+datacenter fleets also run kernels built with Clang.
+
+`LLVM is a collection of toolchain components implemented in terms of C++
+objects <https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM
+that supports C and the GNU C extensions required by the kernel, and is
+pronounced "klang," not "see-lang."
 
 Clang
 -----
-- 
2.39.1.456.gfc5497dd1b-goog

