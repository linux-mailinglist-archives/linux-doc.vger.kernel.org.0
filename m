Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB634D3EE2
	for <lists+linux-doc@lfdr.de>; Thu, 10 Mar 2022 02:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236857AbiCJBpn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Mar 2022 20:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236015AbiCJBpm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 20:45:42 -0500
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E545C366
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 17:44:42 -0800 (PST)
X-QQ-mid: bizesmtp81t1646876665t5i7v6m0
Received: from localhost.localdomain ( [113.57.152.160])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 10 Mar 2022 09:44:19 +0800 (CST)
X-QQ-SSF: 01400000002000C0H000B00A0000000
X-QQ-FEAT: WaCs93CnLvMjEl/TeIJeGa6u8VgBO1Yh/h9JSMusAZ8mkYekJiGchdmrnv1Lo
        GgVzTej0YzmyhyoKwT2I+X3obM4KzcquSHppuFiPwZi2p7z6BU/RMqr+1uQGvPcMlu1o+3V
        a5w4FOfPzuu7UEHnt/h+wUZ421nJ860o2gIbkBCyXahyv41n69bpO2hB1N/3gBQgmYoN2T7
        AC+A7POv8VS8iMw0dm135X0s6WEhNJ7e2VN6vW88q9tgiFvka1XYgw/kSEC/C5Hnmq0wmIX
        gwEzfjUEE6n9vzyOOzWZvOL1Fw9FUzDEOSXuMWAn5Cu0AqnEFxhx6WMWbp8xiEbAh0wV4fo
        dE5bOlAPBcZ6qVhAgU=
X-QQ-GoodBg: 2
From:   lianzhi chang <changlianzhi@uniontech.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-ext4@vger.kernel.org, corbet@lwn.net,
        adilger.kernel@dilger.ca, tytso@mit.edu,
        lianzhi chang <changlianzhi@uniontech.com>
Subject: [PATCH] doc: Fixed a bug in ext4 document
Date:   Thu, 10 Mar 2022 09:44:15 +0800
Message-Id: <20220310014415.29937-1-changlianzhi@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The unit of file system size should be TiB, not PiB

Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
---
 Documentation/filesystems/ext4/blocks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/ext4/blocks.rst b/Documentation/filesystems/ext4/blocks.rst
index bd722ecd92d6..b0f80ea87c90 100644
--- a/Documentation/filesystems/ext4/blocks.rst
+++ b/Documentation/filesystems/ext4/blocks.rst
@@ -39,7 +39,7 @@ For 32-bit filesystems, limits are as follows:
      - 4TiB
      - 8TiB
      - 16TiB
-     - 256PiB
+     - 256TiB
    * - Blocks Per Block Group
      - 8,192
      - 16,384
-- 
2.20.1



