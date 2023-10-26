Return-Path: <linux-doc+bounces-1180-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E417D82EC
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 14:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9CD7B2131D
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 12:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCF6273D1;
	Thu, 26 Oct 2023 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tprJLkkl"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF83883A;
	Thu, 26 Oct 2023 12:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2F9C433C7;
	Thu, 26 Oct 2023 12:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698324402;
	bh=ZUqE+FoZ8I0edvZBSg8kbSquWpI5yMoNq50cI0RqCRA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tprJLkklYLd9LU4YRx3zEkYskq13dHHC2DhKzA6CzKjhJDGvRAm+LSGLuX62rkiUC
	 mgh8v98gEYO6Q7HDvqodefGJdSJ/nntVf17lmXoZ033Kf3oIirNGfwYfonuA6eWiUr
	 HNHPJ6O5NL9Q4+9lMul7E5tGQJ/IK4DD9TFJId6VERhWMUCiaQU0aB8ysjWNxxbvDa
	 vNqQSTkVnrdUHLpk5OM0O+cnDANfcL68Y9mcCywePOP2WqeJGG7Hh6FHQqXBoHIRSr
	 fl9bLROlEWhodHkPpWQ60wzkeldHScO4KY6tANyCuIOCs4UPawfMrcU/wwvwYi2Qxg
	 GiDB2wx+dtocw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Oct 2023 13:44:17 +0100
Subject: [PATCH 03/21] arm64/sysreg: Add definition for ID_AA64ISAR3_EL1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231026-arm64-2023-dpisa-v1-3-8470dd989bb2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZUqE+FoZ8I0edvZBSg8kbSquWpI5yMoNq50cI0RqCRA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlOl+WUHz+pzcsY08wNR6Kjeb25JKyJyDhzGlPim9E
 eK8IbOeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZTpflgAKCRAk1otyXVSH0PU0B/
 9GMmBOtiaoARHjbPxYpbTU3Wt0euLtLqlrzKZURVhrsCeiyY1LoZvh0vXbrNdiQ+FEqycACOlXkXsY
 t0ki7j8v8aD0oQiiB3GBnJjEu9UXCb0sNlD88c7THyIbZ4Il9XLnKOBIt76Q000umfoX3M18aI7k+W
 Am8FRhvhNbAHQKk59MSLd7zZPCLv6YcrvZ6g7V6LJrDhsYL6AxiL8toCsDsB5fE9izdhNc1jB5KqIs
 CRXserJ3jo/Sl9vHtq0j2EsRpiXDiGSzEj3+TydR6tNj/Ntv/tSP3sLLHWLMkAjY2iJXTlUxq9EtP+
 OO+JMUz0p63D54Lespwq6HZEcBeen+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

DDI0601 2023-09 adds a new system register ID_AA64ISAR3_EL1 enumerating
new floating point and TLB invalidation features. Add a defintion for it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index fcca3a3714b0..0515006a7292 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1427,6 +1427,23 @@ UnsignedEnum	3:0	WFxT
 EndEnum
 EndSysreg
 
+Sysreg	ID_AA64ISAR3_EL1	3	0	0	6	3
+Res0	63:12
+UnsignedEnum	11:8	TLBIW
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	7:4	FAMINMAX
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	3:0	CPA
+	0b0000	NI
+	0b0001	IMP
+	0b0010	CPA2
+EndEnum
+EndSysreg
+
 Sysreg	ID_AA64MMFR0_EL1	3	0	0	7	0
 UnsignedEnum	63:60	ECV
 	0b0000	NI

-- 
2.30.2


