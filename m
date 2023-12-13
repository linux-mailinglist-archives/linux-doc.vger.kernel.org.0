Return-Path: <linux-doc+bounces-4602-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7680B499
	for <lists+linux-doc@lfdr.de>; Sat,  9 Dec 2023 14:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2D41C209BE
	for <lists+linux-doc@lfdr.de>; Sat,  9 Dec 2023 13:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927EF14283;
	Sat,  9 Dec 2023 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="saTuwZso"
X-Original-To: linux-doc@vger.kernel.org
Received: from pv50p00im-hyfv10021501.me.com (pv50p00im-hyfv10021501.me.com [17.58.6.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5B110C8
	for <linux-doc@vger.kernel.org>; Sat,  9 Dec 2023 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
	t=1702129942; bh=MTMGsU3m6N+v4JfvzZq2GCUDbnzesSfAOCxIP0t5ZwQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=saTuwZsoXeWCenn+5evXdQcbiLj5vQfauhGkJQVaVr/zFkLyrcDRpgy04w38UrAak
	 MmJriWes2T2vVuz0alhzyxSLKLsYu63qckG79MOdCM5slhPhKDyk1q/e8JPZH0+JSA
	 fy2dEoqY6lpDPCkCPCePTANxBZ9hvl5TzRbJINMsy6uTEmeDXX+4P2Y1oYYuVe4/nX
	 XQMxPnB1smYN7CiAbJrYMzqmsOqKicdeW1njoCuGa2rpE45T8//jBwqI0j6VXD59X2
	 KeS569dirPXHNXSsz/GSVo/OYLn+sUqEcrV2cs6OGtyIKkS+1tMTKMbvzyVQrLtYh9
	 AaZAM+PPhnnmQ==
Received: from xiongwei.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-hyfv10021501.me.com (Postfix) with ESMTPSA id 0E2BB2C00C4;
	Sat,  9 Dec 2023 13:52:15 +0000 (UTC)
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
Subject: [PATCH v3 0/4] supplement of slab allocator removal
Date: Sat,  9 Dec 2023 21:51:59 +0800
Message-Id: <20231209135203.303508-1-sxwjean@me.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A_f9LtAEiUhmM3s6MswNN90gdWwoafGm
X-Proofpoint-GUID: A_f9LtAEiUhmM3s6MswNN90gdWwoafGm
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.572,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F01:2022-06-21=5F01,2020-02-14=5F11,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2312090120

From: Xiongwei Song <xiongwei.song@windriver.com>

Hi,

Patch 1 is to remove an unused parameter. It has a longer history, please
see the change history inside the patch.

---
Patch 2 is to replace slub_$params with slab_$params.
Vlastimil Babka pointed out we should use "slab_$param" as the primary
prefix for long-term plan. Please see [1] for more information.

This patch is to implements that.

I did the basic tests with qemu, which passed values by sl[au]b_max_order,
sl[au]b_min_order, sl[au]b_min_objects and sl[au]b_debug in command line.
The values looks correct by printing them out before calculating orders.

---
Patch 3 is to replace slub_$params in Documentation/mm/slub.rst based on
the changes of patch 2.

---
Patch 4 is original patch 3. It is not related to slab allocator removal.
It's to correct the description of default value of slub_min_objects in
Documentation/mm/slub.rst. 

---
This series is based on [2].

---
CHANGES
V3:
- patch 1: Collect Reviewed-by tag.
           Reifne the commit message.
- patch 2: Remove the changes for variables and functions.
           Resort slab_$params in doc.
           Refine the commit message.
           Remove RFC tag.
- patch 3: Use slab_$params in slub.rst.
- patch 4: It's original patch 3. Just resorted patch orders, no any other
           Changes.

v2: https://lore.kernel.org/linux-mm/457899ac-baab-e976-44ec-dfdeb23be031@suse.cz/T/#t
- patch 1: Collect Reviewed-by tag.
- patch 3: Correct spelling mistakes in commit message.

v1: https://lore.kernel.org/linux-mm/20231201031505.286117-1-sxwjean@me.com/

---
Regards,
Xiongwei

[1] https://lore.kernel.org/linux-mm/7512b350-4317-21a0-fab3-4101bc4d8f7a@suse.cz/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/log/?h=slab/for-6.8/slab-removal

Xiongwei Song (4):
  Documentation: kernel-parameters: remove noaliencache
  mm/slub: unify all sl[au]b parameters with "slab_$param"
  mm/slub: replace slub_$params with slab_$params in slub.rst
  mm/slub: correct the default value of slub_min_objects in doc

 .../admin-guide/kernel-parameters.txt         | 75 ++++++++-----------
 Documentation/mm/slub.rst                     | 60 +++++++--------
 drivers/misc/lkdtm/heap.c                     |  2 +-
 mm/Kconfig.debug                              |  6 +-
 mm/slab.h                                     |  2 +-
 mm/slab_common.c                              |  4 +-
 mm/slub.c                                     | 39 +++++-----
 7 files changed, 91 insertions(+), 97 deletions(-)

-- 
2.34.1


