Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1841B46C6
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2020 16:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgDVOEG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Apr 2020 10:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgDVOEG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Apr 2020 10:04:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70941C03C1A9
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2020 07:04:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 2FA982A1BE4
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     linux-doc@vger.kernel.org, corbet@lwn.net, pmladek@suse.com
Cc:     kernel@collabora.com
Subject: [PATCH] docs: printk-basics: update the pr_debug() kerneldoc
Date:   Wed, 22 Apr 2020 16:03:34 +0200
Message-Id: <20200422140334.23595-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This updates the kerneldoc comment for the pr_debug() macro to describe
the new set of kernel config options it's affected by.

It also simplifies the description of the pr_debug() and pr_devel()
macros in printk-basics.rst, forwarding the reader to the function
reference.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
Some background:

The previous patch I sent to add kerneldocs to printk.h:
https://lore.kernel.org/linux-doc/20200420171544.3c443e36@lwn.net/

conflicted with this other patch:
https://lkml.org/lkml/2020/4/20/1320

during the manual linux-next merge. Stephen Rothwell fixed the conflict
but the description of what pr_debug() does needed to be updated to
reflect the changes introduced in the patch by Orson Zhai.

Tested on linux-next with make htmldocs and make pdfdocs.

 Documentation/core-api/printk-basics.rst | 4 ++--
 include/linux/printk.h                   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-api/printk-basics.rst
index 563a9ce5fe1d..84c853e17200 100644
--- a/Documentation/core-api/printk-basics.rst
+++ b/Documentation/core-api/printk-basics.rst
@@ -100,8 +100,8 @@ would prefix every pr_*() message in that file with the module and function name
 that originated the message.
 
 For debugging purposes there are also two conditionally-compiled macros:
-pr_debug() and pr_devel(), which are compiled-out unless ``DEBUG`` (or
-also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.
+pr_debug() and pr_devel(), which are compiled-out depending on the kernel
+configuration options (See the function reference below for more info).
 
 
 Function reference
diff --git a/include/linux/printk.h b/include/linux/printk.h
index 768ac6bc637d..dab23bcbdeb0 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -408,9 +408,10 @@ extern int kptr_restrict;
  * @fmt: format string
  * @...: arguments for the format string
  *
- * This macro expands to dynamic_pr_debug() if CONFIG_DYNAMIC_DEBUG is
- * set. Otherwise, if DEBUG is defined, it's equivalent to a printk with
- * KERN_DEBUG loglevel. If DEBUG is not defined it does nothing.
+ * This macro expands to dynamic_pr_debug() if CONFIG_DYNAMIC_DEBUG is set or if
+ * CONFIG_DYNAMIC_DEBUG_CORE and DYNAMIC_DEBUG_MODULE are both set.  Otherwise,
+ * if DEBUG is defined, it's equivalent to a printk with KERN_DEBUG loglevel.
+ * If none of the above is defined it does nothing.
  *
  * It uses pr_fmt() to generate the format string (dynamic_pr_debug() uses
  * pr_fmt() internally).
-- 
2.18.0

