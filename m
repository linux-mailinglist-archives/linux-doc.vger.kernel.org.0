Return-Path: <linux-doc+bounces-41104-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE26A65A49
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 18:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9A919A0199
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 17:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097892063C2;
	Mon, 17 Mar 2025 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xjlWxnSL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07421205504
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231312; cv=none; b=YtOK+agpdD+DEs9mrPNLYn9XUesRGEm6bBlhIXXyf6sRvtqOLyB0urrFgsx78+3HP3uCrOeGDHudnSXSXbn5fH+T0Yx/8FdDAz5jHRovb7LdAp9dF1xkd2B5O4Vmq5L3/O+5sDHgfEpAbRUowLl2ShDtNqnGFajd1XLLgEUNCWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231312; c=relaxed/simple;
	bh=4He7dvOKishM2ucXHkTOK3TfNl17p9VqU9eRpxqFxeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFhwweN/0Nv0wCkJm0ZXZwBi3Jrl6wmmpk6jV5sVbWXkLRV9Jj2wRXOqmZnCsIgW6LDLJxcw+VqE2ifoeJjsIfW/oPcujDZZlq+IcE1ZQMy2wnVrVGTL1UmnjIRs7SZDAO9QtpYsvltIgRHZnnjP4eqK6n/jK5FbWtMfmGvfRGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=xjlWxnSL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso17350645e9.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231308; x=1742836108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8A8Qnnc9KJsjMpibTJNoHdSMni25LFd1e2ExEX8AcE=;
        b=xjlWxnSLh6PdUsNvp3BNdORMZz3Az9IpPa3hSuX1GcrPNJJw6fi8wrqWDDvbmuTxQg
         nfjiRaRmsYBV2SBZSsPMK0Q9G5RFEfE4VimhCdcAAOgt/yPrBpQKiU5FkNj03B7pLgXY
         ARtTOal2PIyExzpb2OhTVW7rWd98Wm3eO4Lt90+jeH/QJzMDAt9NbwEc/2T9xwkaR08p
         iwNwAOc7bmHoSpP4Uv8bTcAv0NfxwKg/I7AyEQFPwY8wEU44z6ckvvy9/Fj5hDLl4wue
         UhaX+fKRQLFF0EZUkxQFpouH9ZXvns8vXhWYLBMd5yr0AdcJ0RvJpIjj4SObCh1zsIG/
         uwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231308; x=1742836108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8A8Qnnc9KJsjMpibTJNoHdSMni25LFd1e2ExEX8AcE=;
        b=K0ebc80n8B3rMi5b/bbRKxGsUOLQryDgcEjSuJ2dYJcTWjI+/7brrJpmnyRHF/ooXI
         hPJmr8HjRmIvh3W9Qn4yqSHhiqaal5Jz8+jYjzJ4AoUu8lG1V9xMSzYIAwBGbuQ2lAUC
         7Z3qJaJNFLjlQzmDb3N9jJXf/q0eBF7cHGYV+diDM4wL0RGP3ERpBQVBMwfGlZeNd8mB
         f62d/U4MfT9GCYEQjS4nMGsLXcOUhLv5W6KIwqnLBGFFQc49fywfNmGw7iZdhQQ2Mo6x
         eSUqTvd0dQENmwFZGhNXQ7a5y9/rKWvuw5ZyctO5hiY2yCYvzt7fM7rW5Xa7yBsDu3Lm
         B/zw==
X-Forwarded-Encrypted: i=1; AJvYcCWC1fyBg9ximN+5VP4zm0qz6G6DyrkHPKTrw0bPYXm+vHFenvHIoF/RONXzjx8TgpVrHRUEHcw8/uc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/tF88rR8BS/kRQSSrFwTeTG/dAmrcm2yagODcxJBtz69mNTZ
	kowoWmDnW+p4bNQqxyNBy7EvSLdApQ1qL5tIYx0vkuTJQ1DgFBGfzlqvu9/0T18=
