Return-Path: <linux-doc+bounces-31104-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F769D2469
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 12:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C7E284FEB
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 11:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A011465A1;
	Tue, 19 Nov 2024 11:02:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AB31C7B63;
	Tue, 19 Nov 2024 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732014139; cv=none; b=nYDho1a56FTnifY/UFTROO0dm33KhTDSjtkJKqRvNwb/I9T0wf0/Z5Li4Q2pPv7MsM9WG3m7qt42rMgiykbdiIKnHwr2mcxUdZM2Gr1gd8dLQzVx37HbxgtsarzXa+6VsoamYJvNFlUkRpw4OHSw2DAeHUUlbfHf6RwSZF6R32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732014139; c=relaxed/simple;
	bh=uSHAvMueJAsWgtjNECPZFK0yCRhcaZ3H+Gj790fOlNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YnQ2gAmxCCWT7nf+/b8wSAypaKBIAqNAya5d/dMdm5urnQa30ooHtCDMeXQIFZESgufL8iJ47Tf6BG6RsrO5zjoxC1yzB8ixeTZnWVnpcatb6zGRcFihlzx/NBr+TqO9vHbBZR2Lq0fkxbrMDozWutMRCfKm4xl3BlhyxZEk0XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4Xt18l6LTrz9v7Jb;
	Tue, 19 Nov 2024 18:35:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id EE10D1407F5;
	Tue, 19 Nov 2024 19:02:09 +0800 (CST)
Received: from huaweicloud.com (unknown [10.204.63.22])
	by APP1 (Coremail) with SMTP id LxC2BwB3NTb9bzxnNXHnAQ--.10850S5;
	Tue, 19 Nov 2024 12:02:09 +0100 (CET)
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: corbet@lwn.net,
	zohar@linux.ibm.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	wufan@linux.microsoft.com,
	pbrobinson@gmail.com,
	zbyszek@in.waw.pl,
	hch@lst.de,
	mjg59@srcf.ucam.org,
	pmatilai@redhat.com,
	jannh@google.com,
	dhowells@redhat.com,
	jikos@kernel.org,
	mkoutny@suse.com,
	ppavlu@suse.com,
	petr.vorel@gmail.com,
	mzerqung@0pointer.de,
	kgold@linux.ibm.com,
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: [RFC][PATCH v4 3/9] ima: Add digest_cache_measure/appraise boot-time built-in policies
Date: Tue, 19 Nov 2024 12:00:57 +0100
Message-ID: <20241119110103.2780453-4-roberto.sassu@huaweicloud.com>
X-Mailer: git-send-email 2.47.0.118.gfd3785337b
In-Reply-To: <20241119110103.2780453-1-roberto.sassu@huaweicloud.com>
References: <20241119110103.2780453-1-roberto.sassu@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwB3NTb9bzxnNXHnAQ--.10850S5
X-Coremail-Antispam: 1UD129KBjvJXoWxtF1kKr1UWF13Zr1DWw48Zwb_yoW7CFyrpa
	9FgFy5trZ8XF9xCw47Aa4xuF4Fy3s2ga13Gws8Ga4jy3Z8ur1q9w10y3WavrWDAr10q3Wx
	XF4Ygr4jkw1qqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26F4UJVW0owCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7IU07U
	UUUUUUU==
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQAMBGc797QEkwACsD

From: Roberto Sassu <roberto.sassu@huawei.com>

Specify the 'digest_cache_measure' boot-time policy with 'ima_policy=' in
the kernel command line to add the following rule at the beginning of the
IMA policy, before other rules:

measure func=DIGEST_LIST_CHECK pcr=12

which will measure digest lists into PCR 12 (or the value in
CONFIG_IMA_DIGEST_CACHE_MEASURE_PCR_IDX).

Specify 'digest_cache_appraise' to add the following rule at the beginning,
before other rules:

appraise func=DIGEST_LIST_CHECK appraise_type=imasig|modsig

which will appraise digest lists with IMA signatures or module-style
appended signatures.

Adding those rules at the beginning rather than at the end is necessary to
ensure that digest lists are measured and appraised in the initial ram
disk, which would be otherwise prevented by the dont_ rules.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 .../admin-guide/kernel-parameters.txt         | 10 +++++-
 security/integrity/ima/Kconfig                | 10 ++++++
 security/integrity/ima/ima_policy.c           | 35 +++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1518343bbe22..9b6f85b1376c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2094,7 +2094,8 @@
 	ima_policy=	[IMA]
 			The builtin policies to load during IMA setup.
 			Format: "tcb | appraise_tcb | secure_boot |
