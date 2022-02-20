Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50A54BCD3E
	for <lists+linux-doc@lfdr.de>; Sun, 20 Feb 2022 09:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235140AbiBTIbP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 20 Feb 2022 03:31:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiBTIbO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Feb 2022 03:31:14 -0500
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42BF50B17
        for <linux-doc@vger.kernel.org>; Sun, 20 Feb 2022 00:30:53 -0800 (PST)
X-QQ-mid: bizesmtp66t1645345832taerfzir
Received: from localhost.localdomain (unknown [202.96.137.248])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Sun, 20 Feb 2022 16:29:33 +0800 (CST)
X-QQ-SSF: 01400000002000D0N000000A0000000
X-QQ-FEAT: pqOtrSRu7rg5ACz2c+gPpZlgAFM7xN0sDWeZTFZT/eyjqGE+KF9Yd47IqfiLL
        5OmQB4GQpeoTHRPQCDUQLPFDmhJiCs9H0ot8T4/FFY0Z7C+wC/58MMbKGyVTF4mYghb0dbW
        u9yriejklXLciYCcTNriqWlveaMq9qX1JilHE3qb9kEx+9kPkcrkWsmFc/0sVoDSwjdLnjQ
        ocRWtFwqpff5hYgLercPVeaWNd4Spwv413rO6mbLrCPIXsbb9tJXE2USokVub62mNHJwXOF
        IYz7pi8HYSa+dB5MlVHRkVLhbk22U9vzS8HB6Lck6Uhjl6Gf2h6f5XaPzsKIZNEIbYP21ds
        FjFbHBX/JgScBr3SHutDjSkO7tVYjrMQ8FK5ng3
X-QQ-GoodBg: 2
From:   Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
To:     corbet@lwn.net
Cc:     akpm@linux-foundation.org, sfr@canb.auug.org.au,
        hanshenghong2019@email.szu.edu.cn, vbabka@suse.cz,
        skhan@linuxfoundation.org, georgi.djakov@linaro.org,
        weizhenliang@huawei.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
Subject: [PATCH 2/2] Documentation/vm/page_owner.rst: fix a phrase
Date:   Sun, 20 Feb 2022 16:29:32 +0800
Message-Id: <20220220082932.2808-1-caoyixuan2019@email.szu.edu.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:email.szu.edu.cn:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I think that using "by default" will be better.

Signed-off-by: Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
---
 Documentation/vm/page_owner.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
index 2b54e82b9fe1..5ac1c12fcfc2 100644
--- a/Documentation/vm/page_owner.rst
+++ b/Documentation/vm/page_owner.rst
@@ -26,7 +26,7 @@ fragmentation statistics can be obtained through gfp flag information of
 each page. It is already implemented and activated if page owner is
 enabled. Other usages are more than welcome.
 
-page owner is disabled in default. So, if you'd like to use it, you need
+page owner is disabled by default. So, if you'd like to use it, you need
 to add "page_owner=on" into your boot cmdline. If the kernel is built
 with page owner and page owner is disabled in runtime due to no enabling
 boot option, runtime overhead is marginal. If disabled in runtime, it
-- 
2.31.1



