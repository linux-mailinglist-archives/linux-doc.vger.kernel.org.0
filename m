Return-Path: <linux-doc+bounces-4606-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D13880B49E
	for <lists+linux-doc@lfdr.de>; Sat,  9 Dec 2023 14:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1226228107C
	for <lists+linux-doc@lfdr.de>; Sat,  9 Dec 2023 13:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE9114F6A;
	Sat,  9 Dec 2023 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="NbLX2F/c"
X-Original-To: linux-doc@vger.kernel.org
Received: from pv50p00im-hyfv10021501.me.com (pv50p00im-hyfv10021501.me.com [17.58.6.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B88751710
	for <linux-doc@vger.kernel.org>; Sat,  9 Dec 2023 05:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1702129997; bh=C/CNUr2LNMn6Qo2xusn2tYrx0721oOslxNy000GbTmM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=NbLX2F/cUDL44mi2SabkraD2VVk0hY3/rQGXB0k0Wvss5Rl3/TzCj3rrYn2EQbwSW
	 FQ7gPhh95AINJgEs4XfJfywasGju3vyAlydBFrDe41RjZvk0ZoahwBhtPuiGNznmHl
	 jhcxu3Nz44xIXu3D0og6FisvlzScDOozYJI0/52yW50wFS8n2lr7+LQSYJrga/uD4Y
	 l6HvHiS5lt0fS+PLUa6tcFt8Tg4GrGsdrmbhDaYXwx2NjPbIvHknXaSNMZ1v2ZCrVr
	 Qo4v7h12JT9DGYqaZLqFGEND+Q9Q+r7gOoRRvIHo0utE6b3NWWlhbltUmoHMgWNLu/
	 RqlVNJzHrBdYg==
Received: from xiongwei.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-hyfv10021501.me.com (Postfix) with ESMTPSA id 2C2122C0207;
	Sat,  9 Dec 2023 13:53:10 +0000 (UTC)
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
Subject: [PATCH v3 4/4] mm/slub: correct the default value of slub_min_objects in doc
Date: Sat,  9 Dec 2023 21:52:03 +0800
Message-Id: <20231209135203.303508-5-sxwjean@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231209135203.303508-1-sxwjean@me.com>
References: <20231209135203.303508-1-sxwjean@me.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SFeMuhdIpG0w4U9kk62gVDJSZEQihs1C
X-Proofpoint-GUID: SFeMuhdIpG0w4U9kk62gVDJSZEQihs1C
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.572,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F01:2022-06-21=5F01,2020-02-14=5F11,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2312090120

From: Xiongwei Song <xiongwei.song@windriver.com>

There is no a value assigned to slub_min_objects by default, it always
is 0 that is initialized by compiler if no assigned value by command line.
min_objects is calculated based on processor numbers in calculate_order().
For more details, see commit 9b2cd506e5f2 ("slub: Calculate min_objects
based on number of processors.")

Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
---
 Documentation/mm/slub.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/slub.rst b/Documentation/mm/slub.rst
index 6579a55b7852..56b27f493ba7 100644
--- a/Documentation/mm/slub.rst
+++ b/Documentation/mm/slub.rst
@@ -150,7 +150,7 @@ list_lock once in a while to deal with partial slabs. That overhead is
 governed by the order of the allocation for each slab. The allocations
 can be influenced by kernel parameters:
 
-.. slab_min_objects=x		(default 4)
+.. slab_min_objects=x		(default 0)
 .. slab_min_order=x		(default 0)
 .. slab_max_order=x		(default 3 (PAGE_ALLOC_COSTLY_ORDER))
 
-- 
2.34.1


