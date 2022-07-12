Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E83F572A3E
	for <lists+linux-doc@lfdr.de>; Wed, 13 Jul 2022 02:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiGMAdV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Jul 2022 20:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiGMAdV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jul 2022 20:33:21 -0400
X-Greylist: delayed 24601 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Jul 2022 17:33:19 PDT
Received: from 19.mo584.mail-out.ovh.net (19.mo584.mail-out.ovh.net [87.98.179.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579558CC91
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 17:33:19 -0700 (PDT)
Received: from player770.ha.ovh.net (unknown [10.111.172.36])
        by mo584.mail-out.ovh.net (Postfix) with ESMTP id 9CD0D237E9
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 17:27:25 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player770.ha.ovh.net (Postfix) with ESMTPSA id EFDF52C9AB238;
        Tue, 12 Jul 2022 17:27:20 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-110S00462552c4c-6b9c-4525-8fb9-2f419f0dbf44,
                    95116E16C79F3EB4FFDADE9184C2BF5B79F623F3) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH 4/5] docs: sysctl/fs: remove references to super-max/-nr
Date:   Tue, 12 Jul 2022 19:26:18 +0200
Message-Id: <20220712172619.359052-4-steve@sk2.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220712172619.359052-1-steve@sk2.org>
References: <20220712172619.359052-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12609234535036388998
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeghffhleeigffhteeiffelveefhfeiudehkedtgefhgedvleffgfejgfdtveeigeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeeg
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These were removed in 2.4.7.8. Remove references to super-max and
super-nr in the sysctl documentation.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/fs.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-guide/sysctl/fs.rst
index a61c6aec5e5e..df683c15b098 100644
--- a/Documentation/admin-guide/sysctl/fs.rst
+++ b/Documentation/admin-guide/sysctl/fs.rst
@@ -277,16 +277,6 @@ or otherwise protected/tainted binaries. The modes are
 =   ==========  ===============================================================
 
 
-super-max & super-nr
---------------------
-
-These numbers control the maximum number of superblocks, and
-thus the maximum number of mounted filesystems the kernel
-can have. You only need to increase super-max if you need to
-mount more filesystems than the current value in super-max
-allows you to.
-
-
 mount-max
 ---------
 
-- 
2.31.1

