Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D92D2C6637
	for <lists+linux-doc@lfdr.de>; Fri, 27 Nov 2020 14:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgK0NBy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Nov 2020 08:01:54 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36506 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729802AbgK0NBy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:54 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Z-00CcMM-3A; Fri, 27 Nov 2020 12:44:03 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 11:51:30 +0000
Subject: [git:media_tree/master] media: Documentation: userspace-api/media: v4l/vidioc-g-output: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Z-00CcMM-3A@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation: userspace-api/media: v4l/vidioc-g-output: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 01:55:35 2020 +0200

Drop the doubled word "standard.".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/userspace-api/media/v4l/vidioc-g-output.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-output.rst b/Documentation/userspace-api/media/v4l/vidioc-g-output.rst
index 3138c4cc8fe3..dbcdd51dd2a8 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-output.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-output.rst
@@ -46,7 +46,7 @@ To select a video output applications store the number of the desired
 output in an integer and call the :ref:`VIDIOC_S_OUTPUT <VIDIOC_G_OUTPUT>` ioctl with a
 pointer to this integer. Side effects are possible. For example outputs
 may support different video standards, so the driver may implicitly
-switch the current standard. standard. Because of these possible side
+switch the current standard. Because of these possible side
 effects applications must select an output before querying or
 negotiating any other parameters.
 
