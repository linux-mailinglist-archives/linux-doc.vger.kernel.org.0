Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C02580209
	for <lists+linux-doc@lfdr.de>; Mon, 25 Jul 2022 17:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236329AbiGYPiv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jul 2022 11:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbiGYPip (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 11:38:45 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B993218E06;
        Mon, 25 Jul 2022 08:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rg/eoQndPayKiPVltfUj5euniZ/HeZjNN14mJG/CXt6j75sUNLk+ofA+hRPlOIyMsQwQ4gYC6Z8E1Et1AAA8FcHnRV2gYlPtMZ1cVDKubbLu0FbY6QGK8Tf24OuvxKyJop+alQ8RJARxI+mrU48daw/i/3H6l2Og1T6DrfA2Wn8g+eKW/KtZhFbvkCselaTMa9BU+kg4hz3vKJXzSIPThM8mH7ZCSZCg+tHalVOdzG4ndBKKqWwY+IihJ3xj9YdieU56JRMR0GyW9cpA5/Jj6iAhQG3h0UfC3L53OqPzXWyAMj6OdQ+AurPg2A+E6lsqfgHh7vkn6dH6etKDEYab0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt8GmPnXeFRjGPZdW8+JNJkYrYX5L0Vy3LaAG7eFqko=;
 b=e6vGv9hPtCNm8254NqZZ6rTyd9kHL/YRSo2t1II61AW+viFPOYnrkS7neQcPTgwUfod4hfR0J1HlbqECM50Ip5bN20weetJ8H3Sl39ZwlJhbYoJLv+z8FCx71mDv6X0Nf9ybHKOqUVRYwAcMlDn6FUkw+mLAjExq3mfpvuOnLx/CFyr4ZVsmFX0x4kX+WkQ5dzlPBCxWAxx06hbNbDQoqnXFyb3ut4g3TfplkyNQ1sszIAd5wiPwS5bRgVN8Dajs84D5j3zv9KfwhhG5B6Ck2lGKQLCOW8wAv0A1D08zpvMKAfAtfys0IqFqY03nS61KevYKQ1lT9iltgxubg8bnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt8GmPnXeFRjGPZdW8+JNJkYrYX5L0Vy3LaAG7eFqko=;
 b=piWJ7kWataiV0VPFaqSvKmOyLmcpe6gj8O1bPBNvSpmYQXKs/5j1QZMkkb4R4OBNcQG8KnNpVTa3f8eZNWrPzDyPqQToEN2Hs6RW2XfUE3evapLtyOjxHVCEZ4pNuSV4lK/zGRg1dS7ECcm/jIdpFezSnmwbw4SS7zEd0a+xKuvrDUqmMhQ+meok70DLUCu4PfRTioDf0EB/LqWZtQMewUOH/HBwm0Rmw44Q1hJTYHwRVt7k4mTDsXE6cnuFXCHHVNk6JxY7HLK+rpQW7+odWPfOHwbx5d8xwD0clg+Xn8V316xozu8RPA2KL/lOjk+B6Qofd7pZLpGBusDXikwYhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VI1PR03MB6464.eurprd03.prod.outlook.com (2603:10a6:800:19e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 15:37:54 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::59ef:35d2:2f27:e98b]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::59ef:35d2:2f27:e98b%4]) with mapi id 15.20.5458.018; Mon, 25 Jul 2022
 15:37:54 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        Alexandru Marginean <alexandru.marginean@nxp.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
        Sean Anderson <sean.anderson@seco.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 07/11] net: phy: Add support for rate adaptation
