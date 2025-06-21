Return-Path: <linux-doc+bounces-49940-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D15EAE252B
	for <lists+linux-doc@lfdr.de>; Sat, 21 Jun 2025 00:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FB364A4A51
	for <lists+linux-doc@lfdr.de>; Fri, 20 Jun 2025 22:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C23624EAB1;
	Fri, 20 Jun 2025 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z21KhWcP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D0D2512FA
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 22:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457933; cv=none; b=igOq+SfUiSS2R3NWeV46OK3L4QfF0+TTdGLY42vS/L5fgqodmjVRvcC41q6J8BDBYzQ1dFzpGfKYsEMHvBhe6uqoY4lv5HmU1zQEWCL1tgoR1ZGniceFeH6vNBg9VKR5x6EsFwJPe9WIfnRaUjAXogSqVxUi8LuLsJOmVCA3DTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457933; c=relaxed/simple;
	bh=9RsbMC4gKstOTyv5y2QgORYLw5zb7ZTQrMSj9VZtIh4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WGPR1u1ufZ6LYtNtdxekHwumNtyy7QlJw3Hkcg349DiQyelb3EJHOoVLIXSJ5SsJ2/Z0stM95f2NrSMpt/oUo1lZ2Kfi/UqEZcQlz0NuuPYT/XiTEUmLqVFO+VPIXXSHxwYuo7XdFrvKtOgdI8xK0YebO2r0CSQVoXBUAJ5CpZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z21KhWcP; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddc5137992so27491165ab.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 15:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457930; x=1751062730; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vRk6zke2lpK9XGCO0Sj8vZO43QSodRcPYun9h3GVGY=;
        b=z21KhWcP6OWvUOHxu+sQEHvr7e7IyX4i8hAqsCA3B1ZXm78qRBOtzPV1m2xtyBox8f
         fiF4c7OFrO6B69AWqEvgF+GpNlyOIl2OQV2dmlajYuSwn2fbELML46DskSrNqwlASwKm
         MjNhV8g+BDOwjZGI/e6qVm2cuil41sb01mdl8tijhcQRWfM3l8OyOUBwHzb3PrqEWAkI
         H09SRfIyPpDokCpedUnFUg7dwh5lyTdAVjCP61b+suBkoQ0PFsoEzjeNhEAqFTRQu/0P
         rGXzRO3etLYcGI3/FhQMfJTdYxKOcAW6w/WoSbD/DNU4TDTmTruRtYYsB3CbYEj/UD90
         P8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457930; x=1751062730;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vRk6zke2lpK9XGCO0Sj8vZO43QSodRcPYun9h3GVGY=;
        b=lJbQ70YpvNtj7Aqooxel5dX7teB6ftGc4piMAfsIqV8XtHycdxs7yH/q8ghqfTkqrU
         6X7GNlGkVDu2/Ex9VoUQkhD9/BQl6oT1U6v5HqQVVI4FaZDN7jJbb8mY15tV4Ft6nK5l
         efqC/obMzK/puAfLxMNyxU6H86FqLvX+tblRkzQnXgsxiJtyFQSgO9qpxfZX26e9zIAi
         EBT2faBjHcxFSkPjlg6V2Ht8wf1YdgE8wxPBmnxSCXKZmPqiRYZNZEFK0S7camLFdtnx
         eI2LGuAnYJ2C6mtkEg5dbEswBYAjzG3weBXb+afLfsznoWT0Vch/FZTkWbvZQYrUdOcw
         XQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCUygd754HU6Uai+kkO6W5DA5e8j3DJzCktJr7kIPZj8K34hgi1y9cAPI8rkG0D7ng9W+VypowKak5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9dQc0Xcjgc7Wqjll5q0XG2O8OTo1KqAlR6q4u9p0bF49aAINO
	jdsrkDxt9Rri+2qW++yxKge09m+rOF+4YMJUcw9l/2D11PPRdFfNN89ZDUVGjoF30hliQ5x8OlQ
	WD1SZ02ThutHA8HGUVdENp/uy+w==
X-Google-Smtp-Source: AGHT+IEkoSb5VH84QY4nbT8Ifa51AqeoGsCAL340Tv3oIBa14LiCdgJYJOfuore5wja+yy1LW8r/DPYGzutAdJdswQ==
X-Received: from ilbbb11.prod.google.com ([2002:a05:6e02:b:b0:3de:11fe:800c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:17c7:b0:3de:287b:c430 with SMTP id e9e14a558f8ab-3de38c1ba23mr58907475ab.3.1750457929911;
 Fri, 20 Jun 2025 15:18:49 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:13 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-14-coltonlewis@google.com>
Subject: [PATCH v2 12/23] KVM: arm64: Writethrough trapped PMEVTYPER register
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

With FGT in place, the remaining trapped registers need to be written
through to the underlying physical registers as well as the virtual
ones. Failing to do this means delaying when guest writes take effect.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index eaff6d63ef77..3733e3ce8f39 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -18,6 +18,7 @@
 #include <linux/printk.h>
 #include <linux/uaccess.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
@@ -943,6 +944,7 @@ static bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx)
 	u64 pmcr, val;
 
 	pmcr = kvm_vcpu_read_pmcr(vcpu);
+
 	val = FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
 	if (idx >= val && idx != ARMV8_PMU_CYCLE_IDX) {
 		kvm_inject_undefined(vcpu);
@@ -1037,6 +1039,30 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
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
+	__vcpu_sys_reg(vcpu, reg) = eventsel;
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
@@ -1063,7 +1089,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
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
2.50.0.714.g196bf9f422-goog


