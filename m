Return-Path: <linux-doc+bounces-3862-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B139C801FF7
	for <lists+linux-doc@lfdr.de>; Sun,  3 Dec 2023 01:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E38EB1C208AF
	for <lists+linux-doc@lfdr.de>; Sun,  3 Dec 2023 00:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C043919D;
	Sun,  3 Dec 2023 00:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="RSk4Wv8H"
X-Original-To: linux-doc@vger.kernel.org
Received: from pv50p00im-hyfv10011601.me.com (pv50p00im-hyfv10011601.me.com [17.58.6.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752E0E8
	for <linux-doc@vger.kernel.org>; Sat,  2 Dec 2023 16:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1701562616; bh=UkWhhz1yudvdliDY1UWHxKQEvL85ZeI0mAdRV1sW2sg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=RSk4Wv8HOlDt444Dd514CovTON6ThDBwPzt8bfiKU3So/xoPLs3dqqLgySypd73w5
	 Ce43wlTVFk6cGdRZJu9MQJ+nDwCsOVN3CKjFf26VbgzJ1ZqQGyCYWladSIrlLeK4yE
	 xDmeCZm69IWM91ROpKZh8NsAMNW+xTHcbzoxD+LNT7AUzRPTiMVXygrzltt4wjqH9a
	 RsD/YmBQGS/BfTFWn6JH5B5D0ZEZS+2oG4jf+UUhyaDUrsW6IpxIlim9WgIE0GYdL3
	 dIXXXeDPuwlPCu29+xET+LaHvo8Npdjd2mzkPBpXcJnHMq3IpbjGQ5ygwSDoo2SlLP
	 LumH+YK5mjH+A==
Received: from xiongwei.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-hyfv10011601.me.com (Postfix) with ESMTPSA id 75430C800C0;
	Sun,  3 Dec 2023 00:16:50 +0000 (UTC)
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
Subject: [PATCH v2 3/3] mm/slub: correct the default value of slub_min_objects in doc
Date: Sun,  3 Dec 2023 08:15:01 +0800
Message-Id: <20231203001501.126339-4-sxwjean@me.com>
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
X-Proofpoint-GUID: Rtt4dbLleoIBTkMumi-JfIC8Wq0WE36R
X-Proofpoint-ORIG-GUID: Rtt4dbLleoIBTkMumi-JfIC8Wq0WE36R
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2312030000

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
index be75971532f5..1f4399581449 100644
--- a/Documentation/mm/slub.rst
+++ b/Documentation/mm/slub.rst
@@ -150,7 +150,7 @@ list_lock once in a while to deal with partial slabs. That overhead is
 governed by the order of the allocation for each slab. The allocations
 can be influenced by kernel parameters:
 
-.. slub_min_objects=x		(default 4)
+.. slub_min_objects=x		(default 0)
 .. slub_min_order=x		(default 0)
 .. slub_max_order=x		(default 3 (PAGE_ALLOC_COSTLY_ORDER))
 
-- 
2.34.1


