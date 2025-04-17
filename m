Return-Path: <linux-doc+bounces-43458-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB38A91BDA
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 14:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87DCC19E45D4
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 12:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5B3242917;
	Thu, 17 Apr 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UUaIr5Vv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FFF243969
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892651; cv=none; b=QbpRmGngpMnz+MzQYWrtXOFHptphX5fFXqC0kMUxuy+wmlqAYcG1H1ozr/UOICdtBwQ+HStAVyyMnn8MYGzQNZUmb0WDnNQlAWpQj2IIlHGhgPQWj+MLiKSOt9P3qCLlHtYRkZYVGqiZ3ldtQZ74CWIkRVfQsfdnx7nv9RIXx/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892651; c=relaxed/simple;
	bh=aFqX3fLDtG8cy76aRcSSCxbszjtqQl817f+Kcc6ZMK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i1tPkeylwrpOPa78cUYvSF7pU/IKERR5IQJpXDv4HIfJCgySCML8lzy3Hx6jJdblJsSt2mt6BeV7XifE2R4/neagffpUpc/CeMvp9RUoklTEHcbmn4b9jqziXSs/t8RB2CGvCexCMLSUkJzcJIqAGFIFGjKuqPxriA/slVd0C3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UUaIr5Vv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2241053582dso9939185ad.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892649; x=1745497449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqV/L1fucoXh0zEq3ZbEkv0iZBTOf63rS7eOzOMDARE=;
        b=UUaIr5VvnqnpwxR3b4Zv8M4q8rfT3fUQA3CCrOcZX7gn8rcfGVmlM7/Zyw6bsU/G/f
         szDiK5M+YjiZoofXT3zdJn3IVDmvZOHmvsTeidxVrwM1eS7833q9ME/pa3F0hXzwCx8a
         7GkyvMsrEOKxDb7hc58I+VRxeDxykDrkMYGHNYO6Y5eJDMmdgGi+JH5MEj6E2ukp7Jk9
         Z+ng5rJ1MaACj7AwJjEu+Z6t2aetDcOyew9nnYYE12M4cp9cjj6/D0UqfcRWrLAu6VCV
         xWrx+qYTu3EuF5Zl2jt/OA3bwwt4ROg6Qc8UnV0toQTQtnSLBTPxrG9iKBOgsliJDDtU
         8jtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892649; x=1745497449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqV/L1fucoXh0zEq3ZbEkv0iZBTOf63rS7eOzOMDARE=;
        b=oZuD3eSVMxWqM6sQxTi99MxLdcuUCQ0+DYCJE5JRWBHZtue67AqD1liFY9mrQBBfz4
         Gvuuv6uXIeftul/L+ws0977jJrtHEscBbxaaqaHHRcXzWpIuIdy1aLrfTQH3VNwv6JvT
         x50O1FzYoDBgCuWRlKfazRuuOfo63hslgJM0c7EIlgt385Jh2+h54MaZ2KgItvOk4p7A
         3n4B/o+IStDCBDyyUog+Vw1ehDIJJq+RnX//Ml8HkNECcN7N4FEhEaSirunL1hf86Q2+
         Fx3QHROVy3W/KpacwKwa5CY8xeiYdS0q8pRaXJQc5YJwfgAHZzBmJ64RyCGDJNyfYZpM
         Weqg==
X-Forwarded-Encrypted: i=1; AJvYcCX75HKKTUerOkPoCceSvJ4Pk03ssBxTCYGXc9fc1ahL68LE7bA5C9Pfvx4P6hoPj0O0nAntgc4ygCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz04yYXW/HErHHApUROyfVCt6WPLih2l1ytYarsdyhcnH5yqYV9
	o6i7uQ50PNmAd4B9w+prUCp4nDkVjULZ72s8njMXn8hZCSZUtfIXpjLT7DkzZEo=
X-Gm-Gg: ASbGncv9elKL1oXuWC+hH1ZoBJ61WJRxazAAYLXnDUEpR6xkoCLuSaBBc803xs/+tfs
	UyXRoR03wH9vfTggqIZg8SdoKqRcxgRPS+2+hVHBak4D8GSgRM9fJr6HrQfZj7k6fvvAp8UuDeO
	wnN30TsO/74C1w3lhBhD9CPMOMG5KI8cK7Qu3zzxamZi2QDapXX7hmfC9WNhtWsWIaRs2ATKdx8
	3P1x52McPiCuUP1IjK/W8dwEt5EqZsn6A7tNfj4vMRWyB7OXLFg6+VVmP/m/ahOUJdnks3My/8D
	KDy7K6jNdQu/NvoINqldx19S8GtPMsWK6eqG1I+u8A==
X-Google-Smtp-Source: AGHT+IFVHOWJJRAXEzH6mdZNYusO/nzJmHfPymZgz+gveEEgUfllUOzI6Ji7vwcW5uJ8Q3EqmqJGfw==
X-Received: by 2002:a17:902:e542:b0:21f:f3d:d533 with SMTP id d9443c01a7336-22c358c542fmr78901385ad.2.1744892648939;
        Thu, 17 Apr 2025 05:24:08 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v5 01/13] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
Date: Thu, 17 Apr 2025 14:19:48 +0200
Message-ID: <20250417122337.547969-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Firmware Features extension (FWFT) was added as part of the SBI 3.0
specification. Add SBI definitions to use this extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..bb077d0c912f 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_FWFT = 0x46574654,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,33 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+/* SBI function IDs for FW feature extension */
+#define SBI_EXT_FWFT_SET		0x0
+#define SBI_EXT_FWFT_GET		0x1
+
+enum sbi_fwft_feature_t {
+	SBI_FWFT_MISALIGNED_EXC_DELEG		= 0x0,
+	SBI_FWFT_LANDING_PAD			= 0x1,
+	SBI_FWFT_SHADOW_STACK			= 0x2,
+	SBI_FWFT_DOUBLE_TRAP			= 0x3,
+	SBI_FWFT_PTE_AD_HW_UPDATING		= 0x4,
+	SBI_FWFT_POINTER_MASKING_PMLEN		= 0x5,
+	SBI_FWFT_LOCAL_RESERVED_START		= 0x6,
+	SBI_FWFT_LOCAL_RESERVED_END		= 0x3fffffff,
+	SBI_FWFT_LOCAL_PLATFORM_START		= 0x40000000,
+	SBI_FWFT_LOCAL_PLATFORM_END		= 0x7fffffff,
+
+	SBI_FWFT_GLOBAL_RESERVED_START		= 0x80000000,
+	SBI_FWFT_GLOBAL_RESERVED_END		= 0xbfffffff,
+	SBI_FWFT_GLOBAL_PLATFORM_START		= 0xc0000000,
+	SBI_FWFT_GLOBAL_PLATFORM_END		= 0xffffffff,
+};
+
+#define SBI_FWFT_PLATFORM_FEATURE_BIT		BIT(30)
+#define SBI_FWFT_GLOBAL_FEATURE_BIT		BIT(31)
+
+#define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
@@ -419,6 +447,11 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
+#define SBI_ERR_TIMEOUT		-12
+#define SBI_ERR_IO		-13
+#define SBI_ERR_DENIED_LOCKED	-14
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
-- 
2.49.0


