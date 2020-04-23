Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A4A1B6458
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2020 21:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgDWTQp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Apr 2020 15:16:45 -0400
Received: from 1.mo6.mail-out.ovh.net ([46.105.56.136]:46903 "EHLO
        1.mo6.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgDWTQp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Apr 2020 15:16:45 -0400
Received: from player796.ha.ovh.net (unknown [10.108.42.145])
        by mo6.mail-out.ovh.net (Postfix) with ESMTP id 6B9BD20C3A9
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2020 20:37:25 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player796.ha.ovh.net (Postfix) with ESMTPSA id 839B011A47C92;
        Thu, 23 Apr 2020 18:37:18 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH 3/3] docs: sysctl/kernel: document firmware_config
Date:   Thu, 23 Apr 2020 20:36:51 +0200
Message-Id: <20200423183651.15365-3-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423183651.15365-1-steve@sk2.org>
References: <20200423183651.15365-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16169330038890581381
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrgeelgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Based on the firmware fallback mechanisms documentation and the
implementation in drivers/base/firmware_loader/fallback.c.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index d4bbdaf96ebc..cb6d5302b595 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -265,6 +265,19 @@ domain names are in general different. For a detailed discussion
 see the ``hostname(1)`` man page.
 
 
+firmware_config
+===============
+
+See :doc:`/driver-api/firmware/fallback-mechanisms`.
+
+The entries in this directory allow the firmware loader helper
+fallback to be controlled:
+
+* ``force_sysfs_fallback``, when set to 1, forces the use of the
+  fallback;
+* ``ignore_sysfs_fallback``, when set to 1, ignores any fallback.
+
+
 ftrace_dump_on_oops
 ===================
 
-- 
2.20.1

