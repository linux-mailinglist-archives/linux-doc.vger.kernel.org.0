Return-Path: <linux-doc+bounces-41101-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F91A659FA
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 18:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F5AB167A00
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 17:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646E3204F8C;
	Mon, 17 Mar 2025 17:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fVAu8bpc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05032045A0
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231308; cv=none; b=auI4SvDo6sHDCGvZC5YALGfalTts/y/pZ5BAiqjzWp0Grd6KOrq5zZ0zIa1iYm2DPnw7UotFfMkeflSHX6FKNfmJwK14It+Fnx2IbHZuVfH5S7MIL4ZpAYA0cxIc+xT33KWMNW+E0inUmCq++HTqjHcZSyUvoIs/OvX1fOCT7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231308; c=relaxed/simple;
	bh=Gv1UmUfkNzV+unmWCBGWmF8ZtodrzRVBnrtgrN2t0IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o3FlXoQznOlSb8HXOMGhIqOy++xnk1mIDdulkT5yH8NQ8VGyn4QxyMmFxpsegSaDWT/o+uSGv05Q3F54nQX/uYg1nfVDwHzPWxO/XXemQr1N0jCvoVBYSRQHwf00VzTOD3IsmbvI6XEopxUTwcodlJZ12PrX4WdGCICcMFQRnc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fVAu8bpc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so17926575e9.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231304; x=1742836104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdADaa+vHUZsa5aS61sZ5FN/C9kboqasJ4Wux/Gk/Z4=;
        b=fVAu8bpcPvNBBp2G2pEgWrL0RqlJR7LCWRfwQ+ACsiiXzdoomn34nf0poKGf9ZypBD
         Kn3EbEwEQRsHaSEYqijzRpRv5HXWiEHZkZFr6l5/D39LpkSJe0ywxBh4LVQ293R/vMR6
         uDwFj3oqkS2Jo2mG1qppZMvZs20b2FOhwagv4MB16uR2IFOLLHULWvwJnsUTaXR6aLt+
         6CPDI4WT4XWXnWGDcjf7NnzbzLuQsW36LG4ELxA2UgAKfiz7GTiP4VmKOC0j0Aonm/01
         iNDk8Q4SbPos8eMdWk5cU0KZHoylcUU5OunbvyJ+602spJIpGsgGFMwaMNnWyAR6pdBl
         dh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231304; x=1742836104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdADaa+vHUZsa5aS61sZ5FN/C9kboqasJ4Wux/Gk/Z4=;
        b=cFbBfw/Z20u/8CEBgqOrws9Es+30XYdegFsUk7G8K17ApGKusDjQeJQUJAR8w0k5AE
         3ngYqylqPV6KkHClQYTy+CQwocy1xHWRAGQB8TDyzBWrMUUwyTXYDmhFZKYjnhG7Kwv3
         HL4dFbWqHcZ4sXlm+sRQUwIQQZ5BddwBDt400N74AdjhiGtDGjowOwIXIuuLlobKAEIQ
         qqUSV1yUhLs/H6jdwAJF8lhiEPzpjelz2IGnFKvPDsyui4DIUDbnl7E1kHnktNlEruOk
         zxrbrfs8GvBLR1yPu3pnfD4Dq9CtzmzWf+Zrx1bmGz3MZBMVO90N/uWYnLZdU6jk6xWP
         7ALg==
X-Forwarded-Encrypted: i=1; AJvYcCVFhwS43oi8oQT1eGXtzOx0z9rN8M/rcCGPWn2YPCH1THqJqqydnLSio1KQhkfR5/Gcg8uVldkORaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsjMf2PJPb9yIu+ThVyAEW3MgX1CoL1byZYsM17JzFsA0KFH+w
	Gg6W2GRvNl3AAeuKG9AsYDi6oensa+cAdQ4tsAQNjfhK/gCSWNJMVNXzG44NJ7U=
X-Gm-Gg: ASbGncvpjl2qw5WTy5OAbTqunh5ksg+50T67oYw3iIWpwHs+Kz89AgzHbal2P/imYfj
	lHZpFVjmShj5vZeWAoFI9ke3wtDky6Wqs845tRPCF6sgh0Skp8NHrLxXPlhOhGaBppZ0QqxLGeO
	YzOHbNEmo56dbQmM8fVyMcOwsVcxctNeOnCrsOWrxTSf/5av+vy4WGxOd4spev+QG4rP20VZHWt
	JlCD9sx+FnAZxGEGym/g2LImq71MTRLqyXORo5I2SQCKLCPV67kCD4dJEwKyTvfc409op1OsA8R
	94b4V5IjpnHNDxy9fpmj4PNNpTGKyys8iNEBd7IYD0KpqQ==
X-Google-Smtp-Source: AGHT+IGGvUDucTyZhua2TIOWY68n/psfaPPQ4wKaNSWwyNxLgrTgzrMr5DXu7tUeZ+5c3PBxx/axlQ==
X-Received: by 2002:a05:600c:450c:b0:43d:609:b305 with SMTP id 5b1f17b1804b1-43d389790acmr6282865e9.17.1742231304068;
        Mon, 17 Mar 2025 10:08:24 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:23 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 15/18] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Mon, 17 Mar 2025 18:06:21 +0100
Message-ID: <20250317170625.1142870-16-cleger@rivosinc.com>
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

The FWFT SBI extension will need to dynamically allocate memory and do
init time specific initialization. Add an init/deinit callbacks that
allows to do so.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
 arch/riscv/kvm/vcpu.c                 |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4ed6203cdd30..bcb90757b149 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -49,6 +49,14 @@ struct kvm_vcpu_sbi_extension {
 
 	/* Extension specific probe function */
 	unsigned long (*probe)(struct kvm_vcpu *vcpu);
+
+	/*
+	 * Init/deinit function called once during VCPU init/destroy. These
+	 * might be use if the SBI extensions need to allocate or do specific
+	 * init time only configuration.
+	 */
+	int (*init)(struct kvm_vcpu *vcpu);
+	void (*deinit)(struct kvm_vcpu *vcpu);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
@@ -69,6 +77,7 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
 				   unsigned long *reg_val);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..877bcc85c067 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -185,6 +185,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
+	kvm_riscv_vcpu_sbi_deinit(vcpu);
+
 	/* Cleanup VCPU AIA context */
 	kvm_riscv_vcpu_aia_deinit(vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index d1c83a77735e..3139f171c20f 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -508,5 +508,31 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
 		scontext->ext_status[idx] = ext->default_disabled ?
 					KVM_RISCV_SBI_EXT_STATUS_DISABLED :
 					KVM_RISCV_SBI_EXT_STATUS_ENABLED;
+
+		if (ext->init && ext->init(vcpu) != 0)
+			scontext->ext_status[idx] = KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
+	}
+}
+
+void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
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
+		if (scontext->ext_status[idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE ||
+		    !ext->deinit)
+			continue;
+
+		ext->deinit(vcpu);
 	}
 }
-- 
2.47.2


