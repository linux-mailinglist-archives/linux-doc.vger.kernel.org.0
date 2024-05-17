Return-Path: <linux-doc+bounces-16470-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C1F8C88B3
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 16:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E25D12878D7
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 14:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B07E78C83;
	Fri, 17 May 2024 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JGxiFnGt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDF674C14
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957612; cv=none; b=DKGz7Hz5orSeV3xP3mo2dmEAnfS8reBhBAR83LLyqJVuzKUEsDhqaQ4ELXepQFB2ijmZAnZuxISKLFdBTFGnECeSOgS9ZQfPv9gzu+t4DI3b8Hps4aiPIFee88MrM5M0TdwDnfhFIETtm/6L3YmwSPsM6cZ10ywT1zTNJyV1USI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957612; c=relaxed/simple;
	bh=9OibV1wByq0xP/I1LcPZzJnAYq8k248mAeEZPcsASkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzMs4spKOE/fYS4YTV1cIEbH4dQMN+zymbJ1Fu8x1ZnyaOLbAT6xSeTEn7t12GHiVnEGa8WeRvRh1c1LUgHKKpnLzUkItZLsMwTSQnD0oOsffqxzg9xdreQKG41v50Ue1/TH1/KeW7k4E3AtnN5eII9zZAkrJUo4YHeFT5G+rzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JGxiFnGt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4202a1ead57so328815e9.2
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957609; x=1716562409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr5In3BbQWy4/7yql16kLnv72/rLlL/nlq3+ywvvEUQ=;
        b=JGxiFnGtT8DQqA6X+fofoAQsi1YIazBetsWmP+L2OIVIasIE5TRdbPW2bRKCxtiGle
         s6MZLw5KseM1uz5V0uJGskOWZzTtpHexzfm1Gst0DcsEr51HBrJFm/UN7XZ0divx/LdR
         8lkOJ2aaMJ7m21hNbxJQDQG9hwgx21YgGvZzlrrOkgGzBgksCayU3TvdkqRn4eG50Emi
         GH6Pmg6AHiDcgm6Kw7pA/Pq0oghSZ/X9H630cM5Zs/xe32+vd/IUu16hpBs6Il8G8ska
         HL2M6mDJ9ev6qoyj1NhfJWWu87mJBnxIXZ/NB8dliWwV6HfI8bb5mP8SHe9EXF6RKP9O
         WOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957609; x=1716562409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hr5In3BbQWy4/7yql16kLnv72/rLlL/nlq3+ywvvEUQ=;
        b=FkA4BZopsX9pjsHwskDOQWUhe2/t21RDI7FiuVmIzWZ/f9s9EBfQeJGldvnREjnPWJ
         kFjZm24qNQcYBko4w8x1410hGOwDc/IXhrrMMhmcIoUJEZfsjfzCpTBsr/58s7kkdIfg
         q1t5V7qCACSwe04H6NrT/5UP5i0sBl1i7pcw3n+iM/14YhO7U0qZMgNLPkkehaSTNvAz
         fc5dRViRwa6C3IG764PQ8wxI2Q1ydmNBHWU0Eujqhy2J4s4KncNTI4uxA0a4u26JbtlL
         2ElwLKvv4vC3DFueGATt3GA+PkbTMvWqFSGKQc7Jkr5KcYtuEGnXk//bQPBvrs1ppgBC
         PoEg==
X-Forwarded-Encrypted: i=1; AJvYcCXARml1rMEEgBGhkuzUdD6GDUYtUgGbtn0uxpRv9PtL8Jwz5nq94qHBR/LxMeTmKpC58hmHglXgQdDAJTbeJqbSM0MMMdYsfsXy
X-Gm-Message-State: AOJu0YxAyWguqeibPvt/eoZ7G2zTsOJdKfwG6HcKOmiaFStkjXvajY9c
	5l5vwXCAGiaNZnD8fGze6ygcsk0NI0fvN4DGPWdCmOIPWaA+SaStCjVx9ynr3XY=
X-Google-Smtp-Source: AGHT+IHFAZadiSe4TflYND6qRyaBCUiWEXnVUWl1b2pNoUSKbbMUpWrFBDbKvnZCinPKChpNIsrosw==
X-Received: by 2002:a05:600c:1d0a:b0:41b:e58c:e007 with SMTP id 5b1f17b1804b1-41fead7a643mr161943585e9.4.1715957609019;
        Fri, 17 May 2024 07:53:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:28 -0700 (PDT)
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
Subject: [PATCH v5 10/16] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Fri, 17 May 2024 16:52:50 +0200
Message-ID: <20240517145302.971019-11-cleger@rivosinc.com>
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

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zca, Zcf, Zcd and Zcb extensions for Guest/VM.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 arch/riscv/kvm/vcpu_onereg.c      | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 35a12aa1953e..57db3fea679f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -168,6 +168,10 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
 	KVM_RISCV_ISA_EXT_ZIMOP,
+	KVM_RISCV_ISA_EXT_ZCA,
+	KVM_RISCV_ISA_EXT_ZCB,
+	KVM_RISCV_ISA_EXT_ZCD,
+	KVM_RISCV_ISA_EXT_ZCF,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c6ee763422f2..7d47fc910bd9 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -48,6 +48,10 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZBKC),
 	KVM_ISA_EXT_ARR(ZBKX),
 	KVM_ISA_EXT_ARR(ZBS),
+	KVM_ISA_EXT_ARR(ZCA),
+	KVM_ISA_EXT_ARR(ZCB),
+	KVM_ISA_EXT_ARR(ZCD),
+	KVM_ISA_EXT_ARR(ZCF),
 	KVM_ISA_EXT_ARR(ZFA),
 	KVM_ISA_EXT_ARR(ZFH),
 	KVM_ISA_EXT_ARR(ZFHMIN),
@@ -128,6 +132,10 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZBKC:
 	case KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_RISCV_ISA_EXT_ZBS:
+	case KVM_RISCV_ISA_EXT_ZCA:
+	case KVM_RISCV_ISA_EXT_ZCB:
+	case KVM_RISCV_ISA_EXT_ZCD:
+	case KVM_RISCV_ISA_EXT_ZCF:
 	case KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
-- 
2.43.0


