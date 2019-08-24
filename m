Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13DD79BAA7
	for <lists+linux-doc@lfdr.de>; Sat, 24 Aug 2019 03:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfHXBgB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 23 Aug 2019 21:36:01 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:41125 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfHXBe7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Aug 2019 21:34:59 -0400
Received: by mail-pf1-f201.google.com with SMTP id 191so1630185pfz.8
        for <linux-doc@vger.kernel.org>; Fri, 23 Aug 2019 18:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=jaLMQno2Ebqgr4Mv8vNWz/EEBwUpKviBFEGImDCb0Hs=;
        b=f8H53a2tmaRVR+1PJzJmfieaxzNc93W/5OvfTk/11u92tAINu1c6dz5memScfayl9C
         /tOrEOoGpLi/C5p9pT0zjbFqBXJ1yt4gWwTFok7LGc1a1E6deXwepr7PJ/AAN8LubPTb
         rL06b+afh8wx2tiEm5oZHM3SyD+jwulLnT2rmJryn3phHAQdr7ngX4D1v3Vnj0dX7bT+
         YiVLX9AQacwGS12YvebGUhnHjSDGGKgFIHvblEL5gh3CDBw/CFbz1nQAj38SKMd85db+
         AP8UcIz6dua15nLdCZfgfFXdwzTpJMsXZZnjUFxYXmZ6se3sUARfroFkhlHMrLpMAjkb
         098w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=jaLMQno2Ebqgr4Mv8vNWz/EEBwUpKviBFEGImDCb0Hs=;
        b=AyoJkhaoTk9QjBrimqDYYTYJTySXNxi9IMRhKa+fm4E7vaQpUAnq2pYj9lJq0GICTo
         FaFj+UvUMugvNX2+ip0fmmpaNWDWy+qh3+o3eRoiCWp6I4a6ZzsyohPajFt7AlUFWbCB
         ThKmMFZfhmvvCViqiOgaLdTul1SO9Xv/QyXw3hfX7PflqtCMJ4WskQtla0NJrP6b871u
         2CDkld9ovkSXXzLaopV3AqAUypFb7qqkYN74JprDuy7JDLuTs5lq2mFnxX2Ap3AshX6j
         ombfj2CBuo7gt3aqMds2CimNChKZaJZ+0ZsuAfv1C57aYjtnZD0jLc6HXEayd4C6p6IC
         xaqg==
X-Gm-Message-State: APjAAAWZsW7Dh1uRXG4Xl2piZIFxODOtTGrzCFmsXxvsq1hyKUOoW+sy
        g2HMJvB9qz2iONM6ZWUX7fEYJNEqbSU9/e6hBSlzRg==
X-Google-Smtp-Source: APXvYqwwY0z16/Y5LFe1Kr5SFliVwpKhegFAUuIw0n+JTAXCBngAGiksy37d5bPtQpg+dxcki1Cv+Q34b9f8TsIeql59jA==
X-Received: by 2002:a65:5b8e:: with SMTP id i14mr6412981pgr.188.1566610497783;
 Fri, 23 Aug 2019 18:34:57 -0700 (PDT)
Date:   Fri, 23 Aug 2019 18:34:15 -0700
In-Reply-To: <20190824013425.175645-1-brendanhiggins@google.com>
Message-Id: <20190824013425.175645-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190824013425.175645-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v15 08/18] objtool: add kunit_try_catch_throw to the noreturn list
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
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the following warning seen on GCC 7.3:
  kunit/test-test.o: warning: objtool: kunit_test_unsuccessful_try() falls through to next function kunit_test_catch()

kunit_try_catch_throw is a function added in the following patch in this
series; it allows KUnit, a unit testing framework for the kernel, to
bail out of a broken test. As a consequence, it is a new __noreturn
function that objtool thinks is broken (as seen above). So fix this
warning by adding kunit_try_catch_throw to objtool's noreturn list.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://www.spinics.net/lists/linux-kbuild/msg21708.html
Cc: Peter Zijlstra <peterz@infradead.org>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 176f2f084060..0c8e17f946cd 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -145,6 +145,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"usercopy_abort",
 		"machine_real_restart",
 		"rewind_stack_do_exit",
+		"kunit_try_catch_throw",
 	};
 
 	if (!func)
-- 
2.23.0.187.g17f5b7556c-goog