-				 fail_securely | critical_data"
+				 fail_securely | critical_data |
+				 digest_cache_measure | digest_cache_appraise"
 
 			The "tcb" policy measures all programs exec'd, files
 			mmap'd for exec, and all files opened with the read
@@ -2116,6 +2117,13 @@
 			The "critical_data" policy measures kernel integrity
 			critical data.
 
+			The "digest_cache_measure" policy measures digest lists
+			into PCR 12 (can be changed with kernel config).
+
+			The "digest_cache_appraise" policy appraises digest
+			lists with IMA signatures or module-style appended
+			signatures.
+
 	ima_tcb		[IMA] Deprecated.  Use ima_policy= instead.
 			Load a policy which meets the needs of the Trusted
 			Computing Base.  This means IMA will measure all
diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index 475c32615006..d2d79185f714 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -321,4 +321,14 @@ config IMA_DISABLE_HTABLE
 	help
 	   This option disables htable to allow measurement of duplicate records.
 
+config IMA_DIGEST_CACHE_MEASURE_PCR_IDX
+	int
+	range 8 14
+	default 12
+	help
+	  This option determines the TPM PCR register index that IMA uses to
+	  maintain the integrity aggregate of the measurement list, when the
+	  Integrity Digest Cache is used (different measurement style).
+	  If unsure, use the default 12.
+
 endif
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index eb3bfe01782d..c2bf58010b89 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -254,6 +254,21 @@ static struct ima_rule_entry critical_data_rules[] __ro_after_init = {
 	{.action = MEASURE, .func = CRITICAL_DATA, .flags = IMA_FUNC},
 };
 
+static struct ima_rule_entry measure_digest_cache_rule __ro_after_init = {
+#ifdef CONFIG_INTEGRITY_DIGEST_CACHE
+	.action = MEASURE, .func = DIGEST_LIST_CHECK,
+	.pcr = CONFIG_IMA_DIGEST_CACHE_MEASURE_PCR_IDX,
+	.flags = IMA_FUNC | IMA_PCR
+#endif
+};
+
+static struct ima_rule_entry appraise_digest_cache_rule __ro_after_init = {
+#ifdef CONFIG_INTEGRITY_DIGEST_CACHE
+	.action = APPRAISE, .func = DIGEST_LIST_CHECK,
+	.flags = IMA_FUNC | IMA_DIGSIG_REQUIRED | IMA_MODSIG_ALLOWED,
+#endif
+};
+
 /* An array of architecture specific rules */
 static struct ima_rule_entry *arch_policy_entry __ro_after_init;
 
@@ -278,6 +293,8 @@ static bool ima_use_appraise_tcb __initdata;
 static bool ima_use_secure_boot __initdata;
 static bool ima_use_critical_data __initdata;
 static bool ima_fail_unverifiable_sigs __ro_after_init;
+static bool ima_digest_cache_measure __ro_after_init;
+static bool ima_digest_cache_appraise __ro_after_init;
 static int __init policy_setup(char *str)
 {
 	char *p;
@@ -295,6 +312,10 @@ static int __init policy_setup(char *str)
 			ima_use_critical_data = true;
 		else if (strcmp(p, "fail_securely") == 0)
 			ima_fail_unverifiable_sigs = true;
+		else if (strcmp(p, "digest_cache_measure") == 0)
+			ima_digest_cache_measure = true;
+		else if (strcmp(p, "digest_cache_appraise") == 0)
+			ima_digest_cache_appraise = true;
 		else
 			pr_err("policy \"%s\" not found", p);
 	}
@@ -983,6 +1004,20 @@ void __init ima_init_policy(void)
 {
 	int build_appraise_entries, arch_entries;
 
+	/*
+	 * We need to load digest cache rules at the beginning, to avoid dont_
+	 * rules causing ours to not be reached.
+	 */
+	if (IS_ENABLED(CONFIG_INTEGRITY_DIGEST_CACHE)) {
+		if (ima_digest_cache_measure)
+			add_rules(&measure_digest_cache_rule, 1,
+				  IMA_DEFAULT_POLICY);
+
+		if (ima_digest_cache_appraise)
+			add_rules(&appraise_digest_cache_rule, 1,
+				  IMA_DEFAULT_POLICY);
+	}
+
 	/* if !ima_policy, we load NO default rules */
 	if (ima_policy)
 		add_rules(dont_measure_rules, ARRAY_SIZE(dont_measure_rules),
-- 
2.47.0.118.gfd3785337b


