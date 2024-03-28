Return-Path: <linux-doc+bounces-12017-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB1879C68
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 20:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AA99B24576
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 19:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26232142912;
	Tue, 12 Mar 2024 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QtFhgdbK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1C11428E4
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 19:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710272880; cv=none; b=Q5dtPtBJH/dL7q1B71W7j/YvXaSJf7RtuaasXYdnNUTAZVZzg2E9YYYqo7EGwd+C041RLX7vOQpQjh/c0PW26AdLlMcTOwhFzxGxvsCGjJ7yqxW5j0wRNE3Atc84kHnEN3lg4TUnjJ/bAawxrTEvMvDVGKm4QA1SUqZ4FpsfwZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710272880; c=relaxed/simple;
	bh=VhbTJ9D/d65WnO+JrY1SIvIOPQdT9MHfEzWOw+OIGSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJ1UrCPgQPAsAOMnv/fKg320yxPiKCgojCW08lunMGoCPRXJsY3+WnkW3wPXcWNFkuRhNJlStL0L664Eu9F1KF7CuKR4LX5klJTdb/rnBHNlDF74RjPsJ+BvRHGrDrWCPiLeTZSSAM5T7Ya6U8JTccR05sJRLBAk4+5O8DT8YtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QtFhgdbK; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5a1b6800ba8so2717548eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710272877; x=1710877677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xy5TOqSKX3DblYxEOD5MVVtHMk7JBMIm4GkKJlZsbS8=;
        b=QtFhgdbKcCy0hrAkJpd39PXZVQ6lDUQX6kq9H9oNgZpu2uTpO/g12cv37ENG5wBogN
         H+nTYPRFAIAWQuiYfh1GApdp98K/9NMkYDHNCiCv6KyIuV3nmTIVNPDPyxuIf/UzjGVI
         sOVjTUNhHFv24+f2TwqfMXx+Zhv5mwrf+qsdEfMX962irZfDsb07V6srJS+e7jcFRjOJ
         PdLmGI1C6XY2+wu88ehdPxYAXUTQpe6E6eRaj4ICwwr9IDy+ZGg1/Tm67b/5yynTtXq0
         wGCZrlU64tVqi+rUcFJ5uYbfvKeanEyGAKUEsnU2vqbQcIFbfKmVwD5vHO7eKK7G3iz0
         DORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710272877; x=1710877677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy5TOqSKX3DblYxEOD5MVVtHMk7JBMIm4GkKJlZsbS8=;
        b=I7Q2M57XrTtBueDIlJ5XNjFCdWynp1z7ZyJDzm8XvjB61ARYTqAc1YTKkNdc0jC/HX
         HrX4O6yKC/COB8n8b5DLT7kNPf7ZhZ2TdzFqot00AHacOB/1gM6C1hiXMn6A3YPMuF3a
         f3gr9u7EKi2dqgXL/ttMYBvT8ZATl6hqem6f7aaaVpYyGQVlvzsnEbZVIvS+a4sNq9ca
         exZ7Yf6Vd5egOshZEl/6EWF/m2f8IxkpnQxLOh3opJZWlSs/Q7CGPgl8gxCUcZ5XLQEf
         LBrLYUUDyyKjaL5IC9S2G5/2z8R26aIfzXnTwTAsYzM73jxIwVzDel8jnTeFZGXCA8N+
         hojg==
X-Forwarded-Encrypted: i=1; AJvYcCVO00eCinz+7VN1Jl7GtPKTxNkO45rXdtXFivIOtXT/UHBn1tgKBpmMv4FDolm767D23HkPXwA4o0x9/9lymrGVA62GUBOopWZp
X-Gm-Message-State: AOJu0YwEPwRHRM9ic9RbxuczTmwaAbM6NCGqGBzsZARH9Hscblee/6gr
	oTF0vnzyroBPrmorlhrx3hOAsYW3SXQiNUg+8a/rdVGZLga6Ph7FFm9UrGFmaz0=
X-Google-Smtp-Source: AGHT+IFd0bZPr6/Tvi+JuSoOyuixgtJ6WAYK/olTHFvdOw4qN2FQVd8SGzL4/UjSf4c9J6b7yNldzw==
X-Received: by 2002:a05:6358:890:b0:17e:8b57:df56 with SMTP id m16-20020a056358089000b0017e8b57df56mr2915905rwj.5.1710272877364;
        Tue, 12 Mar 2024 12:47:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z69-20020a633348000000b005dc884e9f5bsm6433495pgz.38.2024.03.12.12.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:47:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 12:47:53 -0700
