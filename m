Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE63214B5D9
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jan 2020 15:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgA1OAs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Jan 2020 09:00:48 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:59418 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbgA1OAr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 09:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=47knvKP2hkOqYj0lWrn/u5a+ztvae81C4pMTyKp2WE4=; b=qv6nbjlQmpV9D0gQtQlJLKkXio
        klniMlQpj/3q2O56PvvRtTdG6KxobJfOEPbh+CMHI2Jhj6LdDOaXPtx8fk8PO40Ay1KgzD4dqWhC2
        wvjOjOUwYskxfjmL2yGzI7kiX++7xVYxeKfwxG0hMBf5jgPSYp3thtaEHJxgwF1ZqQt8M/wko5efC
        wvTzI+8L2UNbCh4Kb88/vbF1kft4wUiyxOfGkkykfnTIHyknpn1CC4TSBe2+eC5B9NcxCkrgcAa2j
        dhwn1vaTYhQgcHOXU2WwOgPjUr7IgpQ4CCVjjDm77YQ4JUP9enL+gCCt3vMpwHvHJsqb2Q8yUf82v
        X5LV+RNA==;
Received: from [177.41.103.99] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwRQ5-0007if-Ey; Tue, 28 Jan 2020 14:00:46 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iwRPp-001BNp-EV; Tue, 28 Jan 2020 15:00:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 08/27] docs: kvm: devices/arm-vgit-v3.txt to ReST
Date:   Tue, 28 Jan 2020 15:00:09 +0100
Message-Id: <20d4b1a9338c37ef127e3d1801c1d14f8353b9f0.1580219586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1580219586.git.mchehab+huawei@kernel.org>
References: <cover.1580219586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Use title markups;
- change indent to match ReST syntax;
- use proper table markups;
- use literal block markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{arm-vgic-v3.txt => arm-vgic-v3.rst}      | 130 +++++++++++-------
 Documentation/virt/kvm/devices/index.rst      |   1 +
 2 files changed, 85 insertions(+), 46 deletions(-)
 rename Documentation/virt/kvm/devices/{arm-vgic-v3.txt => arm-vgic-v3.rst} (77%)

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v3.txt b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
similarity index 77%
rename from Documentation/virt/kvm/devices/arm-vgic-v3.txt
rename to Documentation/virt/kvm/devices/arm-vgic-v3.rst
index ff290b43c8e5..1a64644d1a43 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v3.txt
+++ b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
@@ -1,9 +1,10 @@
+==============================================================
 ARM Virtual Generic Interrupt Controller v3 and later (VGICv3)
 ==============================================================
 
 
 Device types supported:
-  KVM_DEV_TYPE_ARM_VGIC_V3     ARM Generic Interrupt Controller v3.0
+  - KVM_DEV_TYPE_ARM_VGIC_V3     ARM Generic Interrupt Controller v3.0
 
 Only one VGIC instance may be instantiated through this API.  The created VGIC
 will act as the VM interrupt controller, requiring emulated user-space devices
@@ -15,7 +16,8 @@ Creating a guest GICv3 device requires a host GICv3 as well.
 
 Groups:
   KVM_DEV_ARM_VGIC_GRP_ADDR
-  Attributes:
+   Attributes:
+
     KVM_VGIC_V3_ADDR_TYPE_DIST (rw, 64-bit)
       Base address in the guest physical address space of the GICv3 distributor
       register mappings. Only valid for KVM_DEV_TYPE_ARM_VGIC_V3.
@@ -29,21 +31,25 @@ Groups:
       This address needs to be 64K aligned.
 
     KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION (rw, 64-bit)
-      The attribute data pointed to by kvm_device_attr.addr is a __u64 value:
-      bits:     | 63   ....  52  |  51   ....   16 | 15 - 12  |11 - 0
-      values:   |     count      |       base      |  flags   | index
+      The attribute data pointed to by kvm_device_attr.addr is a __u64 value::
+
+        bits:     | 63   ....  52  |  51   ....   16 | 15 - 12  |11 - 0
+        values:   |     count      |       base      |  flags   | index
+
       - index encodes the unique redistributor region index
       - flags: reserved for future use, currently 0
       - base field encodes bits [51:16] of the guest physical base address
         of the first redistributor in the region.
       - count encodes the number of redistributors in the region. Must be
         greater than 0.
