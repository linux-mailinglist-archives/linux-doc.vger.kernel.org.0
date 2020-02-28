Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D159172E28
	for <lists+linux-doc@lfdr.de>; Fri, 28 Feb 2020 02:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730537AbgB1BU7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Feb 2020 20:20:59 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:47318 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729984AbgB1BU7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 20:20:59 -0500
Received: by mail-pf1-f201.google.com with SMTP id e16so835077pfh.14
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 17:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=gfPIObcjKoc/X97Hku0RqtasQR2kVC34gv6DKj0xOtc=;
        b=VXCVjRFV1YqUz/8wn7l00lvSHg2xQqUpVRtpFdlra5OC8OF0q0/3b0I8oE3nzS0B4c
         tupmvt08U9uuorUzoZ1eYDtNg1U63jqDJ0ibGa1taWf7raFaAzoV4BPv3Tg2m4KnmZov
         V6tpQRa0TMh7UERsCUCTWUWO8SYLoaBeDSCw/OQ+60WXxiMfaBmIcZRNfSDrrnjURMK6
         m5775Jw2akrEorxQ6H656cKfbZOHEhm9xqa5dDLNBIKMPYG/okbS3dxAbLcir1Asizeo
         EmLpGy2DdoKfflEyZLFp6qL14aA0ICqAugWB/JNN5PCwqLQlbpj/EvCmMHCfEdUzY9iN
         cWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=gfPIObcjKoc/X97Hku0RqtasQR2kVC34gv6DKj0xOtc=;
        b=ZKA3ZIGYYzXvDs1ikNhF1gNzxw93H6BMvlRDCCELpkpoRch8dH+2m8UeAh5jf1hQGn
         D1D9K2TDrJZHzFVx68H+CKbBI9iYEOWfqrUe6tHEBJkGppoeA/C0HyHvJKuLg+3E495I
         2UyuLTQ5kz23usl6ptTeC3dnTcjmXiS/17rdoqYyLPVPgYr/FMlWsMv+/M2O0m/Jyxw0
         KufMmJZDSzmZI13VfQ/IRJYP/oX0/J56nxOkrrEw0yB8lmL00bpvJlLrQevCxFBBn3bb
         bw4f9o6XFwcI23NPcaHwG04myN1Ag30Cvbf9G3soxnOQUKC97sqf9uZCA8njmwzuKYWe
         zjkg==
X-Gm-Message-State: APjAAAUhC+yBHxCzCUm9C989UXt0zpY9qiRJ9X7XiZPrmIJ58MvF2RC+
        /SBZVQsEisftJ75LJQN8xzEQXImH/P2kl4Y4K1aLFA==
X-Google-Smtp-Source: APXvYqypNGxK7wTo1FTf1mIFjhr0aXSAgo4WiptbW+IYOxodMeIGcqOB36P6zCIg73RrYOnWUywb6RzPCsqA6rNjpwfVnA==
X-Received: by 2002:a63:7f17:: with SMTP id a23mr2129453pgd.47.1582852857820;
 Thu, 27 Feb 2020 17:20:57 -0800 (PST)
Date:   Thu, 27 Feb 2020 17:20:30 -0800
In-Reply-To: <20200228012036.15682-1-brendanhiggins@google.com>
Message-Id: <20200228012036.15682-2-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200228012036.15682-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v3 1/7] vmlinux.lds.h: add linker section for KUnit test suites
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a linker section where KUnit can put references to its test suites.
This patch is the first step in transitioning to dispatching all KUnit
tests from a centralized executor rather than having each as its own
separate late_initcall.

Co-developed-by: Iurii Zaikin <yzaikin@google.com>
Signed-off-by: Iurii Zaikin <yzaikin@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e00f41aa8ec4f..99a866f49cb3d 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -856,6 +856,13 @@
 		KEEP(*(.con_initcall.init))				\
 		__con_initcall_end = .;
 
+/* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
+#define KUNIT_TEST_SUITES						\
+		. = ALIGN(8);						\
+		__kunit_suites_start = .;				\
+		KEEP(*(.kunit_test_suites))				\
+		__kunit_suites_end = .;
+
 #ifdef CONFIG_BLK_DEV_INITRD
 #define INIT_RAM_FS							\
 	. = ALIGN(4);							\
@@ -1024,6 +1031,7 @@
 		INIT_CALLS						\
 		CON_INITCALL						\
 		INIT_RAM_FS						\
+		KUNIT_TEST_SUITES					\
 	}
 
 #define BSS_SECTION(sbss_align, bss_align, stop_align)			\
-- 
2.25.1.481.gfbce0eb801-goog

