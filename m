Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E8C2C6633
	for <lists+linux-doc@lfdr.de>; Fri, 27 Nov 2020 14:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729765AbgK0NBr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Nov 2020 08:01:47 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36498 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgK0NBr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:47 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Y-00CcJX-FY; Fri, 27 Nov 2020 12:44:02 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 12:01:54 +0000
Subject: [git:media_tree/master] media: Documentation/driver-api: media/v4l2-controls: drop doubled words
To:     linuxtv-commits@linuxtv.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Y-00CcJX-FY@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation/driver-api: media/v4l2-controls: drop doubled words
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 05:45:01 2020 +0200

Drop the doubled words "type" and "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/driver-api/media/v4l2-controls.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

---

diff --git a/Documentation/driver-api/media/v4l2-controls.rst b/Documentation/driver-api/media/v4l2-controls.rst
index 77f42ea3bac7..b2e91804829b 100644
--- a/Documentation/driver-api/media/v4l2-controls.rst
+++ b/Documentation/driver-api/media/v4l2-controls.rst
@@ -335,7 +335,7 @@ current and new values:
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 
-If the control has a simple s32 type type, then:
+If the control has a simple s32 type, then:
 
 .. code-block:: c
 
@@ -349,7 +349,7 @@ Within the control ops you can freely use these. The val and cur.val speak for
 themselves. The p_char pointers point to character buffers of length
 ctrl->maximum + 1, and are always 0-terminated.
 
-Unless the control is marked volatile the p_cur field points to the the
+Unless the control is marked volatile the p_cur field points to the
 current cached control value. When you create a new control this value is made
 identical to the default value. After calling v4l2_ctrl_handler_setup() this
 value is passed to the hardware. It is generally a good idea to call this
