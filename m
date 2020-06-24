Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD27B207DFE
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2020 22:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389235AbgFXU7V (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Jun 2020 16:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389185AbgFXU6L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Jun 2020 16:58:11 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E92C061797
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 13:58:11 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id f16so3608923ybp.5
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=J3ivtuBCWWA6WF3YNE0hm8BpVh0hgAMk0icQw8PVzV4=;
        b=tc++vE8OqiFWBPWLgjgz+8iB4vui6irGevOP603lUg1UNDik9D3RHD3BRtfvQnnEf0
         jrKRLdHrhmzWJKnehTSRLbse6SnSXGQd35K2w5Zw9Z+uwoCNqlj6mkrJWH36qGOISkU2
         3NifzTZEtRhL18lQl5iPbyga7DEY6bWA2ca3xSr4TZGtif0WyKPDe33h2W95GCGjYoTD
         LoLgCnF8B+dCod++2Ii9nCw49QtFtdis8Pk9VuDF5L/wQjwjqBE0rPgSwa+KcPbSzpms
         Ap+f4GQjV/9IxN/DKcUM1pSafBVlQkPDdfl802IjkfV7kftNlqpzgQEn6l454cRI3B5c
         XxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=J3ivtuBCWWA6WF3YNE0hm8BpVh0hgAMk0icQw8PVzV4=;
        b=Q74VJ02hZfu4uQmkE9bhZgGR9H27U33jHv0wcaIoXVn80ln5x753J90uJ+4ZpO+xCH
         7pd03nO+P9SPcI8xgpBsfMNnSzFqZ9ZRJKxN/rFbGMf37TZCkRA0taki9UehuB/XH8h+
         29q/ZEEx1+jfACCQcdb1osTDkJHxXRTt7aUyv2j3/OQrIWo7aaIqoJ84KoD5/cRC22s7
         TdN9zKByHaJscWxRsNqXhblKpCVQtKvfraD1VG1qgvKiuG+4bguA4yhGcPq/kFADy3aZ
         rVZaPWePbXRfzzNq524yQ7q5c67jv86JG5O4Y56VUqvoGc7vBLvDiuMxh4930lB5a420
         xDag==
X-Gm-Message-State: AOAM533qByicyf4lAeilw+Z8AqD1OPv8AMBnPAI1W/IAGMeY/kNYyjB3
        AezecNckl8flBE21zNsT4mRu9FCCx4LNo4EFEBOVlw==
X-Google-Smtp-Source: ABdhPJxdBp1vku0LQMvgNodo050SkO7FsfUngwFhnwGxx7442lwKRrC6xg8fX13lreYNm4d8BSbKm5F9o+C9V7i1TJs25w==
X-Received: by 2002:a25:ba09:: with SMTP id t9mr49146881ybg.128.1593032290524;
 Wed, 24 Jun 2020 13:58:10 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:55:40 -0700
In-Reply-To: <20200624205550.215599-1-brendanhiggins@google.com>
Message-Id: <20200624205550.215599-2-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200624205550.215599-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 01/11] vmlinux.lds.h: add linker section for KUnit test suites
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        monstr@monstr.eu, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, chris@zankel.net, jcmvbkbc@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
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
index db600ef218d7d..4f9b036fc9616 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -881,6 +881,13 @@
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
@@ -1056,6 +1063,7 @@
 		INIT_CALLS						\
 		CON_INITCALL						\
 		INIT_RAM_FS						\
+		KUNIT_TEST_SUITES					\
 	}
 
 #define BSS_SECTION(sbss_align, bss_align, stop_align)			\
-- 
2.27.0.212.ge8ba1cc988-goog