Date:   Mon, 25 Jul 2022 11:37:25 -0400
Message-Id: <20220725153730.2604096-8-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220725153730.2604096-1-sean.anderson@seco.com>
References: <20220725153730.2604096-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:208:32e::22) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c5f89da-363b-4416-95d8-08da6e53a3f6
X-MS-TrafficTypeDiagnostic: VI1PR03MB6464:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0EQh6UN3O7pCKxFT4d75TSl7t+hCnYqRzRjHyI0zoMUY2ezygEBmRPls4wKHkyXFxkveAHil5F6tWY0mBJiQ2AJJfUJrUGDQbqXojVLQrFUiwegjtpf9zH68GbTxFeJOP/79jQeUS5SV8pvIuA6MuO9r2S3y3XFlnPFE7iDqPQ3hENdmkWIA/Kt+tkwIx4WfBHaS3ogMdh50Gyfc5SELdXWnYyYJEjeohj9i1VRIiSQqbOwJLFuhXMDBqVSdh28ITzNlKSkWS1GC7fDK4Q3KeYZvLzl5voMzfdM8stUn4owGazZFJ/zvtLuIdeilG/t1O2qHmDi94T++3uNFThHSDMG8hcNxm4XkfcPUKpSrjj2vOSw92hXXbgF0SzCVCzBoGFxSn7KChDf3+EtkrV6/iWFDaRqjhX8nSnL3GVS23cqd2HdFPYMcYtXQoa06o/OVajdfgMuJH5DrNzu14rV/B6ZcxdI6cul2i4exZwi8RiqKLEtwj4xjgHQr8tZQUSB8ZPjjCDPa8CBJFXnYQ4Sw8PWL2wo+8M+d3o9Iujoka0k44hDOM69JoQw69hsxraH5ZgHm+Fn/vI9vReJy0CjvXe1bAYZ1giqDJaXjbiCBJgpwo1axhpYgt5uro0HbJYxQmKJ+Q7GQv3CPuWAR/B5TNlYZyIKscZZSY8KThflimGpmBiNczi6e/f/kwAbXxvNsf390tZXHu3fh9pY+wYg7rjnJmOPNWwpzjG8kuhQa8fhjHGPPv+zZf5l04KVFawq21vz6QV6Oq/ebw2nVk9YOUv6gSvxVsps8C6i+m3uXQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(136003)(396003)(346002)(366004)(376002)(36756003)(110136005)(54906003)(186003)(38350700002)(8676002)(66556008)(66946007)(316002)(66476007)(38100700002)(8936002)(86362001)(2616005)(478600001)(4326008)(5660300002)(6666004)(83380400001)(7416002)(6506007)(41300700001)(6486002)(44832011)(30864003)(26005)(6512007)(52116002)(1076003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZIXFynB8B/ueVQSfjADmxJTwg08NS0gja2b+UIxkIm+Ng7jcQKvDmhLRorOq?=
 =?us-ascii?Q?qmk6cEucNVyaIDjJYDC/ayMbcvAhkUqjaBiSyi1zbN3308LfKM3GtOM1UpWQ?=
 =?us-ascii?Q?F11TVAwm8YrpWvMieBAoo71lRlogECNeghVagr2LUD9fNR1Si7pnaL2qvXwv?=
 =?us-ascii?Q?kZiA9BuCb5b0g8Iq2Q+PBV5LNrFTkIHyVB+TcvAEyuNKc2FV/riRkYkCiXWp?=
 =?us-ascii?Q?rP61BOPmz3dSLT356i2zFtxnWlnsS/7A7op9g0qrfJN8Xt2LjwCmTCwYWQDX?=
 =?us-ascii?Q?/VRotb09E+YMzwWcAMGWnugOr0gXpZHB1iubE04PgawquYmeWNxms1jLkgGL?=
 =?us-ascii?Q?xvdE83JRjYB9U5Ij+2WDl2mMvbSM9Qi8I7siHw9axzWTi5zgmN8iqP7LqKzq?=
 =?us-ascii?Q?S5RkXmJBZhh/o/E2+DXENN2hvbN/jCKMN7q9+K4zuizTfA/fmpGqwltvOkzZ?=
 =?us-ascii?Q?RdQnF1+rvjq3i4mI0l8qwFJaQcBTtiIt194ii1ET+MzzNnHs8iEV1a0szF8J?=
 =?us-ascii?Q?8XuxSBq/wxGegHSbJcmEM4PL9v7MS29UaJy0qInPXi4CR8bzQkZeV781GW+x?=
 =?us-ascii?Q?ZH1vlTE9PLC3Xp+yfKZjn2/uCr67xI3hfouLWMpHodDSQ+ZZioeWqVlfzlR7?=
 =?us-ascii?Q?6ZgJKTX5xTKQsOB4jsRS1qOT4gj37HMgtw9QMroOFPsH60lCp0AuX4q7bx4S?=
 =?us-ascii?Q?s/FbvdXM8HYr9mfoX1qSc76UvSKGMqsWiSJyR9t9tD6Jen+e1uq5dvISaJ0l?=
 =?us-ascii?Q?eDaWZIVO3RCFjg7ZDQiR3K6h2tpzMejuoCKedLxxuVlQfaIL6w80bOHAafQP?=
 =?us-ascii?Q?JVYJVNWpuECO3IAl2VIQ31d/xPn8AfIch90yh2miDOU+OSFN1YTwigjBIwRV?=
 =?us-ascii?Q?nZq1MgioAV2/2gu8ycOFpgzUbkHqLh4VYcqP+yx6LFNTRAZjCnsooJba9DkA?=
 =?us-ascii?Q?0gjwGVytdeSDyT9jG8uyNRipSeHMp6oSX8HOS2OvlU4RC8u8FCX5CKuFOUQR?=
 =?us-ascii?Q?q0/ikoySyZqL+0ZF9OIEhmUyeNIYzjsxSPZ4JuFd+b5TdBSJAetF3r2lwygs?=
 =?us-ascii?Q?hHHyYrmCpJufm3yjhT4/ZXGvzKH4Q3FzHDGZ54jxvMjcwj9dpIzrmbXSW1Lx?=
 =?us-ascii?Q?KLCs2Gwueb0HAFf1bRs8Esj2ERzokIqqv98E4GDAdWarpWhr94jUgwt9kVjM?=
 =?us-ascii?Q?VsIX7TqrjgZKcrnMrXZ4Ml7Qsnb8uAhemY3CAoF4B3U8fn3JAPvSmdu6jWgy?=
 =?us-ascii?Q?fGJMxmnufN8TXzYBvKEr1FOhDUsZ/3q4S4y+18G3rbPZzdWHzV0iW+/XeSDk?=
 =?us-ascii?Q?fTaoBOkGfK0xv1ZtTF4RfZnx/utZh4PZ8ykVsbeAyksIb7qqDeAZ69ptYUUj?=
 =?us-ascii?Q?4feSEybdtnQ3vtqkWiOyCsnjroE0D1Dg+d/O79ESwEPjziKQf0Lu9aJQQ1Fp?=
 =?us-ascii?Q?+0otRtssjw+wmeI3tM2YtC4Otfky0vyF6lBH5HY6BbfZKfSUVAjJTTobBk7+?=
 =?us-ascii?Q?ATPD1EZJU+ECr95t2a50YGsxm8WQo9TSgyfgZMngQJsaOhdoDwOsks9883Kx?=
 =?us-ascii?Q?+f1qNbpJAisvPjNXdSndrCFCaaGlK+gicbFQjYpcJTteUqwwxFCXwkXzhZEq?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5f89da-363b-4416-95d8-08da6e53a3f6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 15:37:53.9315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWiSkMP2spdhkcy3u5aerW6LRNXeXUCT0d2kZTtAnniXZ0212JVG696rAMdX86LUR5CoqLCQg/0fPzhHdb+eUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6464
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds support for rate adaptation to the phy subsystem. The general
idea is that the phy interface runs at one speed, and the MAC throttles
the rate at which it sends packets to the link speed. There's a good
overview of several techniques for achieving this at [1]. This patch
adds support for three: pause-frame based (such as in Aquantia phys),
CRS-based (such as in 10PASS-TS and 2BASE-TL), and open-loop-based (such
as in 10GBASE-W).

This patch makes a few assumptions and a few non assumptions about the
types of rate adaptation available. First, it assumes that different phys
may use different forms of rate adaptation. Second, it assumes that phys
can use rate adaptation for any of their supported link speeds (e.g. if a
phy supports 10BASE-T and XGMII, then it can adapt XGMII to 10BASE-T).
Third, it does not assume that all interface modes will use the same form
of rate adaptation. Fourth, it does not assume that all phy devices will
support rate adaptation (even some do). Relaxing or strengthening these
(non-)assumptions could result in a different API. For example, if all
interface modes were assumed to use the same form of rate adaptation, then
a bitmask of interface modes supportting rate adaptation would suffice.

For some better visibility into the process, the current rate adaptation
mode is exposed as part of the ethtool ksettings. For the moment, only
read access is supported. I'm not sure what userspace might want to
configure yet (disable it altogether, disable just one mode, specify the
mode to use, etc.). For the moment, since only pause-based rate
adaptation support is added in the next few commits, rate adaptation can
be disabled altogether by adjusting the advertisement.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---
Should the unimplemented adaptation modes be kept in?

(no changes since v2)

Changes in v2:
- Use int/defines instead of enum to allow for use in ioctls/netlink
- Add locking to phy_get_rate_adaptation
- Add (read-only) ethtool support for rate adaptation
- Move part of commit message to cover letter, as it gives a good
  overview of the whole series, and allows this patch to focus more on
  the specifics.

 Documentation/networking/ethtool-netlink.rst |  2 ++
 drivers/net/phy/phy-core.c                   | 15 +++++++++++
 drivers/net/phy/phy.c                        | 28 ++++++++++++++++++++
 include/linux/phy.h                          | 22 ++++++++++++++-
 include/uapi/linux/ethtool.h                 | 18 +++++++++++--
 include/uapi/linux/ethtool_netlink.h         |  1 +
 net/ethtool/ioctl.c                          |  1 +
 net/ethtool/linkmodes.c                      |  5 ++++
 8 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index dbca3e9ec782..65ed29e78499 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -426,6 +426,7 @@ Kernel response contents:
   ``ETHTOOL_A_LINKMODES_DUPLEX``              u8      duplex mode
   ``ETHTOOL_A_LINKMODES_MASTER_SLAVE_CFG``    u8      Master/slave port mode
   ``ETHTOOL_A_LINKMODES_MASTER_SLAVE_STATE``  u8      Master/slave port state
+  ``ETHTOOL_A_LINKMODES_RATE_ADAPTATION``     u8      PHY rate adaptation
   ==========================================  ======  ==========================
 
 For ``ETHTOOL_A_LINKMODES_OURS``, value represents advertised modes and mask
@@ -449,6 +450,7 @@ Request contents:
   ``ETHTOOL_A_LINKMODES_SPEED``               u32     link speed (Mb/s)
   ``ETHTOOL_A_LINKMODES_DUPLEX``              u8      duplex mode
   ``ETHTOOL_A_LINKMODES_MASTER_SLAVE_CFG``    u8      Master/slave port mode
+  ``ETHTOOL_A_LINKMODES_RATE_ADAPTATION``     u8      PHY rate adaptation
   ``ETHTOOL_A_LINKMODES_LANES``               u32     lanes
   ==========================================  ======  ==========================
 
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 1f2531a1a876..dc70a9088544 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -74,6 +74,21 @@ const char *phy_duplex_to_str(unsigned int duplex)
 }
 EXPORT_SYMBOL_GPL(phy_duplex_to_str);
 
