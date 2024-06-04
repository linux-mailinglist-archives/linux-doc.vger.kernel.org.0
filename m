Return-Path: <linux-doc+bounces-17621-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C28C8FB2A9
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2024 14:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 442F51C24B8F
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2024 12:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE22F1465B4;
	Tue,  4 Jun 2024 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="U0Xas/DZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A951465B0
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505228; cv=none; b=LBiubON43bFvZfsGoOi1H7wShziMQsgFJsL2eKiaB6oVDYxQ8WQ4dU0DXbDwxHG8yYq7pjvtq1zhCKADVuRO4DBI8E4ePt8dNn4WMaMWB1+yfqUp8spBTk9ZShJ0CZUE8LYft3yxHfVE5wwSBIGgDSAT3HTryAQSOCA0m20Yg1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505228; c=relaxed/simple;
	bh=7cxixw3789zfXT599OJ7yLZEcsI+8PZynoNitlKT7DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HnNzLXHO3GAyDLwPFlMLwv8GdE45CfgGfHJgzMngYsfO6NBJwSA4YgHaEs4hGdtiSkWoy3GPy5Nx/8sK1VTCEmSSBZag/6FzB/SDIuHWVwtvOJJxzz09dzwGJUiNWb4iO+I7pLLhMq6pmTv+/7OFdfI5LBiMWGpv9xlNmtfBoNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=U0Xas/DZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f63b8a28a3so825145ad.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505227; x=1718110027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Thrzhyhf4n6WJYCWxQDF3hgG8fVFwwW9ccIOLsViJdE=;
        b=U0Xas/DZlXQyi4obaLIy04P04sXFUdLnGAw/HogwxFvK+PC6cVykzbHjwh3+mxmYp2
         mfULshmMuyyguACeT8CeYZtjsCeeZ2DgNbm6Ao1HT3eYmhPvC3HBDH8REg6FbIIt3/Iv
         LfGARL44kuxgs3M+iA2YioDBr4NsZmYzjPPlfU4dfs8Rj91FxErp9hI8jUP5loQUQ51g
         atAbXNFgjTXYVNG1L0z33DItOxtx26vEp6Jn4Pg9oiDHn1U+C9DHJBEl90Zxja9SjcsU
         NBUueZ7Vl1Bx3WLG/ZhPuBRp8FJMYPZ9ITSNS3XosAQTd1LHA6RaBa5MsLW8D7N5QQBE
         63gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505227; x=1718110027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Thrzhyhf4n6WJYCWxQDF3hgG8fVFwwW9ccIOLsViJdE=;
        b=HAebWIhvHOLrItX8MtCEO8GpZLYEBvZQAJjB4mhIvRgrqLXQMLjxn25RedkkCAIU5K
         /E7kDmv/6P1FkFgbxKnyZLTK6Yc91WpTq5xFZyGVK3LCKV691ZS+nhRyL2OVAMcy4OZm
         grjQM4ICeksFgDZYl5k55K+eedpeuu04toiEkShvMiRVB677oBII3ZM6n11Yi9GJpeSY
         g5J3aLyUL6fRbos9thwBFiLuEyLZz2UgknzlXjySSBpnC2HaYd8XF1g3hY4bnLFV7LZO
         Ymfn8dmI58GX5T3bM4RZutI41t1YXKD5rHvAHDZtQEJZ/1PLR0b6oTxJEkz92YswMdW3
         EzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUTPtdjTVBJ7Le4IWSyz2AdWGEK0Y7EhLc/+SNNvbPcVtBzq4uGnoQA2oOinRe5d8xz3P8PmpUX78Rejbvwc4k3kdcrSr0UgBa
X-Gm-Message-State: AOJu0Yy18kVY7ocA5mYMoSRfwGCcOCpMh+cWZf4FPzRzdP6J1qcvxwYc
	4AnQJSL78Rd7hA87Mviicuoug5A3XQGV+LBzMK4v3Y0wv6wfKZR8fJtY76r03mg=
X-Google-Smtp-Source: AGHT+IEm3zrqTkaD1e80nTXtvyaFcCt9SvKc4tEHifCVXXNN3kdXJvNYmPz0ey9WWV7TKhbEhWGmJA==
X-Received: by 2002:a05:6a21:789e:b0:1a7:91b0:9ba3 with SMTP id adf61e73a8af0-1b26f30dbb1mr14554711637.4.1717505226907;
        Tue, 04 Jun 2024 05:47:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:47:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 05/16] KVM: riscv: selftests: Add Zimop extension to get-reg-list test
Date: Tue,  4 Jun 2024 14:45:37 +0200
Message-ID: <20240604124550.3214710-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The KVM RISC-V allows Zimop extension for Guest/VM so add this
extension to get-reg-list test.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 222198dd6d04..8c8b109ce3ca 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -68,6 +68,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTNTL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIMOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKNE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKNH:
@@ -434,6 +435,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZIHINTNTL),
 		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 		KVM_ISA_EXT_ARR(ZIHPM),
+		KVM_ISA_EXT_ARR(ZIMOP),
 		KVM_ISA_EXT_ARR(ZKND),
 		KVM_ISA_EXT_ARR(ZKNE),
 		KVM_ISA_EXT_ARR(ZKNH),
@@ -958,6 +960,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zifencei, ZIFENCEI);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintntl, ZIHINTNTL);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
+KVM_ISA_EXT_SIMPLE_CONFIG(zimop, ZIMOP);
 KVM_ISA_EXT_SIMPLE_CONFIG(zknd, ZKND);
 KVM_ISA_EXT_SIMPLE_CONFIG(zkne, ZKNE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zknh, ZKNH);
@@ -1014,6 +1017,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zihintntl,
 	&config_zihintpause,
 	&config_zihpm,
+	&config_zimop,
 	&config_zknd,
 	&config_zkne,
 	&config_zknh,
-- 
2.45.1


