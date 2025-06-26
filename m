Return-Path: <linux-doc+bounces-50876-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBE8AEA7E4
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jun 2025 22:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79EEA17B777
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jun 2025 20:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B96A2FC01B;
	Thu, 26 Jun 2025 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jtMRCbTY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1B2F5317
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 20:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968369; cv=none; b=OXgY8XDwVRcdDoHMRnNaeKo7vzAC4fR6VFS/iEb73qGs+cLE2s0Na4DzBWHmmVv5N5rpb2pQyEQd7YBlT7wcb7+IGpJCCmb0ejR1A95t6ogszlf6EMj9AazXOfVePBd4Jlz5VCvz3w3zT2OFoXrsEYFewIOKaBb1Gz/+ZJxWy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968369; c=relaxed/simple;
	bh=h+qqtPmhoOk7XPMw7Qzu6UvFYPyXxhuY/D/zWZQbWDs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Io/KpV3f8LEH4/i5K+np/180cw8O2yjOCeisZihasF5Omecx5jrwg2TOvuFVOg5RNrnt5jfFj4LhcDAQhJt5kTkh5j1/06CQ0IKfoth68qi3rGgKp4BsPcXmeEp7tLQCeHenC/+nmchKBndxn1yNXcu/2zwCCPygK8T5yptjX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jtMRCbTY; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3df2e89fd03so14616365ab.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968363; x=1751573163; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RE7YbU/rytuy8zxs8P9SeXUwLNfz8JPOxqvhnV3EEjQ=;
        b=jtMRCbTYlr5EtYPJjov6lcOaBMWO2hMWSGIGp818TY4GVcJHBrzOOdYeY3k9J2ScqU
         kfew1GjC93GBXpazvNiRM35EjNqEAax/p1QUnalH7Tsu5MWW/XAiCznTY9t559R5TdOW
         NvJo3vrNgfpEzphSOUTmAKeHPhirIXW03I8hml9wh/ztpQNhiai++RIsC3L6A0TKAtka
         WE3UHszbh2s0FUDBvx9zAxvoh0mafCF9HFqe7pMKE4K3WjSOL8GfySBUh3I30hviP1n5
         n/6S4FwiKlSr7h0EuCWgqabu3GeUfnPS6uwt7VCMnP2llFL2DeoZQthXGbqIGDxW5+kI
         TdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968363; x=1751573163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RE7YbU/rytuy8zxs8P9SeXUwLNfz8JPOxqvhnV3EEjQ=;
        b=eMoBvQWrk9m1kpL2asw6HF7uQqgx6FDnP5bTFENHEo3XR1HqrjeeLu2TVl2sByExDT
         YaM2xRcJnkQFx2eP4ut/Zv+vyiofow645knpxenoRSuFHlPqYuqvxAYGe2u39VF0MRaQ
         BwT90hCv7atVwX5sT5DD19tg7+wbrtW7Ur8z0YoTng59BCYiTseiqq/zSZ/KClA3hiBK
         Y+ond0Lhv8fLFl9avxxQCp1QV+0fq/bU5UHvh4+LK8LHR4pG4cUmsR7wdmDyLbdQEqOT
         1TWN5u+rFLeUZDGzNfQ4VY8J/5QOgNsQl9IlKJKsVEoiWQG5lgHBMsbBs9J2hVS3+uk+
         BNdw==
X-Forwarded-Encrypted: i=1; AJvYcCVcpZ2VEPLcXceo/bmxOqoNyFaQLRCCJAev4QZr781+NWyoc0s8XJO+Hk+L4SN+kw7mXMSkAVyM3rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzogIxcxLalbYVYMZ//SbOn/694sSc4duoSAoVJjPgk/gnk7du0
	vdkNVlnqc6JExJLKIcDG9cdKZgg4DmRBLkvZ1UwP0ReeKwhJ5FJFehdQapmoT67rvmvzkkNpVGE
	nUrXrJmlrbilS5abFBA2/T/Kp0Q==
X-Google-Smtp-Source: AGHT+IFVSmW/JlkCptcGzCVO362c3Cn87QaRlSz6D4Ns1ZpQiarZzlH5o54K21jyXUKriqhtonfUrINv6bCNPdpvpA==
X-Received: from ilbee28.prod.google.com ([2002:a05:6e02:491c:b0:3df:31be:c2e5])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:248e:b0:3df:29c5:2976 with SMTP id e9e14a558f8ab-3df4ab85a5amr11374775ab.14.1750968363583;
 Thu, 26 Jun 2025 13:06:03 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:48 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-13-coltonlewis@google.com>
Subject: [PATCH v3 12/22] KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
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

Because PMXEVTYPER is trapped and PMSELR is not, it is not appropriate
to use the virtual PMSELR register when it could be outdated and lead
to an invalid write. Use the physical register.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 7 ++++++-
 arch/arm64/kvm/sys_regs.c          | 9 +++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index e2057365ba73..1880e426a559 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -72,11 +72,16 @@ static inline u64 read_pmcr(void)
 	return read_sysreg(pmcr_el0);
 }
 
-static inline void write_pmselr(u32 val)
+static inline void write_pmselr(u64 val)
 {
 	write_sysreg(val, pmselr_el0);
 }
 
+static inline u64 read_pmselr(void)
+{
+	return read_sysreg(pmselr_el0);
+}
+
 static inline void write_pmccntr(u64 val)
 {
 	write_sysreg(val, pmccntr_el0);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 49e8e3dcd306..771d73451b9a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1065,14 +1065,19 @@ static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
-	u64 idx, reg;
+	u64 idx, reg, pmselr;
 
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
 	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 1) {
 		/* PMXEVTYPER_EL0 */
-		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, __vcpu_sys_reg(vcpu, PMSELR_EL0));
+		if (kvm_vcpu_pmu_is_partitioned(vcpu))
+			pmselr = read_pmselr();
+		else
+			pmselr = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+
+		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, pmselr);
 		reg = PMEVTYPER0_EL0 + idx;
 	} else if (r->CRn == 14 && (r->CRm & 12) == 12) {
 		idx = ((r->CRm & 3) << 3) | (r->Op2 & 7);
-- 
2.50.0.727.gbf7dc18ff4-goog


