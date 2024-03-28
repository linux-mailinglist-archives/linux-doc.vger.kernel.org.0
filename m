Return-Path: <linux-doc+bounces-12046-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B099879FE8
	for <lists+linux-doc@lfdr.de>; Wed, 13 Mar 2024 00:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA24EB20E46
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 23:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F5C51026;
	Tue, 12 Mar 2024 23:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="sVJNUsyJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D074D9E3
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 23:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710287629; cv=none; b=XoelcV3rGGtCJACdVFSCJ4akw7ubclNlJjFwhQSHxRXPZeDyg76x+nnum7IMZ48kEZNgFjhMyTfwQZOEm3TAhe6l4Rcjxh35K57zo8hSgnITRc84w5dJjnGAodLmdgBtRFOJj8SeEUcc0mFjZqHihb+FA6aABf5uA20M/8Evkyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710287629; c=relaxed/simple;
	bh=VhbTJ9D/d65WnO+JrY1SIvIOPQdT9MHfEzWOw+OIGSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJGkBm/GtQjQgPAQVmQHZ9oJPWqAeR8hYMBwJ6bGLqqvsmxpTHhxwcrLKz8WHGvlxhvVaaPRyNam5xeszQc+Utr/jgwAsqMo2b/yih7EdIAXFGei3RboGHeIf+t4l2sjPRDYKsFF/Hmcru2pm4zO7rkAz60XTZtPqybIGjSEUh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=sVJNUsyJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dd955753edso26279585ad.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 16:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710287627; x=1710892427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xy5TOqSKX3DblYxEOD5MVVtHMk7JBMIm4GkKJlZsbS8=;
        b=sVJNUsyJ5goUle0ZXUpqeoFbNEn9YwoaklklZNk53B3oHOiNFnMp2gLAnKHEKQxzHd
         kONetzMkvVSzvdlJMDEhUkjkA8xeTMZ6T+yQDKcHYhYGaRAkLR/chWtbulxn0tFA7cp7
         ORGG90zqBcP5L8qrglXqZcaO1rYHcRsnvkOoxk/HBqyY9BN/iuR9USrv4Wjqx2f9isAa
         AGVYG+B1RLEvNVXHJh3QWlJgT/UCu9E/Ch2c7QQedpCMMjsHI+/HuxPlaXq4yoyr0M2z
         MHjC84DWLRF0ZgqxXGBq6i6NBjeUw8A1fvl2rRQ1C26Q2x9jYQ9AahkWbUefpccqxASw
         Duzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710287627; x=1710892427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy5TOqSKX3DblYxEOD5MVVtHMk7JBMIm4GkKJlZsbS8=;
        b=ZddLZG1BvJM8O4TVLLFqgf/oifEUvlasGV8ii5GwqyjgAITO/x57LGCBbu3GLxMjxV
         SrDm8ROwsIxyJhIt+4fKYKWw6tuWrEirny3v7OWV7KX4I42A3Hv7qJywD/icHpcw1e3r
         yxsu7NAjaCR1mARt/pmB7xOj71Jn2mT/BwBSN/DLgFOym/sckvRbISP3PwAFwna26gO6
         xPhF1ooP8ZQFr6oMo6jitr2ZGLRJWt6oS/ImQIjZ3FfI+nv/au+zvPfnN7fKAgtaot8I
         LlIEQCRE3EhSb/uLLdC2erBP6aecQ14dZoJ/zfuxNgxh1GCrVPSAZnh8b3iwrTyxXjBZ
         KQ6g==
X-Forwarded-Encrypted: i=1; AJvYcCUXpUJLRhZHZOm0DZItfTvvrtAYtm3dWcVSrjyImD/NJ+vBPhMP9FQsoFgmbzucivB3B+rq57DSO+p7s1NoDaw9E7w++zU/3+cn
X-Gm-Message-State: AOJu0YxbaWigFfeXLKjHJndmIwdw2PAVKHqUSdqlLkgxEPWW7bwqIwOo
	SizbUHUzR+3m5S427PMxI4jDJgLBD9yhNb1CXD3o51GXHRPQmCNIEDxlw7uy2QA=
X-Google-Smtp-Source: AGHT+IGOuq44oY+SA4/K6Jk2+JXY0tCiJaFcX1Kd9JQD8qXjj735tLLLMG623VHrrnU0hXZIrtQRgA==
X-Received: by 2002:a17:902:ecc4:b0:1dc:df18:c5c0 with SMTP id a4-20020a170902ecc400b001dcdf18c5c0mr11755148plh.0.1710287626915;
        Tue, 12 Mar 2024 16:53:46 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm7282844plw.239.2024.03.12.16.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 16:53:46 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 16:53:42 -0700
Subject: [PATCH v13 3/4] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-fencei-v13-3-4b6bdc2bbf32@rivosinc.com>
References: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
In-Reply-To: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710287621; l=4601;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VhbTJ9D/d65WnO+JrY1SIvIOPQdT9MHfEzWOw+OIGSo=;
 b=cZs4wpLQVtK7aTyxMXY6Q9lLyWJ4tLsVLAH4e9c1IqQElmGi36HzjYpFtCMt0IsozfaaDWWOb
 QEJZI4fNKu1AxAOBDJtLa+UZHCwjpFVve7bojE9mGLUn6bjOh1cblBo
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


