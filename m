Return-Path: <linux-doc+bounces-6361-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D858277E1
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jan 2024 19:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4206F2820BA
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jan 2024 18:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD8854FB0;
	Mon,  8 Jan 2024 18:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eDlG6tH2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9854F94
	for <linux-doc@vger.kernel.org>; Mon,  8 Jan 2024 18:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-20400d5b54eso1610695fac.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jan 2024 10:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704739361; x=1705344161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcesxSICs9qqjU3mn/6A1YTx2ZHWyVmXZ47Xf1Piv0E=;
        b=eDlG6tH2zgcGycOb83uS5GjWn+wHjTI2RANNfk2+TEsjd3iw+s5xJ68E5pt2iSXKiO
         IKJ3iECmCONf9g9CBXiuEKBQU5wSdcn4Ow2Nqbwln8L9X7qLTx8+dj0OP1TSlQHwIwyf
         M14eq5/DKwlI9EHIc7DxNSwBUGegrJY5HkKCnem1Dv/M8n4kt4tzmHJ8YcGOumeVF5ts
         Hj8sdOToxOnsa4mFtjlmrEax4D+4lbOpATkPqtL7ijJIllPc8Yo98mMwmO7FW4NhXLbp
         6Wnw3iL2plXFATQsK+hjfw4H1EPUtaQsXwmkeC97pGfBLPAWwY8TudSbHfye86hI682P
         ynBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704739361; x=1705344161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcesxSICs9qqjU3mn/6A1YTx2ZHWyVmXZ47Xf1Piv0E=;
        b=PKQTytxApwIhHeYe6/wlMFHkTf+7E+MG7Y+zkn1LyRI84FsnQlq1v/n1v4FQmxj91A
         N0lHyTp2No3ty/iiDha5YFiWQoCKEix2RhiycsQAp4taRNR7St5VSLSSt5FIWBZT1RSv
         beuWyvIGs2XT7Su+lpLzJgzfJS+3/ql2q2Z+iSMjbz35y7mhZDpw/oBcxGsjIxSAKsU7
         O821qeLE2XtvtWpu+tcqeJE56qO8tkoxCjofbj+vGc0D4Tc9hl6HxT3ohpcev8nC1w8T
         mSKgoAYlm1aMTBTk6GVdMX4wCrzDdumCf6lnA2cllwN5zdQk7aYXHD9K+QXxSUUIPc4H
         ahzQ==
X-Gm-Message-State: AOJu0YxQZ40DCNDsaQ5ToFmxKLM4V7ub9B2Yd7WqWePUzmum+7d5RyFO
	LvDn5TI216lavvyt+f9Ky2iWWw+QaLJITg==
X-Google-Smtp-Source: AGHT+IHUfVeCnv4iKNZVjJjiJFF2rvptuznnQATx/D78AfBQ3DUmNpAnx4Mu8VUhkskBrWEn/uojFQ==
X-Received: by 2002:a05:6871:750f:b0:204:2c51:99a9 with SMTP id ny15-20020a056871750f00b002042c5199a9mr5736175oac.72.1704739361703;
        Mon, 08 Jan 2024 10:42:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id pp24-20020a0568709d1800b002044a0677adsm97860oab.8.2024.01.08.10.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 10:42:41 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 08 Jan 2024 10:42:30 -0800
Subject: [PATCH v5 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240108-fencei-v5-2-aa1e51d7222f@rivosinc.com>
References: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com>
In-Reply-To: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704739355; l=3760;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=OS05nIxwBZL4G2IIyGllNjNhS5yx7iCRPhXs7gfJa/I=;
 b=xGpIlJ7LWvsBwbp5/el5+9Vw7b/vKKgIwAwZ1naQ8EmRCK7fdaRW4B6EP2ncbP9SDglCunL43
 PdHrDoiKQJ7D1VgKO0b5I2TMy1Udfm+wfaDy5yuadv8GmlmMHhJARM7
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Provide documentation that explains how to properly do CMODX in riscv.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/cmodx.rst | 88 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 2 files changed, 89 insertions(+)

diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
new file mode 100644
index 000000000000..afd7086c222c
--- /dev/null
+++ b/Documentation/arch/riscv/cmodx.rst
@@ -0,0 +1,88 @@
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
+storage with fence.i, the icache will no longer be clean. This is due to the
+behavior of fence.i only affecting the hart that it is called on. Thus, the hart
+that the task has been migrated to may not have synchronized instruction storage
+and icache.
+
+There are two ways to solve this problem: use the riscv_flush_icache() syscall,
+or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
+userspace. The syscall performs a one-off icache flushing operation. The prctl
+changes the Linux ABI to allow userspace to emit icache flushing operations.
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
+		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, 0);
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


