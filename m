Return-Path: <linux-doc+bounces-13580-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 160DB89A810
	for <lists+linux-doc@lfdr.de>; Sat,  6 Apr 2024 03:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1DE1F2298D
	for <lists+linux-doc@lfdr.de>; Sat,  6 Apr 2024 01:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059BF17C2;
	Sat,  6 Apr 2024 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HvB2Y9zS"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148F1FDA;
	Sat,  6 Apr 2024 01:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712365575; cv=fail; b=o1TEYN7D+nGxUznnA7sYbjj/5ZuYCM8tR/9YAEgjiPiSOWZLDQOzmZhmGE9lwHMrrBNJ+uWT1xiZMDGtGUXcwLhbZScHFIoBYFLTJX2ORPynO6P287Civ8Yvajzk4mDo12OtAGU0m+NfUntM5yTwbvIj7zLBSjN+sM0RhwIGncA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712365575; c=relaxed/simple;
	bh=oQmFNFiXHx+tRIC4QPHdDv+jxgifNqEtLebbSjrbbVM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EYZvMwlyuVflBHoKJwqmn4CxwLSqLXURvpZU+JUzMU+KcNiC/4edBt79wTjTONnQ62G/DsHz9hU//iVtCU2QRbBsOtpF5TEYyrPEccvV268VAm4O96/pu5mqgVBI5tCNvUOcdIV2SJkfj7ghenGAPJlmWVOlfPeScxNjUXG1ado=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HvB2Y9zS; arc=fail smtp.client-ip=40.107.236.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpYhtykdRRpwTLjs9zw67hLDwPC9QP+zMFBgxXRJOhKebjN6IkDXHLZQTtihuYDkafbY2+TGbxMgXsHtVAFYu/G6h6byQPiz3wkFm2uHjtIhKsDapL064DoumiBsJLWJuJUFGoCShLxHTCTIOzgb/3cOIPv0G3DMVaUuF048k9Y3tEbKPWs6ohExPpN7XgIE8QWpHtE0XBEuMYWeU+bAlX+FLCBkAptjW52IgGi7Pe+P3jNWnCd6k9vPBarT/qx5M/2dRlnob6zruAPlunPZQMXpai6NgE/Kx+TFoSD+tB4qzsgoxmYRcFjW/5l0hNylhGcAOvbHifdoZrGhwG1gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XqSzsIeo1nDWH8Oh9gjkZ++Oz8ZVd6fHKB5INEN4t0=;
 b=Y8FCnI5C5BfQUuVN1/BSPrwF/SJyrqQdnhKI7ya0ahH6t+FhUHZWtn3fZ9Xc7e8k3J4G4jxA1FYIjgiwFvn4u0RGYE0V9Uir8iKGjAZmYk/wi1kU9GUU682AwjDyejtcfRwHMZuQDM16DitfiN+XBd8jijG56nAEAHqDVmD24j6cdTcI76TXfGfO+uJkgonJeEJW5NtNiYRWAq9j7FyuZAdxO3D/xtdQSMW1LOwE5+O3yIH4QCymxDNjKOrw8UEw9PH3ht5ghBOqMBhrbcIMsr2HmoLb8Lbf+O8M7xLqmfph1/1kbqBafvDkDCeR0BrQZux8MhDBbgZm4f2SIIkGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XqSzsIeo1nDWH8Oh9gjkZ++Oz8ZVd6fHKB5INEN4t0=;
 b=HvB2Y9zSKcGGKa9FqoNedxqBEn5xd842yB+ehKtUiw7nZ6IACicsTQuXRK0wrDhQO5ouXZkQYYzvSa3wbEFaBMZV/GVgmbS10R8auZr0ox19m9sKdk+b+FkLJr7NP3PEfeBqE9Kg/ZrzU6BmXuCS38q/B05Y1dUYRG4LtZlr4S6mFo4UZazoCv5MWdgnjA9sc7A71WFBpAb4g/mPT898iZ/HbWtYp9CdeUfHxr7iV7PtrEWzkWfXSZuZLrR+9FTkOqRyED78zFxx9NBUyOAEVL3pyd21hYnSTBl7M4GKpwmY0IHJhzEilrMaay4QST6n3Qd0gmPPg/IJ/gAUNkerYA==