+const char *phy_rate_adaptation_to_str(int rate_adaptation)
+{
+	switch (rate_adaptation) {
+	case RATE_ADAPT_NONE:
+		return "none";
+	case RATE_ADAPT_PAUSE:
+		return "pause";
+	case RATE_ADAPT_CRS:
+		return "crs";
+	case RATE_ADAPT_OPEN_LOOP:
+		return "open-loop";
+	}
+	return "Unsupported (update phy-core.c)";
+}
+
 /* A mapping of all SUPPORTED settings to speed/duplex.  This table
  * must be grouped by speed and sorted in descending match priority
  * - iow, descending speed.
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 8d3ee3a6495b..77cbf07852e6 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -114,6 +114,33 @@ void phy_print_status(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_print_status);
 
+/**
+ * phy_get_rate_adaptation - determine if rate adaptation is supported
+ * @phydev: The phy device to return rate adaptation for
+ * @iface: The interface mode to use
+ *
+ * This determines the type of rate adaptation (if any) that @phy supports
+ * using @iface. @iface may be %PHY_INTERFACE_MODE_NA to determine if any
+ * interface supports rate adaptation.
+ *
+ * Return: The type of rate adaptation @phy supports for @iface, or
+ *         %RATE_ADAPT_NONE.
+ */
+int phy_get_rate_adaptation(struct phy_device *phydev,
+			    phy_interface_t iface)
+{
+	int ret = RATE_ADAPT_NONE;
+
+	if (phydev->drv->get_rate_adaptation) {
+		mutex_lock(&phydev->lock);
+		ret = phydev->drv->get_rate_adaptation(phydev, iface);
+		mutex_unlock(&phydev->lock);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_get_rate_adaptation);
+
 /**
  * phy_config_interrupt - configure the PHY device for the requested interrupts
  * @phydev: the phy_device struct
@@ -256,6 +283,7 @@ void phy_ethtool_ksettings_get(struct phy_device *phydev,
 	cmd->base.duplex = phydev->duplex;
 	cmd->base.master_slave_cfg = phydev->master_slave_get;
 	cmd->base.master_slave_state = phydev->master_slave_state;
+	cmd->base.rate_adaptation = phydev->rate_adaptation;
 	if (phydev->interface == PHY_INTERFACE_MODE_MOCA)
 		cmd->base.port = PORT_BNC;
 	else
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 81ce76c3e799..4ba8126b64f3 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -276,7 +276,6 @@ static inline const char *phy_modes(phy_interface_t interface)
 	}
 }
 
-
 #define PHY_INIT_TIMEOUT	100000
 #define PHY_FORCE_TIMEOUT	10
 
@@ -570,6 +569,7 @@ struct macsec_ops;
  * @lp_advertising: Current link partner advertised linkmodes
  * @eee_broken_modes: Energy efficient ethernet modes which should be prohibited
  * @autoneg: Flag autoneg being used
+ * @rate_adaptation: Current rate adaptation mode
  * @link: Current link state
  * @autoneg_complete: Flag auto negotiation of the link has completed
  * @mdix: Current crossover
@@ -637,6 +637,8 @@ struct phy_device {
 	unsigned irq_suspended:1;
 	unsigned irq_rerun:1;
 
+	int rate_adaptation;
+
 	enum phy_state state;
 
 	u32 dev_flags;
@@ -801,6 +803,21 @@ struct phy_driver {
 	 */
 	int (*get_features)(struct phy_device *phydev);
 
+	/**
+	 * @get_rate_adaptation: Get the supported type of rate adaptation for a
+	 * particular phy interface. This is used by phy consumers to determine
+	 * whether to advertise lower-speed modes for that interface. It is
+	 * assumed that if a rate adaptation mode is supported on an interface,
+	 * then that interface's rate can be adapted to all slower link speeds
+	 * supported by the phy. If iface is %PHY_INTERFACE_MODE_NA, and the phy
+	 * supports any kind of rate adaptation for any interface, then it must
+	 * return that rate adaptation mode (preferring %RATE_ADAPT_PAUSE, to
+	 * %RATE_ADAPT_CRS). If the interface is not supported, this should
+	 * return %RATE_ADAPT_NONE.
+	 */
+	int (*get_rate_adaptation)(struct phy_device *phydev,
+				   phy_interface_t iface);
+
 	/* PHY Power Management */
 	/** @suspend: Suspend the hardware, saving state if needed */
 	int (*suspend)(struct phy_device *phydev);
@@ -967,6 +984,7 @@ struct phy_fixup {
 
 const char *phy_speed_to_str(int speed);
 const char *phy_duplex_to_str(unsigned int duplex);
+const char *phy_rate_adaptation_to_str(int rate_adaptation);
 
 /* A structure for mapping a particular speed and duplex
  * combination to a particular SUPPORTED and ADVERTISED value
@@ -1681,6 +1699,8 @@ int phy_disable_interrupts(struct phy_device *phydev);
 void phy_request_interrupt(struct phy_device *phydev);
 void phy_free_interrupt(struct phy_device *phydev);
 void phy_print_status(struct phy_device *phydev);
+int phy_get_rate_adaptation(struct phy_device *phydev,
+			    phy_interface_t iface);
 void phy_set_max_speed(struct phy_device *phydev, u32 max_speed);
 void phy_remove_link_mode(struct phy_device *phydev, u32 link_mode);
 void phy_advertise_supported(struct phy_device *phydev);
diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
index e0f0ee9bc89e..3978f9c3fb83 100644
--- a/include/uapi/linux/ethtool.h
+++ b/include/uapi/linux/ethtool.h
@@ -1840,6 +1840,20 @@ static inline int ethtool_validate_duplex(__u8 duplex)
 #define MASTER_SLAVE_STATE_SLAVE		3
 #define MASTER_SLAVE_STATE_ERR			4
 
+/* These are used to throttle the rate of data on the phy interface when the
+ * native speed of the interface is higher than the link speed. These should
+ * not be used for phy interfaces which natively support multiple speeds (e.g.
+ * MII or SGMII).
+ */
+/* No rate adaptation performed. */
+#define RATE_ADAPT_NONE		0
+/* The phy sends pause frames to throttle the MAC. */
+#define RATE_ADAPT_PAUSE	1
+/* The phy asserts CRS to prevent the MAC from transmitting. */
+#define RATE_ADAPT_CRS		2
+/* The MAC is programmed with a sufficiently-large IPG. */
+#define RATE_ADAPT_OPEN_LOOP	3
+
 /* Which connector port. */
 #define PORT_TP			0x00
 #define PORT_AUI		0x01
@@ -2033,8 +2047,8 @@ enum ethtool_reset_flags {
  *	reported consistently by PHYLIB.  Read-only.
  * @master_slave_cfg: Master/slave port mode.
  * @master_slave_state: Master/slave port state.
+ * @rate_adaptation: Rate adaptation performed by the PHY
  * @reserved: Reserved for future use; see the note on reserved space.
- * @reserved1: Reserved for future use; see the note on reserved space.
  * @link_mode_masks: Variable length bitmaps.
  *
  * If autonegotiation is disabled, the speed and @duplex represent the
@@ -2085,7 +2099,7 @@ struct ethtool_link_settings {
 	__u8	transceiver;
 	__u8	master_slave_cfg;
 	__u8	master_slave_state;
-	__u8	reserved1[1];
+	__u8	rate_adaptation;
 	__u32	reserved[7];
 	__u32	link_mode_masks[0];
 	/* layout of link_mode_masks fields:
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index d2fb4f7be61b..3a5d81769ff4 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -242,6 +242,7 @@ enum {
 	ETHTOOL_A_LINKMODES_MASTER_SLAVE_CFG,	/* u8 */
 	ETHTOOL_A_LINKMODES_MASTER_SLAVE_STATE,	/* u8 */
 	ETHTOOL_A_LINKMODES_LANES,		/* u32 */
+	ETHTOOL_A_LINKMODES_RATE_ADAPTATION,	/* u8 */
 
 	/* add new constants above here */
 	__ETHTOOL_A_LINKMODES_CNT,
diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index 6a7308de192d..ef0ad300393a 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -571,6 +571,7 @@ static int ethtool_get_link_ksettings(struct net_device *dev,
 		= __ETHTOOL_LINK_MODE_MASK_NU32;
 	link_ksettings.base.master_slave_cfg = MASTER_SLAVE_CFG_UNSUPPORTED;
 	link_ksettings.base.master_slave_state = MASTER_SLAVE_STATE_UNSUPPORTED;
+	link_ksettings.base.rate_adaptation = RATE_ADAPT_NONE;
 
 	return store_link_ksettings_for_user(useraddr, &link_ksettings);
 }
diff --git a/net/ethtool/linkmodes.c b/net/ethtool/linkmodes.c
index 99b29b4fe947..7905bd985c7f 100644
--- a/net/ethtool/linkmodes.c
+++ b/net/ethtool/linkmodes.c
@@ -70,6 +70,7 @@ static int linkmodes_reply_size(const struct ethnl_req_info *req_base,
 		+ nla_total_size(sizeof(u32)) /* LINKMODES_SPEED */
 		+ nla_total_size(sizeof(u32)) /* LINKMODES_LANES */
 		+ nla_total_size(sizeof(u8)) /* LINKMODES_DUPLEX */
+		+ nla_total_size(sizeof(u8)) /* LINKMODES_RATE_ADAPTATION */
 		+ 0;
 	ret = ethnl_bitset_size(ksettings->link_modes.advertising,
 				ksettings->link_modes.supported,
@@ -143,6 +144,10 @@ static int linkmodes_fill_reply(struct sk_buff *skb,
 		       lsettings->master_slave_state))
 		return -EMSGSIZE;
 
+	if (nla_put_u8(skb, ETHTOOL_A_LINKMODES_RATE_ADAPTATION,
+		       lsettings->rate_adaptation))
+		return -EMSGSIZE;
+
 	return 0;
 }
 
-- 
2.35.1.1320.gc452695387.dirty

