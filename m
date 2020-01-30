Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D4F14E600
	for <lists+linux-doc@lfdr.de>; Fri, 31 Jan 2020 00:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbgA3XIi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Jan 2020 18:08:38 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:53007 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbgA3XIg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jan 2020 18:08:36 -0500
Received: by mail-pg1-f202.google.com with SMTP id w21so2748706pgf.19
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2020 15:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GWHGFk+tfCHvu/qeG8h3yhiMIdqay1deL3woZTxVWJc=;
        b=SK7qbAbMVIMUgyE42nQVDPyGZ3xVFHv0chQcoZWlALn4b+uUTa/V5PsexsEkn4W2Kb
         bZ7asnJNgDPXfOBetYqJnB9J2XcNvSCZ2/XQ46hFJbZuHTPb4tjLrji35a2EH5gEYQHX
         Vkr9rAsWvphKeh+EesgLzV0XxJ8zZnKFtmATHJ3yzTibY5hSi70Lnx1UCkTYJAuNwZlh
         OicLwo5w9sN3kYYpjEk4VGqXocphh9jYWtcIwf1NuOdGOcvYH5uehNSugKLXxfxcIe4+
         5dUSUaen9Esm8+Jozb1twYu1kudX5eI+ybO5b2ahw9UpOS7dJqKDb5rKEe1YFZwBGUag
         JZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GWHGFk+tfCHvu/qeG8h3yhiMIdqay1deL3woZTxVWJc=;
        b=XYQKGQQKP2wExEmIh9l3ZhdPJZkjzgeAdslgS5I6WoFIbDY5zlmvgJKWQGgB7lL3Hb
         TJuWP4SD/aBfJECufJmrBMMCivgateHAMwaiFzwtsatd0PajGxrAzaOTn4Tl6cvhB15a
         xWkqQjpI332/+IaCvQ7fK73nFFvrebQsrRC59OBnahq5jU02s17mBheO7jHHrm3pbWet
         cWP7+aQG/ToX7wEO1qgLR5L/PYDTyEo258czhD8XIP5i6z4tn3cOhbK6GgYkn9j/zo7H
         LaivWmA9+t0bZiheLkrmeVNLm/XxPWgpfsdVDi7BbqmjtsZircpOSkp+MQUJ7m36lOIL
         5Bdg==
X-Gm-Message-State: APjAAAUb4VP7sDpLbm5VFp5iXSGeqZItnGCmSOZlcmUxv1wbJpxb2xyg
        eX58Ajx1It4x00QUjxI9SNkdlgaofJc7m/rrTrk2Hg==
X-Google-Smtp-Source: APXvYqzh84slKzyUU7Hf8lA5m17FvOWJKZUYYrXcCEAGxMB3WhDFDTTWmSv14cUPAQuwHTR0/deMhklQVof4n1fVyRG7sw==
X-Received: by 2002:a65:4142:: with SMTP id x2mr7048130pgp.393.1580425714304;
 Thu, 30 Jan 2020 15:08:34 -0800 (PST)
Date:   Thu, 30 Jan 2020 15:08:07 -0800
In-Reply-To: <20200130230812.142642-1-brendanhiggins@google.com>
Message-Id: <20200130230812.142642-3-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200130230812.142642-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 2/7] arch: um: add linker section for KUnit test suites
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, knut.omang@oracle.com,
        linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a linker section to UML where KUnit can put references to its test
suites. This patch is an early step in transitioning to dispatching all
KUnit tests from a centralized executor rather than having each as its
own separate late_initcall.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 arch/um/include/asm/common.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/um/include/asm/common.lds.S b/arch/um/include/asm/common.lds.S
index 7145ce6999822..eab9ceb450efd 100644
--- a/arch/um/include/asm/common.lds.S
+++ b/arch/um/include/asm/common.lds.S
@@ -52,6 +52,10 @@
 	CON_INITCALL
   }
 
+  .kunit_test_suites : {
+	KUNIT_TEST_SUITES
+  }
+
   .exitcall : {
 	__exitcall_begin = .;
 	*(.exitcall.exit)
-- 
2.25.0.341.g760bfbb309-goog

