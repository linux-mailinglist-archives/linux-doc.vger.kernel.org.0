Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717BA50474E
	for <lists+linux-doc@lfdr.de>; Sun, 17 Apr 2022 11:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbiDQJIj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 17 Apr 2022 05:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiDQJIi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Apr 2022 05:08:38 -0400
X-Greylist: delayed 1685 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 17 Apr 2022 02:06:03 PDT
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566F327CDE
        for <linux-doc@vger.kernel.org>; Sun, 17 Apr 2022 02:06:03 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Kh4153PvZz9sS3;
        Sun, 17 Apr 2022 11:06:01 +0200 (CEST)
Date:   Sun, 17 Apr 2022 11:05:55 +0200
From:   Andreas-Christian Hagau <ach@hagau.se>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH PROPER] Documentation: kunit: change complete_and_exit to
 kthread_complete_and_exit
Message-ID: <20220417110532.c0580c358f@2b220eea1db5e11>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit cead18552660 ("exit: Rename complete_and_exit to
kthread_complete_and_exit") renamed complete_and_exit to
kthread_complete_and_exit.

CC: Brendan Higgins <brendanhiggins@google.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-kselftest@vger.kernel.org
CC: kunit-dev@googlegroups.com
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
Signed-off-by: Andreas-Christian Hagau <ach@hagau.se>
---
 Documentation/dev-tools/kunit/architecture.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/architecture.rst b/Documentation/dev-tools/kunit/architecture.rst
index ff9c85a0bff21..cf9e6e3eeae4c 100644
--- a/Documentation/dev-tools/kunit/architecture.rst
+++ b/Documentation/dev-tools/kunit/architecture.rst
@@ -125,7 +125,7 @@ All expectations/assertions are formatted as:
 		  ``void __noreturn kunit_try_catch_throw(struct kunit_try_catch *try_catch)``.
 
 		- ``kunit_try_catch_throw`` calls function:
-		  ``void complete_and_exit(struct completion *, long) __noreturn;``
+		  ``void kthread_complete_and_exit(struct completion *, long) __noreturn;``
 		  and terminates the special thread context.
 
 - ``<op>`` denotes a check with options: ``TRUE`` (supplied property
-- 
2.35.1

