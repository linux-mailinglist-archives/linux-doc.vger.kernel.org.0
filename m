Return-Path: <linux-doc+bounces-1177-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 410B37D82E2
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 14:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB7DA281FC6
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 12:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E40028E31;
	Thu, 26 Oct 2023 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz6qPi/5"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BF2883A;
	Thu, 26 Oct 2023 12:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53E9C433C7;
	Thu, 26 Oct 2023 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698324392;
	bh=o9jyzv53TdbTQ/JvbB6Pk8C3vEljuK7P7LZdyPhUN88=;
	h=From:Subject:Date:To:Cc:From;
	b=gz6qPi/5JL4iQYlYffY1glVPzhZWf6mcDmcHo2LK6FbvaJIEwSQSiAuZ0q36tug+Y
	 viIGWSww7LN5yP6PggCkyPU1NAAzVWxqbU5PPTX/PRK5uBsYd8QH0a8AOm2dJ9UoNa
	 szNuLjLm6SVwHROLU7bQhHu1zKSVbquQPUdyBPfztrifR0Qb7AdwYvYZrcWNpLtGT4
	 p+tklhhfLNk3fo2pu0bs/zPh6MgPMgMkHqvDGu4aBaunoXXcsOgzsWqCyio2/BzYsm
	 AcGQ5w2+QgMKxDVNRgdc2hmk7JQQJA76Te4heiZ9go+bnRd2ZKiVXefc8hxW0AulSP
	 FZ7EF5Gcs665w==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/21] arm64: Support for 2023 DPISA extensions
Date: Thu, 26 Oct 2023 13:44:14 +0100
Message-Id: <20231026-arm64-2023-dpisa-v1-0-8470dd989bb2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5fOmUC/x3MTQqAIBBA4avErBvwL4WuEi0kx5pFJgoRRHfPW
 n6L926oVJgqjN0NhU6ufKQG2XewbD6thByaQQmlpRAafdmtwY8YMlePKuqgBmescQZalgtFvv7
 lND/PC71mQf9iAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=4266; i=broonie@kernel.org;
 h=from:subject:message-id; bh=o9jyzv53TdbTQ/JvbB6Pk8C3vEljuK7P7LZdyPhUN88=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlOl+UIx/5I6oPhxFmpNY8nGgSlVbxt2/Z5y6RQ2DI
 6MU1O5uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZTpflAAKCRAk1otyXVSH0APsB/
 99XK8I3xOVs2O6LCrgWk38xQ/nVjwx/1RkJCdMy4iAmj+jJGIUWFzRLiY2yFMu6aAyZWtRgwyL5vs7
 Tiey4Om12GAwXq2rw142vqUwmoVlfK5ZI9l//AeScOQ20D4ODHuo3ibOC9jGBZBCgZEr9SeapP4A5T
 O6ZbyPhmybKATmRrTRRWZOszQLrvkHUvNwKhxUcA2ZV8e+bt4WOVCFoUDtIpqJMrSxEa/saZxWB38h
 j08o8gPZsw16VWtZ5EaMM4x2lbIDOJv2IQinmuzxQMBdQRhbaA9C15Hytw9OOz2bKWwHQEcruE2A3f
 EQnCBd8FUyX8JjsBH1DLmoFTQwVmZG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

This series enables support for the data processing extensions in the
newly released 2023 architecture, this is mainly support for 8 bit
floating point formats.  Most of the extensions only introduce new
instructions and therefore only require hwcaps but there is a new EL0
visible control register FPMR used to control the 8 bit floating point
formats, we need to manage traps for this and context switch it.

The sharing of floating point save code between the host and guest
kernels slightly complicates the introduction of KVM support, we first
introduce host support with some placeholders for KVM then replace those
with the actual KVM support.

I've not added test coverage for ptrace, I've got a not quite finished
test program which exercises all the FP ptrace interfaces and their
interactions together, my plan is to cover it there rather than add
another tiny test program that duplicates the boilerplace for tracing a
target and doesn't actually run the traced program.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (21):
      arm64/sysreg: Add definition for ID_AA64PFR2_EL1
      arm64/sysreg: Update ID_AA64ISAR2_EL1 defintion for DDI0601 2023-09
      arm64/sysreg: Add definition for ID_AA64ISAR3_EL1
      arm64/sysreg: Add definition for ID_AA64FPFR0_EL1
      arm64/sysreg: Update ID_AA64SMFR0_EL1 definition for DDI0601 2023-09
      arm64/sysreg: Update SCTLR_EL1 for DDI0601 2023-09
      arm64/sysreg: Update HCRX_EL2 definition for DDI0601 2023-09
      arm64/sysreg: Add definition for FPMR
      arm64/cpufeature: Hook new identification registers up to cpufeature
      arm64/fpsimd: Enable host kernel access to FPMR
      arm64/fpsimd: Support FEAT_FPMR
      arm64/signal: Add FPMR signal handling
      arm64/ptrace: Expose FPMR via ptrace
      KVM: arm64: Add newly allocated ID registers to register descriptions
      KVM: arm64: Support FEAT_FPMR for guests
      arm64/hwcap: Define hwcaps for 2023 DPISA features
      kselftest/arm64: Handle FPMR context in generic signal frame parser
      kselftest/arm64: Add basic FPMR test
      kselftest/arm64: Add 2023 DPISA hwcap test coverage
      KVM: arm64: selftests: Document feature registers added in 2023 extensions
      KVM: arm64: selftests: Teach get-reg-list about FPMR

 Documentation/arch/arm64/elf_hwcaps.rst            |  49 +++++
 arch/arm64/include/asm/cpu.h                       |   3 +
 arch/arm64/include/asm/cpufeature.h                |   5 +
 arch/arm64/include/asm/fpsimd.h                    |   2 +
 arch/arm64/include/asm/hwcap.h                     |  15 ++
 arch/arm64/include/asm/kvm_arm.h                   |   4 +-
 arch/arm64/include/asm/kvm_host.h                  |   3 +
 arch/arm64/include/asm/processor.h                 |   2 +
 arch/arm64/include/uapi/asm/hwcap.h                |  15 ++
 arch/arm64/include/uapi/asm/sigcontext.h           |   8 +
 arch/arm64/kernel/cpufeature.c                     |  72 +++++++
 arch/arm64/kernel/cpuinfo.c                        |  18 ++
 arch/arm64/kernel/fpsimd.c                         |  13 ++
 arch/arm64/kernel/ptrace.c                         |  42 ++++
 arch/arm64/kernel/signal.c                         |  59 ++++++
 arch/arm64/kvm/fpsimd.c                            |  19 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            |   7 +-
 arch/arm64/kvm/sys_regs.c                          |  17 +-
 arch/arm64/tools/cpucaps                           |   1 +
 arch/arm64/tools/sysreg                            | 153 ++++++++++++++-
 include/uapi/linux/elf.h                           |   1 +
 tools/testing/selftests/arm64/abi/hwcap.c          | 217 +++++++++++++++++++++
 tools/testing/selftests/arm64/signal/.gitignore    |   1 +
 .../arm64/signal/testcases/fpmr_siginfo.c          |  82 ++++++++
 .../selftests/arm64/signal/testcases/testcases.c   |   8 +
 .../selftests/arm64/signal/testcases/testcases.h   |   1 +
 tools/testing/selftests/kvm/aarch64/get-reg-list.c |  11 +-
 27 files changed, 810 insertions(+), 18 deletions(-)
---
base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
change-id: 20231003-arm64-2023-dpisa-2f3d25746474

Best regards,
-- 
Mark Brown <broonie@kernel.org>


