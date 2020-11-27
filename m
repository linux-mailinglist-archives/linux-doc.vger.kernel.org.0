Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF5E2C6627
	for <lists+linux-doc@lfdr.de>; Fri, 27 Nov 2020 14:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgK0NBN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Nov 2020 08:01:13 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36434 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgK0NBN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:01:13 -0500
X-Greylist: delayed 1028 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Nov 2020 08:01:12 EST
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
        (envelope-from <mchehab@linuxtv.org>)
        id 1kid6Y-00CcKi-PP; Fri, 27 Nov 2020 12:44:02 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 27 Nov 2020 11:53:02 +0000
Subject: [git:media_tree/master] media: Documentation: userspace-api/media: dvb/net: drop doubled word
To:     linuxtv-commits@linuxtv.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1kid6Y-00CcKi-PP@www.linuxtv.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: Documentation: userspace-api/media: dvb/net: drop doubled word
Author:  Randy Dunlap <rdunlap@infradead.org>
Date:    Sat Jul 4 01:55:30 2020 +0200

Drop the doubled word "and".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/userspace-api/media/dvb/net.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

diff --git a/Documentation/userspace-api/media/dvb/net.rst b/Documentation/userspace-api/media/dvb/net.rst
index 33368f5150c5..020a023d3b61 100644
--- a/Documentation/userspace-api/media/dvb/net.rst
+++ b/Documentation/userspace-api/media/dvb/net.rst
@@ -23,7 +23,7 @@ types that are present on the transport stream. This is done through
 virtual ``dvb?_?`` network interfaces, and will be controlled/routed via
 the standard ip tools (like ip, route, netstat, ifconfig, etc).
 
-Data types and and ioctl definitions are defined via ``linux/dvb/net.h``
+Data types and ioctl definitions are defined via ``linux/dvb/net.h``
 header.
 
 
