Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7B76E7176
	for <lists+linux-doc@lfdr.de>; Wed, 19 Apr 2023 05:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbjDSDOj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Apr 2023 23:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjDSDOh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 23:14:37 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2101.outbound.protection.outlook.com [40.107.215.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FF661AF;
        Tue, 18 Apr 2023 20:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7/OiA/qpp2WwJTP8EUPWnlT8AN73rMfGM7PRpFHjZe2kAojkpbp+DQYAhHEQ9RlLhLt9Dq6ppDL4gbWgwUqp+WZBZ3lJVp977cFCLAUHDDrL1fmcqZIgnghCqX0wWy30Amz69uNnAMTkT4/p+I/VVEyuysAKQlODtX3aX/61I7QC0mnpnLnmrpffr2h11smRIpDiCPpUQ0vwj1k2iOfwBczTpqGril2qH1sIfz3GrwhVwk01H6rUtC9QSGYx5i3vSCcGz4dQ1COVvFsSWuxyc81/gdEoDOIAbw0/wqNSy395P8r0YLeV5YbDaViaz23nSq7RadhqxPFSNnBOD87rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40F/PY2fIU8sLWQVF/1pZZxAhN5jLc97vvB0eBEWZYk=;
 b=O0Zgivu5TNPcfpkdbUTQkmbB5Gv4KqZCiQ10YAU46G6F0WWCXfhlKnSyL3oi6/FOrm7xTtEVLDb+RhmVGuMgeXermEo/mef2xkokmPoS0ITtbVvIXB9jkVFGwwP8/ODyfIUqQ/nqEquycMZ6ICYrivjbVGpQm++naIo48frq2l5ShKNdpQmbvwAnviqOuuDAy2H8Niu7C9laI4+59lAIuR6/R84PrbZGTQ99UDtw3AendNWP2LR2fWYTxvhWCjGTsmzLRcRT7XDARf4U1MbM5AbUxn09nN2n2W4VfwOiKrR4JQPKB0HBzEANqWjjDpo/2P7gcYP3P9St7w209EWs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40F/PY2fIU8sLWQVF/1pZZxAhN5jLc97vvB0eBEWZYk=;
 b=f35w8NyY2QokMmx5z65TNS8SGSkRh96mkns9weADHn0I+wVj6z/iDYQ4OOCITjo35esFz49GSRjtdt1lM/h1INZh1XY8KOB9AmbbhYjLjbOE4KGpqyD9OKjE36yB0oAKL3EyEitQEuZyf8TZLij+LBdV18iwResITvWpAYx3aoIv4RKZ1wEP+3ZHAcWkg8VHFVtvlJXkwsS6EWjLV+YY9vC2+o79O5Gqpnp1BqmMVhXEO2kCk3FK/6Zyk7G1xC5RZYFn9VAbMUqO6cnFzCPySIr94PG4vubroT/5y2w8xXxXV858Iz7TD+HKTy/GSbX8pBBo/RJwY6cBkEXEDT+V+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4164.apcprd06.prod.outlook.com (2603:1096:820:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 03:14:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 03:14:32 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Yangtao Li <frank.li@vivo.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: f2fs: specify extent cache for read explicitly
Date:   Wed, 19 Apr 2023 11:14:07 +0800
Message-Id: <20230419031408.5775-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::17) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: 00eb9c82-f98a-4a1a-0393-08db408431b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRlh+uGX9f9g6Yc220PZ4RFJ+eGGbHxez6cb6PDpuFBVwsnWcz1//KBaeCSswzT363+v2pgTryL20DZUelrWjRi5tse91b9DDcPGYiJtlLyuiI3lktgmYCoyK5vqyQy42YKQxhWfhvXvkNafoy2D2TQlwzpFRF8EVahEu4MiUnDac1rSWwpwCq3l2bLNdxPGPWcpIbDpMrXVZHa/KyA+eUN0Ru17r3+dpz6jACl/vPNJG0na6u/MXsbRMJ3cW23UES/myeECEiORBlY/Q8ZX2SVRnTnNJKuOb4TOnp4igm6OJrkCcDNfmbqxRPwsaXRpLHuPgiR9Gx7xcwO30/M50nmA2O2TXjcDYeAgNGrU576esLGYIEBrVN/BgpQ+p40mAO32z02Q8/VcvnrG3vnZTiRYFAJwr3uyhR/8X0pgkV91gicIcBSAhcvB5Bnj9kiN/KW4iYNCC7LNcUO795efybed5MjED57/xzJ9l7Vhm/HcMqk2ybnylYn6jDcLjSUHQ84Mrb+hcSf/WgeMapCMWeB2OwF7tFjeACSJMwU0xIXi0FOg16Um/qtBYndDIAdhQk7etlCUxepby1whvYJ6cIzxmtSFaswCb4K2iEpY3ObhQrnhVgFvMnVzHQgNUdGY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(186003)(4326008)(110136005)(54906003)(316002)(66946007)(66476007)(66556008)(52116002)(478600001)(6486002)(8676002)(8936002)(6666004)(41300700001)(5660300002)(2906002)(86362001)(36756003)(38100700002)(2616005)(6512007)(26005)(6506007)(1076003)(38350700002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lSFBTPm+fYEJWPbccHmIL5SChljTKvtL8ubX9pVhlc8hCcR6KNWwRDd68etX?=
 =?us-ascii?Q?/wZfqC5FkBmI1GIipExhr68QoDxKufEMQlZ85DjtrXu3FfGgf9yn0gw5KHnj?=
 =?us-ascii?Q?H44tcqJFOLQMuqiBLF+V2UQ3tbFX0iMUKYIYPyyWkz9Qp2dxPd8brOYQqxxM?=
 =?us-ascii?Q?wDWBd2s0Zrsrqoim/lXdceL95S94SLIxrhDIDqIYmFn/05o/+r/B3vfQGliT?=
 =?us-ascii?Q?UlmJD1KTfpFfZYXaiBC1nL39QnB/AEshd6OpR9I1Q/t8iSpqb1N8SUZxDhZV?=
 =?us-ascii?Q?WqoBVEwNj9vYFbLVDhhIWZKWj5vFbUCC4BaC0X4KzJSvy4pzpoIdarL6uJKT?=
 =?us-ascii?Q?GPZDdL2zf7gqz07mh5mXNMrUQuLrx4gl4c4mNa1Lrqr7pKYYqV4ZDyI3KLaG?=
 =?us-ascii?Q?ViuhzBdCM6DTjKwl6WhcHo84e+xmObBhhUFe2IrdDDcaybBFzrhaKNTseVRh?=
 =?us-ascii?Q?tSTb+wpfZUfVMc0QX9f4xOTQwAt5j6O+RYZWBLOlDR/btR5eSq4rImSsYayu?=
 =?us-ascii?Q?iNoYbdK/0LGHDSSR7zIyjLuDI19rfLjNv3nbIpY6QeqZDcSXyTqDnhmYEjGL?=
 =?us-ascii?Q?lbd9+85Dpc6l4SASuH5j/U2pIjSblCKPw3at0sZzkSy4Vlb0oxdWbASjGAhv?=
 =?us-ascii?Q?0VWTlBa7sjvPjPhkmTFohYVe+et/hyE4wqQD2xPskuI8/sBZt+PcYF0r02CZ?=
 =?us-ascii?Q?sr0a0OSH9r0WLTIbS22EGpIU/PCOarySj83fqqbqNwszVkDkptQd8FuiOuDB?=
 =?us-ascii?Q?AW7rz4Jv0CyV77KezNJPTWVY65UEUeqZfpDLzckhL4ekTEvP0LB29Nb3eU0O?=
 =?us-ascii?Q?baw+C+QVMvuGLZP/TclCKdlEv66vAV3Z+AUSJMquMT0OwbWu6qOavKawXs5L?=
 =?us-ascii?Q?6aZLvwCGra0s52vWLawsY2Exb7RkWb+3fVb3UBJdJOphwhxbpw/OmWsZ/38U?=
 =?us-ascii?Q?AEclcEtYwj9RlTWSROPGAV+A7t+u2+q3l5qQFgsS0bDTXws5+hXpKIhfct9P?=
 =?us-ascii?Q?J5mSn/gBEeEq0gb0oXRx3INvmcsjW8xA+32qDCGAJc5F1iFd1Yq0kSAjJF8+?=
 =?us-ascii?Q?vFwW1PZ0aT/Sv1TZYMwXbVLKWrobCUSZbTLqM3UUCIb9BOCMDLRM/GRzltc9?=
 =?us-ascii?Q?NWMUferOMG7dKytQNi7Vzebtfny8fc8WGlUYm/w6WOS1+zIU3vCy3ijAIfXE?=
 =?us-ascii?Q?KQnxcnGbVZc9IfsgwjwbP1AMtW50ZFTfbcfJGOiMog5u42s9LZHAwXVwVhZK?=
 =?us-ascii?Q?LRQXxNzgoQTKNVrFCngT/6N3/RLm9p/eE2hhhqxYaZVQvj0HjEcEBOCPVow1?=
 =?us-ascii?Q?GOs6BqVlwExqbON7HEKAl2o+P+bWkdDDPyOKraVY3SxLKbAJnob5yrGG6ant?=
 =?us-ascii?Q?HprGPf3t+mEtuKgoHOEUIXFmlUf49yWxiIAvRHdlaiyFCWK/zlvyrW0Oqbo3?=
 =?us-ascii?Q?C2Kl55IwifCQvLa5iz0+09fnMUzxhjnVSJZI+fgIhMxTMdwipW9+OXB50VvV?=
 =?us-ascii?Q?AkdZ7xOAqxetSOhbcw1srAuKYYxjZ8/twOjUwQBauEtvZ4MbT2skoRZyn6Up?=
 =?us-ascii?Q?XI65AKYI3e7IcgF6CFqMV5f679a/SjFvE2nrOTMY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00eb9c82-f98a-4a1a-0393-08db408431b8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 03:14:31.8582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsYdx205aGkIZ8fzEJKCPIX0FQxBYZQx3LhaUw3XsVPwpUEC78Iz9hSEgL5QxntUzWd3UhH793dDmr3YT00jJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4164
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Clarify the fact that extent_cache and noextent_cache toggle
read extent cache on or off.

Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-update msg
 Documentation/filesystems/f2fs.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index c57745375edb..6db21ae0136a 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -163,11 +163,11 @@ barrier			 If this option is set, cache_flush commands are allowed to be
 fastboot		 This option is used when a system wants to reduce mount
 			 time as much as possible, even though normal performance
 			 can be sacrificed.
-extent_cache		 Enable an extent cache based on rb-tree, it can cache
-			 as many as extent which map between contiguous logical
+extent_cache		 Enable a read extent cache based on rb-tree. It can cache
+			 many extents which map between contiguous logical
 			 address and physical address per inode, resulting in
 			 increasing the cache hit ratio. Set by default.
-noextent_cache		 Disable an extent cache based on rb-tree explicitly, see
+noextent_cache		 Disable a read extent cache based on rb-tree explicitly, see
 			 the above extent_cache mount option.
 noinline_data		 Disable the inline data feature, inline data feature is
 			 enabled by default.
-- 
2.39.0

