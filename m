Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D3C2C6636
	for <lists+linux-doc@lfdr.de>; Fri, 27 Nov 2020 14:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbgK0NBw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Nov 2020 08:01:52 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36504 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgK0NBw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:52 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Z-00CcOI-HP; Fri, 27 Nov 2020 12:44:03 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 11:49:43 +0000
Subject: [git:media_tree/master] media: Documentation: userspace-api/media: dvb/ca: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Z-00CcOI-HP@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation: userspace-api/media: dvb/ca: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 01:55:27 2020 +0200

Drop the doubled word "and".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/userspace-api/media/dvb/ca.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/Documentation/userspace-api/media/dvb/ca.rst b/Documentation/userspace-api/media/dvb/ca.rst
index 6f6821e322a9..0dc00e5e4a8c 100644
--- a/Documentation/userspace-api/media/dvb/ca.rst
+++ b/Documentation/userspace-api/media/dvb/ca.rst
@@ -7,7 +7,7 @@ Digital TV CA Device
 ####################
 
 The Digital TV CA device controls the conditional access hardware. It
-can be accessed through ``/dev/dvb/adapter?/ca?``. Data types and and ioctl
+can be accessed through ``/dev/dvb/adapter?/ca?``. Data types and ioctl
 definitions can be accessed by including ``linux/dvb/ca.h`` in your
 application.
 
