Return-Path: <linux-doc+bounces-43464-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB57A91BF7
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 14:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A66B444E25
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 12:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E1C24C062;
	Thu, 17 Apr 2025 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ibjRwoLy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BDC2459C4
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892703; cv=none; b=smgZ3z5/xNESmW/vqQZhna6CeejO4dDYcFlo+dXGhiNi57ysSoSiu0xfGwW3oM8PrrxH4bJlBFASyqaCqvzY2IvcGi8mxqEdu19FzSkLVVwRkIbIVZwghLHUtWI4/LRpMUAiIP9G/LTFdgMJMfOMgkahl4pv3ezGOQxyD7ApbE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892703; c=relaxed/simple;
	bh=L0SOEIAv8LuDbsk5R4W2vKNdRPBPIuIziKfqu3ZTv/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ExSY8kfAo0aoE5pvrNLQQtSooS+gFiOpqfG0akb4g/1VPtQmzq1bbYR3EDUnj4gNJcR4OR1+skSkdu8h0EqHpqbc2MJ0/vrajBGpUzVFVjp+Em7fONlzg5PU60KCc6Bj2YJ1p2El6prJ3n2owRlXt9aH0Q6+o3wbPly499BQPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ibjRwoLy; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2295d78b45cso10719675ad.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892701; x=1745497501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIScjDpjhLjkf06YMmBlHqg/pe/+cSuNoY3aF822M2E=;
        b=ibjRwoLyq3klgkP2O4tGwsQNbHrlVJMDwyj0gVRcROYqWJbK8lJpg3JzpmE8b5fDPu
         xm5xqp7mP3DliefOJeGF7mykkyO8wFmH5a1GFi3IAu8QbBc8Elx4p85UeGgP2qtsk4Fr
         2cUOYOT7GBRbCJpLi+8Kel+Suo00Px9IfgFdbEBZq+0wlopQSY+KDHvcOkcvbCSsgNCT
         aaiapzTVUlDifizVC/BR97d+1UbnB5hgwdn6ug4H0y57KRldePSocZNPEEbgvqHfjAqR
         cAmGUIt08bs5abfwcQJJSI4gaEth6LMF8oTx2EC+eHXSRgCixztSfXkQEEWdocDbMypb
         pVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892701; x=1745497501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIScjDpjhLjkf06YMmBlHqg/pe/+cSuNoY3aF822M2E=;
        b=cBBoswPSk8+Q1ETjmzlTdOr9iPL1lAMCh+XeptYelwfXDBWwegRJD1MZy2qd4epjmC
         x0ncZDFk6t1diWtrSC+7N9Ce8aQUJej28B4gIs0mb7wYtzn3rQTONamVZven1KKQwquy
         dmEFANijxk1BHfPzkLpLelEwkOSQ8zH1rMxzCvVFohZ/xtc0ZN4rtLQtMyuZaPq7VlVd
         ZuQ4ahX9DpBOieHt0Sza0l+O8vN3wdKjzKVZXr+BnjXVNf84MyXqk74n6HqyinKv/2N4
         J8D6u/MGCrPxeegs5j2yk7xXorgHVfQ+nBM6Ao00OZNOuWv4Zo/6bNdMQqmZx6Cq/adK
         pSFA==
X-Forwarded-Encrypted: i=1; AJvYcCXLWjETkBnv5/zJkqZ2vL1VAK+Cg0ycxLm9TMBXgsgxoFVZBYQomOuUrQMAZZs6MfBsPbVFBkJowuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3AUMDBfREH7TEjuzJIph184QS19sU04XxVA79Cb0OW+SLKZ+X
	N9Ayut4PUAaG1UNdROYjKO/iFpPMsyiTANF8TZBQMz1lWlEjviVbje0sPwk4bok=
X-Gm-Gg: ASbGncvMQquhD/x580X8l8dzSDI35UZZlEytLpF1cfnR32rsOJ6WBUMZnsJYzU92+o3
	G8l82aYX8rwpqxPUDBpeOCoawMbbiwYqXI8C9yomOgoDZqsilnKGK3+vkPQWNAR1NrQ6WM6zkwf
	yOcNLNfsHRfxLlKKpBj786V0jYigWyPw3kBiuVShi50zN7ps2UJH09de+4PGG7GsLp/YXLjO5Tq
	arUdhxO3L4r6n9agUi117kqAoimHZMjSAUi9836o+ZR/CcQ7xN/V0mB3w8r0AR6je9g9JU0+On/
	PAhQ0IP+tszBLRX+aS0hb6VNHXVty3rdMZHIHSKGPg==
X-Google-Smtp-Source: AGHT+IF+QdSHgucK282rG6JIZxJMqqmRWlCOO1zcFo/iz9JeHV9jdYKxWAUM/FMJsou8iVRkgl5odw==
X-Received: by 2002:a17:902:d48b:b0:22c:36d1:7a49 with SMTP id d9443c01a7336-22c36d17c11mr92045175ad.53.1744892701180;
        Thu, 17 Apr 2025 05:25:01 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:00 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 07/13] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Thu, 17 Apr 2025 14:19:54 +0200
Message-ID: <20250417122337.547969-8-cleger@rivosinc.com>
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

misaligned_access_speed is defined under CONFIG_RISCV_SCALAR_MISALIGNED
but was used under CONFIG_RISCV_PROBE_UNALIGNED_ACCESS. Fix that by
using the correct config option.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index fbac0cf1fd30..c99d3c05f356 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -362,7 +362,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
 #endif
 
-- 
2.49.0


