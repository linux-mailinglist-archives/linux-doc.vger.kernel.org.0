Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82B12C6635
	for <lists+linux-doc@lfdr.de>; Fri, 27 Nov 2020 14:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729779AbgK0NBv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Nov 2020 08:01:51 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36502 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgK0NBv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:51 -0500
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Z-00CcNY-C3; Fri, 27 Nov 2020 12:44:03 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 11:50:26 +0000
Subject: [git:media_tree/master] media: Documentation: userspace-api/media: dvb/dmx-qbuf: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Z-00CcNY-C3@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation: userspace-api/media: dvb/dmx-qbuf: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 01:55:29 2020 +0200

Drop the doubled word "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/userspace-api/media/dvb/dmx-qbuf.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/Documentation/userspace-api/media/dvb/dmx-qbuf.rst b/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
index 17e70143c1b0..1a13a33834db 100644
--- a/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
@@ -50,7 +50,7 @@ by a :ref:`DMX_QUERYBUF` ioctl will do as well.
 When ``DMX_QBUF`` is called with a pointer to this structure, it locks the
 memory pages of the buffer in physical memory, so they cannot be swapped
 out to disk. Buffers remain locked until dequeued, until the
-the device is closed.
+device is closed.
 
 Applications call the ``DMX_DQBUF`` ioctl to dequeue a filled
 (capturing) buffer from the driver's outgoing queue.
