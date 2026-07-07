Return-Path: <linux-doc+bounces-95505-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lIk/H8B1TWrT0QEAu9opvQ
	(envelope-from <linux-doc+bounces-95505-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 23:55:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB82771FE97
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 23:55:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=OY0LqrSe;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95505-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95505-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FC8B3031B66
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 21:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6BB480948;
	Tue,  7 Jul 2026 21:51:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C382481FC9;
	Tue,  7 Jul 2026 21:51:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461110; cv=fail; b=qgQiUdH69xR/DT4f6KrD09s8aqiIbG88cdsFQ4pBA4BjYBxo7ok1DMslPVEcJTL0l/gbaBJri9gKmOQrCGanknHfYtoWE6pPwO9Rz3LNtU11MD3r2RHVXhYKSnIZmB9ItC4BirJBi6fJ7xbjJJK9UBvurwM7jeDFqjocui935wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461110; c=relaxed/simple;
	bh=RNXXxol6iMiaYHT2lz8C5NB/iidamUKmYhlUXWXue/E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUT1rDvaGSs+n/Ixp4JnDr269Ap5ZwN7G6D/dPhliTayjFXCLj/SznFNhXAZNaFkIMN6klZaHD3SSS9hX+3LQaRQYgV4xn3mY2pDRfp9DHq088j5ur/F2OfTYyAieDkuU3z2mlk8YORM5srgl5DZduxe2fV1hKuS3z59sKRMOX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OY0LqrSe; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtdNEzgQ4XhDQAbS5O/JwB8ZYKAr0wihCjWnuBtrQd/184KEL+vTaa8S2ZWbzDpeXVLMkf/1LBP2Rhfax/V+In2BaXrEF/M9zjBmFmqloVccV0r7uJbEA9TZs99il2co+jFcFlzz6o19270bhee9GI/kbgeVlzL1bIWx0QN8tfEGbTt8+E3oZM9NrKwbyQjF6X4OjEoIPZtOYjIVbW+Re2KBMcTjbBzSMfuP6xWihnDLOFEzfhkxYy8tkrBfTeDJOWJoR/Cg4epBJJP1KG//xQvfRWRnhU60BCdEOfrCFGJ/sevNIDfxBkhVNJMvRMuDovofnDCxNa73YaevzpBlQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zz5+f9sAgcdght9U6rvPZ3EYu4kbw6nRtPIE2DdeHqw=;
 b=E20Jiz4ZaSz0w03MUvG3BgDeNPCx7dJ4U3GSe9BnziCQCzlwxdfWHXi3vMAh0kI3MUzG055vufpXJM3qqkJeaKdh8sM4pETS6+3RMkLPb1I+5x3LP8tWupBojWxrr64djwzUgrMOKr5ufe8apGDRJ7xDLAU2ltaGbdO6+2FVCD5dUGqWwOAkMmzeEU9OCO6fZ1Z1GkOfTlHIRRe066tt/8RrOnGbqAVr4qcNIDZU3d7kJYcrLdIOuAZdiu1Xi63beK5mMKCDzsjOYg0RF7KR6QcsPKhdpTZGvaXY/JpvAqOp0KIT7RdFU+yRfz9S+mIjMg390p8KHPKyVgxEGvJM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz5+f9sAgcdght9U6rvPZ3EYu4kbw6nRtPIE2DdeHqw=;
 b=OY0LqrSemhOGO6kNkSSR7914+zd7dDlNxJ2q2WsoSCwNtimaghoqgeQGJXzacEtdK2nD2lw8EuH8tdp1XLfvo+7IBBET8Ouc/yxDvrm40cNfr+RcCTqBw7hlCVN9GsnykJdPwEry2X9SdCOafRNKCVl0pO43jd3rByp6WkbZKYY=
Received: from BN9PR03CA0247.namprd03.prod.outlook.com (2603:10b6:408:ff::12)
 by SN7PR12MB8102.namprd12.prod.outlook.com (2603:10b6:806:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:51:43 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::13) by BN9PR03CA0247.outlook.office365.com
 (2603:10b6:408:ff::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 7
 Jul 2026 21:51:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:51:43 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:51:40 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <babu.moger@amd.com>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
Subject: [RESEND PATCH v4 07/15] x86/resctrl: Expose the supported PLZA kernel-mode policies during init
Date: Tue, 7 Jul 2026 16:50:08 -0500
Message-ID: <09deaa2e58b5e83f748c50a6fae0f2480fe642f6.1783461016.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783461016.git.babu.moger@amd.com>
References: <cover.1783461016.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|SN7PR12MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: a879a4e4-5bcf-40f5-8fab-08dedc71ef2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|23010399003|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	XYG83+VYCkaYVnPyxpgPjhTiNO24Cmr8DKe9ujsKK0VRMLPciNxmTQb5kbPA2+nognlEDuUvNMmlrDLe+Vwb8Z3k4RY/BhzHgMGJJM7vIOdAv1wi8GLHyO7Z0aVSNOa765Xz+/OTy9BDg2Lu9zaO2CLxxkF4sUNlM6VO+7MTOdLOz0BW/d87VDRE9LSRcM7z8fMDX2CBxVjBXKDBt2RiwBF52S3USJoFFLcOy0ewp7ooLDcPFXFwCELtv4ud84d45C03TgGZ79ToQ17aDo7D23t3j127LnAEODGhRMR0NcPnYFqEJIqmHFzRKWdS3njK7qI/5hi+z2zpIldFR+8wM243pfy6OrlUZq6nXW5CxuFRGx2xxpraM0xWQoQUS1Wo0FogRA1TqswX+mGVS8Rye8Ogl/y2N00tzeTCVDebpNrj6nyNdmQJfnWx3QMhoLWyL3O/Bdrs3a8wMbFDcEBdlCCDfbSEaKwPfJstsdK3OBsEs40/YYSZ3C7HRydckdTN+Xlx1WoX9QJiqALejbg7XJxi62WwyQjU+4+W3OykAEejJzekd4A9gOXtI832T7mhaxYdKz4qmzfeFN2hYyVML4KBlu4+rlT0zuu2kk9UqeSa2IXjEi0AaaEcp9hatmTsEhIVQILUbmhE37HpozREV5hW30r+atTjH151tJyeedxGa160lDHLluK9hblhZ/KdVcRug01HiG71cg28EERxgA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	555sIBLsmocCw8iS22a+9g8CUP5+DFa3RHaOk75NwO8BkrlYwJYVnShRlo3xln3OJEJRxVW2QDB8VcCgDuvD1pwVe0xmv6fgjZxcCKZSvTS4NFcKiv2hlue/Z76L3uFpb8Jry+jLL60X/6DeSPiaudCSSkIxTZ2f4MCXOUISCfhQyATW+s6t4bb4r5aS022YZpvfF/aq/iTR+GM5h4YH8cDYlzNVDjX1Df95uD9q77/7fkvhBO/f/bjT9FTu6SofzJDPkddFtzISHfoYJKrVPe8D7125mEz/kGg4bOziPEBd2CljNNv2OkrDzqNCa2h3HnkDs9v32uDWAn0GCL/86Ye+y8Zioq2i/+Uk5q63KGzciBt4j4Lft6y1cRqv+f68nzOPqYNo/z+6vbfco9JlGaWZ3eqyOSxg4oKvnTcLyTHma5s6CZwfH/p0VSFr0fTT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:51:43.4912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a879a4e4-5bcf-40f5-8fab-08dedc71ef2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:bp@alien8.de,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:babu.moger@amd.com,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com,m:peternewman@google.com
 ,m:qinyuntan@linux.alibaba.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,amd.com,redhat.com,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,microsoft.com,intel.com,linutronix.de,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95505-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[babu.moger@amd.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[babu.moger@amd.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB82771FE97

Generic resctrl exposes kernel-mode policy options via sysfs only after
architectures indicate the set of supported policies using
resctrl_set_kmode_support().

On AMD systems, Privilege Level Zero Association (PLZA) provides two
global assignment modes:

- GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: Assigns the resource allocation
  for kernel work; but monitoring is inherited from the user task.
- GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: Assigns a dedicated resource
  allocation and monitoring for kernel work.

Expose these modes during resource discovery when PLZA is available.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: New patch to set the supported features during arch init.
---
 arch/x86/kernel/cpu/resctrl/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 27e09cded829..df7e19fe6007 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -962,6 +962,9 @@ static __init bool get_rdt_alloc_resources(void)
 	if (get_slow_mem_config())
 		ret = true;
 
+	if (ret && rdt_cpu_has(X86_FEATURE_PLZA))
+		resctrl_set_kmode_support(GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU);
+
 	return ret;
 }
 
@@ -988,6 +991,9 @@ static __init bool get_rdt_mon_resources(void)
 	if (!ret)
 		return false;
 
+	if (rdt_cpu_has(X86_FEATURE_PLZA))
+		resctrl_set_kmode_support(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
+
 	return !rdt_get_l3_mon_config(r);
 }
 
-- 
2.43.0


