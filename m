Return-Path: <linux-doc+bounces-1197-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA407D830A
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 14:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C4091C20F39
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 12:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8952DF90;
	Thu, 26 Oct 2023 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwavNWQ7"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6592DF88;
	Thu, 26 Oct 2023 12:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3799C433C8;
	Thu, 26 Oct 2023 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698324458;
	bh=RtrbRWeplo/J+dSChm3CUN1rkk7mxJJmNnU3ySYX5lo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JwavNWQ7Qw92WJ9PaGFEOjbAckxxdipb5X3kcuitU6FhySsU0xjhk4HSxtN6h21O5
	 91aWAqZiNQknMOXNqZ9gAgIuVKiPLQQgg70DAR85CjFcIHiPgjAkpYgEcTaoyCeTRA
	 jTwTcjIaO+RK/gVZFYCi69E/pfMpMDdentwpOqgzEL0mIgkJca+6bnn4Y3C1hNEAEh
	 iZXWJdtsrASdl7JIhFUKzB+bEip1ETlQo7cQ4yeUuonHp/nAJa+r7A6v71SS6/a8Ma
	 7O6PfoHqkQsVb7e32Vix/OCbJvaSfw6bl7AHkOjCp3fT12AwzbSey2KoEBH8g2i4gQ
	 jBvGMw55JuvdA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Oct 2023 13:44:34 +0100
Subject: [PATCH 20/21] KVM: arm64: selftests: Document feature registers
 added in 2023 extensions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231026-arm64-2023-dpisa-v1-20-8470dd989bb2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RtrbRWeplo/J+dSChm3CUN1rkk7mxJJmNnU3ySYX5lo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlOl+jqft2YUkLQI/MEIY8LsCKvoGxDY1hXrWu8EsK
 SE9K94iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZTpfowAKCRAk1otyXVSH0OTPB/
 sF9p1R8jj6bjpG3QesJ8SB2O8D51f0dDJutFMcOLKbk0QFhKh8/7t+9NjWxNSSyaDjiJQY4+pEg3dg
 UtHPf1IaWZ4Aa1h+YgaSMmrpZrmS7quTWEERxUZeGl4MsyI34bCke+AIZXv4Niq0elLuHS6YnPDv5z
 aPh8LxzXWQXQNqkNF7CjpAUAwABqvf/wvIgGQ9BldTga0KvRb4bwx2xz03Np7KQE2x2jF8xuH2Hxy+
 MhC55De1aGWRPrWV4nxEB+WkLDITM7gmeA5QxC6DJTDz0ZjG4RqyY1VbDtSwaJB1ChoNlnFFMt9avh
 efbpskKDkEuopq0V6dry7QdwWRSbiS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The 2023 architecture extensions allocated some previously usused feature
registers, add comments mapping the names in get-reg-list as we do for the
other allocated registers.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/aarch64/get-reg-list.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index 709d7d721760..71ea6ecec7ce 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -428,7 +428,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 0, 4, 4),	/* ID_AA64ZFR0_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 4, 5),	/* ID_AA64SMFR0_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 4, 6),
-	ARM64_SYS_REG(3, 0, 0, 4, 7),
+	ARM64_SYS_REG(3, 0, 0, 4, 7),	/* ID_AA64FPFR_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 5, 0),	/* ID_AA64DFR0_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 5, 1),	/* ID_AA64DFR1_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 5, 2),
@@ -440,7 +440,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 0, 6, 0),	/* ID_AA64ISAR0_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 6, 1),	/* ID_AA64ISAR1_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 6, 2),	/* ID_AA64ISAR2_EL1 */
-	ARM64_SYS_REG(3, 0, 0, 6, 3),
+	ARM64_SYS_REG(3, 0, 0, 6, 3),	/* ID_AA64ISAR3_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 6, 4),
 	ARM64_SYS_REG(3, 0, 0, 6, 5),
 	ARM64_SYS_REG(3, 0, 0, 6, 6),

-- 
2.30.2


