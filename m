Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217571A864E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2020 18:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391427AbgDNQ4B (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Apr 2020 12:56:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405576AbgDNQtH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Apr 2020 12:49:07 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1EE5214D8;
        Tue, 14 Apr 2020 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586882942;
        bh=p4BaOts5XwS9tdFV4i/p0/J5e6kWOeDWMFxv85StaUU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p9qGMRIzAkvFnHhlQeLCMA/c/N9w9OOjuBKNanQ/VsCxW1/TRGrDKQv10ecEiZHYB
         janBLf1q+j2PSXdjOkI2q9dQ5TaT/BmqqA220JsuLo2qXKLrYmVfNaKv3Zn/lcmCCk
         xSyrLA5uUgzxoY6zim1b8II8HRYy6zzM+njq386o=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOOk8-0068lh-RJ; Tue, 14 Apr 2020 18:49:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, kvm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/33] docs: fix broken references for ReST files that moved around
Date:   Tue, 14 Apr 2020 18:48:36 +0200
Message-Id: <64773a12b4410aaf3e3be89e3ec7e34de2484eea.1586881715.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586881715.git.mchehab+huawei@kernel.org>
References: <cover.1586881715.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some broken references happened due to shifting files around
and ReST renames. Those can't be auto-fixed by the script,
so let's fix them manually.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/doc-guide/maintainer-profile.rst      | 2 +-
 Documentation/virt/kvm/mmu.rst                      | 2 +-
 Documentation/virt/kvm/review-checklist.rst         | 2 +-
 arch/x86/kvm/mmu/mmu.c                              | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 2 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 2 +-
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c   | 2 +-
 drivers/media/v4l2-core/v4l2-fwnode.c               | 2 +-
 include/uapi/linux/kvm.h                            | 4 ++--
 tools/include/uapi/linux/kvm.h                      | 4 ++--
 11 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/doc-guide/maintainer-profile.rst b/Documentation/doc-guide/maintainer-profile.rst
index 5afc0ddba40a..755d39f0d407 100644
--- a/Documentation/doc-guide/maintainer-profile.rst
+++ b/Documentation/doc-guide/maintainer-profile.rst
@@ -6,7 +6,7 @@ Documentation subsystem maintainer entry profile
 The documentation "subsystem" is the central coordinating point for the
 kernel's documentation and associated infrastructure.  It covers the
 hierarchy under Documentation/ (with the exception of
-Documentation/device-tree), various utilities under scripts/ and, at least
+Documentation/devicetree), various utilities under scripts/ and, at least
 some of the time, LICENSES/.
 
 It's worth noting, though, that the boundaries of this subsystem are rather
diff --git a/Documentation/virt/kvm/mmu.rst b/Documentation/virt/kvm/mmu.rst
index 60981887d20b..46126ecc70f7 100644
--- a/Documentation/virt/kvm/mmu.rst
+++ b/Documentation/virt/kvm/mmu.rst
@@ -319,7 +319,7 @@ Handling a page fault is performed as follows:
 
  - If both P bit and R/W bit of error code are set, this could possibly
    be handled as a "fast page fault" (fixed without taking the MMU lock).  See
-   the description in Documentation/virt/kvm/locking.txt.
+   the description in Documentation/virt/kvm/locking.rst.
 
  - if needed, walk the guest page tables to determine the guest translation
    (gva->gpa or ngpa->gpa)
diff --git a/Documentation/virt/kvm/review-checklist.rst b/Documentation/virt/kvm/review-checklist.rst
index 1f86a9d3f705..dc01aea4057b 100644
--- a/Documentation/virt/kvm/review-checklist.rst
+++ b/Documentation/virt/kvm/review-checklist.rst
@@ -10,7 +10,7 @@ Review checklist for kvm patches
 2.  Patches should be against kvm.git master branch.
 
 3.  If the patch introduces or modifies a new userspace API:
