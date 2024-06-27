Return-Path: <linux-doc+bounces-19658-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7AA91A8CC
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jun 2024 16:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BC641F28672
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jun 2024 14:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FE01990AE;
	Thu, 27 Jun 2024 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sEBw2bAz"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7938198A35;
	Thu, 27 Jun 2024 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719497424; cv=fail; b=GIVSx1cCSwdMLXh4bVOwmRKelqr0tigdkbUE+1XJH+5X3G6YlDe/YywthLxYqeTtUMUzv588vopjjrwa0URykvfwHXLLzHqsfQESi0Jxl6KJP2rB+zOr6q72f8RFqfOUA0zBzF8AdxWnvrwa/gV5msLXCV6SjCSINojEkMCfWOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719497424; c=relaxed/simple;
	bh=EpBFfkvMkAdY2RuiTZoXYd3H+AJsvoo8Gacjb7UmoSA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YylhdvbLimx1h69DyPqcV2KMCAH+1JNDZQwVUf2CbF//PajjIK8/P08j6lhYdYADiWtEQOokTablVQnfmz4zjcipgE7iWWmNZoq6MggBg8fDyoDnWkKTR86VTa1QcH9jK061rzjfwfwyrsXEbhMwCexU7JuLsN1fPF8G+B+QB3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sEBw2bAz; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHuHrqsjLCaQ4tXwvsH31Q9YLQe0TuAGaOb5Jgawr+8JFv1z4wsZbv8wi2c5nKHlZTmES4D+6HWn0QXdDpEpAaHqg4KjByQ8RT16gkuu/ADjh+LO2VDV+c4gIJRfptPyqOsY3wQ/TzYJy/z/DJvqyj8JcsAc/GspYbGAQTN+U9Tou96U1LbKrJfycRsgBIj7HqsqvGQuVEHDmKim7W0/2ebdtRnFSMhJb6gEuQxaDuaCaPwdfnO6NwgCKeDe0KInhTHxtrVVmKnHlZiTPIGkXJ/iPcU+FfUpmW5yAN4hWzwSlOt1dOVY3Fz/+kBKskKksgwlyaJcFR5sDLvXj74vqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw5eU1A7+w97S+3ix5ohLCiqJgrrbyA78a56AYfvjpE=;
 b=cF6bwzCmp1n865Na4fpNBfRUZGl749Tq7p04dTB+bPtzs7cXlEfHBZPRmdd0BoDixpApMSdBS8Pnu/SiH0bYIkF74r8aSw0O9jQCkodN4VvLNy6wEmHX37F9PXUKoGEBMHVH/T9o+KyriBVY8MF5r62Hu5rUPI1la2rlsyuFhlALVPG1DZVxfJTqw/rR8yrAW10iWcbrZKt3qj9gUYPLMTL0I7J2kVsWn9CslhbFvBJJThIn1yYzafVUivOZiW9zisqsxAPVBA3hrA1xiQ70xQ5ycHecxJsS+zKvcMEttpmJXGffOnJUWfgqAiou2ra9gCS+4rr0KYQgPrbRZABtBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw5eU1A7+w97S+3ix5ohLCiqJgrrbyA78a56AYfvjpE=;
 b=sEBw2bAzflKFJka8NAQ0dxvNMezH1uVRW4yRrUoxBPt7aDmSrpZocjQo4EYBLNARnFckb4evkheVjw9EQZq/MJSjFfzvhCa/lrXUPXoZhAzYjcrzjixyqQRycytApt3wPue/zbCwG+BnvI7WuMock56ITXbiFm+t5RzT5jeAjPseL0FcCPeUc/VbghmVvLWN1FUsjdoJiqRO6KrV1Qm0bi+bb3VFdVgAW/hMqpTOrp4UKcE8++wAwQiM8dInucOruZK6B9PeHENpWvCBf+hNALV+U92DgOpxkDv8gVj6mLGK7TgO6Vh882I/KYdh7RFhQ9Nbmx/wVeuBWwJvNYP72A==
