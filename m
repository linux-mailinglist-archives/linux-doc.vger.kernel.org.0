Return-Path: <linux-doc+bounces-40404-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E922BA5999E
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 16:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4625F188B709
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 15:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C737723370F;
	Mon, 10 Mar 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aCUsNWE4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D765022DFE5
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619704; cv=none; b=ZGt8n508jbUb408Yub714/CepRZPFztDa3XFqraRgFgyZ6opks1CrVSBEzdgrwgqfBWsc04+emcJZy4oRPJoZ6iVow/LlifuFhpfVu+ZFrDPLtMvZ5tBotm+h/UMHjLoJ9OzKnriOeuaCxFUZKbZVC4IjHuJ+wEimwl2mPkOn4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619704; c=relaxed/simple;
	bh=OumzHOvvtu3QMkazrSo0lmLwyWtJQVbysLsPBCM8uXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pWS2XvOM3RXVcTvQpFq/rBBqz3tPl2QYlFm1/lLz7SnY1QFvdilVoft5IQnnLG+Nw7251d8NkVFtIo18vpkqjJ3axARum5GLEdr+0vhX+QZpwTCd+M8R2ihztpoDnSy9LLsz6/6dL4gqa+LOqvvucYTf9Ro/yQSXoxieRkXtwss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aCUsNWE4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22359001f1aso105598915ad.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619702; x=1742224502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOd2k9Vwz3oIUDtJN/qvQUzpTwasFoa+EjUHjoptxP4=;
        b=aCUsNWE4Jiq1b9kt7zr+qBpkNIFRBemBcvSr4SwVSNdcbDKhDC8YPoj7l2Oc3I8hbV
         w97ayyxcS4U7f6+9KllPtvQJCWo2Z00jvJ4EAoQyQpxvVDgXW9bjIw9JRICF/RFiJ4fP
         EEPXKy9EB+B7tiOG3zugNmEy4yIuPOkVuSqvUdPJqYqTeQL7zqzYTL86uCp0Hu0PdSBV
         bqPxRtI5LnSR6Qq3meen8ckuVwgz5qzU563WoE+Vq4AJinTQrK47fw3oyHKsgxPYKW8s
         fhH/5hMFx9E3AkvjgnTzof/FsMaM6jmMWcJzHCCmkrY3QUzxgJ+oJdNkxmO//mafVnDU
         zmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619702; x=1742224502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOd2k9Vwz3oIUDtJN/qvQUzpTwasFoa+EjUHjoptxP4=;
        b=vLS7c0XjUIafBqgoq7FxFq6Kn+s4CNl2MFNLVosioOeD5ZjORT+xMiiGRsGPb8E5mD
         rXrBICoeFe446jXSeMxeK07LGB4333he4TPCAzTAcQ0jstWqV4W5yKxSbQRL067UlR65
         /I/FSIiNKCSDG+UlsDfOIk1bMaSqtCwJxHHHqlJlKCllxFc2wBXBVvBIQ98c5JViCXi0
         RePRlIXA/zGRD3h/yh9dvnaZI06nAYfGqgGXZ+nD93oLmCTTpYZ2/eYXi5XDejjllk0M
         CerEQlR+d1cgQ/HbWHUAKOFaTjF63RWoCjzCTcKkZPpaxo9FMlgZB4q2P4OOcsalP2HN
         7/wA==
X-Forwarded-Encrypted: i=1; AJvYcCWq4K3T86Q2Adu2G+71tfMeDQWUZRjccMzM9Fm6vmPWLjXVT1Zu7fZgn+w1XWG456l3NCePhkjw0O8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6U9urZ6oXk3XBodR6eETGh/JERdiGe5+ectcO8lC5VjRJGZEt
	CqnfspZCvOYGc2y6lKYTSz7Y3C49gaZV6vtLDNk5LYhBEl5CPpxCNTQRS3qnrI4=
X-Gm-Gg: ASbGncv2E8egnLwlvc37gxR1KJzXRah+Ad44DSncZZlAVzxyaZUW5oEfZ2wFoNPtbMM
	W/nL0oqIlji1DvO9uECCxd6vr9LIccY923bGdGj2ytNSPkubBB1cdMYyI2Qit42+gSK8Vt6lsBr
	jWNYCtI/drfSY42NlyqVpj3HGzLkMOC4h8eTlUn2ofrPYGagCj1Jzicie7APlCuS4WpnT0U8iy+
	P53ymL9Rsgu5wvBp/bpspw61LEN/M7Ik4nwFVfo8MruLyTw22ysAb0TfQeffRlcraGNJTyv09h0
	d/qfxZJrp4FdFaKB14Koe+Vr39voRRhONownA8ABgYsFhw==
