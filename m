Return-Path: <linux-doc+bounces-16474-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 297638C88CB
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 16:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AD11B28721
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 14:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBE98120D;
	Fri, 17 May 2024 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OUJ3/FCE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC9E6A8A7
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 14:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957618; cv=none; b=JuSjOHXQTGUL3TP1/dvRMNp21cFtXBQNWKWCdF7cVQ4iAPU/vjxNJCBnBQQBtDFz3oEhNM8If3Vi0b+Gy2E2yTEMiHJd3rFSMd0IdaznSdeC7NJLbHtaNfRiKcJd0Umw6ik5thwPGIDx44oCggnGGn1jxxgyWFZrZSLhbcpJnFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957618; c=relaxed/simple;
	bh=0WBeALV8geya3GDdnP358JVQaqgpRdm1HDA59jh5fhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0/6iTZodYICeZyNr/S1LQH9oxWCEqxEqrPVDgv+XaPae/394g9cNxeDMhm3NGw3Wij2r4r4trnA1J9ua5l1cC4aRxfs9sbAwkEQMQ1gLf+bdmYWo73ZvqJGepn30xjJ+gVmcM91Ty9BmLngM/1a6Qj8d6RcmMoSfQ9fNmC5X+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OUJ3/FCE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42011507a51so342575e9.0
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 07:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957614; x=1716562414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+iPbn/khpTsPchyu8Yai3JeJ+A6vpdXRb3hYqL1yvk=;
        b=OUJ3/FCEXEOaTHziPVWPnwuQY9pNqXmwSBrUbt5otAS9YGjoKKMrYAC2s09pNsNYn6
         a0txpVQdV1ZDwI88NwuFnxoHSAcKCICPdILwm/objKTd9+8M/IaJAwSEv3Tq1Ttr/cph
         I1lN6XSOWtQoIlDbFIkYW0lSUvMQy9orsHqaJHmHo2gTubgw40pI6y0Bd61Fq5ujGFHh
         8pM5ZCrqIw9kkdCcrRMidYaWJehEeoZHx41jD8EwAgIkIsuyv8jJ8U8zlhabds+Gj7Uk
         nymQrtDSvMtASd/C/KOHjIyvrXCX+Ifc2CofHd3Lbm+bAmWkZYcvE/N6NnFDCqSpZ9BO
         6l+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957614; x=1716562414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+iPbn/khpTsPchyu8Yai3JeJ+A6vpdXRb3hYqL1yvk=;
        b=f4Sv6JmGoFhJMkRbeZmEeJlkpnLssMqi80DTZbQl3Mcm71Ek1wmX+Jnd01FR3xnXa9
         rUXBy7dH5vo5yJqzdqfTzMndmNw8W2NhctRaBP6QpB5+sikzdBnk5iRSvxN2pT38i/ui
         A+SEnywK1hvasmM1WRzEIvoMjVMKvDRGRQwPeFeiDHOMoIPG3PKho5QcA8azjIWrXA2P
         k26e8v1UGGChZCSpwnbcaHln1nsXCK0Dc4PlqT8RKUayiFBi6FXX4+7fzuNfqdEop1LM
         BiwknAGFUacrqCbQ9M3FgUmxSlfupDtDJ9RggVnthQrfWHguOU/ocexMg2eCXLvX8vAs
         v4dg==
X-Forwarded-Encrypted: i=1; AJvYcCWJfPUm8W86nQ4NfPolTPFswSYw4NbeeoJa26VtKgf5u15yfC3PQDPTvNXMkhJzUUfFMlp4OmKeN5Q+VJn+Oi263nUXaVkHFgQd
X-Gm-Message-State: AOJu0YzWPGhFKlj4ysNsCqkNlFMJbH27Uy4fn2ItT2b/U5OO/bq8NWiU
	VNvFp5EcqAPzl9OUUUqUXa4vg1oX0Dw6G7z2+Lz+kgRI1m2qVtbrvoNS/3vzi8w=
X-Google-Smtp-Source: AGHT+IHjUwKmyIg0UAgVmQU28600dC6ckmqz/WfhRm2n8JkhKzwA+sGdKVNHqMrH9cFck9sYzow7Nw==
X-Received: by 2002:a05:600c:3b0a:b0:419:f0a8:9801 with SMTP id 5b1f17b1804b1-41fea539b4cmr186010615e9.0.1715957614634;
        Fri, 17 May 2024 07:53:34 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:33 -0700 (PDT)
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
Subject: [PATCH v5 14/16] riscv: hwprobe: export Zcmop ISA extension
Date: Fri, 17 May 2024 16:52:54 +0200
Message-ID: <20240517145302.971019-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export Zcmop ISA extension through hwprobe.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index cad84f51412d..9a77b7d14539 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -216,6 +216,10 @@ The following keys are defined:
        ("Zcf doesn't exist on RV64 as it contains no instructions") of
        riscv-code-size-reduction.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCMOP`: The Zcmop May-Be-Operations extension is
+       supported as defined in the RISC-V ISA manual starting from commit
+       c732a4f39a4 ("Zcmop is ratified/1.0").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 652b2373729f..3a3d6a2b4f48 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -65,6 +65,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 39)
 #define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 40)
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 41)
+#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 42)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 11def345a42d..34c95eaf8cd1 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -115,6 +115,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZIMOP);
 		EXT_KEY(ZCA);
 		EXT_KEY(ZCB);
+		EXT_KEY(ZCMOP);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.0


