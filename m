Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1916D153B
	for <lists+linux-doc@lfdr.de>; Fri, 31 Mar 2023 03:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjCaBpX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Mar 2023 21:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjCaBpS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 21:45:18 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A02B18F89
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 18:45:01 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5458201ab8cso208899907b3.23
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 18:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680227097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mcnJNCHDCGQ7Pzom/y/MQEMC0VEcznZRpNuHkAP16dM=;
        b=M/Dq0K05dn7RZdEyBco1zZW8o9aWbWD0tOGYp2aROenD9B8zG0YkXNU+ypXcmNaQHy
         4te0VdM4kG75aRgDJAiNeipUhfEk+8e/2sx5TS12tTIKnwevTbmQxo+lHWm8c4GqVIme
         9obizM0C3ozNmYHsi7lUhQIGaKT/Br4nuLulq8WoaCHOkuqxJMA1bY+CMXCC0ew5OUZ4
         1jdQ0A+60hb3BK31NK4oiYIATEqSpKYaYoTbaF3+E58KDNOd+GbOm3KRIRxTxJKRucQs
         fJJk6ss0ykBavcFxwDBDlUhiJ9dG27uWdOFRP7shyzkO7Uda44T+RDaamnaXQVhGcf2m
         ufIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680227097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcnJNCHDCGQ7Pzom/y/MQEMC0VEcznZRpNuHkAP16dM=;
        b=uTtL+OBh/CAE6ZI6fo0J17qpc9um22gyq8wlhwWt/cdSp2MeL7hcQhXqjYaUTrP7ZP
         9orDl0B7Qq++K6z8LpM1NSY2hHkyTPqb5UVS93y5yqi/R3+ocsG1hwQ+NjyenviBqqKX
         bCj0UvvQO35JnbolMLZLbbQAr5Ao2VK01ed/ir2sI0hVEgJpEzcn5GKbk8B5JcO0UVuf
         DM7hlPtP0jgaWzLqvb5RIymuwypFt5x+k5NkSgaoyVMvDhowyw/QRJZiJPY+vp5QBCB0
         eeQ9c+nTfBDtzUhWXnhkEJDWW81PG9DWfFGJ/FqBYM+Rgj4dDxYoZCk1VjMx9yNoRckB
         o9Yg==
X-Gm-Message-State: AAQBX9eeHZvwKbPk8oKS5WVpJvzyBNzVxSZ5b2tjMpjyCBGlZ1Y/hFLZ
        cRkgSiG9wDbVhg9VBw4BqxJfA2gImnMH
X-Google-Smtp-Source: AKy350Yd56UldAkJl7asDkNCi90KnSNtQkBy2kVHq8vFVuOOr9KiBt3/jvgItL1ugb+qYv+7kMO0tDmyjIK9
X-Received: from davidai2.mtv.corp.google.com ([2620:15c:211:201:c162:24e8:ec5e:d520])
 (user=davidai job=sendgmr) by 2002:a25:344:0:b0:b27:4632:f651 with SMTP id
 65-20020a250344000000b00b274632f651mr12517637ybd.3.1680227097054; Thu, 30 Mar
 2023 18:44:57 -0700 (PDT)
Date:   Thu, 30 Mar 2023 18:43:49 -0700
In-Reply-To: <20230331014356.1033759-1-davidai@google.com>
Mime-Version: 1.0
References: <20230331014356.1033759-1-davidai@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331014356.1033759-6-davidai@google.com>
Subject: [RFC PATCH v2 5/6] dt-bindings: cpufreq: add bindings for virtual kvm cpufreq
From:   David Dai <davidai@google.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        David Dai <davidai@google.com>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add devicetree bindings for a virtual kvm cpufreq driver.

Co-developed-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: David Dai <davidai@google.com>
---
 .../bindings/cpufreq/cpufreq-virtual-kvm.yaml | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-virtual-kvm.yaml

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-virtual-kvm.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-virtual-kvm.yaml
new file mode 100644
index 000000000000..31e64558a7f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-virtual-kvm.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cpufreq/cpufreq-virtual-kvm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtual KVM CPUFreq
+
+maintainers:
+  - David Dai <davidai@google.com>
+
+description: |
+
+  KVM CPUFreq is a virtualized driver in guest kernels that sends utilization
+  of its vCPUs as a hint to the host. The host uses hint to schedule vCPU
+  threads and select CPU frequency. It enables accurate Per-Entity Load
+  Tracking for tasks running in the guest by querying host CPU frequency
+  unless a virtualized FIE exists(Like AMUs).
+
+properties:
+  compatible:
+    const: virtual,kvm-cpufreq
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      cpufreq {
+            compatible = "virtual,kvm-cpufreq";
+      };
+
+    };
-- 
2.40.0.348.gf938b09366-goog

