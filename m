Return-Path: <linux-doc+bounces-9916-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FFD858C2D
	for <lists+linux-doc@lfdr.de>; Sat, 17 Feb 2024 02:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AB922833AA
	for <lists+linux-doc@lfdr.de>; Sat, 17 Feb 2024 01:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F9918E25;
	Sat, 17 Feb 2024 00:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UDAgnQu4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE01D68F
	for <linux-doc@vger.kernel.org>; Sat, 17 Feb 2024 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708131514; cv=none; b=Wo7yN9HvdI5RS8YBV76y66vD/4QKs3wD7peBMYBya1wT3S+7SQMqrXm/6TqLD5ikE1T+98vIna077iEv1q9rYlOy4YdnZOrD9zi/eU4KVZ15do+8Po0qD01QBJXszAahTuhmF0y0ky0zVO6koFnv3WIidzqiLA2fftzYGhTj+e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708131514; c=relaxed/simple;
	bh=x/pxMUbe83mK+v+gMOd6tZkDxRpLBvnfaivyX9/0rpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkK9Dd0gezUr1tLEr8s+ktUalh0T3UHCBelA53YJHUi7xWPpst5uGe8X/VN+2t2u4YX666XC4PQRfmdkfQC7w0l0GRu5GN/HxzpYsGrAfAAcwgCnGpbmxVdoPz5Ow/sBnOpKWnp1uMX24W3KJZ00R1AvYU01XSKQ8eNZ2rkZwRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UDAgnQu4; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3650dcd38a0so3262565ab.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 16:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131512; x=1708736312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yuqScAnZ2lAjzdM+wGDjNHf/qrm86EPmr1bz136zUM=;
        b=UDAgnQu4HKtBi80GzYNkRGIwzwmS07DaaselPxOyHISdFaclPJVXWmixUxrqafV7RJ
         ipVB0LvlNERttOmv4mFNTzMUAJMsUHOBiaPXJ8A65gTBL8Qmjr82WHR8DLDACS+0wiDw
         1auyqJ2gJQugjFVCW0Yqb915W2KREBYadiJOT9UA57q7BrMxjn1MwyJveMRry0AwCQp4
         WC0ZYBEYwWAjM8OuoBfJ5+f0FnBwqJW/8fA4hPcDfHICubPV3bAo3ktbTgkvizOU6IPf
         Fe4Gq2VNs/R/5jJrIfqJ3HFnJ3rlyPuA5c+z7+BzvvP2NEs36DITEpjNt4m4JpphQe+V
         e++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131512; x=1708736312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yuqScAnZ2lAjzdM+wGDjNHf/qrm86EPmr1bz136zUM=;
        b=DAPAQEQjiI5vpumRPvQ0+zJcyJV3nQEuWlNx8AEa9uaReEsq59CwZKCR+sljZi5UoJ
         jfYPdZy7HwXDS8O9kvS0kgsZXlmVDc0da+EwzSxZZgrvvUwGUplFRzj31ME6lpVNmDsL
         FnZHb8nJmAWPEFxI3WWShW59c6Av+JY/sNcZ6nECyuCJjHinXj208CuggHedrDcJfv8c
         epQieNWLPS62uQznXh8S2Tci/4knVsiM1FCa+OanzpUE3PSh7JGLFMCqfQfxh8nDgbPa
         l1J8ySzzXwNt1B+EwTOqOA7Ef443nb94/+TZzuX62bHmaIT63Tk+AHDVv7PfRMQyMWeW
         dEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6BgJzKOdqc909DC1s9mEocxkcl97pHXnf4i0O+vFeYN9/J/mLtEJa6N27CYUcHIQMfbRzfd928xGlc0HrwWfcn9UxUKCQQfVj
X-Gm-Message-State: AOJu0YxIQ+qHYr2QpzRrXxnNvQdYbeX1qIclX7m4wZCIS0AAGtBsjeix
	z0p8LkXsPe0xSzfU5eF80D70gfZiE02pcwChLj4Zj9etolcPtJabu0uzyKrxNcQ=
X-Google-Smtp-Source: AGHT+IHik4QrimZEc7Y58ACfRBjvwhbVJhwuT0U4/D/6aufYBPUmjg3iZ9kYnwtI0QZLKwXDyQ9OOw==
X-Received: by 2002:a05:6e02:1069:b0:363:b362:a2bb with SMTP id q9-20020a056e02106900b00363b362a2bbmr5475068ilj.32.1708131512047;
        Fri, 16 Feb 2024 16:58:32 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 07/20] RISC-V: Add Ssccfg ISA extension definition and parsing
Date: Fri, 16 Feb 2024 16:57:25 -0800
Message-Id: <20240217005738.3744121-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ssccfg (‘Ss’ for Privileged architecture and Supervisor-level
extension, ‘ccfg’ for Counter Configuration) provides access to
delegated counters and new supervisor-level state.

This patch just enables the definitions and enable parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 44df259cc815..5f4401e221ee 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -82,6 +82,8 @@
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_SSCSRIND		74
 #define RISCV_ISA_EXT_SMCSRIND		75
+#define RISCV_ISA_EXT_SSCCFG            76
+#define RISCV_ISA_EXT_SMCDELEG          77
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 52ec88dfb004..77cc5dbd73bf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -300,10 +300,12 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
+	__RISCV_ISA_EXT_DATA(ssccfg, RISCV_ISA_EXT_SSCCFG),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
-- 
2.34.1


