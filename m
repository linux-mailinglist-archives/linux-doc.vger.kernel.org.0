Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E49262329C
	for <lists+linux-doc@lfdr.de>; Wed,  9 Nov 2022 19:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbiKISgS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Nov 2022 13:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiKISgM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 13:36:12 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2135.outbound.protection.outlook.com [40.107.255.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E65360D0;
        Wed,  9 Nov 2022 10:36:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBZERU/d2UR1BwDUkrTmpN/pa1TbTzF6tlhfkFMfVDD0FPn3kqUmYGm0xV5gyXhBapwoYpqDHrgOQa3r5rqSK/Y30HzQ8tRRZtM/xAzRAS7sZPFQHhS4Qh3Nlt+TZn1xEKOw8WBnPhNJBTkJ68E769c6elT8D0l/fEZhjN980TEmLQ8kSDi4i6k0B23lqYJVLdH+T4hIcQt5WP+UUukAK0W9qhQMsK8EpFkugJoMjaPBe+Nmc6TmIglRDBntwJVptPBsDxe2RVuzEpUX2NN0Du8WBJC/+PiGNd8ASijY3ZcTN4CxlbLncv64WivfHw0zvTs7+SGzXVPnvvDr8WNRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPis3qNcyM+uH1zcEcbEdABZgP6Izy51n9B4BM9DhsA=;
 b=SIfXcvKTzbIrFIp7NlNgRlcBvzXIWWWjxy0qoEVpX7dnIu9KYlLGzSIsRKHDE4kuBigmxFaljMZi+LHWMQEersJGuiZ+dPomELrlhOd9hlHgSnz72PNBm2PAGK15GzxNWud/ODUEslFY69RnL1qXP/0q7zBLvdij0gQU1hecjy4XHWtQUpQ55EfKNAHknPmjiPMwCHUuVMig1ixYESE7toEgPAxkI7djhKHrXCoPxP2RlSVt4V6N4kvejawaEOPP2IEm9ZKpspkqoHK+7GF17NWnAcgoMcXJBqlMfUI27ofdT7vg/E9cmGU1lyBrbNsbBMbFeU+nmT/ct2EIATAlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPis3qNcyM+uH1zcEcbEdABZgP6Izy51n9B4BM9DhsA=;
 b=jNq1MIWLxBQbSfdzY/ZvIoRf5gxfCbAeXxv5UHmPX4ZS8/vNdH4FjXoJMm0S2zU01KnbNB93O4Z9ndaf2C03abZPy8H6w771UH7rsDlFsXzNrI2sRI74M62rpQtD/ctI2Z5qEmpgmg/WpXyj+Q7NY6l72Q/wPeHAy6xBYpyV2msDxVr1KppbSLHGgMn1jMMM6F0roxejHJyu/+QZrTt7Zn1bDDdfnDFZ/iBbbD1mpqD2XDaSQc9IbmgQyBxhqadK8SJuQ6v2vd17SnHXg6urZgol5EJICs9QZ5e059b0cJUlL1TiIQIxAjLKWOVumh7r4whynldXzNh2tOSIJf3gUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6235.apcprd06.prod.outlook.com (2603:1096:820:d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Wed, 9 Nov
 2022 18:36:00 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%8]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 18:35:59 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     jaegeuk@kernel.org, chao@kernel.org, corbet@lwn.net
Cc:     linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Subject: [PATCH] f2fs: support fault injection for flush submission error
Date:   Thu, 10 Nov 2022 02:35:49 +0800
Message-Id: <20221109183549.11012-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4c8ea3-0ec3-467b-652e-08dac2813edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7u/mcMfCol5mY3Mqjg6ljajVKUMt4B9+2lHLSi7ITlp16q2z/46A73N1nb52KgUOH6vSHBJeOwdUKb7XMN0k8D0Cej/z/Iu+zmWVImczIS1nZy1ygWq1HrwWIMxHMt4B+9hCY9UAMBt8h3Qzx2Oh+wBquRXU2U19OiJysh1W3TCNTe0r4kNryfhFwUzH5wUcdn1ogZbjopTtrq7urxjS3CAXgu7rxM1UHoLfCz9BllDWtJ7mv0d6NBcNZhnY/H/TtEb0e8elaxJ4RSxcw48NrcSyGzVwKm5/CU4AyM+L4Jf6t3SQGjt9YrOK9Ymc1GWJBpJwIxpFDzro/YyqlOjha6rRUhcUgTJidZBLyhIQ9ZKrp2MVrzpXYiyRp7SvBjcAkKmRgVn5nRphbuFAi3GMq7ch9HtaYWGidB1QAIPNcqFxVlnVBJ7iooI6nfxH9I7j2QSh6t9/YTEoidw4vGSAIGCpugsJNGXyr4wLKAUcxPqAijAJIH1L8tBevmkg6CYmTSzKdP5rckUnYvtIDpg56gfF0IuHZ8TOvYsFVUqsvnrL+N1y7yehc4zF2658s8u1YMkuLBqlsDeLYjNTaDF4Biuoy65EpGYbOY7FUmoF3eizVKhde/hwiDt3k8eF3LzKVKxlfB/mCwqelc3+ZRqv9a8X3yUJ7cXMLLgtOX9cL20tz3Lz1udhD56NasFjw7QFuysQm+AbksOotINmHiaxKl16PaiKcXxC0a2IZg3Sqzgzdr7BjyVixrUPXo9zA6S5i1RhS5BVm6Ok4/bXSWBLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199015)(66476007)(66556008)(66946007)(4326008)(2906002)(6506007)(83380400001)(6666004)(8676002)(52116002)(107886003)(478600001)(26005)(6486002)(186003)(1076003)(2616005)(86362001)(6512007)(5660300002)(316002)(38100700002)(8936002)(36756003)(41300700001)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/QW2ELZQg912aytsGocC3TCu5WbIPzBV+2+IkrRbw4G4aYnD04x7oGj/tpM?=
 =?us-ascii?Q?GIKLG488t1oPn8iofO2gFxruLZqBTMsiDqjNQPT0up8yuyLpxygWCCoxxaEP?=
 =?us-ascii?Q?6afetYFfMac302y/SwH5SvN9RU5RSSoBRIBUBPlhkmRhLDVKPltj6rTQ/49M?=
 =?us-ascii?Q?qQwcqzFzazhbjM2TZRT7lWGg4KMB1QYZPRwfto6x3aBMit7fmYJJgbc9WYXD?=
 =?us-ascii?Q?Pnw+xFQjP+mYsNUOJLUMll4yDGqnGQa7CLaVEv7gOr+5dBisiRz3qM7Vc4eD?=
 =?us-ascii?Q?xZNUTkuvY16bw3fhB2pXHQPWQF/rvXoV2g7O+sGcSSivzhkuacJmS9hLTgM2?=
 =?us-ascii?Q?y66vLxNWX09FDS7BNTdL3pfD7A95yMdpQ8Uu2D+QPBYX7eHQlVqfkVQWt7bu?=
 =?us-ascii?Q?W7gocHgRUoW6Dlp8fk5ADj8huM3uNqNzpG5tMe0EGKIIeU8uW74yzGhcUzdg?=
 =?us-ascii?Q?b9WQyusB/sYrAY++6aZ6Spr7Xz9dmWMBRtO7dXZCiT5DENBbDF68U943sA3J?=
 =?us-ascii?Q?XD7+e2Zqh3emBUJXa7BxsgUdfaIScRnaKuEyppLbQpK3r9Qd+vaTc2xMAfFo?=
 =?us-ascii?Q?HxzSSusg/gK6f2LYBgjsvukubZzLEl/D92V2pBZltKOolPtR29QZFQ9s1Iwx?=
 =?us-ascii?Q?85AL44y2aIL5vxG4PsEnOxD5MilDAGTrAFkFBJDb6osYyx+ns+jRDoGLbmVK?=
 =?us-ascii?Q?nSCozVHw6fCzBR3IjuhShxoFgwK/PCFcjm5Ge1tEQsLgcjsN5IurVtmcWsLu?=
 =?us-ascii?Q?A7rhmhjn20ZH/3EoywXhdr8EhdwZ7zALudW98JnM6951EUrb/Pvui3fKXFw1?=
 =?us-ascii?Q?sgj4h/t/qtkG3mgJqnlddp6rWHAwkRAit25BzRi8yjOTQOMzziGn5s3p/VdQ?=
 =?us-ascii?Q?+onlwQ0K4Q4QOjXdk6QBYjynr1xDddbT2QNsDfKmrTBGMbCJXwdk5cCraNRk?=
 =?us-ascii?Q?DsjOTaplC2mwRUV87ReQlRoIWKfw6ivLkx3dX4q0+7WZ1suS/Is17hccA6Cr?=
 =?us-ascii?Q?RRlSRJCdPv4bAOAPgzux3JOVheW849WWJWPmLcnXeuUATPm1YfXi+X0jlMLl?=
 =?us-ascii?Q?t/v8ciO01ng2i++L+0yGJQoltYFoF9d+f7FBKosSiZfWFiyl8MHC1WOy5YYM?=
 =?us-ascii?Q?0It/CQ4pkWz/mpS/Ga+/RMdKqnCe8QM06xD3PRfnyKcaqlZmYrcX1fecaFa7?=
 =?us-ascii?Q?EKe+Pv3L5wIp0QhVZbV2IghOcE5tjUi6xZS/3EisUd/J/kEwklCmjy4VchKU?=
 =?us-ascii?Q?YPRCgCZGmUNcC5YMCEDXaPLNQR/vLkGbidOtyzcaKTBf6SUxXprjnvfJq758?=
 =?us-ascii?Q?uAdEFe2277e2S+5YPfJEHdksBraW5yefNI3wLWncV/TbWvDOE2aYMc0HmSoT?=
 =?us-ascii?Q?HY1NIoQcVsEyX8FXrTL84bshYrHn6vt9/gHLn39+4reg+z/2aAjxDqWS5y2a?=
 =?us-ascii?Q?PjNF0EwoKSpomTmVoJW9p9oRmNszC3NP+0T/UT21uq7Y/3Edqa71j6757YKi?=
 =?us-ascii?Q?u09twUArYYBD3UBuJ+OUP7RmTRlBsaACf9dYKhW/kf25hJy3h8y/NwASbfkt?=
 =?us-ascii?Q?WPOmOIiKK3pLkMk1PnM6K9+7AxLkoQ3P0VJ9IXzf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4c8ea3-0ec3-467b-652e-08dac2813edc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 18:35:58.9109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzWXZGoxtXxSu0mZ3/sZRJCYkuUheN+mYdv0RKs3XnlV140K//110OYjRa3oe7yqE7NqhVFtHs5TeR9qmxGe3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6235
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch supports to inject fault into __submit_flush_wait() to
simulate flush cmd io error.