X-Google-Smtp-Source: AGHT+IHzT9d4a2eYINgey0kceBibGso0f5earoCP/lcsD5F2ll8sbD9jFU+xJVsySTd/60DzZCpM3Q==
X-Received: by 2002:a17:903:40cb:b0:215:9642:4d7a with SMTP id d9443c01a7336-22428407b19mr226412835ad.0.1741619701896;
        Mon, 10 Mar 2025 08:15:01 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:15:01 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 16/17] RISC-V: KVM: add support for FWFT SBI extension
Date: Mon, 10 Mar 2025 16:12:23 +0100
Message-ID: <20250310151229.2365992-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add basic infrastructure to support the FWFT extension in KVM.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h          |   4 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h      |   1 +
 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  31 +++
 arch/riscv/include/uapi/asm/kvm.h          |   1 +
 arch/riscv/kvm/Makefile                    |   1 +
 arch/riscv/kvm/vcpu_sbi.c                  |   4 +
 arch/riscv/kvm/vcpu_sbi_fwft.c             | 212 +++++++++++++++++++++
 7 files changed, 254 insertions(+)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
 create mode 100644 arch/riscv/kvm/vcpu_sbi_fwft.c

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index bb93d2995ea2..c0db61ba691a 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -19,6 +19,7 @@
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_insn.h>
 #include <asm/kvm_vcpu_sbi.h>
+#include <asm/kvm_vcpu_sbi_fwft.h>
 #include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_pmu.h>
 
@@ -281,6 +282,9 @@ struct kvm_vcpu_arch {
 	/* Performance monitoring context */
 	struct kvm_pmu pmu_context;
 
+	/* Firmware feature SBI extension context */
+	struct kvm_sbi_fwft fwft_context;
+
 	/* 'static' configurations which are set only once */
 	struct kvm_vcpu_config cfg;
 
diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index cb68b3a57c8f..ffd03fed0c06 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -98,6 +98,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
new file mode 100644
index 000000000000..ec7568e0dc1a
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Rivos Inc.
+ *
+ * Authors:
+ *     Clément Léger <cleger@rivosinc.com>
+ */
+
+#ifndef __KVM_VCPU_RISCV_FWFT_H
+#define __KVM_VCPU_RISCV_FWFT_H
+
+#include <asm/sbi.h>
+
+struct kvm_sbi_fwft_config;
+struct kvm_sbi_fwft_feature;
+struct kvm_vcpu;
+
+struct kvm_sbi_fwft_config {
+	const struct kvm_sbi_fwft_feature *feature;
+	bool supported;
+	unsigned long flags;
+};
+
+/* FWFT data structure per vcpu */
+struct kvm_sbi_fwft {
+	struct kvm_sbi_fwft_config *configs;
+};
+
+#define vcpu_to_fwft(vcpu) (&(vcpu)->arch.fwft_context)
+
+#endif /* !__KVM_VCPU_RISCV_FWFT_H */
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f06bc5efcd79..fa6eee1caf41 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -202,6 +202,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_DBCN,
 	KVM_RISCV_SBI_EXT_STA,
 	KVM_RISCV_SBI_EXT_SUSP,
+	KVM_RISCV_SBI_EXT_FWFT,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 4e0bba91d284..06e2d52a9b88 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -26,6 +26,7 @@ kvm-y += vcpu_onereg.o
 kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
 kvm-y += vcpu_sbi.o
 kvm-y += vcpu_sbi_base.o
+kvm-y += vcpu_sbi_fwft.o
 kvm-y += vcpu_sbi_hsm.o
 kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_sbi_pmu.o
 kvm-y += vcpu_sbi_replace.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 18726096ef44..27f22e98c8f8 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -78,6 +78,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 		.ext_idx = KVM_RISCV_SBI_EXT_STA,
 		.ext_ptr = &vcpu_sbi_ext_sta,
 	},
