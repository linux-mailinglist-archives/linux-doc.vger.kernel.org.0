Return-Path: <linux-doc+bounces-40403-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E56A599A2
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 16:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2D33AAA20
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 15:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1F722D781;
	Mon, 10 Mar 2025 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="svrog805"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7DB22DFB1
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619695; cv=none; b=gYt+TygXCXhPiDD1VyQCWSKI84Pusqo+W302d5SHA3DK16XpTCdermJ4XDA1FiFApg2Gxy+eMsG5aMt2kM6l49gxgLO8E96i7M+YYRrpFzk+nQdFf4+1MMSGOac+tmPmpQ2w2f7D+/kFQxc+yAtVtlhOblFlscNJ1VRo+Xjzzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619695; c=relaxed/simple;
	bh=LeEoRIbji6zEftGWkJUU0mkYKwf/Oshrl9c3/18pJs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CUW5Am78eLN4E9YPeIpdx4++qzHxNcws7Xw95Ie139q7/VMF0EnEtelD7nvKc2qroql+Z7k5QhSeeNU4SdT51hhBrLEAMxDZF3JZiCnrWczYiN3kBpf7DGf5KLWX+Ht0ixz7RF2TZXAV0A29aSO9m19BG3DQGUYI7z7+cHKi8qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=svrog805; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225477548e1so33388085ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619693; x=1742224493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6l++jogwQbkZh7dICu4CyxiXIZKEwQKPb1/RHWWp03A=;
        b=svrog8055eW9BMxPKv1rykQ+uHamPBMxqaO28UMmUYAOegpwKzziJCJZan9ImGUMD4
         SQu+z/kKl3hG5cCzpRVGNsEnnjkSQiJW/AHNmvzT4WdBXYVBEZlxlrJTrAlQyMmp69rm
         H5OA5UJDGmlgHHYvFsS4rKP2He0whf10SH/K0cphv5bp+K8YkVOZfTijH8VavYu2V0c/
         gl3ZQxLpUuRTFGW6MD7paqlJWbpuKlUVjZw/WuWZBBBECC6gTvJPmHWK28wriaAMktEa
         EPmNBg8JoCd1fwo878p90845j6xs7b280G3M94HKH9PQyJIBW3d65N01nYfM4yWAKuTr
         PY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619693; x=1742224493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6l++jogwQbkZh7dICu4CyxiXIZKEwQKPb1/RHWWp03A=;
        b=rKxAJ3I9My0yHhBRyUaIvSOU5ZuZUTAH0eOJaNwhN9E8nbfKK5vYnhir7UQNCx+ciD
         GG+aYxMIBczkUSYSELYoXV5FAr/DQe3FHb10MHw0afR6kdD7JnlHEPBCPJydDp/gi8to
         Io5FXAWDBg1cmLe6oaC/X7M/jVluX4SzQzbwC/7fIiRx36tbz5Nrt/LoJHhVS6xe28F8
         BPNpqUKoYk0kC0+RECJir+ot7Ee0/i2yeOi91ebjN6n5+3GD9yP+ZiL9fjLV0zmsyH7d
         rZ3BvFY1UIdX5BzpkxspBNEUqwcyqj0ty+smgNVUgXIp8j38vlL0T7ZqX6yslxlc2X9f
         G7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJghnqfl/G5x76R/HtuDUCeR5+XscSNkYH3M0L1q108LufCP3oZcsywudu4/c3v4TbbTasjT4TAC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbqNV6pOYcGUirmK1q4p3za8AhbwF81i6b1PB+1+zeoE95GTxY
	CSyGyqk1/dNSZ8DLpYFsKfv0GXWkY51YMeu5C23EU+wOX6aV/870V6K+R6mi6Ak=
