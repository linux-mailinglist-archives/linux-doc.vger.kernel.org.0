Return-Path: <linux-doc+bounces-50874-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D4FAEA7D9
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jun 2025 22:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A91C1C4577C
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jun 2025 20:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367F62FA642;
	Thu, 26 Jun 2025 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1X+FQOqf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACED2F4A1F
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968367; cv=none; b=nL7oOV4WLdDxxBXvtlGWct5SV3liVw55p0jAfEtfwleMy1Y/N/zN/ZmLCm9SG6uQDJxUiR3GpviKIWgwQxNwKjUpUQ5z+t1IvDOdg7EwP83Y6Z6FhPoKyYrQIpZRw6CO2GGWFjQTXKcycS5wXT2gaSUsnzXvjDyhokYBHq4TDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968367; c=relaxed/simple;
	bh=OXBsuzgQqKeH4go9scl3J2sCFEoZvJBcvtYLhQxD4UM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e59sC5FsBjnoz3Q1OJ7zaqY5WN+RZ32z808hU5zfLlVCNL3oM6lKnZiOrVGrQJNWJNPRKI88QmHLTgYx8MNJjekGN8u8gP37B0djTjyrnSELOWbQJF0lnb9OrX/865IfOyot2jZg4J8cUYV+Im5s0pMz6gQE5DfaETu+wlYG5ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1X+FQOqf; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-86f4f032308so210604439f.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968363; x=1751573163; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OjcjVqcT3PfYTwjN9wXAnWmKWncB0aK3QVDv0kRYNAs=;
        b=1X+FQOqfKvgouuPXQVl+pSvQ/7A9Od9j6N10ykxLJCJwVmnko+4ZHI24nK2V4iKPQj
         1WY2cJIguxoDOmBNP7XKVnPzikBB2PZKAKMPzAAPTJId9tUxEoHholjI1RHRbKXRTFDl
         8LQSYpTnaOb4A4+kpDq8Op9vxx7E97aXBErgQ3pY/E8gPuSvXPj3CP5ZOup0+4QAM9V4
         GcTUE06AW7tQuM1uWiouBQ+eGDJDML0OzhDpF/iXQpXlfxgVI3NBamH1C79DBumJIrXn
         5BRcHDfOjMogsin6EnQXvGAZEa424Ecp7lyISmO8enY0ORanJGAbKoH6gpp3IlpYu0Z1
         rMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968363; x=1751573163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjcjVqcT3PfYTwjN9wXAnWmKWncB0aK3QVDv0kRYNAs=;
        b=N8Gp+qXCwRAUQPO9xvaNx07uTwgH7z10huu3K1kl49Yybodk6qEubSKmVmkdvCidn0
         7O4mqYvocF0xyQt4tl71TsPJoiiDWB/597bI1QHxkb5k8qAIt863Qv9mcZV7qT87BGbN
         Y3PHqQctmZmZxAZTUU+Gf6iFVQf+4tcrXOCu+jYLlBEumhCNtQ137BP+G89riKOL+L4p
         qu7CgLV8GOqrWV2oa500lcLHh8tlque1gGJYjgBxEWYKNcrwFmHxQBWI/lNjFBcQ7gTe
         ZyfgpJdWcd9LmiKfo1lcekkPrF1EnKnTfnxMdQVxbK2qa6IULDofxOgg+Sgp+aDudn7Y
         lQmw==
X-Forwarded-Encrypted: i=1; AJvYcCVpHhdXKJxxul3kCR0498NougKv6WeVny31YlKBjaAUvRMqno/A1V3rnax0CKpr7aSGzWaHbouHegE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS1OwqS1Q2ptyKXK026GPGE/4GAkNqd4HZnDOfC0YgujItFV2f
	IuyA48RbH69L8EUvmJhteUJT+98jsmJ8n63LvbTmj+5z9WdT3o6i4fdHYrMbOZHOIl2ipmrhzxO
	H/m0WWrtxh88EMpv75u/UISzkig==
X-Google-Smtp-Source: AGHT+IFUddqpSua+e1bwkQXI4ID0eoYsJI6Flt9aCdAiBQPdjrY96T7W5A1qLJU1ATtwnMWwgss2F2B6rdL1cwzbcQ==
X-Received: from ilbec6.prod.google.com ([2002:a05:6e02:4706:b0:3df:16fc:af6f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c03:b0:3df:3464:ab86 with SMTP id e9e14a558f8ab-3df4ab61d98mr11788385ab.9.1750968362685;
 Thu, 26 Jun 2025 13:06:02 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:47 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-12-coltonlewis@google.com>
Subject: [PATCH v3 11/22] KVM: arm64: Writethrough trapped PMEVTYPER register
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

With FGT in place, the remaining trapped registers need to be written
through to the underlying physical registers as well as the virtual
ones. Failing to do this means delaying when guest writes take effect.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index eaff6d63ef77..49e8e3dcd306 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -18,6 +18,7 @@
 #include <linux/printk.h>
 #include <linux/uaccess.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
@@ -1037,6 +1038,30 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+				   u64 reg, u64 idx)
+{
+	u64 eventsel;
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+	else
+		eventsel = p->regval & kvm_pmu_evtyper_mask(vcpu->kvm);
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
+		return false;
+
+	__vcpu_assign_sys_reg(vcpu, reg, eventsel);
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		write_pmccfiltr(eventsel);
+	else
+		write_pmevtypern(idx, eventsel);
+
+	return true;
+}
+
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
@@ -1063,7 +1088,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (!pmu_counter_idx_valid(vcpu, idx))
 		return false;
 
-	if (p->is_write) {
+	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
+		writethrough_pmevtyper(vcpu, p, reg, idx);
+	} else if (p->is_write) {
 		kvm_pmu_set_counter_event_type(vcpu, p->regval, idx);
 		kvm_vcpu_pmu_restore_guest(vcpu);
 	} else {
-- 
2.50.0.727.gbf7dc18ff4-goog


