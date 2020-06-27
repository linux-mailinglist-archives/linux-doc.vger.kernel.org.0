Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2522F20C071
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2020 11:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgF0JUf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 27 Jun 2020 05:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgF0JUf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Jun 2020 05:20:35 -0400
X-Greylist: delayed 321 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 27 Jun 2020 02:20:35 PDT
Received: from sym2.noone.org (sym2.noone.org [IPv6:2a01:4f8:120:4161::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6DCC03E979
        for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2020 02:20:35 -0700 (PDT)
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 49v7Pp69Y1zvjc1; Sat, 27 Jun 2020 11:15:10 +0200 (CEST)
From:   Tobias Klauser <tklauser@distanz.ch>
To:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/features: Add kmemleak
Date:   Sat, 27 Jun 2020 11:15:10 +0200
Message-Id: <20200627091510.28210-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Replace the manually curated list for supported archs in
Documentation/dev-tools/kmemleak.rst by a Documentation/features entry.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 Documentation/dev-tools/kmemleak.rst          |  2 --
 .../features/debug/kmemleak/arch-support.txt  | 34 +++++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/features/debug/kmemleak/arch-support.txt

diff --git a/Documentation/dev-tools/kmemleak.rst b/Documentation/dev-tools/kmemleak.rst
index fce262883984..a41a2d238af2 100644
--- a/Documentation/dev-tools/kmemleak.rst
+++ b/Documentation/dev-tools/kmemleak.rst
@@ -8,8 +8,6 @@ with the difference that the orphan objects are not freed but only
 reported via /sys/kernel/debug/kmemleak. A similar method is used by the
 Valgrind tool (``memcheck --leak-check``) to detect the memory leaks in
 user-space applications.
-Kmemleak is supported on x86, arm, arm64, powerpc, sparc, sh, microblaze, mips,
-s390, nds32, arc and xtensa.
 
 Usage
 -----
diff --git a/Documentation/features/debug/kmemleak/arch-support.txt b/Documentation/features/debug/kmemleak/arch-support.txt
new file mode 100644
index 000000000000..d7a0b05c3bf8
--- /dev/null
+++ b/Documentation/features/debug/kmemleak/arch-support.txt
@@ -0,0 +1,34 @@
+#
+# Feature name:          kmemleak
+#         Kconfig:       HAVE_DEBUG_KMEMLEAK
+#         description:   arch supports the kernel memory leak detector
+#
+    -----------------------
+    |         arch |status|
+    -----------------------
+    |       alpha: | TODO |
+    |         arc: |  ok  |
+    |         arm: |  ok  |
+    |       arm64: |  ok  |
+    |         c6x: | TODO |
+    |        csky: | TODO |
+    |       h8300: | TODO |
+    |     hexagon: | TODO |
+    |        ia64: | TODO |
+    |        m68k: | TODO |
+    |  microblaze: |  ok  |
+    |        mips: |  ok  |
+    |       nds32: |  ok  |
+    |       nios2: | TODO |
+    |    openrisc: | TODO |
+    |      parisc: | TODO |
+    |     powerpc: |  ok  |
+    |       riscv: | TODO |
+    |        s390: |  ok  |
+    |          sh: |  ok  |
+    |       sparc: |  ok  |
+    |          um: |  ok  |
+    |   unicore32: | TODO |
+    |         x86: |  ok  |
+    |      xtensa: |  ok  |
+    -----------------------
-- 
2.27.0