+
       There are two 64K pages for each redistributor in the region and
       redistributors are laid out contiguously within the region. Regions
       are filled with redistributors in the index order. The sum of all
       region count fields must be greater than or equal to the number of
       VCPUs. Redistributor regions must be registered in the incremental
       index order, starting from index 0.
+
       The characteristics of a specific redistributor region can be read
       by presetting the index field in the attr data.
       Only valid for KVM_DEV_TYPE_ARM_VGIC_V3.
@@ -52,23 +58,27 @@ Groups:
   KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION attributes.
 
   Errors:
-    -E2BIG:  Address outside of addressable IPA range
-    -EINVAL: Incorrectly aligned address, bad redistributor region
+
+    =======  =============================================================
+    -E2BIG   Address outside of addressable IPA range
+    -EINVAL  Incorrectly aligned address, bad redistributor region
              count/index, mixed redistributor region attribute usage
-    -EEXIST: Address already configured
-    -ENOENT: Attempt to read the characteristics of a non existing
+    -EEXIST  Address already configured
+    -ENOENT  Attempt to read the characteristics of a non existing
              redistributor region
-    -ENXIO:  The group or attribute is unknown/unsupported for this device
+    -ENXIO   The group or attribute is unknown/unsupported for this device
              or hardware support is missing.
-    -EFAULT: Invalid user pointer for attr->addr.
+    -EFAULT  Invalid user pointer for attr->addr.
+    =======  =============================================================
 
 
-  KVM_DEV_ARM_VGIC_GRP_DIST_REGS
-  KVM_DEV_ARM_VGIC_GRP_REDIST_REGS
-  Attributes:
-    The attr field of kvm_device_attr encodes two values:
-    bits:     | 63   ....  32  |  31   ....    0 |
-    values:   |      mpidr     |      offset     |
+  KVM_DEV_ARM_VGIC_GRP_DIST_REGS, KVM_DEV_ARM_VGIC_GRP_REDIST_REGS
+   Attributes:
+
+    The attr field of kvm_device_attr encodes two values::
+
+      bits:     | 63   ....  32  |  31   ....    0 |
+      values:   |      mpidr     |      offset     |
 
     All distributor regs are (rw, 32-bit) and kvm_device_attr.addr points to a
     __u32 value.  64-bit registers must be accessed by separately accessing the
@@ -93,7 +103,8 @@ Groups:
     redistributor is accessed.  The mpidr is ignored for the distributor.
 
     The mpidr encoding is based on the affinity information in the
-    architecture defined MPIDR, and the field is encoded as follows:
+    architecture defined MPIDR, and the field is encoded as follows::
+
       | 63 .... 56 | 55 .... 48 | 47 .... 40 | 39 .... 32 |
       |    Aff3    |    Aff2    |    Aff1    |    Aff0    |
 
@@ -148,24 +159,30 @@ Groups:
     ignored.
 
   Errors:
-    -ENXIO: Getting or setting this register is not yet supported
-    -EBUSY: One or more VCPUs are running
+
+    ======  =====================================================
+    -ENXIO  Getting or setting this register is not yet supported
+    -EBUSY  One or more VCPUs are running
+    ======  =====================================================
 
 
   KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS
-  Attributes:
-    The attr field of kvm_device_attr encodes two values:
-    bits:     | 63      ....       32 | 31  ....  16 | 15  ....  0 |
-    values:   |         mpidr         |      RES     |    instr    |
+   Attributes:
+
+    The attr field of kvm_device_attr encodes two values::
+
+      bits:     | 63      ....       32 | 31  ....  16 | 15  ....  0 |
+      values:   |         mpidr         |      RES     |    instr    |
 
     The mpidr field encodes the CPU ID based on the affinity information in the
-    architecture defined MPIDR, and the field is encoded as follows:
+    architecture defined MPIDR, and the field is encoded as follows::
+
       | 63 .... 56 | 55 .... 48 | 47 .... 40 | 39 .... 32 |
       |    Aff3    |    Aff2    |    Aff1    |    Aff0    |
 
     The instr field encodes the system register to access based on the fields
     defined in the A64 instruction set encoding for system register access
-    (RES means the bits are reserved for future use and should be zero):
+    (RES means the bits are reserved for future use and should be zero)::
 
       | 15 ... 14 | 13 ... 11 | 10 ... 7 | 6 ... 3 | 2 ... 0 |
       |   Op 0    |    Op1    |    CRn   |   CRm   |   Op2   |
