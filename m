Return-Path: <linux-doc+bounces-46209-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B89AB806D
	for <lists+linux-doc@lfdr.de>; Thu, 15 May 2025 10:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41B831895E42
	for <lists+linux-doc@lfdr.de>; Thu, 15 May 2025 08:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F188D28DF00;
	Thu, 15 May 2025 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FcHH/svy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E428C2D2
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297432; cv=none; b=Bg5xY7yfMOFqg3icxW3Wpg0DBnLEY+nqFBuTUSA8bm8A3N3r+C8FluFPhtH4SMhN8hThbTINiO433q4WmWlG44fKLioSaF/dmya2vf5auQtXGy6RqUBxYC7yvBAvP0e2Y6EDyGj2lEuaXuoCx/9I/k815w/TnCTaqAlcXbishOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297432; c=relaxed/simple;
	bh=IrQydkaY6DjwPRJK+9IUCeQaVW2h03QqX2m5JrkLHsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ge2zKGj7SF1fbMR89C7wbuvoy0ihrzbGDS+pV4E6POuwLhmMKp5s7b99bnBt23wt4UJEs8Hs929vM2VURoFKP6XnUQmZeAMLSfVEEuy+l8xjTOtax/arnWa0Q4SmbkOeRlokhTKlemeAFXohlhdVgxUEFqOgAtZPL0lhWg8F5FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FcHH/svy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0b135d18eso320312f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297429; x=1747902229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOCKOWdc9Rm9mheK+/kf775/MsCKzvlzcdVw7vqLpnQ=;
        b=FcHH/svyXIzVPxmjz6E+H53OWL+Onrh21R0zhbBna5NB2i+ay4FR4Dv+A1QmprWHgj
         ZMNiC6xrYmz8eDiBxmtgCByHemxlduCT4hgABSEsgsA0xV/efa9GcsQC0Ld3EkUkxiO0
         F7KKMyrRSMSjacHrYnN7OSDBI1ZrGBpzehncjhzG1K54zc+XZMPp52uqL3ud94DDOLaM
         1JeOV6ln6TUOth3iOjczsLzIr5cZxlMVagKRCxQ4/jxvN7g0IReoOJl/LUnwfvtckx2W
         Q/NjNXlpcvIUkxNULgooLXUJBYL0PHrQ68x3KfECe3r42HuSdsm7vyOUbgYneKAVRl6a
         hG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297429; x=1747902229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOCKOWdc9Rm9mheK+/kf775/MsCKzvlzcdVw7vqLpnQ=;
        b=FWXCylfKpJjK3ikXj1bYbrg+UpUzuFF0hBqmcWN+XLNwRGRgcPg/5HEZHhlMJG+xjU
         heoqwjk04oyhHmHq4TybnYtk9uHF1Fqi+6EMYDOsUcZEXmBudTn6aOHcBhRhTgbhN3D9
         o/eIv/wcjZ/6KrMEJ4Ax7O0g59beEhXfsD1q5nt1GlQ/Ye6cjXQFH5mqKGYX/dSQaXBD
         jwZavdEC2pfPlUeAP2Jxp6guHFr3WTTEtUH4bw1uf6eLPVtVb9GBDZfU/Azz37vvOo5s
         AawF0u2KIKerI4xHPAQq1fl7zkdagyFStfvfQQU3i7eNeSVNtu9996x36HlXxBSScRCb
         F1dA==
X-Forwarded-Encrypted: i=1; AJvYcCUtPXDJB1gfRXLkvLKm1rwShV25acNhE/BDz45sbhPYTsMWatcR/mfQ9i0XGChn9Kg0XkPCmL++32o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGgHwW/nk0kzxcVhDRVpMLyhCI3/wu3SGpYkZm5Myt019zXNT0
	DnHy80uXTmFdQ0+tLO3xmTnJJUowNrtSqgScZsFE39b6yl9NyjLCNyfeS//WPjs=