Subject: [PATCH v12 3/4] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-fencei-v12-3-0f340f004ce7@rivosinc.com>
References: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
In-Reply-To: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710272871; l=4601;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VhbTJ9D/d65WnO+JrY1SIvIOPQdT9MHfEzWOw+OIGSo=;
 b=S4Q4g0OL9AJrAQOCaFiNRjCCUHmDz6cnpcZDAWNuFSLRFGJkYKZODksUzU2K0QWVnOLzgR8qC
 ctajQdPe12QC2H9MPFlltFUNQPxIkrJ/gFbKGLR5Dp9mRPYZJLteExZ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Provide documentation that explains how to properly do CMODX in riscv.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/arch/riscv/cmodx.rst | 98 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 2 files changed, 99 insertions(+)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
new file mode 100644
index 000000000000..1c0ca06b6c97
--- /dev/null
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================================================
+Concurrent Modification and Execution of Instructions (CMODX) for RISC-V Linux
+==============================================================================
+
+CMODX is a programming technique where a program executes instructions that were
+modified by the program itself. Instruction storage and the instruction cache
+(icache) are not guaranteed to be synchronized on RISC-V hardware. Therefore, the
+program must enforce its own synchronization with the unprivileged fence.i
+instruction.
+
+However, the default Linux ABI prohibits the use of fence.i in userspace
+applications. At any point the scheduler may migrate a task onto a new hart. If
+migration occurs after the userspace synchronized the icache and instruction
+storage with fence.i, the icache on the new hart will no longer be clean. This
+is due to the behavior of fence.i only affecting the hart that it is called on.
+Thus, the hart that the task has been migrated to may not have synchronized
+instruction storage and icache.
+
+There are two ways to solve this problem: use the riscv_flush_icache() syscall,
+or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
+userspace. The syscall performs a one-off icache flushing operation. The prctl
+changes the Linux ABI to allow userspace to emit icache flushing operations.
+
+As an aside, "deferred" icache flushes can sometimes be triggered in the kernel.
+At the time of writing, this only occurs during the riscv_flush_icache() syscall
+and when the kernel uses copy_to_user_page(). These deferred flushes happen only
+when the memory map being used by a hart changes. If the prctl() context caused
+an icache flush, this deferred icache flush will be skipped as it is redundant.
+Therefore, there will be no additional flush when using the riscv_flush_icache()
+syscall inside of the prctl() context.
+
+prctl() Interface
+---------------------
+
+Call prctl() with ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` as the first argument. The
+remaining arguments will be delegated to the riscv_set_icache_flush_ctx
+function detailed below.
+
+.. kernel-doc:: arch/riscv/mm/cacheflush.c
+	:identifiers: riscv_set_icache_flush_ctx
+
+Example usage:
+
+The following files are meant to be compiled and linked with each other. The
+modify_instruction() function replaces an add with 0 with an add with one,
+causing the instruction sequence in get_value() to change from returning a zero
+to returning a one.
+
+cmodx.c::
+
+	#include <stdio.h>
+	#include <sys/prctl.h>
+
+	extern int get_value();
+	extern void modify_instruction();
+
+	int main()
+	{
+		int value = get_value();
+		printf("Value before cmodx: %d\n", value);
+
+		// Call prctl before first fence.i is called inside modify_instruction
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
+		modify_instruction();
+		// Call prctl after final fence.i is called in process
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_OFF, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
+
+		value = get_value();
+		printf("Value after cmodx: %d\n", value);
+		return 0;
+	}
+
+cmodx.S::
+
+	.option norvc
+
+	.text
+	.global modify_instruction
+	modify_instruction:
+	lw a0, new_insn
+	lui a5,%hi(old_insn)
+	sw  a0,%lo(old_insn)(a5)
+	fence.i
+	ret
+
+	.section modifiable, "awx"
+	.global get_value
+	get_value:
+	li a0, 0
+	old_insn:
+	addi a0, a0, 0
+	ret
+
+	.data
+	new_insn:
+	addi a0, a0, 1
diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
index 4dab0cb4b900..eecf347ce849 100644
--- a/Documentation/arch/riscv/index.rst
+++ b/Documentation/arch/riscv/index.rst
@@ -13,6 +13,7 @@ RISC-V architecture
     patch-acceptance
     uabi
     vector
+    cmodx
 
     features
 

-- 
2.43.2


