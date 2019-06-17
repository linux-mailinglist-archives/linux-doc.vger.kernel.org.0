Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B356747C8B
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jun 2019 10:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbfFQI1N (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Jun 2019 04:27:13 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:51828 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727776AbfFQI1N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jun 2019 04:27:13 -0400
Received: by mail-qt1-f201.google.com with SMTP id a18so8554577qtj.18
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2019 01:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=P7qQxupR077m/rPxlenNGlU3U4VVv+id9WBQp+CCiSA=;
        b=dqLUMwrRZQiMFvm38V0z6iKhsbbQcU8U8N8pSEIsFltqJAqDIL/1dU9s/SknImAoiG
         1jAZQEw1jfjkQsGEKRRwb9c9VUuPvm1EKJpmDRR2Dx395sZirD9rolf3UZGnMkXVT/0g
         B3W+XYMY5/uFttGCyyCOCwERc21fwwPtQ60cuJu7C6FZEa+rCRJoJDWrBrFGXpHe4lpW
         7DlYd2qA6sgsitjocepZeYwQsJtKZWf+m6SkXaSyypkDwrgPqUoUG19PSneUhdkmbpZl
         HjkxdkJ4mI1ik3KnnJs+UUjsWS4abEl/JWsf72O68EzBa7qdBYOno2uD0pv3+2nii6q2
         tKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=P7qQxupR077m/rPxlenNGlU3U4VVv+id9WBQp+CCiSA=;
        b=qUErodlShtySK7giE714BQu0U8VBXj+sx6Ab9ROOGAwx+UQ0h4sSkbKntKPdC1urPY
         IEYLRAzmLHBxtcn92aCx/ExYZVvHIIVRfPeWlE7gHwkWyO6SKp7j4CSuFLSBF+mR6r4G
         r1kJIdE0Gni5P7It5YAiDBpL3quoNxr3AVJuxIvi1I8owc6A4GIdBzUnhZGMKZyo8Hw2
         +Ml1mD2x9db+XvY2ZnoLmsfHEzhY7ewVro1P28BeMN08ZLLdi3zUAtQz2mlbm2di5Nag
         TDfv4tQfYlABKN1q1zmZl0hi4frzf553R/z1IoNIXLfjWhbSaP13IYykkU5Gwaf4sgh4
         u5cA==
X-Gm-Message-State: APjAAAXHOu0zg5cj5cks16XtCTSScZZ4igwuEwFFXPlIxP/nhgfLC6ED
        SGn1uvQsObjYPwf1VEW9Rkq0k3CO9ZuApC1+fwZ3ug==
X-Google-Smtp-Source: APXvYqx0YR1LOvLx8MrLc4kC+IavL77YnqU0ZCY8iQpLJogfIJFPCQppkE8daCg0rbTkPkzwWah6Jy7PTx84UaIsCg506w==
X-Received: by 2002:a37:47d1:: with SMTP id u200mr53840375qka.21.1560760032086;
 Mon, 17 Jun 2019 01:27:12 -0700 (PDT)
Date:   Mon, 17 Jun 2019 01:26:03 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 08/18] objtool: add kunit_try_catch_throw to the noreturn list
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
Link: https://www.spinics.net/lists/linux-kbuild/msg21708.html
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 172f991957269..98db5fe85c797 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -134,6 +134,7 @@ static int __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"usercopy_abort",
 		"machine_real_restart",
 		"rewind_stack_do_exit",
+		"kunit_try_catch_throw",
 	};
 
 	if (func->bind == STB_WEAK)
-- 
2.22.0.410.gd8fdbe21b5-goog

