Return-Path: <linux-doc+bounces-50580-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFACAE8997
	for <lists+linux-doc@lfdr.de>; Wed, 25 Jun 2025 18:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F7406821B3
	for <lists+linux-doc@lfdr.de>; Wed, 25 Jun 2025 16:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577962C3242;
	Wed, 25 Jun 2025 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fUlQEqhI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A403A2C08A5
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868251; cv=none; b=piJeh6Jc2xA0vyS+benePgoBJsiGH31NZKVQu3G7yZKceFcVgoYynEPOPyBFfp/yy0BFk178OUr2f8UTyT3WDH3hX2F0GIov2nAPtdIZBn+p8zfFGrAnGhLVE3x8oYsbYxy8Yf9PI3njB820utjWLEtKNNas+cNOxF3HHclnOpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868251; c=relaxed/simple;
	bh=rWGPByoC/hnHkqwleO+GR+oyAAnuvdMd1IK36Oo/n1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyQH7VXHqkQcTpmN4F29g1andfXyEOUQZFuITP2IuqNWcdDd/tg3/DH9OrHuCX2loaBJcSw6lLhKP/3VxSZQQtTh3o2ft8BMuDe513TqNnRR06321G+VKwWQmXVmzEdY0Ji/svGKyT+CQ7J9MLxvKmAHQODxBiUu7CZsrbLdTqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fUlQEqhI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-749068b9b63so130108b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 09:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750868249; x=1751473049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ucgASzDHlxpA/1R6gfwSR+grfWmp0YH8y7SE+A0JJg=;
        b=fUlQEqhIAik8xphtfPAkV6sMQMohGGTMfRlMfGmR2STCXFq3wLCXu7CpmObbkJmqqH
         amcrkSxbKexR3znOkf+E/ZecAN0n0rsxjvUpKwbT5m7Ye49b0IK0EIPKYleX39ZxTEcC
         sKy/n407HJGIy1y8PSuoFCWtzvV4gLZMNpYeTPleUDNcuNDBqWgpHRiRPGumQYHMPEzQ
         5RutZtC3nhNiLb4CxhHDtGh06mgicFFzO7AH5J5x5kLDueU6d/5+XGf24M8qNdS1cx7e
         C618flvENfjjiEc5ac1dSsNtCr8LOfhXiDR4m6KnRxiPDeQthdY8iDbIYHMltz4L0+4R
         d1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868249; x=1751473049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ucgASzDHlxpA/1R6gfwSR+grfWmp0YH8y7SE+A0JJg=;
        b=FWkqkalc2x1CMOEOIe6tl78nYP6j8zYouhxZUjTBBdjC7AhD4B4ahacEBPC+9rb+9u
         f6RSxrL/DyYFYc9Sv9j2s6C8P+mqOB892Yd193pT1FnUb/axFyALCj1v61Cwx2lQVc2a
         tMqm1jrXisYQft69ksz7k2SgQ6aE6wEg6XCzemev3qgEGvhkRE/SCwhRzl4DHOp6HkIm
         mqZK0hJgtGUteg6n6Zb13teslhxlZAhv2uj7+JwuRoLiDUdt7GUVDVQTAPxo1mc5DBuh
         lXVUcnN9i+jZvTICu/Y+0jFg5JLLgsYDBCXxy3+xCFdbVV2dPA1q3mk9VD+JBpuF4aoK
         xyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHZyqHEl7TrYOpDYAcOaf/8ipHT4/+0BYOzKYFVI5VDO28HvAJDK2cIZbDjVVu2fzstTufIeWmy2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRQeQvDtqvnuKMoIiW7K4s2JN4YBRhitd2f+ajkm3Ij3nqMuSX
	cS3ylmggskcg/KmTuqSJG+6dXpz+JBnIwkvKUDQF5+O5kbz12K9l71KruBMai5xIFxE=
X-Gm-Gg: ASbGnctN2VXQVVKrJ6IrqLmwim329CyLhKjHkoXw68tAqH4qyCZd0eTafckPwEFTKqK
	/dJSxOweOmQSsmETDDxINDMuWeBZzqOyEyuE7/qMi5sNPZAnI1gtcVAdNDSIjIjJiR4tEItv8kK
	+c78OMqbLIhv6nKDUL1R1i17A706lyfWK3/aG2A5whsK2nBKxANotYhFeQbw9ssEnDn3YUR1wO4
	mAx8Vn81xivRe1h1NWpt5bloPG65EXrJnidI38N6oOojGLc/FSVxXT+oOt4+oH0NOBjbPFd85p4
	0+N1Xe9dWGzPC4Z8+d1T9/Nfvdb0J/1+Qx5aWHwDwc12qdzziEo4RmIIsmstakv2EynGBcA5E7u
	PLHfc6erIXb/S+cN3mlwyR3quGAAPNxs3+nYN
X-Google-Smtp-Source: AGHT+IFpDcqx44HzncJdJNVAkQLG5gSRrOhDC4JGf2UMPexno4tsLpTKKz23ZIhlWN8/zRHxl5MEaw==
X-Received: by 2002:a05:6a21:e96:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-2208c08a340mr673741637.9.1750868247253;
        Wed, 25 Jun 2025 09:17:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e217afsm5024436b3a.55.2025.06.25.09.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:17:26 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
Date: Wed, 25 Jun 2025 21:47:15 +0530
Message-ID: <20250625161715.1003948-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When injecting IPIs to a set of harts, the IMSIC IPI support will
do a separate MMIO write to SETIPNUM_LE register of each target
hart. This means on a platform where IMSIC is trap-n-emulated,
there will be N MMIO traps when injecting IPI to N target harts
hence IPIs based on IMSIC software injected MSI is slow compared
to the SBI IPI extension.

Add a kernel parameter to disable IPIs in IMSIC driver for platforms
with trap-n-emulated IMSIC.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 drivers/irqchip/irq-riscv-imsic-early.c         | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f1f2c0874da9..7f0e12d0d260 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2538,6 +2538,13 @@
 			requires the kernel to be built with
 			CONFIG_ARM64_PSEUDO_NMI.
 
+	irqchip.riscv_imsic_noipi
+			[RISC-V,EARLY]
+			Force the kernel to not use IMSIC software injected MSIs
+			as IPIs. Intended for system where IMSIC is trap-n-emulated,
+			and thus want to reduce MMIO traps when triggering IPIs
+			to multiple harts.
+
 	irqfixup	[HW]
 			When an interrupt is not handled search all handlers
 			for it. Intended to get systems with badly broken
diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 1dbc41d7fe80..c6fba92dd5a9 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -9,6 +9,7 @@
 #include <linux/cpu.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
@@ -22,6 +23,14 @@
 #include "irq-riscv-imsic-state.h"
 
 static int imsic_parent_irq;
+static bool imsic_noipi;
+
+static int __init imsic_noipi_cfg(char *buf)
+{
+	imsic_noipi = true;
+	return 0;
+}
+early_param("irqchip.riscv_imsic_noipi", imsic_noipi_cfg);
 
 #ifdef CONFIG_SMP
 static void imsic_ipi_send(unsigned int cpu)
@@ -47,6 +56,9 @@ static int __init imsic_ipi_domain_init(void)
 {
 	int virq;
 
+	if (imsic_noipi)
+		return 0;
+
 	/* Create IMSIC IPI multiplexing */
 	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
 	if (virq <= 0)
-- 
2.43.0


