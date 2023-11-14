Return-Path: <linux-doc+bounces-2363-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0327EB23F
	for <lists+linux-doc@lfdr.de>; Tue, 14 Nov 2023 15:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B41C528124E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Nov 2023 14:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B394405D3;
	Tue, 14 Nov 2023 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEYsetiV"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2656C41227;
	Tue, 14 Nov 2023 14:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42084C433D9;
	Tue, 14 Nov 2023 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699972565;
	bh=2lwb/HSWzM5tgdqcRY+V9adtYXXgaHL2EUDsgIl8iAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KEYsetiV6MaKRvSP2qTYGyOt6FTXMtZHH5rnhGvGeHym+yDLW2n7f3qK/gLamETzg
	 G+QO8rMtRiQMm2avjkoPSJbDf/AK1cy4amP7GlfQouAoj+dBb+MFHHuKSaF2/9EEAv
	 45Rht04crG3HYhTOPB3vpLINSm+9Bu2R4gedci/AJs7vo2mXBrI3X9FjRUrDowcatR
	 mfq0kN0gzMOoYDu4SyZeiyQFsJq0Y9fv0af9iF1vpSabijN2iDBK0i4wLd6B0n4pEA
	 U00T40Xbwi7+scmTmVBHGngGGsUIvpDRHsFA8eGG4gzPO8hKQASjtS//4Oew1oFM0H
	 XuRJ3kUyariwQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 14 Nov 2023 14:34:58 +0000
Subject: [PATCH v2 13/21] arm64/ptrace: Expose FPMR via ptrace
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-arm64-2023-dpisa-v2-13-47251894f6a8@kernel.org>
References: <20231114-arm64-2023-dpisa-v2-0-47251894f6a8@kernel.org>
In-Reply-To: <20231114-arm64-2023-dpisa-v2-0-47251894f6a8@kernel.org>
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
 h=from:subject:message-id; bh=2lwb/HSWzM5tgdqcRY+V9adtYXXgaHL2EUDsgIl8iAQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlU4Wezz8fhVXghjJg399hUEAcrCZzENLJijL4NWsO
 Sa+6tuOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZVOFngAKCRAk1otyXVSH0PRgB/
 9AktNcdpCKGPO+EG0Sv4Ug0mwEFOJeJj1bTis0Oqw5Y6betpj1xiH6x25BDr9vn5Fc57mgE0nOTGfi
 2BEo7s8lkYhcsTCIA7sq1IXn2QgU/W4uERUmmt4Je31beCS6aVl7iODRIEo11vT/z+1HNXgLVdqtce
 rv0lYUk9A0HhP2Vtmr6K3MXFVqSooFd3jZ+2Rwj8mupg3Qeb6WbMHiTt0tisrmZlzu5w/vS/kaZjf9
 zQKipE/3j+F5Agad97zfIL9qmqQn9GqxFRIGuDMx7XFbBo9zXUsNYmwid6nO94e97I2f6niOZHQeqr
 L6/GxB2tu/AFY542AhaHO/vC2w8Y5A
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
index 9417309b7230..b54b313bcf07 100644
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


