Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1062C6630
	for <lists+linux-doc@lfdr.de>; Fri, 27 Nov 2020 14:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbgK0NBj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Nov 2020 08:01:39 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36482 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728963AbgK0NBi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:38 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Z-00CcNu-Ed; Fri, 27 Nov 2020 12:44:03 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 11:50:06 +0000
Subject: [git:media_tree/master] media: Documentation: userspace-api/media: dvb/demux: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Z-00CcNu-Ed@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation: userspace-api/media: dvb/demux: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 01:55:28 2020 +0200

Drop the doubled word "and".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/userspace-api/media/dvb/demux.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/Documentation/userspace-api/media/dvb/demux.rst b/Documentation/userspace-api/media/dvb/demux.rst
index 364ef48472ee..ef05abcf14d1 100644
--- a/Documentation/userspace-api/media/dvb/demux.rst
+++ b/Documentation/userspace-api/media/dvb/demux.rst
@@ -11,7 +11,7 @@ digital TV. If the driver and hardware supports, those filters are
 implemented at the hardware. Otherwise, the Kernel provides a software
 emulation.
 
-It can be accessed through ``/dev/adapter?/demux?``. Data types and and
+It can be accessed through ``/dev/adapter?/demux?``. Data types and
 ioctl definitions can be accessed by including ``linux/dvb/dmx.h`` in
 your application.
 
