Return-Path: <linux-doc+bounces-38885-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB7A3F10C
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 10:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DE7A188426B
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 09:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B750F1FF1C3;
	Fri, 21 Feb 2025 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TgqgebcL"
X-Original-To: linux-doc@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50C1FBEA8;
	Fri, 21 Feb 2025 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740131622; cv=fail; b=EoqAWZykwD7PLOmYrdBPxvuJ0y+Ob6RDtyUmLh/4xHYo/23EbCiNgokRCz445hQCYuLBFmHCx9Qv1yUDsftmaa0AVQFLt46ZFiEPkwzpGPSKTSCG5monUq/Z18Y9pJqM08986lIVqabfnFgLiBgWYtX1IBrHiPq+m53hXJwQONM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740131622; c=relaxed/simple;
	bh=hehafDcOufx+tKb9tEGwGU5H+ocEMvfH4lwR5xWbEeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORkiueAFlNXKZCYE4dWRnGDHF2sAg0lFNHVDxgYXqyrv6O2OJQnNRfrIaixo+B7Jm5NzY4P3Msh+kaX5Rc2PIiAvmE2X3WaQKPzUwn8uRn6//m5hrLw8l5xZQHJXx7bqlYDjbtnmjKTshhFgQYYZIDRcLJWaMqToOrUAJn3BDBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TgqgebcL; arc=fail smtp.client-ip=40.107.236.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qliaHS7d58xXc1xBO3TaWp/Ub1dYrRiM8F2TakIjOZWvrVDrOmWykbPj4OAUpFXmOFBIezyN7I4I7oP+ROT4VmqFM31PUY4cpMJm4d4Mc4GCzI/q+x0XyFN5SgcO+2zJxiBFamVaL4C4Cd9RDwYf6HS1ARbe2en4wtSADBbjlpSH8g46nCtdU/6bUAAt/7c69juHV8B4Ai3GUSOIC9h7zHlIPnrEeSVxxiZpD5DoEsuNPKbZdsO0aOA+XD21AZiWR2259/KmJY55/pLU+BIfZAIK2+5h3j/PtvpJtnGjSWRRZoWLbdPuV5UffB248YPsxva128PIpcig6a96FE6stQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atInrDItTF9UEF8XhZLiw78c7qgjsrj7iIPSzieMvJc=;
 b=R500Wr/+vj6gDe88FDpHNcOacKTgMTNuQneb3SFIdaxjzuqtm86yYJdVIc0jYVuOWjVxJHWP4r7HI0jMDZASyvjXk/fWg/6IMI5lUqnQPjM15gQiLbXQNxaWuISQv8VFVdXrsoaEKGVoBsgdEvXuaKzdV2ZbqiHinok7c1647XTsTK1Gjwp7vcmJ8SValT8cSbO11xlzevs0mG3HEvwE9Vw5CZQmD8opsefPhSC16JjCLzC6OiM9haw0Y9fo/ZLNJhssfJR+76xye0O94sNVLPjWTrx0tRidnXf72AeRuOTOyjY+e3NEv1bksrrDXjFfmOUiaMCFnGFoH7tlPWmt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atInrDItTF9UEF8XhZLiw78c7qgjsrj7iIPSzieMvJc=;
 b=TgqgebcLO5nZITmq3aLRyhYkdVzYJjHV+/qlCURvVPOdyixIjaPbIePzYc5czfdM9w8O1W9tWySgfrzAjxyeyxf6w+lB+Z66mPR9E2RGjuYfobMy6qT3d/rke/XOzI3ppfEPjEzcT7ORQ6FPc5MR74PNiFbelXrCTNOTKrXoPkBjYXXCBQNMqSEtr0aw8dUfwwWFVjKMC3ZGD6FjZ3DwGXuUwpzHyDVUSt8bwCqtz+ZxkAGE3Nt00N5+fBzR0a5OJHXI4DeS1Y0ZpZSDO4FTBKDM440H6zI7/1OeqUSgltsJRqqRhSLjCbtPisTAIV4xyy3Pig2ffk7wDUa8qRPMhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8943.namprd12.prod.outlook.com (2603:10b6:a03:547::17)
 by PH7PR12MB9127.namprd12.prod.outlook.com (2603:10b6:510:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 09:53:30 +0000
Received: from SJ2PR12MB8943.namprd12.prod.outlook.com
 ([fe80::7577:f32f:798c:87cc]) by SJ2PR12MB8943.namprd12.prod.outlook.com
 ([fe80::7577:f32f:798c:87cc%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 09:53:30 +0000
From: Aurelien Aptel <aaptel@nvidia.com>
To: linux-nvme@lists.infradead.org,
	netdev@vger.kernel.org,
	sagi@grimberg.me,
	hch@lst.de,
	kbusch@kernel.org,
	axboe@fb.com,
	chaitanyak@nvidia.com,
	davem@davemloft.net,
	kuba@kernel.org
Cc: Yoray Zack <yorayz@nvidia.com>,
	aaptel@nvidia.com,
	aurelien.aptel@gmail.com,
	smalin@nvidia.com,
	malin1024@gmail.com,
	ogerlitz@nvidia.com,
	borisp@nvidia.com,
	galshalom@nvidia.com,
	mgurtovoy@nvidia.com,
	linux-doc@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	corbet@lwn.net
Subject: [PATCH v26 09/20] Documentation: add ULP DDP offload documentation
Date: Fri, 21 Feb 2025 09:52:14 +0000
Message-Id: <20250221095225.2159-10-aaptel@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221095225.2159-1-aaptel@nvidia.com>
References: <20250221095225.2159-1-aaptel@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::11) To SJ2PR12MB8943.namprd12.prod.outlook.com
 (2603:10b6:a03:547::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8943:EE_|PH7PR12MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a29cc0-2433-453d-6dd9-08dd525d988c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2h5pBXBtV1fH08l6RX2KdH4+1xD0mLCOw6bTQByCm+cGG0j3AIodhy+3RVk7?=
 =?us-ascii?Q?TKG7O2Ljnr2fkI9oen/woKaLRNMjku4mF58gh1CD5VqRHrQpr8FKt9/exCEM?=
 =?us-ascii?Q?dLzkHViIyhRZvQ7pJneYIgyBkzvuTdhpUCjz+7aLCYN4PtTHyGDQ//TSBFCt?=
 =?us-ascii?Q?MP6u1UXhTQRQej9NsFDEmzhCtE2CfmQW5UNTAuXQeIU47urYDkl0gHyhYqMj?=
 =?us-ascii?Q?dcEdE/MT1kka5ojSQfMh6PWYFoSCtCFZHnRXA3NfvxJDoaIeBIkUl25YkPOx?=
 =?us-ascii?Q?nIdmxsO6tXtLA8vHVbyL6RviYTrnrV3hl0JOcM6Q2Yk8Qs6cVgVVSp8Urq9x?=
 =?us-ascii?Q?KAV3A4sYBPKo9be1zgjwxyMwhniiHIR0kYkG+tNatPGAfznOYV1RIVRPLq82?=
 =?us-ascii?Q?MBqhBgkWtI06DJrHFAUBiyS713oYrXb/c4JNSub/gkIWgYB8a4DaCReRf7Lu?=
 =?us-ascii?Q?VdjYOihtb+y9OmAq++HYs80tjZEoyYEI82BVUXhX5BbyNlD4H01V2Wd2XF5+?=
 =?us-ascii?Q?KbBEs06G1MHmyPIcNHfnpEjir2cwT7fpJ8oR344We74xN84XM9PIy9jB8iZD?=
 =?us-ascii?Q?gcGszQoriJI6DKEZZkBxDwCOMFRBgWFVmTok8an4/ZrnyrAXLTNapFiuLtnv?=
 =?us-ascii?Q?l5LHysdz8oShwUhy/qK/0VBX/wfAA/xBnbdZi8kVV2D2tiFcSPULxEtYGrI2?=
 =?us-ascii?Q?QNgd2qapGsnyFVYLpgzW8pyI39R7vuUI9gaG9MwMpYFLkcY6T21S4FBGJ107?=
 =?us-ascii?Q?LSj2k3ChwLJWqoeAVC7HrbaoYRmM6UmOzylwHANUSBiRX1NQ2oxuH5HpL60v?=
 =?us-ascii?Q?EiGyDdrULSJqaFLnhDkdn6BSlo2oIGmrixZ9BGSFQPfjQ9CnZLrHfUFymsK+?=
 =?us-ascii?Q?v6tpqJd6h9CHPDutHXJc+NCOlIDM6rn34nMN+itlL/Q+kbQedhm7BDHHr4RV?=
 =?us-ascii?Q?bwi/EL1+O2/yFRH9YCb3O0s3Y55ijKDaAmld/zH7Gqd6ABuj25pjE/gkO78S?=
 =?us-ascii?Q?Ar8hOPz2bvd4XSWAMLgVNydUTqLemcPkXNpPW6LLarGyASM9cSMdeYdqJMZn?=
 =?us-ascii?Q?5vLGWMGzShiWOiU6mpq8QxmOfnB+zUgXU1Pl8Ev1H1a4t6d1Fc9YY0v53lpf?=
 =?us-ascii?Q?NbPcDSvLKcE67CsxOzsQyaw7n+PdlPALbl4GBaVDlnrfdhi52DEsTsQ1GWxz?=
 =?us-ascii?Q?DfaiC+V5N5fX1mq+V4KJjRtug1dleNuFR2OLl1qFor1eFLjjIDPaAaijoYOa?=
 =?us-ascii?Q?T05b08V3G4LFB9PqS/dz+ZaZ+wANbyQO5TEWW+IVB0uLNpdFBJuNAAUpJXPK?=
 =?us-ascii?Q?SJjvjAFQvgHMAtRkzshe8H9UvAlUsL0zODnbnj5NctpaYQ8mBvZMngkAQFOI?=
 =?us-ascii?Q?HPVozSJ4b0OAUqaMZFXNvs9OEy1t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QOHbvLZuuhveRTtI1/0QpU9K5sOls3qoM94Axavlo7Yml8i4KgHrCidQvmTT?=
 =?us-ascii?Q?dhNlLh3sqr2O6C35BQ43FeViDv1WvjIoDwNDKi7qk7khofZQ6eV6wmeCnz8h?=
 =?us-ascii?Q?GXPIvfrqLYEhdAqDzUEyT3mB3KQi6ql9REFa18So1h39tgBKUQI7t3Tg9s1T?=
 =?us-ascii?Q?9T5wcqa3cXmx2O0s5X2HMXoboSMSwzgrzac6v8KXItfMeBQ/kKkuF3RCkpWX?=
 =?us-ascii?Q?bSI7d94P65CL88hvOKkzfrQr7cNDYrur+ErlLG/EEpg3/t9oJsaV+n30MJtG?=
 =?us-ascii?Q?el7+eAWNEbK5bI2Q+bADj27YoaCdThoRAD8J2ZAlFDriaVuQi7xUUq0E8yUz?=
 =?us-ascii?Q?yFZmqg43t33+vQDACgndKtOCQIuXL8Ne+Y2GHWIBOBr14TWBQ39N1gui5Jal?=
 =?us-ascii?Q?mub3yUuDYzAbehELYXAPxAO6LpN+eKQx6wHjLuv+FmIHtQhAqPEjcOs8csGZ?=
 =?us-ascii?Q?O7k7AnGDB/dfQ7q626J6MzkZ/Cgn7orrTVTQWniDYQLxu2raoozTJOZNlu3I?=
 =?us-ascii?Q?JigvHtUObBIoJO69V8dNAMl6Wt9vlNXgPMNcWaCGDav+fw94V5wy5kvdASxI?=
 =?us-ascii?Q?HeDxu9NiunX83NROjSGmN+gWmDS6TteTNPwfuy3lgfvA8anSFQgHpo/jE8Qs?=
 =?us-ascii?Q?fbX5DqZVMYAKPTW0c101w/a5xeDIpRmdnqO1ekQ/DdPxHs1lw220ajo/5BPt?=
 =?us-ascii?Q?I71/C4ncIBPKtdzhNsWfd9b7+5WU7l8NvGM5MBCKdZC73FlIKMw+di8nqYqU?=
 =?us-ascii?Q?+sc5KtqtH+zGBcukPg4DYY3JijD7qelUDZ42qr8LcB8lxXTIrej30mJnY5ZR?=
 =?us-ascii?Q?Oe3ZDL3QuK/wQ5h0uxK2jALkuXDYlQKOYcj6OrtMKEZMrl5l5jNJa8D53UFE?=
 =?us-ascii?Q?x6GF0JMhhCC8+syUaLKupxwIN7XGkgQEjFIOOUozB+ycTXaI0TfqXEywdZm8?=
 =?us-ascii?Q?/gKoZ4q4oEjTy+HKcKpUV2fTifh3AsLmMbAmbnU+XzoSJyhe8wIiVei77Xp+?=
 =?us-ascii?Q?ufkfbQzT4nZu4HY+86xRLpLuWD65RzjsbNVjQMqoc5hGoFpy4zIgIzDkUg6T?=
 =?us-ascii?Q?eCo/q/fJyOezE4Qu0MeDi+KuI3w4yEq4GsbU+6+aR3LKm3kV4lB4YZgDp+B+?=
 =?us-ascii?Q?D++04Lc0McVj7NNE42Hi3JTKFPnqLmS1pPNYdTve/jrsEkG+1TgvUYYmNVpg?=
 =?us-ascii?Q?Jzhf7CC8bRWUpF6ul2Sxz7BGDNTg2mdEcrVHrGp9XdQ+XWJP02B0EfGVWfQO?=
 =?us-ascii?Q?QXR1YSZtBN5qJE4FdtJKxVuR7XAoBYRhXCNwvFyFUaRQzfYzJ43Prv7MLbi4?=
 =?us-ascii?Q?r0bV+rmWxkUlTCURS0CbJyy7cte2xo+PQPMzxGYJuS24PhBjFMITuOUqXfay?=
 =?us-ascii?Q?KJs0h+TfB49aoL3XWIfa1Vb80DYRe0NDZWafewYTbT0XFuwLjPf4+MfBIcBT?=
 =?us-ascii?Q?2lGONjHT4IOgy0spZkHNg69xpEzBV6ewuKwwUhoX0i0fpjfdSsR9SVzt5HY0?=
 =?us-ascii?Q?exhVWgWAIA3TSqeWaxszJl5ABMae53lb2ky/0DRIsLJxpdsu8DXBFo9T52qb?=
 =?us-ascii?Q?1e+RhFA64zG4eS7GPqtXN6Og32yMNHwi/06GmVFz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a29cc0-2433-453d-6dd9-08dd525d988c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 09:53:30.3808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRGB+dPfFKeJ11xRDneDIPcu37c6xAzMC/WuUFmcCIey2h4g3zDTPW9+BIWW4vNI3/y2+UCASJ2rXiTF4oJm8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9127

From: Yoray Zack <yorayz@nvidia.com>

Document the new ULP DDP API and add it under "networking".
Use NVMe-TCP implementation as an example.

Signed-off-by: Boris Pismenny <borisp@nvidia.com>
Signed-off-by: Ben Ben-Ishay <benishay@nvidia.com>
Signed-off-by: Or Gerlitz <ogerlitz@nvidia.com>
Signed-off-by: Yoray Zack <yorayz@nvidia.com>
Signed-off-by: Shai Malin <smalin@nvidia.com>
Signed-off-by: Aurelien Aptel <aaptel@nvidia.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/index.rst           |   1 +
 Documentation/networking/ulp-ddp-offload.rst | 372 +++++++++++++++++++
 2 files changed, 373 insertions(+)
 create mode 100644 Documentation/networking/ulp-ddp-offload.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 058193ed2eeb..07afdcdae457 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -120,6 +120,7 @@ Contents:
    tc-queue-filters
    tcp_ao
    tcp-thin
+   ulp-ddp-offload
    team
    timestamping
    tipc
diff --git a/Documentation/networking/ulp-ddp-offload.rst b/Documentation/networking/ulp-ddp-offload.rst
new file mode 100644
index 000000000000..4133e5094ff5
--- /dev/null
+++ b/Documentation/networking/ulp-ddp-offload.rst
@@ -0,0 +1,372 @@
+.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+=================================
+ULP direct data placement offload
+=================================
+
+Overview
+========
+
+The Linux kernel ULP direct data placement (DDP) offload infrastructure
+provides tagged request-response protocols, such as NVMe-TCP, the ability to
+place response data directly in pre-registered buffers according to header
+tags. DDP is particularly useful for data-intensive pipelined protocols whose
+responses may be reordered.
+
+For example, in NVMe-TCP numerous read requests are sent together and each
+request is tagged using the PDU header CID field. Receiving servers process
+requests as fast as possible and sometimes responses for smaller requests
+bypasses responses to larger requests, e.g., 4KB reads bypass 1GB reads.
+Thereafter, clients correlate responses to requests using PDU header CID tags.
+The processing of each response requires copying data from SKBs to read
+request destination buffers; The offload avoids this copy. The offload is
+oblivious to destination buffers which can reside either in userspace
+(O_DIRECT) or in kernel pagecache.
+
+Request TCP byte-stream:
+
+.. parsed-literal::
+
+ +---------------+-------+---------------+-------+---------------+-------+
+ | PDU hdr CID=1 | Req 1 | PDU hdr CID=2 | Req 2 | PDU hdr CID=3 | Req 3 |
+ +---------------+-------+---------------+-------+---------------+-------+
+
+Response TCP byte-stream:
+
+.. parsed-literal::
+
+ +---------------+--------+---------------+--------+---------------+--------+
+ | PDU hdr CID=2 | Resp 2 | PDU hdr CID=3 | Resp 3 | PDU hdr CID=1 | Resp 1 |
+ +---------------+--------+---------------+--------+---------------+--------+
+
+The driver builds SKB page fragments that point to destination buffers.
+Consequently, SKBs represent the original data on the wire, which enables
+*transparent* inter-operation with the network stack. To avoid copies between
+SKBs and destination buffers, the layer-5 protocol (L5P) will check
+``if (src == dst)`` for SKB page fragments, success indicates that data is
+already placed there by NIC hardware and copy should be skipped.
+
+In addition, L5P might have DDGST which ensures data integrity over
+the network.  If not offloaded, ULP DDP might not be efficient as L5P
+will need to go over the data and calculate it by itself, cancelling
+out the benefits of the DDP copy skip.  ULP DDP has support for Rx/Tx
+DDGST offload. On the received side the NIC will verify DDGST for
+received PDUs and update SKB->ulp_ddp and SKB->ulp_crc bits.  If all the SKBs
+making up a L5P PDU have crc on, L5P will skip on calculating and
+verifying the DDGST for the corresponding PDU. On the Tx side, the NIC
+will be responsible for calculating and filling the DDGST fields in
+the sent PDUs.
+
+Offloading does require NIC hardware to track L5P protocol framing, similarly
+to RX TLS offload (see Documentation/networking/tls-offload.rst).  NIC hardware
+will parse PDU headers, extract fields such as operation type, length, tag
+identifier, etc. and only offload segments that correspond to tags registered
+with the NIC, see the :ref:`buf_reg` section.
+
+Device configuration
+====================
+
+During driver initialization the driver sets the ULP DDP operations
+for the :c:type:`struct net_device <net_device>` via
+`netdev->netdev_ops->ulp_ddp_ops`.
+
+The :c:member:`get_caps` operation returns the ULP DDP capabilities
+enabled and/or supported by the device to the caller. The current list
+of capabilities is represented as a bitset:
+
+.. code-block:: c
+
+  enum ulp_ddp_cap {
+	ULP_DDP_CAP_NVME_TCP,
+	ULP_DDP_CAP_NVME_TCP_DDGST,
+  };
+
+The enablement of capabilities can be controlled via the
+:c:member:`set_caps` operation. This operation is exposed to userspace
+via netlink. See Documentation/netlink/specs/ulp_ddp.yaml for more
+details.
+
+Later, after the L5P completes its handshake, the L5P queries the
+driver for its runtime limitations via the :c:member:`limits` operation:
+
+.. code-block:: c
+
+ int (*limits)(struct net_device *netdev,
+	       struct ulp_ddp_limits *lim);
+
+
+All L5P share a common set of limits and parameters (:c:type:`struct ulp_ddp_limits <ulp_ddp_limits>`):
+
+.. code-block:: c
+
+ /**
+  * struct ulp_ddp_limits - Generic ulp ddp limits: tcp ddp
+  * protocol limits.
+  * Add new instances of ulp_ddp_limits in the union below (nvme-tcp, etc.).
+  *
+  * @type:		type of this limits struct
+  * @max_ddp_sgl_len:	maximum sgl size supported (zero means no limit)
+  * @io_threshold:	minimum payload size required to offload
+  * @tls:		support for ULP over TLS
+  * @nvmeotcp:		NVMe-TCP specific limits
+  */
+ struct ulp_ddp_limits {
+	enum ulp_ddp_type	type;
+	int			max_ddp_sgl_len;
+	int			io_threshold;
+	bool			tls:1;
+	union {
+		/* ... protocol-specific limits ... */
+		struct nvme_tcp_ddp_limits nvmeotcp;
+	};
+ };
+
+But each L5P can also add protocol-specific limits e.g.:
+
+.. code-block:: c
+
+ /**
+  * struct nvme_tcp_ddp_limits - nvme tcp driver limitations
+  *
+  * @full_ccid_range:	true if the driver supports the full CID range
+  */
+ struct nvme_tcp_ddp_limits {
+	bool			full_ccid_range;
+ };
+
+Once the L5P has made sure the device is supported the offload
+operations are installed on the socket.
+
+If offload installation fails, then the connection is handled by software as if
+offload was not attempted.
+
+To request offload for a socket `sk`, the L5P calls :c:member:`sk_add`:
+
+.. code-block:: c
+
+ int (*sk_add)(struct net_device *netdev,
+	       struct sock *sk,
+	       struct ulp_ddp_config *config);
+
+The function return 0 for success. In case of failure, L5P software should
+fallback to normal non-offloaded operations.  The `config` parameter indicates
+the L5P type and any metadata relevant for that protocol. For example, in
+NVMe-TCP the following config is used:
+
+.. code-block:: c
+
+ /**
+  * struct nvme_tcp_ddp_config - nvme tcp ddp configuration for an IO queue
+  *
+  * @pfv:        pdu version (e.g., NVME_TCP_PFV_1_0)
+  * @cpda:       controller pdu data alignment (dwords, 0's based)
+  * @dgst:       digest types enabled.
+  *              The netdev will offload crc if L5P data digest is supported.
+  * @queue_size: number of nvme-tcp IO queue elements
+  */
+ struct nvme_tcp_ddp_config {
+	u16			pfv;
+	u8			cpda;
+	u8			dgst;
+	int			queue_size;
+ };
+
+When offload is not needed anymore, e.g. when the socket is being released, the L5P
+calls :c:member:`sk_del` to release device contexts:
+
+.. code-block:: c
+
+ void (*sk_del)(struct net_device *netdev,
+	        struct sock *sk);
+
+Normal operation
+================
+
+At the very least, the device maintains the following state for each connection:
+
+ * 5-tuple
+ * expected TCP sequence number
+ * mapping between tags and corresponding buffers
+ * current offset within PDU, PDU length, current PDU tag
+
+NICs should not assume any correlation between PDUs and TCP packets.
+If TCP packets arrive in-order, offload will place PDU payloads
+directly inside corresponding registered buffers. NIC offload should
+not delay packets. If offload is not possible, than the packet is
+passed as-is to software. To perform offload on incoming packets
+without buffering packets in the NIC, the NIC stores some inter-packet
+state, such as partial PDU headers.
+
+RX data-path
+------------
+
+After the device validates TCP checksums, it can perform DDP offload.  The
+packet is steered to the DDP offload context according to the 5-tuple.
+Thereafter, the expected TCP sequence number is checked against the packet
+TCP sequence number. If there is a match, offload is performed: the PDU payload
+is DMA written to the corresponding destination buffer according to the PDU header
+tag.  The data should be DMAed only once, and the NIC receive ring will only
+store the remaining TCP and PDU headers.
+
+We remark that a single TCP packet may have numerous PDUs embedded inside. NICs
+can choose to offload one or more of these PDUs according to various
+trade-offs. Possibly, offloading such small PDUs is of little value, and it is
+better to leave it to software.
+
+Upon receiving a DDP offloaded packet, the driver reconstructs the original SKB
+using page frags, while pointing to the destination buffers whenever possible.
+This method enables seamless integration with the network stack, which can
+inspect and modify packet fields transparently to the offload.
+
+.. _buf_reg:
+
+Destination buffer registration
+-------------------------------
+
+To register the mapping between tags and destination buffers for a socket
+`sk`, the L5P calls :c:member:`setup` of :c:type:`struct ulp_ddp_dev_ops
+<ulp_ddp_dev_ops>`:
+
+.. code-block:: c
+
+ int (*setup)(struct net_device *netdev,
+	      struct sock *sk,
+	      struct ulp_ddp_io *io);
+
+
+The `io` provides the buffer via scatter-gather list (`sg_table`) and
+corresponding tag (`command_id`):
+
+.. code-block:: c
+
+ /**
+  * struct ulp_ddp_io - tcp ddp configuration for an IO request.
+  *
+  * @command_id:  identifier on the wire associated with these buffers
+  * @nents:       number of entries in the sg_table
+  * @sg_table:    describing the buffers for this IO request
+  * @first_sgl:   first SGL in sg_table
+  */
+ struct ulp_ddp_io {
+	u32			command_id;
+	int			nents;
+	struct sg_table		sg_table;
+	struct scatterlist	first_sgl[SG_CHUNK_SIZE];
+ };
+
+After the buffers have been consumed by the L5P, to release the NIC mapping of
+buffers the L5P calls :c:member:`teardown` of :c:type:`struct
+ulp_ddp_dev_ops <ulp_ddp_dev_ops>`:
+
+.. code-block:: c
+
+ void (*teardown)(struct net_device *netdev,
+		  struct sock *sk,
+		  struct ulp_ddp_io *io,
+		  void *ddp_ctx);
+
+`teardown` receives the same `io` context and an additional opaque
+`ddp_ctx` that is used for asynchronous teardown, see the :ref:`async_release`
+section.
+
+.. _async_release:
+
+Asynchronous teardown
+---------------------
+
+To teardown the association between tags and buffers and allow tag reuse NIC HW
+is called by the NIC driver during `teardown`. This operation may be
+performed either synchronously or asynchronously. In asynchronous teardown,
+`teardown` returns immediately without unmapping NIC HW buffers. Later,
+when the unmapping completes by NIC HW, the NIC driver will call up to L5P
+using :c:member:`ddp_teardown_done` of :c:type:`struct ulp_ddp_ulp_ops <ulp_ddp_ulp_ops>`:
+
+.. code-block:: c
+
+ void (*ddp_teardown_done)(void *ddp_ctx);
+
+The `ddp_ctx` parameter passed in `ddp_teardown_done` is the same on provided
+in `teardown` and it is used to carry some context about the buffers
+and tags that are released.
+
+Resync handling
+===============
+
+RX
+--
+In presence of packet drops or network packet reordering, the device may lose
+synchronization between the TCP stream and the L5P framing, and require a
+resync with the kernel's TCP stack. When the device is out of sync, no offload
+takes place, and packets are passed as-is to software. Resync is very similar
+to TLS offload (see documentation at Documentation/networking/tls-offload.rst)
+
+If only packets with L5P data are lost or reordered, then resynchronization may
+be avoided by NIC HW that keeps tracking PDU headers. If, however, PDU headers
+are reordered, then resynchronization is necessary.
+
+To resynchronize hardware during traffic, we use a handshake between hardware
+and software. The NIC HW searches for a sequence of bytes that identifies L5P
+headers (i.e., magic pattern).  For example, in NVMe-TCP, the PDU operation
+type can be used for this purpose.  Using the PDU header length field, the NIC
+HW will continue to find and match magic patterns in subsequent PDU headers. If
+the pattern is missing in an expected position, then searching for the pattern
+starts anew.
+
+The NIC will not resume offload when the magic pattern is first identified.
+Instead, it will request L5P software to confirm that indeed this is a PDU
+header. To request confirmation the NIC driver calls up to L5P using
+:c:member:`resync_request` of :c:type:`struct ulp_ddp_ulp_ops <ulp_ddp_ulp_ops>`:
+
+.. code-block:: c
+
+  bool (*resync_request)(struct sock *sk, u32 seq, u32 flags);
+
+The `seq` parameter contains the TCP sequence of the last byte in the PDU header.
+The `flags` parameter contains a flag (`ULP_DDP_RESYNC_PENDING`) indicating whether
+a request is pending or not.
+L5P software will respond to this request after observing the packet containing
+TCP sequence `seq` in-order. If the PDU header is indeed there, then L5P
+software calls the NIC driver using the :c:member:`resync` function of
+the :c:type:`struct ulp_ddp_dev_ops <ulp_ddp_ops>` inside the :c:type:`struct
+net_device <net_device>` while passing the same `seq` to confirm it is a PDU
+header.
+
+.. code-block:: c
+
+ void (*resync)(struct net_device *netdev,
+		struct sock *sk, u32 seq);
+
+Statistics
+==========
+
+Per L5P protocol, the NIC driver must report statistics for the above
+netdevice operations and packets processed by offload.
+These statistics are per-device and can be retrieved from userspace
+via netlink (see Documentation/netlink/specs/ulp_ddp.yaml).
+
+For example, NVMe-TCP offload reports:
+
+ * ``rx_nvme_tcp_sk_add`` - number of NVMe-TCP Rx offload contexts created.
+ * ``rx_nvme_tcp_sk_add_fail`` - number of NVMe-TCP Rx offload context creation
+   failures.
+ * ``rx_nvme_tcp_sk_del`` - number of NVMe-TCP Rx offload contexts destroyed.
+ * ``rx_nvme_tcp_setup`` - number of DDP buffers mapped.
+ * ``rx_nvme_tcp_setup_fail`` - number of DDP buffers mapping that failed.
+ * ``rx_nvme_tcp_teardown`` - number of DDP buffers unmapped.
+ * ``rx_nvme_tcp_drop`` - number of packets dropped in the driver due to fatal
+   errors.
+ * ``rx_nvme_tcp_resync`` - number of packets with resync requests.
+ * ``rx_nvme_tcp_packets`` - number of packets that used offload.
+ * ``rx_nvme_tcp_bytes`` - number of bytes placed in DDP buffers.
+
+NIC requirements
+================
+
+NIC hardware should meet the following requirements to provide this offload:
+
+ * Offload must never buffer TCP packets.
+ * Offload must never modify TCP packet headers.
+ * Offload must never reorder TCP packets within a flow.
+ * Offload must never drop TCP packets.
+ * Offload must not depend on any TCP fields beyond the
+   5-tuple and TCP sequence number.
-- 
2.34.1


