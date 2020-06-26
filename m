Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9B720BB1D
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2020 23:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgFZVKN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jun 2020 17:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgFZVJe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jun 2020 17:09:34 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8D1C08C5DD
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:09:32 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id s90so11088887ybi.6
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 14:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0vYZtvNiMw5LFIFKa+iHi1yqO9mFLTJ7LRF4fjft6YQ=;
        b=u6J8VuAHahXAYfZui4sfoaT0dsrVB0g/njRZ5MIakf/7bSZWFoZur8+vHZjZIgvkyd
         rsiis3HuL4AzSgVfpTFGOsNv9/7tHGdL61VbY11KBuBRNquuaThfognGBSG6XDHhjVrh
         liuTo+mvfU3D58KkhDomQtYXookl7U6ajEKfETHE1nWaRN0/gzOUI4z4bMwjPWQ6R2G4
         zVR7MS6jsimbRTLQK965Ww+Cp//ng+4aqqoiGzs9geOb61x+qHK6AUxwcP2HuU1S8dLP
         OEv3lAQzqQIPWit38K3OJmKJ+ONf/s2+d2jSKX83GtbI8ZYL+/awT6qOEcyz2uNC8LpH
         kbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0vYZtvNiMw5LFIFKa+iHi1yqO9mFLTJ7LRF4fjft6YQ=;
        b=ph0q+awQDE3exOaO8G5qm9IW5oOTgYaZe3T8WJESdSGyYH3CfleSwtNLmkVV3xhO/m
         MnTOhzfl68N4H0uSi0+UgamJAkfc1sqKnM+WwEUily83FecNKXY8OqK+pFEhfkSL74DD
         G35eLW0QJwUimf+VM15VDfANbS0ugEroQVmtrwBR9Q8arCZrQ5BqQMThomzV1yR4o1/U
         rCpc3CuKfoBK2kmUrCJmIEeLNzvN4lrxvzwds+Te93YKKNAQzicjzUI84ow//T/W7P3w
         0qEKfdWNdt2OeyXkQy6AyLAkgFsrDmNosE/On8t8OL/wp79mDnVHRE8yc5z3BwmFwqSD
         5spw==
X-Gm-Message-State: AOAM5316QYADOnSauv0aX7OtPFwXPhMT1qoxGzcsd7QOTp8E6EyOalVu
        sZHKJtpnP0gBn5b6iplFKn7KgOGq9rIrM28fAyWpqg==
X-Google-Smtp-Source: ABdhPJx4P+f9DA00o4x+xqsn5YNYZSrsnifEZc+MXGWM1Q+GQ6+KAVyhHfpoUwDaYub8VfOW5n9UfKxOSH6ZQNhne0KQ9w==
X-Received: by 2002:a25:99c8:: with SMTP id q8mr7798153ybo.3.1593205771432;
 Fri, 26 Jun 2020 14:09:31 -0700 (PDT)
Date:   Fri, 26 Jun 2020 14:09:09 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-5-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 04/12] arch: powerpc: add linker section for KUnit test suites
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

Add a linker section to powerpc where KUnit can put references to its test
suites. This patch is an early step in transitioning to dispatching all
KUnit tests from a centralized executor rather than having each as its
own separate late_initcall.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 326e113d2e456..0cc97dbfde0ad 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -202,6 +202,10 @@ SECTIONS
 		CON_INITCALL
 	}
 
+	.kunit_test_suites : {
+		KUNIT_TEST_SUITES
+	}
+
 	. = ALIGN(8);
 	__ftr_fixup : AT(ADDR(__ftr_fixup) - LOAD_OFFSET) {
 		__start___ftr_fixup = .;
-- 
2.27.0.212.ge8ba1cc988-goog

