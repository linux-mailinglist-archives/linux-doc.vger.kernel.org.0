Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C81D5726CC
	for <lists+linux-doc@lfdr.de>; Tue, 12 Jul 2022 21:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbiGLT5G (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Jul 2022 15:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbiGLT5G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jul 2022 15:57:06 -0400
X-Greylist: delayed 8400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Jul 2022 12:57:03 PDT
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net [46.105.56.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21ED3C3
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 12:57:02 -0700 (PDT)
Received: from player770.ha.ovh.net (unknown [10.110.103.177])
        by mo582.mail-out.ovh.net (Postfix) with ESMTP id 967B52169D
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 17:27:11 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player770.ha.ovh.net (Postfix) with ESMTPSA id CF11E2C9AB1AD;
        Tue, 12 Jul 2022 17:27:07 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-110S004f189b0e1-8866-46bc-95be-58f3392da2e9,
                    95116E16C79F3EB4FFDADE9184C2BF5B79F623F3) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: [PATCH 1/5] docs: sysctl: remove references to inode-max
Date:   Tue, 12 Jul 2022 19:26:15 +0200
Message-Id: <20220712172619.359052-1-steve@sk2.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12605293884737488518
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedv
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

inode-max was removed in 2.3.20pre1, remove references to it in the
sysctl documentation.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/fs.rst | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/fs.rst b/Documentation/admin-guide/sysctl/fs.rst
index 2a501c9ddc55..54130ae33df8 100644
--- a/Documentation/admin-guide/sysctl/fs.rst
+++ b/Documentation/admin-guide/sysctl/fs.rst
@@ -33,7 +33,6 @@ Currently, these files are in /proc/sys/fs:
 - dquot-nr
 - file-max
 - file-nr
-- inode-max
 - inode-nr
 - inode-state
 - nr_open
@@ -136,18 +135,12 @@ enough for most machines. Actual limit depends on RLIMIT_NOFILE
 resource limit.
 
 
-inode-max, inode-nr & inode-state
----------------------------------
+inode-nr & inode-state
+----------------------
 
 As with file handles, the kernel allocates the inode structures
 dynamically, but can't free them yet.
 
-The value in inode-max denotes the maximum number of inode
-handlers. This value should be 3-4 times larger than the value
-in file-max, since stdin, stdout and network sockets also
-need an inode struct to handle them. When you regularly run
-out of inodes, you need to increase this value.
-
 The file inode-nr contains the first two items from
 inode-state, so we'll skip to that file...
 
@@ -156,11 +149,10 @@ The actual numbers are, in order of appearance, nr_inodes,
 nr_free_inodes and preshrink.
 
 Nr_inodes stands for the number of inodes the system has
-allocated, this can be slightly more than inode-max because
-Linux allocates them one pageful at a time.
+allocated.
 
 Nr_free_inodes represents the number of free inodes (?) and
-preshrink is nonzero when the nr_inodes > inode-max and the
+preshrink is nonzero when the
 system needs to prune the inode list instead of allocating
 more.
 

base-commit: 50fd82b3a9a9335df5d50c7ddcb81c81d358c4fc
-- 
2.31.1

