Return-Path: <linux-doc+bounces-49532-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D44BADE5F1
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 10:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ED693A996A
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 08:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70D028151C;
	Wed, 18 Jun 2025 08:45:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDD815D1;
	Wed, 18 Jun 2025 08:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236327; cv=none; b=cb8AmvPzmjcSfmhg/ui3JoZRxqRr3dhHkIFwuu53HWtt/BbHTab1IQqZ+YV9Zcflj8p8D2CsSxPvaukn05FfwyYmxF9jNgJDXTRh62WSsdmnyV0w+OVWHAvMvYZg0T+73khJG5fFtLDppnUZK5Z6EpEQKh0FBp1bQaq2CbK5nsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236327; c=relaxed/simple;
	bh=cmsvfv56amC5Sa8cFhMOnu4EsHj1UIUNeVTlNt1rxag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EB/KAdQ23qoHYeRHsKThSsnI7fc6bHhLbsFlMtOVRi9WgFSLYfmDLmX3claPRWVCe2N0/2uW3zzC3Xj0oXzfga4jnw9/hDYEJgdCxt4G2a8zIGMFWW0e0gLlFNtcBvDteNCEK5o/gGqZI1LJxnM6zcjkcJ6UgDl/Q/ej1RLml4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC3C014BF;
	Wed, 18 Jun 2025 01:45:04 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5329E3F66E;
	Wed, 18 Jun 2025 01:45:23 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 03/10] arm64/kvm: expose FEAT_MTE_TAGGED_FAR feature to guest
Date: Wed, 18 Jun 2025 09:45:06 +0100
Message-Id: <20250618084513.1761345-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618084513.1761345-1-yeoreum.yun@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

expose FEAT_MTE_TAGGED_FAR feature to guest.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..c8c92cb9da01 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1586,7 +1586,7 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 				       const struct sys_reg_desc *r)
 {
 	u32 id = reg_to_encoding(r);
-	u64 val;
+	u64 val, mask;
 
 	if (sysreg_visible_as_raz(vcpu, r))
 		return 0;
@@ -1617,8 +1617,12 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MPAM_frac);
 		break;
 	case SYS_ID_AA64PFR2_EL1:
-		/* We only expose FPMR */
-		val &= ID_AA64PFR2_EL1_FPMR;
+		mask = ID_AA64PFR2_EL1_FPMR;
+
+		if (kvm_has_mte(vcpu->kvm))
+			mask |= ID_AA64PFR2_EL1_MTEFAR;
+
+		val &= mask;
 		break;
 	case SYS_ID_AA64ISAR1_EL1:
 		if (!vcpu_has_ptrauth(vcpu))
@@ -2878,7 +2882,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				       ID_AA64PFR1_EL1_MPAM_frac |
 				       ID_AA64PFR1_EL1_RAS_frac |
 				       ID_AA64PFR1_EL1_MTE)),
-	ID_WRITABLE(ID_AA64PFR2_EL1, ID_AA64PFR2_EL1_FPMR),
+	ID_WRITABLE(ID_AA64PFR2_EL1,
+		    ID_AA64PFR2_EL1_FPMR |
+		    ID_AA64PFR2_EL1_MTEFAR),
 	ID_UNALLOCATED(4,3),
 	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
 	ID_HIDDEN(ID_AA64SMFR0_EL1),
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


