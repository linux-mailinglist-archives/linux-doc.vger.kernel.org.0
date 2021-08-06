Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628D03E2813
	for <lists+linux-doc@lfdr.de>; Fri,  6 Aug 2021 12:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244856AbhHFKIC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 6 Aug 2021 06:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244840AbhHFKIC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Aug 2021 06:08:02 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A642FC061798
        for <linux-doc@vger.kernel.org>; Fri,  6 Aug 2021 03:07:46 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id z3so6395849plg.8
        for <linux-doc@vger.kernel.org>; Fri, 06 Aug 2021 03:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iyZptw0PZMngUpuqTbhFqAgHUBZ0pdUlUAf/+I6duzw=;
        b=CtVi//qKnyxS/ct/N+YbU6Len9+6aCpNg2+v9ZZ3f6BQCNUzgLxxflvvevFm2Ab1Fd
         oLJMXrHf3u7Ja2HQWCDmmqwZEjlREMGLQa3kIKXMZIxMG70f1F74xjigutP2SR3Zhuif
         6mwlkQwBRksfU6508ZkkZ9Pqs+QiZC5xkIrqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iyZptw0PZMngUpuqTbhFqAgHUBZ0pdUlUAf/+I6duzw=;
        b=M+G6FX1hscgSL/ntcCndu+0RBh0wYZd8zPSFIgDkkenqj1qzMlClbrowIglAuyWOvl
         ZG4a4bBVQF8jpII/UpdC4jjKxc8GlUMQ9zj2O4STblUItbw+3RM2gMLrYRWfTAOvHwPJ
         gRBaegGe+jZVU3PRLAacb40upeN2JHbuFy9eKpfVQ7tV/DvnNKL6zIiuGkAyIcFAg7h/
         /nVRZ9Vo5rB43Zlsq8KbWXN+j0rlhSz2AG6x5amEbK/KQOmoIk1FqVUkOIHxTrAPxxwn
         PVbfL71ccTs8yDwe/3eYQ5bKwT4Toem/SeVEOa4uLeuo+LBr5yRWgFCQIS5xqlmZ1mbO
         yKrQ==
X-Gm-Message-State: AOAM530q/C0LVjO75BfRC1HwT3UqNfALaN9nw61VKFIFerSLO1OkHvFv
        xiRjCyvb/geKfMGH0cwI4q3sgQ==
X-Google-Smtp-Source: ABdhPJwbwyFvqN3dFGM/nqaIm+PPwkZWIqK4YckrFa8pOh7tfwvzrMA8dUeq682X7hqZ3nlMJ4qvZA==
X-Received: by 2002:a17:902:a702:b029:12b:aa0f:d553 with SMTP id w2-20020a170902a702b029012baa0fd553mr8181136plq.3.1628244466238;
        Fri, 06 Aug 2021 03:07:46 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:b731:9e91:71e2:65e7])
        by smtp.gmail.com with UTF8SMTPSA id d17sm9696510pfn.110.2021.08.06.03.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 03:07:45 -0700 (PDT)
From:   Hikaru Nishida <hikalium@chromium.org>
To:     linux-kernel@vger.kernel.org, dme@dme.org, tglx@linutronix.de,
        mlevitsk@redhat.com
Cc:     suleiman@google.com, Hikaru Nishida <hikalium@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [v2 PATCH 1/4] x86/kvm: Reserve KVM_FEATURE_HOST_SUSPEND_TIME and MSR_KVM_HOST_SUSPEND_TIME
Date:   Fri,  6 Aug 2021 19:07:07 +0900
Message-Id: <20210806190607.v2.1.I2a67009253163b8eecf1ae8d050c541d35ac0bd8@changeid>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
In-Reply-To: <20210806100710.2425336-1-hikalium@chromium.org>
References: <20210806100710.2425336-1-hikalium@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

No functional change; just add documentation for
KVM_FEATURE_HOST_SUSPEND_TIME and its corresponding
MSR_KVM_HOST_SUSPEND_TIME to support virtual suspend timing injection in
later patches.

Signed-off-by: Hikaru Nishida <hikalium@chromium.org>
---

 Documentation/virt/kvm/cpuid.rst |  3 +++
 Documentation/virt/kvm/msr.rst   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/virt/kvm/cpuid.rst b/Documentation/virt/kvm/cpuid.rst
index bda3e3e737d7..f17b95b0d943 100644
--- a/Documentation/virt/kvm/cpuid.rst
+++ b/Documentation/virt/kvm/cpuid.rst
@@ -103,6 +103,9 @@ KVM_FEATURE_HC_MAP_GPA_RANGE       16          guest checks this feature bit bef
 KVM_FEATURE_MIGRATION_CONTROL      17          guest checks this feature bit before
                                                using MSR_KVM_MIGRATION_CONTROL
 
+KVM_FEATURE_HOST_SUSPEND_TIME      18          host suspend time information
+                                               is available at msr 0x4b564d09.
+
 KVM_FEATURE_CLOCKSOURCE_STABLE_BIT 24          host will warn if no guest-side
                                                per-cpu warps are expected in
                                                kvmclock
diff --git a/Documentation/virt/kvm/msr.rst b/Documentation/virt/kvm/msr.rst
index 9315fc385fb0..a218a350d0d0 100644
--- a/Documentation/virt/kvm/msr.rst
+++ b/Documentation/virt/kvm/msr.rst
@@ -389,3 +389,33 @@ data:
         guest is communicating page encryption status to the host using the
         ``KVM_HC_MAP_GPA_RANGE`` hypercall, it can set bit 0 in this MSR to
         allow live migration of the guest.
+
+MSR_KVM_HOST_SUSPEND_TIME:
+	0x4b564d09
+
+data:
+	8-byte alignment physical address of a memory area which must be
+	in guest RAM, plus an enable bit in bit 0. This memory is expected to
+	hold a copy of the following structure::
+
+	 struct kvm_suspend_time {
+		__u64   suspend_time_ns;
+	 };
+
+	whose data will be filled in by the hypervisor.
+	If the guest register this structure through the MSR write, the host
+	will stop all the clocks including TSCs observed by the guest during
+	the host's suspension and report the duration of suspend through this
+	structure. The update will be notified through
+	VIRT_SUSPEND_TIMING_VECTOR IRQ. Fields have the following meanings:
+
+	suspend_time_ns:
+		Total number of nanoseconds passed during the host's suspend
+		while the VM is running. This value will be increasing
+		monotonically.
+
+	Note that although MSRs are per-CPU entities, the effect of this
+	particular MSR is global.
+
+	Availability of this MSR must be checked via bit 18 in 0x4000001 cpuid
+	leaf prior to usage.
-- 
2.32.0.605.g8dce9f2422-goog

