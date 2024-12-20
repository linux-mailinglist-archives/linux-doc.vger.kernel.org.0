Return-Path: <linux-doc+bounces-33431-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 675D09F8D2C
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 08:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 470C77A357B
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 07:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6531A2643;
	Fri, 20 Dec 2024 07:23:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DC91A0BCF;
	Fri, 20 Dec 2024 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734679392; cv=none; b=Td3YyRnavwCVqxKqk6s5DjouJ+rqLXf9XI2HSBX91zyExUAnPWFjnpdkGOOWUWN72q2qSjPTWq0FHbmDUTpFDJOS4eXpTrdkV5QEjbi8zMrz0A9aMZRvHNJudaGppNsYL+hsZSuITsMa/SC/n/xLSBB+TdzqVAsVcxQ1NbtUs34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734679392; c=relaxed/simple;
	bh=nIceMfvuW4qySkg0J3rYWDUEk38BwWSRTy6dngdXqQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SKYOxfvBJ+k3rvQLeifW7d72gW9A4dJuYHPnHzR55z/Fdk0FzwfXJo6ppjo5WsA9xlSeYUiWFFPjgyVPofP14JvO6MabVSr9aM8y8Kl1BHUWlRyv1NX2PXS4NOXbuZITiSAO6tEyEf3ihaeJwQVFv4yZiZXSPwR9hwcXozjZhQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CFBD1E32;
	Thu, 19 Dec 2024 23:23:38 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.51.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4990B3F58B;
	Thu, 19 Dec 2024 23:23:05 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <robh@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>,
	kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/7] arm64/sysreg: Add register fields for HDFGWTR2_EL2
Date: Fri, 20 Dec 2024 12:52:36 +0530
Message-Id: <20241220072240.1003352-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220072240.1003352-1-anshuman.khandual@arm.com>
References: <20241220072240.1003352-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds register fields for HDFGWTR2_EL2 as per the definitions based
on DDI0601 2024-09.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/tools/sysreg | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9ce8602dd40f..f5a1fa75ec72 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2575,6 +2575,34 @@ Field	1	nPMIAR_EL1
 Field	0	nPMECR_EL1
 EndSysreg
 
+Sysreg HDFGWTR2_EL2	3	4	3	1	1
+Res0	63:25
+Field	24	nPMBMAR_EL1
+Field	23	nMDSTEPOP_EL1
+Field	22	nTRBMPAM_EL1
+Field	21	nPMZR_EL0
+Field	20	nTRCITECR_EL1
+Field	19	nPMSDSFR_EL1
+Res0	18:17
+Field	16	nSPMSCR_EL1
+Field	15	nSPMACCESSR_EL1
+Field	14	nSPMCR_EL0
+Field	13	nSPMOVS
+Field	12	nSPMINTEN
+Field	11	nSPMCNTEN
+Field	10	nSPMSELR_EL0
+Field	9	nSPMEVTYPERn_EL0
+Field	8	nSPMEVCNTRn_EL0
+Field	7	nPMSSCR_EL1
+Res0	6
+Field	5	nMDSELR_EL1
+Field	4	nPMUACR_EL1
+Field	3	nPMICFILTR_EL0
+Field	2	nPMICNTR_EL0
+Field	1	nPMIAR_EL1
+Field	0	nPMECR_EL1
+EndSysreg
+
 Sysreg HDFGRTR_EL2	3	4	3	1	4
 Field	63	PMBIDR_EL1
 Field	62	nPMSNEVFR_EL1
-- 
2.25.1