+	{
+		.ext_idx = KVM_RISCV_SBI_EXT_FWFT,
+		.ext_ptr = &vcpu_sbi_ext_fwft,
+	},
 	{
 		.ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 		.ext_ptr = &vcpu_sbi_ext_experimental,
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
new file mode 100644
index 000000000000..cce1e41d5490
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Rivos Inc.
+ *
+ * Authors:
+ *     Clément Léger <cleger@rivosinc.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/cpufeature.h>
+#include <asm/sbi.h>
+#include <asm/kvm_vcpu_sbi.h>
+#include <asm/kvm_vcpu_sbi_fwft.h>
+
+struct kvm_sbi_fwft_feature {
+	/**
+	 * @id: Feature ID
+	 */
+	enum sbi_fwft_feature_t id;
+
+	/**
+	 * @supported: Check if the feature is supported on the vcpu
+	 *
+	 * This callback is optional, if not provided the feature is assumed to
+	 * be supported
+	 */
+	bool (*supported)(struct kvm_vcpu *vcpu);
+
+	/**
+	 * @set: Set the feature value
+	 *
+	 * This callback is mandatory
+	 */
+	int (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsigned long value);
+
+	/**
+	 * @get: Get the feature current value
+	 *
+	 * This callback is mandatory
+	 */
+	int (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsigned long *value);
+};
+
+static const enum sbi_fwft_feature_t kvm_fwft_defined_features[] = {
+	SBI_FWFT_MISALIGNED_EXC_DELEG,
+	SBI_FWFT_LANDING_PAD,
+	SBI_FWFT_SHADOW_STACK,
+	SBI_FWFT_DOUBLE_TRAP,
+	SBI_FWFT_PTE_AD_HW_UPDATING,
+	SBI_FWFT_POINTER_MASKING_PMLEN,
+};
+
+static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(kvm_fwft_defined_features); i++) {
+		if (kvm_fwft_defined_features[i] == feature)
+			return true;
+	}
+
+	return false;
+}
+
+static const struct kvm_sbi_fwft_feature features[] = {
+};
+
+static struct kvm_sbi_fwft_config *
+kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t feature)
+{
+	int i = 0;
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
+		if (fwft->configs[i].feature->id == feature)
+			return &fwft->configs[i];
+	}
+
+	return NULL;
+}
+
+static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
+				struct kvm_sbi_fwft_config **conf)
+{
+	struct kvm_sbi_fwft_config *tconf;
+
+	tconf = kvm_sbi_fwft_get_config(vcpu, feature);
+	if (!tconf) {
+		if (kvm_fwft_is_defined_feature(feature))
+			return SBI_ERR_NOT_SUPPORTED;
+
+		return SBI_ERR_DENIED;
+	}
+
+	if (!tconf->supported)
+		return SBI_ERR_NOT_SUPPORTED;
+
+	*conf = tconf;
+
+	return SBI_SUCCESS;
+}
+
+static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, u32 feature,
+			    unsigned long value, unsigned long flags)
+{
+	int ret;
+	struct kvm_sbi_fwft_config *conf;
+
+	ret = kvm_fwft_get_feature(vcpu, feature, &conf);
+	if (ret)
+		return ret;
+
+	if ((flags & ~SBI_FWFT_SET_FLAG_LOCK) != 0)
+		return SBI_ERR_INVALID_PARAM;
+
+	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
+		return SBI_ERR_DENIED_LOCKED;
+
+	conf->flags = flags;
+
+	return conf->feature->set(vcpu, conf, value);
+}
+
+static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
+			    unsigned long *value)
+{
+	int ret;
+	struct kvm_sbi_fwft_config *conf;
+
+	ret = kvm_fwft_get_feature(vcpu, feature, &conf);
+	if (ret)
+		return ret;
+
+	return conf->feature->get(vcpu, conf, value);
+}
+
+static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				    struct kvm_vcpu_sbi_return *retdata)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long funcid = cp->a6;
+
+	switch (funcid) {
+	case SBI_EXT_FWFT_SET:
+		ret = kvm_sbi_fwft_set(vcpu, cp->a0, cp->a1, cp->a2);
+		break;
+	case SBI_EXT_FWFT_GET:
+		ret = kvm_sbi_fwft_get(vcpu, cp->a0, &retdata->out_val);
+		break;
+	default:
+		ret = SBI_ERR_NOT_SUPPORTED;
+		break;
+	}
+
+	retdata->err_val = ret;
+
+	return 0;
+}
+
+static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	const struct kvm_sbi_fwft_feature *feature;
+	struct kvm_sbi_fwft_config *conf;
+	int i;
+
+	fwft->configs = kcalloc(ARRAY_SIZE(features), sizeof(struct kvm_sbi_fwft_config),
+				GFP_KERNEL);
+	if (!fwft->configs)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
+		feature = &features[i];
+		conf = &fwft->configs[i];
+		if (feature->supported)
+			conf->supported = feature->supported(vcpu);
+		else
+			conf->supported = true;
+
+		conf->feature = feature;
+	}
+
+	return 0;
+}
+
+static void kvm_sbi_ext_fwft_deinit(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+
+	kfree(fwft->configs);
+}
+
+static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
+{
+	int i = 0;
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+
+	for (i = 0; i < ARRAY_SIZE(features); i++)
+		fwft->configs[i].flags = 0;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
+	.extid_start = SBI_EXT_FWFT,
+	.extid_end = SBI_EXT_FWFT,
+	.handler = kvm_sbi_ext_fwft_handler,
+	.init = kvm_sbi_ext_fwft_init,
+	.deinit = kvm_sbi_ext_fwft_deinit,
+	.reset = kvm_sbi_ext_fwft_reset,
+};
-- 
2.47.2


