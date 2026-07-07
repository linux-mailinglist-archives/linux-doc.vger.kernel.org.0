Return-Path: <linux-doc+bounces-95508-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sJw5FAh2TWrk0QEAu9opvQ
	(envelope-from <linux-doc+bounces-95508-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 23:56:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A5A71FEC0
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 23:56:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=x5g3Vff7;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95508-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95508-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E443C30864C0
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 21:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B583480DC9;
	Tue,  7 Jul 2026 21:52:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011029.outbound.protection.outlook.com [52.101.57.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5C48094D;
	Tue,  7 Jul 2026 21:52:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461140; cv=fail; b=nhidx/RSwLfAepTJleQ8I1SLL9kl3MaLHSVsm/pw48qitty/i/wyegiMZOPLeV38XO+YwNr20UUwJ6rVlT2abhe01J9sea7MpYozzmDy+XuJ+N8N6a+QCQxUHrhnorjfuNEjSZK/IxXQFPsSNXBBr7qazyCqw1Pt0Xe/mbEJp8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461140; c=relaxed/simple;
	bh=BuBi02eVR34Eq0IlyhwRTaZZpu/XOcxZCXG0xS0C5u4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RHAalmqdn3dY5ZqjpPAo78ZJoaxUaOw1LNhoZ0+IaGx1kuNMieKz/b/LH1AXl00yE5XxfqBZSUnSPJj+/Ztfco/E6pFUb5nda1+1l7+83rmsxb9+liQ9l6QnVGz7Y6ghApkG6qpXTH2n1TkRaBcReX+ALWkc3BJ+YLEHR9/31xM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x5g3Vff7; arc=fail smtp.client-ip=52.101.57.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUMIv+zrOVqKFIh6lkj3cAPETaaTaCfikEWRhAuuFTOtaPkaHCFfrYuK7L958Mvzj4eAAZuslkea2M6G6pIyzX5Q2NcIBcHLMnfSmErYRBR6IXLHwIu2P7GnKRjPr+/+tGsiNQypuJiTL3kG8HOkGg+IhQHbaQ1946WyIkBAiPzmBXVxlADgY5DPfMyqhdJh8mYRUExgWHntBPk5L7LWagyO4sdYm47xAU/Q6IV6GIkk/VwikDGsHf4ZQuJJSVTncf1vNdRMvGcDgNk4oyb2gDlZeCUVjLffKQj4AFNFBzpnJ/M2kzrxbk2Xhfx4eIN2KH2sZ9c4Ja4g76Hlk3WpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux7NyeIk/rIxbyGGbnoDE9/kbfCTeg7pjJRZXLGssrM=;
 b=l0AACLwwaZ5eurmXwSBcdCUPOzrcyUChMBahlI5LK39YhDEmctjBPa9/fOgAP9wyxoo5SANWMnh8Lj3w/AwSsHoVviiBsI/LQ8MUzeBDn7Orq1QrCUXuSInf3b57ElsCY0Pg4WTTI3+uMW/8h96++E1kwavmS8vgfcEaV3PURdgzrTOoqfnaDaQOIKGU5ygcGAubD97wmNkaW/ejGu3gzXBg+Q2/eX72evNf9gP52vPkhWmwgsZjOpnbbNHP6IiBOv4Tf/EMrpDIOZ4kUv8fhf4AV2/YyOiF8XpaEvCSTp297NNoaF4aVhacmVaRcy+Zxp1puYC+JPNOvAAd3JpIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux7NyeIk/rIxbyGGbnoDE9/kbfCTeg7pjJRZXLGssrM=;
 b=x5g3Vff7nC8K0vSW3O4IVLoGDyqHMXEWDQQtJdZc6mQtq/bqt2dCTvxtW4pwRGLRg9B0h0tNVyycilTmHdeeI6gWdsSa7x0xmfSzd+4YgHjN36JzypWicVmjaacQryaLWl/IEhopTNhg1b4fDsIbdZlK8ToXM1zNvB/4MbrVtQs=
Received: from MN2PR08CA0022.namprd08.prod.outlook.com (2603:10b6:208:239::27)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Tue, 7 Jul
 2026 21:52:13 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::26) by MN2PR08CA0022.outlook.office365.com
 (2603:10b6:208:239::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:52:12 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:52:11 -0500
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
Subject: [RESEND PATCH v4 10/15] fs/resctrl: Reset the kernel-mode binding when an rdtgroup is removed
Date: Tue, 7 Jul 2026 16:50:11 -0500
Message-ID: <89a5b2cf3b727d04591d49775a88ba38be57a5f9.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|BY5PR12MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d5e043-97aa-4170-1220-08dedc7200c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|7416014|36860700016|5023799004|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ziiuw8OgfXhKMG2Xbcboe6w6gaWyJ8ZExMo5koO43d3PsbKLriLpWNFpB5ZOEeziPJSuzT7exwtVuyDe5pifb2E7t0K3jnGtvucLscYrnWMfl+KpEem0K5Ku7ntz/UAJzHJVm6bEBaoSQKywnwL2xlXNkLRJl1XFVolrN1h255oWgQwQ0Bp+dJx5WU+0pWCLOz+0r2cuC76RIRXgE2sF6jg8bKoBRJh+FOcjOwQw+xgwzhcR80b17Kzz3yZh0E7Q4AKD3pYm7U0Ikgz7qC4Ksr/TCNwSU/moqW4/vfRgha/YCY794RgXSvZH8s3+c3UOmuSkCGFIfvjAJpKeLMhg0xKNWHYBAY9qAvCSn8bVi/mczU3Ik6JsXvLq/QzaPYL60r1qyZMjxYgutHn8VA1Si7apMOK9nrunWf287ZqvZVkBkr0l5vEVJ029P4KicjBZptVA+FITeiYIsHRhBrq5G6Z25WKChTgGBQa7RMrkb244in9OA63mDAjTKnH9r2iwvUjCXEFmVVKU8h9EXCaKqZOUuJmNONIiMiaci4GVHqgxxmHJGPejfuayg5HTiyNOK8dK8HRw6tmWOtbZSEZWSxFyi11mBbb1CmYIiNlvp214Eq5wg+6/HqPAz8N6D/laBxIzdCZXpss5FOuiEHYduaEybT/xtf+YJ/zVrHtcCDw9fRhQaQJ/sHx3uUET4e2BYU0tFzBbj789Tk1joCHMuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(7416014)(36860700016)(5023799004)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vpbUt6z6lKELAVxFR70mmC2SBwgTDse0DDlAa19i9GT/EzSh66yZu5G9K1C89Vh231ad3X0rixSQQ0TRFaJNf+tzx7213dCk/yPeqMcloDaX2SSnQMWzEjjRuDql7wnXLK7/XQCsmwoMp3IeXL1bY5DniHyMi5qYtnT0SqxgzoaB0UfSWnPTAm34mea9hDKxThWYkdQ91291VX/N9MbUkSoXVJkFiqR/75u6s0z6Y/yihIJ/osf4inQvutokjZqj+xSiF1pvbAsWPTOcP7uAFxXx21HX6/F1yf0BLI/+JjtmNre147SNBBFwSSuaMvHacET9TOG1CVGG/1dQvvv1bvrtnBeAaqocl8LSC0fnPJfEDsfSyGtrT0HLh+t5xfqJpR2qmezPuxnKCdV+151Hry9my4t49froZm8mUan5lM65MTCMQwm0UMpXTUnLXDfz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:52:12.9621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d5e043-97aa-4170-1220-08dedc7200c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:bp@alien8.de,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:babu.moger@amd.com,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com,m:peternewman@google.com
 ,m:qinyuntan@linux.alibaba.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,amd.com,redhat.com,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,microsoft.com,intel.com,linutronix.de,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95508-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5A5A71FEC0

Resctrl keeps track of the rdtgroup backing the active global kernel-mode
policy, including the group's CPU mask used to program kernel-mode
associations.

When that rdtgroup is deleted, resctrl must update both its internal state
and the hardware configuration associated with the group's kmode_cpu_mask.

Introduce rdtgroup_config_kmode_reset() to disable the active kernel-mode
association for the bound group's CPU mask and to clear its kernel-mode
state. Invoke this helper from rdtgroup_kmode_detach(), and reset
resctrl_kcfg to INHERIT_CTRL_AND_MON. Ensure rdtgroup_kmode_detach() is
called during group removal and filesystem teardown, before the bound
rdtgroup is freed.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Re-wrote the changelog.
    Added the call free_all_child_rdtgrp() and rmdir_all_sub()
    Simplified the code comments.

v3: New patch to handle the kernel_mode clean up.
---
 fs/resctrl/rdtgroup.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 0d5c94169d03..21659fd75850 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1127,6 +1127,61 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/**
+ * rdtgroup_config_kmode_reset() - Tear down the kernel-mode binding on @rdtgrp
+ * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
+ *		May be %NULL when no group is currently bound, in which case
+ *		this is a no-op.
+ * @kmode:	Kernel-mode policy currently active on @rdtgrp.
+ *
+ * Reset the kernel-mode binding on the CPUs in @rdtgrp's @kmode_cpu_mask.
+ */
+static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
+					enum resctrl_kernel_mode kmode)
+{
+	bool assign_mon = false;
+
+	if (!rdtgrp)
+		return;
+
+	if (kmode == INHERIT_CTRL_AND_MON)
+		goto out_clear;
+
+	if (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU)
+		assign_mon = true;
+
+	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
+				     rdtgrp->mon.rmid, assign_mon, false);
+
+out_clear:
+	cpumask_clear(&rdtgrp->kmode_cpu_mask);
+	rdtgrp->kmode = false;
+}
+
+/**
+ * rdtgroup_kmode_detach() - Detach @rdtgrp from kernel-mode assignment
+ * @rdtgrp: Resctrl group being removed or torn down
+ *
+ * If @rdtgrp is bound to the active kernel-mode assignment, disable the
+ * hardware association programmed for that group and reset the kernel-mode
+ * to INHERIT_CTRL_AND_MON.
+ */
+static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
+{
+	if (!rdtgrp || !rdtgrp->kmode)
+		return;
+
+	if (resctrl_kcfg.k_rdtgrp != rdtgrp) {
+		pr_warn("resctrl: kernel-mode group not valid\n");
+		return;
+	}
+
+	rdtgroup_config_kmode_reset(rdtgrp, resctrl_kcfg.kmode_cur);
+
+	resctrl_kcfg.k_rdtgrp = NULL;
+	resctrl_kcfg.kmode_cur = INHERIT_CTRL_AND_MON;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -3215,6 +3270,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
 
 	head = &rdtgrp->mon.crdtgrp_list;
 	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
+		rdtgroup_kmode_detach(sentry);
 		rdtgroup_unassign_cntrs(sentry);
 		free_rmid(sentry->closid, sentry->mon.rmid);
 		list_del(&sentry->mon.crdtgrp_list);
@@ -3252,6 +3308,7 @@ static void rmdir_all_sub(void)
 		cpumask_or(&rdtgroup_default.cpu_mask,
 			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
 
+		rdtgroup_kmode_detach(rdtgrp);
 		rdtgroup_unassign_cntrs(rdtgrp);
 
 		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
@@ -3347,6 +3404,7 @@ static void resctrl_fs_teardown(void)
 		return;
 
 	rmdir_all_sub();
+	rdtgroup_kmode_detach(&rdtgroup_default);
 	rdtgroup_unassign_cntrs(&rdtgroup_default);
 	mon_put_kn_priv();
 	rdt_pseudo_lock_release();
@@ -4149,6 +4207,8 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	u32 closid, rmid;
 	int cpu;
 
+	rdtgroup_kmode_detach(rdtgrp);
+
 	/* Give any tasks back to the parent group */
 	rdt_move_group_tasks(rdtgrp, prdtgrp, tmpmask);
 
@@ -4199,6 +4259,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	u32 closid, rmid;
 	int cpu;
 
+	rdtgroup_kmode_detach(rdtgrp);
+
 	/* Give any tasks back to the default group */
 	rdt_move_group_tasks(rdtgrp, &rdtgroup_default, tmpmask);
 
-- 
2.43.0


