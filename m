Return-Path: <linux-doc+bounces-1191-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9EF7D82FF
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 14:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E3C01C20EF1
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 12:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF432DF8E;
	Thu, 26 Oct 2023 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxNrKZ3w"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0462DF72;
	Thu, 26 Oct 2023 12:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A765DC433CC;
	Thu, 26 Oct 2023 12:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698324439;
	bh=DIIfc135uXljK74SaVIpbtbdhvdA87NEj6R4ylFiBfM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qxNrKZ3wkmk1fUZlvBZPIxXdwDUbHDG9C4rE+ZP4AF4KxxbmlNnW3nqBbZjU56gUP
	 T/6BJ8WmEkx1hOHWn7JbF4VmNb2Y2lqJTf9hSqnkt8H3aBoIuqkLPucLEUkK2PrqsP
	 YpLIG7aw92g9acLkWq7d/oIByzbc2v+Vf4TYafF04Cy9HXuuV9ok1p0bFNcC/Lz2er
	 tsZQDWGaA7dZrYxb8PkiPKcg3oPX5Gj56DVuRrI2COQLZduHt2PxC6BOGm8eLCX9ux
	 Dv5V9c3F7HgDb08pMSN/WkAQNjlBKMFBKliFlkHA/IQFl9YhEodRfaT+ZAGfaQvFrx
	 re8lZhJe3eemw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Oct 2023 13:44:28 +0100
Subject: [PATCH 14/21] KVM: arm64: Add newly allocated ID registers to
 register descriptions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231026-arm64-2023-dpisa-v1-14-8470dd989bb2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DIIfc135uXljK74SaVIpbtbdhvdA87NEj6R4ylFiBfM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlOl+fLC49gT8E/5ElSMU1keDsOAH7G7wRO3eRIqUw
 jcC6j+aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZTpfnwAKCRAk1otyXVSH0OHIB/
 0Y4/qd1COrtBKzNMOa9pDRrW9iNmHoVOXZe0+lpK+0j86HfeV7ixEQgl7vc+TH9ILcN42vUMgat3v9
 CR7cS0IC8pm03yoRLMo4scLHKGJNapAMnko1em2IIkVXfZDXjhCMUTsKNxDb6WONtDjw3C3I8gVftz
 NzVjzc3zm8Ro5hAEcpd9cyIDUeLjay0jvUbCPGVJlrgJX9Ok98fHpQVDhufKjb/vtoupE6+46DD2Sx
 ExSemBLCZBXMvuiJGLa36c2vhpwL0h65gxrIwk0KF9y3R4CaxFI2VRorw0oJYAdeAb3Cn7zb7S1ysK
 d5CbaxW4uVA2UjYiIOzYvLF5OyGfXd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The 2023 architecture extensions have allocated some new ID registers, add
them to the KVM system register descriptions so that they are visible to
guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 0afd6136e275..99cdaa594b06 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2016,12 +2016,12 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	  .reset = read_sanitised_id_aa64pfr0_el1,
 	  .val = ID_AA64PFR0_EL1_CSV2_MASK | ID_AA64PFR0_EL1_CSV3_MASK, },
 	ID_SANITISED(ID_AA64PFR1_EL1),
-	ID_UNALLOCATED(4,2),
+	ID_SANITISED(ID_AA64PFR2_EL1),
 	ID_UNALLOCATED(4,3),
 	ID_SANITISED(ID_AA64ZFR0_EL1),
 	ID_HIDDEN(ID_AA64SMFR0_EL1),
 	ID_UNALLOCATED(4,6),
-	ID_UNALLOCATED(4,7),
+	ID_SANITISED(ID_AA64FPFR0_EL1),
 
 	/* CRm=5 */
 	{ SYS_DESC(SYS_ID_AA64DFR0_EL1),
@@ -2042,7 +2042,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_SANITISED(ID_AA64ISAR0_EL1),
 	ID_SANITISED(ID_AA64ISAR1_EL1),
 	ID_SANITISED(ID_AA64ISAR2_EL1),
-	ID_UNALLOCATED(6,3),
+	ID_SANITISED(ID_AA64ISAR3_EL1),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),
 	ID_UNALLOCATED(6,6),

-- 
2.30.2


