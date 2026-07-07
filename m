Return-Path: <linux-doc+bounces-95501-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dr8eFCR1TWqb0QEAu9opvQ
	(envelope-from <linux-doc+bounces-95501-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 23:52:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83571FE29
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 23:52:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=PAYnyuer;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95501-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-95501-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B25B2300AD94
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 21:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DF4480350;
	Tue,  7 Jul 2026 21:51:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD76480947;
	Tue,  7 Jul 2026 21:51:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461078; cv=fail; b=oQ48PNtR4IOshz3YZPwZitOOHrFYZBrVsINIrawiTUMN3YItcsvAWks+1cHzfQRAr7ogFa34puSLIC+rzB6CuFSs4CHa9kjPFjEjxk6iibPFenJovWNP+JC2neSsGgakiaBt/Usyf7xui6g2t5k/w5bDq83KlKtN5q8TATdqGXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461078; c=relaxed/simple;
	bh=X3/F3IO5+tRBw/cjkNeS1+ka/zH13uXRfva2+59iPQA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VpWHrzmYnDudpemXq7cnWPv3T9OcduUwcUVZLyfQdILmUOZ/0ZxpkCYFLDU0v48SG9wYdIya7lKz/AtOpi2JHeSRdSjdwd0YNO4+Vba/d+THBqW/VwDGYTbGxqgZFepFeQdrR9oWSSuzOm0GFmxApA3XVOqFXTbFrI1LElFnpWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PAYnyuer; arc=fail smtp.client-ip=52.101.201.10
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7/nXB1W7KbW/TZ0IZCNThWTJIS5tCiLsf+lZ9dSksPZjRLVy0YenC1O/BpGLn1Ev4CmtWzcLaipSVT9WV3igvzM6NM5oSxJhhYtm4cktdBlk2JEsyg7e4Wr8NrOVBJCRossYzWX7+SpnGGk7UXl1csUsbfWnEyE5q3C7JgHAk8iNPnZ+vYCKeQfMIKdbD7Suavy8iJPco8xeXIHy1pwX6X3rm2R7wVv1EOfHahVumkLAEoA8mgx+ZRHDYIMlEeLvEku+yIWsvz4v2fvNZjJUrtirJmxsFtn1nXP8gzszOKlY9vnh+MezYqvcG3CTIP7ayxLjhjevZLdcZjvzbWfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KNTqA8xNrV3FPsfb4FibuOgPGXZ2Mg8KU62pPWzuTw=;
 b=BNutajbrgUdLcYVrMhUqkyK475xmPd6EEe5MoJZ44l6+yinx9Ktf4MgLoxlCr+YKHiFZJMQCjRAy9cUqH2PSdbd+iEusACwm8KHHvY8VwAmX/FTZeIIDEL2c2LgogC1I8AsATVurD0YAggAqzAoA6JteQAPSXnYrygJt5x9XuJ++Rx9QXHeySDnn/Wt/9BHOl/x36gakprnwudkiCgIx4wYTATU66qyejQgBsDidzjJ4IXCD5GbKvKGx8AQo3b0Yvzq82ub0LrLXbEP+ifq0ALwS8WMJjeDI4+eLIrIBogyYWoiEkRKrCKLiVrlWLARVZvVjcvUFXbcMYpl0GhAreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KNTqA8xNrV3FPsfb4FibuOgPGXZ2Mg8KU62pPWzuTw=;
 b=PAYnyuermc11ggUjQpv7YWDQHNZqv4vLZ7TFSWlEBgxGynLN6t/DibVqpPu2z4Hy9o5QBfCmHMrGa7QDfzyYdx1snfKZeE+DlWqfbgKBYjd1tcwnT0GvdNojxqdWiZdwrBGhopxzSyTl4oobOF8ZuPY9ndDy4r9yA0w/c/5gZjI=
Received: from MN2PR05CA0056.namprd05.prod.outlook.com (2603:10b6:208:236::25)
 by PH7PR12MB5807.namprd12.prod.outlook.com (2603:10b6:510:1d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:51:07 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::a9) by MN2PR05CA0056.outlook.office365.com
 (2603:10b6:208:236::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:51:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:51:07 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:51:05 -0500
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
Subject: [RESEND PATCH v4 03/15] x86/resctrl: Add data structures and definitions for PLZA configuration
Date: Tue, 7 Jul 2026 16:50:04 -0500
Message-ID: <e8bd9b22dcec5b90e5be0d4c4559874971a00ba0.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|PH7PR12MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f14cfc6-7230-4111-e230-08dedc71d990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|7416014|82310400026|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fwmoS/CWdX3ZSsQXeAG6lkKKaQoevtYyDHoBGoPBQsWWCJKm4qrQpyD3jfrQMTncS2zqIt7VlwIhFUdmgAxq4zzjY/3GQoPnmgzQErhiolnrJM6eheo+CoUVtpNolIY8dddm/Tk+kHngZOE83VFhnSjUcZGvgBUwGFDkBdoPxjOdzBV223lPn201xX/is7p8bF1bLuSxzgWD4V13NMzdrHbJlbKtGZnMHjByTfMG1HXDx3zYDQ/wRt1ird5zYwvezyeYF0eWAXGtNtsumllw7vG84DXqZe3U0BQoyUnir1g5mYcAX5BV5eo/CfcxHZP/hlOHRmgzposmUGVmDqvHu4BIzrJQIAH5sUmf5kvuch5o12dLX8F0gytITPv20mFNy3tr3kmx0XQpuEGHplmC4r1dwItv/0WpP+aLINrSt/lWOhZL0HjM3hrZU8CfVFcQC1lfjRL/Avr97oxaaTCcKVndugASJzXDfgayltFYTv5ochN8BWwIjbRKO8MMMPsQDjVAX0UVbfl2gBYdD/kp+FlTQVVnDOLUDNeg0kTF9dW0fPytr0UjxZbvkZQociKA5hupy+bt62xHYvP/ONcYgeJ8xXV7/TabaZNFrKbCILSzPdU7IzAt4voXQumTRCGnXSFJT1WyEgW7NgCJ0NaTPUWfT9x39MwL2BEGfOhm871Lq5G1TneQRvi9DgmUjIyDYvVejflX3FgxtRISKoLoGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(7416014)(82310400026)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	abhME3Rb7ux60ZfYpuxC3djRkN/K9LjyuF5QqueUwjWfaQ6B4BBkPZEUsUf/zJd1+PE5v31cp1g8ktqSkMxqbtoiDVIxEasi0xPyiN6G/UFc+NtyXefDuzdTGEvPszl8P8I67Bz9ycJ684/+4fcTI3vOZNIpQw7mNS3kSrh1yVk34hzMdiRzof2W//nR9eVS0Ccsw8QKaoLignWObdPJWXhUCLswHyTIKK9iwiZdOa7CQvejQBFqymo2BSJRO3s5mzTaGmRTtY74ejfx0kHd/ryS9I9old1sCBoXvd/mk1R0UxV+EGTL6qgBNPjSrzfA3ZBrX6wDLW6D5AQIgWTWsUhpNNKWYqZ0K9ntTgkuTYhYF0xfu1njlInS28KUiKfzNN3m0Ussn1tci5HGqa4c21FMD0EPpO3c7RPswQn43DaraMQfwgs4yBYaPAiOw0YX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:51:07.2391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f14cfc6-7230-4111-e230-08dedc71d990
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5807
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:bp@alien8.de,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:babu.moger@amd.com,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com,m:peternewman@google.com
 ,m:qinyuntan@linux.alibaba.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,amd.com,redhat.com,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,microsoft.com,intel.com,linutronix.de,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95501-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E83571FE29

Privilege Level Zero Association (PLZA) allows the kernel to use a
different CLOSID (and optionally RMID) than user mode on entry to kernel
mode. The CLOSID/RMID association is programmed per CPU via
MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc), using RMID/CLOSID values and their
respective enable bits.

Add the MSR definition and union msr_pqr_plza_assoc to represent the MSR
bitfield layout used by subsequent PLZA programming.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Re-wrote the changelog and code comment.

v3: No code changes. Patch order changed. Improved changelog.

v2: No changes. Just rebasing on top of the latest tip branch.
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h | 37 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 18c4be75e927..2503451a95fe 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1292,6 +1292,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
 #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..020ebc2c8a1f 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -222,6 +222,43 @@ union l3_qos_abmc_cfg {
 	unsigned long full;
 };
 
