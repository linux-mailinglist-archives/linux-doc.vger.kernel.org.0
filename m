Return-Path: <linux-doc+bounces-95495-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ekfqDRttTWp5zwEAu9opvQ
	(envelope-from <linux-doc+bounces-95495-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 23:18:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A671FB88
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 23:18:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="g0UN/8bE";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95495-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95495-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CBA73009F7C
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 21:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9D434753B;
	Tue,  7 Jul 2026 21:18:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7C93314B9;
	Tue,  7 Jul 2026 21:18:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459097; cv=fail; b=U5zcu4HfrtY/5BXonUkdGkFDJfvyOqlMZ3SJA6urLpqxZZkQiY52qYCL5Z2wrHPmhtV9QoENJgOy05cbQ7uoZt985qtChfs4uZTQ2PUQpXVfSc8BNhFBWOxQBDE4wjNOIGFIbFSeXLEtiWfOsBSowI0/WvhYrqHusfv1e6CVLks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459097; c=relaxed/simple;
	bh=QhxPJPInBGY8KdahsNCoS1nUyc+fxb9Lxms2Y4bGook=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DXBaU9jDfYwZLH1IaflPzDinms145Y9xZmyqQxjRLYbU4vXXb+px6GfclIl+adGCE/zMqHl/rT3A32djH187KZRHmzudSWKmtpIQQQuF+EDF25r6UgiCGa8BJ9EBd06Ggwr0n6/96QKwR2lJ/s7irveLrBCbh7VgPAa3oyqM5aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g0UN/8bE; arc=fail smtp.client-ip=52.101.62.5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjHPK3GDLc2NrrGRYw1tLGFot5Wjj94AR2rYihI4sWCgS6cXwCUB0f35NH1Hmc5Ya3KlcQRDB9V2F4wt0fZ6Dl7ZiTzFGrPWpU/JBpdzNFEDsoRH1C7EyuOo2q/wpQMW2q4do31Kh0FgPkmTpGKZLAMBdVm3EhNLtlxfInvRz9kRSuL5dqWmz7RavYoodj77FZZWhie0A7aFCXIGS1wiv/pCQKgrxxzF9B25UMfPybMASJd/jS81bVBDMes7kUPpLBrVVqjBf3mzuBh/1I7YZ2grQzSbbHz/0bkQaALWNgGI44+/FAHMpFmA6TztBDq0T2b7iOUD/tmqttOyoZZAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2Cgs1+joqhG/adWlAEDwVlblZS44+8mgNNcrhSDj8E=;
 b=yqe4h/ac09S3m/Vuy9yPncvNFqvIqKQ+B2MUE+ap12qgHc+NXT/1bRhSehB8TAYb8UEyVvvTgyYlGpTPnprbiYSc7mNO3YSWsVbxA/z528clrXBvQV6WUIhvIL0e8kGd5m0OFWCk7J0M641n5YTfbnFTWJDBoQBl6kAbHItIK/bG+Vv07MqZqGyR54g/fY6j9/Tj5pJ2EphJLBzKQKzRRhvMU4OqbASQ6Bsu7CrOTb4dwDgJGIF81LYqzK/ti8VlKrsa/GcEyuR+7fd2OE+CzSsFboxUFoLHuadXR1kvX8Di710NI1DLLGxtUG7nOiPVhA3Nq1G9AGOiPAGbtWGifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2Cgs1+joqhG/adWlAEDwVlblZS44+8mgNNcrhSDj8E=;
 b=g0UN/8bErT9INzwAiWLjnUzn/x3UsbiopbW/zJwHs2P2dcsrAUejeInjVTylPt/MVgk71kMGQGYqI8abhqcBokxG5isiegp4XCBO+FiLi79xLlmpctmsV4c5/6t64fKmW4gsanD3vOUcbLyV1Bej5xnh2kJHcJ/2dpC1tzWVsCw=
Received: from PH7P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::11)
 by CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 21:18:10 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:510:32a:cafe::54) by PH7P221CA0015.outlook.office365.com
 (2603:10b6:510:32a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:18:09 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:18:07 -0500
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
Subject: [PATCH v4 06/15] fs/resctrl: Introduce resctrl_set_kmode_support() to initialize supported modes
Date: Tue, 7 Jul 2026 16:16:54 -0500
Message-ID: <f4926d9bc70261ba0245a1d1158d8bd3d09bdefb.1783459023.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783459023.git.babu.moger@amd.com>
References: <cover.1783459023.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|CY1PR12MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 50dba51c-30b3-44e3-1ff5-08dedc6d3ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|23010399003|36860700016|22082099003|18002099003|13003099007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	R35z7XbcOXFADcN+DrEGwkiqKyzHB0WxnUqsYABKfV3DutIELRNsTiXBGJJOANSzOI0rb2AF8gnnxs9MxmYyW3/B54jt7QWv1Nq483+bpi9lCTk8nhkwtmee8IOTKCSLEi4ZWhN8FC2o0fC/HZ+qIOdeswPsj9c0cIMgIIPg6KqpGWyQ9Xl6RYeIwBIruDG828ZcGaVd8ScBEV4N9/wOpilmYGLK8OW9guD1r9JnYjZjHa9oJwYtGpacFGcc/sxvLqJivP9pBsF48AZ0pFTog/ct/38QVmYSDkqgA58t8q6H08f0Pu7sQAtDag93WdSA40gpP4uxI+l+UVDA33Nc12sHiTUjNEiBpZZnUqS7xIPFz8xcnBTLXQ4QTOfPlzbPdRF+uw7UKBimYDZNtmicbaIwf9Z70Dy9T7IuhumSeDA/kQNvW6KcfTQ28rO5ah6NIn27/ud6OpaIxJ9FqeGhNBICBEVlDFi0Zf14KZCCn3FLDRL6iJehmSveYQurD594kn5fbzM4WefmyzPgLlcINOBWp7N7mYRF4EDGkg6a8XUQTyhGaKUc1DHtEjIGtJYmoxzRM/RR+DEM5qetjDFOQuxDO8ckoJo+ROo8iEB7qeek93l8KvsUXEgwlVfHd0r3OLBUlIshCHig9ZmCqbsSvblgPKrWjjBZYWzNbGCSVxs4bqRDYnstg04s+eJt9JGSxMHRFJbV+GCNuER7slfbuQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(13003099007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xGw4u0ZcKpFtPkhL+FnwJoVzc68/TpxHq9Xrmf2vTPuZkyEJNoDC0JdCZHiDdnCvXIGCKZdvA5vBLh6ldxpTHEFual6pNFxQTuPv9gKTGrd+Y7HYF2QPQRm/o5x6Vuc5HlM0C9pdqnZQ1/7Wq6u2r3L/KB5Bi0FQzUi4TdaxLHFIGa5IVee/ZMyu7SLX9B1I2yat8tryd76nBppwcCB7lIS5ObepTCyX0HOxR3komMdHdroWbd6hbV4BfC1f59GcWe38g61axiyMpt/1wfvkX6RvoJtes19yf16qBNzmRuuXEU2CSYGLP4oY1cJ28Zkf0hsXKIhkU2iY8Ksa68BOZcBAYqrSUcua/SNIahGl86gWvaMMpPHMt8urkOSYxbcxzyAqwJuiGBtyW7tYec2OAQp44Y7ObrYw+54RPHCp89ielTNnzmyyDouNgjK4eAeM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:18:09.7017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dba51c-30b3-44e3-1ff5-08dedc6d3ee1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9697
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:bp@alien8.de,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:babu.moger@amd.com,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com,m:peternewman@google.com
 ,m:qinyuntan@linux.alibaba.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,amd.com,redhat.com,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,microsoft.com,intel.com,linutronix.de,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95495-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C52A671FB88

Architectures need a way to advertise which kernel-mode resctrl policies
they support before generic resctrl exposes those policies through the
filesystem.

Add the `struct resctrl_kmode_cfg` to define the default mode statically,
and introduce `resctrl_set_kmode_support()` so architecture code can
register supported kernel-mode policies during resctrl initialization. The
`INHERIT_CTRL_AND_MON` policy is supported by default, so architectures
only need to register any additional modes.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: New patch to initialize supported kernel-mode's.
    https://lore.kernel.org/lkml/737a4228-52fb-4583-ac64-8efe79c107e6@intel.com/
    Changed the kmode_cur to enum resctrl_kernel_mode in resctrl_kmode_cfg.
    Moved the resctrl_kmode_cfg to filesystem code.
---
 fs/resctrl/internal.h   | 12 ++++++++++++
 fs/resctrl/rdtgroup.c   | 23 +++++++++++++++++++++++
 include/linux/resctrl.h | 10 ++++++++++
 3 files changed, 45 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 48af75b9dc85..178126bb2da5 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -314,6 +314,18 @@ struct mbm_state {
 	u32	prev_bw;
 };
 
+/**
+ * struct resctrl_kmode_cfg - Kernel-mode policy snapshot from architecture
+ * @kmode:	Bitmap of supported &enum resctrl_kernel_mode values. Each
+ *		supported mode is represented by BIT(mode).
+ * @kmode_cur:	Currently selected kernel-mode policy.
+ * @k_rdtgrp:	Resource group backing global-assign modes when applicable;
+ */
+struct resctrl_kmode_cfg {
+	unsigned long			kmode;
+	enum resctrl_kernel_mode	kmode_cur;
+	struct rdtgroup			*k_rdtgrp;
+};
 extern struct mutex rdtgroup_mutex;
 
 static inline const char *rdt_kn_name(const struct kernfs_node *kn)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index cc9966ff6cdf..0ee0dfaf9065 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -78,6 +78,16 @@ static void mon_put_kn_priv(void);
 
 struct dentry *debugfs_resctrl;
 
+/*
+ * Global kernel-mode resctrl policy. Architectures add supported modes before
+ * resctrl is mounted; @kmode_cur tracks the active policy after user selection.
+ */
+static struct resctrl_kmode_cfg resctrl_kcfg = {
+	.kmode = BIT(INHERIT_CTRL_AND_MON),
+	.kmode_cur = INHERIT_CTRL_AND_MON,
+	.k_rdtgrp = NULL
+};
+
 /*
  * Memory bandwidth monitoring event to use for the default CTRL_MON group
  * and each new CTRL_MON group created by the user.  Only relevant when
@@ -888,6 +898,19 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/**
+ * resctrl_set_kmode_support() - Advertise support for a kernel-mode policy
+ * @kmode:	Kernel-mode policy supported by the architecture.
+ *
+ * Architectures call this during resctrl initialization to make @kmode visible
+ * to the resctrl filesystem. INHERIT_CTRL_AND_MON is always supported.
+ */
+void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode)
+{
+	if (kmode <= RESCTRL_KMODE_LAST)
+		__set_bit(kmode, &resctrl_kcfg.kmode);
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 /*
  * A task can only be part of one resctrl control group and of one monitor
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 47db34dd167e..8dd02579f354 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -734,6 +734,16 @@ enum resctrl_kernel_mode {
 
 #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
 
+/**
+ * resctrl_set_kmode_support() - Advertise a supported kernel-mode policy
+ * @kmode:	Kernel-mode policy supported by the architecture.
+ *
+ * Architectures use this during resctrl initialization to make additional
+ * kernel-mode policies available to the filesystem. INHERIT_CTRL_AND_MON is
+ * supported by default and does not need to be registered.
+ */
+void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode);
+
 /**
  * resctrl_arch_configure_kmode() - Program kernel-mode association on CPUs
  * @cpu_mask:	CPUs to update; the architecture applies the change on the
-- 
2.43.0


