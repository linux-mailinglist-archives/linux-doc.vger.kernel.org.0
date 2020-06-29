Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE54920E056
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2020 23:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387956AbgF2UpY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Jun 2020 16:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731575AbgF2TN6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:13:58 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5CDC0147FF
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 01:25:18 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u9so3205574pls.13
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i9Nqhif6ApfXooGjeibxstbXojwGjO9SaXuxe+uQjDQ=;
        b=jD0KhJNTqUUeR6j8mvpYmsiEJ6YBf4Q+GOdLtNpRkaBosp2KwiuK9yUwZ8EHRsFuai
         KYlaB4Q7zIBzB2CxHTakt+snj6JFm0zvArqsimL3CTVwFzg9kFc/0uJX+4EJSMKl78Bc
         YCiIqNCe1diXqPg7c6Mx/WhrlkN/DkzOY8IABTkcpPU92AXSVbkPxz+vgwWZCUWrwHAy
         HHm4m+xOl4bLGpYOv4MdVIYM7y+wGaHXjZXNn0ntnKRUnenNT2W/SkCtEoTHirw+Bicz
         6AptWVdJlrnSBh25JHVXnbv+eT7UEvVvS4o5HLKaQ0MHyTc5UnqrtFjtTGM2izAw55it
         Xx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i9Nqhif6ApfXooGjeibxstbXojwGjO9SaXuxe+uQjDQ=;
        b=Jy0ayK36ypKeuNpgrgf6gzzKB/olcPzudgXXibayQfkLsqjwRmKKl0A746C1CHfoWL
         E5OAZ5TZv66v7az1KmJ705SfkuuFLecYWhwFnMrKjgb4DOxELxGOKQW1NXNjKzdObD5p
         MnC67bGzLLuq8FVcZiYpe9Wxi6QQ4PaV0Lf6V5nlMBO3iCPqvAjBn07oN1J5Q9W+SoYc
         GC6spvpowaTq1nYXEFCRh76NSO9IYmR4If6CjiCIPQHK08G1B6BUsrtAM7BuyIfW9NW7
         z1n7UdovTSFSZoYScjKICcmEE5RZQ6saXOU94kDlRWJ029woGWWFWHYGYDUn/xZpGjwn
         PnHw==
X-Gm-Message-State: AOAM5333Gj66jddTDuiJ81IMkzIi6kfOQJ5RnJAzABDQfvQh6FHWAEoA
        qs33v1bbfvXaaqlnWxG2ZnqzaQ==
X-Google-Smtp-Source: ABdhPJySmY+y/vwIX7ZPHKRcm025SbC8nwl+OHt6zHB9pB5+zOoWeprGva6CTquPpjzuELrjdUDBrw==
X-Received: by 2002:a17:90b:1492:: with SMTP id js18mr8390978pjb.42.1593419118010;
        Mon, 29 Jun 2020 01:25:18 -0700 (PDT)
Received: from localhost ([122.172.127.76])
        by smtp.gmail.com with ESMTPSA id 8sm19048210pja.0.2020.06.29.01.25.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 01:25:17 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel-team@android.com, tkjos@google.com, adharmap@codeaurora.org,
        Quentin Perret <qperret@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V4 3/3] cpufreq: Specify default governor on command line
Date:   Mon, 29 Jun 2020 13:55:00 +0530
Message-Id: <96b6e6ca02b664194ff3e57e1ec768fbc597bf38.1593418662.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1593418662.git.viresh.kumar@linaro.org>
References: <cover.1593418662.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Quentin Perret <qperret@google.com>

Currently, the only way to specify the default CPUfreq governor is via
Kconfig options, which suits users who can build the kernel themselves
perfectly.

However, for those who use a distro-like kernel (such as Android, with
the Generic Kernel Image project), the only way to use a different
default is to boot to userspace, and to then switch using the sysfs
interface. Being able to specify the default governor on the command
line, like is the case for cpuidle, would enable those users to specify
their governor of choice earlier on, and to simplify slighlty the
userspace boot procedure.

To support this use-case, add a kernel command line parameter enabling
to specify a default governor for CPUfreq, which takes precedence over
the builtin default.

This implementation has one notable limitation: the default governor
must be registered before the driver. This is solved for builtin
governors and drivers using appropriate *_initcall() functions. And in
the modular case, this must be reflected as a constraint on the module
loading order.

