Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12092194753
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2020 20:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbgCZTRQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Mar 2020 15:17:16 -0400
Received: from balrog.mythic-beasts.com ([46.235.227.24]:41029 "EHLO
        balrog.mythic-beasts.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgCZTRQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Mar 2020 15:17:16 -0400
Received: from 141.226.115.87.dyn.plus.net ([87.115.226.141]:49586 helo=slartibartfast.quignogs.org.uk)
        by balrog.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <peter@bikeshed.quignogs.org.uk>)
        id 1jHY09-00037G-H8; Thu, 26 Mar 2020 19:17:13 +0000
From:   peter@bikeshed.quignogs.org.uk
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Lister <peter@bikeshed.quignogs.org.uk>
Subject: [PATCH v2 1/1] A compact idiom to add code examples in kerneldoc comments.
Date:   Thu, 26 Mar 2020 19:16:28 +0000
Message-Id: <20200326191628.10052-2-peter@bikeshed.quignogs.org.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326191628.10052-1-peter@bikeshed.quignogs.org.uk>
References: <20200311133027.2c77f348@lwn.net>
 <20200326191628.10052-1-peter@bikeshed.quignogs.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Peter Lister <peter@bikeshed.quignogs.org.uk>

scripts/kernel-doc - When a double colon follows a section heading
(e.g. Example::), write a double colon line to the ReST output to make
the following text (e.g. a code snippet) into a literal block.

drivers/base/platform.c - Changed Example: headings to Example:: to
literalise code snippets as above.

This patch also removes two kerneldoc build warnings:
./drivers/base/platform.c:134: WARNING: Unexpected indentation.
./drivers/base/platform.c:213: WARNING: Unexpected indentation.

Signed-off-by: Peter Lister <peter@bikeshed.quignogs.org.uk>
---
 drivers/base/platform.c |  4 ++--
 scripts/kernel-doc      | 19 +++++++++++++++----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b5ce7b085795..47f4a9b410b2 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -128,7 +128,7 @@ EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_byname);
  * request_irq() APIs. This is the same as platform_get_irq(), except that it
  * does not print an error message if an IRQ can not be obtained.
  *
- * Example:
+ * Example::
  *		int irq = platform_get_irq_optional(pdev, 0);
  *		if (irq < 0)
  *			return irq;
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(platform_get_irq_optional);
  * IRQ fails. Device drivers should check the return value for errors so as to
  * not pass a negative integer value to the request_irq() APIs.
  *
- * Example:
+ * Example::
  *		int irq = platform_get_irq(pdev, 0);
  *		if (irq < 0)
  *			return irq;
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index f2d73f04e71d..b0da150e3fb9 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -362,7 +362,7 @@ my $doc_com_body = '\s*\* ?';
 my $doc_decl = $doc_com . '(\w+)';
 # @params and a strictly limited set of supported section names
 my $doc_sect = $doc_com .
-    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:(.*)';
+    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:(:?)(.*)';
 my $doc_content = $doc_com_body . '(.*)';
 my $doc_block = $doc_com . 'DOC:\s*(.*)?';
 my $doc_inline_start = '^\s*/\*\*\s*$';
@@ -1952,11 +1952,22 @@ sub process_body($$) {
 	    ++$warnings;
 	}
     }
-
+    # $doc_sect is a regex which searches for section names.
+    # If it matches:
+    #   $1 is the section name
+    #   $2 is a colon if the section name was followed by a double colon.
+    #   $3 the rest of the content after the colon (or double colon).
     if (/$doc_sect/i) { # case insensitive for supported section names
 	$newsection = $1;
-	$newcontents = $2;
-
+	# If $2 is ':', the section name was followed by a double
+	# colon, so insert a containing just '::' to make the
+	# following block into a ReST literal.  This idiom is useful
+	# for an Example section introducing a code snippet.
+	if ($2 eq ':') {
+	    $newcontents = "::\n" . $3;
+	} else {
+	    $newcontents = $3;
+	}
 	# map the supported section names to the canonical names
 	if ($newsection =~ m/^description$/i) {
 	    $newsection = $section_default;
-- 
2.25.1