Received: from SN7PR18CA0014.namprd18.prod.outlook.com (2603:10b6:806:f3::26)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 14:10:17 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::c1) by SN7PR18CA0014.outlook.office365.com
 (2603:10b6:806:f3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26 via Frontend
 Transport; Thu, 27 Jun 2024 14:10:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 14:10:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Jun
 2024 07:10:03 -0700
Received: from dev-r-vrt-156.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 27 Jun 2024 07:09:56 -0700
From: Danielle Ratson <danieller@nvidia.com>
To: <netdev@vger.kernel.org>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <corbet@lwn.net>, <linux@armlinux.org.uk>,
	<sdf@google.com>, <kory.maincent@bootlin.com>,
	<maxime.chevallier@bootlin.com>, <vladimir.oltean@nxp.com>,
	<przemyslaw.kitszel@intel.com>, <ahmed.zaki@intel.com>,
	<richardcochran@gmail.com>, <shayagr@amazon.com>, <paul.greenwalt@intel.com>,
	<jiri@resnulli.us>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <mlxsw@nvidia.com>, <idosch@nvidia.com>,
	<petrm@nvidia.com>, Danielle Ratson <danieller@nvidia.com>
Subject: [PATCH net-next v8 7/9] ethtool: cmis_cdb: Add a layer for supporting CDB commands
Date: Thu, 27 Jun 2024 17:08:54 +0300
Message-ID: <20240627140857.1398100-8-danieller@nvidia.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240627140857.1398100-1-danieller@nvidia.com>
References: <20240627140857.1398100-1-danieller@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd13ed7-a311-4a48-9e0b-08dc96b2df5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T8654Jb4boW1h5Tx8ngvtlHM0Ugf5f/YwhMBR5rIwoj1vYzgsWfrZjNHXtjR?=
 =?us-ascii?Q?PwTTPxNx6O354NT7KPCXxj7fbx2AO6SEgoiZC1sASk2ioDTHU/Sq9gGewep8?=
 =?us-ascii?Q?WjfUaZRdMUB6oPBjgyawhO/II9fxEYgRIvWmAkzWMpiKjcSNFk1o5Vd9a0jv?=
 =?us-ascii?Q?b9L1ICv4lmVleKpH8blWyk5TtsfWcjyNMd07jAvgqeiSPUx0ig9TKaaAbiJ/?=
 =?us-ascii?Q?n1uu7X6URO0qlt9Rgw9C/qOubXBeYH4yv+fFQklC2sIjntWiCNsLF8TWvq4y?=
 =?us-ascii?Q?Xzzb62mFhnCJN/tzTu0K0wxo5XlmpAgv67XfwiUb3xZPhrHs87ZOHrU0/4EB?=
 =?us-ascii?Q?/2PHCa/nMGdY6yU+p9yTZp3Qq9VMdqoc9a3sFtyOLGCbBWyKwgs1gWr/6jr+?=
 =?us-ascii?Q?tSKVpXjnBaYbTmTzZoFll5aIh3u7SY5wRGWu8EAQRi6mxMj5JSXGvJTdXGN3?=
 =?us-ascii?Q?tZT8EHcyCjvttM7MgeRvlOw/qJQ4hXOAowtRFocL52YT+G8zVP9XDgCElgNv?=
 =?us-ascii?Q?jbe9nshLNj4wl1XH3yCIerfY3xodh9+YcgdGcAYDAQztAYh5FbD1MltBUKPB?=
 =?us-ascii?Q?zKkCgG0GXbxW7rlHNlQ/ignzL4WODQ7dDcvK/GXoDqj7JJS80RJq1hDlcnKI?=
 =?us-ascii?Q?VUhst6X3YdtcAZPpSbDFgx5cw+x0ukEZ3jOrxVeuhQ1ph3ELX4i1ACZhCAgt?=
 =?us-ascii?Q?8VT7JJIyAs3PwBTsSAgQRkaoA5vE7tYOkb/v+mCBoB4tsLS2wH+91iAfTVLC?=
 =?us-ascii?Q?nFNQRflhTuYnTBRBFQatqRga5qAmueYCr/yI/N8bNDIApwg7Lx4VyTE6B0jk?=
 =?us-ascii?Q?FX3+zXyK/lHUonv/1+tMcryjv2qghwu47YTk1r6nvPR5x59MZyngtq5qGwB0?=
 =?us-ascii?Q?XbtjJdKQ3ynnU/82BB2XMSKgA6vxMLx70tmSOAn0v3FniWfYnA0JnZ7VdbZn?=
 =?us-ascii?Q?yEySceRdpqbizztaYEjjbRVzTc9N0muYUjAW1vjXcjrhwrTl4zSCAJZz6xCg?=
 =?us-ascii?Q?CqTW5vqZyTxbdOW4H3ZsQloQuAMdNy6TfKO8kB8xVy2/Gpjp40O3hj5EppdX?=
 =?us-ascii?Q?zQK+77p85GdjlMNTIOkRvNqhnNEyhM1CU/vDrw056yagKN64W4OWcX602tIB?=
 =?us-ascii?Q?eLKxOidWb+0alNxpo09DMXaZ1STJxXNGAaVQbvEQwfBM4SVlXNdXHi1nY6nK?=
 =?us-ascii?Q?aRiEJpH1Mw1CA0wIQ4odnIuSJ4bzle0jjyYWac0DV+duYkLkphkF6PTp00Ag?=
 =?us-ascii?Q?g+zJPt/Ns5Di1FtPjTXCCZNWqynk5NEy86aqmfbxdcwrD/U2zQTY7Z3yrx8I?=
 =?us-ascii?Q?WpqiGJuY8/4gBTNTIfNPMvrRV6dOObLOVqFNCIzYb2SKtH0W3/Ts6wrcktpb?=
 =?us-ascii?Q?j5Q/i5pmV0DzJu1oJUFx1tfg3B1/rANCXuYQRWtv/96fb9qI/A2OLoLxmXyU?=
 =?us-ascii?Q?9yL649z7wbn2UjjC/owoUmhdiO7MnieL?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 14:10:17.4226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd13ed7-a311-4a48-9e0b-08dc96b2df5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810

CDB (Command Data Block Message Communication) reads and writes are
performed on memory map pages 9Fh-AFh according to the CMIS standard,
section 8.20 of revision 5.2.
Page 9Fh is used to specify the CDB command to be executed and also
provides an area for a local payload (LPL).

According to the CMIS standard, the firmware update process is done using
a CDB commands sequence that will be implemented in the next patch.

The kernel interface that will implement the firmware update using CDB
command will include 2 layers that will be added under ethtool:

* The upper layer that will be triggered from the module layer, is
  cmis_fw_update.
* The lower one is cmis_cdb.

In the future there might be more operations to implement using CDB
commands. Therefore, the idea is to keep the CDB interface clean and the
cmis_fw_update specific to the CDB commands handling it.

These two layers will communicate using the API the consists of three
functions:

- struct ethtool_cmis_cdb *
  ethtool_cmis_cdb_init(struct net_device *dev,
			struct ethtool_module_fw_flash_params *params);
- void ethtool_cmis_cdb_fini(struct ethtool_cmis_cdb *cdb);
- int ethtool_cmis_cdb_execute_cmd(struct net_device *dev,
				   struct ethtool_cmis_cdb_cmd_args *args);

Add the CDB layer to support initializing, finishing and executing CDB
commands:

* The initialization process will include creating of an ethtool_cmis_cdb
  instance, querying the module CDB support, entering and validating the
  password from user space (CMD 0x0000) and querying the module features
  (CMD 0x0040).

* The finishing API will simply free the ethtool_cmis_cdb instance.

* The executing process will write the CDB command to EEPROM using
  set_module_eeprom_by_page() that was presented earlier, and will
  process the reply from EEPROM.

Signed-off-by: Danielle Ratson <danieller@nvidia.com>
Reviewed-by: Petr Machata <petrm@nvidia.com>
---

Notes:
    v8:
    	* In the ethtool_cmis_wait_for_cond() evaluate the condition once more
    	  to decide if the error code should be -ETIMEDOUT or something else.
    	* s/netdev_err/netdev_err_once.
    
    v6:
    	* In ethtool_cmis_cdb_init(), Use 'const' for the params
    	  parameter.
    
    v5:
    	* Drop all the inline in cmis_cdb.c.
    
    v4:
    	* Add kernel-doc for msleep_pre_rpl and err_msg.
    
    v3:
    	* Use kmemdup() instead of kmalloc+memcpy.
    
    v2:
    	* Define ethtool_cmis_cdb_request::epl_len to be __be16 instead
    	  of u16.

 net/ethtool/Makefile    |   2 +-
 net/ethtool/cmis.h      | 117 ++++++++
 net/ethtool/cmis_cdb.c  | 602 ++++++++++++++++++++++++++++++++++++++++
 net/ethtool/module_fw.h |  10 +
 4 files changed, 730 insertions(+), 1 deletion(-)
 create mode 100644 net/ethtool/cmis.h
 create mode 100644 net/ethtool/cmis_cdb.c

diff --git a/net/ethtool/Makefile b/net/ethtool/Makefile
index 504f954a1b28..38806b3ecf83 100644
--- a/net/ethtool/Makefile
+++ b/net/ethtool/Makefile
@@ -8,4 +8,4 @@ ethtool_nl-y	:= netlink.o bitset.o strset.o linkinfo.o linkmodes.o rss.o \
 		   linkstate.o debug.o wol.o features.o privflags.o rings.o \
 		   channels.o coalesce.o pause.o eee.o tsinfo.o cabletest.o \
 		   tunnels.o fec.o eeprom.o stats.o phc_vclocks.o mm.o \
-		   module.o pse-pd.o plca.o mm.o
+		   module.o cmis_cdb.o pse-pd.o plca.o mm.o
diff --git a/net/ethtool/cmis.h b/net/ethtool/cmis.h
new file mode 100644
index 000000000000..295f5d0df915
--- /dev/null
+++ b/net/ethtool/cmis.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#define ETHTOOL_CMIS_CDB_LPL_MAX_PL_LENGTH		120
+#define ETHTOOL_CMIS_CDB_CMD_PAGE			0x9F
+#define ETHTOOL_CMIS_CDB_PAGE_I2C_ADDR			0x50
+
+/**
+ * struct ethtool_cmis_cdb - CDB commands parameters
+ * @cmis_rev: CMIS revision major.
+ * @read_write_len_ext: Allowable additional number of byte octets to the LPL
+ *			in a READ or a WRITE CDB commands.
+ * @max_completion_time:  Maximum CDB command completion time in msec.
+ */
+struct ethtool_cmis_cdb {
+	u8	cmis_rev;
+	u8      read_write_len_ext;
+	u16     max_completion_time;
+};
+
+enum ethtool_cmis_cdb_cmd_id {
+	ETHTOOL_CMIS_CDB_CMD_QUERY_STATUS		= 0x0000,
+	ETHTOOL_CMIS_CDB_CMD_MODULE_FEATURES		= 0x0040,
+};
+
+/**
+ * struct ethtool_cmis_cdb_request - CDB commands request fields as decribed in
+ *				the CMIS standard
+ * @id: Command ID.
+ * @epl_len: EPL memory length.
+ * @lpl_len: LPL memory length.
+ * @chk_code: Check code for the previous field and the payload.
+ * @resv1: Added to match the CMIS standard request continuity.
+ * @resv2: Added to match the CMIS standard request continuity.
+ * @payload: Payload for the CDB commands.
+ */
+struct ethtool_cmis_cdb_request {
+	__be16 id;
+	struct_group(body,
+		__be16 epl_len;
+		u8 lpl_len;
+		u8 chk_code;
+		u8 resv1;
+		u8 resv2;
+		u8 payload[ETHTOOL_CMIS_CDB_LPL_MAX_PL_LENGTH];
+	);
+};
+
+#define CDB_F_COMPLETION_VALID		BIT(0)
+#define CDB_F_STATUS_VALID		BIT(1)
+
+/**
+ * struct ethtool_cmis_cdb_cmd_args - CDB commands execution arguments
+ * @req: CDB command fields as described in the CMIS standard.
+ * @max_duration: Maximum duration time for command completion in msec.
+ * @read_write_len_ext: Allowable additional number of byte octets to the LPL
+ *			in a READ or a WRITE commands.
+ * @msleep_pre_rpl: Waiting time before checking reply in msec.
+ * @rpl_exp_len: Expected reply length in bytes.
+ * @flags: Validation flags for CDB commands.
+ * @err_msg: Error message to be sent to user space.
+ */
+struct ethtool_cmis_cdb_cmd_args {
+	struct ethtool_cmis_cdb_request req;
+	u16				max_duration;
+	u8				read_write_len_ext;
+	u8				msleep_pre_rpl;
+	u8                              rpl_exp_len;
+	u8				flags;
+	char				*err_msg;
+};
+
+/**
+ * struct ethtool_cmis_cdb_rpl_hdr - CDB commands reply header arguments
+ * @rpl_len: Reply length.
+ * @rpl_chk_code: Reply check code.
+ */
+struct ethtool_cmis_cdb_rpl_hdr {
+	u8 rpl_len;
+	u8 rpl_chk_code;
+};
+
+/**
+ * struct ethtool_cmis_cdb_rpl - CDB commands reply arguments
+ * @hdr: CDB commands reply header arguments.
+ * @payload: Payload for the CDB commands reply.
+ */
+struct ethtool_cmis_cdb_rpl {
+	struct ethtool_cmis_cdb_rpl_hdr hdr;
+	u8 payload[ETHTOOL_CMIS_CDB_LPL_MAX_PL_LENGTH];
+};
+
+u32 ethtool_cmis_get_max_payload_size(u8 num_of_byte_octs);
+
+void ethtool_cmis_cdb_compose_args(struct ethtool_cmis_cdb_cmd_args *args,
+				   enum ethtool_cmis_cdb_cmd_id cmd, u8 *pl,
+				   u8 lpl_len, u16 max_duration,
+				   u8 read_write_len_ext, u16 msleep_pre_rpl,
+				   u8 rpl_exp_len, u8 flags);
+
+void ethtool_cmis_cdb_check_completion_flag(u8 cmis_rev, u8 *flags);
+
+void ethtool_cmis_page_init(struct ethtool_module_eeprom *page_data,
+			    u8 page, u32 offset, u32 length);
+void ethtool_cmis_page_fini(struct ethtool_module_eeprom *page_data);
+
+struct ethtool_cmis_cdb *
+ethtool_cmis_cdb_init(struct net_device *dev,
+		      const struct ethtool_module_fw_flash_params *params,
+		      struct ethnl_module_fw_flash_ntf_params *ntf_params);
+void ethtool_cmis_cdb_fini(struct ethtool_cmis_cdb *cdb);
+
+int ethtool_cmis_wait_for_cond(struct net_device *dev, u8 flags, u8 flag,
+			       u16 max_duration, u32 offset,
+			       bool (*cond_success)(u8), bool (*cond_fail)(u8), u8 *state);
+
+int ethtool_cmis_cdb_execute_cmd(struct net_device *dev,
+				 struct ethtool_cmis_cdb_cmd_args *args);
diff --git a/net/ethtool/cmis_cdb.c b/net/ethtool/cmis_cdb.c
new file mode 100644
index 000000000000..1bb08783b60d
--- /dev/null
+++ b/net/ethtool/cmis_cdb.c
@@ -0,0 +1,602 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/ethtool.h>
+#include <linux/jiffies.h>
+
+#include "common.h"
+#include "module_fw.h"
+#include "cmis.h"
+
+/* For accessing the LPL field on page 9Fh, the allowable length extension is
+ * min(i, 15) byte octets where i specifies the allowable additional number of
+ * byte octets in a READ or a WRITE.
+ */
+u32 ethtool_cmis_get_max_payload_size(u8 num_of_byte_octs)
+{
+	return 8 * (1 + min_t(u8, num_of_byte_octs, 15));
+}
+
+void ethtool_cmis_cdb_compose_args(struct ethtool_cmis_cdb_cmd_args *args,
+				   enum ethtool_cmis_cdb_cmd_id cmd, u8 *pl,
+				   u8 lpl_len, u16 max_duration,
+				   u8 read_write_len_ext, u16 msleep_pre_rpl,
+				   u8 rpl_exp_len, u8 flags)
+{
+	args->req.id = cpu_to_be16(cmd);
+	args->req.lpl_len = lpl_len;
+	if (pl)
+		memcpy(args->req.payload, pl, args->req.lpl_len);
+
+	args->max_duration = max_duration;
+	args->read_write_len_ext =
+		ethtool_cmis_get_max_payload_size(read_write_len_ext);
+	args->msleep_pre_rpl = msleep_pre_rpl;
+	args->rpl_exp_len = rpl_exp_len;
+	args->flags = flags;
+	args->err_msg = NULL;
+}
+
+void ethtool_cmis_page_init(struct ethtool_module_eeprom *page_data,
+			    u8 page, u32 offset, u32 length)
+{
+	page_data->page = page;
+	page_data->offset = offset;
+	page_data->length = length;
+	page_data->i2c_address = ETHTOOL_CMIS_CDB_PAGE_I2C_ADDR;
+}
+
+#define CMIS_REVISION_PAGE	0x00
+#define CMIS_REVISION_OFFSET	0x01
+
+struct cmis_rev_rpl {
+	u8 rev;
+};
+
+static u8 cmis_rev_rpl_major(struct cmis_rev_rpl *rpl)
+{
+	return rpl->rev >> 4;
+}
+
+static int cmis_rev_major_get(struct net_device *dev, u8 *rev_major)
+{
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	struct ethtool_module_eeprom page_data = {0};
+	struct netlink_ext_ack extack = {};
+	struct cmis_rev_rpl rpl = {};
+	int err;
+
+	ethtool_cmis_page_init(&page_data, CMIS_REVISION_PAGE,
+			       CMIS_REVISION_OFFSET, sizeof(rpl));
+	page_data.data = (u8 *)&rpl;
+
+	err = ops->get_module_eeprom_by_page(dev, &page_data, &extack);
+	if (err < 0) {
+		if (extack._msg)
+			netdev_err(dev, "%s\n", extack._msg);
+		return err;
+	}
+
+	*rev_major = cmis_rev_rpl_major(&rpl);
+
+	return 0;
+}
+
+#define CMIS_CDB_ADVERTISEMENT_PAGE	0x01
+#define CMIS_CDB_ADVERTISEMENT_OFFSET	0xA3
+
+/* Based on section 8.4.11 "CDB Messaging Support Advertisement" in CMIS
+ * standard revision 5.2.
+ */
+struct cmis_cdb_advert_rpl {
+	u8	inst_supported;
+	u8	read_write_len_ext;
+	u8	resv1;
+	u8	resv2;
+};
+
+static u8 cmis_cdb_advert_rpl_inst_supported(struct cmis_cdb_advert_rpl *rpl)
+{
+	return rpl->inst_supported >> 6;
+}
+
+static int cmis_cdb_advertisement_get(struct ethtool_cmis_cdb *cdb,
+				      struct net_device *dev)
+{
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	struct ethtool_module_eeprom page_data = {};
+	struct cmis_cdb_advert_rpl rpl = {};
+	struct netlink_ext_ack extack = {};
+	int err;
+
+	ethtool_cmis_page_init(&page_data, CMIS_CDB_ADVERTISEMENT_PAGE,
+			       CMIS_CDB_ADVERTISEMENT_OFFSET, sizeof(rpl));
+	page_data.data = (u8 *)&rpl;
+
+	err = ops->get_module_eeprom_by_page(dev, &page_data, &extack);
+	if (err < 0) {
+		if (extack._msg)
+			netdev_err(dev, "%s\n", extack._msg);
+		return err;
+	}
+
+	if (!cmis_cdb_advert_rpl_inst_supported(&rpl))
+		return -EOPNOTSUPP;
+
+	cdb->read_write_len_ext = rpl.read_write_len_ext;
+
+	return 0;
+}
+
+#define CMIS_PASSWORD_ENTRY_PAGE	0x00
+#define CMIS_PASSWORD_ENTRY_OFFSET	0x7A
+
+struct cmis_password_entry_pl {
+	__be32 password;
+};
+
+/* See section 9.3.1 "CMD 0000h: Query Status" in CMIS standard revision 5.2.
+ * struct cmis_cdb_query_status_pl and struct cmis_cdb_query_status_rpl are
+ * structured layouts of the flat arrays,
+ * struct ethtool_cmis_cdb_request::payload and
+ * struct ethtool_cmis_cdb_rpl::payload respectively.
+ */
+struct cmis_cdb_query_status_pl {
+	u16 response_delay;
+};
+
+struct cmis_cdb_query_status_rpl {
+	u8 length;
+	u8 status;
+};
+
+static int
+cmis_cdb_validate_password(struct ethtool_cmis_cdb *cdb,
+			   struct net_device *dev,
+			   const struct ethtool_module_fw_flash_params *params,
+			   struct ethnl_module_fw_flash_ntf_params *ntf_params)
+{
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	struct cmis_cdb_query_status_pl qs_pl = {0};
+	struct ethtool_module_eeprom page_data = {};
+	struct ethtool_cmis_cdb_cmd_args args = {};
+	struct cmis_password_entry_pl pe_pl = {};
+	struct cmis_cdb_query_status_rpl *rpl;
+	struct netlink_ext_ack extack = {};
+	int err;
+
+	ethtool_cmis_page_init(&page_data, CMIS_PASSWORD_ENTRY_PAGE,
+			       CMIS_PASSWORD_ENTRY_OFFSET, sizeof(pe_pl));
+	page_data.data = (u8 *)&pe_pl;
+
+	pe_pl = *((struct cmis_password_entry_pl *)page_data.data);
+	pe_pl.password = params->password;
+	err = ops->set_module_eeprom_by_page(dev, &page_data, &extack);
+	if (err < 0) {
+		if (extack._msg)
+			netdev_err(dev, "%s\n", extack._msg);
+		return err;
+	}
+
+	ethtool_cmis_cdb_compose_args(&args, ETHTOOL_CMIS_CDB_CMD_QUERY_STATUS,
+				      (u8 *)&qs_pl, sizeof(qs_pl), 0,
+				      cdb->read_write_len_ext, 1000,
+				      sizeof(*rpl),
+				      CDB_F_COMPLETION_VALID | CDB_F_STATUS_VALID);
+
+	err = ethtool_cmis_cdb_execute_cmd(dev, &args);
+	if (err < 0) {
+		ethnl_module_fw_flash_ntf_err(dev, ntf_params,
+					      "Query Status command failed",
+					      args.err_msg);
+		return err;
+	}
+
+	rpl = (struct cmis_cdb_query_status_rpl *)args.req.payload;
+	if (!rpl->length || !rpl->status) {
+		ethnl_module_fw_flash_ntf_err(dev, ntf_params,
+					      "Password was not accepted",
+					      NULL);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* Some CDB commands asserts the CDB completion flag only from CMIS
+ * revision 5. Therefore, check the relevant validity flag only when
+ * the revision supports it.
+ */
+void ethtool_cmis_cdb_check_completion_flag(u8 cmis_rev, u8 *flags)
+{
+	*flags |= cmis_rev >= 5 ? CDB_F_COMPLETION_VALID : 0;
+}
+
+#define CMIS_CDB_MODULE_FEATURES_RESV_DATA	34
+
+/* See section 9.4.1 "CMD 0040h: Module Features" in CMIS standard revision 5.2.
+ * struct cmis_cdb_module_features_rpl is structured layout of the flat
+ * array, ethtool_cmis_cdb_rpl::payload.
+ */
+struct cmis_cdb_module_features_rpl {
+	u8	resv1[CMIS_CDB_MODULE_FEATURES_RESV_DATA];
+	__be16	max_completion_time;
+};
+
+static u16
+cmis_cdb_module_features_completion_time(struct cmis_cdb_module_features_rpl *rpl)
+{
+	return be16_to_cpu(rpl->max_completion_time);
+}
+
+static int cmis_cdb_module_features_get(struct ethtool_cmis_cdb *cdb,
+					struct net_device *dev,
+					struct ethnl_module_fw_flash_ntf_params *ntf_params)
+{
+	struct ethtool_cmis_cdb_cmd_args args = {};
+	struct cmis_cdb_module_features_rpl *rpl;
+	u8 flags = CDB_F_STATUS_VALID;
+	int err;
+
+	ethtool_cmis_cdb_check_completion_flag(cdb->cmis_rev, &flags);
+	ethtool_cmis_cdb_compose_args(&args,
+				      ETHTOOL_CMIS_CDB_CMD_MODULE_FEATURES,
+				      NULL, 0, 0, cdb->read_write_len_ext,
+				      1000, sizeof(*rpl), flags);
+
+	err = ethtool_cmis_cdb_execute_cmd(dev, &args);
+	if (err < 0) {
+		ethnl_module_fw_flash_ntf_err(dev, ntf_params,
+					      "Module Features command failed",
+					      args.err_msg);
+		return err;
+	}
+
+	rpl = (struct cmis_cdb_module_features_rpl *)args.req.payload;
+	cdb->max_completion_time =
+		cmis_cdb_module_features_completion_time(rpl);
+
+	return 0;
+}
+
+struct ethtool_cmis_cdb *
+ethtool_cmis_cdb_init(struct net_device *dev,
+		      const struct ethtool_module_fw_flash_params *params,
+		      struct ethnl_module_fw_flash_ntf_params *ntf_params)
+{
+	struct ethtool_cmis_cdb *cdb;
+	int err;
+
+	cdb = kzalloc(sizeof(*cdb), GFP_KERNEL);
+	if (!cdb)
+		return ERR_PTR(-ENOMEM);
+
+	err = cmis_rev_major_get(dev, &cdb->cmis_rev);
+	if (err < 0)
+		goto err;
+
+	if (cdb->cmis_rev < 4) {
+		ethnl_module_fw_flash_ntf_err(dev, ntf_params,
+					      "CMIS revision doesn't support module firmware flashing",
+					      NULL);
+		err = -EOPNOTSUPP;
+		goto err;
+	}
+
+	err = cmis_cdb_advertisement_get(cdb, dev);
+	if (err < 0)
+		goto err;
+
+	if (params->password_valid) {
+		err = cmis_cdb_validate_password(cdb, dev, params, ntf_params);
+		if (err < 0)
+			goto err;
+	}
+
+	err = cmis_cdb_module_features_get(cdb, dev, ntf_params);
+	if (err < 0)
+		goto err;
+
+	return cdb;
+
+err:
+	ethtool_cmis_cdb_fini(cdb);
+	return ERR_PTR(err);
+}
+
+void ethtool_cmis_cdb_fini(struct ethtool_cmis_cdb *cdb)
+{
+	kfree(cdb);
+}
+
+static bool is_completed(u8 data)
+{
+	return !!(data & 0x40);
+}
+
+#define CMIS_CDB_STATUS_SUCCESS	0x01
+
+static bool status_success(u8 data)
+{
+	return data == CMIS_CDB_STATUS_SUCCESS;
+}
+
+#define CMIS_CDB_STATUS_FAIL	0x40
+
+static bool status_fail(u8 data)
+{
+	return data & CMIS_CDB_STATUS_FAIL;
+}
+
+struct cmis_wait_for_cond_rpl {
+	u8 state;
+};
+
+static int
+ethtool_cmis_module_poll(struct net_device *dev,
+			 struct cmis_wait_for_cond_rpl *rpl, u32 offset,
+			 bool (*cond_success)(u8), bool (*cond_fail)(u8))
+{
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	struct ethtool_module_eeprom page_data = {0};
+	struct netlink_ext_ack extack = {};
+	int err;
+
+	ethtool_cmis_page_init(&page_data, 0, offset, sizeof(rpl));
+	page_data.data = (u8 *)rpl;
+
+	err = ops->get_module_eeprom_by_page(dev, &page_data, &extack);
+	if (err < 0) {
+		if (extack._msg)
+			netdev_err_once(dev, "%s\n", extack._msg);
+		return -EBUSY;
+	}
+
+	if ((*cond_success)(rpl->state))
+		return 0;
+
+	if (*cond_fail && (*cond_fail)(rpl->state))
+		return -EIO;
+
+	return -EBUSY;
+}
+
+int ethtool_cmis_wait_for_cond(struct net_device *dev, u8 flags, u8 flag,
+			       u16 max_duration, u32 offset,
+			       bool (*cond_success)(u8), bool (*cond_fail)(u8),
+			       u8 *state)
+{
+	struct cmis_wait_for_cond_rpl rpl = {};
+	unsigned long end;
+	int err;
+
+	if (!(flags & flag))
+		return 0;
+
+	if (max_duration == 0)
+		max_duration = U16_MAX;
+
+	end = jiffies + msecs_to_jiffies(max_duration);
+	do {
+		err = ethtool_cmis_module_poll(dev, &rpl, offset, cond_success,
+					       cond_fail);
+		if (err != -EBUSY)
+			goto out;
+
+		msleep(20);
+	} while (time_before(jiffies, end));
+
+	err = ethtool_cmis_module_poll(dev, &rpl, offset, cond_success,
+				       cond_fail);
+	if (err == -EBUSY)
+		err = -ETIMEDOUT;
+
+out:
+	*state = rpl.state;
+	return err;
+}
+
+#define CMIS_CDB_COMPLETION_FLAG_OFFSET	0x08
+
+static int cmis_cdb_wait_for_completion(struct net_device *dev,
+					struct ethtool_cmis_cdb_cmd_args *args)
+{
+	u8 flag;
+	int err;
+
+	/* Some vendors demand waiting time before checking completion flag
+	 * in some CDB commands.
+	 */
+	msleep(args->msleep_pre_rpl);
+
+	err = ethtool_cmis_wait_for_cond(dev, args->flags,
+					 CDB_F_COMPLETION_VALID,
+					 args->max_duration,
+					 CMIS_CDB_COMPLETION_FLAG_OFFSET,
+					 is_completed, NULL, &flag);
+	if (err < 0)
+		args->err_msg = "Completion Flag did not set on time";
+
+	return err;
+}
+
+#define CMIS_CDB_STATUS_OFFSET	0x25
+
+static void cmis_cdb_status_fail_msg_get(u8 status, char **err_msg)
+{
+	switch (status) {
+	case 0b10000001:
+		*err_msg = "CDB Status is in progress: Busy capturing command";
+		break;
+	case 0b10000010:
+		*err_msg =
+			"CDB Status is in progress: Busy checking/validating command";
+		break;
+	case 0b10000011:
+		*err_msg = "CDB Status is in progress: Busy executing";
+		break;
+	case 0b01000000:
+		*err_msg = "CDB status failed: no specific failure";
+		break;
+	case 0b01000010:
+		*err_msg =
+			"CDB status failed: Parameter range error or parameter not supported";
+		break;
+	case 0b01000101:
+		*err_msg = "CDB status failed: CdbChkCode error";
+		break;
+	default:
+		*err_msg = "Unknown failure reason";
+	}
+};
+
+static int cmis_cdb_wait_for_status(struct net_device *dev,
+				    struct ethtool_cmis_cdb_cmd_args *args)
+{
+	u8 status;
+	int err;
+
+	/* Some vendors demand waiting time before checking status in some
+	 * CDB commands.
+	 */
+	msleep(args->msleep_pre_rpl);
+
+	err = ethtool_cmis_wait_for_cond(dev, args->flags, CDB_F_STATUS_VALID,
+					 args->max_duration,
+					 CMIS_CDB_STATUS_OFFSET,
+					 status_success, status_fail, &status);
+	if (err < 0 && !args->err_msg)
+		cmis_cdb_status_fail_msg_get(status, &args->err_msg);
+
+	return err;
+}
+
+#define CMIS_CDB_REPLY_OFFSET	0x86
+
+static int cmis_cdb_process_reply(struct net_device *dev,
+				  struct ethtool_module_eeprom *page_data,
+				  struct ethtool_cmis_cdb_cmd_args *args)
+{
+	u8 rpl_hdr_len = sizeof(struct ethtool_cmis_cdb_rpl_hdr);
+	u8 rpl_exp_len = args->rpl_exp_len + rpl_hdr_len;
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	struct netlink_ext_ack extack = {};
+	struct ethtool_cmis_cdb_rpl *rpl;
+	int err;
+
+	if (!args->rpl_exp_len)
+		return 0;
+
+	ethtool_cmis_page_init(page_data, ETHTOOL_CMIS_CDB_CMD_PAGE,
+			       CMIS_CDB_REPLY_OFFSET, rpl_exp_len);
+	page_data->data = kmalloc(page_data->length, GFP_KERNEL);
+	if (!page_data->data)
+		return -ENOMEM;
+
+	err = ops->get_module_eeprom_by_page(dev, page_data, &extack);
+	if (err < 0) {
+		if (extack._msg)
+			netdev_err(dev, "%s\n", extack._msg);
+		goto out;
+	}
+
+	rpl = (struct ethtool_cmis_cdb_rpl *)page_data->data;
+	if ((args->rpl_exp_len > rpl->hdr.rpl_len + rpl_hdr_len) ||
+	    !rpl->hdr.rpl_chk_code) {
+		err = -EIO;
+		goto out;
+	}
+
+	args->req.lpl_len = rpl->hdr.rpl_len;
+	memcpy(args->req.payload, rpl->payload, args->req.lpl_len);
+
+out:
+	kfree(page_data->data);
+	return err;
+}
+
+static int
+__ethtool_cmis_cdb_execute_cmd(struct net_device *dev,
+			       struct ethtool_module_eeprom *page_data,
+			       u8 page, u32 offset, u32 length, void *data)
+{
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	struct netlink_ext_ack extack = {};
+	int err;
+
+	ethtool_cmis_page_init(page_data, page, offset, length);
+	page_data->data = kmemdup(data, page_data->length, GFP_KERNEL);
+	if (!page_data->data)
+		return -ENOMEM;
+
+	err = ops->set_module_eeprom_by_page(dev, page_data, &extack);
+	if (err < 0) {
+		if (extack._msg)
+			netdev_err(dev, "%s\n", extack._msg);
+	}
+
+	kfree(page_data->data);
+	return err;
+}
+
+static u8 cmis_cdb_calc_checksum(const void *data, size_t size)
+{
+	const u8 *bytes = (const u8 *)data;
+	u8 checksum = 0;
+
+	for (size_t i = 0; i < size; i++)
+		checksum += bytes[i];
+
+	return ~checksum;
+}
+
+#define CMIS_CDB_CMD_ID_OFFSET	0x80
+
+int ethtool_cmis_cdb_execute_cmd(struct net_device *dev,
+				 struct ethtool_cmis_cdb_cmd_args *args)
+{
+	struct ethtool_module_eeprom page_data = {};
+	u32 offset;
+	int err;
+
+	args->req.chk_code =
+		cmis_cdb_calc_checksum(&args->req, sizeof(args->req));
+
+	if (args->req.lpl_len > args->read_write_len_ext) {
+		args->err_msg = "LPL length is longer than CDB read write length extension allows";
+		return -EINVAL;
+	}
+
+	/* According to the CMIS standard, there are two options to trigger the
+	 * CDB commands. The default option is triggering the command by writing
+	 * the CMDID bytes. Therefore, the command will be split to 2 calls:
+	 * First, with everything except the CMDID field and then the CMDID
+	 * field.
+	 */
+	offset = CMIS_CDB_CMD_ID_OFFSET +
+		offsetof(struct ethtool_cmis_cdb_request, body);
+	err = __ethtool_cmis_cdb_execute_cmd(dev, &page_data,
+					     ETHTOOL_CMIS_CDB_CMD_PAGE, offset,
+					     sizeof(args->req.body),
+					     &args->req.body);
+	if (err < 0)
+		return err;
+
+	offset = CMIS_CDB_CMD_ID_OFFSET +
+		offsetof(struct ethtool_cmis_cdb_request, id);
+	err = __ethtool_cmis_cdb_execute_cmd(dev, &page_data,
+					     ETHTOOL_CMIS_CDB_CMD_PAGE, offset,
+					     sizeof(args->req.id),
+					     &args->req.id);
+	if (err < 0)
+		return err;
+
+	err = cmis_cdb_wait_for_completion(dev, args);
+	if (err < 0)
+		return err;
+
+	err = cmis_cdb_wait_for_status(dev, args);
+	if (err < 0)
+		return err;
+
+	return cmis_cdb_process_reply(dev, &page_data, args);
+}
diff --git a/net/ethtool/module_fw.h b/net/ethtool/module_fw.h
index ee4a291ac1d4..6c86d05ab6cf 100644
--- a/net/ethtool/module_fw.h
+++ b/net/ethtool/module_fw.h
@@ -15,6 +15,16 @@ struct ethnl_module_fw_flash_ntf_params {
 	bool closed_sock;
 };
 
+/**
+ * struct ethtool_module_fw_flash_params - module firmware flashing parameters
+ * @password: Module password. Only valid when @pass_valid is set.
+ * @password_valid: Whether the module password is valid or not.
+ */
+struct ethtool_module_fw_flash_params {
+	__be32 password;
+	u8 password_valid:1;
+};
+
 void
 ethnl_module_fw_flash_ntf_err(struct net_device *dev,
 			      struct ethnl_module_fw_flash_ntf_params *params,
-- 
2.45.0


