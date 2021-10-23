Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADA8438173
	for <lists+linux-doc@lfdr.de>; Sat, 23 Oct 2021 04:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhJWDBE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 22 Oct 2021 23:01:04 -0400
Received: from mail-eopbgr1300097.outbound.protection.outlook.com ([40.107.130.97]:39904
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229545AbhJWDBD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 22 Oct 2021 23:01:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCMT13tQHaAV6oLeKsrg0CWZcq4UyOaqpfE6/QxiH7eLD2aDbY9lJYi72w+KhZp2HwVj28OxNK9+Vi+drvIz7I5Ll3cHqT3VHzPWVoBWBz6cAMPnUUfIQCCXa/Mkjg/X693GhvvuSwuNeTBGe+14XLFohzo03srJtgng3W6T1lTejddu/iClbNi0rvv7PUge0yZI6oaK4SOSwc41osiNsAUUADdLgdf3DSHkwl5OK2uVMSkr0fHoGWMKLDoS4M0vGeG302Kz9PTP3HMgC0TyX44LCPv7RUIE6QQ01Ujy82ZCRob7/QokcVBVHrDo6UY0ZvOD/3Pj/ZK87iPikRPPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5mSv1CR7o5X2VkevvLaW3KclgkIM6yqfXcnjFA87gw=;
 b=NWwCfi83Fs+Yh/77OKs6D2EMhbrbxSNVEpV277qTSneRdo6dp3QRIhfufc1+n+8fq5zP7xDL+NrmPVQKzurB+gUwVBr/vn80hswQJ5g/olcTU4MXFM4Seew0G4Xz8I/PhYw+q3DHh2pnWRTb2HB6ZTv8ftSjVdwaXzjg4dP5uf2ghxJsDjUM2pggepbkBdH7L8lOEDLHiRyCkFGWypCG7/3NR7Ryl5wpqx0NF+jPk8V1MTO1/51o999XGpOBdLRKBcjdwZ4RNuPAoWLUxQaSkppopZDedYGJobFGwf77UaJ+1S+iF1N2xJM8XlbaiJso4w6srkiuC4oJDxLdQVqyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5mSv1CR7o5X2VkevvLaW3KclgkIM6yqfXcnjFA87gw=;
 b=Zpf1Y7gbcaSCGPLsGZcnxh7imsFYZljul8y6sR6mXiYcLYs4/tBhygeLm1uCYqoPZXZqQwcLuByfMefvLAUNNZxnOQi73f27OY20UJXADm5QtaPH9ePJFPLev8gWootJbgzFjg7CMzIz5mFIkWuBqJTZ8huYnY0zSWVJ9NUp2RA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com (2603:1096:400:7::14)
 by TY2PR06MB2448.apcprd06.prod.outlook.com (2603:1096:404:4d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 02:58:42 +0000
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::58f6:5881:f1d5:f1b1]) by TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::58f6:5881:f1d5:f1b1%5]) with mapi id 15.20.4628.018; Sat, 23 Oct 2021
 02:58:42 +0000
From:   Fengnan Chang <changfengnan@vivo.com>
To:     jaegeuk@kernel.org, chao@kernel.org, corbet@lwn.net
Cc:     linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
        Fengnan Chang <changfengnan@vivo.com>
