Return-Path: <linux-doc+bounces-2900-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A55C7F4916
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 15:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 348C928165F
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 14:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53744E60C;
	Wed, 22 Nov 2023 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="wlRIYxOK"
X-Original-To: linux-doc@vger.kernel.org
Received: from pv50p00im-tydg10021701.me.com (pv50p00im-tydg10021701.me.com [17.58.6.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210C1D45
	for <linux-doc@vger.kernel.org>; Wed, 22 Nov 2023 06:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1700663801; bh=XgzjOA6VpboUIsRQsEa1gBHvNAppeoyf1BK3/lsO7ME=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=wlRIYxOKQN7njqHYi+70m8lPG9FNloZ/OdsLuREfLjMZIM8hG5gzKlHkuvUph9q6D
	 +bNnQmTgHis1orJIKSEB2URIbFRk1lt4/xHeVCSLwQOQcCOpytnMbZlgj6KLeUWq1L
	 wZcTPqOjDUUGpaSar+q5W3kyYBsfeiuRj+fLuy9hgVqHUugcRVcDKD/IieGQuFV/6o
	 ghxsXSj/J3J9hUG2COAMzHug83bqURMctL2C6QJnbN3XqJeadP+GlAH4EJyNLjwgY/
	 odoa5pbQxI4gLWUp+/BhUto2ZvnU0jv6mkxosVRuuUKIicP1KNxoHmy1Taw4AID8bm
	 aboBe2u/Y6Lig==
Received: from xiongwei.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10021701.me.com (Postfix) with ESMTPSA id 5770A3A0C18;
	Wed, 22 Nov 2023 14:36:36 +0000 (UTC)
From: sxwjean@me.com
To: 42.hyeyoo@gmail.com,
	vbabka@suse.cz,
	linux-mm@kvack.org
Cc: cl@linux.com,
	penberg@kernel.org,
	rientjes@google.com,
	iamjoonsoo.kim@lge.com,
	akpm@linux-foundation.org,
	roman.gushchin@linux.dev,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@windriver.com>
Subject: [PATCH v2] Documentation: kernel-parameters: remove slab_max_order and noaliencache
Date: Wed, 22 Nov 2023 22:36:03 +0800
Message-Id: <20231122143603.85297-1-sxwjean@me.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l_lta4UJLzCFmn3o1DnHmhiV8lrNyLv4
X-Proofpoint-ORIG-GUID: l_lta4UJLzCFmn3o1DnHmhiV8lrNyLv4
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F01:2022-06-21=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=840 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2311220104

From: Xiongwei Song <xiongwei.song@windriver.com>

Since slab allocator has already been removed. There is no users about
slab_max_order and noaliencache, so let's remove them.

Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
---
v2: Hyeonggon Yoo <42.hyeyoo@gmail.com> suggested that noaliencache should be
removed too. Here adding this change. The patch is based on [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/log/?h=slab-remove-slab-v2r1

v1: https://lore.kernel.org/linux-mm/20231120091214.150502-1-sxwjean@me.com/T/#m55ebb45851bc86d650baf65dfe8296d33c5b1126
---
 Documentation/admin-guide/kernel-parameters.txt | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 65731b060e3f..d56a5beefe24 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3740,10 +3740,6 @@
 	no5lvl		[X86-64,RISCV] Disable 5-level paging mode. Forces
 			kernel to use 4-level paging instead.
 
-	noaliencache	[MM, NUMA, SLAB] Disables the allocation of alien
-			caches in the slab allocator.  Saves per-node memory,
-			but will impact performance.
-
 	noalign		[KNL,ARM]
 
 	noaltinstr	[S390] Disables alternative instructions patching
@@ -5887,12 +5883,6 @@
 			own.
 			For more information see Documentation/mm/slub.rst.
 
-	slab_max_order=	[MM, SLAB]
-			Determines the maximum allowed order for slabs.
-			A high setting may cause OOMs due to memory
-			fragmentation.  Defaults to 1 for systems with
-			more than 32MB of RAM, 0 otherwise.
-
 	slub_debug[=options[,slabs][;[options[,slabs]]...]	[MM, SLUB]
 			Enabling slub_debug allows one to determine the
 			culprit if slab objects become corrupted. Enabling
-- 
2.34.1


