Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2890B659374
	for <lists+linux-doc@lfdr.de>; Fri, 30 Dec 2022 01:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234308AbiL3ACH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Dec 2022 19:02:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234271AbiL3ACF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Dec 2022 19:02:05 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E65917419;
        Thu, 29 Dec 2022 16:02:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tneus3QX2j1uTbYCC5CMZnqey+n/nmmB5TXLRX0zcl6RtnjXRfDuwvnAJbyrU3/V6/HuRq7luYaj9qi4VK7qtUKgpfoXUWwSvsnL80sACpW8o3zLljfF0PGY0CnqpXHfPf44lY3TrkPNOLOxzHFJiNMuRDEza9fWqciKwYPJ0p/wQLpw5/t9w2OwVFBzGZFMC0ye/kxSzIInGf1xaRJZE0OlCqTZallUYGuHCTGAAa9ozLSoadRPNUveEkvK1FPGytmY2g+g3I79SvQ8Q/UOj0jFJoCuilj3/YyPwemqdJwLEPOd2m/AgodBKaOGc3gysG7WgLekO1YEEJvkeKySGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrXuW0UHdvIpj0Cmn/yEmOWmNOYOgPS6eSydCXg/ITE=;
 b=iI4+DfhEpzM0ZMEOpov3QYPQRUJxIzqS96nAOrTzoQVRzcIMPSSeQSuynvCqjNHVYrf5YhGA6app6pIstj/8jtY40yu3OhTrTpbTp7wR1NtAncvFTkwLKab8qGglFaoAluJu3rWZhUs+nj0Jfq7UdHt10hWyrYELu1obWUxHWQsnuFcDaGKibQOSNXHXFPH5F6GPByPYEIp/1FwqzR7ZQMNaMR9ysfRFCZT4V7DseVLOu61i49EWHdm7GyvNoJMP8CyHfybKqi3n4EHAszHT6cVD+o1iXMko22StltcrHXAbGGjHNDsLfWgmqpvOmh2TtLG8x4/+H0qWkRHgHLUWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrXuW0UHdvIpj0Cmn/yEmOWmNOYOgPS6eSydCXg/ITE=;
 b=iQIujmG79FkDJ1pEMpyYdIkEIDDcc38IQ0BsLaT3uXJIaAmA9y/zhSCkAlzMR2fSFK5cwR5NU2qcMDHTKcfn5RWVP0aMU1rcN9aDy7TDdumgq2zUcM/2I1GWUD1nWJfQsz6ghhRqoZ/aYnVj0l1PXtifGDp65R1Eif4V61OXunzoYQl6niIk5qog9KPDVRJPp74jvKIpd+So7Xodz9/GcKQpelOT7axcjcnwRvH048hfQyq5hXQox9IPA9WkV37c8A8kR8LxtJoJv4D2ieoz38P5RZQ47FpZwIgS53apn+7TJTI3PZ7h8IxOOah2BSZVTnthWlxVqFEwvjd0DNs/1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:01:58 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:01:58 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v9 05/10] phy: fsl: Add Lynx 10G SerDes driver
