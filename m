Return-Path: <linux-doc+bounces-37686-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B17FA2FC3D
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 22:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A5917A19FC
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 21:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2C42512EB;
	Mon, 10 Feb 2025 21:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Ad1Y6Cpq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171A82505DB
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 21:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223374; cv=none; b=PZG/BfDTl4G4yAta+6kIbmqc9q2qFP7DFpCSlzKWNDz2obdowryzFYkpLzBiVgf7y+GM5NsDdEQs4H3lJ+xVl7nwkAr+6cuvYQKqLJNHHTlYFH7zeXCTxNMZ3eaPHbU0nQx23AdU0OFglA+j2xnt8oMVa3ZnkvKKcT6eeRf5j1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223374; c=relaxed/simple;
	bh=1WSsOfDqC/YRkJ6qwFFGvVm3x8WirtJHzlN8jSnSP0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cpsmUSS3h9lzUuqw7C0jlEuO2x07f1dkQYl27zN9pmygN53sNCsF3niXHK4TrIC7SrEwK/j2tKypDJHfEEQqd3035SmqV6hR2WuSseoQWaSVFsLNesqOZU+N1wyZJRwzCV5itpd0wAmbNEYP/jtqij6ARcGm0ndstUMXb73IH2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Ad1Y6Cpq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso32279745e9.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223370; x=1739828170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqqX7ElFp9wIqiTogqx4ZkugO9mCs5sfeq9wlnFties=;
        b=Ad1Y6CpqcJAlCk55SlnhFVAlvw2UzXWSbQNI9u8KPnSts0r3F23jiswtS93DJ3H+CC
         qRSXcclNgiNP23VGBxIQ1UfE6vWstXTy2k5h0sdO3yJyR+EpPv27LTb+dQVt2wk/h/nL
         wzM0YWYMM1MP3+XiMra64wjMeMsRUKQsps6DliNapXNmMtsiCMVmhsHeHK0C+nTBrsw8
         LKRJqZbx1IN/9LCpf0fYcahNxR9kCQQl6N4JxSj2ujtZiyCy0y7xIHSKu1mO7R5C95ye
         h6alidzdw8XieAhzMuBAziyoWJB8JDQUorHcPcIOC6vpDtJxT7YExo8eSXVhhaI0JJXZ
         GWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223370; x=1739828170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqqX7ElFp9wIqiTogqx4ZkugO9mCs5sfeq9wlnFties=;
        b=mnIdvFgMhfP0DIPs6J9idX0vldPm/CNJOgKRfvtF3HmlKR+tmlsQf7IUK8/xLYYz6s
         2KPufRGcsF1YMJ/h7ky9Z4mDT74zBiSr74MxKCWbqjrrEI8oWkBlM6IVlYA2cNc5nguY
         rzTiylyXn8mWkKbpfo7p0cTONSzX8kPy5v4iQDBKP0h0NCTizp8t7RvLgt9S23AmXWeL
         PvbM7KmYdm3Kx7Zcw69Ur3K3yDSEcYY/eFK1LChlEH1Zq+JxOiz5JIHTvfjhj6pkTUH8
         VCaPd0F/FCQnHBfU7ZuQGBvOCpp2JrMLfIURuwK0ib9+3PmgvfNyvh1k3Imfna5UDeV4
         E2xA==
X-Forwarded-Encrypted: i=1; AJvYcCW3J5hvnGa/cRYU1ih57MtmloyJ0/NEWD947CPURE/fpFSJOHZM5gNNzAXri92W1JqTF3k7B7SkuFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4IkKG2lhk0vuciC/5sjRkVwGnSXMJF6xpo/wuuxJ3wM5abR8A
	YDM5mkW0QqXoTgFLRH0th2ODvr85RIu7RE+eNlVFqgQy+UQFZRXj6xi8yOYFNHI=
X-Gm-Gg: ASbGncv50vIuIqcyGHk3gWpM1Fui+mZ2B50iDFSu5nbY2DaiAUagWfte8w92pVjQOXI
	RT7JKdza54D65UhU/dqEn/Yo5sv03hgRK/wlgjxFRR3oqWo+l2lJzHLzx1bw7hCR3E80zgN0l79
	j7GIqKyYw4CgD0whsdOPtTEiyTITcInONwuKGYvoe6HDH/7t54KuixIaEiC5KjV3q5CFPtxn+G8
	pw0wf83Yh5B5zxuyklqHYR0Rw17ptkFA4MEBEm+dXBs1BXKQGwpnFY5O8ZOa6JHRJmiXczWiubh
	BPBLmovOd4hjFFaY
X-Google-Smtp-Source: AGHT+IEI+PbDSd+iZWI542rdQ+gdbkP59WcT5edYepFvbp4hadsR2YRTr4AHJJDYEwdy2nUI6Xz3fQ==
X-Received: by 2002:a05:600c:8706:b0:439:350a:ab52 with SMTP id 5b1f17b1804b1-439350aacbemr92952605e9.30.1739223370401;
        Mon, 10 Feb 2025 13:36:10 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:09 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 05/15] riscv: misaligned: move emulated access uniformity check in a function
Date: Mon, 10 Feb 2025 22:35:38 +0100
Message-ID: <20250210213549.1867704-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that check for the uniformity of misaligned accesses
performance on all cpus from check_unaligned_access_emulated_all_cpus()
to its own function which will be used for delegation check. No
functional changes intended.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 57ded7e74dd8..7d6185deea33 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -673,10 +673,20 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 	return 0;
 }
 
-bool check_unaligned_access_emulated_all_cpus(void)
+static bool all_cpus_unaligned_scalar_access_emulated(void)
 {
 	int cpu;
 
+	for_each_online_cpu(cpu)
+		if (per_cpu(misaligned_access_speed, cpu) !=
+		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
+			return false;
+
+	return true;
+}
+
+bool check_unaligned_access_emulated_all_cpus(void)
+{
 	/*
 	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
 	 * accesses emulated since tasks requesting such control can run on any
@@ -684,10 +694,8 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 */
 	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
-	for_each_online_cpu(cpu)
-		if (per_cpu(misaligned_access_speed, cpu)
-		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
-			return false;
+	if (!all_cpus_unaligned_scalar_access_emulated())
+		return false;
 
 	unaligned_ctl = true;
 	return true;
-- 
2.47.2


