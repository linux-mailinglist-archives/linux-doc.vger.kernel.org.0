Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A346242B00
	for <lists+linux-doc@lfdr.de>; Wed, 12 Aug 2020 16:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgHLOLm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 Aug 2020 10:11:42 -0400
Received: from 17.mo1.mail-out.ovh.net ([87.98.179.142]:58034 "EHLO
        17.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgHLOLl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Aug 2020 10:11:41 -0400
X-Greylist: delayed 8401 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Aug 2020 10:11:40 EDT
Received: from player760.ha.ovh.net (unknown [10.110.103.91])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id D11691D3F6B
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2020 11:22:59 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player760.ha.ovh.net (Postfix) with ESMTPSA id B3CDB15353C10;
        Wed, 12 Aug 2020 09:22:52 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-95G001fc86ea76-4989-4d97-a23d-2b9d13cd592a,
                    6B47CEF5255F3F5086931DB51E807497F854451F) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH] Fix references to nommu-mmap.rst
Date:   Wed, 12 Aug 2020 11:22:30 +0200
Message-Id: <20200812092230.27541-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13038765346632781299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrledvgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepteegudfgleekieekteeggeetveefueefteeugfduieeitdfhhedtfeefkedvfeefnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

nommu-mmap.rst was moved to Documentation/admin-guide/mm; this patch
updates the remaining stale references to Documentation/mm.

Fixes: 800c02f5d030 ("docs: move nommu-mmap.txt to admin-guide and rename to ReST")
Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 init/Kconfig | 2 +-
 mm/Kconfig   | 2 +-
 mm/nommu.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 2dd5531dae98..8d5fefd1f229 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1957,7 +1957,7 @@ config MMAP_ALLOW_UNINITIALIZED
 	  userspace.  Since that isn't generally a problem on no-MMU systems,
 	  it is normally safe to say Y here.
 
-	  See Documentation/mm/nommu-mmap.rst for more information.
+	  See Documentation/admin-guide/mm/nommu-mmap.rst for more information.
 
 config SYSTEM_DATA_VERIFICATION
 	def_bool n
diff --git a/mm/Kconfig b/mm/Kconfig
index d41f3fa7e923..29e239497718 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -387,7 +387,7 @@ config NOMMU_INITIAL_TRIM_EXCESS
 	  This option specifies the initial value of this option.  The default
 	  of 1 says that all excess pages should be trimmed.
 
-	  See Documentation/mm/nommu-mmap.rst for more information.
+	  See Documentation/admin-guide/mm/nommu-mmap.rst for more information.
 
 config TRANSPARENT_HUGEPAGE
 	bool "Transparent Hugepage Support"
diff --git a/mm/nommu.c b/mm/nommu.c
index 64539971188b..e8e2c5bb6f0a 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -5,7 +5,7 @@
  *  Replacement code for mm functions to support CPU's that don't
  *  have any form of memory management unit (thus no virtual memory).
  *
- *  See Documentation/mm/nommu-mmap.rst
+ *  See Documentation/admin-guide/mm/nommu-mmap.rst
  *
  *  Copyright (c) 2004-2008 David Howells <dhowells@redhat.com>
  *  Copyright (c) 2000-2003 David McCullough <davidm@snapgear.com>

base-commit: e176b7a3054eef44a22f6ca3d14168dcf9bad21e
-- 
2.20.1

