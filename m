Return-Path: <linux-doc+bounces-443-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F577CC9E6
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 19:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D469E1C20C31
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 17:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E112D030;
	Tue, 17 Oct 2023 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tY8hWhXW"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2A69CA4A
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 17:28:42 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CABA4
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 10:28:40 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7e4745acdso92170417b3.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697563720; x=1698168520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEQCI/+rQGSMqYPlxwooL8qQczaW3MpNtkuPlPW6Iqs=;
        b=tY8hWhXWJPUQx7cW1wkknyyzCtYfPd2U34dh9rFaxeLwc1Nhj3eQj+1yb9rOISbQn6
         C1GAkTfVbbMsZV/B0H/qmtOoAcqgzom07LM+G8MPX0ZQdeKrpdW2toUPeUC+SVjNvRgP
         4fwYiXl3VIKG/3QN+kRFD+svJu9GwMyxozKZ5p2JG+klgb9jOKH7QFIMzDNjzORbjQOS
         HoqyP9eoUWi/Hq4pRGIEy6T+1fWHC5EKjqWucDKzEyAuiEuri72h+jPdMG/wdvMgve+O
         PGnj+p03qRSAjwUhu5iXvTgQwd3sCcleIPsQwLxKH52+PkDNBc+60YkfCTaAetnBUHMr
         p9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697563720; x=1698168520;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEQCI/+rQGSMqYPlxwooL8qQczaW3MpNtkuPlPW6Iqs=;
        b=njlr3p4r5itlc9ntxAOThgDvFel4x8YAefVD5bfCiOhIqb+c6ApxCm7UGGfI2J8TSI
         4lrH99IKlnx2l01NUYa1C1d6/k8JzQDrMVeEJC3jTXcymwCPUfGxqlpY/qhi8HYik6Wd
         A+3goVkzlL1aw1cXUfCh4WLNGlwPelDGbThEo+/fC4I/EXEn7KmBpm2aWodZ8juZMfyO
         LMEfifDzuWvslU3x7D1RS5wKH1eSRGrYZyAaQy6/0VXPyIdT0RkxFQxljC6aUOrPqKDr
         OchawzrjICtOLAemCFk3mXkP/zPhmKN4pKNy2Uy7e+Hq37QzbOZSWdYpW/hl74hcePmS
         P6nw==
X-Gm-Message-State: AOJu0Ywea4lCK0WIdDWb5zTUeqNv9XgougSFS4wV1+DEa/omIwGEFzuV
	0lY6hXtEFZC8UjSRgtQkHrc8BOyyCR8=
X-Google-Smtp-Source: AGHT+IHy5iS6R0xhgrLgpqCTtWpuLwyL2mejWuez6Mvs9w8hTgJ/pyQSUOqz29xsOpZSSNy6pDolJXGlgwY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d509:0:b0:d9a:42b5:d160 with SMTP id
 r9-20020a25d509000000b00d9a42b5d160mr59329ybe.10.1697563720208; Tue, 17 Oct
 2023 10:28:40 -0700 (PDT)
Date: Tue, 17 Oct 2023 10:28:38 -0700
In-Reply-To: <20231013070037.512051-1-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231013070037.512051-1-xiaoyao.li@intel.com>
Message-ID: <ZS7ERnnRqs8Fl0ZF@google.com>
Subject: Re: [PATCH] KVM: x86: Use the correct size of struct
 kvm_vcpu_pv_apf_data and fix the documentation
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 13, 2023, Xiaoyao Li wrote:
> The size of struct kvm_vcpu_pv_apf_data is 68 bytes, not 64 bytes.

LOL, the messed up size is downright hilarious.  Not only was the math botched,
but the "enabled" field that pushes the struct beyond a cache line is completely
unnecessary.

AFAICT, KVM (the host side) has *never* read kvm_vcpu_pv_apf_data.enabled, and
the documentation clearly states that enabling is based solely on the bit in the
synthetic MSR.

So rather than update the documentation, what if we fix the goof?  KVM-as-a-host
obviously doesn't enforce anything or consume the size, and changing the header
will only affect guests that are rebuilt against the new header, so there's no
chance of ABI breakage between KVM and its guests.  The only possible breakage
is if some other hypervisor is emulating KVM's async #PF (LOL) and relies on the
guest to set kvm_vcpu_pv_apf_data.enabled.  But (a) I highly doubt such a hypervisor
exists, (b) that would arguably be a violation of KVM's "spec", and (c) the worst
case scenario is that the guest would simply lose async #PF functionality.

