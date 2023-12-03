Return-Path: <linux-doc+bounces-3860-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4481801FF4
	for <lists+linux-doc@lfdr.de>; Sun,  3 Dec 2023 01:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7611F20F66
	for <lists+linux-doc@lfdr.de>; Sun,  3 Dec 2023 00:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5895B18D;
	Sun,  3 Dec 2023 00:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="jrIcNLTl"
X-Original-To: linux-doc@vger.kernel.org
Received: from pv50p00im-hyfv10011601.me.com (pv50p00im-hyfv10011601.me.com [17.58.6.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D26911A
	for <linux-doc@vger.kernel.org>; Sat,  2 Dec 2023 16:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1701562598; bh=nx1wvkEsbwYtOEsINlo4S/h/mqmrWBdpRZcp/xVR8Eg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=jrIcNLTlnDSdk1jySH5c17aJZdC1IWtLnVdTj4cNMsFzmpjn0S8zfWK29OLPQbi9j
	 K/dtb85o+9fwIoibnuaL8AIoR3a8Xl7LBzVgQJIUQrPGzRq4kONyL3mP/sYmVzPd0t
	 umQASTh6DjYDNHvuN25qacdPqJKSNDPW+qIkZmkyNhm4A2AaJeqGT7quZfaX3d8e8e
	 stwh41CtRTTRNALV0YWxA+A3SVDMLUoBtpHBOxfmLdf1n/eoWmt3/aQZPHk9nfisRJ
	 fF94Nzwqx+i1bIQVKxuL6hyru7ZOXq7lmFRuFQDzHnwmWSYf5liAZSXRXj/yP+gzZz
	 FlY4NJZlJ6Ycw==
Received: from xiongwei.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-hyfv10011601.me.com (Postfix) with ESMTPSA id B7A34C800C0;
	Sun,  3 Dec 2023 00:16:31 +0000 (UTC)
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
Subject: [PATCH v2 1/3] Documentation: kernel-parameters: remove noaliencache
Date: Sun,  3 Dec 2023 08:14:59 +0800
Message-Id: <20231203001501.126339-2-sxwjean@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203001501.126339-1-sxwjean@me.com>
References: <20231203001501.126339-1-sxwjean@me.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LIXi0Nx9putNQ6njWX1fqKz8kxXImTOW
X-Proofpoint-ORIG-GUID: LIXi0Nx9putNQ6njWX1fqKz8kxXImTOW
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=708 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2312030000

From: Xiongwei Song <xiongwei.song@windriver.com>

Since slab allocator has already been removed. There is no users about
noaliencache, so let's remove it.

Suggested-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
---
Hi Hyeonggon & Christoph,

I didn't pick your Acked-by tags because I removed the changes for 
slab_max_order. Would you like to allow me to add them in this patch?

Regards,
Xiongwei

v4: Collect Reviewed-by tag.
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


