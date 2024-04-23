Return-Path: <linux-doc+bounces-14890-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED88AE69D
	for <lists+linux-doc@lfdr.de>; Tue, 23 Apr 2024 14:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5739F282107
	for <lists+linux-doc@lfdr.de>; Tue, 23 Apr 2024 12:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D14135403;
	Tue, 23 Apr 2024 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="d9Tw8K0V"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF73513443F
	for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876229; cv=none; b=YQJreXrBBpcY1GXTmVJShuW3t5JYmYi86X9cJhWoloEFyExAapTixj2+wh6x7BGjD1wBi7EpsEA7ee6tV+YzZ0Xi5WAtYUL02kKhbPkDFL/Ioa+dTaXAbP5We1RcyqsT/Kjiihin8Qd/lSL8GaHvctAoIynF78f+M0XQrNkAXmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876229; c=relaxed/simple;
	bh=bVEuZKlZZ0yffOCE7tYaM0ZOFAKNB5aKfkAz8DnA8Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lVzQQA7xCt3nPoGq9WsFQNjq7h7xbndGFmdzNOkD2ZlkHPHhNS3W6yhEc0BDOjwgR0YaRGUFUsn6TrT28t1ti26bzxLsBNXS+wz8lP10WIbvGGdFH2+XXyy8wHydZP9kFJZPEohDqv9BpqIU/CjhWielQbnhX2jdkf/Hg7QPeuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=d9Tw8K0V; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-349a33a9667so871990f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2024 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876226; x=1714481026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKUXibPhUwjjSXA/KBDdbbKS1P63ijLLovqIt9fNrZc=;
        b=d9Tw8K0Vm1Xg8H6jF0AxCo6MtOsQKuyYoneohG/kxAQOFBKiGRYBYFf4ms4EQ9jsAQ
         7bvt/Je2ooFjuIk9GDXVjreymut8b7A2NC543Sp3yk9zXVCESrmjNm/lakjHL083clFP
         5APQ/7VVEENmIVBkdkFu1hMkyLM7dw8luJ5qwFclyMyMNBqp2kOCHI60rCjfjlyyY/La
         Ks+ZOt5L6TZ/3yFq3O2taGMZ32ihwjuria+Dy+f7KDjNZY7pc/tSUZu2px9/epA16Jiv
         TKsyjEbc/t5gL1QSM3AjuxJfujI5sxG9YCHcHQR1v45RISqqvhXgSwPIWbmw5DhzaMm+
         WvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876226; x=1714481026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKUXibPhUwjjSXA/KBDdbbKS1P63ijLLovqIt9fNrZc=;
        b=pX/TQxAZeHGjcaAAm7THBFaHbr+0qao66oSXjLSLU0uRjUNnZ7QVo3vOGW46jcj5W4
         JQcF3U+SnvWOLFYnuh8yEGR8ZHWx+bJVvPxkY9Ky4m23XjojTmB2W625CxNY86DiNCIj
         lMLkFwvD1NL0Yj/A5VpEulRZcAAwYQtqhtk4zgHBka8WXg4/8VPktdXFIkxZtSmRQmua
         MHtUhV/+cGULYlfo4vauKdlZnx85SCY+vo4oVdlJ9zgPVi1y4KN/yBsXjoqr9S0Odo5M
         sOZ3Ps43INRhXzBuf/x9+fHakmUQMXgR93WVsHR2p7L8XPKL6Nf8iJDx3wFegoYdBd3G
         onZw==
X-Forwarded-Encrypted: i=1; AJvYcCW9XvfnrMAzFopDZzQdGubotD+jwkaovYaipiw/eWT/o/3sIKVj69vEpVORrP3UwET1ut30XoS565DY5SvhPjLzo7MoHYLbUef6
X-Gm-Message-State: AOJu0YyNQAqjxVtuhlCf2YNAo/BzeX5tPUkF59FXOow+SwPKCn13Vpsv
	fLzZ4cD3zXhI2OMbZiYN15Z65gszGTpvh67kTt2NJfqIEaZvySJ9UOdIoLpvq1s=
X-Google-Smtp-Source: AGHT+IFUqPmuRaat/0SXEHHyjTSjZr+ZQTV3TzzwWrI3rXhXB0F+LGSeuZbKVhACNb/TBD8FDVBF0w==
X-Received: by 2002:a05:600c:3b8a:b0:419:f241:6336 with SMTP id n10-20020a05600c3b8a00b00419f2416336mr6604350wms.1.1713876226513;
        Tue, 23 Apr 2024 05:43:46 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:46 -0700 (PDT)
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
Subject: [PATCH v3 05/11] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Tue, 23 Apr 2024 14:43:19 +0200
Message-ID: <20240423124326.2532796-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
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
index 12436f6f0d20..a2747a6dbdb6 100644
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