@@ -178,26 +195,35 @@ Groups:
 
     CPU interface registers access is not implemented for AArch32 mode.
     Error -ENXIO is returned when accessed in AArch32 mode.
+
   Errors:
-    -ENXIO: Getting or setting this register is not yet supported
-    -EBUSY: VCPU is running
-    -EINVAL: Invalid mpidr or register value supplied
+
+    =======  =====================================================
+    -ENXIO   Getting or setting this register is not yet supported
+    -EBUSY   VCPU is running
+    -EINVAL  Invalid mpidr or register value supplied
+    =======  =====================================================
 
 
   KVM_DEV_ARM_VGIC_GRP_NR_IRQS
-  Attributes:
+   Attributes:
+
     A value describing the number of interrupts (SGI, PPI and SPI) for
     this GIC instance, ranging from 64 to 1024, in increments of 32.
 
     kvm_device_attr.addr points to a __u32 value.
 
   Errors:
-    -EINVAL: Value set is out of the expected range
-    -EBUSY: Value has already be set.
+
+    =======  ======================================
+    -EINVAL  Value set is out of the expected range
+    -EBUSY   Value has already be set.
+    =======  ======================================
 
 
   KVM_DEV_ARM_VGIC_GRP_CTRL
-  Attributes:
+   Attributes:
+
     KVM_DEV_ARM_VGIC_CTRL_INIT
       request the initialization of the VGIC, no additional parameter in
       kvm_device_attr.addr.
@@ -205,20 +231,26 @@ Groups:
       save all LPI pending bits into guest RAM pending tables.
 
       The first kB of the pending table is not altered by this operation.
+
   Errors:
-    -ENXIO: VGIC not properly configured as required prior to calling
-     this attribute
-    -ENODEV: no online VCPU
-    -ENOMEM: memory shortage when allocating vgic internal data
-    -EFAULT: Invalid guest ram access
-    -EBUSY:  One or more VCPUS are running
+
+    =======  ========================================================
+    -ENXIO   VGIC not properly configured as required prior to calling
+             this attribute
+    -ENODEV  no online VCPU
+    -ENOMEM  memory shortage when allocating vgic internal data
+    -EFAULT  Invalid guest ram access
+    -EBUSY   One or more VCPUS are running
+    =======  ========================================================
 
 
   KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO
-  Attributes:
-    The attr field of kvm_device_attr encodes the following values:
-    bits:     | 63      ....       32 | 31   ....    10 | 9  ....  0 |
-    values:   |         mpidr         |      info       |   vINTID   |
+   Attributes:
+
+    The attr field of kvm_device_attr encodes the following values::
+
+      bits:     | 63      ....       32 | 31   ....    10 | 9  ....  0 |
+      values:   |         mpidr         |      info       |   vINTID   |
 
     The vINTID specifies which set of IRQs is reported on.
 
@@ -228,6 +260,7 @@ Groups:
       VGIC_LEVEL_INFO_LINE_LEVEL:
 	Get/Set the input level of the IRQ line for a set of 32 contiguously
 	numbered interrupts.
+
 	vINTID must be a multiple of 32.
 
 	kvm_device_attr.addr points to a __u32 value which will contain a
@@ -243,9 +276,14 @@ Groups:
     reported with the same value regardless of the mpidr specified.
 
     The mpidr field encodes the CPU ID based on the affinity information in the
-    architecture defined MPIDR, and the field is encoded as follows:
+    architecture defined MPIDR, and the field is encoded as follows::
+
       | 63 .... 56 | 55 .... 48 | 47 .... 40 | 39 .... 32 |
       |    Aff3    |    Aff2    |    Aff1    |    Aff0    |
+
   Errors:
-    -EINVAL: vINTID is not multiple of 32 or
-     info field is not VGIC_LEVEL_INFO_LINE_LEVEL
+
+    =======  =============================================
+    -EINVAL  vINTID is not multiple of 32 or info field is
+	     not VGIC_LEVEL_INFO_LINE_LEVEL
+    =======  =============================================
diff --git a/Documentation/virt/kvm/devices/index.rst b/Documentation/virt/kvm/devices/index.rst
index 2aad8d426097..80c1e0e225f4 100644
--- a/Documentation/virt/kvm/devices/index.rst
+++ b/Documentation/virt/kvm/devices/index.rst
@@ -8,3 +8,4 @@ Devices
    :maxdepth: 2
 
    arm-vgic-its
+   arm-vgic-v3
-- 
2.24.1

