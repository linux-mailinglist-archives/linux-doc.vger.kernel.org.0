Return-Path: <linux-doc+bounces-46210-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C9AB8078
	for <lists+linux-doc@lfdr.de>; Thu, 15 May 2025 10:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131ED1BA7CD3
	for <lists+linux-doc@lfdr.de>; Thu, 15 May 2025 08:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF76293B74;
	Thu, 15 May 2025 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nK0y0Cee"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD8128E569
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297435; cv=none; b=I60jePvRvThCZUdADcvGdFWgwiUSnifa+WlgC9RtqM0Q9HnYsgSuECsX8q504rMeLkDWWb8K8Nc9hcP4pMBPL+B2jPZa+BPKCkBuK/1KfwriOEMDayEwWTUQEU424OJ/EFhgyEyhfyyu5ciSGfinTiQJ2h+hmKZfzDmDjpOgnWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297435; c=relaxed/simple;
	bh=c4f/odBe1fiDkTMfaR/fNuZlpsRWRZtD8/pJ3r41/Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sBBwbOMygptZfXi9zvkViMVt59oD4pSe7nDvTnfbaMdw3bz6GHVUrJiojKdStE3BIVSs4cY18mvtInUjRZBbDxmb/WTAZOhiUd2yyvbgL9zBemwZLCXDwGyMpnj9zwaXM0IO9h6xVURPjsuK/e/awdSpv5s3D+Uxrc2VHwl8ujk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nK0y0Cee; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so6982155e9.1
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297430; x=1747902230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=nK0y0Cee/rnnhvO27+PYyKapRS97jXMC80m8bOAj9nIkHz1Y1tG93OV4LlJS1MTeV+
         kw7IrJ8Xp9zF8Ry6RQYtiHYSzmHaYvP1Y08TqSHBQumOEgln2np97XDDr+YHxN0+ocKq
         hlxkvcOVpp6qg2+NcxI5NDVfV41i+zPal65QfGVlTPgdnATYn6djGZDv0sCbxdtzIMBo
         yaf49SnPAVPns1LmI6ec/LSjDaikw3kMn6ijGAwMukhIEf6p8w0LRkcp/zmg5a3cNUn7
         ZT7VJNqMqWHHYDTguU5d0TIXLZZFbWFALQ+VTPeDOXe1x+J1u0ExJ4SwPkf8241zl/g6
         RJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297431; x=1747902231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=B7vbPLBEAVXczb1dSkZ+1DiYEQP6iB/16g2mlO5K0glDP8RSflXONPvyGcxh8zEViH
         7OdR4E8+4KhefyeCkB72tzmtvvluZjlJsFpGAuyruSsqbDc0P+adYvVyyFBg0WBahHzZ
         FyHPX5hpZzrwUgOsN0kNbCTJsfDvEUtr5to0/HoN3UOaASPhXZM5rCX4eKNk0O0pWGHP
         J/1Jc1QPJy1x1nJDPkUflDpukgv2lKt8mdH5/BilcXg/FPWGCkfSpXEQPHKJH/rzuWsd
         fqnrvuGrD1f9PNrSXBUxhNQnZ10yKsrd9p3oWV7XQNGNhxU97gz+bEX/kddQKkc+e/gy
         EGeg==
X-Forwarded-Encrypted: i=1; AJvYcCWesTtC+/Bsj+dOM598pMoyK4q4cyoYDldq9tJF8IO95aqoVZIim0OMyJfVlGLd911x+c8oeoBM3+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAX8JIOZnnOZDVt6FKMfyATOw/FzGYDQAbBlN36FY8CWPyrRO8
	BBjFQIFnDTd2wH8Tyj3W/dIgk/eBDW8JKCU1o6SxgJLUhWs/SPqxiMxD0+J1TTTijkiqKuYEhDQ
	q
X-Gm-Gg: ASbGncs/Bj4mSUsS70JtEk/nYRdXqA7tHr6yaEpKFjaUuI9x2oK94icbv1dWlK/iWwG
	xOoYYSsptGPUUXBAxHbxLy2d6bLVl4ndVxYR33a9Jh+IiIwVI+WBUu8HjW/ob0dYZZnjIxyiQzS
	25kUIJpBSGxTBDNZgr1tE3QDOW0vlkZ1zcZslzN8lM23Yoce4AggSFPsIK1NChEqG3E8da7hvCQ
	3riHelSOBb0trXdsoYTlNLIzf1/WOkuGqyBE8rUixJlE+pLGFDcmnrCUv5XsmuK8EUzN5nVG78o
	eVkgk8Rn46GIJVsme68MnWUcEEIC/znNMbJT2FO+EaisAZ6a9XM=
X-Google-Smtp-Source: AGHT+IHo18Wz0xfwowIAkjj7FGe8ulZGDuitOfmnOSRcK7rM7RV/Qat3DxuhXQ8uvVsICI2vUu48rQ==
X-Received: by 2002:a05:600c:8411:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-442faa3fbb1mr9904825e9.2.1747297430595;
        Thu, 15 May 2025 01:23:50 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:49 -0700 (PDT)
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
Subject: [PATCH v7 05/14] riscv: sbi: add SBI FWFT extension calls
Date: Thu, 15 May 2025 10:22:06 +0200
Message-ID: <20250515082217.433227-6-cleger@rivosinc.com>
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

Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
provided as a separate commit that can be left out if needed.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 818efafdc8e9..53836a9235e3 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 	return 0;
 }
 
+static bool sbi_fwft_supported;
+
 struct fwft_set_req {
 	u32 feature;
 	unsigned long value;
@@ -326,7 +328,15 @@ static void cpu_sbi_fwft_set(void *arg)
  */
 int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
 {
-	return -EOPNOTSUPP;
+	struct sbiret ret;
+
+	if (!sbi_fwft_supported)
+		return -EOPNOTSUPP;
+
+	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
+			feature, value, flags, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(ret.error);
 }
 
 /**
@@ -348,6 +358,9 @@ int sbi_fwft_set_cpumask(const cpumask_t *mask, u32 feature,
 		.error = ATOMIC_INIT(0),
 	};
 
+	if (!sbi_fwft_supported)
+		return -EOPNOTSUPP;
+
 	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
 		return -EINVAL;
 
@@ -679,6 +692,11 @@ void __init sbi_init(void)
 			pr_info("SBI DBCN extension detected\n");
 			sbi_debug_console_available = true;
 		}
+		if (sbi_spec_version >= sbi_mk_version(3, 0) &&
+		    sbi_probe_extension(SBI_EXT_FWFT)) {
+			pr_info("SBI FWFT extension detected\n");
+			sbi_fwft_supported = true;
+		}
 	} else {
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
-- 
2.49.0