> Fix the kvm_gfn_to_hva_cache_init() to use the correct size though KVM
> only touches fist 8 bytes.

This isn't a fix.  There's actually meaningful value in precisely initializing the
cache as it guards against KVM writing into the padding, e.g. this WARN would fire:

	if (WARN_ON_ONCE(len + offset > ghc->len))
		return -EINVAL;

So it's a bit odd, but I would prefer to keep the current behavior of mapping only
the first 8 bytes.

Here's what I'm thinking to clean up the enabled field (compile tested only,
haven't touched the docs other than the obvious removal):

---
 Documentation/virt/kvm/x86/msr.rst   |  1 -
 arch/x86/include/uapi/asm/kvm_para.h |  1 -
 arch/x86/kernel/kvm.c                | 11 ++++++-----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/virt/kvm/x86/msr.rst b/Documentation/virt/kvm/x86/msr.rst
index 9315fc385fb0..f6d70f99a1a7 100644
--- a/Documentation/virt/kvm/x86/msr.rst
+++ b/Documentation/virt/kvm/x86/msr.rst
@@ -204,7 +204,6 @@ data:
 		__u32 token;
 
 		__u8 pad[56];
-		__u32 enabled;
 	  };
 
 	Bits 5-4 of the MSR are reserved and should be zero. Bit 0 is set to 1
diff --git a/arch/x86/include/uapi/asm/kvm_para.h b/arch/x86/include/uapi/asm/kvm_para.h
index 6e64b27b2c1e..605899594ebb 100644
--- a/arch/x86/include/uapi/asm/kvm_para.h
+++ b/arch/x86/include/uapi/asm/kvm_para.h
@@ -142,7 +142,6 @@ struct kvm_vcpu_pv_apf_data {
 	__u32 token;
 
 	__u8 pad[56];
-	__u32 enabled;
 };
 
 #define KVM_PV_EOI_BIT 0
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index b8ab9ee5896c..2cd5f8d248a5 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -65,6 +65,7 @@ static int __init parse_no_stealacc(char *arg)
 
 early_param("no-steal-acc", parse_no_stealacc);
 
+static DEFINE_PER_CPU_READ_MOSTLY(bool, async_pf_enabled);
 static DEFINE_PER_CPU_DECRYPTED(struct kvm_vcpu_pv_apf_data, apf_reason) __aligned(64);
 DEFINE_PER_CPU_DECRYPTED(struct kvm_steal_time, steal_time) __aligned(64) __visible;
 static int has_steal_clock = 0;
@@ -244,7 +245,7 @@ noinstr u32 kvm_read_and_reset_apf_flags(void)
 {
 	u32 flags = 0;
 
-	if (__this_cpu_read(apf_reason.enabled)) {
+	if (__this_cpu_read(async_pf_enabled)) {
 		flags = __this_cpu_read(apf_reason.flags);
 		__this_cpu_write(apf_reason.flags, 0);
 	}
@@ -295,7 +296,7 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_kvm_asyncpf_interrupt)
 
 	inc_irq_stat(irq_hv_callback_count);
 
-	if (__this_cpu_read(apf_reason.enabled)) {
+	if (__this_cpu_read(async_pf_enabled)) {
 		token = __this_cpu_read(apf_reason.token);
 		kvm_async_pf_task_wake(token);
 		__this_cpu_write(apf_reason.token, 0);
@@ -362,7 +363,7 @@ static void kvm_guest_cpu_init(void)
 		wrmsrl(MSR_KVM_ASYNC_PF_INT, HYPERVISOR_CALLBACK_VECTOR);
 
 		wrmsrl(MSR_KVM_ASYNC_PF_EN, pa);
-		__this_cpu_write(apf_reason.enabled, 1);
+		__this_cpu_write(async_pf_enabled, true);
 		pr_debug("setup async PF for cpu %d\n", smp_processor_id());
 	}
 
@@ -383,11 +384,11 @@ static void kvm_guest_cpu_init(void)
 
 static void kvm_pv_disable_apf(void)
 {
-	if (!__this_cpu_read(apf_reason.enabled))
+	if (!__this_cpu_read(async_pf_enabled))
 		return;
 
 	wrmsrl(MSR_KVM_ASYNC_PF_EN, 0);
-	__this_cpu_write(apf_reason.enabled, 0);
+	__this_cpu_write(async_pf_enabled, false);
 
 	pr_debug("disable async PF for cpu %d\n", smp_processor_id());
 }

base-commit: 437bba5ad2bba00c2056c896753a32edf80860cc
-- 


