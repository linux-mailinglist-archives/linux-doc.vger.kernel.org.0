Return-Path: <linux-doc+bounces-94227-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kKu4DlwURGqjoAoAu9opvQ
	(envelope-from <linux-doc+bounces-94227-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:09:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A63966E7716
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:09:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Z4zibyTc;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94227-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94227-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2DCD3178B61
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0588040DFBB;
	Tue, 30 Jun 2026 19:03:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5833C108A;
	Tue, 30 Jun 2026 19:03:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846234; cv=fail; b=KdwS5maHla5nEU1qsHRNFXtAk9lcNUv/ffLR+KFV0Kwwa1ADXGmEf54DP/6Vz+cVkNRiS7zJWSi3b2V6icnDJ64miy5r9dDdkF2vwpkPoSQKLbvLZosSaBljSG1Qk+wmehWHPpKpTL0PxN4PuqeT1KI0PQiTg5kH+qHmzb6ZCSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846234; c=relaxed/simple;
	bh=aX4UtdLHyoTvxZhZ85ahSMxy1rjkbvUm0jQkte49uDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kkJVzIOsaBmUagvVNVgeaI8/MeFC4j8YHtguw9o+EvTgX54DKhK4GsHxST+B0TwFYg1xpyemevcVpmVdWKZMSUT9e8yRmfMtlTalUFU42DV1ny0x8u7VD8dN/FgcCyyoGH2zBbX7aSqeuAiJJJykGwGZfUrqFILN4r7gwNHrRaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z4zibyTc; arc=fail smtp.client-ip=40.93.201.59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwLFLjRgsZNvYyNDk5FvaR/bjgfAdwuKSficQJ9jFWYBFSh/OEuqfdD/BYWs1FAPtztgi/k9fORqqvryf52mdF4THS4bf7ngrpQooOKYOz+T3SFBkg9Jyc60dNZLMvg1IfKZwAfRbrNHbPRShwXRBMK7z2OzHvB7zZ7efWRk0kE3iAgfoYppQBZdtJXZknXR1m33RRlePMFc1yWW0dqZOXOWFvrrGmjW8LD5ozhVK7gbyhWMqz+QKtfOaKJdC13UDURWnSP9t1QfHC6GwTQ+dyhyl/EndcnCNW9Veruqvvp3MaUJrJoC/irwtdE3ihxGy+Q8uYLGN2tYoW3dVgykYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kP9AZlTG77WfdC2CMC9fWhzpYGauAlhsvaPGg0jalo=;
 b=CFk9WHHagKUsRhk0M+1GlBXZuvynvPkjR1htCRvpEfcelxDr4jg9wiJy1XpFi1PZBEDFrod4iK7ihZrAxbCf3iCrqT/36PmKmeAuv5EXJw7fT6fsYVYPw41I0F4sFY023G7FoBseMKQc565BfU1duFJBTBi53sUzAXsR6ijvK2cPJPWSEibTzjIgV95BkU0oIWTdKzo+cWwe5rwTBMbVqwhgM8K8/rlVnFiEz9mh+S7Pqh++f+7r+BidZhkjfYsakbKyk/9qdAuAuIjOGNCOqvuhkJY0/znF1GtqnwrMvdNdTc7gvwMPmdgS9l1n7CTDe6ihh8rMV2nX4VScx6ToOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kP9AZlTG77WfdC2CMC9fWhzpYGauAlhsvaPGg0jalo=;
 b=Z4zibyTcSxqQlslEYzcN/jzqJ/RNxPwEoeaCQzyiP+vR5oFCsqdY/eiyrfyuH4J+zqm/Wm0TKCtP0GA6y990ztoc3JtLrMIdFQDH/8FXbzjcXxmK4Yk3asZAT9CWZldCEpq6cRKwdpzc3ivNkyR1LpJ1kAas6wFZga+C6KwNAZQ=
Received: from MN2PR20CA0045.namprd20.prod.outlook.com (2603:10b6:208:235::14)
 by LV8PR12MB9643.namprd12.prod.outlook.com (2603:10b6:408:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 19:03:48 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::8b) by MN2PR20CA0045.outlook.office365.com
 (2603:10b6:208:235::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 19:03:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 19:03:48 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 14:03:45 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Mario Limonciello <mario.limonciello@amd.com>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui
	<ray.huang@amd.com>
CC: Perry Yuan <perry.yuan@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	<linux-pm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 6/6] cpufreq/amd-pstate-ut: Add unit test for "dynamic" EPP mode
Date: Tue, 30 Jun 2026 19:03:04 +0000
Message-ID: <20260630190304.5671-3-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630185904.5602-1-kprateek.nayak@amd.com>
References: <20260630185904.5602-1-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|LV8PR12MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: d16f8bce-f05e-4f88-c97a-08ded6da50de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6szMGNmkguwQqSzLbZlOac8FxBY5rDLF7usoe9qGI5gWfg/0JAVw5L8YASzLn+NdxLfT827ur4t8X7f7OqjmC6gIiDcsq/ik/D5/H7+7H8tYFmVTtn1Ol03hVtpL/Q4r61/ly2CUKcvKtQkq2Yz60BkEVvLp3Dh9mtrxdrIwDhbK8hVs2bo9/FTAs3FAYztdUmrsK//zEJJ7fRr2GzVQKl66i9xUgxnDCm+gTPamMBD5XETor8a6kFbhpXg19I9C+xIAZU68RiJ69sQirw/wov2DuZW8aBqilN0t5WzwuhZzrX720igQqxzo+nVB3fK+YceeeFws+qKH42g2793Npq8iGL+co4k5XGYnqWpYKtwb7PqDaNOSnZh4UsTPpD8cHbAtAflmQFEJ5QeK4N7usbxVOSbgfwoA2R4e+bRObd/rdhe6QrsGYnTMFZweauqQwb/k5vKap16JckYXH1tN4WrnpyesDBCqgQZHRQbOslAyuhNug1d8AXgW6ILxlAwsqMD/BPj1HMUwfhawP1v/9VYeFAxubcTpgMLqhrS4O3qznCj1Ayw9EU5FWaRePi2hDfS/Gh8i+uvKtXoJ6AOfV37ovOgtUUZZ5aWC1LxFJGwX6JX3mMV4VjEY5RFaBBEECtPKngMlsiI8r9uM5CqQalFduciQ05do1czy/J3JBXKPGpEKUjx7k5mBo/D2BVUBZAoFYqDOdpMjpJXPASVXXQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yYkKxmt72mT+07KbuZDGofGMZdnDS3zDiQm1T0NMMEI4EVmlbTYamkhjjF5xrocXF9/YhATOozTUwAWCN/x+1Oiz7aAznW3dd2xq3aupTb7kgeMc6DXFjwsGboJ6wJc1DFJZdXOt/vQPA4qfbLi5vuSezR1VI7KOF/76Oj91FHUyKykxscSO8V8QRzqoH82X8S/d57BLHIGdIUXydrZ6knbFFWdqFJncSlpP5RfCTltfTQoB30H3/cTgOUZdzYQks9qzDIlU3S2A7HYtndZlpkZIyDTCa7Z9PxpR6WJPWDXZuxiint8SZu5Sks263oQ7TisjOIQpXex7k8AD1OxpiQb4Iu5Psuf5W5E/bz2SYT+yPp3sJGMS1RzI7XBdOGkk+szJjtwZg8sZVH3rmleALcE74Sp7y/NbEjZiybW6HOhbAWUXJ5T3wXvEO2bgRz4a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:03:48.0743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d16f8bce-f05e-4f88-c97a-08ded6da50de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9643
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94227-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:ray.huang@amd.com,m:perry.yuan@amd.com,m:kprateek.nayak@amd.com,m:linux-pm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kprateek.nayak@amd.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kprateek.nayak@amd.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A63966E7716

Extend the EPP unit test to cover the "dynamic" epp mode. Since
"dynamic_epp" is no longer a system-wide toggle, remove the legacy
"dynamic_epp" bits from the unit test.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 drivers/cpufreq/amd-pstate-ut.c | 48 ++++++++++++++++++---------------
 drivers/cpufreq/amd-pstate.c    |  6 +++++
 drivers/cpufreq/amd-pstate.h    |  1 +
 3 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/cpufreq/amd-pstate-ut.c b/drivers/cpufreq/amd-pstate-ut.c
index 735b29f76438..affe36218d73 100644
--- a/drivers/cpufreq/amd-pstate-ut.c
+++ b/drivers/cpufreq/amd-pstate-ut.c
@@ -275,6 +275,7 @@ static int amd_pstate_set_mode(enum amd_pstate_mode mode)
 static int amd_pstate_ut_epp(u32 index)
 {
 	static const char * const epp_strings[] = {
+		"dynamic",
 		"power",
 		"balance_power",
 		"balance_performance",
@@ -282,10 +283,10 @@ static int amd_pstate_ut_epp(u32 index)
 	};
 	char *buf __free(cleanup_page) = NULL;
 	struct cpufreq_policy *policy = NULL;
+	unsigned long orig_dynamic_epp = 0;
 	enum amd_pstate_mode orig_mode;
 	struct amd_cpudata *cpudata;
 	unsigned long orig_policy;
-	bool orig_dynamic_epp;
 	int ret, cpu = 0;
 	u16 epp;
 	int i;
@@ -294,9 +295,11 @@ static int amd_pstate_ut_epp(u32 index)
 	if (!policy)
 		return -ENODEV;
 
-	cpudata = policy->driver_data;
 	orig_mode = amd_pstate_get_status();
-	orig_dynamic_epp = cpudata->dynamic_epp;
+	if (policy->driver_data) {
+		cpudata = policy->driver_data;
+		orig_dynamic_epp = cpudata->dynamic_epp;
+	}
 
 	/* Drop reference before potential driver change. */
 	cpufreq_cpu_put(policy);
@@ -321,16 +324,6 @@ static int amd_pstate_ut_epp(u32 index)
 	orig_policy = cpudata->policy;
 	cpudata->policy = CPUFREQ_POLICY_POWERSAVE;
 
-	/*
-	 * Disable dynamic EPP before running test. If "orig_dynamic_epp" is
-	 * true, the  driver will do a redundant switch at the end and there
-	 * is no need for enabling it again at the end of the test.
-	 */
-	if (cpudata->dynamic_epp) {
-		pr_debug("Dynamic EPP is enabled, disabling it\n");
-		amd_pstate_clear_dynamic_epp(policy);
-	}
-
 	for (epp = 0; epp <= U8_MAX; epp++) {
 		u8 val;
 
@@ -355,7 +348,8 @@ static int amd_pstate_ut_epp(u32 index)
 		}
 	}
 
-	for (i = 0; i < ARRAY_SIZE(epp_strings); i++) {
+	/* If dynamic EPP is disabled via cmdline, start at index 1. */
+	for (i = amd_pstate_dynamic_epp_disabled(); i < ARRAY_SIZE(epp_strings); i++) {
 		memset(buf, 0, PAGE_SIZE);
 		snprintf(buf, PAGE_SIZE, "%s", epp_strings[i]);
 		ret = store_energy_performance_preference(policy, buf, strlen(buf));
@@ -367,6 +361,11 @@ static int amd_pstate_ut_epp(u32 index)
 		if (ret < 0)
 			goto out;
 		strreplace(buf, '\n', '\0');
+		/*
+		 * "dynamic" mode reports the EPP as "dynamic(profile:X)"
+		 * Trim at "(" and just compare tie the epp string.
+		 */
+		strreplace(buf, '(', '\0');
 
 		if (strcmp(buf, epp_strings[i])) {
 			pr_err("String EPP value mismatch: %s != %s\n", buf, epp_strings[i]);
@@ -380,18 +379,23 @@ static int amd_pstate_ut_epp(u32 index)
 out:
 	if (policy) {
 		cpudata->policy = orig_policy;
+		/*
+		 * If the driver had enabled dynamic_epp to brgin with,
+		 * restore it here before dropping policy reference.
+		 */
+		if (orig_dynamic_epp) {
+			int ret2;
+
+			ret2 = store_energy_performance_preference(policy,
+								  epp_strings[0],
+								  strlen(epp_strings[0]));
+			if (!ret && (ret2 < 0))
+				ret = ret2;
+		}
 		up_write(&policy->rwsem);
 		cpufreq_cpu_put(policy);
 	}
 
-	if (orig_dynamic_epp) {
-		int ret2;
-
-		ret2 = amd_pstate_set_mode(AMD_PSTATE_DISABLE);
-		if (!ret && ret2)
-			ret = ret2;
-	}
-
 	if (orig_mode != amd_pstate_get_status()) {
 		int ret2;
 
diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 44c03b0be219..e7f83482c8cb 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -1253,6 +1253,12 @@ static const struct platform_profile_ops amd_pstate_profile_ops = {
 	.profile_get = amd_pstate_profile_get,
 };
 
+int amd_pstate_dynamic_epp_disabled(void)
+{
+	return !dynamic_epp;
+}
+EXPORT_SYMBOL_FOR_PSTATE_UT(amd_pstate_dynamic_epp_disabled);
+
 void amd_pstate_clear_dynamic_epp(struct cpufreq_policy *policy)
 {
 	struct amd_cpudata *cpudata = policy->driver_data;
diff --git a/drivers/cpufreq/amd-pstate.h b/drivers/cpufreq/amd-pstate.h
index edd697a5e29f..bbde1d035071 100644
--- a/drivers/cpufreq/amd-pstate.h
+++ b/drivers/cpufreq/amd-pstate.h
@@ -160,6 +160,7 @@ ssize_t store_energy_performance_preference(struct cpufreq_policy *policy,
 				    const char *buf, size_t count);
 ssize_t show_energy_performance_preference(struct cpufreq_policy *policy, char *buf);
 void amd_pstate_clear_dynamic_epp(struct cpufreq_policy *policy);
+int amd_pstate_dynamic_epp_disabled(void);
 
 struct freq_attr;
 
-- 
2.34.1