X-Gm-Gg: ASbGncuAf1F+5MdWQprSw9ssUbv8cvwYC5Wiy/vGHtMrddBHk1DWdmWUWRLgnlMEDOe
	drGNmROEqpo63zzal0JVB9AAsFWWcnEfWjXBUtfeZMVOcsZgBEMH24gk02DeX7NAeLtNXfjZEzO
	KqaVAOUHxlbEwCW6A2X5gicPoS7kLQEIrxKVyPmnR1c1DnO/3CzyVu1RJEjUi+b2lTUxFvf8yx8
	t6AUP508cDO4K0mOUd/D6y1D03vSP/obhjzLCDVVeRNqUDV4/fQeLlqga8Ive9OpVafsFs0uBbL
	BxDFYYnnqTX1eyAbsPmBPFME2wP2g1JxtD4BUY7N/wtwtamuIcJdWYIA
X-Google-Smtp-Source: AGHT+IGtMqipPUgghWjpfZ6ZkTy1ft1+oxAHrUN4YZ5GS8RdVCB2lFCZnqkm3CMl7QqHMx+cAywiQQ==
X-Received: by 2002:a17:902:f648:b0:220:d601:a704 with SMTP id d9443c01a7336-22428a967a4mr207702705ad.18.1741619693398;
        Mon, 10 Mar 2025 08:14:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:52 -0700 (PDT)
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
Subject: [PATCH v3 15/17] RISC-V: KVM: add SBI extension reset callback
Date: Mon, 10 Mar 2025 16:12:22 +0100
Message-ID: <20250310151229.2365992-16-cleger@rivosinc.com>
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

Currently, oonly the STA extension needed a reset function but that's
going to be the case for FWFT as well. Add a reset callback that can be
implemented by SBI extensions.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h     |  1 -
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 ++
 arch/riscv/kvm/vcpu.c                 |  2 +-
 arch/riscv/kvm/vcpu_sbi.c             | 24 ++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_sta.c         |  3 ++-
 5 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index cc33e35cd628..bb93d2995ea2 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -409,7 +409,6 @@ void __kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 bool kvm_riscv_vcpu_stopped(struct kvm_vcpu *vcpu);
 
-void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
 
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index bcb90757b149..cb68b3a57c8f 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -57,6 +57,7 @@ struct kvm_vcpu_sbi_extension {
 	 */
 	int (*init)(struct kvm_vcpu *vcpu);
 	void (*deinit)(struct kvm_vcpu *vcpu);
+	void (*reset)(struct kvm_vcpu *vcpu);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
@@ -78,6 +79,7 @@ bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
 				   unsigned long *reg_val);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 877bcc85c067..542747e2c7f5 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -94,7 +94,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfence_tail = 0;
 	memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue));
 
-	kvm_riscv_vcpu_sbi_sta_reset(vcpu);
+	kvm_riscv_vcpu_sbi_reset(vcpu);
 
 	/* Reset the guest CSRs for hotplug usecase */
 	if (loaded)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 858ddefd7e7f..18726096ef44 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -539,3 +539,27 @@ void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
 		ext->deinit(vcpu);
 	}
 }
+
+void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int idx, i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+		idx = entry->ext_idx;
+
+		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
+			continue;
+
+		if (scontext->ext_status[idx] != KVM_RISCV_SBI_EXT_STATUS_ENABLED ||
+		    !ext->reset)
+			continue;
+
+		ext->reset(vcpu);
+	}
+}
+
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 5f35427114c1..cc6cb7c8f0e4 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -16,7 +16,7 @@
 #include <asm/sbi.h>
 #include <asm/uaccess.h>
 
-void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
+static void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.sta.shmem = INVALID_GPA;
 	vcpu->arch.sta.last_steal = 0;
@@ -156,6 +156,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
 	.extid_end = SBI_EXT_STA,
 	.handler = kvm_sbi_ext_sta_handler,
 	.probe = kvm_sbi_ext_sta_probe,
+	.reset = kvm_riscv_vcpu_sbi_sta_reset,
 };
 
 int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
-- 
2.47.2