Usage:
a) echo 524288 > /sys/fs/f2fs/<dev>/inject_type or
b) mount -o fault_type=524288 <dev> <mountpoint>

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/filesystems/f2fs.rst |  1 +
 fs/f2fs/f2fs.h                     |  1 +
 fs/f2fs/segment.c                  | 12 +++++++++++-
 fs/f2fs/super.c                    |  1 +
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 6e67c5e6c7c3..316d153cc5fb 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -202,6 +202,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_DQUOT_INIT	  0x000010000
 			 FAULT_LOCK_OP		  0x000020000
 			 FAULT_BLKADDR		  0x000040000
+			 FAULT_FLUSH		  0x000080000
 			 ===================	  ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 04ef4cce3d7f..832baf08ecac 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -61,6 +61,7 @@ enum {
 	FAULT_DQUOT_INIT,
 	FAULT_LOCK_OP,
 	FAULT_BLKADDR,
+	FAULT_FLUSH,
 	FAULT_MAX,
 };
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index aa4be7f25963..61c650db7627 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -486,7 +486,17 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 static int __submit_flush_wait(struct f2fs_sb_info *sbi,
 				struct block_device *bdev)
 {
-	int ret = blkdev_issue_flush(bdev);
+	int ret;
+
+	if (time_to_inject(sbi, FAULT_FLUSH)) {
+		f2fs_show_injection_info(sbi, FAULT_FLUSH);
+		ret = -EIO;
+		goto submit;
+	}
+
+	ret = blkdev_issue_flush(bdev);
+
+submit:
 
 	trace_f2fs_issue_flush(bdev, test_opt(sbi, NOBARRIER),
 				test_opt(sbi, FLUSH_MERGE), ret);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a43d8a46a6e5..3d3d22ac527b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -62,6 +62,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_DQUOT_INIT]	= "dquot initialize",
 	[FAULT_LOCK_OP]		= "lock_op",
 	[FAULT_BLKADDR]		= "invalid blkaddr",
+	[FAULT_FLUSH]		= "flush error",
 };
 
 void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-- 
2.25.1

