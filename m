Return-Path: <linux-doc+bounces-1190-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DDA7D8300
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 14:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4671AB21130
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 12:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82982DF7E;
	Thu, 26 Oct 2023 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLP82xOI"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D992DF72;
	Thu, 26 Oct 2023 12:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D89FC43395;
	Thu, 26 Oct 2023 12:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698324436;
	bh=dWbKym9V/87gXqrTEOw7Gdze+KmteiyxYpdHGQXYWrg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eLP82xOI+jsgEF6T9OjGdATQh0IsYAp1RZfl0g2ShRuTCJ304wEzfeOFAoEPJyXQv
	 7pVHzDt4dS7wamb+A9ptRGSAPS1QqRsoEfMWpuT0riYj/yyS7NNrE/69R5FSycqdXr
	 4eyKS9SvESRTC27UUYBBVAYLZ2BZNVQqYpQlVMlgBuIVxqKTXjPe8IHHiSirx1yktW
	 japheYAkxvdb3N0zZIsUGqQrQ6rVAw2FVCgI/7+YP18/mup2OZwcQHDaNoGHh6EqCc
	 joudoMKqaUb45t67pcqIdLZIOHOw90yk/Wf98+HkCKQl82Nhz0CJJJx/oVTGI+VTY8
	 1b1mCs4AZJ/cQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Oct 2023 13:44:27 +0100
Subject: [PATCH 13/21] arm64/ptrace: Expose FPMR via ptrace
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231026-arm64-2023-dpisa-v1-13-8470dd989bb2@kernel.org>
References: <20231026-arm64-2023-dpisa-v1-0-8470dd989bb2@kernel.org>
In-Reply-To: <20231026-arm64-2023-dpisa-v1-0-8470dd989bb2@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dWbKym9V/87gXqrTEOw7Gdze+KmteiyxYpdHGQXYWrg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlOl+ekg/UMcni812l8Ig/UJoR0JEl6TkGXxfX0PmS
 bCIIHIaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZTpfngAKCRAk1otyXVSH0AZ5B/
 0d/SQSBlLCWftYb2aRs9U0zGgeVFxx+EzKrW0G8CkaEXWZ9kueyv9nVGQ3l54FLgVkRzKrRHI+VYpH
 LINBRNt/MUZgyjU1AQbsa0aYU9BLUDf5DmCVC8RGiOMsow0dZaO1uEEbCV5+34ITf3aP9Mvlf7h2zW
 r4j9EcICg3fAuTqcO53k6wwiu/qtRoxpA3E1/odRccMAGDFrVTYUiom5igbJiItOHs+7DasI0tCdJX
 cnk+hjW4j/0QoaBYdgQp3GLqgx9Aj/1a/eS9inD8eFVKpZaTZmYPfeUQgfbY0dDXhpWy1X/h1EaAg0
 DdkjbPR2AjdhvNbI1eFumhMUy/qWrR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Add a new regset to expose FPMR via ptrace. It is not added to the FPSIMD
registers since that structure is exposed elsewhere without any allowance
for extension we don't add there.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h   |  1 +
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 20d7ef82de90..cfb8a4d213be 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -697,6 +697,39 @@ static int tls_set(struct task_struct *target, const struct user_regset *regset,
 	return ret;
 }
 
+static int fpmr_get(struct task_struct *target, const struct user_regset *regset,
+		   struct membuf to)
+{
+	if (!system_supports_fpmr())
+		return -EINVAL;
+
+	if (target == current)
+		fpsimd_preserve_current_state();
+
+	return membuf_store(&to, target->thread.fpmr);
+}
+
+static int fpmr_set(struct task_struct *target, const struct user_regset *regset,
+		   unsigned int pos, unsigned int count,
+		   const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+	unsigned long fpmr;
+
+	if (!system_supports_fpmr())
+		return -EINVAL;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fpmr, 0, count);
+	if (ret)
+		return ret;
+
+	target->thread.fpmr = fpmr;
+
+	fpsimd_flush_task_state(target);
+
+	return 0;
+}
+
 static int system_call_get(struct task_struct *target,
 			   const struct user_regset *regset,
 			   struct membuf to)
@@ -1417,6 +1450,7 @@ enum aarch64_regset {
 	REGSET_HW_BREAK,
 	REGSET_HW_WATCH,
 #endif
+	REGSET_FPMR,
 	REGSET_SYSTEM_CALL,
 #ifdef CONFIG_ARM64_SVE
 	REGSET_SVE,
@@ -1495,6 +1529,14 @@ static const struct user_regset aarch64_regsets[] = {
 		.regset_get = system_call_get,
 		.set = system_call_set,
 	},
+	[REGSET_FPMR] = {
+		.core_note_type = NT_ARM_FPMR,
+		.n = 1,
+		.size = sizeof(u64),
+		.align = sizeof(u64),
+		.regset_get = fpmr_get,
+		.set = fpmr_set,
+	},
 #ifdef CONFIG_ARM64_SVE
 	[REGSET_SVE] = { /* Scalable Vector Extension */
 		.core_note_type = NT_ARM_SVE,
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index 9b731976ce2f..4c8b4641a306 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -440,6 +440,7 @@ typedef struct elf64_shdr {
 #define NT_ARM_SSVE	0x40b		/* ARM Streaming SVE registers */
 #define NT_ARM_ZA	0x40c		/* ARM SME ZA registers */
 #define NT_ARM_ZT	0x40d		/* ARM SME ZT registers */
+#define NT_ARM_FPMR	0x40e		/* ARM floating point mode register */
 #define NT_ARC_V2	0x600		/* ARCv2 accumulator/extra registers */
 #define NT_VMCOREDD	0x700		/* Vmcore Device Dump Note */
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */

-- 
2.30.2


