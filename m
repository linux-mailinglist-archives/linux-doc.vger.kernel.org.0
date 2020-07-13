Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9249B218CC6
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2020 18:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgGHQSs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jul 2020 12:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbgGHQSs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 12:18:48 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D67C061A0B;
        Wed,  8 Jul 2020 09:18:48 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id B948FBC116;
        Wed,  8 Jul 2020 16:18:45 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     oberpar@linux.ibm.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Replace HTTP links with HTTPS ones: GCOV BASED KERNEL PROFILING
Date:   Wed,  8 Jul 2020 18:18:39 +0200
Message-Id: <20200708161839.15170-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 Documentation/dev-tools/gcov.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/gcov.rst b/Documentation/dev-tools/gcov.rst
index 7bd013596217..9e989baae154 100644
--- a/Documentation/dev-tools/gcov.rst
+++ b/Documentation/dev-tools/gcov.rst
@@ -22,7 +22,7 @@ Possible uses:
 * minimizing kernel configurations (do I need this option if the
   associated code is never run?)
 
-.. _gcov: http://gcc.gnu.org/onlinedocs/gcc/Gcov.html
+.. _gcov: https://gcc.gnu.org/onlinedocs/gcc/Gcov.html
 .. _lcov: http://ltp.sourceforge.net/coverage/lcov.php
 
 
@@ -171,7 +171,7 @@ Note on compilers
 GCC and LLVM gcov tools are not necessarily compatible. Use gcov_ to work with
 GCC-generated .gcno and .gcda files, and use llvm-cov_ for Clang.
 
-.. _gcov: http://gcc.gnu.org/onlinedocs/gcc/Gcov.html
+.. _gcov: https://gcc.gnu.org/onlinedocs/gcc/Gcov.html
 .. _llvm-cov: https://llvm.org/docs/CommandGuide/llvm-cov.html
 
 Build differences between GCC and Clang gcov are handled by Kconfig. It
-- 
2.27.0

