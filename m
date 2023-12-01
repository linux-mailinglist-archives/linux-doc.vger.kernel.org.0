Return-Path: <linux-doc+bounces-3714-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE018001F7
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 04:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7276F281554
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 03:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4501817E1;
	Fri,  1 Dec 2023 03:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="l2UxtZRW"
X-Original-To: linux-doc@vger.kernel.org
Received: from pv50p00im-ztdg10012101.me.com (pv50p00im-ztdg10012101.me.com [17.58.6.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8512C171D
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 19:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1701400548; bh=/6BBT3oEazbodut73R5eNyy8EEoJl6Io45Bw5mYFEys=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=l2UxtZRWC9rjWbQ+mouGaW8p4r/II7X/ETTBz1gacUu2Oj4Gz+KXZ334vP99q4c24
	 n6ibodxj+qn4KxZOX996B4ZON7PJ0Cj0xfs5MtTPgcTJjsCmzeebXk03jsJJqXyCuS
	 QalTVbQaGkszZGUurhzqrLyMBCnPySrhQskORejcP58d4QJS6oGJPAM1iUPQPOJanE
	 0AAA6HrA4cNqN22zTnZRjQhmV5uvlFgF+xWTDCbFf06QpIt6lnAW2jJBRHSfLc/5Fa
	 +8/2i1FEi31jW6H+n4cnE7rbDDkYc8V5cwWlCEdPOwQGrLJ/2xrB/6zktY5UGZP9g/
	 sfFlDGrry4FNA==
Received: from xiongwei.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10012101.me.com (Postfix) with ESMTPSA id 0C15474010E;
	Fri,  1 Dec 2023 03:15:41 +0000 (UTC)
From: sxwjean@me.com
To: vbabka@suse.cz,
	42.hyeyoo@gmail.com,
	cl@linux.com,
	linux-mm@kvack.org
Cc: penberg@kernel.org,
	rientjes@google.com,
	iamjoonsoo.kim@lge.com,
	roman.gushchin@linux.dev,
	corbet@lwn.net,
	keescook@chromium.org,
	arnd@arndb.de,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@windriver.com>
Subject: [PATCH 1/3] Documentation: kernel-parameters: remove noaliencache
Date: Fri,  1 Dec 2023 11:15:03 +0800
Message-Id: <20231201031505.286117-2-sxwjean@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201031505.286117-1-sxwjean@me.com>
References: <20231201031505.286117-1-sxwjean@me.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: im81Je2-HEYW46V4lWquUkucUC_DVTP1
X-Proofpoint-GUID: im81Je2-HEYW46V4lWquUkucUC_DVTP1
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.572,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F01:2022-06-21=5F01,2020-02-14=5F11,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=743 bulkscore=0
 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2312010018

From: Xiongwei Song <xiongwei.song@windriver.com>

ince slab allocator has already been removed. There is no users about
noaliencache, so let's remove it.

Suggested-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
---
Hi Hyeonggon & Christoph,

I didn't pick your Acked-by tags because I removed the changes for 
slab_max_order.

Regards,
Xiongwei

v3: Remove the changes for slab_max_order.
v2: Add changes for removing "noaliencache".
    https://lore.kernel.org/linux-mm/20231122143603.85297-1-sxwjean@me.com/
v1: Remove slab_max_order.
    https://lore.kernel.org/linux-mm/20231120091214.150502-2-sxwjean@me.com/
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 65731b060e3f..9f94baeb2f82 100644
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
-- 
2.34.1