Received: from DS7PR03CA0152.namprd03.prod.outlook.com (2603:10b6:5:3b2::7) by
 LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Sat, 6 Apr
 2024 01:06:10 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::29) by DS7PR03CA0152.outlook.office365.com
 (2603:10b6:5:3b2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.33 via Frontend
 Transport; Sat, 6 Apr 2024 01:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Sat, 6 Apr 2024 01:06:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 5 Apr 2024
 18:05:58 -0700
Received: from sw-mtx-036.mtx.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Fri, 5 Apr 2024 18:05:56 -0700
From: Parav Pandit <parav@nvidia.com>
To: <netdev@vger.kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <corbet@lwn.net>, <dw@davidwei.uk>,
	<kalesh-anakkur.purayil@broadcom.com>
CC: <saeedm@nvidia.com>, <leon@kernel.org>, <jiri@resnulli.us>,
	<shayd@nvidia.com>, <danielj@nvidia.com>, <dchumak@nvidia.com>,
	<linux-doc@vger.kernel.org>, <linux-rdma@vger.kernel.org>, Parav Pandit
	<parav@nvidia.com>
Subject: [net-next v4 0/2] devlink: Add port function attribute for IO EQs
Date: Sat, 6 Apr 2024 04:05:36 +0300
Message-ID: <20240406010538.220167-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: e566c8fd-e099-47c5-9528-08dc55d5bf3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZjU1VAo2J6vZk1eVm9f8venXoEkA3ItSIVhtCAAOnkm2Xcb9mMExZOWeTJ1pJQCXF/rH51YHhGXntg8AjF+V0/7Dak3O+3OxIAf7OiMbnQaG7oZq/uEoeFVk5b7jy5PN9im8Zk8cW7wsoTy5wbL+9xRB610wK7NHw4gZzn2PLU6hyoBVRJqPsweaOjga4+gIGt1Os4HuBayeSXs/4B/WEkbuA1LGeQzALEG/UlT/m8josOAzNProSbYOXWXSTE4dbP//OgwIMO3a+RpUKDR0qJFcIZVstO20q3zOH+xZAeYytFExQmEu3lukyoFHRoH2ckMxWp6noZpl2D/jJGYbbpVnIGdDkrEHiZAXiAoTuoEHT0EEB9Vc1HgnAHuw97nANOgWgz2QE4YMMeLawkXq+Wd9ireMhjL/bM9/wqSIeZ3t5YYkW2EoguQGPceVgv1LqgSAaix3cISBFBzK0vdg8H4yUs9Sz/4yJget/vjEnkxX4hUI20zh2L2wyV7j9L6+sCFu/L9lEFXOgJJiRNSMrrr6eJ9wH62bzi4krelv/9o62+dZsBXPDwDML5+9ZffCL/T1QE3IXo63/+RVH6k3G03Q3Z1pm5dhFgd0uUned7/s6l706E5S1OmX1xQb5D8bn5q8i1Bhqphd/3J+ZMf70678EQIURXN7r22hRQwi6QCbLgmAlQLZqqmFV3ZRUdAuv/IcSY7PWlI+6bQUJyVJRCNzoMGvo+iAvCeNBTELttm+V+xxuKjzO+jdgr5PRA5I
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(7416005)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2024 01:06:10.3149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e566c8fd-e099-47c5-9528-08dc55d5bf3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965

Currently, PCI SFs and VFs use IO event queues to deliver netdev per
channel events. The number of netdev channels is a function of IO
event queues. In the second scenario of an RDMA device, the
completion vectors are also a function of IO event queues. Currently, an
administrator on the hypervisor has no means to provision the number
of IO event queues for the SF device or the VF device. Device/firmware
determines some arbitrary value for these IO event queues. Due to this,
the SF netdev channels are unpredictable, and consequently, the
performance is too.

This short series introduces a new port function attribute: max_io_eqs.
The goal is to provide administrators at the hypervisor level with the
ability to provision the maximum number of IO event queues for a
function. This gives the control to the administrator to provision
right number of IO event queues and have predictable performance.

Examples of when an administrator provisions (set) maximum number of
IO event queues when using switchdev mode:

  $ devlink port show pci/0000:06:00.0/1
      pci/0000:06:00.0/1: type eth netdev enp6s0pf0vf0 flavour pcivf pfnum 0 vfnum 0
          function:
          hw_addr 00:00:00:00:00:00 roce enable max_io_eqs 10

  $ devlink port function set pci/0000:06:00.0/1 max_io_eqs 20

  $ devlink port show pci/0000:06:00.0/1
      pci/0000:06:00.0/1: type eth netdev enp6s0pf0vf0 flavour pcivf pfnum 0 vfnum 0
          function:
          hw_addr 00:00:00:00:00:00 roce enable max_io_eqs 20

This sets the corresponding maximum IO event queues of the function
before it is enumerated. Thus, when the VF/SF driver reads the
capability from the device, it sees the value provisioned by the
hypervisor. The driver is then able to configure the number of channels
for the net device, as well as the number of completion vectors
for the RDMA device. The device/firmware also honors the provisioned
value, hence any VF/SF driver attempting to create IO EQs
beyond provisioned value results in an error.

With above setting now, the administrator is able to achieve the 2x
performance on SFs with 20 channels. In second example when SF was
provisioned for a container with 2 cpus, the administrator provisioned only
2 IO event queues, thereby saving device resources.

With the above settings now in place, the administrator achieved 2x
performance with the SF device with 20 channels. In the second example,
when the SF was provisioned for a container with 2 CPUs, the administrator
provisioned only 2 IO event queues, thereby saving device resources.

changelog:
v2->v3:
- limited to 80 chars per line in devlink
- fixed comments from Jakub in mlx5 driver to fix missing mutex unlock
  on error path
v1->v2:
- limited comment to 80 chars per line in header file
- fixed set function variables for reverse christmas tree
- fixed comments from Kalesh
- fixed missing kfree in get call
- returning error code for get cmd failure
- fixed error msg copy paste error in set on cmd failure

Parav Pandit (2):
  devlink: Support setting max_io_eqs
  mlx5/core: Support max_io_eqs for a function

 .../networking/devlink/devlink-port.rst       | 33 +++++++
 .../mellanox/mlx5/core/esw/devlink_port.c     |  4 +
 .../net/ethernet/mellanox/mlx5/core/eswitch.h |  7 ++
 .../mellanox/mlx5/core/eswitch_offloads.c     | 97 +++++++++++++++++++
 include/net/devlink.h                         | 14 +++
 include/uapi/linux/devlink.h                  |  1 +
 net/devlink/port.c                            | 53 ++++++++++
 7 files changed, 209 insertions(+)

-- 
2.26.2


