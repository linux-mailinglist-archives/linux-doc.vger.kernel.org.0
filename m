Return-Path: <linux-doc+bounces-3716-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 465888001FB
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 04:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02E66281560
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 03:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E091317E1;
	Fri,  1 Dec 2023 03:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="jPdTAIlk"
X-Original-To: linux-doc@vger.kernel.org
Received: from pv50p00im-ztdg10012101.me.com (pv50p00im-ztdg10012101.me.com [17.58.6.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F69D171B
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 19:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1701400570; bh=Wr7fTnBxq0bcCyx9Wl9rcGbwRfY61PyyH9mYKGo5gHg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=jPdTAIlk/hbCeN3L/U9GeOvlEffSGnFsu3I2sAzuU+yLlPiyapfN6ISjPD1Hl5Wem
	 iNkXwxu7HRVXahSaYSdn59UMOTp0tMf9YYmdOnUCqfPHyHdvYy6Y7gUfmli4Qh8JZt
	 TfAUfp7PGrzoprA1FGRZ7Nk1thU+8EwNVfeh9NZdN4lPJGW4b0NGXJfuFlQIv+agt2
	 z8bPfiFW/DaksShnj/Cen4TzFkf0J+KH81ZSK5y814TUEOLUnDZVkkMQE/jAR8jGFm
	 m/8Ug+JGAnQ6yrf8RemN2IDXh3RaoQ0Eeo++KfCM2HKNfKpoiqjfehh4FB8odPZRJS
	 2tt6Q05r+aDHg==
Received: from xiongwei.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10012101.me.com (Postfix) with ESMTPSA id 62B93740162;
	Fri,  1 Dec 2023 03:16:05 +0000 (UTC)
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
Subject: [PATCH 3/3] mm/slub: correct the default value of slub_min_objects in doc
Date: Fri,  1 Dec 2023 11:15:05 +0800
Message-Id: <20231201031505.286117-4-sxwjean@me.com>
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
X-Proofpoint-ORIG-GUID: e__2VqUVQIrewVBKSdjrs2qmxpsFAx4p
X-Proofpoint-GUID: e__2VqUVQIrewVBKSdjrs2qmxpsFAx4p
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.572,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F01:2022-06-21=5F01,2020-02-14=5F11,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2312010018

From: Xiongwei Song <xiongwei.song@windriver.com>

There is no a value assigned to slub_min_objects by default, it awlays
is 0 that is intailized by compiler if no assigned value by command line.
min_objects is calculated based on proccessor numbers in
calculate_order(). For more details, see commit 9b2cd506e5f2 ("slub:
Calculate min_objects based on number of processors.")

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


