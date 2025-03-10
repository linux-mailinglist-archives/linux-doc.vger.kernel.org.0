Return-Path: <linux-doc+bounces-40393-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8002A59969
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 16:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F3016EDBC
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 15:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364F222D4C5;
	Mon, 10 Mar 2025 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MSKud9qr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B322DF80
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619611; cv=none; b=axpq9qj7jVnl0vxPA2fHxR+SesJvCwrygvK0+J2IWPV4elidbvVJWm/swZu3S4z/HvPMibCf4MfyjEn0WwD5/Rxlw8dmVWa6E7a+O+4lISe2kuiAoaMHgejEBfLzs9BO+Qayu2zeceDj9i5AtKaXNDCtnVsCsYzp/W1pqO50pgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619611; c=relaxed/simple;
	bh=hbQs6lvF8Q1JXm18X4XFdDLyvh0l97O6MMVXH1OHxSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgF/APhr8YZsX9LgDgPsE2eEIFM1IMFDFRlki95MuFiBLM52bskNvWFXMySKRphnvNd+b3/rlZ178j1JqgbdOq49Jk0tQwZaaueUxiZXHu5gqXWBYuQcKMIY2hJq043TzKK2HNvg1sWSBffBNswwUz9jsyy8cfIT5ovBAa9W6gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MSKud9qr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223f4c06e9fso72936545ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619609; x=1742224409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP/QN2TKpQVKty1QPq9K94rdshw9XjhsCR/clUjZxuE=;
        b=MSKud9qr4rghMTkl7ONFOuPmZVSGFcwmpBqbG6/AO8W+r16T+gxgOr4/6U+7n8S061
         LzHrGVLgPbR6lFHntYfZQO8Oknt/KBTyV+ggmhLrjAQMUanCNdn+BBTScuP/DrjSqxr3
         ZH5MbVSKxFBNYc5Fu7+L8we2wehzRvgUMQD8geQJa6CeUmnUBxtCarPFdc5U1J+ZPxYq
         1A00PflLzuqrwxpiDhDxHb5pkv2Qf0v9aXNRNJ194PqYmWPRNqzGxT2+0rQW6iOD8BrQ
         WUiUuwXMw8KCI88ARhXH9hBc0YvKQw+Zv2wvBcBm/Gxc0Wke37KEVmGzyRHIScItE41y
         fpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619609; x=1742224409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CP/QN2TKpQVKty1QPq9K94rdshw9XjhsCR/clUjZxuE=;
        b=g2s/pPKoVUqdvFImbv2BYJcCVoY22REwRQT0J0IT9REX12oMmgpjZfUrmvqUanTL4/
         cFIe/YVoGEgIkpHtqlsNo+EMN+Q1vINocIT5CPzoPag5EIn1G3lpp+rE4+OGmPt+QJP1
         r5vuOUMPxss/IRnuy5gFYAqewH4PP0SuKhSicOD9GyvreS3E2zXVny70Zi13zbofNUvg
         q4IhEcOmAQQGKLIwkxZbQJ3raHf2bPoefPxMxjpYKhWVyqVdokanreMmOPvEmI9lelAN
         WxFNgdGsccYZFQPaJLUgnb0fI3bou5dHYHNX/UnemECHznch6n1T31E5Tv6fw+DxY1gP
         4hHg==
X-Forwarded-Encrypted: i=1; AJvYcCW8y49STKrzUioblWjH9Qr7RjV4CA1qtohMcVApoThc2a3NKYt8JsiZO+jedA4EwunrwhQ35lyniD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDyDmmJ2lUrGnrwfsHrLddfAZs571+DEKhPN9d7HJym0nszKS
	PQ1rblGlAZlv6IIH1NXJ5SJquI5fQmYGHXwyxJz22pSR1nDpd9lSPsPZkN+t/Q8=
X-Gm-Gg: ASbGncsIIw03ssJDBMhN8Ua/WIkC3v+1P1qv5Np0qJFnUZzfsYX7Cinracwm/K7gV72
	Y/MuV7jD+sqvgZq/ya+jrsI/gBLkOqK7ZZqlZigJYK0grhP5FLyd2Ag9XbCnXisJ1uYLEQXKmz9
	iEOQtgbWq5zzEHqW1CqUKHNFtNz3EtyFJ7Vt11Vr6+TuQjYbuGevBoXXie9+vqQ7+wjFc5b76wJ
	E9BMlH5NPRHANfBk8LvHgS7GAliI9HD5hJVBVLHLQEc4aM+WUqZbU+iLvYF++P01Sdk+ZYJpsQJ
	uWkj7p90jiln2mnxKSRzBlMwFS7SgL8ne6hDHKoACojph2Ka84Rtj8Mt
X-Google-Smtp-Source: AGHT+IE/CwbxNhDp7rRzvfmLqzJMclwTPVUcQ5dvDrzAMSsXdg6waC3I4WKcj3iwXpglVe985eMicg==
X-Received: by 2002:a17:902:e84c:b0:21f:40de:ae4e with SMTP id d9443c01a7336-2245360f020mr151160385ad.9.1741619608740;
        Mon, 10 Mar 2025 08:13:28 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:28 -0700 (PDT)
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
Subject: [PATCH v3 05/17] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Mon, 10 Mar 2025 16:12:12 +0100
Message-ID: <20250310151229.2365992-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

schedule_on_each_cpu() was used without any good reason while documented
as very slow. This call was in the boot path, so better use
on_each_cpu() for scalar misaligned checking. Vector misaligned check
still needs to use schedule_on_each_cpu() since it requires irqs to be
enabled but that's less of a problem since this code is ran in a kthread.
Add a comment to explicit that.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 90ac74191357..ffac424faa88 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -616,6 +616,11 @@ bool check_vector_unaligned_access_emulated_all_cpus(void)
 		return false;
 	}
 
+	/*
+	 * While being documented as very slow, schedule_on_each_cpu() is used
+	 * since kernel_vector_begin() that is called inside the vector code
+	 * expects irqs to be enabled or it will panic().
+	 */
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
@@ -636,7 +641,7 @@ bool check_vector_unaligned_access_emulated_all_cpus(void)
 
 static bool unaligned_ctl __read_mostly;
 
-static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
+static void check_unaligned_access_emulated(void *arg __always_unused)
 {
 	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -677,7 +682,7 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
-	schedule_on_each_cpu(check_unaligned_access_emulated);
+	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
 	for_each_online_cpu(cpu)
 		if (per_cpu(misaligned_access_speed, cpu)
-- 
2.47.2


