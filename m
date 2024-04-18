Return-Path: <linux-doc+bounces-14552-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB34F8A9A45
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 14:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6AEC1C2017E
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 12:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E9816C867;
	Thu, 18 Apr 2024 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rcVYDbtp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2016C6A3
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713444252; cv=none; b=G4EMT5VRYF6KaepIL8NdrLbiDuW6rSiARbROaeLVknMKJ7zXYi62xSHlyQ6CVgnZFvkN2F4dknh+mRYzjIoHnupKiiu9AZx2UB4OwLUybftxXLjAsVR86wzphui3NTps6+bcbFn/T5xhB6qiK9dncb6TVGT9ZznADpOCLNvCr2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713444252; c=relaxed/simple;
	bh=dIKOQ7+8Gx69BlGHAWDa8bC1hIUZKhgNODc1wgGNviA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uUjqOjBwx2EjSNYjYaIGUPV1cQH/ytG/kqnrOofGMN8W2Fuy/tmPjKgS+gbwnYnbXMhoYvPWEGWAqGLLzmDEi/X3/xb6dWTVGoL1dIDozRyGQT4+3bLqa2AnXqwZGBtnfZ2leW4KbQsMmzTsw6wMol8suwRbLSWkVl3RAofWquM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rcVYDbtp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-349bd110614so143292f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444249; x=1714049049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKIlCd7jL5ol5qvLgWGPfJLjgIu96MFC3958FRvJI8w=;
        b=rcVYDbtp/oD3iclrRo+gTusRE4UnxE6WooQhL6SfF+Ch++PeE5AqV5jXpYdcWYwxuT
         SX7aUPDxG26yTxFy9Nd9dwaRFmLphf7Q/+HvDjn5uv0e+jj9E49UVpeoVoyqo/ba68Sl
         nDXcKmUtmQLOQY5jbol4B1j0YOdV9T6P6ZxBLAgqNIxCFJctnsw8JnUNopPs6YK2vUlQ
         S1gWGgL2beA7YvD240cxprgyfZ4kFCAVkpt76H7IMtU9dyoy5DD2yp4utLUNG47XCVsC
         O07A0FtrBncCnnOVTaivuuE6P4nX+NjqZKc9fF3eqNKmBfX9SdZfdPBDNOU6xh7Ukubm
         SjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444249; x=1714049049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKIlCd7jL5ol5qvLgWGPfJLjgIu96MFC3958FRvJI8w=;
        b=VhHRDA9NsS0uiHndcdLlnP9Ndfi4WKnJJuRzCpMz0nrdjQblPXjCCwi8MibbojDz9y
         PcudmuwvpyGde/w3OG49t4M5gGwD1lSTgloGFqXS5W4rX0ZPHbbTpKGdImZb+7jJPYdH
         QqNR/4wmleoDzPG/RP8hM9vTo6Es2pdulRdI7B1uSvwWBKE9A3Gk7Ohp/EgXya20zhNQ
         aeFjrf3GnYlg/c8CIsIhwSyRhATw6A/zHvLoetdLsAaaQrDVc5//mE17k5VNDnPmAgkl
         FcgjdQWoLwVUwfZicRs7tLWhAc1nHmvcgQz5OWTtBWHslDAu/YFnpd9wloCGvhOgepIa
         en/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX44fYmCMSyZrinFk+/CSle9SZenFBJrQrPaOIQ80wxbLBZ6EFAW+8KVvGBnFFyyz6izrvSaDgaQDrZc8+QFc3cE7poE/TCKMQC
X-Gm-Message-State: AOJu0YzBHQAXv6BXwUPy6lOj8wk7dmyOOb86lKCetwRBeRzEfGwzoFCQ
	aybbv7/q0F4XH0NR+vZ/Y1zxJklkoX0QNAPaipbMs+RWyoROTK9RnIRdDMYdifQ=
X-Google-Smtp-Source: AGHT+IEuz3T/wADyuU6lhNByO66nc3HwRSSRfc4RI/wUE1r6vwDm0YQy96IvGIrIEPLWf2aV5baVXg==
X-Received: by 2002:a05:600c:47cf:b0:418:f991:70ff with SMTP id l15-20020a05600c47cf00b00418f99170ffmr135350wmo.1.1713444249424;
        Thu, 18 Apr 2024 05:44:09 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:08 -0700 (PDT)
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
Subject: [PATCH v2 12/12] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Thu, 18 Apr 2024 14:42:35 +0200
Message-ID: <20240418124300.1387978-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
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


