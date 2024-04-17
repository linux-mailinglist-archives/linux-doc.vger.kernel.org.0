Return-Path: <linux-doc+bounces-14425-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 229028A7EDE
	for <lists+linux-doc@lfdr.de>; Wed, 17 Apr 2024 10:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45321F24804
	for <lists+linux-doc@lfdr.de>; Wed, 17 Apr 2024 08:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4DA13C81C;
	Wed, 17 Apr 2024 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nwjekkMu"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D009A13C68F;
	Wed, 17 Apr 2024 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713344114; cv=fail; b=GC9xzVC3ILlPL6UybkGKLu8v8cyNXDw2DUrfKvzE1C8Taaxkw3tQhUiguoIyVNosSGPeT+Gl+qQOrow8DgJlesL4Kx7JvXZlRn6PcRYI26/Rz+lFiOArCIvD2LqYZnsKyik4InEKrrO/jRgvSat7r0v0S6/NjhCGEbFOOyV3Tl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713344114; c=relaxed/simple;
	bh=AfMSgWSQr14Kq7RRN+mCLxiDZzv7bYqh+EGqO3emaZE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8p5wKIP0cyb+b21mPfw028tZYFH9p5q6BNYf2y/5W25p0CE0PMrCKirFOtGOqcEluQKTWrV4ine5tj0rYs08/R1dbHZfNq8QI/EKZ+PrHjdiSSR/WtfjAwX6lDIRnoJOMm/f9gyXk75qmbqh+tIwy31ZBfH4vMJ4EA95OkVI5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nwjekkMu; arc=fail smtp.client-ip=40.107.92.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRbE/wOvj6ultxaGaasZ14lnvQOKyQxBTsF61H9bE6wG9TUj3i4iJSxdvhNmY39tPNi5DxAC2ZDiOfOrIRAhLIdF/GAFul/OY6lWhehNlvCJ6OV8bi8iNXeO8g5wfeVlCq5suGUy2nvl3NIe99ktYk9sonvP1UFI9+m0oley4r8+eFnAvApz7CAejocHkGaV8Dbh5y0bxJ/g6jPaVOidiVaaIMzEk3D0Wqe0Q3+y7HEeu4pUSo34h1Y6E0DXdSYlsQTUlifBmknM8ysZ5rH0Uzc9EAhsryhk/VevcUudqN/iOwmUnG3F8ZQ0H5+8kC2k6npE32mfPrU+7+Vr+zIPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38Gdhk3KN04AsB2+FtnOPufQa9OPd0VNkEYGnuMTvIE=;
 b=P1xGKjepoa/KgooQaK7BjXsJ3XuPQPWTLOuSdY263YXh90s2e0DLkixrf8f1QHbq6sHulSWREHBEgl3FKCQ3K9JCOOsIrtf5hjV/8UghnQ5YkieptqwAVdWpKOnLiP7btMyFhbRHhxtzluhWZ8xgcjBd+shXzkki3yVYkp6yFJBBrXaLXeHu5pPP7POOgXY48+D+OY0jp4FR3qTGxhSjPCS0wNR8vsFhGnP+pqC4+wPpX8JfrCt/5NCZ+l98pYbFL9snhYt4dLJ0SZCmwgzq8A2leA+lh95E8AUhQRP/gNVZ1r+2bnyhGRldsJXPdO7FnUVPQl4GwPgtMZORbwbqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38Gdhk3KN04AsB2+FtnOPufQa9OPd0VNkEYGnuMTvIE=;
 b=nwjekkMuS0CHuT3+UAbsKiXQVDklKPQ/afh81desiWCGGAJTnPDNmrjWn4/lzq7dMsmJu1LIf5rfFSxjiYL/zGjg5De6oTRA2PbKddCyQ0l94K8FSdQCtUXxTcL3PoN9Jl+fQ2XwzO6ssYkkPgXlrFruGMQE8lEBykH6lfnF6wsvR780XQHyb13i3Jmtdn2kxXYmp7ydW9xN2H+ZUJdf615s2sogdAxm0DbyJn3p/QAFYvqFuJ21AJeaGG9YYi5Lp+4ZTsmij/glCw+1D2jD/beBrGurfgKzNqHemBtjvaBbZfYxN2yV/JSXAsNMQpXrLP92XjjlCQ0o5YvYY1sZsQ==
