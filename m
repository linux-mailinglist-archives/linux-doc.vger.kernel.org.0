Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB29E15CBCA
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2020 21:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgBMUOi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Feb 2020 15:14:38 -0500
Received: from 6.mo3.mail-out.ovh.net ([188.165.43.173]:42748 "EHLO
        6.mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgBMUOi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Feb 2020 15:14:38 -0500
X-Greylist: delayed 8718 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Feb 2020 15:14:37 EST
Received: from player715.ha.ovh.net (unknown [10.110.171.173])
        by mo3.mail-out.ovh.net (Postfix) with ESMTP id 87E23241A8F
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2020 18:49:18 +0100 (CET)
Received: from sk2.org (cre33-1_migr-88-122-126-116.fbx.proxad.net [88.122.126.116])
        (Authenticated sender: steve@sk2.org)
        by player715.ha.ovh.net (Postfix) with ESMTPSA id 71AF0F2A6770;
        Thu, 13 Feb 2020 17:49:02 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH 6/6] docs: document panic fully in sysctl/kernel.rst
Date:   Thu, 13 Feb 2020 18:47:01 +0100
Message-Id: <20200213174701.3200366-7-steve@sk2.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213174701.3200366-1-steve@sk2.org>
References: <20200213174701.3200366-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10096507416016735621
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrieekgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecukfhppedtrddtrddtrddtpdekkedruddvvddruddviedrudduieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The description of panic doesn’t cover all the supported scenarios;
this patch fixes that, describing the three possibilities (no reboot,
immediate reboot, reboot after a delay).

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index a792345ac6db..7ee4685861ea 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -562,9 +562,15 @@ The default is 65534.
 panic
 =====
 
-The value in this file represents the number of seconds the kernel
-waits before rebooting on a panic. When you use the software watchdog,
-the recommended setting is 60.
+The value in this file determines the behaviour of the kernel on a
+panic:
+
+* if zero, the kernel will loop forever;
+* if negative, the kernel will reboot immediately;
+* if positive, the kernel will reboot after the corresponding number
+  of seconds.
+
+When you use the software watchdog, the recommended setting is 60.
 
 
 panic_on_io_nmi
-- 
2.24.1

