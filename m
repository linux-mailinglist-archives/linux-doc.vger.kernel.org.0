Return-Path: <linux-doc+bounces-2650-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE47F0EDE
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 10:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F9FC1C21517
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 09:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B1A11184;
	Mon, 20 Nov 2023 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="OGFm018h"
X-Original-To: linux-doc@vger.kernel.org
X-Greylist: delayed 464 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Nov 2023 01:20:25 PST
Received: from pv50p00im-ztdg10011201.me.com (pv50p00im-ztdg10011201.me.com [17.58.6.39])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3A4A7
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 01:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1700471570; bh=C6bJm1rJmKMAKTZ+mlTlfG/ccBLTxL7wbEIPZkFpi6U=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=OGFm018hZkfpIDcLlJ+sDNFLtihksioQkzpq/hBDtx3HOwN/OSl/t3KRJSflD3lkn
	 4Oho8P1cK4oOiBDjKXPhgKii31LVCFnDxZkWg4LV9s7aVo3kKdbappI8fM7zbUXUaJ
	 Ls2VyrHamNhu6GyJ69Lzmca4xlw1rg8HAlKzoRn8GJGEymnFE+IxQDdDVfgjo7DdV/
	 7RXFjxe7O92FBzS1pvbS44OZr4oKNBYci2XXxjlFgDzqnixz6LCnaD/BJXFFb/lMoa
	 7NrlwA5LJTyMUEOu2R3AEO4Jd2DzNLrV9sQkHI26FuqAzvnAn57I+4QS45NqK/+WlN
	 znY9Cz0TdrhBg==
Received: from xiongwei.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPSA id 4C63B680241;
	Mon, 20 Nov 2023 09:12:45 +0000 (UTC)
From: sxwjean@me.com
To: cl@linux.com,
	penberg@kernel.org,
	rientjes@google.com,
	iamjoonsoo.kim@lge.com,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	42.hyeyoo@gmail.com
Cc: corbet@lwn.net,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] mm/slab: remove slab_nomrege and slab_merge
Date: Mon, 20 Nov 2023 17:12:12 +0800
Message-Id: <20231120091214.150502-3-sxwjean@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120091214.150502-1-sxwjean@me.com>
References: <20231120091214.150502-1-sxwjean@me.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5R7rj5D1dxnrVnAuK0i15zYpwBZnK12t
X-Proofpoint-ORIG-GUID: 5R7rj5D1dxnrVnAuK0i15zYpwBZnK12t
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2311200061

From: Xiongwei Song <xiongwei.song@windriver.com>

Since slab allocatoer has already been removed, so we should also remove
the related parameters. And change the global flag from slab_nomerge
to slub_nomerge.

Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 11 ++---------
 mm/Kconfig                                      |  2 +-
 mm/slab_common.c                                | 13 +++++--------
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c7709a11f8ce..afca9ff7c9f0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5870,11 +5870,11 @@
 
 	slram=		[HW,MTD]
 
-	slab_merge	[MM]
+	slub_merge	[MM]
 			Enable merging of slabs with similar size when the
 			kernel is built without CONFIG_SLAB_MERGE_DEFAULT.
 
-	slab_nomerge	[MM]
+	slub_nomerge	[MM]
 			Disable merging of slabs with similar size. May be
 			necessary if there is some reason to distinguish
 			allocs to different slabs, especially in hardened
@@ -5915,13 +5915,6 @@
 			lower than slub_max_order.
 			For more information see Documentation/mm/slub.rst.
 
-	slub_merge	[MM, SLUB]
-			Same with slab_merge.
-
-	slub_nomerge	[MM, SLUB]
-			Same with slab_nomerge. This is supported for legacy.
-			See slab_nomerge for more information.
-
 	smart2=		[HW]
 			Format: <io1>[,<io2>[,...,<io8>]]
 
diff --git a/mm/Kconfig b/mm/Kconfig
index 766aa8f8e553..87c3f2e1d0d3 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -255,7 +255,7 @@ config SLAB_MERGE_DEFAULT
 	  cache layout), which makes such heap attacks easier to exploit
 	  by attackers. By keeping caches unmerged, these kinds of exploits
 	  can usually only damage objects in the same cache. To disable
-	  merging at runtime, "slab_nomerge" can be passed on the kernel
+	  merging at runtime, "slub_nomerge" can be passed on the kernel
 	  command line.
 
 config SLAB_FREELIST_RANDOM
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 238293b1dbe1..d707abd31926 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -58,26 +58,23 @@ static DECLARE_WORK(slab_caches_to_rcu_destroy_work,
 /*
  * Merge control. If this is set then no merging of slab caches will occur.
  */
-static bool slab_nomerge = !IS_ENABLED(CONFIG_SLAB_MERGE_DEFAULT);
+static bool slub_nomerge = !IS_ENABLED(CONFIG_SLAB_MERGE_DEFAULT);
 
 static int __init setup_slab_nomerge(char *str)
 {
-	slab_nomerge = true;
+	slub_nomerge = true;
 	return 1;
 }
 
 static int __init setup_slab_merge(char *str)
 {
-	slab_nomerge = false;
+	slub_nomerge = false;
 	return 1;
 }
 
 __setup_param("slub_nomerge", slub_nomerge, setup_slab_nomerge, 0);
 __setup_param("slub_merge", slub_merge, setup_slab_merge, 0);
 
-__setup("slab_nomerge", setup_slab_nomerge);
-__setup("slab_merge", setup_slab_merge);
-
 /*
  * Determine the size of a slab object
  */
@@ -138,7 +135,7 @@ static unsigned int calculate_alignment(slab_flags_t flags,
  */
 int slab_unmergeable(struct kmem_cache *s)
 {
-	if (slab_nomerge || (s->flags & SLAB_NEVER_MERGE))
+	if (slub_nomerge || (s->flags & SLAB_NEVER_MERGE))
 		return 1;
 
 	if (s->ctor)
@@ -163,7 +160,7 @@ struct kmem_cache *find_mergeable(unsigned int size, unsigned int align,
 {
 	struct kmem_cache *s;
 
-	if (slab_nomerge)
+	if (slub_nomerge)
 		return NULL;
 
 	if (ctor)
-- 
2.34.1


