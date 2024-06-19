Return-Path: <linux-doc+bounces-18947-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB4B90F288
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 17:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C736B226AB
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 15:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A2B158DCF;
	Wed, 19 Jun 2024 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OljYsPa/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E9A158A38
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718811677; cv=none; b=Rle3xRZd9mNCUsNDvQBpTtDc8Rv9WKFGsNonCR7NZNsVGf2GUUe7rylDaWw9wLjdlW8K7EIEwlVxGSWMZa9BZ+45nhTP5ZthM9mT82Jf2MhTnYjIGG7jyxZeHAO2SVcEiBBxjbS47YWE7HYmBD1a13oHLxR9075j7GmwrwBvqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718811677; c=relaxed/simple;
	bh=7H3ZZ/U/d5MGGck8wALvbGs4PxOtO2VkSs85+KZ1HfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfUmpxB6Z7mlyCOGcNZQngE2KpBEco2xOI/UjpyzdK1VXxxdreKoT+3ECyRQ2L85ibiItZmN0Xedl5Aj3ObKEkQnho7UaQ2Qz4a/Q4e0XuW6IOzybVGMELu7voyX3gW3wNF4KqF9cRvwui/L+T/UuBidlmbxbu529uxZ5UUaA9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OljYsPa/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4247ae93738so283635e9.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 08:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718811674; x=1719416474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPY+3E4dBoFlMa6qj3x8QVsLE7eX+roIHLt6ynEnu2U=;
        b=OljYsPa/SDvi/ATMKcTp2LDXb7/rH4BLAZhBzlGl75Lnz0PJmgSpgdytGQb8wHdbNA
         64qhKqWfr6iHWEFD/iLu2PU5ZaYfqtsYgSl1HbtcIPtV2e5WzwpWx1hjH+wrGtgADRFh
         Y3i2dyLGnmbSwqUFysXUIsLZ2jgLIiIez2LShYrfGLA44ctvwfgjx+e4qtzi71scO4cy
         DYAyoBTEkBVYAvT65PMf3HQkwkZ//2UbRQszXdHLMm0LnkhZPNScRyCe6nEnTqGhwaON
         nH4rw/COVLXFJKoffe6SYV2i7gNzkZy/yCFk38dKDIDjGyBBJRvdxSuflBWSuFN5U+qy
         vQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811674; x=1719416474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPY+3E4dBoFlMa6qj3x8QVsLE7eX+roIHLt6ynEnu2U=;
        b=QIPcff7foVz09xvWyFCOKjiMHxIJ1WRmxQxdrCHxk5ondltQl0mwJR2RCQ4zoQ8H/l
         Uk9n/7bNr++Qwf1AFb742du6ybHzwD16BYP9UVgkzVYUXMAKBC9187AtY6Q5XT0YVX3r
         Sxf8Q4IlS62QWooJZKPVlvTOCbhhdXBe2l9sYI+mG1W5T84anceq3USeA43IpeSgt1gm
         Ro4BkmDWOt3Hj7G7AZTt+XMt621kRaWNeN3NDRFvWxsYio+akEVP2D2k5++gEMxQFI6I
         HTfOs41WSC795rlsT7nCf1wuSQyn1+Rknj/lGq7cgsi5TFJBYYNOXRE7TdRhdRM4HXYb
         YLNg==
X-Forwarded-Encrypted: i=1; AJvYcCWOH2CfVZHzb7dcnHnHcgIpx4RbFFZKm2RG/MZZdDV0eAysg7yf3b8E07aIDtS9MUykT3UFtwhKQ5o5iy0ajRXyCarntddqcqhQ
X-Gm-Message-State: AOJu0YwoOcUmB8qinyhSy2YPgFSrTbRKXDlb7OtglUMHkwF2+QbwMI/d
	uBgGWqQSWf7VmdaDgGvQoNXvJ6cq+43IxOKKxPOxq7nHxJKig3d9pElu2ZJLmhA=
X-Google-Smtp-Source: AGHT+IHEyMK/ITgXlMXOhDLGJETYUb24IsTevTAqgLrmuWFBKFkU3n8nX5A972+nIAwKJBmfBumqAA==
X-Received: by 2002:a5d:5f93:0:b0:35f:2929:846e with SMTP id ffacd0b85a97d-363171e28demr2732165f8f.1.1718811673916;
        Wed, 19 Jun 2024 08:41:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:819d:b9d2:9c2:3b7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c785sm17392292f8f.34.2024.06.19.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:41:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/5] riscv: hwprobe: export Zaamo and Zalrsc extensions
Date: Wed, 19 Jun 2024 17:39:10 +0200
Message-ID: <20240619153913.867263-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export the Zaamo and Zalrsc extensions to userspace using hwprobe.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 25d783be2878..6836a789a9b1 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -235,6 +235,14 @@ The following keys are defined:
        supported as defined in the RISC-V ISA manual starting from commit
        c732a4f39a4 ("Zcmop is ratified/1.0").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZAAMO`: The Zaamo extension is supported as
+       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
+       ("integrate Zaamo and Zalrsc text (#1304)").
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
+       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
+       ("integrate Zaamo and Zalrsc text (#1304)").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 920fc6a586c9..52cd161e9a94 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -71,6 +71,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
+#define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 49)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 3d1aa13a0bb2..e09f1bc3af17 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -116,6 +116,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCA);
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
+		EXT_KEY(ZAAMO);
+		EXT_KEY(ZALRSC);
 
 		/*
 		 * All the following extensions must depend on the kernel
-- 
2.45.2


