Return-Path: <linux-doc+bounces-18911-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 599FA90E99D
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 13:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B7EE1C210F4
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 11:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83B114389C;
	Wed, 19 Jun 2024 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SpNlQSWG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E507E1428E6
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 11:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796943; cv=none; b=D9VfcOBjrUqL9eF6jCKIkwl6Zy4DdZ2G8TjSIilF621nEKByxXBV8vK8kZ0k4VcJOvTklx0etouAJ31T+fdRl+FsqzjLj8DZ5KTlMSJ6vWouYuiWj2UoNxzF0uw4LVYPJ9EE8TQcYQPWGzEbXUQMNC7YPHmsywrrOrCzYy9wtuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796943; c=relaxed/simple;
	bh=u9eS159/gQVfGELe3ar2b7IfHNAnmTqLMPv1CW7TBVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z2i+VldZViVs4cjCYcmx1m/J1SnIt4H3WVkA0hz+zXr6APlKtN5dNPISgTCol+sqODnXZmF/UK0UpdFv2PzwOxBZcxIXrT2831hkSvdBGTrDhPoW45Pvq9VP0Zzg0CvS4rby5XD0XkjkSg6hHGwS/15I4jMXdWYxQ0NLpOaxhWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SpNlQSWG; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebc724e1fdso7522691fa.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796940; x=1719401740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gKBxLDJwfEAb763w28hTKCR1YKQpEepRMlpfnF6GRk=;
        b=SpNlQSWGEE6flSprfOxsWul3nb6/gkjsiSRqSJHO4oW+XHCSVqnFs89xfvVfNkiEDY
         X3OyKtN8MMp+gvvkauYqTAPNCrWHc+3qWWIuCdyHOsA0KZhRrwg9MeCd6QUzOP3dLMmn
         mGDfPgzRMUWb7YBRNeBpTt3u3rAqWwnXou2GGOg3hUH4KUs5MuPFjM+XDl0UaQYc51xG
         sgGEzftPc8XMafS7IwSYrPf11shHg6X6wFWt9MPT7+fbv6hcQkFf/dot6GSKz4h8hifh
         birA7jDdyfKcLku1EKkh+XiYCY1hIjwV2MZO0Ucoyf0iPGFujc3QYiC/+i1K3bZKYL/N
         uyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796940; x=1719401740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gKBxLDJwfEAb763w28hTKCR1YKQpEepRMlpfnF6GRk=;
        b=GDw23vg10tZnWuG6iisqi2yIK1QbSaiQB4es4DuS3x6MDSHzkGx/Z2UC9S5k+JcIVR
         jTRMWJjWvZkDTrQQJoqItoSjTr1zEkwclCY2/cTTeOAZigJSUK4Y3G/nhLiERFAGWTgk
         KSoADQUpsdnlTc1dpuy5fVd6Mvq4Vt3R/VyEsXPy5Q4q/LKkAZYtpaMIDwDPzaZ0CNpd
         LMtN2+ROn8GYB6N6fcMRISHR96XK0GwPEahhXNsGAaCk8pPfOK2szPZshHD0+3Kmhm6j
         S+elwkBnI9xWxqSLtkI/n0BjgQCDciYIfzN53BqiR5IoL/3zT1L/RDnlu+86+ixVV2Sl
         U9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUc8K6tEADSNJcrriN98Xr6RMCQoynZx0wffb+pCjxpJtygqCjPNs0jqBIyONpeLs/hpAYoGbhb7mjuymHkANcz9yOF2Yrh7wa
X-Gm-Message-State: AOJu0YxZNTzgsPNEXRzVdC8n5tB4tLsLj0eIlNl2FAi5rmJOU+VwCfXp
	WXYcur7pULS4ZKHZU0OL535Yab/AX78BWvwkYnjIM8QHxLOBPOGgK2FOsZAMsME=
X-Google-Smtp-Source: AGHT+IEWSbg+KZSq17hNUj/VE/5pG5Suf0xxcBkBdQ1cvXjR8IOan6tfF5P9mBZyvKmi3xNjY8V9WA==
X-Received: by 2002:a2e:a98c:0:b0:2ec:4176:dcaf with SMTP id 38308e7fff4ca-2ec4176dea4mr6715961fa.3.1718796940175;
        Wed, 19 Jun 2024 04:35:40 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:39 -0700 (PDT)
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
Subject: [PATCH v7 04/16] RISC-V: KVM: Allow Zimop extension for Guest/VM
Date: Wed, 19 Jun 2024 13:35:14 +0200
Message-ID: <20240619113529.676940-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zimop extension for Guest/VM.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e878e7cc3978..db482ef0ae1e 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -168,6 +168,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
 	KVM_RISCV_ISA_EXT_SSCOFPMF,
+	KVM_RISCV_ISA_EXT_ZIMOP,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c676275ea0a0..09f0aa92a4da 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -61,6 +61,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZIHINTNTL),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZIHPM),
+	KVM_ISA_EXT_ARR(ZIMOP),
 	KVM_ISA_EXT_ARR(ZKND),
 	KVM_ISA_EXT_ARR(ZKNE),
 	KVM_ISA_EXT_ARR(ZKNH),
@@ -143,6 +144,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZIHINTNTL:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_RISCV_ISA_EXT_ZIMOP:
 	case KVM_RISCV_ISA_EXT_ZKND:
 	case KVM_RISCV_ISA_EXT_ZKNE:
 	case KVM_RISCV_ISA_EXT_ZKNH:
-- 
2.45.2


