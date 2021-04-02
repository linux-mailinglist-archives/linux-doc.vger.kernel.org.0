Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36D1D35280E
	for <lists+linux-doc@lfdr.de>; Fri,  2 Apr 2021 11:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbhDBJHk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Apr 2021 05:07:40 -0400
Received: from marcansoft.com ([212.63.210.85]:34812 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234894AbhDBJH2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Apr 2021 05:07:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: hector@marcansoft.com)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 6CAEC42720;
        Fri,  2 Apr 2021 09:07:18 +0000 (UTC)
From:   Hector Martin <marcan@marcan.st>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Hector Martin <marcan@marcan.st>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/18] arm64: Move ICH_ sysreg bits from arm-gic-v3.h to sysreg.h
Date:   Fri,  2 Apr 2021 18:05:37 +0900
Message-Id: <20210402090542.131194-14-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210402090542.131194-1-marcan@marcan.st>
References: <20210402090542.131194-1-marcan@marcan.st>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These definitions are in arm-gic-v3.h for historical reasons which no
longer apply. Move them to sysreg.h so the AIC driver can use them, as
it needs to peek into vGIC registers to deal with the GIC maintentance
interrupt.

Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 arch/arm64/include/asm/sysreg.h    | 60 ++++++++++++++++++++++++++++++
 include/linux/irqchip/arm-gic-v3.h | 56 ----------------------------
 2 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index d4a5fca984c3..609dc42ec8c8 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1032,6 +1032,66 @@
 #define TRFCR_ELx_ExTRE			BIT(1)
 #define TRFCR_ELx_E0TRE			BIT(0)
 
+
+/* GIC Hypervisor interface registers */
+/* ICH_MISR_EL2 bit definitions */
+#define ICH_MISR_EOI		(1 << 0)
+#define ICH_MISR_U		(1 << 1)
+
+/* ICH_LR*_EL2 bit definitions */
+#define ICH_LR_VIRTUAL_ID_MASK	((1ULL << 32) - 1)
+
+#define ICH_LR_EOI		(1ULL << 41)
+#define ICH_LR_GROUP		(1ULL << 60)
+#define ICH_LR_HW		(1ULL << 61)
+#define ICH_LR_STATE		(3ULL << 62)
+#define ICH_LR_PENDING_BIT	(1ULL << 62)
+#define ICH_LR_ACTIVE_BIT	(1ULL << 63)
+#define ICH_LR_PHYS_ID_SHIFT	32
+#define ICH_LR_PHYS_ID_MASK	(0x3ffULL << ICH_LR_PHYS_ID_SHIFT)
+#define ICH_LR_PRIORITY_SHIFT	48
+#define ICH_LR_PRIORITY_MASK	(0xffULL << ICH_LR_PRIORITY_SHIFT)
+
+/* ICH_HCR_EL2 bit definitions */
+#define ICH_HCR_EN		(1 << 0)
+#define ICH_HCR_UIE		(1 << 1)
+#define ICH_HCR_NPIE		(1 << 3)
+#define ICH_HCR_TC		(1 << 10)
+#define ICH_HCR_TALL0		(1 << 11)
+#define ICH_HCR_TALL1		(1 << 12)
+#define ICH_HCR_EOIcount_SHIFT	27
+#define ICH_HCR_EOIcount_MASK	(0x1f << ICH_HCR_EOIcount_SHIFT)
+
+/* ICH_VMCR_EL2 bit definitions */
+#define ICH_VMCR_ACK_CTL_SHIFT	2
+#define ICH_VMCR_ACK_CTL_MASK	(1 << ICH_VMCR_ACK_CTL_SHIFT)
+#define ICH_VMCR_FIQ_EN_SHIFT	3
+#define ICH_VMCR_FIQ_EN_MASK	(1 << ICH_VMCR_FIQ_EN_SHIFT)
+#define ICH_VMCR_CBPR_SHIFT	4
+#define ICH_VMCR_CBPR_MASK	(1 << ICH_VMCR_CBPR_SHIFT)
+#define ICH_VMCR_EOIM_SHIFT	9
+#define ICH_VMCR_EOIM_MASK	(1 << ICH_VMCR_EOIM_SHIFT)
+#define ICH_VMCR_BPR1_SHIFT	18
+#define ICH_VMCR_BPR1_MASK	(7 << ICH_VMCR_BPR1_SHIFT)
+#define ICH_VMCR_BPR0_SHIFT	21
+#define ICH_VMCR_BPR0_MASK	(7 << ICH_VMCR_BPR0_SHIFT)
+#define ICH_VMCR_PMR_SHIFT	24
+#define ICH_VMCR_PMR_MASK	(0xffUL << ICH_VMCR_PMR_SHIFT)
+#define ICH_VMCR_ENG0_SHIFT	0
+#define ICH_VMCR_ENG0_MASK	(1 << ICH_VMCR_ENG0_SHIFT)
+#define ICH_VMCR_ENG1_SHIFT	1
+#define ICH_VMCR_ENG1_MASK	(1 << ICH_VMCR_ENG1_SHIFT)
+
+/* ICH_VTR_EL2 bit definitions */
+#define ICH_VTR_PRI_BITS_SHIFT	29
+#define ICH_VTR_PRI_BITS_MASK	(7 << ICH_VTR_PRI_BITS_SHIFT)
+#define ICH_VTR_ID_BITS_SHIFT	23
+#define ICH_VTR_ID_BITS_MASK	(7 << ICH_VTR_ID_BITS_SHIFT)
+#define ICH_VTR_SEIS_SHIFT	22
+#define ICH_VTR_SEIS_MASK	(1 << ICH_VTR_SEIS_SHIFT)
+#define ICH_VTR_A3V_SHIFT	21
+#define ICH_VTR_A3V_MASK	(1 << ICH_VTR_A3V_SHIFT)
+
 #ifdef __ASSEMBLY__
 
 	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index f6d092fdb93d..81cbf85f73de 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -575,67 +575,11 @@
 #define ICC_SRE_EL1_DFB			(1U << 1)
 #define ICC_SRE_EL1_SRE			(1U << 0)
 
