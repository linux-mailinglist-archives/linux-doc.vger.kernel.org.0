Return-Path: <linux-doc+bounces-47955-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3301ACBB8D
	for <lists+linux-doc@lfdr.de>; Mon,  2 Jun 2025 21:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AFD816E82D
	for <lists+linux-doc@lfdr.de>; Mon,  2 Jun 2025 19:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6E722A1D5;
	Mon,  2 Jun 2025 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dWjPA7Mv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f74.google.com (mail-oa1-f74.google.com [209.85.160.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A21221FD0
	for <linux-doc@vger.kernel.org>; Mon,  2 Jun 2025 19:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892542; cv=none; b=eLCJWh95xcf30GqRK0JO7+GA9UoWJzp1dYgyYR+Waw1Y5waP//fTAzNa4F5a0CrP4kdi365KYSD+2kAJUorTi5E8P+Bbno62TSE5T0fX+UuwsOyEeCfg2eAFNtgbYX1jl9+vVhbpxOe95B9gQB3rEmWFm6yrcHZrqHiWoiZ9v4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892542; c=relaxed/simple;
	bh=UpyLhDgeST+9yjPTPNbtC0GB4N1QHxuH3tcvChyIfWE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iYTCo03hQBJthM6VoClpwneGO0bWQy+VkDbFF+f4Nx2/H2Kttd419etOuVSdN3a1+K1fSqw1NoG5wt7EqibNSjD3mwY4QGqm5rWwMc7OMqMlqGyMweLyUJe6Uc+6lrhg+fPrIo7hsh9f5Tndu4HWzZFKjeQa0lmlHE0dT71/kWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dWjPA7Mv; arc=none smtp.client-ip=209.85.160.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-oa1-f74.google.com with SMTP id 586e51a60fabf-2e990e17650so526787fac.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Jun 2025 12:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892538; x=1749497338; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgwK7stiipaBbElK9ZH8eFt+KmwsSimSmMPY4y4bpeQ=;
        b=dWjPA7MvaOHSJe1kYu0WU0y08mojxXXNrP2WK0ZIjspQXsn1gjAWI5X8asaKmXo29f
         5Js7A9y8noxsW423wRSz36mjn8W/SvOVjBAtCs10cFsOyRYQh/QIFqdfo0tmNb0lfFe/
         hwQKs6cumge2DX+sNsYtGgPY4x6XHmweccz8EnFEMvlKYdxqE1FBIcJXufC03NCDsWAl
         6eWK1P/80DIjVhdNeEQglmGzUy4RonP+ydFCzQx/zek0WbVljaWTNXPkr6TvUAIKIPu7
         QhnYwsM+8Ub9XrWnTKvoqdof/HD8I55gdnAZQhL+ioVM33katWIl2v0sBqVUFtOS/wB+
         zRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892538; x=1749497338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgwK7stiipaBbElK9ZH8eFt+KmwsSimSmMPY4y4bpeQ=;
        b=Rsx5sFrhk6otYap2Ur/0bO7XEX9flhrXtOnKoiWMJdfHnxeGJDG4PaNYtFBRa17KtB
         jEiKZO1vDLhbmx6xQNLDBGJvQkpuP81UZ4wFSwSYdyayKcq5kscH7Eu7jvDZLZwAJbW1
         2cl6kL97RtJ2DNiq1GSBo/4E12aAZyXDXm05sJX/Uabpku/MgiBPM8E4w/GiW3+4gDCe
         j6Lc701IkOcgzY+yNCaiXB1Y6NFr35S5mjW1ODlILWkEQ5k5bFO2bIbTVylP2pG6sI5g
         1OtX5W9pyM0ycV+Ri4WhJEr2142TXo+VHlDD3/gBoyozhnRVLL7rIw3N1GKgI8iR+hP8
         fuHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8xYWujFJPHdQbC1qxLi9EEBwLp+zdzKi8dmGrlFPkg/iUGiAvT3oxFS/fpg3WAQQGenhATTMVu8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YziFccOiS4ewvq5eRhR+XK0Yc4NHH96tgjpXe64rDpnyLkr24BH
	ZjdQ7Ay29Y7/ijh6FaeTFIQER//J1tybksnVS9HeeFeOXkvm+Dt+DwgFcWbxm1SUuDeMrV934c9
	7EwqWadox+CVIcWm7aC7PvN2pag==
X-Google-Smtp-Source: AGHT+IHY5orLOMss72/ttOtRz18RgR7Q6GomVkN3UzZeAOQY/fszGrZVl+8B2BDQNOJ4jWTDkgrOBQQZ8Rc/ZsDHgg==
X-Received: from oabgs11.prod.google.com ([2002:a05:6870:ab8b:b0:2c1:5c70:acac])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:b1cc:b0:2d8:5015:1a8f with SMTP id 586e51a60fabf-2e94881808fmr4931862fac.7.1748892538177;
 Mon, 02 Jun 2025 12:28:58 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:46 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-2-coltonlewis@google.com>
Subject: [PATCH 01/17] arm64: cpufeature: Add cpucap for HPMN0
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

Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
counters reserved for the guest.

This required changing HPMN0 to an UnsignedEnum in tools/sysreg
because otherwise not all the appropriate macros are generated to add
it to arm64_cpu_capabilities_arm64_features.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kernel/cpufeature.c | 8 ++++++++
 arch/arm64/tools/cpucaps       | 1 +
 arch/arm64/tools/sysreg        | 6 +++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index a3da020f1d1c..578eea321a60 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -541,6 +541,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
@@ -2884,6 +2885,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
 	},
+	{
+		.desc = "Hypervisor PMU Partitioning 0 Guest Counters",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_HPMN0,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
+	},
 #ifdef CONFIG_ARM64_SME
 	{
 		.desc = "Scalable Matrix Extension",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 10effd4cff6b..5b196ba21629 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -39,6 +39,7 @@ HAS_GIC_CPUIF_SYSREGS
 HAS_GIC_PRIO_MASKING
 HAS_GIC_PRIO_RELAXED_SYNC
 HAS_HCR_NV1
+HAS_HPMN0
 HAS_HCX
 HAS_LDAPR
 HAS_LPA2
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..d29742481754 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1531,9 +1531,9 @@ EndEnum
 EndSysreg
 
 Sysreg	ID_AA64DFR0_EL1	3	0	0	5	0
-Enum	63:60	HPMN0
-	0b0000	UNPREDICTABLE
-	0b0001	DEF
+UnsignedEnum	63:60	HPMN0
+	0b0000	NI
+	0b0001	IMP
 EndEnum
 UnsignedEnum	59:56	ExtTrcBuff
 	0b0000	NI
-- 
2.49.0.1204.g71687c7c1d-goog


