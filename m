Return-Path: <linux-doc+bounces-16476-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D99178C88D4
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 16:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57083B28BB6
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 14:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971ED8005C;
	Fri, 17 May 2024 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IW/nW2rM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00CC81730
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957620; cv=none; b=h1V4ItLetpSw65YZVux0gGIOyKyRp9+5E+4Lgi4FZFF98eZQmEQuzmhoJGt6LmdGPw3a7GP6wlYhf31b555pQQX05K1Ejmbkzc7OMlXBYmjFNwYlUthDygizUcfuIJqQuqp9WrBc65rAjIaBxUgxMWPpTwe69y1eQgb5/1kFdM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957620; c=relaxed/simple;
	bh=x/hf7mR8S0PaebbZDXn5tmxtag3p7rdZEs+HYwpAhAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gj20HkaOGfvBkg0NiqJliVd9/lpS1Oz1fVYBOtlIYu+7b4vUnZr+hX3+kvMR+b2papqa0ccuI+uUUltNpg4VMNBVeDoznffezXtfL5ADq5+euvZNqUSPJA9S6RBdp7wa+MSjTZk+iNU5n86QujjZV61Z+wB+p2lwe6jlvrdKTtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IW/nW2rM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-351d86910deso29096f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957617; x=1716562417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=IW/nW2rMR73xnHm8jNZUQbrWlFqyJhCMuIepyZZVXuNbWIZ3a4t3ph7lQdVEQJiXG2
         CAWO2GaRObB0229zeN0GTEfVywrOX7emWOBV1S8BLh8bdPYNcbKiTEuKhJXq6uDjIFgU
         uvmbLxlpkuDp30MGCBEHCGklSu1GbqARKbrsXe5u17kyCYLYHdd0UQI1gg5uPjtT3Vj7
         HSLSQA4uyDDTUh6yv9xiSm/3MNIX0UhI8Jag8MdE3TwxF+jYgbpfJ02yiGeCUvT9GlNS
         //aXyfZbtOZzNXtuMZQ3APskpxf4i41VaTT810rwNKE1fZxijXuRgyUDg4FECZsXnw7u
         6sDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957617; x=1716562417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=m+DfEOvQZkl9zSDeMA1rwXk4GgBshGVdJINBRvDyOp+DaWp2TTNLSMKFAuuwNRTo5P
         RZ0H60FpgqFlkhqU8p+zD2vPog2Jep/dKV9xuGrGqWy3IuVuWroBiF51KgVDXZ7bV3vP
         /UIttrmZQS1WsdrNBkclGrZFBOh2HzSBz5jOUNm05RpXbQXk90u6+Vv+HwR96tir6soy
         PcZ0yHcODyOiVmsJp8VFpvOFzj0FjTccnvXqZWyL0x3Vl0bdFsjHJv5UwUn/tWAlFcrn
         mmmmOdIkBQVNL/3beWf+5W30ItQj+sXshlwZNlF+zvhiPB1y7OlQ+7VuN6PPMk2HiC05
         6OCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF2u5seXdaU56poxQtvnJTXeVfNyKx9cvXsAVl4fZ4sDU+7bekeM7CrpTGO0yzkUNeTWDCahZksKa7jtdmUQ7DRX3+Hs6zEvC2
X-Gm-Message-State: AOJu0Yy5mEvtHaeaBPh3f0kRlWrdkdBKo1BXUGKFF4tVsPE4Ic5L1KSN
	jW7GudXqfvWOIzvERygnhbnDlNEU8cIhbZbejBEVU5YNWWGywyBdmdOsJU5W/ck=
X-Google-Smtp-Source: AGHT+IFOQbqpkXAFZ+YravAaGBjZr48UyjitjGy6UF5iu6XOF0ZSxSlCzpVIUM9l+O9Eld2jghPS1w==
X-Received: by 2002:a05:600c:3b86:b0:418:f770:ba0 with SMTP id 5b1f17b1804b1-41fea52ef14mr167166955e9.0.1715957617104;
        Fri, 17 May 2024 07:53:37 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:36 -0700 (PDT)
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
Subject: [PATCH v5 16/16] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Fri, 17 May 2024 16:52:56 +0200
Message-ID: <20240517145302.971019-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The KVM RISC-V allows Zcmop extension for Guest/VM so add this
extension to get-reg-list test.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 61cad4514197..9604c8ece787 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -59,6 +59,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCD:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCF:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZCMOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
@@ -429,6 +430,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZCB),
 		KVM_ISA_EXT_ARR(ZCD),
 		KVM_ISA_EXT_ARR(ZCF),
+		KVM_ISA_EXT_ARR(ZCMOP),
 		KVM_ISA_EXT_ARR(ZFA),
 		KVM_ISA_EXT_ARR(ZFH),
 		KVM_ISA_EXT_ARR(ZFHMIN),
@@ -957,6 +959,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zca, ZCA),
 KVM_ISA_EXT_SIMPLE_CONFIG(zcb, ZCB),
 KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD),
 KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF),
+KVM_ISA_EXT_SIMPLE_CONFIG(zcmop, ZCMOP);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
@@ -1017,6 +1020,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zcb,
 	&config_zcd,
 	&config_zcf,
+	&config_zcmop,
 	&config_zfa,
 	&config_zfh,
 	&config_zfhmin,
-- 
2.43.0


