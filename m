Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D986024047B
	for <lists+linux-doc@lfdr.de>; Mon, 10 Aug 2020 12:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgHJKJI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Aug 2020 06:09:08 -0400
Received: from sym2.noone.org ([178.63.92.236]:53856 "EHLO sym2.noone.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbgHJKJI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Aug 2020 06:09:08 -0400
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 4BQBWk1r1VzvjcZ; Mon, 10 Aug 2020 12:09:06 +0200 (CEST)
From:   Tobias Klauser <tklauser@distanz.ch>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/features: refresh powerpc arch support files
Date:   Mon, 10 Aug 2020 12:09:06 +0200
Message-Id: <20200810100906.3805-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Support for these was added by commit aa65ff6b18e0 ("powerpc/64s:
Implement queued spinlocks and rwlocks").

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 Documentation/features/locking/queued-rwlocks/arch-support.txt  | 2 +-
 .../features/locking/queued-spinlocks/arch-support.txt          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/features/locking/queued-rwlocks/arch-support.txt b/Documentation/features/locking/queued-rwlocks/arch-support.txt
index 5c6bcfcf8e1f..4dd5e554873f 100644
--- a/Documentation/features/locking/queued-rwlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-rwlocks/arch-support.txt
@@ -22,7 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: |  ok  |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
     |          sh: | TODO |
diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
index b55e420a34ea..b16d4f71e5ce 100644
--- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
@@ -22,7 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: |  ok  |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
     |          sh: | TODO |
-- 
2.27.0

