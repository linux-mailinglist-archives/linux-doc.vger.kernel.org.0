Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD783548219
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jun 2022 10:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240475AbiFMIzh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jun 2022 04:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239287AbiFMIzb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 04:55:31 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1BDB7E3;
        Mon, 13 Jun 2022 01:55:22 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LM50h0gsGzRj23;
        Mon, 13 Jun 2022 16:52:04 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 16:55:16 +0800
Received: from huawei.com (10.174.178.102) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 13 Jun
 2022 16:55:15 +0800
From:   linshengwang <linshengwang1@huawei.com>
To:     <alexs@kernel.org>, <corbet@lwn.net>, <linshengwang1@huawei.com>
CC:     <siyanteng01@gmail.com>, <bobwxc@email.cn>, <src.res@email.cn>,
        <wanjiabing@vivo.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] fs/ntfs3: Remove unused function 'attr_must_be_resident'
Date:   Mon, 13 Jun 2022 16:55:14 +0800
Message-ID: <20220613085514.977-1-linshengwang1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.178.102]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Lin Shengwang <linshengwang1@huawei.com>

It is introduced by commit be71b5cba2e6 ("fs/ntfs3:
Add attrib operations"), but never used, so remove it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Lin Shengwang <linshengwang1@huawei.com>
---
 fs/ntfs3/attrib.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index fc0623b029e6..3df0c3f5ec72 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -54,33 +54,6 @@ static inline u64 get_pre_allocated(u64 size)
 	return ret;
 }

-/*
- * attr_must_be_resident
- *
- * Return: True if attribute must be resident.
- */
-static inline bool attr_must_be_resident(struct ntfs_sb_info *sbi,
-					 enum ATTR_TYPE type)
-{
-	const struct ATTR_DEF_ENTRY *de;
-
-	switch (type) {
-	case ATTR_STD:
-	case ATTR_NAME:
-	case ATTR_ID:
-	case ATTR_LABEL:
-	case ATTR_VOL_INFO:
-	case ATTR_ROOT:
-	case ATTR_EA_INFO:
-		return true;
-	default:
-		de = ntfs_query_def(sbi, type);
-		if (de && (de->flags & NTFS_ATTR_MUST_BE_RESIDENT))
-			return true;
-		return false;
-	}
-}
-
 /*
  * attr_load_runs - Load all runs stored in @attr.
  */
--
2.17.1


