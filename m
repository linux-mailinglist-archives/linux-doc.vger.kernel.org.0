Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19822168CD
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2020 11:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgGGJJZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Jul 2020 05:09:25 -0400
Received: from sym2.noone.org ([178.63.92.236]:52872 "EHLO sym2.noone.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgGGJJY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 7 Jul 2020 05:09:24 -0400
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 4B1GpV39nBzvjcX; Tue,  7 Jul 2020 11:09:22 +0200 (CEST)
From:   Tobias Klauser <tklauser@distanz.ch>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/features: Remove unicore32 from kcov and kmemleak
Date:   Tue,  7 Jul 2020 11:09:22 +0200
Message-Id: <20200707090922.4746-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 3839a7460721 ("Documentation/features: Add kcov") and
commit 4641961cff2f ("Documentation/features: Add kmemleak") were added
shortly after the unicore32 port was removed in commit fb37409a01b0
("arch: remove unicore32 port"). Remove the unicore32 feature lines from
kcov and kmemleak as well.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 Documentation/features/debug/kcov/arch-support.txt     | 1 -
 Documentation/features/debug/kmemleak/arch-support.txt | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/features/debug/kcov/arch-support.txt b/Documentation/features/debug/kcov/arch-support.txt
index 52f23baca45d..ab0ee1c933c2 100644
--- a/Documentation/features/debug/kcov/arch-support.txt
+++ b/Documentation/features/debug/kcov/arch-support.txt
@@ -28,7 +28,6 @@
     |          sh: | TODO |
     |       sparc: | TODO |
     |          um: |  ok  |
-    |   unicore32: | TODO |
     |         x86: |  ok  |
     |      xtensa: | TODO |
     -----------------------
diff --git a/Documentation/features/debug/kmemleak/arch-support.txt b/Documentation/features/debug/kmemleak/arch-support.txt
index d7a0b05c3bf8..b7e4f3608838 100644
--- a/Documentation/features/debug/kmemleak/arch-support.txt
+++ b/Documentation/features/debug/kmemleak/arch-support.txt
@@ -28,7 +28,6 @@
     |          sh: |  ok  |
     |       sparc: |  ok  |
     |          um: |  ok  |
-    |   unicore32: | TODO |
     |         x86: |  ok  |
     |      xtensa: |  ok  |
     -----------------------
-- 
2.27.0

