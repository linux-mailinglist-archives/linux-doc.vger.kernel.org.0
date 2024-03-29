Return-Path: <linux-doc+bounces-13100-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534478912EA
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 05:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0947D287393
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 04:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30CE6A34C;
	Fri, 29 Mar 2024 04:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qTlqLdkq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BEC69D37
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687624; cv=none; b=N4fSLZyvydlbFDZruQnHw1sPZ4Z4bJGAcG8MDtH2zAchfxihIFy//CkBhtVEmp+Ji2u91zidpThtT/muPtDWAP1eoGXOlqn76YMMQ543nu/+WtDQKH/Cqk3jEwnauLbSQc2bgKSQGryAh8oc/9HiwyRb+OMPckPmtT33vyUkBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687624; c=relaxed/simple;
	bh=gbwH2aODzv5Ln6RBa/axUQbruUTSGCIe7yXMaDhAcE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HPTy3AxibmGUEzROEUaGqdJ7vrIpWAmCwObU351VQpLyG2Q9q267XG6F0BcDumbwmjGPBl6aaLCLzC4eakQeMxf4wuXHsPoXZSPcpZAtXTyf4A8pRCrjAsI4AWatBcYk/QEoSQxdVxzkIdNMcwGQSjxYjiptsbNZRHRL7QGbX6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qTlqLdkq; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ead4093f85so1620423b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687622; x=1712292422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGZuEOPDrPSpE9XmexYpP1TU1T3x9oK+sun0qc4e7DM=;
        b=qTlqLdkq1optrJ0oV4z+oR6EXyzV+xDP9Gu/zIxDwVaqlhqJZ+WTfbEVk8//wQqxLB
         XOqvJ43DCgOH3MpkFGSsmIhfeoKxNhT5wVBcVgvVJcF6dzRfQSn7GLibFdMg4uqCF3rq
         lrSfICdwU5XAoqg0XURClOI8sRmnpsBC7NrN51AnbFCAlqFa4gf75Ue7DtJLPz5Wr0oV
         CbLRzsR4zXK9VYFt6rXhMgEs72rNOjxInmzlTuV5cAqUHHfbyXdWpjuiet/kuxu2m584
         yG7NTdJe3TO/FB1D/x8rNslp1uvaci5zutbA7ckcM7yonstN7VA6nW9pn+ohOSLkkryX
         z3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687622; x=1712292422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGZuEOPDrPSpE9XmexYpP1TU1T3x9oK+sun0qc4e7DM=;
        b=VrHLtSEYymuFs54cHQTuwJxjenSFz0G6lCcPO2mPdLzN3TFyW42YN2W7H5D8bel2gB
         uI36EUM9yTqfFGmbm3f0sXhP7mbRt7KA4mcs4aQgkMu5x/KLxv2oIlxY25NBwmdtTxTg
         8qZajP0NME5gDbf99Qxrqg0JlaU+1wuIUTW5AU0VFzkn/g0sQnkHdKnziFH6t9wj+6TP
         EScZegpQCLckxDdT8UAd3/7B3XDY3JcpBfG8DdJ6liVagLfyxRtdFPGYSJfrmqzs7GVM
         GfSBsWWJ3IWXmWT5U0uQDkylbLVPROjw/DYo2MSifaPkKIR8NtXZ1wPfk4w0QPaX1VA+
         B9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2ej6zmSMQ6OynrDhxtaHA+MYR1x9wB8XdinIQsZonrhJPiR2YEt8yIWBibBl3ybQAa7bgTAtyCmtzJ4diznoNnMQ0JWpDU92x
X-Gm-Message-State: AOJu0Yx+4dsPlpnYkTzBwce930CEzHT/N2kqWWxb1exdRjyh7tKCtW8Z
	0U7yT67bg0iytddbeeX/ufrahq0zj12VoMZOpWbengsLP/PELwS64kS3Coxg2LqThAqgIMYriPS
	rze8=
X-Google-Smtp-Source: AGHT+IGVNl5i8Vrjt70n++oCEY2675qx+nSiOe/0hD9dLIqDDPWOmm3HrHLeaGTRiVH879DeLLhxrQ==
X-Received: by 2002:a05:6a00:a82:b0:6ea:d10d:c96d with SMTP id b2-20020a056a000a8200b006ead10dc96dmr1470360pfl.19.1711687622313;
        Thu, 28 Mar 2024 21:47:02 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:47:02 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 24/27] riscv: create a config for shadow stack and landing pad instr support
Date: Thu, 28 Mar 2024 21:44:56 -0700
Message-Id: <20240329044459.3990638-25-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will support
cpu assisted user mode cfi.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7e0b2bcc388f..d6f1303ef660 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -203,6 +203,24 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select ARCH_USES_HIGH_VMA_FLAGS
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default y
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
-- 
2.43.2