-/*
- * Hypervisor interface registers (SRE only)
- */
-#define ICH_LR_VIRTUAL_ID_MASK		((1ULL << 32) - 1)
-
-#define ICH_LR_EOI			(1ULL << 41)
-#define ICH_LR_GROUP			(1ULL << 60)
-#define ICH_LR_HW			(1ULL << 61)
-#define ICH_LR_STATE			(3ULL << 62)
-#define ICH_LR_PENDING_BIT		(1ULL << 62)
-#define ICH_LR_ACTIVE_BIT		(1ULL << 63)
-#define ICH_LR_PHYS_ID_SHIFT		32
-#define ICH_LR_PHYS_ID_MASK		(0x3ffULL << ICH_LR_PHYS_ID_SHIFT)
-#define ICH_LR_PRIORITY_SHIFT		48
-#define ICH_LR_PRIORITY_MASK		(0xffULL << ICH_LR_PRIORITY_SHIFT)
-
 /* These are for GICv2 emulation only */
 #define GICH_LR_VIRTUALID		(0x3ffUL << 0)
 #define GICH_LR_PHYSID_CPUID_SHIFT	(10)
 #define GICH_LR_PHYSID_CPUID		(7UL << GICH_LR_PHYSID_CPUID_SHIFT)
 
-#define ICH_MISR_EOI			(1 << 0)
-#define ICH_MISR_U			(1 << 1)
-
-#define ICH_HCR_EN			(1 << 0)
-#define ICH_HCR_UIE			(1 << 1)
-#define ICH_HCR_NPIE			(1 << 3)
-#define ICH_HCR_TC			(1 << 10)
-#define ICH_HCR_TALL0			(1 << 11)
-#define ICH_HCR_TALL1			(1 << 12)
-#define ICH_HCR_EOIcount_SHIFT		27
-#define ICH_HCR_EOIcount_MASK		(0x1f << ICH_HCR_EOIcount_SHIFT)
-
-#define ICH_VMCR_ACK_CTL_SHIFT		2
-#define ICH_VMCR_ACK_CTL_MASK		(1 << ICH_VMCR_ACK_CTL_SHIFT)
-#define ICH_VMCR_FIQ_EN_SHIFT		3
-#define ICH_VMCR_FIQ_EN_MASK		(1 << ICH_VMCR_FIQ_EN_SHIFT)
-#define ICH_VMCR_CBPR_SHIFT		4
-#define ICH_VMCR_CBPR_MASK		(1 << ICH_VMCR_CBPR_SHIFT)
-#define ICH_VMCR_EOIM_SHIFT		9
-#define ICH_VMCR_EOIM_MASK		(1 << ICH_VMCR_EOIM_SHIFT)
-#define ICH_VMCR_BPR1_SHIFT		18
-#define ICH_VMCR_BPR1_MASK		(7 << ICH_VMCR_BPR1_SHIFT)
-#define ICH_VMCR_BPR0_SHIFT		21
-#define ICH_VMCR_BPR0_MASK		(7 << ICH_VMCR_BPR0_SHIFT)
-#define ICH_VMCR_PMR_SHIFT		24
-#define ICH_VMCR_PMR_MASK		(0xffUL << ICH_VMCR_PMR_SHIFT)
-#define ICH_VMCR_ENG0_SHIFT		0
-#define ICH_VMCR_ENG0_MASK		(1 << ICH_VMCR_ENG0_SHIFT)
-#define ICH_VMCR_ENG1_SHIFT		1
-#define ICH_VMCR_ENG1_MASK		(1 << ICH_VMCR_ENG1_SHIFT)
-
-#define ICH_VTR_PRI_BITS_SHIFT		29
-#define ICH_VTR_PRI_BITS_MASK		(7 << ICH_VTR_PRI_BITS_SHIFT)
-#define ICH_VTR_ID_BITS_SHIFT		23
-#define ICH_VTR_ID_BITS_MASK		(7 << ICH_VTR_ID_BITS_SHIFT)
-#define ICH_VTR_SEIS_SHIFT		22
-#define ICH_VTR_SEIS_MASK		(1 << ICH_VTR_SEIS_SHIFT)
-#define ICH_VTR_A3V_SHIFT		21
-#define ICH_VTR_A3V_MASK		(1 << ICH_VTR_A3V_SHIFT)
-
 #define ICC_IAR1_EL1_SPURIOUS		0x3ff
 
 #define ICC_SRE_EL2_SRE			(1 << 0)
-- 
2.30.0

