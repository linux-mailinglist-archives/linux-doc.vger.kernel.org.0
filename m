Return-Path: <linux-doc+bounces-5027-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55158812207
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 23:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF531C212B4
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 22:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A4B81855;
	Wed, 13 Dec 2023 22:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="srqHirtx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F5DE3
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 14:47:55 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6da3a585c29so561902a34.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702507675; x=1703112475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S3MR9WYTuBImuNJhXJPIP3GzfMK1QacwIWQCdBwVhY=;
        b=srqHirtxC7GROnNMHJ6RKmFGNx7R+EtXMAzhPcEdtg6jwmV/C+XEpg88rKMd2fDdk5
         YVNmsxOHKFsZwytuTsCioAIUSb5g2i/kEkiHJ+UV2K4qAiCpI35l7PatMno0Vor+hH6b
         OkKGMAxdzzFf9Mkn7HgajA0UnHa+NlY1NIIBnE9gMEyVFibg92n90bJWOGMMiSxAH0t4
         GAVhOBdOqeYuVkRJ8PCZrX9xLAS4N304R0ojqiEjaHKSCLpf0hxJj9G70Iv46peX8zrL
         i4sFIDILWl7ExFi30u7ym2PkasArPGoKd8lzGnfVCo/Q3Oo5KttzwQU3HMy/QMIJipKg
         PNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507675; x=1703112475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S3MR9WYTuBImuNJhXJPIP3GzfMK1QacwIWQCdBwVhY=;
        b=MIihVrOOWaqEYihUKo3gRA6OtoZIGkiMixW+nFmQuLDP1Xrk/fghiCfJjeRSrg7HUd
         1cJVc2Yfs6W60Spn8z708ufeWxg7hL/4tIHxsPAqTYUouqz8SNUyqa7FMHajpiHI9tnc
         h1rIrmhbKMXNwEd+Jg+SvE54NCiambmGGPqT5zy7pIC1xVnrvw+sqXAmLXjgQqfXcXv0
         IBdx9dzy1xx3lwF2+XtnKABrF9mg9gvl0BGpMieSEdKvc4z+EbbRXPLHHdDT6OdiP0J8
         T2bdx/nuQuO45k1gzu66/7xqnAh0jlRtsqRYcrKWlb2NpPaJ0BN2w5AzsN/XBlonnQYa
         qTDg==
X-Gm-Message-State: AOJu0Yx/3js7UHPlTTYBTqTSaSVl9I7uUBeS5CSVZzq0Yo8mvqwgtegW
	ALWqVAaoxgYq/qS6KVaMCsbJpA==
X-Google-Smtp-Source: AGHT+IFsn7UhU0Ie5QCtN/RuNeDeBGWw7ehUM+N3a+e7KmmkwDZidr+e3/soiq9sgtalKfq7R2rm0w==
X-Received: by 2002:a05:6830:10cb:b0:6d9:e37f:5c54 with SMTP id z11-20020a05683010cb00b006d9e37f5c54mr8981554oto.9.1702507674986;
        Wed, 13 Dec 2023 14:47:54 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id bk21-20020a056830369500b006d855e2c56csm2375157otb.31.2023.12.13.14.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:47:54 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Dec 2023 14:47:48 -0800
Subject: [PATCH v3 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-fencei-v3-2-b75158238eb7@rivosinc.com>
References: <20231213-fencei-v3-0-b75158238eb7@rivosinc.com>
In-Reply-To: <20231213-fencei-v3-0-b75158238eb7@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702507670; l=4185;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=zPaRO2ks3l/75pkgWBpZ4nSSEIYV6K0VRBbOkUO2jEY=;
 b=FhysUS+fsKXjyq0qV4ESXY/r9f9YHqD57UdPggn5+823NiPGLggILNdzlx/BcMFogfJIEdvRy
 M8mdMMi6/hrBe52bmDrZrvSpfL+Om8qXAVgapW/bkUDvXMgqvt+LFBA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Provide documentation that explains how to properly do CMODX in riscv.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/cmodx.rst | 98 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 2 files changed, 99 insertions(+)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
new file mode 100644
index 000000000000..20f327d85116
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
+(icache) is not guaranteed to be synchronized on RISC-V hardware. Therefore, the
+program must enforce its own synchonization with the unprivileged fence.i
+instruction.
+
+However, the default Linux ABI prohibits the use of fence.i in userspace
+applications. At any point the scheduler may migrate a task onto a new hart. If
+migration occurs after the userspace synchronized the icache and instruction
+storage with fence.i, the icache will no longer be clean. This is due to the
+behavior of fence.i only affecting the hart that it is called on. Thus, the hart
+that the task has been migrated to, may not have synchronized instruction
+storage and icache.
+
+There are two ways to solve this problem: use the riscv_flush_icache() syscall,
+or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl(). The syscall should be used
+when the application very rarely needs to flush the icache. If the icache will
+need to be flushed many times in the lifetime of the application, the prctl
+should be used.
+
+The prctl informs the kernel that it must emit synchronizing instructions upon
+task migration. The program itself must emit synchonizing instructions when
+necessary as well.
+
+1.  prctl() Interface
+---------------------
+
+Before the program emits their first icache flushing instruction, the program
+must call this prctl().
+
+* prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, unsigned long ctx, unsigned long per_thread)
+
+	Sets the icache flushing context. If per_thread is 0, context will be
+	applied per process, otherwise if per_thread is 1 context will be
+	per-thread. Any other number will have undefined behavior.
+
+	* :c:macro:`PR_RISCV_CTX_SW_FENCEI`: Allow fence.i to be called in
+	  userspace.
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
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI, 0);
+		modify_instruction();
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
2.43.0


