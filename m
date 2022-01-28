Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1365149F1C8
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jan 2022 04:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345726AbiA1DZa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jan 2022 22:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345719AbiA1DZa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 22:25:30 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEDEC061748
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 19:25:29 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id u129so9916161oib.4
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 19:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ty87z8mPFCHS0MY8zzrtuvTZ6oO3QjVwryu3eYeSmWE=;
        b=aA4k4kzFiuRhBh0BXgbfcuq9ufCLBzxhy1n0nwDOnZXENDHrVV3z+4G5d/GWGxhcNM
         pMKBbjQ5jFw18zS67w5KowD3E5kf/fEq8XhfTJx89V3aiCZxVVotsCtsqnNxMLte11Zf
         +Kxy/ppfbleRr3MmklXr1SaofYtbx+INtlz5zAPzbHrOiM2so7lpUmN6Y5nh0HfwpIli
         n9VqUgU9ftpDJg5XbaLIuJs8cuvmPTFA9fRLAwicE2mCLRaMinnky3xL+4Q5P6NZ/wuf
         Bcd3aoXHFsfkdpOrjukeRMi8AD/yBy0SmGQPBj25ODZQLQoyM+8SqEzlFhlOQ+sxDQmw
         Ikng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ty87z8mPFCHS0MY8zzrtuvTZ6oO3QjVwryu3eYeSmWE=;
        b=hBakhmz1xMO3hwq27cMyW/tx9DpvnwPKnm+0TQPg+e/RUbnn7o3p3jVqGWVsAe9L0T
         3gGbor4K2tVMvmz0Sqj40TDCSOJTQ1zCDHq2wnc1rwpfxi+adyFlsTiDibcc6DJRr0LR
         9ICi9ollfw4zKJBAlb6/F2LaAzrasFGbl7v9HB3rgQq6McSYbvReXhLnP57VtogMholH
         GbQVR2ddaL/JyaySFpD0Dt2xtqcqVGOr3Wj5iwFki/Qux2OJuZaoAAAfiS412B1NIvC/
         vrHkYtVLl39AT33Yd8gvaJ8l5Q9NDDqiGzN4wYP52LRJGcKQWOpV6VQf68YYLb0t2Hze
         pAMw==
X-Gm-Message-State: AOAM533mfmlUVBuN4/MoPxQOFTIyFVOlffElqIKYUbI3x9//sB4ipxjZ
        NTrZoQ9xWgD6Oaau5pIjpbxGVQ==
X-Google-Smtp-Source: ABdhPJw9dlFq8qPZGHIulSa2/+LOOD2gAlQuQmCu96B//4BKOIXSHLybARCtI4aZqIubJ3AWVEq1OQ==
X-Received: by 2002:aca:a88f:: with SMTP id r137mr4169824oie.51.1643340329274;
        Thu, 27 Jan 2022 19:25:29 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l63sm5447242oia.2.2022.01.27.19.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 19:25:28 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] cpufreq: Reintroduce ready() callback
Date:   Thu, 27 Jan 2022 19:25:53 -0800
Message-Id: <20220128032554.155132-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This effectively revert '4bf8e582119e ("cpufreq: Remove ready()
callback")' (except the Chinese translation), in order to reintroduce
the ready callback.

This is needed in order to be able to leave the thermal pressure
interrupts in the Qualcomm CPUfreq driver disabled during
initialization, so that it doesn't fire while related_cpus are still 0.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 Documentation/cpu-freq/cpu-drivers.rst | 3 +++
 drivers/cpufreq/cpufreq.c              | 4 ++++
 include/linux/cpufreq.h                | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/Documentation/cpu-freq/cpu-drivers.rst b/Documentation/cpu-freq/cpu-drivers.rst
index 3b32336a7803..d84ededb66f9 100644
--- a/Documentation/cpu-freq/cpu-drivers.rst
+++ b/Documentation/cpu-freq/cpu-drivers.rst
@@ -75,6 +75,9 @@ And optionally
  .resume - A pointer to a per-policy resume function which is called
  with interrupts disabled and _before_ the governor is started again.
 
+ .ready - A pointer to a per-policy ready function which is called after
+ the policy is fully initialized.
+
  .attr - A pointer to a NULL-terminated list of "struct freq_attr" which
  allow to export values to sysfs.
 
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index b8d95536ee22..80f535cc8a75 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1518,6 +1518,10 @@ static int cpufreq_online(unsigned int cpu)
 
 	kobject_uevent(&policy->kobj, KOBJ_ADD);
 
+	/* Callback for handling stuff after policy is ready */
+	if (cpufreq_driver->ready)
+		cpufreq_driver->ready(policy);
+
 	if (cpufreq_thermal_control_enabled(cpufreq_driver))
 		policy->cdev = of_cpufreq_cooling_register(policy);
 
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 1ab29e61b078..3522a272b74d 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -382,6 +382,9 @@ struct cpufreq_driver {
 	int		(*suspend)(struct cpufreq_policy *policy);
 	int		(*resume)(struct cpufreq_policy *policy);
 
+	/* Will be called after the driver is fully initialized */
+	void		(*ready)(struct cpufreq_policy *policy);
+
 	struct freq_attr **attr;
 
 	/* platform specific boost support code */
-- 
2.33.1