-    - the API must be documented in Documentation/virt/kvm/api.txt
+    - the API must be documented in Documentation/virt/kvm/api.rst
     - the API must be discoverable using KVM_CHECK_EXTENSION
 
 4.  New state must include support for save/restore.
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 8071952e9cf2..fd59fee84631 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3586,7 +3586,7 @@ static bool fast_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 		/*
 		 * Currently, fast page fault only works for direct mapping
 		 * since the gfn is not stable for indirect shadow page. See
-		 * Documentation/virt/kvm/locking.txt to get more detail.
+		 * Documentation/virt/kvm/locking.rst to get more detail.
 		 */
 		fault_handled = fast_pf_fix_direct_spte(vcpu, sp,
 							iterator.sptep, spte,
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index a5fd8975f3d3..a6abb701bfc6 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -8,7 +8,7 @@
  * This file add support for AES cipher with 128,192,256 bits keysize in
  * CBC and ECB mode.
  *
- * You could find a link for the datasheet in Documentation/arm/sunxi/README
+ * You could find a link for the datasheet in Documentation/arm/sunxi.rst
  */
 
 #include <linux/crypto.h>
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 3e4e4bbda34c..b957061424a1 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -7,7 +7,7 @@
  *
  * Core file which registers crypto algorithms supported by the CryptoEngine.
  *
- * You could find a link for the datasheet in Documentation/arm/sunxi/README
+ * You could find a link for the datasheet in Documentation/arm/sunxi.rst
  */
 #include <linux/clk.h>
 #include <linux/crypto.h>
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 84d52fc3a2da..c89cb2ee2496 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -8,7 +8,7 @@
  * This file add support for AES cipher with 128,192,256 bits keysize in
  * CBC and ECB mode.
  *
- * You could find a link for the datasheet in Documentation/arm/sunxi/README
+ * You could find a link for the datasheet in Documentation/arm/sunxi.rst
  */
 
 #include <linux/crypto.h>
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
index 6b301afffd11..8ba4f9c81dac 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -7,7 +7,7 @@
  *
  * Core file which registers crypto algorithms supported by the SecuritySystem
  *
- * You could find a link for the datasheet in Documentation/arm/sunxi/README
+ * You could find a link for the datasheet in Documentation/arm/sunxi.rst
  */
 #include <linux/clk.h>
 #include <linux/crypto.h>
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 97f0f8b23b5d..8a1e1b95b379 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -980,7 +980,7 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
  *
  * THIS EXAMPLE EXISTS MERELY TO DOCUMENT THIS FUNCTION. DO NOT USE IT AS A
  * REFERENCE IN HOW ACPI TABLES SHOULD BE WRITTEN!! See documentation under
- * Documentation/acpi/dsd instead and especially graph.txt,
+ * Documentation/firmware-guide/acpi/dsd/ instead and especially graph.txt,
  * data-node-references.txt and leds.txt .
  *
  *	Scope (\_SB.PCI0.I2C2)
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 428c7dde6b4b..fdd632c833b4 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -116,7 +116,7 @@ struct kvm_irq_level {
 	 * ACPI gsi notion of irq.
 	 * For IA-64 (APIC model) IOAPIC0: irq 0-23; IOAPIC1: irq 24-47..
 	 * For X86 (standard AT mode) PIC0/1: irq 0-15. IOAPIC0: 0-23..
-	 * For ARM: See Documentation/virt/kvm/api.txt
+	 * For ARM: See Documentation/virt/kvm/api.rst
 	 */
 	union {
 		__u32 irq;
@@ -1107,7 +1107,7 @@ struct kvm_xen_hvm_config {
  *
  * KVM_IRQFD_FLAG_RESAMPLE indicates resamplefd is valid and specifies
  * the irqfd to operate in resampling mode for level triggered interrupt
- * emulation.  See Documentation/virt/kvm/api.txt.
+ * emulation.  See Documentation/virt/kvm/api.rst.
  */
 #define KVM_IRQFD_FLAG_RESAMPLE (1 << 1)
 
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index 4b95f9a31a2f..e5f32fcec68f 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -116,7 +116,7 @@ struct kvm_irq_level {
 	 * ACPI gsi notion of irq.
 	 * For IA-64 (APIC model) IOAPIC0: irq 0-23; IOAPIC1: irq 24-47..
 	 * For X86 (standard AT mode) PIC0/1: irq 0-15. IOAPIC0: 0-23..
-	 * For ARM: See Documentation/virt/kvm/api.txt
+	 * For ARM: See Documentation/virt/kvm/api.rst
 	 */
 	union {
 		__u32 irq;
@@ -1100,7 +1100,7 @@ struct kvm_xen_hvm_config {
  *
  * KVM_IRQFD_FLAG_RESAMPLE indicates resamplefd is valid and specifies
  * the irqfd to operate in resampling mode for level triggered interrupt
- * emulation.  See Documentation/virt/kvm/api.txt.
+ * emulation.  See Documentation/virt/kvm/api.rst.
  */
 #define KVM_IRQFD_FLAG_RESAMPLE (1 << 1)
 
-- 
2.25.2