X-Gm-Gg: ASbGncvpZE8dfOtUQiYn+fn19jfRTj+XWkcMl77Y32cHCo6OqU/LEhPW4Kk+NesNb/u
	77BuFN6DYffaJ/zBUDCvDdnGwRUHbiBsAdrvA58Kzjd+uY6FQ5uiSXzk9jM1xHLLwPXPKudkMxi
	khFoyW2xh6LRiiPWeNsLtYMypFf7+U4r3rSMs9mYkOBe8xXR3cPBRH4e4GghOzmQARwDiMkjwTi
	zAfH5HDyNoZt+xU5natlVSZTiEIAle4LwN0KJ0H4E7lOZ2zT5HdJk5gaRKpBLr2M4rOsKooc6LB
	dr1yz8gwQvA03ahRIGtcz8BKKjzGMT2C/rTS9l/0L57T78VpZag=
X-Google-Smtp-Source: AGHT+IEDgFHO6gLcxW55XNJ4ZpshV/UtxVM8HE5Xz/T24HqOjUp3uFD1+/lwkhut6j4hCuDDjciWCg==
X-Received: by 2002:a05:6000:1ac6:b0:3a1:fd29:b892 with SMTP id ffacd0b85a97d-3a3537b4926mr1265289f8f.49.1747297428847;
        Thu, 15 May 2025 01:23:48 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:47 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 04/14] riscv: sbi: add FWFT extension interface
Date: Thu, 15 May 2025 10:22:05 +0200
Message-ID: <20250515082217.433227-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This SBI extensions enables supervisor mode to control feature that are
under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
DTE, etc). Add an interface to set local features for a specific cpu
mask as well as for the online cpu mask.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 17 +++++++++++
 arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0938f2a8d01b..341e74238aa0 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
 				unsigned long asid);
 long sbi_probe_extension(int ext);
 
+int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
+int sbi_fwft_set_cpumask(const cpumask_t *mask, u32 feature,
+			 unsigned long value, unsigned long flags);
+/**
+ * sbi_fwft_set_online_cpus() - Set a feature on all online cpus
+ * @feature: The feature to be set
+ * @value: The feature value to be set
+ * @flags: FWFT feature set flags
+ *
+ * Return: 0 on success, appropriate linux error code otherwise.
+ */
+static inline int sbi_fwft_set_online_cpus(u32 feature, unsigned long value,
+					   unsigned long flags)
+{
+	return sbi_fwft_set_cpumask(cpu_online_mask, feature, value, flags);
+}
+
 /* Check if current SBI specification version is 0.1 or not */
 static inline int sbi_spec_is_0_1(void)
 {
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 1d44c35305a9..818efafdc8e9 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -299,6 +299,63 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 	return 0;
 }
 
+struct fwft_set_req {
+	u32 feature;
+	unsigned long value;
+	unsigned long flags;
+	atomic_t error;
+};
+
+static void cpu_sbi_fwft_set(void *arg)
+{
+	struct fwft_set_req *req = arg;
+	int ret;
+
+	ret = sbi_fwft_set(req->feature, req->value, req->flags);
+	if (ret)
+		atomic_set(&req->error, ret);
+}
+
+/**
+ * sbi_fwft_set() - Set a feature on the local hart
+ * @feature: The feature ID to be set
+ * @value: The feature value to be set
+ * @flags: FWFT feature set flags
+ *
+ * Return: 0 on success, appropriate linux error code otherwise.
+ */
+int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
+{
+	return -EOPNOTSUPP;
+}
+
+/**
+ * sbi_fwft_set_cpumask() - Set a feature for the specified cpumask
+ * @mask: CPU mask of cpus that need the feature to be set
+ * @feature: The feature ID to be set
+ * @value: The feature value to be set
+ * @flags: FWFT feature set flags
+ *
+ * Return: 0 on success, appropriate linux error code otherwise.
+ */
+int sbi_fwft_set_cpumask(const cpumask_t *mask, u32 feature,
+			       unsigned long value, unsigned long flags)
+{
+	struct fwft_set_req req = {
+		.feature = feature,
+		.value = value,
+		.flags = flags,
+		.error = ATOMIC_INIT(0),
+	};
+
+	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
+		return -EINVAL;
+
+	on_each_cpu_mask(mask, cpu_sbi_fwft_set, &req, 1);
+
+	return atomic_read(&req.error);
+}
+
 /**
  * sbi_set_timer() - Program the timer for next timer event.
  * @stime_value: The value after which next timer event should fire.
-- 
2.49.0


