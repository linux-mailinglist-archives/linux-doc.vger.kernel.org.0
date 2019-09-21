Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D482B9B93
	for <lists+linux-doc@lfdr.de>; Sat, 21 Sep 2019 02:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437174AbfIUAU4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 20 Sep 2019 20:20:56 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:53444 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436963AbfIUATW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Sep 2019 20:19:22 -0400
Received: by mail-qt1-f202.google.com with SMTP id c8so10107431qtd.20
        for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2019 17:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XOGsKwy33nriWO2piNArgCsTjyMNHJTJvDyvFgo5s6U=;
        b=Sgz7213+qbN86RpnjYxwE7eAvRTa0YN6r1fXC9nQwi+bQLfmJ0RS4WpN0N81z/odi6
         XGU7gCUSbBUdgle5NaqiHXybHGODmoKDWh/0HAkn64T1Co7SCCYmXUpCIrrnRh6Jb2Ll
         XjhlpTMqtnLolZQwP4aDBcCgL59XhMxAa5lJCd2J1Bs9Ujfs0mesiC80xjKZ798sbyV+
         vVOclVVTpXfND0vcjZ+oQRPMBJniMNy5trFLGfHLvvfXmpzxMSeWVg1bhaD800YWS3Zv
         cO7oaTS4ubnNeNZIACnRD79K40w8Hjvmr0YhQlHzIcQKEkRRSV52zVfDjQ/PSTjPN9NX
         xkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XOGsKwy33nriWO2piNArgCsTjyMNHJTJvDyvFgo5s6U=;
        b=FntZfmoQEfs6SdEjh9ZJPUgh1JmQFLV08jWy5UmisuSiTlWP6t866iyF9CFVi/aJh0
         lk1DyiEuYcVai+BXT4rv7wQkwegxWAfv4hSn3PKRivj03Zp9dXd8xPJJmbZJ4J9rraZr
         LD9y+q2Oaq38VcZlgmg5G/ddyS6IIzqxXvkfNn6/n8rA+4KZz64E1Z4U7bmaPbyAmC9g
         w29TNA48WdkS3TJVz7UYnyU08XfYyx57KJB+CyAfEOIZlPAPgucphcG1sXJQhR//hxjh
         S4HPapgXzKbqbfuScciWfpIAR2q5m+zAFlPzD4uvtNWqTa/n0J2hwsqc6mljq0frdFom
         XnEg==
X-Gm-Message-State: APjAAAUrzBt84oIXC4h9nMSkqsXvC4S4NK/gVnYgI0evKnhnHp+rTmLE
        QO8mZBzPROqiUnQhu+Om6/A3CUQDBmVnIeGfJ41Z5g==
X-Google-Smtp-Source: APXvYqyhYc2gzw2zw7hNHJ45JP5rJlx8noEcdat85g5q14wTmwmkyJ6JmxX9AzFR4w2ah2LgF306gHYAybhUcuUrVrOySQ==
X-Received: by 2002:a0c:9792:: with SMTP id l18mr12691255qvd.79.1569025161226;
 Fri, 20 Sep 2019 17:19:21 -0700 (PDT)
Date:   Fri, 20 Sep 2019 17:18:42 -0700
In-Reply-To: <20190921001855.200947-1-brendanhiggins@google.com>
Message-Id: <20190921001855.200947-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190921001855.200947-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v17 06/19] lib: enable building KUnit in lib/
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, torvalds@linux-foundation.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KUnit is a new unit testing framework for the kernel and when used is
built into the kernel as a part of it. Add KUnit to the lib Kconfig and
Makefile to allow it to be actually built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.debug | 2 ++
 lib/Makefile      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5960e2980a8a..1c69640e712f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1681,6 +1681,8 @@ config PROVIDE_OHCI1394_DMA_INIT
 
 	  See Documentation/debugging-via-ohci1394.txt for more information.
 
+source "lib/kunit/Kconfig"
+
 menuconfig RUNTIME_TESTING_MENU
 	bool "Runtime Testing"
 	def_bool y
diff --git a/lib/Makefile b/lib/Makefile
index 29c02a924973..67e79d3724ed 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -96,6 +96,8 @@ obj-$(CONFIG_TEST_MEMINIT) += test_meminit.o
 
 obj-$(CONFIG_TEST_LIVEPATCH) += livepatch/
 
+obj-$(CONFIG_KUNIT) += kunit/
+
 ifeq ($(CONFIG_DEBUG_KOBJECT),y)
 CFLAGS_kobject.o += -DDEBUG
 CFLAGS_kobject_uevent.o += -DDEBUG
-- 
2.23.0.351.gc4317032e6-goog

