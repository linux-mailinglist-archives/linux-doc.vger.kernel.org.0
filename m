Return-Path: <linux-doc+bounces-39477-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4C4A455A7
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 07:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEB723A63CD
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 06:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D6B267F64;
	Wed, 26 Feb 2025 06:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="I9sdic8D"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA0E1DED6D
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 06:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740551548; cv=none; b=Pr/N3sABlQyaaJ2NZW1ErWXDs0sIgukaL7eYxNqGuTZmBpvt1G31DB/ch7L0r9r6a9ci2HiZCMatZ46PU2kf4AQFrhq6Qr6K7f1sY8DwFJYQjgdoavNu2S0i6juTcmALjR2u4gCvkFApXzgL+708LX7cwkUTuRQ/8707dABv4ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740551548; c=relaxed/simple;
	bh=6A+KzqvEXADqQRFxfflnjdJnKHnamJmScDSK6m9touM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVNVgfSVDUxe8OA0oZdy+n8uA98IvY/uQAx5EPWhOtQZn9en/mwRPkxEz7bF+R2PGVfrhESfuLY74cjBo665Gt/mHei+Ddegt1hnCtmxzkaqM6HirLpOhDUSbA0qP8RIHXAzqS1rNuFeDeIp1MD0JXwSA3wDco4bRIDV9zmAZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=I9sdic8D; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220d39a5627so98487765ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 22:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740551546; x=1741156346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLyDt49U/qvQrnUcu83brJz3XFH8EzOsk0B+VADLLKM=;
        b=I9sdic8DvQaA+ur5tIZjSHBAtWVFMY0lJrbu2EEGMxGkgrG7J6EtEK+N6GU4SV52+r
         Q4Ce7jP/Utk5l1Bpfagyc1W9/GAfL0k4nmnY9kRiVrm8NIuj4khH9ygZO3BnzSNKSzp/
         EESJ7bwGDgz8yFihIUfjn6Ok0mJjtHf463yH30n4cdP0C5nbwZMtNULyB4ZXzgbEMs4S
         /QZsqfCEvGKp8J4+k3ulw01qenQ9sdbSbU0YqqieXZ07ozMOzD/AqFNJKnqI03Cvy45O
         Sfr9FWPomBecz51A7KIxJNtoxDOFiS9ZQP0gjhglW+Wx2q0rV6o363f0DSf/F3UCWfqe
         k13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551546; x=1741156346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLyDt49U/qvQrnUcu83brJz3XFH8EzOsk0B+VADLLKM=;
        b=fceMO2b1tFQqJYex9HukdBqvp1aLu4u66qJXl5Up3fh0HCrPKmnmAsJJqyQbJnAcVV
         jMAJoAc3AfDei+y67ZIZKFaAUOwpvIIuHP2z6NPSoS+q6dZ7AsrmGUpi2QDjMx9l8ier
         FSFrynX0cVxx+0T/8FSPI4T9bZfy+UQHUvCfCRihZ7tZpEBOATXcrdAzoL3MEt4+h9xA
         Kyi6vZNzbq3yo/0qqEWMQf+2mBOsCmJNpr13q68slQ/uvsLAcIu2OqGCWtIkq3nOLFQ2
         6MMzudgWKFlFxYXQCgVLtL9EUQHDdeMyLuS8lbSnlQZJYskvfZJ7gjCdn2l/mEUCOi91
         jPGw==
X-Forwarded-Encrypted: i=1; AJvYcCUgymfzze+e4Q37OARCocViGmRUwg5NHrQ7N9VFeNstuJJ4m2/+ejiaPchcCNSdJlrcjcZkqsiNFm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOZ8AICK/ONU48iYFNhJ3wVc31UZUul+mX0WZr6DU7ZiTmnMxQ
	Qsax05/aEMeCu+wY9o5BeAIm8EJtl3IuttETF0wOU5egvsmaXfikvO11R20/xmA=
X-Gm-Gg: ASbGncuGQqDRd5ND+8crpA610yu78cAqYwSK+hsE5CnWZgduV1DzHpkid98LKennTQ/
	PqZWBd6OQShtExgE4CUFk57+3Te/cfdMZYBBkvFVseA+9jQkUTlTqjULdPpiEYuRzsAuQ6xfwyI
	Ta8C5uefuYXP+tQA1DGJZCRxfihlJWShInWF97IrQ+D4s21AmGvrWCN1r/9Qg5efxULwkW33spT
	Kyn1YjATCt5MdyA2YAXqejaSlNXdyP4e+yPRO/GHIEJyLtKv1ijAFTPBiSkOHoZ6wUQuuvnehcQ
	+xNk1/sJmUHrFDIItZOB4q6XXsBvxtkxcQVUuP0VE72Rc6LigsB2YyLVE2fD
X-Google-Smtp-Source: AGHT+IFFs8SZ5lPd2kWTT1U7ETWzPeSTog8WGxZry4kav5NnRHKIbt7T9I/ZeIxsd70AumwEzTSVFg==
X-Received: by 2002:a17:902:d48d:b0:21f:136a:a374 with SMTP id d9443c01a7336-221a0025a63mr347304555ad.43.1740551546420;
        Tue, 25 Feb 2025 22:32:26 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f152sm682599a91.46.2025.02.25.22.32.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Feb 2025 22:32:26 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v7 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Wed, 26 Feb 2025 14:32:04 +0800
Message-Id: <20250226063206.71216-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250226063206.71216-1-cuiyunhui@bytedance.com>
References: <20250226063206.71216-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling cbo.clean and cbo.flush in user mode makes it more
convenient to manage the cache state and achieve better performance.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cpufeature.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 40ac72e407b6..a8b726d0dab8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -32,6 +32,7 @@
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
 static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicbom;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -91,6 +92,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+
+	any_cpu_has_zicbom = true;
 	return 0;
 }
 
@@ -1001,6 +1004,11 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
+		current->thread.envcfg |= ENVCFG_CBCFE;
+	else if (any_cpu_has_zicbom)
+		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.39.2


