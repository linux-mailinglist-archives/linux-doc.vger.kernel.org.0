Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A8A2C662F
	for <lists+linux-doc@lfdr.de>; Fri, 27 Nov 2020 14:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbgK0NBh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Nov 2020 08:01:37 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36480 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728963AbgK0NBh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:37 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Y-00CcIs-BT; Fri, 27 Nov 2020 12:44:02 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 12:03:46 +0000
Subject: [git:media_tree/master] media: Documentation/driver-api: media/dtv-frontend: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Y-00CcIs-BT@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation/driver-api: media/dtv-frontend: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 05:44:54 2020 +0200

Drop the doubled word "errors".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/driver-api/media/dtv-frontend.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

---

diff --git a/Documentation/driver-api/media/dtv-frontend.rst b/Documentation/driver-api/media/dtv-frontend.rst
index 91f77fe58e83..ea43cdb5b0e4 100644
--- a/Documentation/driver-api/media/dtv-frontend.rst
+++ b/Documentation/driver-api/media/dtv-frontend.rst
@@ -244,7 +244,7 @@ Carrier Signal to Noise ratio (:ref:`DTV-STAT-CNR`)
     Having it available after inner FEC is more common.
 
 Bit counts post-FEC (:ref:`DTV-STAT-POST-ERROR-BIT-COUNT` and :ref:`DTV-STAT-POST-TOTAL-BIT-COUNT`)
-  - Those counters measure the number of bits and bit errors errors after
+  - Those counters measure the number of bits and bit errors after
     the forward error correction (FEC) on the inner coding block
     (after Viterbi, LDPC or other inner code).
 
@@ -253,7 +253,7 @@ Bit counts post-FEC (:ref:`DTV-STAT-POST-ERROR-BIT-COUNT` and :ref:`DTV-STAT-POS
     see :c:type:`fe_status`).
 
 Bit counts pre-FEC (:ref:`DTV-STAT-PRE-ERROR-BIT-COUNT` and :ref:`DTV-STAT-PRE-TOTAL-BIT-COUNT`)
-  - Those counters measure the number of bits and bit errors errors before
+  - Those counters measure the number of bits and bit errors before
     the forward error correction (FEC) on the inner coding block
     (before Viterbi, LDPC or other inner code).
 
@@ -263,7 +263,7 @@ Bit counts pre-FEC (:ref:`DTV-STAT-PRE-ERROR-BIT-COUNT` and :ref:`DTV-STAT-PRE-T
     after ``FE_HAS_VITERBI``, see :c:type:`fe_status`).
 
 Block counts (:ref:`DTV-STAT-ERROR-BLOCK-COUNT` and :ref:`DTV-STAT-TOTAL-BLOCK-COUNT`)
-  - Those counters measure the number of blocks and block errors errors after
+  - Those counters measure the number of blocks and block errors after
     the forward error correction (FEC) on the inner coding block
     (before Viterbi, LDPC or other inner code).
 
