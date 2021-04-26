Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA3C36B03C
	for <lists+linux-doc@lfdr.de>; Mon, 26 Apr 2021 11:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhDZJJq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Apr 2021 05:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232705AbhDZJJF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 05:09:05 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DE6C061574
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 02:08:23 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id m12so18924315pgr.9
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HNdzFDdOgeWXGKXmnjDGLCV9ZQhV0CgleaBxzMVsBew=;
        b=Zu3BggN8BFpvKZGn6qHGXUPTHBTV4x1GkM1zsI4Okx7UF40oT4oF5Pmw6uYulawjjb
         0KlLYFgLhZvaknAJ+/IQfINmmgk96eMHEw89RwtnWU85lDW76coUguECJmDwWTADV7mo
         i8DhqIGQCCJNYmZWbVFxUAd6UsCPsRA4APklA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HNdzFDdOgeWXGKXmnjDGLCV9ZQhV0CgleaBxzMVsBew=;
        b=Q7fPU8YCUTy8zLcvHG9CkrRxuXkJYG0xF/V3GEXJVFewyF6k12HvuBGY/5tyAqx3YE
         s6ooJBUjZnXq0vDYFJGI/binEOW0IfKc87hUx2twTryNzvYMYbVw1GPrMEniWG+saSLW
         EbOFxnulsLLur++lJMeJfwN4bc4WCdPL4QHfCju3A9R8IZ5m1ldkFHPXe2qkXYsMbG+d
         VFNSK7+uwoFFc2CR+VAU3VnG79yh7A/Ar9z7tjSZzsLeO6s4tN0Rz0OJXNEnKg25VGbT
         YjiMP8jO1EJO5/adM2vfJD2AaMYW5Ji0ntL7Xew0vHnYCDrujGXVpu09awGh48sTTNfw
         B1AA==
X-Gm-Message-State: AOAM530aAaw/R+3sFLeKUzU0i/GIzDHtng5dDfBky3YETCqvSFYnKYwF
        5SIjqsz2jVYUDRqDOBuZM6Xw/Q==
X-Google-Smtp-Source: ABdhPJxCIKL4jdEbT9jB4QA6Zvprni9bDSdgXrCbWLLsGOXVPQwykN6qzWsE4gCtmVAhCaRxtGLepA==
X-Received: by 2002:aa7:9046:0:b029:272:3729:e10a with SMTP id n6-20020aa790460000b02902723729e10amr9940066pfo.49.1619428103205;
        Mon, 26 Apr 2021 02:08:23 -0700 (PDT)
Received: from localhost (160.131.236.35.bc.googleusercontent.com. [35.236.131.160])
        by smtp.gmail.com with UTF8SMTPSA id kk9sm12011641pjb.23.2021.04.26.02.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 02:08:22 -0700 (PDT)
From:   Hikaru Nishida <hikalium@chromium.org>
To:     kvm@vger.kernel.org
Cc:     suleiman@google.com, Hikaru Nishida <hikalium@chromium.org>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [RFC PATCH 0/6] x86/kvm: Virtual suspend time injection support
Date:   Mon, 26 Apr 2021 18:06:39 +0900
Message-Id: <20210426090644.2218834-1-hikalium@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi,

This patch series adds virtual suspend time injection support to KVM.

Before this change, if the host goes into suspended state while the
guest is running, the guest will experience a time jump after the host's
resume. This can confuse some services in the guest since they can't
detect if the system went into suspend or not by comparing
CLOCK_BOOTTIME and CLOCK_MONOTONIC.

To solve this problem, we wanted to add a way to adjust the guest clocks
without actually suspending the guests. However, there was no way to
modify a gap between CLOCK_BOOTTIME and CLOCK_MONOTONIC without actually
suspending the guests. Therefore, this series introduce a new struct
called kvm_host_suspend_time to share the suspend time between host and
guest and a mechanism to inject a suspend time to the guest while
keeping
monotonicity of the clocks.

Could you take a look and let me know how we can improve the patches if
they are doing something wrong?

Thanks,

Hikaru Nishida



Hikaru Nishida (6):
  x86/kvm: Reserve KVM_FEATURE_HOST_SUSPEND_TIME and
    MSR_KVM_HOST_SUSPEND_TIME
  x86/kvm: Add a struct and constants for virtual suspend time injection
  x86/kvm: Add CONFIG_KVM_VIRT_SUSPEND_TIMING
  x86/kvm: Add a host side support for virtual suspend time injection
  x86/kvm: Add CONFIG_KVM_VIRT_SUSPEND_TIMING_GUEST
  x86/kvm: Add a guest side support for virtual suspend time injection

 Documentation/virt/kvm/cpuid.rst     |  3 +
 Documentation/virt/kvm/msr.rst       | 29 +++++++++
 arch/x86/Kconfig                     | 13 ++++
 arch/x86/include/asm/kvm_host.h      |  5 ++
 arch/x86/include/asm/kvm_para.h      |  9 +++
 arch/x86/include/uapi/asm/kvm_para.h |  6 ++
 arch/x86/kernel/kvmclock.c           | 25 ++++++++
 arch/x86/kvm/Kconfig                 | 13 ++++
 arch/x86/kvm/cpuid.c                 |  4 ++
 arch/x86/kvm/x86.c                   | 89 +++++++++++++++++++++++++++-
 include/linux/kvm_host.h             |  7 +++
 include/linux/timekeeper_internal.h  |  4 ++
 kernel/time/timekeeping.c            | 31 ++++++++++
 13 files changed, 237 insertions(+), 1 deletion(-)

-- 
2.31.1.498.g6c1eba8ee3d-goog