X-Gm-Gg: ASbGncuAypXIR5iVUhpF+DFdA4gQI+g+9cuzd0S4rCwIil+vdZVMw472ebc3OQAz45W
	6DzDfnM7rfA9uEAN8TpEzbwiakzJ5MwdQCl9M2Z4YC2slhmQ1wKitQ3xVOJgMZ/Cg20M4iS14fG
	id7dkjakfVZ/qiuT6o4ahiZK8LVh4Vedjvp3ADO2rTtn0STB8FvIjKirfdHRPxkW8aJ7+YjPhOt
	RwlfpS7OhgvNpMMKHKSQzgzqFfgwjMAR1lo1C+/0Y+Tjmnf5AfV/REd31Y799Xfqpdxcp8aZ4oA
	N2CRZuW6MiltnrVhJc+VNfhWDuQkgCrg41lOWAUpJUS8fg==
X-Google-Smtp-Source: AGHT+IGdYqlnvEy/PawZt8Sx5CxSE5paeIGe9C/m17bEJMfGQaAbMdJsnw0bGmy+W1Inh7nCACydaQ==
X-Received: by 2002:a05:600c:4f0f:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-43d1ec8632dmr150023255e9.15.1742231308146;
        Mon, 17 Mar 2025 10:08:28 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:27 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v4 18/18] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Mon, 17 Mar 2025 18:06:24 +0100
Message-ID: <20250317170625.1142870-19-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
misaligned load/store exceptions. Save and restore it during CPU
load/put.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c          |  3 +++
 arch/riscv/kvm/vcpu_sbi_fwft.c | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 542747e2c7f5..d98e379945c3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -646,6 +646,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	void *nsh;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	vcpu->cpu = -1;
 
@@ -671,6 +672,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 		csr->vstval = nacl_csr_read(nsh, CSR_VSTVAL);
 		csr->hvip = nacl_csr_read(nsh, CSR_HVIP);
 		csr->vsatp = nacl_csr_read(nsh, CSR_VSATP);
+		cfg->hedeleg = nacl_csr_read(nsh, CSR_HEDELEG);
 	} else {
 		csr->vsstatus = csr_read(CSR_VSSTATUS);
 		csr->vsie = csr_read(CSR_VSIE);
@@ -681,6 +683,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 		csr->vstval = csr_read(CSR_VSTVAL);
 		csr->hvip = csr_read(CSR_HVIP);
 		csr->vsatp = csr_read(CSR_VSATP);
+		cfg->hedeleg = csr_read(CSR_HEDELEG);
 	}
 }
 
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 8a7cfe1fe7a7..b0556d66e775 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -14,6 +14,8 @@
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_sbi_fwft.h>
 
+#define MIS_DELEG (BIT_ULL(EXC_LOAD_MISALIGNED) | BIT_ULL(EXC_STORE_MISALIGNED))
+
 struct kvm_sbi_fwft_feature {
 	/**
 	 * @id: Feature ID
@@ -68,7 +70,41 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
+{
+	return misaligned_traps_can_delegate();
+}
+
+static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
+					struct kvm_sbi_fwft_config *conf,
+					unsigned long value)
+{
+	if (value == 1)
+		csr_set(CSR_HEDELEG, MIS_DELEG);
+	else if (value == 0)
+		csr_clear(CSR_HEDELEG, MIS_DELEG);
+	else
+		return SBI_ERR_INVALID_PARAM;
+
+	return SBI_SUCCESS;
+}
+
+static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
+					struct kvm_sbi_fwft_config *conf,
+					unsigned long *value)
+{
+	*value = (csr_read(CSR_HEDELEG) & MIS_DELEG) != 0;
+
+	return SBI_SUCCESS;
+}
+
 static const struct kvm_sbi_fwft_feature features[] = {
+	{
+		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
+		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
+		.set = kvm_sbi_fwft_set_misaligned_delegation,
+		.get = kvm_sbi_fwft_get_misaligned_delegation,
+	},
 };
 
 static struct kvm_sbi_fwft_config *
-- 
2.47.2