Signed-off-by: Quentin Perret <qperret@google.com>
[ Viresh: Converted 'default_governor' to a string and parsing it only
	  at initcall level, and several updates to
	  cpufreq_init_policy(). ]
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../admin-guide/kernel-parameters.txt         |  5 +++
 Documentation/admin-guide/pm/cpufreq.rst      |  6 ++--
 drivers/cpufreq/cpufreq.c                     | 31 +++++++++++++------
 3 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb95fad81c79..8deb5a89328a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -703,6 +703,11 @@
 	cpufreq.off=1	[CPU_FREQ]
 			disable the cpufreq sub-system
 
+	cpufreq.default_governor=
+			[CPU_FREQ] Name of the default cpufreq governor or
+			policy to use. This governor must be registered in the
+			kernel before the cpufreq driver probes.
+
 	cpu_init_udelay=N
 			[X86] Delay for N microsec between assert and de-assert
 			of APIC INIT to start processors.  This delay occurs
diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
index 0c74a7784964..368e612145d2 100644
--- a/Documentation/admin-guide/pm/cpufreq.rst
+++ b/Documentation/admin-guide/pm/cpufreq.rst
@@ -147,9 +147,9 @@ CPUs in it.
 
 The next major initialization step for a new policy object is to attach a
 scaling governor to it (to begin with, that is the default scaling governor
-determined by the kernel configuration, but it may be changed later
-via ``sysfs``).  First, a pointer to the new policy object is passed to the
-governor's ``->init()`` callback which is expected to initialize all of the
+determined by the kernel command line or configuration, but it may be changed
+later via ``sysfs``).  First, a pointer to the new policy object is passed to
+the governor's ``->init()`` callback which is expected to initialize all of the
 data structures necessary to handle the given policy and, possibly, to add
 a governor ``sysfs`` interface to it.  Next, the governor is started by
 invoking its ``->start()`` callback.
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index e9e8200a0211..ad94b1d47ddb 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -50,6 +50,8 @@ static LIST_HEAD(cpufreq_governor_list);
 #define for_each_governor(__governor)				\
 	list_for_each_entry(__governor, &cpufreq_governor_list, governor_list)
 
+static char default_governor[CPUFREQ_NAME_LEN];
+
 /**
  * The "cpufreq driver" - the arch- or hardware-dependent low
  * level driver of CPUFreq support, and its spinlock. This lock
@@ -1061,7 +1063,6 @@ __weak struct cpufreq_governor *cpufreq_default_governor(void)
 
 static int cpufreq_init_policy(struct cpufreq_policy *policy)
 {
-	struct cpufreq_governor *def_gov = cpufreq_default_governor();
 	struct cpufreq_governor *gov = NULL;
 	unsigned int pol = CPUFREQ_POLICY_UNKNOWN;
 	int ret;
@@ -1071,21 +1072,27 @@ static int cpufreq_init_policy(struct cpufreq_policy *policy)
 		gov = get_governor(policy->last_governor);
 		if (gov) {
 			pr_debug("Restoring governor %s for cpu %d\n",
-				 policy->governor->name, policy->cpu);
-		} else if (def_gov) {
-			gov = def_gov;
-			__module_get(gov->owner);
+				 gov->name, policy->cpu);
 		} else {
-			return -ENODATA;
+			gov = get_governor(default_governor);
+		}
+
+		if (!gov) {
+			gov = cpufreq_default_governor();
+			if (!gov)
+				return -ENODATA;
+			__module_get(gov->owner);
 		}
+
 	} else {
+
 		/* Use the default policy if there is no last_policy. */
 		if (policy->last_policy) {
 			pol = policy->last_policy;
-		} else if (def_gov) {
-			pol = cpufreq_parse_policy(def_gov->name);
+		} else {
+			pol = cpufreq_parse_policy(default_governor);
 			/*
-			 * In case the default governor is neiter "performance"
+			 * In case the default governor is neither "performance"
 			 * nor "powersave", fall back to the initial policy
 			 * value set by the driver.
 			 */
@@ -2795,13 +2802,19 @@ EXPORT_SYMBOL_GPL(cpufreq_unregister_driver);
 
 static int __init cpufreq_core_init(void)
 {
+	struct cpufreq_governor *gov = cpufreq_default_governor();
+
 	if (cpufreq_disabled())
 		return -ENODEV;
 
 	cpufreq_global_kobject = kobject_create_and_add("cpufreq", &cpu_subsys.dev_root->kobj);
 	BUG_ON(!cpufreq_global_kobject);
 
+	if (!strlen(default_governor))
+		strncpy(default_governor, gov->name, CPUFREQ_NAME_LEN);
+
 	return 0;
 }
 module_param(off, int, 0444);
+module_param_string(default_governor, default_governor, CPUFREQ_NAME_LEN, 0444);
 core_initcall(cpufreq_core_init);
-- 
2.25.0.rc1.19.g042ed3e048af

