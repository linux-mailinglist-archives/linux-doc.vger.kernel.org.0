Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551D72C6632
	for <lists+linux-doc@lfdr.de>; Fri, 27 Nov 2020 14:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbgK0NBp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Nov 2020 08:01:45 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36496 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgK0NBp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:45 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Y-00CcJE-DT; Fri, 27 Nov 2020 12:44:02 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 12:02:46 +0000
Subject: [git:media_tree/master] media: Documentation/driver-api: media/v4l2-dev: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Y-00CcJE-DT@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation/driver-api: media/v4l2-dev: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 05:44:55 2020 +0200

Drop the doubled word "device".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/driver-api/media/v4l2-dev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/Documentation/driver-api/media/v4l2-dev.rst b/Documentation/driver-api/media/v4l2-dev.rst
index 666330af31ed..99e3b5fa7444 100644
--- a/Documentation/driver-api/media/v4l2-dev.rst
+++ b/Documentation/driver-api/media/v4l2-dev.rst
@@ -212,7 +212,7 @@ types exist:
 ========================== ====================	 ==============================
 
 The last argument gives you a certain amount of control over the device
-device node number used (i.e. the X in ``videoX``). Normally you will pass -1
+node number used (i.e. the X in ``videoX``). Normally you will pass -1
 to let the v4l2 framework pick the first free number. But sometimes users
 want to select a specific node number. It is common that drivers allow
 the user to select a specific device node number through a driver module
