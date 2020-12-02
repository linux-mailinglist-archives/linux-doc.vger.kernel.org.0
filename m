Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B042CC5A7
	for <lists+linux-doc@lfdr.de>; Wed,  2 Dec 2020 19:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389610AbgLBSnj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Dec 2020 13:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389589AbgLBSni (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 13:43:38 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA37EC094253
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 10:42:22 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id g25so1294292wmh.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 10:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pdq1h6Iz7BaS9XHPJecHzTrxzCvHIq7bY+OCaqaUt9I=;
        b=KOEK4s1Ox/QOtxtUNQV6lW8tsX7N/Qz11MQmpxX+mgoAtIqI4ROGadur0j1GvfPZ3S
         qnd7H6icVbP7FDjQA0VS8bb07nR1MeQ9HF9dNdeQKXtjw8SrZGW8CvARHvvIL/pDJYw9
         eub897JAH61yZK0cmDaSunb3DJmizow9dhDher5Z/q5p1VMb022tLjTj1d+6gVWvzGkI
         lV5sPeEzfS+NmliZtrXh/m9lZlnFM4iwGM29uCkyDwzCsWZB16dkh9pbesIly660+TGZ
         JZZN/EW6Xuubk9oqq8U0SFC0cRqU+n2i1xAYFPOjwGtz5rGvLtCOgvpc80RP5Qr2nhJv
         CvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pdq1h6Iz7BaS9XHPJecHzTrxzCvHIq7bY+OCaqaUt9I=;
        b=eeaFG3lzDrb8/ijdvVNcLQ/UCnXqw1ZNkQeLUTMF7FJp5eMHNNsodbgLAzC6GrlH9E
         2DVZIYr1LvFY/YTkRd5ZmHbcAHdGfsRvrMuCl5XXRfVNwHqOa4HBEfbrZy3KQlZ6VQ4C
         6kMs22+YUiciXBXp+rvQq/fWS3dPIpptFVorjmlsnPJIXhUCtyq9VG+I7Sbf2ihzixv+
         4Ui2zKTY5zo8jdoBJh0tEZL7dqmMKOykJMq0bYyUhgHROoogTsXgmT72hrzEW8oJF4WI
         Z5BgQ384WgUKLVJ6YeaEs7k4iNDnu51X1XOm9jego00U6vEmMVcC8y6Ja6gihg6wjyHm
         cxTA==
X-Gm-Message-State: AOAM5329p+2Oas5gudbSTRu1xrL6z+jwXKSoiwQZUWY/p8rKWQalUcjI
        D2G1QZpeOXxYZZoT47hWs6o2LA==
X-Google-Smtp-Source: ABdhPJyAghBSBueIUZyEOdUpBSWInTgxUTJ9HrAjeXaOhO6iHRoqpQZbX/aG+qsqholRHQQrI3MT8A==
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr4470560wme.137.1606934541552;
        Wed, 02 Dec 2020 10:42:21 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id o13sm2912807wmc.44.2020.12.02.10.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 10:42:20 -0800 (PST)
From:   David Brazdil <dbrazdil@google.com>
To:     kvmarm@lists.cs.columbia.edu
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com, David Brazdil <dbrazdil@google.com>
Subject: [PATCH v4 24/26] kvm: arm64: Keep nVHE EL2 vector installed
Date:   Wed,  2 Dec 2020 18:41:20 +0000
Message-Id: <20201202184122.26046-25-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202184122.26046-1-dbrazdil@google.com>
References: <20201202184122.26046-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KVM by default keeps the stub vector installed and installs the nVHE
vector only briefly for init and later on demand. Change this policy
to install the vector at init and then never uninstall it if the kernel
was given the protected KVM command line parameter.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 arch/arm64/kvm/arm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index fda7bfa440d5..5f8776eefe46 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1531,7 +1531,8 @@ static void _kvm_arch_hardware_disable(void *discard)
 
 void kvm_arch_hardware_disable(void)
 {
-	_kvm_arch_hardware_disable(NULL);
+	if (!is_protected_kvm_enabled())
+		_kvm_arch_hardware_disable(NULL);
 }
 
 #ifdef CONFIG_CPU_PM
@@ -1574,11 +1575,13 @@ static struct notifier_block hyp_init_cpu_pm_nb = {
 
 static void __init hyp_cpu_pm_init(void)
 {
-	cpu_pm_register_notifier(&hyp_init_cpu_pm_nb);
+	if (!is_protected_kvm_enabled())
+		cpu_pm_register_notifier(&hyp_init_cpu_pm_nb);
 }
 static void __init hyp_cpu_pm_exit(void)
 {
-	cpu_pm_unregister_notifier(&hyp_init_cpu_pm_nb);
+	if (!is_protected_kvm_enabled())
+		cpu_pm_unregister_notifier(&hyp_init_cpu_pm_nb);
 }
 #else
 static inline void hyp_cpu_pm_init(void)
@@ -1666,7 +1669,8 @@ static int init_subsystems(void)
 	kvm_sys_reg_table_init();
 
 out:
-	on_each_cpu(_kvm_arch_hardware_disable, NULL, 1);
+	if (err || !is_protected_kvm_enabled())
+		on_each_cpu(_kvm_arch_hardware_disable, NULL, 1);
 
 	return err;
 }
-- 
2.29.2.454.gaff20da3a2-goog