Date:   Thu, 29 Dec 2022 19:01:34 -0500
Message-Id: <20221230000139.2846763-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221230000139.2846763-1-sean.anderson@seco.com>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 23018532-6d86-4d62-2888-08dae9f911ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BYxsZTVJe01axIClzyqm+MCdrYzKb5XPL2JogLjzV4QhgkAKlAgNVaqRAQYcQqL419mRVK7u3SnQxXLVKZ4qjDd9i39a/s6vM6sL9vMnlF+EybGceaAu8/a8NiofGvj0eoUnVhIzB0WCUamIUJd55k83hv6cgfWOyLpYUvOWtAK7St4Ek8Gib/p+OdWTIoQq97UXZkF5W1OJTRo91NdnnDMrJAqTGW2mw1A38ob2KV8fCMqRLBGeLFqZ++nU2MDOHRKTdWl1p3ZirT40MJtXwXLmGX95lLcN63cXIRoKmTQi1OnL6UI83XsaPUGz3X0lg5GqExBGmXcrzWHmMXEWWhZgswXydoM7Ew/HDqlTmsg+he1SeCszhDyWhbgq5Pt5vMRva82wY37FZMkRrMPolE+8xR4bv0DVBwgxjf3x+F/eUyvUBaUwV6nioJNAJ2UceEQaMz508qg1YzM1f3w2ySD9blc4JetUIn3zVlwyCmMa6yn5HnDZ+aVmh6/tjudY9jsPPxKP9uYGlyDlz1juYOrEgwh6wfWjamX+zXvD79QFKXFYCroMuwHd5+zrtjwwecJ+5KKUyQwtK/zaaeZMxJPX3YeljLvz6hGe1gROCAR+lVpmFZ319SZizyOghdQn0XWh23CycynMxZecthoze3yHExC6ont8Rv79cKAmlYkXe4eK4Tv0owQoZVQGy3Uca16746nbGjxrFgPOYfSSLov99FKJi9SDhWUHbSQPG+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(30864003)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(966005)(6486002)(52116002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?evhOq/PqvV5QFSiH6ZkFVMukc/1stapPRzdoFJDd7QRf5rjhKjlsiEZIeTUe?=
 =?us-ascii?Q?TeRev4tcstJvY/VprmIl5xu5YuE55Atgu4qwzS84Btm+NZDxfpXBi9AIRvEs?=
 =?us-ascii?Q?OuGErQgKySca7t85qMbXs5IZf7h/IOCgSDk7kV4KzKAs9CF5B0DXGQcTCZfU?=
 =?us-ascii?Q?lGkQrbTxNgw3HbN/Q70N3hNlkYJfu+i8+8YzY0DV8eLTlo8+qlRA40M23xo0?=
 =?us-ascii?Q?prqX3/72oMdkBefVIpffHJit5SlmgSeZ0SQVHPJKHplCnTvvg7Zd/u1v8zE8?=
 =?us-ascii?Q?hXletlV3ZlFJp04ziT1iN2gYmaUp2xASHFbSIiBrV8pz7x0VHieucQmHE/ez?=
 =?us-ascii?Q?K32HvDI9D7qsh08bOEEQ2z+p9FEgkXqzjkQyyxJaA3u5vaCG/b0tSIVDQKoR?=
 =?us-ascii?Q?LClYbUZZLqGOGplAGob1DMvKLS6c9J1iyscNRAq7VSa2Fet2Za3b4HewwKDt?=
 =?us-ascii?Q?YpWOL+vpGPVhmTGVUOyNpPLhYLRv5LHUzMkFfXddvYBA8hr8XeTHzGVxFMPR?=
 =?us-ascii?Q?rFzc6cvcVI4qbwAfHCECtQjQKruXlsbScjOUdSwrOCjDMYYCfn+upJmSJ1tD?=
 =?us-ascii?Q?/ztEzfW/2SxIzk0nI5fElaaScEqGikJj2ZYqQODzIG9hus6SfUc9ukWz+NMl?=
 =?us-ascii?Q?/IMZd8Dzn0DYmj+x3CBGE3FtCOQpWteH4RC71lZpFkZTzCImD8pfAFTLdWvH?=
 =?us-ascii?Q?/15Imyu7M3ZFDN0lMAOhGiGJcNVTEeu8gY4zXsxPgmyBuOdFk/qEqcoFIYm7?=
 =?us-ascii?Q?vNW2PX+8jlrJjAywxHxQ7qTHdvhd1oo8riQT+1rtw+j0NGTCe45c4fuCljlP?=
 =?us-ascii?Q?b1qmU4uBDyPWop5OLti9qR87znYteL/qla8R6xiz1cBy5y0/AJOyxa99nSms?=
 =?us-ascii?Q?uVF5TkUZ681kpyDYDE84DudGG08rjT9Da5MN5fiQKxbYqhasiyVk228opOE7?=
 =?us-ascii?Q?rgEbX0x6419XvPLo8PXqdKQFL0L9El5H43bsIJMmyKMk30LeZEHPleWe+K/2?=
 =?us-ascii?Q?UCq+OiZDOjlcLErT0zuD31zUoaROGqRQVFK2xFRazDPv93/1zIlsPZWPj1JS?=
 =?us-ascii?Q?Z4/6YwJmyWdPGhUbxPQITvpeaUYrSyeOXgxsec7F5It1RRdMP1mrREU7ahOo?=
 =?us-ascii?Q?X1ySPEq1KxzO9KYzn+fNDLS3q+s6vaiLR4DSG9yoyVV/63Ixl8xqaD48B8HL?=
 =?us-ascii?Q?x/4x1B18OQP5XWeejdmhqBCfYhdtO+64UA0sc+0kFDYIFHkQpVvPq66mdyQ2?=
 =?us-ascii?Q?z1TsrF4kYLmkQjKOqBf74m6jZS44HE8yyCjK3VRDheBkHFdP148yPp0uUfFJ?=
 =?us-ascii?Q?1AHMxlhVJgItmes+ZRMpfe212FU+n+XZgu0bTx5uOp/Qfmc1eVRs77DqpPAD?=
 =?us-ascii?Q?dJwu/bcnOQKUUUiphtXcfXUmT5h/DCcozakD+vCAXqeksYYS5Iu4oc9RsZKy?=
 =?us-ascii?Q?Nu5PnWOTRRmNa43AC9uQUoLgNr//a83jOG/NJHQu/OLdYHji9wGm9I8c7cUq?=
 =?us-ascii?Q?CK0rpbIKyM97BJOK0BhbEAjqUoJFXk1p4WqFs2EJsXcg0zbwfmC4TQiU2RdH?=
 =?us-ascii?Q?bz7tESxiklqlm/XS5aGGy/Tn4qa/Pjs5lhMH5lUu+OtDG7Rmk7BYAyS6Xkq9?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23018532-6d86-4d62-2888-08dae9f911ac
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:01:58.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKHfphB5xBNKe/hWluC/Ivzxm/TeEvq2k7/7rLTMaX4djYBdwMMAecDTpYJ9tj3sp53vULRKV5odGUVuFMubpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds support for the Lynx 10G "SerDes" devices found on various NXP
QorIQ SoCs. There may be up to four SerDes devices on each SoC, each
supporting up to eight lanes. Protocol support for each SerDes is highly
heterogeneous, with each SoC typically having a totally different
selection of supported protocols for each lane. Additionally, the SerDes
devices on each SoC also have differing support. One SerDes will
typically support Ethernet on most lanes, while the other will typically
support PCIe on most lanes.

There is wide hardware support for this SerDes. It is present on QorIQ
T-Series and Layerscape processors. Because each SoC typically has
specific instructions and exceptions for its SerDes, I have limited the
initial scope of this module to just the LS1046A and LS1088A.
Additionally, I have only added support for Ethernet protocols. There is
not a great need for dynamic reconfiguration for other protocols (except
perhaps for M.2 cards), so support for them may never be added.

Nevertheless, I have tried to provide an obvious path for adding support
for other SoCs as well as other protocols. SATA just needs support for
configuring LNmSSCR0. PCIe may need to configure the equalization
registers. It also uses multiple lanes. I have tried to write the driver
with multi-lane support in mind, so there should not need to be any
large changes. Although there are 6 protocols supported, I have only
tested SGMII and XFI. The rest have been implemented as described in
the datasheet. Most of these protocols should work "as-is", but
10GBASE-KR will need PCS support for link training.

Unlike some other phys where e.g. PCIe x4 will use 4 separate phys all
configured for PCIe, this driver uses one phy configured to use 4 lanes.
This is because while the individual lanes may be configured
individually, the protocol selection acts on all lanes at once.
Additionally, the order which lanes should be configured in is specified
by the datasheet. To coordinate this, lanes are reserved in phy_init,
and released in phy_exit.

This driver was written with reference to the LS1046A reference manual.
However, it was informed by reference manuals for all processors with
mEMACs, especially the T4240 (which appears to have a "maxed-out"
configuration). The earlier P-series processors appear to be similar, but
have a different overall register layout (using "banks" instead of
separate SerDes). Perhaps this those use a "5G Lynx SerDes."

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v9:
- Split off clock "driver" into its own patch to allow for better
  review.
- Add ability to defer lane initialization to phy_init. This allows
  for easier transitioning between firmware-managed serdes and Linux-
  managed serdes, as the consumer (such as dpaa2, which knows what the
  firmware is doing) has the last say on who gets control.
- phy-type -> fsl,phy

Changes in v8:
- Remove unused variable from lynx_ls_mode_init

Changes in v7:
- Break out call order into generic documentation
- Refuse to switch "major" protocols
- Update Kconfig to reflect restrictions
- Remove set/clear of "pcs reset" bit, since it doesn't seem to fix
  anything.

Changes in v6:
- Update MAINTAINERS to include new files
- Include bitfield.h and slab.h to allow compilation on non-arm64
  arches.
- Depend on COMMON_CLK and either layerscape/ppc

Changes in v5:
- Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
  series to be applied directly to linux/master.
- Add fsl,lynx-10g.h to MAINTAINERS

Changes in v4:
- Rework all debug statements to remove use of __func__. Additional
  information has been provided as necessary.
- Consider alternative parent rates in round_rate and not in set_rate.
  Trying to modify out parent's rate in set_rate will deadlock.
- Explicitly perform a stop/reset sequence in set_rate. This way we
  always ensure that the PLL is properly stopped.
- Set the power-down bit when disabling the PLL. We can do this now that
  enable/disable aren't abused during the set rate sequence.
- Fix typos in QSGMII_OFFSET and XFI_OFFSET
- Rename LNmTECR0_TEQ_TYPE_PRE to LNmTECR0_TEQ_TYPE_POST to better
  reflect its function (adding post-cursor equalization).
- Use of_clk_hw_onecell_get instead of a custom function.
- Return struct clks from lynx_clks_init instead of embedding lynx_clk
  in lynx_priv.
- Rework PCCR helper functions; T-series SoCs differ from Layerscape SoCs
  primarily in the layout and offset of the PCCRs. This will help bring a
  cleaner abstraction layer. The caps have been removed, since this handles the
  only current usage.
- Convert to use new binding format. As a result of this, we no longer need to
  have protocols for PCIe or SATA. Additionally, modes now live in lynx_group
  instead of lynx_priv.
- Remove teq from lynx_proto_params, since it can be determined from
  preq_ratio/postq_ratio.
- Fix an early return from lynx_set_mode not releasing serdes->lock.
- Rename lynx_priv.conf to .cfg, since I kept mistyping it.

Changes in v3:
- Rename remaining references to QorIQ SerDes to Lynx 10G
- Fix PLL enable sequence by waiting for our reset request to be cleared
  before continuing. Do the same for the lock, even though it isn't as
  critical. Because we will delay for 1.5ms on average, use prepare
  instead of enable so we can sleep.
- Document the status of each protocol
- Fix offset of several bitfields in RECR0
- Take into account PLLRST_B, SDRST_B, and SDEN when considering whether
  a PLL is "enabled."
- Only power off unused lanes.
- Split mode lane mask into first/last lane (like group)
- Read modes from device tree
- Use caps to determine whether KX/KR are supported
- Move modes to lynx_priv
- Ensure that the protocol controller is not already in-use when we try
  to configure a new mode. This should only occur if the device tree is
  misconfigured (e.g. when QSGMII is selected on two lanes but there is
  only one QSGMII controller).
- Split PLL drivers off into their own file
- Add clock for "ext_dly" instead of writing the bit directly (and
  racing with any clock code).
- Use kasprintf instead of open-coding the snprintf dance
- Support 1000BASE-KX in lynx_lookup_proto. This still requires PCS
  support, so nothing is truly "enabled" yet.

Changes in v2:
- Rename driver to Lynx 10G (etc.)
- Fix not clearing group->pll after disabling it
- Support 1 and 2 phy-cells
- Power off lanes during probe
- Clear SGMIIaCR1_PCS_EN during probe
- Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
- Handle 1000BASE-KX in lynx_proto_mode_prep

 Documentation/driver-api/phy/index.rst    |    1 +
 Documentation/driver-api/phy/lynx_10g.rst |   58 +
 MAINTAINERS                               |    2 +
 drivers/phy/freescale/Kconfig             |   18 +-
 drivers/phy/freescale/Makefile            |    1 +
 drivers/phy/freescale/phy-fsl-lynx-10g.c  | 1224 +++++++++++++++++++++
 6 files changed, 1303 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
 create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c

diff --git a/Documentation/driver-api/phy/index.rst b/Documentation/driver-api/phy/index.rst
index 69ba1216de72..c9b7a4698dab 100644
--- a/Documentation/driver-api/phy/index.rst
+++ b/Documentation/driver-api/phy/index.rst
@@ -7,6 +7,7 @@ Generic PHY Framework
 .. toctree::
 
    phy
+   lynx_10g
    samsung-usb2
 
 .. only::  subproject and html
diff --git a/Documentation/driver-api/phy/lynx_10g.rst b/Documentation/driver-api/phy/lynx_10g.rst
new file mode 100644
index 000000000000..17f9a9580e24
--- /dev/null
+++ b/Documentation/driver-api/phy/lynx_10g.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+Lynx 10G Phy (QorIQ SerDes)
+===========================
+
+Using this phy
+--------------
+
+:c:func:`phy_get` just gets (or creates) a new :c:type:`phy` with the lanes
+described in the phandle. :c:func:`phy_init` is what actually reserves the
+lanes for use. Unlike some other drivers, when the phy is created, there is no
+default protocol. :c:func:`phy_set_mode <phy_set_mode_ext>` must be called in
+order to set the protocol.
+
+Supporting SoCs
+---------------
+
+Each new SoC needs a :c:type:`struct lynx_conf <lynx_conf>`, containing the
+number of lanes in each device, the endianness of the device, and the helper
+functions to use when selecting protocol controllers. For example, the
+configuration for the LS1046A is::
+
+    static const struct lynx_cfg ls1046a_cfg = {
+        .lanes = 4,
+        .endian = REGMAP_ENDIAN_BIG,
+        .mode_conflict = lynx_ls_mode_conflict,
+        .mode_apply = lynx_ls_mode_apply,
+        .mode_init = lynx_ls_mode_init,
+    };
+
+The ``mode_`` functions will generally be common to all SoCs in a series (e.g.
+all Layerscape SoCs or all T-series SoCs).
+
+In addition, you will need to add a device node as documented in
+``Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml``. This lets the
+driver know which lanes are available to configure.
+
+Supporting Protocols
+--------------------
+
+Each protocol is a combination of values which must be programmed into the lane
+registers. To add a new protocol, first add it to :c:type:`enum lynx_protocol
+<lynx_protocol>`. Add a new entry to ``lynx_proto_params``, and populate the
+appropriate fields. Modify ``lynx_lookup_proto`` to map the :c:type:`enum
+phy_mode <phy_mode>` to :c:type:`enum lynx_protocol <lynx_protocol>`. Finally,
+update the ``mode_conflict``, ``mode_apply``, and ``mode_init`` helpers to
+support your protocol.
+
+You may need to modify :c:func:`lynx_set_mode` in order to support your
+protocol. This can happen when you have added members to :c:type:`struct
+lynx_proto_params <lynx_proto_params>`. It can also happen if you have specific
+clocking requirements, or protocol-specific registers to program.
+
+Internal API Reference
+----------------------
+
+.. kernel-doc:: drivers/phy/freescale/phy-fsl-lynx-10g.c
diff --git a/MAINTAINERS b/MAINTAINERS
index c2802d4e61a6..f5e2d8188fa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12277,7 +12277,9 @@ T:	git https://github.com/linux-test-project/ltp.git
 LYNX 10G SERDES DRIVER
 M:	Sean Anderson <sean.anderson@seco.com>
 S:	Maintained
+F:	Documentation/driver-api/phy/lynx_10g.rst
 F:	drivers/clk/clk-fsl-lynx-10g.c
+F:	drivers/phy/freescale/phy-fsl-lynx-10g.c
 F:	include/dt-bindings/clock/fsl,lynx-10g.h
 F:	include/linux/phy/lynx-10g.h
 
diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 5d461232276f..6bebe00f5889 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -49,7 +49,23 @@ config PHY_FSL_LYNX_28G
 	  Only useful for a restricted set of Ethernet protocols.
 
 config PHY_FSL_LYNX_10G
-	tristate
+	tristate "Freescale QorIQ Lynx 10G SerDes support"
 	depends on COMMON_CLK
 	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
+	select GENERIC_PHY
 	select REGMAP_MMIO
+	help
+	  This adds support for the Lynx "SerDes" devices found on various QorIQ
+	  SoCs. There may be up to four SerDes devices on each SoC, and each
+	  device supports up to eight lanes. The SerDes is configured by
+	  default by the RCW, but this module is necessary in order to support
+	  some modes (such as 2.5G SGMII or 1000BASE-KX), or clock setups (as
+	  only as subset of clock configurations are supported by the RCW).
+	  The hardware supports a variety of protocols, including Ethernet,
+	  SATA, PCIe, and more exotic links such as Interlaken and Aurora. This
+	  driver only supports Ethernet, but it will try not to touch lanes
+	  configured for other protocols.
+
+	  If you have a QorIQ processor and want to dynamically reconfigure your
+	  SerDes, say Y. If this driver is compiled as a module, it will be
+	  named phy-fsl-lynx-10g and clk-fsl-lynx-10g.
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index cedb328bc4d2..32ad795be7c6 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -3,4 +3,5 @@ obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
 obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
 obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
+obj-$(CONFIG_PHY_FSL_LYNX_10G)		+= phy-fsl-lynx-10g.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/freescale/phy-fsl-lynx-10g.c
new file mode 100644
index 000000000000..e5bf69576b28
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
@@ -0,0 +1,1224 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
+ *
+ * This driver is for the Lynx 10G phys found on many QorIQ devices, including
+ * the Layerscape series.
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <linux/clk.h>
+#include <linux/platform_device.h>
+#include <linux/phy.h>
+#include <linux/phy/lynx-10g.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+
+#define TCALCR		0x90
+#define TCALCR1		0x94
+#define RCALCR		0xa0
+#define RCALCR1		0xa4
+
+#define CALCR_CALRST_B	BIT(27)
+
+#define LS_PCCR_BASE	0x200
+#define PCCR_STRIDE	0x4
+
+#define LS_PCCRa(a)	(LS_PCCR_BASE + (a) * PCCR_STRIDE)
+
+#define PCCR8_SGMIIa_KX		BIT(3)
+#define PCCR8_SGMIIa_MASK	GENMASK(3, 0)
+#define PCCR8_SGMIIa_SHIFT(a)	(28 - (a) * 4)
+
+#define PCCR9_QSGMIIa_MASK	GENMASK(2, 0)
+#define PCCR9_QSGMIIa_SHIFT(a)	(28 - (a) * 4)
+
+#define PCCRB_XFIa_MASK		GENMASK(2, 0)
+#define PCCRB_XFIa_SHIFT(a)	(28 - (a) * 4)
+
+#define LANE_BASE	0x800
+#define LANE_STRIDE	0x40
+#define LNm(m, off)	(LANE_BASE + (m) * LANE_STRIDE + (off))
+#define LNmGCR0(m)	LNm(m, 0x00)
+#define LNmGCR1(m)	LNm(m, 0x04)
+#define LNmSSCR0(m)	LNm(m, 0x0C)
+#define LNmRECR0(m)	LNm(m, 0x10)
+#define LNmRECR1(m)	LNm(m, 0x14)
+#define LNmTECR0(m)	LNm(m, 0x18)
+#define LNmSSCR1(m)	LNm(m, 0x1C)
+#define LNmTTLCR0(m)	LNm(m, 0x20)
+
+#define LNmGCR0_RPLL_LES	BIT(31)
+#define LNmGCR0_RRAT_SEL	GENMASK(29, 28)
+#define LNmGCR0_TPLL_LES	BIT(27)
+#define LNmGCR0_TRAT_SEL	GENMASK(25, 24)
+#define LNmGCR0_RRST_B		BIT(22)
+#define LNmGCR0_TRST_B		BIT(21)
+#define LNmGCR0_RX_PD		BIT(20)
+#define LNmGCR0_TX_PD		BIT(19)
+#define LNmGCR0_IF20BIT_EN	BIT(18)
+#define LNmGCR0_FIRST_LANE	BIT(16)
+#define LNmGCR0_TTRM_VM_SEL	GENMASK(13, 12)
+#define LNmGCR0_PROTS		GENMASK(11, 7)
+
+#define LNmGCR0_RAT_SEL_SAME		0b00
+#define LNmGCR0_RAT_SEL_HALF		0b01
+#define LNmGCR0_RAT_SEL_QUARTER		0b10
+#define LNmGCR0_RAT_SEL_DOUBLE		0b11
+
+#define LNmGCR0_PROTS_PCIE		0b00000
+#define LNmGCR0_PROTS_SGMII		0b00001
+#define LNmGCR0_PROTS_SATA		0b00010
+#define LNmGCR0_PROTS_XFI		0b01010
+
+#define LNmGCR1_RDAT_INV	BIT(31)
+#define LNmGCR1_TDAT_INV	BIT(30)
+#define LNmGCR1_OPAD_CTL	BIT(26)
+#define LNmGCR1_REIDL_TH	GENMASK(22, 20)
+#define LNmGCR1_REIDL_EX_SEL	GENMASK(19, 18)
+#define LNmGCR1_REIDL_ET_SEL	GENMASK(17, 16)
+#define LNmGCR1_REIDL_EX_MSB	BIT(15)
+#define LNmGCR1_REIDL_ET_MSB	BIT(14)
+#define LNmGCR1_REQ_CTL_SNP	BIT(13)
+#define LNmGCR1_REQ_CDR_SNP	BIT(12)
+#define LNmGCR1_TRSTDIR		BIT(7)
+#define LNmGCR1_REQ_BIN_SNP	BIT(6)
+#define LNmGCR1_ISLEW_RCTL	GENMASK(5, 4)
+#define LNmGCR1_OSLEW_RCTL	GENMASK(1, 0)
+
+#define LNmRECR0_RXEQ_BST	BIT(28)
+#define LNmRECR0_GK2OVD		GENMASK(27, 24)
+#define LNmRECR0_GK3OVD		GENMASK(19, 16)
+#define LNmRECR0_GK2OVD_EN	BIT(15)
+#define LNmRECR0_GK3OVD_EN	BIT(14)
+#define LNmRECR0_OSETOVD_EN	BIT(13)
+#define LNmRECR0_BASE_WAND	GENMASK(11, 10)
+#define LNmRECR0_OSETOVD	GENMASK(6, 0)
+
+#define LNmRECR0_BASE_WAND_OFF		0b00
+#define LNmRECR0_BASE_WAND_DEFAULT	0b01
+#define LNmRECR0_BASE_WAND_ALTERNATE	0b10
+#define LNmRECR0_BASE_WAND_OSETOVD	0b11
+
+#define LNmTECR0_TEQ_TYPE	GENMASK(29, 28)
+#define LNmTECR0_SGN_PREQ	BIT(26)
+#define LNmTECR0_RATIO_PREQ	GENMASK(25, 22)
+#define LNmTECR0_SGN_POST1Q	BIT(21)
+#define LNmTECR0_RATIO_PST1Q	GENMASK(20, 16)
+#define LNmTECR0_ADPT_EQ	GENMASK(13, 8)
+#define LNmTECR0_AMP_RED	GENMASK(5, 0)
+
+#define LNmTECR0_TEQ_TYPE_NONE		0b00
+#define LNmTECR0_TEQ_TYPE_POST		0b01
+#define LNmTECR0_TEQ_TYPE_BOTH		0b10
+
+#define LNmTTLCR0_FLT_SEL	GENMASK(29, 24)
+
+#define LS_SGMII_BASE	0x1800
+#define LS_QSGMII_BASE	0x1880
+#define LS_XFI_BASE	0x1980
+
+#define PCS_STRIDE	0x10
+#define CR_STRIDE	0x4
+#define PCSa(a, base, cr)	(base + (a) * PCS_STRIDE + (cr) * CR_STRIDE)
+
+#define PCSaCR1_MDEV_PORT	GENMASK(31, 27)
+
+#define LS_SGMIIaCR1(a)		PCSa(a, LS_SGMII_BASE, 1)
+#define SGMIIaCR1_SGPCS_EN	BIT(11)
+
+enum lynx_protocol {
+	LYNX_PROTO_NONE = 0,
+	LYNX_PROTO_SGMII,
+	LYNX_PROTO_SGMII25, /* Not tested */
+	LYNX_PROTO_1000BASEKX, /* Not tested */
+	LYNX_PROTO_QSGMII, /* Not tested */
+	LYNX_PROTO_XFI,
+	LYNX_PROTO_10GKR, /* Link training unimplemented */
+	LYNX_PROTO_LAST,
+};
+
+static const char lynx_proto_str[][16] = {
+	[LYNX_PROTO_NONE] = "unknown",
+	[LYNX_PROTO_SGMII] = "SGMII",
+	[LYNX_PROTO_SGMII25] = "2.5G SGMII",
+	[LYNX_PROTO_1000BASEKX] = "1000BASE-KX",
+	[LYNX_PROTO_QSGMII] = "QSGMII",
+	[LYNX_PROTO_XFI] = "XFI",
+	[LYNX_PROTO_10GKR] = "10GBASE-KR",
+};
+
+#define PROTO_MASK(proto) BIT(LYNX_PROTO_##proto)
+
+/**
+ * struct lynx_proto_params - Parameters for configuring a protocol
+ * @frate_khz: The PLL rate, in kHz
+ * @rat_sel: The divider to get the line rate
+ * @if20bit: Whether the proto is 20 bits or 10 bits
+ * @prots: Lane protocol select
+ * @reidl_th: Receiver electrical idle detection threshold
+ * @reidl_ex: Exit electrical idle filter
+ * @reidl_et: Enter idle filter
+ * @slew: Slew control
+ * @baseline_wander: Enable baseline wander correction
+ * @gain: Adaptive equalization gain override
+ * @offset_override: Adaptive equalization offset override
+ * @preq_ratio: Ratio of full swing transition bit to pre-cursor
+ * @postq_ratio: Ratio of full swing transition bit to first post-cursor.
+ * @adpt_eq: Transmitter Adjustments for 8G/10G
+ * @amp_red: Overall TX Amplitude Reduction
+ * @flt_sel: TTL configuration selector
+ */
+struct lynx_proto_params {
+	u32 frate_khz;
+	u8 rat_sel;
+	u8 prots;
+	u8 reidl_th;
+	u8 reidl_ex;
+	u8 reidl_et;
+	u8 slew;
+	u8 gain;
+	u8 baseline_wander;
+	u8 offset_override;
+	u8 preq_ratio;
+	u8 postq_ratio;
+	u8 adpt_eq;
+	u8 amp_red;
+	u8 flt_sel;
+	bool if20bit;
+};
+
+static const struct lynx_proto_params lynx_proto_params[] = {
+	[LYNX_PROTO_SGMII] = {
+		.frate_khz = 5000000,
+		.rat_sel = LNmGCR0_RAT_SEL_QUARTER,
+		.if20bit = false,
+		.prots = LNmGCR0_PROTS_SGMII,
+		.reidl_th = 0b001,
+		.reidl_ex = 0b011,
+		.reidl_et = 0b100,
+		.slew = 0b01,
+		.gain = 0b1111,
+		.offset_override = 0b0011111,
+		.adpt_eq = 0b110000,
+		.amp_red = 0b000110,
+		.flt_sel = 0b111001,
+	},
+	[LYNX_PROTO_1000BASEKX] = {
+		.frate_khz = 5000000,
+		.rat_sel = LNmGCR0_RAT_SEL_QUARTER,
+		.if20bit = false,
+		.prots = LNmGCR0_PROTS_SGMII,
+		.slew = 0b01,
+		.gain = 0b1111,
+		.offset_override = 0b0011111,
+		.adpt_eq = 0b110000,
+		.flt_sel = 0b111001,
+	},
+	[LYNX_PROTO_SGMII25] = {
+		.frate_khz = 3125000,
+		.rat_sel = LNmGCR0_RAT_SEL_SAME,
+		.if20bit = false,
+		.prots = LNmGCR0_PROTS_SGMII,
+		.slew = 0b10,
+		.offset_override = 0b0011111,
+		.postq_ratio = 0b00110,
+		.adpt_eq = 0b110000,
+	},
+	[LYNX_PROTO_QSGMII] = {
+		.frate_khz = 5000000,
+		.rat_sel = LNmGCR0_RAT_SEL_SAME,
+		.if20bit = true,
+		.prots = LNmGCR0_PROTS_SGMII,
+		.slew = 0b01,
+		.offset_override = 0b0011111,
+		.postq_ratio = 0b00110,
+		.adpt_eq = 0b110000,
+		.amp_red = 0b000010,
+	},
+	[LYNX_PROTO_XFI] = {
+		.frate_khz = 5156250,
+		.rat_sel = LNmGCR0_RAT_SEL_DOUBLE,
+		.if20bit = true,
+		.prots = LNmGCR0_PROTS_XFI,
+		.slew = 0b01,
+		.baseline_wander = LNmRECR0_BASE_WAND_DEFAULT,
+		.offset_override = 0b1011111,
+		.postq_ratio = 0b00011,
+		.adpt_eq = 0b110000,
+		.amp_red = 0b000111,
+	},
+	[LYNX_PROTO_10GKR] = {
+		.frate_khz = 5156250,
+		.rat_sel = LNmGCR0_RAT_SEL_DOUBLE,
+		.if20bit = true,
+		.prots = LNmGCR0_PROTS_XFI,
+		.slew = 0b01,
+		.baseline_wander = LNmRECR0_BASE_WAND_DEFAULT,
+		.offset_override = 0b1011111,
+		.preq_ratio = 0b0011,
+		.postq_ratio = 0b01100,
+		.adpt_eq = 0b110000,
+	},
+};
+
+/**
+ * struct lynx_mode - A single configuration of a protocol controller
+ * @protos: A bitmask of the &enum lynx_protocol this mode supports
+ * @pccr: The number of the PCCR which contains this mode
+ * @idx: The index of the protocol controller. For example, SGMIIB would have
+ *       index 1.
+ * @cfg: The value to program into the controller to select this mode
+ *
+ * The serdes has multiple protocol controllers which can be each be selected
+ * independently. Depending on their configuration, they may use multiple lanes
+ * at once (e.g. AUI or PCIe x4). Additionally, multiple protocols may be
+ * supported by a single mode (XFI and 10GKR differ only in their protocol
+ * parameters).
+ */
+struct lynx_mode {
+	u16 protos;
+	u8 pccr;
+	u8 idx;
+	u8 cfg;
+};
+
+static_assert(LYNX_PROTO_LAST - 1 <=
+	      sizeof_field(struct lynx_mode, protos) * BITS_PER_BYTE);
+
+struct lynx_priv;
+
+/**
+ * struct lynx_cfg - Configuration for a particular serdes
+ * @lanes: Number of lanes
+ * @endian: Endianness of the registers
+ * @mode_conflict: Determine whether a protocol controller is already in use
+ *                 (by another group).
+ * @mode_apply: Apply a given protocol. This includes programming the
+ *              appropriate config into the PCCR, as well as enabling/disabling
+ *              any other registers (such as the enabling MDIO access).
+ *              %LYNX_PROTO_NONE may be used to clear any associated registers.
+ * @mode_init: Finish initializing a mode. All fields are filled in except for
+ *             protos. Type is one of PHY_TYPE_*. mode->protos should be filled
+ *             in, and the other fields should be sanity-checked.
+ */
+struct lynx_cfg {
+	unsigned int lanes;
+	enum regmap_endian endian;
+	bool (*mode_conflict)(struct lynx_priv *serdes,
+			      const struct lynx_mode *mode);
+	void (*mode_apply)(struct lynx_priv *serdes,
+			   const struct lynx_mode *mode,
+			   enum lynx_protocol proto);
+	int (*mode_init)(struct lynx_priv *serdes, struct lynx_mode *mode,
+			 int type);
+};
+
+/**
+ * struct lynx_group - Driver data for a group of lanes
+ * @serdes: The parent serdes
+ * @pll: The currently-used pll
+ * @ex_dly: The ex_dly clock, if used
+ * @modes: Valid protocol controller configurations
+ * @mode_count: Number of modes in @modes
+ * @first_lane: The first lane in the group
+ * @last_lane: The last lane in the group
+ * @proto: The currently-configured protocol
+ * @initialized: Whether the complete state of @modes has been set
+ * @prots: The protocol set up by the RCW
+ */
+struct lynx_group {
+	struct lynx_priv *serdes;
+	struct clk *pll, *ex_dly;
+	const struct lynx_mode *modes;
+	size_t mode_count;
+	unsigned int first_lane;
+	unsigned int last_lane;
+	enum lynx_protocol proto;
+	bool initialized;
+	u8 prots;
+};
+
+/**
+ * struct lynx_priv - Driver data for the serdes
+ * @lock: A lock protecting "common" registers in @regmap, as well as the
+ *        members of this struct. Lane-specific registers are protected by the
+ *        phy's lock. PLL registers are protected by the clock's lock.
+ * @dev: The serdes device
+ * @regmap: The backing regmap
+ * @cfg: SoC-specific configuration
+ * @plls: The PLLs
+ * @ex_dlys: The "ex_dly" clocks
+ * @groups: Groups in the serdes
+ * @group_count: Number of groups in @groups
+ * @used_lanes: Bitmap of the lanes currently used by phys
+ */
+struct lynx_priv {
+	struct mutex lock;
+	struct device *dev;
+	struct regmap *regmap;
+	const struct lynx_cfg *cfg;
+	struct clk *plls[2], *ex_dlys[2];
+	struct lynx_group *groups;
+	unsigned int group_count;
+	unsigned int used_lanes;
+};
+
+static u32 lynx_read(struct lynx_priv *serdes, u32 reg)
+{
+	unsigned int ret = 0;
+
+	WARN_ON_ONCE(regmap_read(serdes->regmap, reg, &ret));
+	dev_vdbg(serdes->dev, "%.8x <= %.8x\n", ret, reg);
+	return ret;
+}
+
+static void lynx_write(struct lynx_priv *serdes, u32 val, u32 reg)
+{
+	dev_vdbg(serdes->dev, "%.8x => %.8x\n", val, reg);
+	WARN_ON_ONCE(regmap_write(serdes->regmap, reg, val));
+}
+
+/*
+ * This is tricky. If first_lane=1 and last_lane=0, the condition will see 2,
+ * 1, 0. But the loop body will see 1, 0. We do this to avoid underflow. We
+ * can't pull the same trick when incrementing, because then we might have to
+ * start at -1 if (e.g.) first_lane = 0.
+ */
+#define for_range(val, start, end) \
+	for (val = start < end ? start : start + 1; \
+	     start < end ? val <= end : val-- > end; \
+	     start < end ? val++ : 0)
+#define for_each_lane(lane, group) \
+	for_range(lane, group->first_lane, group->last_lane)
+#define for_each_lane_reverse(lane, group) \
+	for_range(lane, group->last_lane, group->first_lane)
+
+static int lynx_power_on(struct phy *phy)
+{
+	int i;
+	struct lynx_group *group = phy_get_drvdata(phy);
+	u32 gcr0;
+
+	for_each_lane(i, group) {
+		gcr0 = lynx_read(group->serdes, LNmGCR0(i));
+		gcr0 &= ~(LNmGCR0_RX_PD | LNmGCR0_TX_PD);
+		lynx_write(group->serdes, gcr0, LNmGCR0(i));
+
+		usleep_range(15, 30);
+		gcr0 |= LNmGCR0_RRST_B | LNmGCR0_TRST_B;
+		lynx_write(group->serdes, gcr0, LNmGCR0(i));
+	}
+
+	return 0;
+}
+
+static void lynx_power_off_group(struct lynx_group *group)
+{
+	int i;
+
+	for_each_lane_reverse(i, group) {
+		u32 gcr0 = lynx_read(group->serdes, LNmGCR0(i));
+
+		gcr0 |= LNmGCR0_RX_PD | LNmGCR0_TX_PD;
+		gcr0 &= ~(LNmGCR0_RRST_B | LNmGCR0_TRST_B);
+		lynx_write(group->serdes, gcr0, LNmGCR0(i));
+	}
+}
+
+static int lynx_power_off(struct phy *phy)
+{
+	lynx_power_off_group(phy_get_drvdata(phy));
+	return 0;
+}
+
+/**
+ * lynx_lane_bitmap() - Get a bitmap for a group of lanes
+ * @group: The group of lanes
+ *
+ * Return: A mask containing all bits between @group->first and @group->last
+ */
+static unsigned int lynx_lane_bitmap(struct lynx_group *group)
+{
+	if (group->first_lane > group->last_lane)
+		return GENMASK(group->first_lane, group->last_lane);
+	else
+		return GENMASK(group->last_lane, group->first_lane);
+}
+
+/**
+ * lynx_lookup_mode() - Get the mode for a group/protocol combination
+ * @group: The group of lanes to use
+ * @proto: The protocol to use
+ *
+ * Return: An appropriate mode to use, or %NULL if none match.
+ */
+static const struct lynx_mode *lynx_lookup_mode(struct lynx_group *group,
+						enum lynx_protocol proto)
+{
+	int i;
+
+	for (i = 0; i < group->mode_count; i++) {
+		const struct lynx_mode *mode = &group->modes[i];
+
+		if (BIT(proto) & mode->protos)
+			return mode;
+	}
+
+	return NULL;
+}
+
+/**
+ * lynx_init_late() - Initialize group modes after probe()
+ * @group: The group of lanes to initialize
+ *
+ * Disable all modes for a group, taking care not to disable other groups'
+ * current modes. This ensures that whenever we select a mode, nothing else is
+ * interfering. Then, turn off the group.
+ *
+ * Return: 0 on success, or -%ENOMEM
+ */
+static int lynx_init_late(struct lynx_group *group)
+{
+	int i, j;
+	struct lynx_priv *serdes = group->serdes;
+	const struct lynx_mode **modes;
+
+	modes = kcalloc(serdes->group_count, sizeof(*modes), GFP_KERNEL);
+	if (!modes)
+		return -ENOMEM;
+
+	for (i = 0; i < serdes->group_count; i++)
+		modes[i] = lynx_lookup_mode(&serdes->groups[i],
+					    serdes->groups[i].proto);
+
+	for (i = 0; i < group->mode_count; i++) {
+		for (j = 0; j < serdes->group_count; j++) {
+			if (!modes[j])
+				continue;
+
+			if (group->modes[i].pccr == modes[j]->pccr &&
+			    group->modes[i].idx == modes[j]->idx)
+				goto skip;
+		}
+
+		serdes->cfg->mode_apply(serdes, &group->modes[i],
+					LYNX_PROTO_NONE);
+skip:		;
+	}
+
+	kfree(modes);
+	lynx_power_off_group(group);
+	group->initialized = true;
+	return 0;
+}
+
+static int lynx_init(struct phy *phy)
+{
+	int ret = 0;
+	struct lynx_group *group = phy_get_drvdata(phy);
+	struct lynx_priv *serdes = group->serdes;
+	unsigned int lane_mask = lynx_lane_bitmap(group);
+
+	mutex_lock(&serdes->lock);
+	if (serdes->used_lanes & lane_mask) {
+		ret = -EBUSY;
+	} else {
+		if (!group->initialized)
+			ret = lynx_init_late(group);
+
+		if (!ret)
+			serdes->used_lanes |= lane_mask;
+	}
+	mutex_unlock(&serdes->lock);
+	return ret;
+}
+
+static int lynx_exit(struct phy *phy)
+{
+	struct lynx_group *group = phy_get_drvdata(phy);
+	struct lynx_priv *serdes = group->serdes;
+
+	clk_disable_unprepare(group->ex_dly);
+	group->ex_dly = NULL;
+
+	clk_disable_unprepare(group->pll);
+	clk_rate_exclusive_put(group->pll);
+	group->pll = NULL;
+
+	mutex_lock(&serdes->lock);
+	serdes->used_lanes &= ~lynx_lane_bitmap(group);
+	mutex_unlock(&serdes->lock);
+	return 0;
+}
+
+/**
+ * lynx_lookup_proto() - Convert a phy-subsystem mode to a protocol
+ * @mode: The mode to convert
+ * @submode: The submode of @mode
+ *
+ * Return: A corresponding serdes-specific mode
+ */
+static enum lynx_protocol lynx_lookup_proto(enum phy_mode mode, int submode)
+{
+	switch (mode) {
+	case PHY_MODE_ETHERNET:
+		switch (submode) {
+		case PHY_INTERFACE_MODE_SGMII:
+		case PHY_INTERFACE_MODE_1000BASEX:
+			return LYNX_PROTO_SGMII;
+		case PHY_INTERFACE_MODE_2500BASEX:
+			return LYNX_PROTO_SGMII25;
+		case PHY_INTERFACE_MODE_QSGMII:
+			return LYNX_PROTO_QSGMII;
+		case PHY_INTERFACE_MODE_XGMII:
+		case PHY_INTERFACE_MODE_10GBASER:
+			return LYNX_PROTO_XFI;
+		case PHY_INTERFACE_MODE_10GKR:
+			return LYNX_PROTO_10GKR;
+		default:
+			return LYNX_PROTO_NONE;
+		}
+	default:
+		return LYNX_PROTO_NONE;
+	}
+}
+
+static int lynx_validate(struct phy *phy, enum phy_mode phy_mode, int submode,
+			 union phy_configure_opts *opts)
+{
+	enum lynx_protocol proto;
+	struct lynx_group *group = phy_get_drvdata(phy);
+	const struct lynx_mode *mode;
+
+	proto = lynx_lookup_proto(phy_mode, submode);
+	if (proto == LYNX_PROTO_NONE)
+		return -EINVAL;
+
+	/* Nothing to do */
+	if (proto == group->proto)
+		return 0;
+
+	/*
+	 * FIXME: At the moment we don't support switching between major
+	 * protocols. From what I can tell, the serdes is working fine, but
+	 * something goes wrong in the PCS.
+	 */
+	if (lynx_proto_params[proto].prots != group->prots)
+		return -EINVAL;
+
+	mode = lynx_lookup_mode(group, proto);
+	if (!mode)
+		return -EINVAL;
+
+	return 0;
+}
+
+#define abs_diff(a, b) ({ \
+	typeof(a) _a = (a); \
+	typeof(b) _b = (b); \
+	_a > _b ? _a - _b : _b - _a; \
+})
+
+static int lynx_set_mode(struct phy *phy, enum phy_mode phy_mode, int submode)
+{
+	enum lynx_protocol proto;
+	const struct lynx_proto_params *params;
+	const struct lynx_mode *old_mode = NULL, *new_mode;
+	int i, pll, ret;
+	struct lynx_group *group = phy_get_drvdata(phy);
+	struct lynx_priv *serdes = group->serdes;
+	u32 tmp, teq;
+	u32 gcr0 = 0, gcr1 = 0, recr0 = 0, tecr0 = 0;
+	u32 gcr0_mask = 0, gcr1_mask = 0, recr0_mask = 0, tecr0_mask = 0;
+
+	proto = lynx_lookup_proto(phy_mode, submode);
+	if (proto == LYNX_PROTO_NONE) {
+		dev_dbg(&phy->dev, "unknown mode/submode %d/%d\n",
+			phy_mode, submode);
+		return -EINVAL;
+	}
+
+	/* Nothing to do */
+	if (proto == group->proto)
+		return 0;
+
+	new_mode = lynx_lookup_mode(group, proto);
+	if (!new_mode) {
+		dev_dbg(&phy->dev, "could not find mode for %s on lanes %u to %u\n",
+			lynx_proto_str[proto], group->first_lane,
+			group->last_lane);
+		return -EINVAL;
+	}
+
+	if (group->proto != LYNX_PROTO_NONE) {
+		old_mode = lynx_lookup_mode(group, group->proto);
+		if (!old_mode) {
+			dev_err(&phy->dev, "could not find mode for %s\n",
+				lynx_proto_str[group->proto]);
+			return -EBUSY;
+		}
+	}
+
+	mutex_lock(&serdes->lock);
+	if (serdes->cfg->mode_conflict(serdes, new_mode)) {
+		dev_dbg(&phy->dev, "%s%c already in use\n",
+			lynx_proto_str[__ffs(new_mode->protos)],
+			'A' + new_mode->idx);
+		ret = -EBUSY;
+		goto out;
+	}
+
+	clk_disable_unprepare(group->ex_dly);
+	group->ex_dly = NULL;
+
+	clk_disable_unprepare(group->pll);
+	clk_rate_exclusive_put(group->pll);
+	group->pll = NULL;
+
+	/* First, try to use a PLL which already has the correct rate */
+	params = &lynx_proto_params[proto];
+	for (pll = 0; pll < ARRAY_SIZE(serdes->plls); pll++) {
+		struct clk *clk = serdes->plls[pll];
+		unsigned long rate = clk_get_rate(clk);
+		unsigned long error = abs_diff(rate, params->frate_khz);
+
+		dev_dbg(&phy->dev, "pll%d has rate %lu (error=%lu)\n", pll,
+			rate, error);
+		/* Accept up to 100ppm deviation */
+		if (error && params->frate_khz / error < 10000)
+			continue;
+
+		if (!clk_set_rate_exclusive(clk, rate))
+			goto got_pll;
+		/*
+		 * Someone else got a different rate first (or there was some
+		 * other error)
+		 */
+	}
+
+	/* If neither PLL has the right rate, try setting it */
+	for (pll = 0; pll < 2; pll++) {
+		ret = clk_set_rate_exclusive(serdes->plls[pll],
+					     params->frate_khz);
+		if (!ret)
+			goto got_pll;
+	}
+
+	dev_dbg(&phy->dev, "could not get a pll at %ukHz\n",
+		params->frate_khz);
+	goto out;
+
+got_pll:
+	group->pll = serdes->plls[pll];
+	ret = clk_prepare_enable(group->pll);
+	if (ret)
+		goto out;
+
+	gcr0_mask |= LNmGCR0_RRAT_SEL | LNmGCR0_TRAT_SEL;
+	gcr0_mask |= LNmGCR0_RPLL_LES | LNmGCR0_TPLL_LES;
+	gcr0_mask |= LNmGCR0_RRST_B | LNmGCR0_TRST_B;
+	gcr0_mask |= LNmGCR0_RX_PD | LNmGCR0_TX_PD;
+	gcr0_mask |= LNmGCR0_IF20BIT_EN | LNmGCR0_PROTS;
+	gcr0 |= FIELD_PREP(LNmGCR0_RPLL_LES, !pll);
+	gcr0 |= FIELD_PREP(LNmGCR0_TPLL_LES, !pll);
+	gcr0 |= FIELD_PREP(LNmGCR0_RRAT_SEL, params->rat_sel);
+	gcr0 |= FIELD_PREP(LNmGCR0_TRAT_SEL, params->rat_sel);
+	gcr0 |= FIELD_PREP(LNmGCR0_IF20BIT_EN, params->if20bit);
+	gcr0 |= FIELD_PREP(LNmGCR0_PROTS, params->prots);
+
+	gcr1_mask |= LNmGCR1_RDAT_INV | LNmGCR1_TDAT_INV;
+	gcr1_mask |= LNmGCR1_OPAD_CTL | LNmGCR1_REIDL_TH;
+	gcr1_mask |= LNmGCR1_REIDL_EX_SEL | LNmGCR1_REIDL_ET_SEL;
+	gcr1_mask |= LNmGCR1_REIDL_EX_MSB | LNmGCR1_REIDL_ET_MSB;
+	gcr1_mask |= LNmGCR1_REQ_CTL_SNP | LNmGCR1_REQ_CDR_SNP;
+	gcr1_mask |= LNmGCR1_TRSTDIR | LNmGCR1_REQ_BIN_SNP;
+	gcr1_mask |= LNmGCR1_ISLEW_RCTL | LNmGCR1_OSLEW_RCTL;
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_TH, params->reidl_th);
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_EX_SEL, params->reidl_ex & 3);
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_ET_SEL, params->reidl_et & 3);
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_EX_MSB, params->reidl_ex >> 2);
+	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_ET_MSB, params->reidl_et >> 2);
+	gcr1 |= FIELD_PREP(LNmGCR1_TRSTDIR,
+			   group->first_lane > group->last_lane);
+	gcr1 |= FIELD_PREP(LNmGCR1_ISLEW_RCTL, params->slew);
+	gcr1 |= FIELD_PREP(LNmGCR1_OSLEW_RCTL, params->slew);
+
+	recr0_mask |= LNmRECR0_RXEQ_BST | LNmRECR0_BASE_WAND;
+	recr0_mask |= LNmRECR0_GK2OVD | LNmRECR0_GK3OVD;
+	recr0_mask |= LNmRECR0_GK2OVD_EN | LNmRECR0_GK3OVD_EN;
+	recr0_mask |= LNmRECR0_OSETOVD_EN | LNmRECR0_OSETOVD;
+	if (params->gain) {
+		recr0 |= FIELD_PREP(LNmRECR0_GK2OVD, params->gain);
+		recr0 |= FIELD_PREP(LNmRECR0_GK3OVD, params->gain);
+		recr0 |= LNmRECR0_GK2OVD_EN | LNmRECR0_GK3OVD_EN;
+	}
+	recr0 |= FIELD_PREP(LNmRECR0_BASE_WAND, params->baseline_wander);
+	recr0 |= FIELD_PREP(LNmRECR0_OSETOVD, params->offset_override);
+
+	tecr0_mask |= LNmTECR0_TEQ_TYPE;
+	tecr0_mask |= LNmTECR0_SGN_PREQ | LNmTECR0_RATIO_PREQ;
+	tecr0_mask |= LNmTECR0_SGN_POST1Q | LNmTECR0_RATIO_PST1Q;
+	tecr0_mask |= LNmTECR0_ADPT_EQ | LNmTECR0_AMP_RED;
+	teq = LNmTECR0_TEQ_TYPE_NONE;
+	if (params->postq_ratio) {
+		teq = LNmTECR0_TEQ_TYPE_POST;
+		tecr0 |= FIELD_PREP(LNmTECR0_SGN_POST1Q, 1);
+		tecr0 |= FIELD_PREP(LNmTECR0_RATIO_PST1Q, params->postq_ratio);
+	}
+	if (params->preq_ratio) {
+		teq = LNmTECR0_TEQ_TYPE_BOTH;
+		tecr0 |= FIELD_PREP(LNmTECR0_SGN_PREQ, 1);
+		tecr0 |= FIELD_PREP(LNmTECR0_RATIO_PREQ, params->preq_ratio);
+	}
+	tecr0 |= FIELD_PREP(LNmTECR0_TEQ_TYPE, teq);
+	tecr0 |= FIELD_PREP(LNmTECR0_ADPT_EQ, params->adpt_eq);
+	tecr0 |= FIELD_PREP(LNmTECR0_AMP_RED, params->amp_red);
+
+	for_each_lane(i, group) {
+		tmp = lynx_read(serdes, LNmGCR0(i));
+		tmp &= ~(LNmGCR0_RRST_B | LNmGCR0_TRST_B);
+		lynx_write(serdes, tmp, LNmGCR0(i));
+	}
+
+	ndelay(50);
+
+	/* Disable the old controller */
+	if (old_mode)
+		serdes->cfg->mode_apply(serdes, old_mode, LYNX_PROTO_NONE);
+
+	for_each_lane(i, group) {
+		tmp = lynx_read(serdes, LNmGCR0(i));
+		tmp &= ~gcr0_mask;
+		tmp |= gcr0;
+		tmp |= FIELD_PREP(LNmGCR0_FIRST_LANE, i == group->first_lane);
+		lynx_write(serdes, tmp, LNmGCR0(i));
+
+		tmp = lynx_read(serdes, LNmGCR1(i));
+		tmp &= ~gcr1_mask;
+		tmp |= gcr1;
+		lynx_write(serdes, tmp, LNmGCR1(i));
+
+		tmp = lynx_read(serdes, LNmRECR0(i));
+		tmp &= ~recr0_mask;
+		tmp |= recr0;
+		lynx_write(serdes, tmp, LNmRECR0(i));
+
+		tmp = lynx_read(serdes, LNmTECR0(i));
+		tmp &= ~tecr0_mask;
+		tmp |= tecr0;
+		lynx_write(serdes, tmp, LNmTECR0(i));
+
+		tmp = lynx_read(serdes, LNmTTLCR0(i));
+		tmp &= ~LNmTTLCR0_FLT_SEL;
+		tmp |= FIELD_PREP(LNmTTLCR0_FLT_SEL, params->flt_sel);
+		lynx_write(serdes, tmp, LNmTTLCR0(i));
+	}
+
+	ndelay(120);
+
+	for_each_lane_reverse(i, group) {
+		tmp = lynx_read(serdes, LNmGCR0(i));
+		tmp |= LNmGCR0_RRST_B | LNmGCR0_TRST_B;
+		lynx_write(serdes, tmp, LNmGCR0(i));
+	}
+
+	/* Enable the new controller */
+	serdes->cfg->mode_apply(serdes, new_mode, proto);
+	if (proto == LYNX_PROTO_1000BASEKX) {
+		group->ex_dly = serdes->ex_dlys[pll];
+		/* This should never fail since it's from our internal driver */
+		WARN_ON_ONCE(clk_prepare_enable(group->ex_dly));
+	}
+	group->proto = proto;
+
+	dev_dbg(&phy->dev, "set mode to %s on lanes %u to %u\n",
+		lynx_proto_str[proto], group->first_lane, group->last_lane);
+
+out:
+	mutex_unlock(&serdes->lock);
+	return ret;
+}
+
+static const struct phy_ops lynx_phy_ops = {
+	.init = lynx_init,
+	.exit = lynx_exit,
+	.power_on = lynx_power_on,
+	.power_off = lynx_power_off,
+	.set_mode = lynx_set_mode,
+	.validate = lynx_validate,
+	.owner = THIS_MODULE,
+};
+
+static int lynx_read_u32(struct device *dev, struct fwnode_handle *fwnode,
+			 const char *prop, u32 *val)
+{
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, prop, val);
+	if (ret)
+		dev_err(dev, "could not read %s from %pfwP: %d\n", prop,
+			fwnode, ret);
+	return ret;
+}
+
+static int lynx_probe_group(struct lynx_priv *serdes, struct lynx_group *group,
+			    struct fwnode_handle *fwnode, bool initialize)
+{
+	int i, lane_count, ret;
+	struct device *dev = serdes->dev;
+	struct fwnode_handle *mode_node;
+	struct lynx_mode *modes;
+	struct phy *phy;
+	u32 *lanes = NULL;
+
+	group->serdes = serdes;
+
+	lane_count = fwnode_property_count_u32(fwnode, "reg");
+	if (lane_count < 0) {
+		dev_err(dev, "could not read %s from %pfwP: %d\n",
+			"reg", fwnode, ret);
+		return lane_count;
+	}
+
+	lanes = kcalloc(lane_count, sizeof(*lanes), GFP_KERNEL);
+	if (!lanes)
+		return -ENOMEM;
+
+	ret = fwnode_property_read_u32_array(fwnode, "reg", lanes, lane_count);
+	if (ret) {
+		dev_err(dev, "could not read %s from %pfwP: %d\n",
+			"reg", fwnode, ret);
+		goto out;
+	}
+
+	group->first_lane = lanes[0];
+	group->last_lane = lanes[lane_count - 1];
+	for (i = 0; i < lane_count; i++) {
+		u32 prots, gcr0;
+
+		if (lanes[i] > serdes->cfg->lanes) {
+			ret = -EINVAL;
+			dev_err(dev, "lane %d not in range 0 to %u\n",
+				i, serdes->cfg->lanes);
+			goto out;
+		}
+
+		if (lanes[i] != group->first_lane +
+				i * !!(group->last_lane - group->first_lane)) {
+			ret = -EINVAL;
+			dev_err(dev, "lane %d is not monotonic\n", i);
+			goto out;
+		}
+
+		gcr0 = lynx_read(serdes, LNmGCR0(lanes[i]));
+		prots = FIELD_GET(LNmGCR0_PROTS, gcr0);
+		if (i && group->prots != prots) {
+			ret = -EIO;
+			dev_err(dev, "lane %d protocol does not match lane 0\n",
+				lanes[i]);
+			goto out;
+		}
+		group->prots = prots;
+	}
+
+	fwnode_for_each_child_node(fwnode, mode_node)
+		group->mode_count++;
+
+	modes = devm_kcalloc(dev, group->mode_count, sizeof(*group->modes),
+			     GFP_KERNEL);
+	if (!modes) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	i = 0;
+	fwnode_for_each_child_node(fwnode, mode_node) {
+		struct lynx_mode *mode = &modes[i++];
+		u32 val;
+
+		ret = lynx_read_u32(dev, mode_node, "fsl,pccr", &val);
+		if (ret)
+			goto out;
+		mode->pccr = val;
+
+		ret = lynx_read_u32(dev, mode_node, "fsl,index", &val);
+		if (ret)
+			goto out;
+		mode->idx = val;
+
+		ret = lynx_read_u32(dev, mode_node, "fsl,cfg", &val);
+		if (ret)
+			goto out;
+		mode->cfg = val;
+
+		ret = lynx_read_u32(dev, mode_node, "fsl,type", &val);
+		if (ret)
+			goto out;
+
+		ret = serdes->cfg->mode_init(serdes, mode, val);
+		if (ret)
+			goto out;
+
+		dev_dbg(dev, "mode PCCR%X.%s%c_CFG=%x on lanes %u to %u\n",
+			mode->pccr, lynx_proto_str[__ffs(mode->protos)],
+			'A' + mode->idx, mode->cfg, group->first_lane,
+			group->last_lane);
+	}
+
+	WARN_ON(i != group->mode_count);
+	group->modes = modes;
+
+	if (initialize) {
+		/* Deselect anything configured by the RCW/bootloader */
+		for (i = 0; i < group->mode_count; i++)
+			serdes->cfg->mode_apply(serdes, &group->modes[i],
+						LYNX_PROTO_NONE);
+
+		/* Disable the lanes for now */
+		lynx_power_off_group(group);
+		group->initialized = true;
+	}
+
+	phy = devm_phy_create(dev, to_of_node(fwnode), &lynx_phy_ops);
+	ret = PTR_ERR_OR_ZERO(phy);
+	if (ret)
+		dev_err_probe(dev, ret, "could not create phy\n");
+	else
+		phy_set_drvdata(phy, group);
+
+out:
+	kfree(lanes);
+	return ret;
+}
+
+static int lynx_probe(struct platform_device *pdev)
+{
+	bool init;
+	int ret, i = 0;
+	struct device *dev = &pdev->dev;
+	struct fwnode_handle *group_node;
+	struct lynx_priv *serdes;
+	struct phy_provider *provider;
+	struct regmap_config regmap_config = {
+		.reg_bits = 32,
+		.reg_stride = 4,
+		.val_bits = 32,
+		.disable_locking = true,
+	};
+	struct resource *res;
+	void __iomem *base;
+
+	serdes = devm_kzalloc(dev, sizeof(*serdes), GFP_KERNEL);
+	if (!serdes)
+		return -ENOMEM;
+
+	serdes->dev = dev;
+	platform_set_drvdata(pdev, serdes);
+	mutex_init(&serdes->lock);
+	serdes->cfg = device_get_match_data(dev);
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
+		dev_err_probe(dev, ret, "could not get/map registers\n");
+		return ret;
+	}
+
+	regmap_config.val_format_endian = serdes->cfg->endian;
+	regmap_config.max_register = res->end - res->start;
+	serdes->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(serdes->regmap)) {
+		ret = PTR_ERR(serdes->regmap);
+		dev_err_probe(dev, ret, "could not create regmap\n");
+		return ret;
+	}
+
+	ret = lynx_clks_init(dev, serdes->regmap, serdes->plls,
+			     serdes->ex_dlys);
+	if (ret)
+		return ret;
+
+	serdes->group_count = device_get_child_node_count(dev);
+	serdes->groups = devm_kcalloc(dev, serdes->group_count,
+				      sizeof(*serdes->groups), GFP_KERNEL);
+	if (!serdes->groups)
+		return -ENOMEM;
+
+	init = !device_property_present(dev, "fsl,unused-lanes-reserved");
+	device_for_each_child_node(dev, group_node) {
+		ret = lynx_probe_group(serdes, &serdes->groups[i++],
+				       group_node, init);
+		if (ret)
+			return ret;
+	}
+	WARN_ON(i != serdes->group_count);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	ret = PTR_ERR_OR_ZERO(provider);
+	if (ret)
+		dev_err_probe(dev, ret, "could not register phy provider\n");
+	else
+		dev_info(dev, "probed with %u lanes and %u groups\n",
+			 serdes->cfg->lanes, serdes->group_count);
+	return ret;
+}
+
+/*
+ * These are common helpers for the PCCRs found on (most) Layerscape SoCs.
+ * There is an earlier layout used on most T-series SoCs, as well as the
+ * LS1020A/21A/22A.
+ */
+
+static int lynx_ls_pccr_params(const struct lynx_mode *mode, u32 *off,
+			       u32 *shift, u32 *mask)
+{
+	if (mode->protos & PROTO_MASK(SGMII)) {
+		*off = LS_PCCRa(0x8);
+		*mask = PCCR8_SGMIIa_MASK;
+		*shift = PCCR8_SGMIIa_SHIFT(mode->idx);
+	} else if (mode->protos & PROTO_MASK(QSGMII)) {
+		*off = LS_PCCRa(0x9);
+		*mask = PCCR9_QSGMIIa_MASK;
+		*shift = PCCR9_QSGMIIa_SHIFT(mode->idx);
+	} else if (mode->protos & PROTO_MASK(XFI)) {
+		*off = LS_PCCRa(0xB);
+		*mask = PCCRB_XFIa_MASK;
+		*shift = PCCRB_XFIa_SHIFT(mode->idx);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static bool lynx_ls_mode_conflict(struct lynx_priv *serdes,
+				  const struct lynx_mode *mode)
+{
+	u32 off, shift, mask;
+
+	if (WARN_ON_ONCE(lynx_ls_pccr_params(mode, &off, &shift, &mask)))
+		return true;
+
+	return (lynx_read(serdes, off) >> shift) & mask;
+}
+
+static void lynx_ls_mode_apply(struct lynx_priv *serdes,
+			       const struct lynx_mode *mode,
+			       enum lynx_protocol proto)
+{
+	u32 pccr, off, shift, mask;
+
+	if (WARN_ON_ONCE(proto != LYNX_PROTO_NONE &&
+			 !(mode->protos & BIT(proto))))
+		return;
+	if (WARN_ON_ONCE(lynx_ls_pccr_params(mode, &off, &shift, &mask)))
+		return;
+
+	dev_dbg(serdes->dev, "applying %s to PCCR%X.%s%c_CFG\n",
+		lynx_proto_str[proto], mode->pccr,
+		lynx_proto_str[__ffs(mode->protos)], 'A' + mode->idx);
+
+	pccr = lynx_read(serdes, off);
+	pccr &= ~(mask << shift);
+	if (proto != LYNX_PROTO_NONE)
+		pccr |= mode->cfg << shift;
+
+	if (proto == LYNX_PROTO_1000BASEKX)
+		pccr |= PCCR8_SGMIIa_KX << shift;
+	lynx_write(serdes, pccr, off);
+
+	if (mode->protos & PROTO_MASK(SGMII)) {
+		u32 cr1 = lynx_read(serdes, LS_SGMIIaCR1(mode->idx));
+
+		cr1 &= ~SGMIIaCR1_SGPCS_EN;
+		cr1 |= proto == LYNX_PROTO_NONE ? 0 : SGMIIaCR1_SGPCS_EN;
+		lynx_write(serdes, cr1, LS_SGMIIaCR1(mode->idx));
+	}
+}
+
+static int lynx_ls_mode_init(struct lynx_priv *serdes, struct lynx_mode *mode,
+			     int type)
+{
+	u32 max = 0, off, shift, mask;
+
+	if (mode->pccr >= 0x10) {
+		dev_err(serdes->dev, "PCCR index %u too large\n", mode->pccr);
+		return -EINVAL;
+	}
+
+	switch (type) {
+	case PHY_TYPE_2500BASEX:
+		mode->protos = PROTO_MASK(SGMII25);
+		fallthrough;
+	case PHY_TYPE_SGMII:
+		max = 8;
+		mode->protos |= PROTO_MASK(SGMII) | PROTO_MASK(1000BASEKX);
+		break;
+	case PHY_TYPE_QSGMII:
+		max = 4;
+		mode->protos = PROTO_MASK(QSGMII);
+		break;
+	case PHY_TYPE_10GBASER:
+		max = 8;
+		mode->protos = PROTO_MASK(XFI) | PROTO_MASK(10GKR);
+		break;
+	default:
+		dev_err(serdes->dev, "unknown mode type %d\n", type);
+		return -EINVAL;
+	}
+
+	if (mode->idx >= max) {
+		dev_err(serdes->dev, "%s index %u too large\n",
+			lynx_proto_str[__ffs(mode->protos)], mode->idx);
+		return -EINVAL;
+	}
+
+	if (WARN_ON_ONCE(lynx_ls_pccr_params(mode, &off, &shift, &mask)))
+		return -EINVAL;
+
+	if (!mode->cfg || mode->cfg & ~mask) {
+		dev_err(serdes->dev, "bad value %x for %s%c_CFG\n",
+			mode->cfg, lynx_proto_str[__ffs(mode->protos)],
+			'A' + mode->idx);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct lynx_cfg ls1046a_cfg = {
+	.lanes = 4,
+	.endian = REGMAP_ENDIAN_BIG,
+	.mode_conflict = lynx_ls_mode_conflict,
+	.mode_apply = lynx_ls_mode_apply,
+	.mode_init = lynx_ls_mode_init,
+};
+
+static const struct lynx_cfg ls1088a_cfg = {
+	.lanes = 4,
+	.endian = REGMAP_ENDIAN_LITTLE,
+	.mode_conflict = lynx_ls_mode_conflict,
+	.mode_apply = lynx_ls_mode_apply,
+	.mode_init = lynx_ls_mode_init,
+};
+
+static const struct of_device_id lynx_of_match[] = {
+	{ .compatible = "fsl,ls1046a-serdes", .data = &ls1046a_cfg },
+	{ .compatible = "fsl,ls1088a-serdes", .data = &ls1088a_cfg },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lynx_of_match);
+
+static struct platform_driver lynx_driver = {
+	.probe = lynx_probe,
+	.driver = {
+		.name = "lynx_10g",
+		.of_match_table = lynx_of_match,
+	},
+};
+module_platform_driver(lynx_driver);
+
+MODULE_AUTHOR("Sean Anderson <sean.anderson@seco.com>");
+MODULE_DESCRIPTION("Lynx 10G SerDes driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1.1320.gc452695387.dirty