Subject: [PATCH] f2fs: fix f2fs.rst build warning
Date:   Sat, 23 Oct 2021 10:58:33 +0800
Message-Id: <20211023025833.216030-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0207.apcprd02.prod.outlook.com
 (2603:1096:201:20::19) To TYZPR06MB4014.apcprd06.prod.outlook.com
 (2603:1096:400:7::14)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by HK2PR02CA0207.apcprd02.prod.outlook.com (2603:1096:201:20::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4628.16 via Frontend Transport; Sat, 23 Oct 2021 02:58:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c94ede08-5003-4125-ef27-08d995d1053f
X-MS-TrafficTypeDiagnostic: TY2PR06MB2448:
X-Microsoft-Antispam-PRVS: <TY2PR06MB2448E6770EEDB61A3E0914AABB819@TY2PR06MB2448.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KDc3Ef4bue8cVxnBahiuw+5M324eY5FUkgM2dwYQFLr9qgv77EspN3uN6pZbc0DDFRr7jn+zvzkyA5Wyga7XW6cZ9WZYqcnGPgg/VQg15I+Fi91y8VuMLEWd+NjIVlpKl4Iz+Am68URLHgn9uHNcXqrFbN+j1CYsj4ZQpVWGZKFQRatReD2ffiRahOCJVIsulAnDg3+8qMAhV1L0CzhyA9dKR+I5dxiQi61QlYPVLfmVTpMdbA+DCsPWTgFJMB52DAM4DQNSxQwBOl+SSlLsv5LqtSgKv3patYMM9H8Tl1YvQi8IlLc93DwXNsv6ZZtoWDKXppjl6d1a0HSeeCwdQ+blt5+FDl9kEQonZvNJ5zqqmpy9Okt+cvmAr8IOfmzZLCHnn7VOvWWTafVNfkUANonsF114JW+jCN/6et2jvlL9y/cuceE+nZebNi84Bpj3R5kdOSGTXYrsJE7xPHCfqYtXl3VnjeLafJJYdB60HQnN3EacZ7W5TT3epPlNvmfBwnXDf2BhVl9LQOV17NIHE9nU9BjNeQbHja+QQ03moL1Q4rcDdopSai2oalna5+kb5/W2FDUrvBhInKXxO/3Yae84m+8D5m236cOpK0+N5UwOGKxB3caf/pQaZNYvgMtBf07ygLf7uMsfu+1kvvLhbV5WSsBIDlP7mXfZMHOrCekWlwIqOe5Tep1JcG7/Dfh01jPKvTdwpSYhO9SHPolrO/UU+yUxchhQ3Padpab02M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4014.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(5660300002)(6506007)(1076003)(36756003)(508600001)(26005)(8936002)(4326008)(6512007)(52116002)(956004)(2906002)(316002)(83380400001)(38100700002)(2616005)(186003)(8676002)(66476007)(66946007)(66556008)(6486002)(107886003)(86362001)(38350700002)(4730100017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lNL+UzTmmI3j7GCUk1199qSxVBr2BUy6+HYmR/YntCaAZTtgPpXvMh17CKrb?=
 =?us-ascii?Q?gGlZFFkj3GfL1IyQkCt42a+j18+JScFTQNYLjyRyzzBmArtiol6Fok2ewqlH?=
 =?us-ascii?Q?2/fnhC96jG1LBqe9lmCXKTcC4jXsX3cuqO7gTITlMc7zt+BOMAlzRD8ek54V?=
 =?us-ascii?Q?2C52yPSBJfwFBf8xaidFhK2JHG67cbwihOIjKJs+Qf9P++AGjwQxciPeZv4z?=
 =?us-ascii?Q?5OBu2/2rgCG16aUQMrh4NY60nVQ0ZEGnTQbNXZPysPMIDsv3WOBEQN/ppQyR?=
 =?us-ascii?Q?H12TSlwXVYyLr/Ge+CIfFARTPXOsJSq8uruRs6qVElYQB2ANXdyQyJvYvug5?=
 =?us-ascii?Q?gaQx/Bu/CrhuLCe2cVhefG4/dzRsvJZdVF7y9kKI2skDXmZ9qYNbS/jfZXqE?=
 =?us-ascii?Q?Uf5msC4XLOCrmqVpRMLPar79ZMeoQmBD0vb8C91WiQuyC0MbDfqVqCNBopzk?=
 =?us-ascii?Q?MGVQgHWOOgqDACGLuRJdCffzitehdUYcEYoov01QFNBxj9Gcas24ehcMC6/V?=
 =?us-ascii?Q?Nj7jchO/85lYCNoqJq3EHBzFT1zXOtWPFkCneFIE6kdE/PYfZ7pjc44xovZ/?=
 =?us-ascii?Q?94L8Eic+QOo+Ho+aWCG/sg7Nmc4WJYOjeWMf0NvC0tEZ9dZCP64uLgfO47rp?=
 =?us-ascii?Q?MyjwBBELEbqOuTstYzc66wOZe6LubVf+c3q7JcqGW3l7aQSXB3n9/bxqJpFb?=
 =?us-ascii?Q?LYqfaKno0Q0CbSggIWW8Sv/dVyCLW3uoWtkFOP0Ai0cl8m5mp20jbzZOJAHd?=
 =?us-ascii?Q?/Iq6ELfvZGvTarFcWRe7QnqWQ+5MazgCJEtstoDiLsnhpjAWspEXgQW95Zlt?=
 =?us-ascii?Q?klApcjG4wn9CpzBIBSZetzJlgsUvMcgD5EzJIZFw3rZjYoII/5+mHzg0Bd15?=
 =?us-ascii?Q?uxC0kIN0/8VoR4FPqU5MMzm7lA5+5JEoYpc7yLYSojAJtF2T59LXPq8ERnfA?=
 =?us-ascii?Q?bXYPSHBCmYC+R98PS16tFn8pBISCrSNzHxdMf6R6jvhdiox7d3anq+Nc1R/a?=
 =?us-ascii?Q?kDXmx/ONcLkg5/YTMODx8dhtPMSSU5gWDPEaxmxtOPSW+GnEQj5Kc6ETE5Qj?=
 =?us-ascii?Q?HYWV9kejMUXwz2a5sbnn/s3bO+wVd+YT0CEdp5uiFIWZPFxOpiThM/HiimMg?=
 =?us-ascii?Q?Ph1rc01WaIPWWlH8T2PmfnPs/jOAKSXQZiWlRrkKEXfMobnvBDUzHAwwTChV?=
 =?us-ascii?Q?V5KMc2vn6xij2tgt2HSRMgYBaRA0qV6gzOuABPgOfmCSl3gxN0V59kZlDHNc?=
 =?us-ascii?Q?jHSDt4MBOLwqevr2Uku+VJ924Ixj+wZVbxFcCj8c6leG0wn2cT0HV/IzuIdP?=
 =?us-ascii?Q?W3uGUZ3FNgBlib3LHgRtyr/en3i/6zf81uL9Wkeab2luOJ9Wx10gAoHaz510?=
 =?us-ascii?Q?8BtipCz7f77CBgXBs94wRyrIVMXIxQMriwyf/m2BER9AmVVKM89aTbDwYFdE?=
 =?us-ascii?Q?WrHN/PqOBhzvw7l6JX1VLJEEH/lgIKNZie6au09O3V4B1m98UJW1Fa4okI3s?=
 =?us-ascii?Q?49O+GeoDOX3CIfR0TYHv/3y5j1dVgsQLSMzi4yaaSJPiZh8WHlaugv8LvYzv?=
 =?us-ascii?Q?KsR93h8TvTZPWyHqheiVXusARpMZVpjhY1X/tUnxmUnP/kGxSiICwfDKvH6n?=
 =?us-ascii?Q?kyunDH7DMCtAPYT1201BD5E=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c94ede08-5003-4125-ef27-08d995d1053f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4014.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 02:58:41.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/e8okVKohOpZXx4a3e/iyfyTJJa/3DKq5EQV2tgT5mdUT6yNsWeam6j0mgP/3VwSfGTqrnzFZcf2p0S7TJOvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2448
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

fix f2fs.rst build warning.

Fixes: 151b1982be5d (f2fs: compress: add nocompress extensions support)
Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 Documentation/filesystems/f2fs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 4294db649fa8..6ee2be259f46 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -301,7 +301,7 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
 			 For other files, we can still enable compression via ioctl.
 			 Note that, there is one reserved special extension '*', it
 			 can be set to enable compression for all files.
-nocompress_extension=%s	   Support adding specified extension, so that f2fs can disable
+nocompress_extension=%s	 Support adding specified extension, so that f2fs can disable
 			 compression on those corresponding files, just contrary to compression extension.
 			 If you know exactly which files cannot be compressed, you can use this.
 			 The same extension name can't appear in both compress and nocompress
-- 
2.25.1

