Return-Path: <linux-doc+bounces-89838-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDz8AlwIGGrGaQgAu9opvQ
	(envelope-from <linux-doc+bounces-89838-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 11:18:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE985EF6E9
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 11:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D236C3087F0C
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 09:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF893AB276;
	Thu, 28 May 2026 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hgazRG0H"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C903AB274;
	Thu, 28 May 2026 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959415; cv=none; b=oAkPRFR9i8Jdk8ihle7v7kbvFWjKWAFcz1VsPVdWrM+7X3dJWhVRD2RD5yLsUy7W9Ab8tP9qxtkNk1nSJaRYhvxmApwJxgWnm+wFTnfmOX2GPeLBsUSdeQahGTK7M+pRM/NL1YX+cbfENNTxGhTgka4P3kQcyP6wGYtU9l8eld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959415; c=relaxed/simple;
	bh=r3/vjATgWEGj2o9tOCXkkVyPIqLlGthQcOjtR8FaSiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVoOX9nQb5W3+L0pt76kYOVFhYth3gMUXS4SNSO9iqfo5mCzO64oP163TcXXTkZNnL0c0JEpj/vT6KbWs9cUAClW0qqdAkBuXM+iD6t74IxfnLFsbDpiYCPxnmfld9qj644Q8Hw5RtSkL936SHLsdx73K8631wDyIenEC/cOyRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hgazRG0H; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 841394403;
	Thu, 28 May 2026 02:10:08 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.24.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 860523F632;
	Thu, 28 May 2026 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779959413; bh=r3/vjATgWEGj2o9tOCXkkVyPIqLlGthQcOjtR8FaSiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hgazRG0HyEBEPtlFjrSSpaMRCWY/ECmc7Stsh41Yg9FCvFoxQbJQ1CkNZIaTrx+cz
	 ohA2zVRzyNo8lZ0CP2kSF1bUtjwopFUBSZ3wD/AO4g2nacElQRRgkEfSvmtupuw6nH
	 XMIg28sQPVwJOCdCoaOD22vAk0aZgpWxg/LaWSOw=
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Jie Zhan <zhanjie9@hisilicon.com>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 4/4] cpufreq: Use policy->min/max init as QoS request
Date: Thu, 28 May 2026 11:09:06 +0200
Message-ID: <20260528090913.2759118-5-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528090913.2759118-1-pierre.gondois@arm.com>
References: <20260528090913.2759118-1-pierre.gondois@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89838-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_NEQ_ENVFROM(0.00)[pierre.gondois@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DFE985EF6E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Consider policy->min/max being set in the driver .init()
callback as a QoS request. Impacted driver are:
- gx-suspmod.c (min)
- cppc-cpufreq.c (min)
- longrun.c (min/max)

Update the documentation accordingly.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 Documentation/cpu-freq/cpu-drivers.rst |  9 +++++++--
 drivers/cpufreq/cpufreq.c              | 12 ++++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/cpu-freq/cpu-drivers.rst b/Documentation/cpu-freq/cpu-drivers.rst
index c5635ac3de547..95e4c513c4533 100644
--- a/Documentation/cpu-freq/cpu-drivers.rst
+++ b/Documentation/cpu-freq/cpu-drivers.rst
@@ -114,8 +114,13 @@ Then, the driver must fill in the following values:
 |policy->cur			    | The current operating frequency of   |
 |				    | this CPU (if appropriate)		   |
 +-----------------------------------+--------------------------------------+
-|policy->min,			    |					   |
-|policy->max,			    |					   |
+|policy->min,			    | The min/max scaling frequency.       |
+|policy->max			    | If set by the driver in ->init(),    |
+|				    | used as initial min/max frequency    |
+|				    | QoS request; otherwise, follow       |
+|				    | the min/max allowed frequency        |
+|				    | the cpufreq driver can set.          |
++-----------------------------------+--------------------------------------+
 |policy->policy and, if necessary,  |					   |
 |policy->governor		    | must contain the "default policy" for|
 |				    | this CPU. A few moments later,       |
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index d75c6739aa780..759e85bf4ba17 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1399,8 +1399,16 @@ static void cpufreq_policy_free(struct cpufreq_policy *policy)
 
 static int cpufreq_policy_init_qos(struct cpufreq_policy *policy)
 {
+	unsigned int min_freq, max_freq;
 	int ret;
 
+	/* Use policy->min/max set by the driver as QoS requests. */
+	min_freq = max(FREQ_QOS_MIN_DEFAULT_VALUE, policy->min);
+	if (policy->max)
+		max_freq = min(FREQ_QOS_MAX_DEFAULT_VALUE, policy->max);
+	else
+		max_freq = FREQ_QOS_MAX_DEFAULT_VALUE;
+
 	if (policy->boost_supported) {
 		ret = freq_qos_add_request(&policy->constraints,
 						&policy->boost_freq_req,
@@ -1411,12 +1419,12 @@ static int cpufreq_policy_init_qos(struct cpufreq_policy *policy)
 	}
 
 	ret = freq_qos_add_request(&policy->constraints, &policy->min_freq_req,
-				   FREQ_QOS_MIN, FREQ_QOS_MIN_DEFAULT_VALUE);
+				   FREQ_QOS_MIN, min_freq);
 	if (ret < 0)
 		return ret;
 
 	ret = freq_qos_add_request(&policy->constraints, &policy->max_freq_req,
-				   FREQ_QOS_MAX, FREQ_QOS_MAX_DEFAULT_VALUE);
+				   FREQ_QOS_MAX, max_freq);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0