+/*
+ * Privilege Level Zero Association (PLZA) is configured by writing to
+ * MSR_IA32_PQR_PLZA_ASSOC. The MSR must be programmed on every CPU in
+ * the QoS domain. Each domain supports only one PLZA CLOSID and/or RMID
+ * association. All fields other than PLZA_EN must hold the same value
+ * across the domain for consistent operation.
+ *
+ * When PLZA_EN is set, the CLOSID/RMID association used at CPL 0 is
+ * taken from MSR_IA32_PQR_PLZA_ASSOC instead of MSR_IA32_PQR_ASSOC.
+ *
+ * @rmid		: RMID associated with PLZA.
+ * @reserved1		: Reserved.
+ * @rmid_en		: Enable RMID association for PLZA.
+ * @closid		: CLOSID associated with PLZA.
+ * @reserved2		: Reserved.
+ * @closid_en		: Enable CLOSID association for PLZA.
+ * @reserved3		: Reserved.
+ * @plza_en		: Enable PLZA. When enabled, PLZA applies to the
+ *			  given CPU. When PLZA is disabled for a CPU, the
+ *			  CLOSID and RMID association defined in the
+ *			  PQR_ASSOC MSR applies, regardless of the CPU's
+ *			  privilege level.
+ */
+union msr_pqr_plza_assoc {
+	struct {
+		unsigned long rmid	:12,
+			      reserved1	:19,
+			      rmid_en	: 1,
+			      closid	: 4,
+			      reserved2	:11,
+			      closid_en	: 1,
+			      reserved3	:15,
+			      plza_en	: 1;
+	} split;
+	unsigned long full;
+};
+
 void rdt_ctrl_update(void *arg);
 
 int rdt_get_l3_mon_config(struct rdt_resource *r);
-- 
2.43.0