Received: from DM6PR17CA0012.namprd17.prod.outlook.com (2603:10b6:5:1b3::25)
 by CH3PR12MB8536.namprd12.prod.outlook.com (2603:10b6:610:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 08:55:10 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:1b3:cafe::de) by DM6PR17CA0012.outlook.office365.com
 (2603:10b6:5:1b3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Wed, 17 Apr 2024 08:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 08:55:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 17 Apr
 2024 01:55:01 -0700
Received: from dev-r-vrt-155.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Wed, 17 Apr 2024 01:54:55 -0700
From: Danielle Ratson <danieller@nvidia.com>
To: <netdev@vger.kernel.org>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <corbet@lwn.net>, <linux@armlinux.org.uk>,
	<sdf@google.com>, <kory.maincent@bootlin.com>,
	<maxime.chevallier@bootlin.com>, <vladimir.oltean@nxp.com>,
	<przemyslaw.kitszel@intel.com>, <ahmed.zaki@intel.com>,
	<richardcochran@gmail.com>, <shayagr@amazon.com>, <paul.greenwalt@intel.com>,
	<jiri@resnulli.us>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <mlxsw@nvidia.com>, <petrm@nvidia.com>,
	<idosch@nvidia.com>, <danieller@nvidia.com>
Subject: [PATCH net-next v3 09/10] ethtool: Add ability to flash transceiver modules' firmware
Date: Wed, 17 Apr 2024 11:53:46 +0300
Message-ID: <20240417085347.2836385-10-danieller@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240417085347.2836385-1-danieller@nvidia.com>
References: <20240417085347.2836385-1-danieller@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CH3PR12MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 80645e5a-8c51-4fb3-f04a-08dc5ebc1653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z33CSchLGsZB+/hYART6kqnVhrHLBKgUx90kfJokbXFLPIj5ddSZEODg/vft5i+2TkFlX9flmA1aVO7XJpH142NmuDnooaEaoyIoeYSw476zOHb7Q5/0/FhUOk1GJjI15XQbjAiIvqiH0aPA2lFd9kxg0S6OeH0+WTODRL5KfSJBFI8KbtQMKcjQSIv26UK/oPv9WpYG3Bb5mFyoVJhDW0aOMPYqlz9+k47sD/+V8ztb2dE8pAY7t/4OdqNHk1gSgY9oKlWa7VUzO5yP3X1f7lKto2+FBSGqpVoc9tYN9v4GkVLnb42XwQUsTJZpNaevuRDm7faT7bFyrlCeC7AD/6G7pg0wsmiBqwr78J3j41AsEmS9t6XstEztmkahmFwiaaxTVz64Q1VN7pzyE1JRXi2nYxqYIKq/MEGN44+IuXdOEmm6ZbKWAFidH0JmEyIzelDQmJ9ZrC0o8vE1ICRhxm03oVow+9NfIhxwn611QxXKCGqObifQFTDdXT9YRZm48qCtmsQLp9SeECD3Yzvvgvm8F2535TOOM90WVmcCrpQWwqOFCuqmn39csBy+TsO15N1WFRQBfwmC6FkMRlBSIq83baAODLHu/fn6AEylKxQyDwC58ODAp359Gw1Fmxcaiq+5yjp+6G1FmGGe0QPTXulWBiWeF8ec3/ejL/+fYQca2i1Nbfwpva5QVQ9HutDOHjbb1EeF9McJ69yiHIolQ0wd1sK1DTcQFmk9FVQT/ZwOV5OKBJ6vWNifFFjCIrrk
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 08:55:09.9667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80645e5a-8c51-4fb3-f04a-08dc5ebc1653
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8536

Add the ability to flash the modules' firmware by implementing the
interface between the user space and the kernel.

Example from a succeeding implementation:

 # ethtool --flash-module-firmware swp40 file test.bin

 Transceiver module firmware flashing started for device eth0

 Transceiver module firmware flashing in progress for device eth0
 Status message: Downloading firmware image
 Progress: 0%

 [...]

 Transceiver module firmware flashing in progress for device eth0
 Status message: Downloading firmware image
 Progress: 50%

 [...]

 Transceiver module firmware flashing in progress for device eth0
 Status message: Downloading firmware image
 Progress: 100%

 Transceiver module firmware flashing completed for device eth0

Signed-off-by: Danielle Ratson <danieller@nvidia.com>
---
 net/ethtool/module.c  | 174 ++++++++++++++++++++++++++++++++++++++++++
 net/ethtool/netlink.c |   7 ++
 net/ethtool/netlink.h |   2 +
 3 files changed, 183 insertions(+)

diff --git a/net/ethtool/module.c b/net/ethtool/module.c
index 1c659bd85160..836c198d2cc4 100644
--- a/net/ethtool/module.c
+++ b/net/ethtool/module.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/ethtool.h>
+#include <linux/firmware.h>
+#include <linux/sfp.h>
 
 #include "netlink.h"
 #include "common.h"
@@ -160,6 +162,178 @@ const struct ethnl_request_ops ethnl_module_request_ops = {
 	.set_ntf_cmd		= ETHTOOL_MSG_MODULE_NTF,
 };
 
+/* MODULE_FW_FLASH_ACT */
+
+const struct nla_policy
+ethnl_module_fw_flash_act_policy[ETHTOOL_A_MODULE_FW_FLASH_PASSWORD + 1] = {
+	[ETHTOOL_A_MODULE_FW_FLASH_HEADER] =
+		NLA_POLICY_NESTED(ethnl_header_policy),
+	[ETHTOOL_A_MODULE_FW_FLASH_FILE_NAME] = { .type = NLA_NUL_STRING },
+	[ETHTOOL_A_MODULE_FW_FLASH_PASSWORD] = { .type = NLA_U32 },
+};
+
+#define MODULE_EEPROM_PHYS_ID_PAGE	0
+#define MODULE_EEPROM_PHYS_ID_I2C_ADDR	0x50
+
+static int module_flash_fw_work_init(struct ethtool_module_fw_flash *module_fw,
+				     struct net_device *dev,
+				     struct netlink_ext_ack *extack)
+{
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+	struct ethtool_module_eeprom page_data = {};
+	u8 phys_id;
+	int err;
+
+	/* Fetch the SFF-8024 Identifier Value. For all supported standards, it
+	 * is located at I2C address 0x50, byte 0. See section 4.1 in SFF-8024,
+	 * revision 4.9.
+	 */
+	page_data.page = MODULE_EEPROM_PHYS_ID_PAGE;
+	page_data.offset = SFP_PHYS_ID;
+	page_data.length = sizeof(phys_id);
+	page_data.i2c_address = MODULE_EEPROM_PHYS_ID_I2C_ADDR;
+	page_data.data = &phys_id;
+
+	err = ops->get_module_eeprom_by_page(dev, &page_data, extack);
+	if (err < 0)
+		return err;
+
+	switch (phys_id) {
+	case SFF8024_ID_QSFP_DD:
+	case SFF8024_ID_OSFP:
+	case SFF8024_ID_DSFP:
+	case SFF8024_ID_QSFP_PLUS_CMIS:
+	case SFF8024_ID_SFP_DD_CMIS:
+	case SFF8024_ID_SFP_PLUS_CMIS:
+		INIT_WORK(&module_fw->work, ethtool_cmis_fw_update);
+		break;
+	default:
+		NL_SET_ERR_MSG(extack,
+			       "Module type does not support firmware flashing");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int __module_flash_fw_schedule(struct net_device *dev,
+				      struct netlink_ext_ack *extack)
+{
+	const struct ethtool_ops *ops = dev->ethtool_ops;
+
+	if (!ops->set_module_eeprom_by_page ||
+	    !ops->get_module_eeprom_by_page) {
+		NL_SET_ERR_MSG(extack,
+			       "Flashing module firmware is not supported by this device");
+		return -EOPNOTSUPP;
+	}
+
+	if (!ops->reset) {
+		NL_SET_ERR_MSG(extack,
+			       "Reset module is not supported by this device, so flashing is not permitted");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int
+module_flash_fw_schedule(struct net_device *dev, const char *file_name,
+			 struct ethtool_module_fw_flash_params *params,
+			 struct netlink_ext_ack *extack)
+{
+	struct ethtool_module_fw_flash *module_fw;
+	int err;
+
+	err = __module_flash_fw_schedule(dev, extack);
+	if (err < 0)
+		return err;
+
+	module_fw = kzalloc(sizeof(*module_fw), GFP_KERNEL);
+	if (!module_fw)
+		return -ENOMEM;
+
+	module_fw->params = *params;
+	err = request_firmware_direct(&module_fw->fw, file_name, &dev->dev);
+	if (err) {
+		NL_SET_ERR_MSG(extack,
+			       "Failed to request module firmware image");
+		goto err_request_firmware;
+	}
+
+	err = module_flash_fw_work_init(module_fw, dev, extack);
+	if (err < 0) {
+		NL_SET_ERR_MSG(extack,
+			       "Flashing module firmware is not supported by this device");
+		goto err_work_init;
+	}
+
+	dev->module_fw_flash_in_progress = true;
+	netdev_hold(dev, &module_fw->dev_tracker, GFP_KERNEL);
+	module_fw->dev = dev;
+
+	schedule_work(&module_fw->work);
+
+	return 0;
+
+err_work_init:
+	release_firmware(module_fw->fw);
+err_request_firmware:
+	kfree(module_fw);
+	return err;
+}
+
+static int module_flash_fw(struct net_device *dev, struct nlattr **tb,
+			   struct genl_info *info)
+{
+	struct ethtool_module_fw_flash_params params = {};
+	const char *file_name;
+	struct nlattr *attr;
+
+	if (GENL_REQ_ATTR_CHECK(info, ETHTOOL_A_MODULE_FW_FLASH_FILE_NAME))
+		return -EINVAL;
+
+	file_name = nla_data(tb[ETHTOOL_A_MODULE_FW_FLASH_FILE_NAME]);
+
+	attr = tb[ETHTOOL_A_MODULE_FW_FLASH_PASSWORD];
+	if (attr) {
+		params.password = cpu_to_be32(nla_get_u32(attr));
+		params.password_valid = true;
+	}
+
+	return module_flash_fw_schedule(dev, file_name, &params, info->extack);
+}
+
+int ethnl_act_module_fw_flash(struct sk_buff *skb, struct genl_info *info)
+{
+	struct ethnl_req_info req_info = {};
+	struct nlattr **tb = info->attrs;
+	struct net_device *dev;
+	int ret;
+
+	ret = ethnl_parse_header_dev_get(&req_info,
+					 tb[ETHTOOL_A_MODULE_FW_FLASH_HEADER],
+					 genl_info_net(info), info->extack,
+					 true);
+	if (ret < 0)
+		return ret;
+	dev = req_info.dev;
+
+	rtnl_lock();
+	ret = ethnl_ops_begin(dev);
+	if (ret < 0)
+		goto out_rtnl;
+
+	ret = module_flash_fw(dev, tb, info);
+
+	ethnl_ops_complete(dev);
+
+out_rtnl:
+	rtnl_unlock();
+	ethnl_parse_header_dev_put(&req_info);
+	return ret;
+}
+
 /* MODULE_FW_FLASH_NTF */
 
 static void
diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 563e94e0cbd8..1a4f6bd1ec7f 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -1169,6 +1169,13 @@ static const struct genl_ops ethtool_genl_ops[] = {
 		.policy = ethnl_mm_set_policy,
 		.maxattr = ARRAY_SIZE(ethnl_mm_set_policy) - 1,
 	},
+	{
+		.cmd	= ETHTOOL_MSG_MODULE_FW_FLASH_ACT,
+		.flags	= GENL_UNS_ADMIN_PERM,
+		.doit	= ethnl_act_module_fw_flash,
+		.policy	= ethnl_module_fw_flash_act_policy,
+		.maxattr = ARRAY_SIZE(ethnl_module_fw_flash_act_policy) - 1,
+	},
 };
 
 static const struct genl_multicast_group ethtool_nl_mcgrps[] = {
diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
index d57a890b5d9e..e1e2edd05206 100644
--- a/net/ethtool/netlink.h
+++ b/net/ethtool/netlink.h
@@ -446,6 +446,7 @@ extern const struct nla_policy ethnl_plca_set_cfg_policy[ETHTOOL_A_PLCA_MAX + 1]
 extern const struct nla_policy ethnl_plca_get_status_policy[ETHTOOL_A_PLCA_HEADER + 1];
 extern const struct nla_policy ethnl_mm_get_policy[ETHTOOL_A_MM_HEADER + 1];
 extern const struct nla_policy ethnl_mm_set_policy[ETHTOOL_A_MM_MAX + 1];
+extern const struct nla_policy ethnl_module_fw_flash_act_policy[ETHTOOL_A_MODULE_FW_FLASH_PASSWORD + 1];
 
 int ethnl_set_features(struct sk_buff *skb, struct genl_info *info);
 int ethnl_act_cable_test(struct sk_buff *skb, struct genl_info *info);
@@ -453,6 +454,7 @@ int ethnl_act_cable_test_tdr(struct sk_buff *skb, struct genl_info *info);
 int ethnl_tunnel_info_doit(struct sk_buff *skb, struct genl_info *info);
 int ethnl_tunnel_info_start(struct netlink_callback *cb);
 int ethnl_tunnel_info_dumpit(struct sk_buff *skb, struct netlink_callback *cb);
+int ethnl_act_module_fw_flash(struct sk_buff *skb, struct genl_info *info);
 
 extern const char stats_std_names[__ETHTOOL_STATS_CNT][ETH_GSTRING_LEN];
 extern const char stats_eth_phy_names[__ETHTOOL_A_STATS_ETH_PHY_CNT][ETH_GSTRING_LEN];
-- 
2.43.0


