Return-Path: <linux-doc+bounces-15376-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B78B5D33
	for <lists+linux-doc@lfdr.de>; Mon, 29 Apr 2024 17:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8458D1F20172
	for <lists+linux-doc@lfdr.de>; Mon, 29 Apr 2024 15:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F02D1311B0;
	Mon, 29 Apr 2024 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WI4NjaNI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E5130E4B
	for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403211; cv=none; b=inu1pD3NZzmFoIdFea3ZcXJdLK4M7D3IQJ46FHnlCCFfcSPMzGz9F5yyiN/nsRSXOsEdIKvWtVrlIzCSbVvVEUsI46dbZT0oCcxjPmHHcw5ArLlmHJELs+UH9hK31z76bz25/CErI6/CcQRdbxdS+7v5JHDysqEotg3tr5/I+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403211; c=relaxed/simple;
	bh=x/hf7mR8S0PaebbZDXn5tmxtag3p7rdZEs+HYwpAhAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbnUuFt9xwxwIQVNuyWUgbu1EL6MqCD5jdnc7/atyNbFLQWAMHJxBeR3Knu85HATG9h9J9ntMlwsH/2Y5H53H/Bar/G2EvsBZkrgIHk3mQiwYZOCNrSnpJ6gY1rEHyGetwAxyUhlY5JjWlcp487QBoJLSX1wX3x+Ljzyyfqp2Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WI4NjaNI; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e0c363d93bso855251fa.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403208; x=1715008008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=WI4NjaNIpmg+51bm9FMdVU5cxeVBc8EiIvXMVQeCCALSltV7xBOJkBot45wewGJGzv
         1wZ9A0nzs0eYPFyv9kWfiCjW3OQjUyfWWy7V3lB+0bRvGx9WitUO/DrOqkyelbIcCYsA
         l5WUPhBcZHusmAsGVkNUcCjFrPm7ulsQ5UFFnmYWke/16L13XQ0mL7D/U73fcBA97GKM
         8SdhU0AIBI2LNPtFXOZy2NICizXod4oR59q1BafERRGaMdreNfmTNGywlnwgEvHtzWyg
         Wb600DRtC+JvqGfpshcXpO1O+Km2t9ZOcgEg1eMxkL5O9KLbFteuCMEPI6dZ7ZEzLT74
         gyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403208; x=1715008008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=e2QcRjUj2VrKzWKFMdFyumzMbdLdRH9Z9Z9naByyuk05riSZrQQwoX+YLAOXB56BEZ
         HGE0sdXJaKSBmNfVP4zrCyLbeIOtFIu9LmyGGsUqGPy4mwjFHFWZYmUtCa+klPIXCUZ0
         Zy0sKe/nDbg5QHPHVCZdOlojwnKnhWrk92iuvm5Amrhc7X6uia9qe8lzasdZHGLuz12K
         f6yBMeebU5QCJRUZAABUJp0QX3JskeWBmHZngDMIsGv5g075tJQwoz3PVQWA64vbNfEW
         1si9cVagzWZ8QyzhoChr5IgvwmMiJLLNdTIo9Wwab/3XqIKa/7thGk9lHdiO0Lmp9kX0
         hv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2ftxW2ZtBeHuJbrmlNkL31Rq/4hhNXcwUyeNrhGHoXqDKKhui8NYLnxsgkaaq1kMS2V9V05XFj6OWhbWuD8wpVx9CY6arSOZX
X-Gm-Message-State: AOJu0Yz2Ju3y856YAUT02bVo3h7ix48m3uukPnLdBVYMqxJ1iuHKyB7n
	RR5GS1f9F6Rk6HNrC7FKGRP/ZYGq1aWnDGA1IpzldY8DcSvREiXIcskCu0PP+yo=
X-Google-Smtp-Source: AGHT+IFUPbNj9asOLzqFLPgus0GUY/Odrs/fM5IrKod7ciE1XYceryhw7TEo0KRJRFoqh4qbjQ5JMQ==
X-Received: by 2002:a2e:9586:0:b0:2dd:c6c8:dff1 with SMTP id w6-20020a2e9586000000b002ddc6c8dff1mr6069010ljh.4.1714403207977;
        Mon, 29 Apr 2024 08:06:47 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:47 -0700 (PDT)
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
Subject: [PATCH v4 11/11] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Mon, 29 Apr 2024 17:05:04 +0200
Message-ID: <20240429150553.625165-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
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


