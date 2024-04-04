Return-Path: <linux-doc+bounces-13488-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD3D898525
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 12:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCEB91C214A5
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 10:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D4884D3C;
	Thu,  4 Apr 2024 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="sOedv3if"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A33839F4
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712226872; cv=none; b=mww8QiTO8n2vIW0Orp0BjuMJFMrqTETozEcRFMLfEwpJZDNbGAtm3F8PCHjnFlvyxs+aOZZ+JtctDaF/slocFIgq+mbh2l+PcwhDICi50b+aaHkm765acgXNfQsiQ3XaztRAv8RHVhcbVYo3KbG1DeeIl7u9wItKlXWJSuCZLEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712226872; c=relaxed/simple;
	bh=3pUouzGKtTo71pYkdkJFB3gRP9khPlS9i6RZ43zvw+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=svKNrBZKSx85sVJQjv+BhQfTUs2EPXLI+hfcm76QF5HR9A+uwF0dxOgkjx+2QZNXO9j7j2JHrk3a1+qvOjG/lfPUP1mx54T1qSEOSP3BytOlt/OpsvkanLqoahjVvDP7tMXfTOMAwpHsjzBhOfyiqsd+AmtpOsE9ew/2+7p5yq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=sOedv3if; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516cc5398c5so142764e87.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712226868; x=1712831668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrSVtGZRwZdqSUCPKBtbbPV0rvcWw4KEF79SGVRT1V0=;
        b=sOedv3if+OSBwFJdc4sgFYFLK3L7Xk05DJirkiErKACVIxH4wHgftYXAioYktMVYaN
         NdAHWZ5Wef3oyA9Jta3lHGTnNUo27gqf/Th19WkNLDuOE+7Dyo6PEFkzIWGua1MjRcig
         +fQHV8OCXE60RzexFc/4ycpyMM3hMfu0I6KWZnmYxpLcy4VyL7/RMKVf+k7M4vWlFdHI
         BDd4PwBM6Hh+z3r2C1wU3QylbgRE7ZLvuA15QPWHaQJEsSe3O7vKBwpqpT5usjhF9A4V
         nYbNfTubxhNOXb7Yi1ZlsWulFau/Z13KajLoVmAz2tQjduJXpIVcQKZDOq1ZIvecOHHE
         YR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712226868; x=1712831668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrSVtGZRwZdqSUCPKBtbbPV0rvcWw4KEF79SGVRT1V0=;
        b=rGY3r7Di8lJYe2eCx194nL0mbcE1taE+1lIguGHGrJgAMBJg3JW8nlZ+YJAUXcksc/
         lwhEgRNnumJnUqbJvUfHl+3xZ3H9izIMfWAe7CwWroM0dTglhUqzeS0asfYcTKQwLI8y
         pO+VxMwlbyrq5Q6j53nM3Yi8VBhHnAUiACJKgwDSF8Dpu3lhtASdMlB8fLCCHmCOL7uG
         vapFcoKdORDvXNfZstw64egWudnBXF2XerF8QDdKQ7/G7pLFVhxkOPWgbXGak9pksVrZ
         saCLG0c1OkTscKzdk+pdTYdH3vk0h3h7ygN49HKmq6cPL5TwVCcBI/NKWMymoeJauTF/
         H8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXGYcSIWn8Xhy9F3yLXN5rEJzLgSh54Hk9iPetkZILnuBBf63jIP5RiEUFXsWVXumQ+KwKIdWBSj4LDgNokNTRW8PqvYsiEqQDM
X-Gm-Message-State: AOJu0YyI7qh2bPJlJ8nIjM90wr9TZX/KlI9BdDr5E+FPyJ3dLZ4QEJL0
	5cjlQJvjVMwKbeIEBbuKNkBSLQHNif7P/qAC3jU5dznKAd+mNxe3cLfXUqhhrnw=
X-Google-Smtp-Source: AGHT+IFMam9bMUHsyC4hhqDHYaIA0cA7zDlkrbsJGTyXcu6kj1HRLq2RIgLnRvRONkTw5gP+iloRaA==
X-Received: by 2002:a19:8c0c:0:b0:513:d0dd:95ef with SMTP id o12-20020a198c0c000000b00513d0dd95efmr1384037lfd.5.1712226868674;
        Thu, 04 Apr 2024 03:34:28 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:555b:1d2e:132d:dd32])
        by smtp.gmail.com with ESMTPSA id ju8-20020a05600c56c800b00416253a0dbdsm2171340wmb.36.2024.04.04.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:34:27 -0700 (PDT)
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
Subject: [PATCH 5/5] KVM: riscv: selftests: Add Zimop extension to get-reg-list test
Date: Thu,  4 Apr 2024 12:32:51 +0200
Message-ID: <20240404103254.1752834-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404103254.1752834-1-cleger@rivosinc.com>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
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
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b882b7b9b785..40107bb61975 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -67,6 +67,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTNTL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIMOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKNE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKNH:
@@ -432,6 +433,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZIHINTNTL),
 		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 		KVM_ISA_EXT_ARR(ZIHPM),
+		KVM_ISA_EXT_ARR(ZIMOP),
 		KVM_ISA_EXT_ARR(ZKND),
 		KVM_ISA_EXT_ARR(ZKNE),
 		KVM_ISA_EXT_ARR(ZKNH),
@@ -955,6 +957,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zifencei, ZIFENCEI);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintntl, ZIHINTNTL);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
+KVM_ISA_EXT_SIMPLE_CONFIG(zimop, ZIMOP);
 KVM_ISA_EXT_SIMPLE_CONFIG(zknd, ZKND);
 KVM_ISA_EXT_SIMPLE_CONFIG(zkne, ZKNE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zknh, ZKNH);
@@ -1010,6 +1013,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zihintntl,
 	&config_zihintpause,
 	&config_zihpm,
+	&config_zimop,
 	&config_zknd,
 	&config_zkne,
 	&config_zknh,
-- 
2.43.0


