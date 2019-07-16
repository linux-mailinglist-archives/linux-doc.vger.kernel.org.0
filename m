Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06C496A866
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jul 2019 14:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732234AbfGPML1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 Jul 2019 08:11:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41026 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbfGPML1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 08:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ixTfixJrA1Zyx/y8ayMfOAJhnEEj2Q3WfmWUZhfDj3I=; b=hnBjzC8y/vZy+rYxg/3gEChv35
        h/vHMn046CfRXwNAuRj1RkkE31xtmdVAQWxlGn02pIWDncIXVGTecmBDk3Oj0YqVYmsycZxs2j7sp
        QPDO+kcJgr04Plu2b3SruSxD/E32chef7nZNUtBeVpKBaHCengg2jBA3AR86FdGybQfr2mCcmZufB
        bAd3ZEtJ+mXAGEn/R4rAAzYn9ucXRQ9OmZB2kUi7k/J+4BsSRDoUEaLA/pVsORYo9pOSvhnfKm55t
        VxUo3KHKDkgu59nNR4IsJ1qDuCb3CBYSF3phTFnmcAZALm58o14uW1i/DLL28Fv3kZZPSQwW2y28M
        1yPnI/fw==;
Received: from [189.27.46.152] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnMIL-0004i1-DL; Tue, 16 Jul 2019 12:10:58 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnMII-0000Qb-LS; Tue, 16 Jul 2019 09:10:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Russell Currey <ruscur@russell.cc>,
        Sam Bobroff <sbobroff@linux.ibm.com>,
        "Oliver O'Halloran" <oohall@gmail.com>,
        Linas Vepstas <linasvepstas@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        "Manoj N. Kumar" <manoj@linux.ibm.com>,
        "Matthew R. Ochs" <mrochs@linux.ibm.com>,
        Uma Krishnan <ukrishn@linux.ibm.com>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linuxppc-dev@lists.ozlabs.org,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: [PATCH 01/14] docs: powerpc: convert docs to ReST and rename to *.rst
Date:   Tue, 16 Jul 2019 09:10:40 -0300
Message-Id: <ff6bf068a5efe341b960ae17a9b8b87d3a2d323f.1563277838.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563277838.git.mchehab+samsung@kernel.org>
References: <cover.1563277838.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Convert docs to ReST and add them to the arch-specific
book.

The conversion here was trivial, as almost every file there
was already using an elegant format close to ReST standard.

The changes were mostly to mark literal blocks and add a few
missing section title identifiers.

One note with regards to "--": on Sphinx, this can't be used
to identify a list, as it will format it badly. This can be
used, however, to identify a long hyphen - and "---" is an
even longer one.

At its new index.rst, let's add a :orphan: while this is not linked to
the main index.rst file, in order to avoid build warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com> # cxl
---
 Documentation/PCI/pci-error-recovery.rst      |   5 +-
 Documentation/index.rst                       |   1 +
 .../{bootwrapper.txt => bootwrapper.rst}      |  28 +++-
 .../{cpu_families.txt => cpu_families.rst}    |  23 +--
 .../{cpu_features.txt => cpu_features.rst}    |   6 +-
 Documentation/powerpc/{cxl.txt => cxl.rst}    |  46 ++++--
 .../powerpc/{cxlflash.txt => cxlflash.rst}    |  10 +-
 .../{DAWR-POWER9.txt => dawr-power9.rst}      |  15 +-
 Documentation/powerpc/{dscr.txt => dscr.rst}  |  18 +-
 ...ecovery.txt => eeh-pci-error-recovery.rst} | 108 ++++++------
 ...ed-dump.txt => firmware-assisted-dump.rst} | 117 +++++++------
 Documentation/powerpc/{hvcs.txt => hvcs.rst}  | 108 ++++++------
 Documentation/powerpc/index.rst               |  34 ++++
 Documentation/powerpc/isa-versions.rst        |  15 +-
 .../powerpc/{mpc52xx.txt => mpc52xx.rst}      |  12 +-
 ...nv.txt => pci_iov_resource_on_powernv.rst} |  15 +-
 .../powerpc/{pmu-ebb.txt => pmu-ebb.rst}      |   1 +
 Documentation/powerpc/ptrace.rst              | 156 ++++++++++++++++++
 Documentation/powerpc/ptrace.txt              | 151 -----------------
 .../{qe_firmware.txt => qe_firmware.rst}      |  37 +++--
 .../{syscall64-abi.txt => syscall64-abi.rst}  |  29 ++--
 ...al_memory.txt => transactional_memory.rst} |  45 ++---
 MAINTAINERS                                   |   6 +-
 arch/powerpc/kernel/exceptions-64s.S          |   2 +-
 drivers/soc/fsl/qe/qe.c                       |   2 +-
 drivers/tty/hvc/hvcs.c                        |   2 +-
 include/soc/fsl/qe/qe.h                       |   2 +-
 27 files changed, 567 insertions(+), 427 deletions(-)
 rename Documentation/powerpc/{bootwrapper.txt => bootwrapper.rst} (93%)
 rename Documentation/powerpc/{cpu_families.txt => cpu_families.rst} (95%)
 rename Documentation/powerpc/{cpu_features.txt => cpu_features.rst} (97%)
 rename Documentation/powerpc/{cxl.txt => cxl.rst} (95%)
 rename Documentation/powerpc/{cxlflash.txt => cxlflash.rst} (98%)
 rename Documentation/powerpc/{DAWR-POWER9.txt => dawr-power9.rst} (95%)
 rename Documentation/powerpc/{dscr.txt => dscr.rst} (91%)
 rename Documentation/powerpc/{eeh-pci-error-recovery.txt => eeh-pci-error-recovery.rst} (82%)
 rename Documentation/powerpc/{firmware-assisted-dump.txt => firmware-assisted-dump.rst} (80%)
 rename Documentation/powerpc/{hvcs.txt => hvcs.rst} (91%)
 create mode 100644 Documentation/powerpc/index.rst
 rename Documentation/powerpc/{mpc52xx.txt => mpc52xx.rst} (91%)
 rename Documentation/powerpc/{pci_iov_resource_on_powernv.txt => pci_iov_resource_on_powernv.rst} (97%)
 rename Documentation/powerpc/{pmu-ebb.txt => pmu-ebb.rst} (99%)
 create mode 100644 Documentation/powerpc/ptrace.rst
 delete mode 100644 Documentation/powerpc/ptrace.txt
 rename Documentation/powerpc/{qe_firmware.txt => qe_firmware.rst} (95%)
 rename Documentation/powerpc/{syscall64-abi.txt => syscall64-abi.rst} (82%)
 rename Documentation/powerpc/{transactional_memory.txt => transactional_memory.rst} (93%)

diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
index 83db42092935..e5d450df06b4 100644
--- a/Documentation/PCI/pci-error-recovery.rst
+++ b/Documentation/PCI/pci-error-recovery.rst
@@ -403,7 +403,7 @@ That is, the recovery API only requires that:
 .. note::
 
    Implementation details for the powerpc platform are discussed in
-   the file Documentation/powerpc/eeh-pci-error-recovery.txt
+   the file Documentation/powerpc/eeh-pci-error-recovery.rst
 
    As of this writing, there is a growing list of device drivers with
    patches implementing error recovery. Not all of these patches are in
@@ -422,3 +422,6 @@ That is, the recovery API only requires that:
    - drivers/net/cxgb3
    - drivers/net/s2io.c
    - drivers/net/qlge
+
+The End
+-------
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 70ae148ec980..3fe6170aa41d 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -143,6 +143,7 @@ implementation.
    arm64/index
    ia64/index
    m68k/index
+   powerpc/index
    riscv/index
    s390/index
    sh/index
diff --git a/Documentation/powerpc/bootwrapper.txt b/Documentation/powerpc/bootwrapper.rst
similarity index 93%
rename from Documentation/powerpc/bootwrapper.txt
rename to Documentation/powerpc/bootwrapper.rst
index d60fced5e1cc..a6292afba573 100644
--- a/Documentation/powerpc/bootwrapper.txt
+++ b/Documentation/powerpc/bootwrapper.rst
@@ -1,5 +1,7 @@
+========================
 The PowerPC boot wrapper
-------------------------
+========================
+
 Copyright (C) Secret Lab Technologies Ltd.
 
 PowerPC image targets compresses and wraps the kernel image (vmlinux) with
@@ -21,6 +23,7 @@ it uses the wrapper script (arch/powerpc/boot/wrapper) to generate target
 image.  The details of the build system is discussed in the next section.
 Currently, the following image format targets exist:
 
+   ==================== ========================================================
    cuImage.%:		Backwards compatible uImage for older version of
 			U-Boot (for versions that don't understand the device
 			tree).  This image embeds a device tree blob inside
@@ -29,31 +32,36 @@ Currently, the following image format targets exist:
 			with boot wrapper code that extracts data from the old
 			bd_info structure and loads the data into the device
 			tree before jumping into the kernel.
-			  Because of the series of #ifdefs found in the
+
+			Because of the series of #ifdefs found in the
 			bd_info structure used in the old U-Boot interfaces,
 			cuImages are platform specific.  Each specific
 			U-Boot platform has a different platform init file
 			which populates the embedded device tree with data
 			from the platform specific bd_info file.  The platform
 			specific cuImage platform init code can be found in
-			arch/powerpc/boot/cuboot.*.c.  Selection of the correct
+			`arch/powerpc/boot/cuboot.*.c`. Selection of the correct
 			cuImage init code for a specific board can be found in
 			the wrapper structure.
+
    dtbImage.%:		Similar to zImage, except device tree blob is embedded
 			inside the image instead of provided by firmware.  The
 			output image file can be either an elf file or a flat
 			binary depending on the platform.
-			  dtbImages are used on systems which do not have an
+
+			dtbImages are used on systems which do not have an
 			interface for passing a device tree directly.
 			dtbImages are similar to simpleImages except that
 			dtbImages have platform specific code for extracting
 			data from the board firmware, but simpleImages do not
 			talk to the firmware at all.
-			  PlayStation 3 support uses dtbImage.  So do Embedded
+
+			PlayStation 3 support uses dtbImage.  So do Embedded
 			Planet boards using the PlanetCore firmware.  Board
 			specific initialization code is typically found in a
 			file named arch/powerpc/boot/<platform>.c; but this
 			can be overridden by the wrapper script.
+
    simpleImage.%:	Firmware independent compressed image that does not
 			depend on any particular firmware interface and embeds
 			a device tree blob.  This image is a flat binary that
@@ -61,14 +69,16 @@ Currently, the following image format targets exist:
 			Firmware cannot pass any configuration data to the
 			kernel with this image type and it depends entirely on
 			the embedded device tree for all information.
-			  The simpleImage is useful for booting systems with
+
+			The simpleImage is useful for booting systems with
 			an unknown firmware interface or for booting from
 			a debugger when no firmware is present (such as on
 			the Xilinx Virtex platform).  The only assumption that
 			simpleImage makes is that RAM is correctly initialized
 			and that the MMU is either off or has RAM mapped to
 			base address 0.
-			  simpleImage also supports inserting special platform
+
+			simpleImage also supports inserting special platform
 			specific initialization code to the start of the bootup
 			sequence.  The virtex405 platform uses this feature to
 			ensure that the cache is invalidated before caching
@@ -81,9 +91,11 @@ Currently, the following image format targets exist:
 			named (virtex405-<board>.dts).  Search the wrapper
 			script for 'virtex405' and see the file
 			arch/powerpc/boot/virtex405-head.S for details.
+
    treeImage.%;		Image format for used with OpenBIOS firmware found
 			on some ppc4xx hardware.  This image embeds a device
 			tree blob inside the image.
+
    uImage:		Native image format used by U-Boot.  The uImage target
 			does not add any boot code.  It just wraps a compressed
 			vmlinux in the uImage data structure.  This image
@@ -91,12 +103,14 @@ Currently, the following image format targets exist:
 			a device tree to the kernel at boot.  If using an older
 			version of U-Boot, then you need to use a cuImage
 			instead.
+
    zImage.%:		Image format which does not embed a device tree.
 			Used by OpenFirmware and other firmware interfaces
 			which are able to supply a device tree.  This image
 			expects firmware to provide the device tree at boot.
 			Typically, if you have general purpose PowerPC
 			hardware then you want this image format.
+   ==================== ========================================================
 
 Image types which embed a device tree blob (simpleImage, dtbImage, treeImage,
 and cuImage) all generate the device tree blob from a file in the
diff --git a/Documentation/powerpc/cpu_families.txt b/Documentation/powerpc/cpu_families.rst
similarity index 95%
rename from Documentation/powerpc/cpu_families.txt
rename to Documentation/powerpc/cpu_families.rst
index fc08e22feb1a..1e063c5440c3 100644
--- a/Documentation/powerpc/cpu_families.txt
+++ b/Documentation/powerpc/cpu_families.rst
@@ -1,3 +1,4 @@
+============
 CPU Families
 ============
 
@@ -8,8 +9,8 @@ and are supported by arch/powerpc.
 Book3S (aka sPAPR)
 ------------------
 
- - Hash MMU
- - Mix of 32 & 64 bit
+- Hash MMU
+- Mix of 32 & 64 bit::
 
    +--------------+                 +----------------+
    |  Old POWER   | --------------> | RS64 (threads) |
@@ -108,8 +109,8 @@ Book3S (aka sPAPR)
 IBM BookE
 ---------
 
- - Software loaded TLB.
- - All 32 bit
+- Software loaded TLB.
+- All 32 bit::
 
    +--------------+
    |     401      |
@@ -155,8 +156,8 @@ IBM BookE
 Motorola/Freescale 8xx
 ----------------------
 
- - Software loaded with hardware assist.
- - All 32 bit
+- Software loaded with hardware assist.
+- All 32 bit::
 
    +-------------+
    | MPC8xx Core |
@@ -166,9 +167,9 @@ Motorola/Freescale 8xx
 Freescale BookE
 ---------------
 
- - Software loaded TLB.
- - e6500 adds HW loaded indirect TLB entries.
- - Mix of 32 & 64 bit
+- Software loaded TLB.
+- e6500 adds HW loaded indirect TLB entries.
+- Mix of 32 & 64 bit::
 
    +--------------+
    |     e200     |
@@ -207,8 +208,8 @@ Freescale BookE
 IBM A2 core
 -----------
 
- - Book3E, software loaded TLB + HW loaded indirect TLB entries.
- - 64 bit
+- Book3E, software loaded TLB + HW loaded indirect TLB entries.
+- 64 bit::
 
    +--------------+     +----------------+
    |   A2 core    | --> |      WSP       |
diff --git a/Documentation/powerpc/cpu_features.txt b/Documentation/powerpc/cpu_features.rst
similarity index 97%
rename from Documentation/powerpc/cpu_features.txt
rename to Documentation/powerpc/cpu_features.rst
index ae09df8722c8..b7bcdd2f41bb 100644
--- a/Documentation/powerpc/cpu_features.txt
+++ b/Documentation/powerpc/cpu_features.rst
@@ -1,3 +1,7 @@
+============
+CPU Features
+============
+
 Hollis Blanchard <hollis@austin.ibm.com>
 5 Jun 2002
 
@@ -32,7 +36,7 @@ anyways).
 After detecting the processor type, the kernel patches out sections of code
 that shouldn't be used by writing nop's over it. Using cpufeatures requires
 just 2 macros (found in arch/powerpc/include/asm/cputable.h), as seen in head.S
-transfer_to_handler:
+transfer_to_handler::
 
 	#ifdef CONFIG_ALTIVEC
 	BEGIN_FTR_SECTION
diff --git a/Documentation/powerpc/cxl.txt b/Documentation/powerpc/cxl.rst
similarity index 95%
rename from Documentation/powerpc/cxl.txt
rename to Documentation/powerpc/cxl.rst
index c5e8d5098ed3..920546d81326 100644
--- a/Documentation/powerpc/cxl.txt
+++ b/Documentation/powerpc/cxl.rst
@@ -1,3 +1,4 @@
+====================================
 Coherent Accelerator Interface (CXL)
 ====================================
 
@@ -21,6 +22,8 @@ Introduction
 Hardware overview
 =================
 
+    ::
+
          POWER8/9             FPGA
        +----------+        +---------+
        |          |        |         |
@@ -59,14 +62,16 @@ Hardware overview
     the fault. The context to which this fault is serviced is based on
     who owns that acceleration function.
 
-    POWER8 <-----> PSL Version 8 is compliant to the CAIA Version 1.0.
-    POWER9 <-----> PSL Version 9 is compliant to the CAIA Version 2.0.
+    - POWER8 and PSL Version 8 are compliant to the CAIA Version 1.0.
+    - POWER9 and PSL Version 9 are compliant to the CAIA Version 2.0.
+
     This PSL Version 9 provides new features such as:
+
     * Interaction with the nest MMU on the P9 chip.
     * Native DMA support.
     * Supports sending ASB_Notify messages for host thread wakeup.
     * Supports Atomic operations.
-    * ....
+    * etc.
 
     Cards with a PSL9 won't work on a POWER8 system and cards with a
     PSL8 won't work on a POWER9 system.
@@ -147,7 +152,9 @@ User API
     master devices.
 
     A userspace library libcxl is available here:
+
 	https://github.com/ibm-capi/libcxl
+
     This provides a C interface to this kernel API.
 
 open
@@ -165,7 +172,8 @@ open
     When all available contexts are allocated the open call will fail
     and return -ENOSPC.
 
-    Note: IRQs need to be allocated for each context, which may limit
+    Note:
+	  IRQs need to be allocated for each context, which may limit
           the number of contexts that can be created, and therefore
           how many times the device can be opened. The POWER8 CAPP
           supports 2040 IRQs and 3 are used by the kernel, so 2037 are
@@ -186,7 +194,9 @@ ioctl
         updated as userspace allocates and frees memory. This ioctl
         returns once the AFU context is started.
 
-        Takes a pointer to a struct cxl_ioctl_start_work:
+        Takes a pointer to a struct cxl_ioctl_start_work
+
+            ::
 
                 struct cxl_ioctl_start_work {
                         __u64 flags;
@@ -269,7 +279,7 @@ read
     The buffer passed to read() must be at least 4K bytes.
 
     The result of the read will be a buffer of one or more events,
-    each event is of type struct cxl_event, of varying size.
+    each event is of type struct cxl_event, of varying size::
 
             struct cxl_event {
                     struct cxl_event_header header;
@@ -280,7 +290,9 @@ read
                     };
             };
 
-    The struct cxl_event_header is defined as:
+    The struct cxl_event_header is defined as
+
+        ::
 
             struct cxl_event_header {
                     __u16 type;
@@ -307,7 +319,9 @@ read
             For future extensions and padding.
 
     If the event type is CXL_EVENT_AFU_INTERRUPT then the event
-    structure is defined as:
+    structure is defined as
+
+        ::
 
             struct cxl_event_afu_interrupt {
                     __u16 flags;
@@ -326,7 +340,9 @@ read
             For future extensions and padding.
 
     If the event type is CXL_EVENT_DATA_STORAGE then the event
-    structure is defined as:
+    structure is defined as
+
+        ::
 
             struct cxl_event_data_storage {
                     __u16 flags;
@@ -356,7 +372,9 @@ read
             For future extensions
 
     If the event type is CXL_EVENT_AFU_ERROR then the event structure
-    is defined as:
+    is defined as
+
+        ::
 
             struct cxl_event_afu_error {
                     __u16 flags;
@@ -393,15 +411,15 @@ open
 ioctl
 -----
 
-CXL_IOCTL_DOWNLOAD_IMAGE:
-CXL_IOCTL_VALIDATE_IMAGE:
+CXL_IOCTL_DOWNLOAD_IMAGE / CXL_IOCTL_VALIDATE_IMAGE:
     Starts and controls flashing a new FPGA image. Partial
     reconfiguration is not supported (yet), so the image must contain
     a copy of the PSL and AFU(s). Since an image can be quite large,
     the caller may have to iterate, splitting the image in smaller
     chunks.
 
-    Takes a pointer to a struct cxl_adapter_image:
+    Takes a pointer to a struct cxl_adapter_image::
+
         struct cxl_adapter_image {
             __u64 flags;
             __u64 data;
@@ -442,7 +460,7 @@ Udev rules
     The following udev rules could be used to create a symlink to the
     most logical chardev to use in any programming mode (afuX.Yd for
     dedicated, afuX.Ys for afu directed), since the API is virtually
-    identical for each:
+    identical for each::
 
 	SUBSYSTEM=="cxl", ATTRS{mode}=="dedicated_process", SYMLINK="cxl/%b"
 	SUBSYSTEM=="cxl", ATTRS{mode}=="afu_directed", \
diff --git a/Documentation/powerpc/cxlflash.txt b/Documentation/powerpc/cxlflash.rst
similarity index 98%
rename from Documentation/powerpc/cxlflash.txt
rename to Documentation/powerpc/cxlflash.rst
index a64bdaa0a1cf..cea67931b3b9 100644
--- a/Documentation/powerpc/cxlflash.txt
+++ b/Documentation/powerpc/cxlflash.rst
@@ -1,3 +1,7 @@
+================================
+Coherent Accelerator (CXL) Flash
+================================
+
 Introduction
 ============
 
@@ -28,7 +32,7 @@ Introduction
     responsible for the initialization of the adapter, setting up the
     special path for user space access, and performing error recovery. It
     communicates directly the Flash Accelerator Functional Unit (AFU)
-    as described in Documentation/powerpc/cxl.txt.
+    as described in Documentation/powerpc/cxl.rst.
 
     The cxlflash driver supports two, mutually exclusive, modes of
     operation at the device (LUN) level:
@@ -58,7 +62,7 @@ Overview
 
     The CXL Flash Adapter Driver establishes a master context with the
     AFU. It uses memory mapped I/O (MMIO) for this control and setup. The
-    Adapter Problem Space Memory Map looks like this:
+    Adapter Problem Space Memory Map looks like this::
 
                      +-------------------------------+
                      |    512 * 64 KB User MMIO      |
@@ -375,7 +379,7 @@ CXL Flash Driver Host IOCTLs
     Each host adapter instance that is supported by the cxlflash driver
     has a special character device associated with it to enable a set of
     host management function. These character devices are hosted in a
-    class dedicated for cxlflash and can be accessed via /dev/cxlflash/*.
+    class dedicated for cxlflash and can be accessed via `/dev/cxlflash/*`.
 
     Applications can be written to perform various functions using the
     host ioctl APIs below.
diff --git a/Documentation/powerpc/DAWR-POWER9.txt b/Documentation/powerpc/dawr-power9.rst
similarity index 95%
rename from Documentation/powerpc/DAWR-POWER9.txt
rename to Documentation/powerpc/dawr-power9.rst
index ecdbb076438c..c96ab6befd9c 100644
--- a/Documentation/powerpc/DAWR-POWER9.txt
+++ b/Documentation/powerpc/dawr-power9.rst
@@ -1,10 +1,11 @@
+=====================
 DAWR issues on POWER9
-============================
+=====================
 
 On POWER9 the Data Address Watchpoint Register (DAWR) can cause a checkstop
 if it points to cache inhibited (CI) memory. Currently Linux has no way to
 disinguish CI memory when configuring the DAWR, so (for now) the DAWR is
-disabled by this commit:
+disabled by this commit::
 
     commit 9654153158d3e0684a1bdb76dbababdb7111d5a0
     Author: Michael Neuling <mikey@neuling.org>
@@ -12,7 +13,7 @@ disabled by this commit:
     powerpc: Disable DAWR in the base POWER9 CPU features
 
 Technical Details:
-============================
+==================
 
 DAWR has 6 different ways of being set.
 1) ptrace
@@ -37,7 +38,7 @@ DAWR on the migration.
 For xmon, the 'bd' command will return an error on P9.
 
 Consequences for users
-============================
+======================
 
 For GDB watchpoints (ie 'watch' command) on POWER9 bare metal , GDB
 will accept the command. Unfortunately since there is no hardware
@@ -57,8 +58,8 @@ trapped in GDB. The watchpoint is remembered, so if the guest is
 migrated back to the POWER8 host, it will start working again.
 
 Force enabling the DAWR
-=============================
-Kernels (since ~v5.2) have an option to force enable the DAWR via:
+=======================
+Kernels (since ~v5.2) have an option to force enable the DAWR via::
 
   echo Y > /sys/kernel/debug/powerpc/dawr_enable_dangerous
 
@@ -86,5 +87,7 @@ dawr_enable_dangerous file will fail if the hypervisor doesn't support
 writing the DAWR.
 
 To double check the DAWR is working, run this kernel selftest:
+
   tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
+
 Any errors/failures/skips mean something is wrong.
diff --git a/Documentation/powerpc/dscr.txt b/Documentation/powerpc/dscr.rst
similarity index 91%
rename from Documentation/powerpc/dscr.txt
rename to Documentation/powerpc/dscr.rst
index ece300c64f76..2ab99006014c 100644
--- a/Documentation/powerpc/dscr.txt
+++ b/Documentation/powerpc/dscr.rst
@@ -1,5 +1,6 @@
-			DSCR (Data Stream Control Register)
-		================================================
+===================================
+DSCR (Data Stream Control Register)
+===================================
 
 DSCR register in powerpc allows user to have some control of prefetch of data
 stream in the processor. Please refer to the ISA documents or related manual
@@ -10,14 +11,17 @@ user interface.
 
 (A) Data Structures:
 
-	(1) thread_struct:
+	(1) thread_struct::
+
 		dscr		/* Thread DSCR value */
 		dscr_inherit	/* Thread has changed default DSCR */
 
-	(2) PACA:
+	(2) PACA::
+
 		dscr_default	/* per-CPU DSCR default value */
 
-	(3) sysfs.c:
+	(3) sysfs.c::
+
 		dscr_default	/* System DSCR default value */
 
 (B) Scheduler Changes:
@@ -35,8 +39,8 @@ user interface.
 
 (C) SYSFS Interface:
 
-	Global DSCR default:		/sys/devices/system/cpu/dscr_default
-	CPU specific DSCR default:	/sys/devices/system/cpu/cpuN/dscr
+	- Global DSCR default:		/sys/devices/system/cpu/dscr_default
+	- CPU specific DSCR default:	/sys/devices/system/cpu/cpuN/dscr
 
 	Changing the global DSCR default in the sysfs will change all the CPU
 	specific DSCR defaults immediately in their PACA structures. Again if
diff --git a/Documentation/powerpc/eeh-pci-error-recovery.txt b/Documentation/powerpc/eeh-pci-error-recovery.rst
similarity index 82%
rename from Documentation/powerpc/eeh-pci-error-recovery.txt
rename to Documentation/powerpc/eeh-pci-error-recovery.rst
index 678189280bb4..438a87ebc095 100644
--- a/Documentation/powerpc/eeh-pci-error-recovery.txt
+++ b/Documentation/powerpc/eeh-pci-error-recovery.rst
@@ -1,10 +1,10 @@
+==========================
+PCI Bus EEH Error Recovery
+==========================
 
+Linas Vepstas <linas@austin.ibm.com>
 
-                      PCI Bus EEH Error Recovery
-                      --------------------------
-                           Linas Vepstas
-                       <linas@austin.ibm.com>
-                          12 January 2005
+12 January 2005
 
 
 Overview:
@@ -143,17 +143,17 @@ seen in /proc/ppc64/eeh (subject to change).  Normally, almost
 all of these occur during boot, when the PCI bus is scanned, where
 a large number of 0xff reads are part of the bus scan procedure.
 
-If a frozen slot is detected, code in 
-arch/powerpc/platforms/pseries/eeh.c will print a stack trace to 
-syslog (/var/log/messages).  This stack trace has proven to be very 
-useful to device-driver authors for finding out at what point the EEH 
-error was detected, as the error itself usually occurs slightly 
+If a frozen slot is detected, code in
+arch/powerpc/platforms/pseries/eeh.c will print a stack trace to
+syslog (/var/log/messages).  This stack trace has proven to be very
+useful to device-driver authors for finding out at what point the EEH
+error was detected, as the error itself usually occurs slightly
 beforehand.
 
 Next, it uses the Linux kernel notifier chain/work queue mechanism to
 allow any interested parties to find out about the failure.  Device
 drivers, or other parts of the kernel, can use
-eeh_register_notifier(struct notifier_block *) to find out about EEH
+`eeh_register_notifier(struct notifier_block *)` to find out about EEH
 events.  The event will include a pointer to the pci device, the
 device node and some state info.  Receivers of the event can "do as
 they wish"; the default handler will be described further in this
@@ -162,10 +162,13 @@ section.
 To assist in the recovery of the device, eeh.c exports the
 following functions:
 
-rtas_set_slot_reset() -- assert the  PCI #RST line for 1/8th of a second
-rtas_configure_bridge() -- ask firmware to configure any PCI bridges
+rtas_set_slot_reset()
+   assert the  PCI #RST line for 1/8th of a second
+rtas_configure_bridge()
+   ask firmware to configure any PCI bridges
    located topologically under the pci slot.
-eeh_save_bars() and eeh_restore_bars(): save and restore the PCI
+eeh_save_bars() and eeh_restore_bars():
+   save and restore the PCI
    config-space info for a device and any devices under it.
 
 
@@ -191,7 +194,7 @@ events get delivered to user-space scripts.
 
 Following is an example sequence of events that cause a device driver
 close function to be called during the first phase of an EEH reset.
-The following sequence is an example of the pcnet32 device driver.
+The following sequence is an example of the pcnet32 device driver::
 
     rpa_php_unconfig_pci_adapter (struct slot *)  // in rpaphp_pci.c
     {
@@ -241,53 +244,54 @@ The following sequence is an example of the pcnet32 device driver.
      }}}}}}
 
 
-    in drivers/pci/pci_driver.c,
-    struct device_driver->remove() is just pci_device_remove()
-    which calls struct pci_driver->remove() which is pcnet32_remove_one()
-    which calls unregister_netdev()  (in net/core/dev.c)
-    which calls dev_close()  (in net/core/dev.c)
-    which calls dev->stop() which is pcnet32_close()
-    which then does the appropriate shutdown.
+in drivers/pci/pci_driver.c,
+struct device_driver->remove() is just pci_device_remove()
+which calls struct pci_driver->remove() which is pcnet32_remove_one()
+which calls unregister_netdev()  (in net/core/dev.c)
+which calls dev_close()  (in net/core/dev.c)
+which calls dev->stop() which is pcnet32_close()
+which then does the appropriate shutdown.
 
 ---
+
 Following is the analogous stack trace for events sent to user-space
-when the pci device is unconfigured.
+when the pci device is unconfigured::
 
-rpa_php_unconfig_pci_adapter() {             // in rpaphp_pci.c
-  calls
-  pci_remove_bus_device (struct pci_dev *) { // in /drivers/pci/remove.c
+  rpa_php_unconfig_pci_adapter() {             // in rpaphp_pci.c
     calls
-    pci_destroy_dev (struct pci_dev *) {
+    pci_remove_bus_device (struct pci_dev *) { // in /drivers/pci/remove.c
       calls
-      device_unregister (&dev->dev) {        // in /drivers/base/core.c
+      pci_destroy_dev (struct pci_dev *) {
         calls
-        device_del(struct device * dev) {    // in /drivers/base/core.c
+        device_unregister (&dev->dev) {        // in /drivers/base/core.c
           calls
-          kobject_del() {                    //in /libs/kobject.c
+          device_del(struct device * dev) {    // in /drivers/base/core.c
             calls
-            kobject_uevent() {               // in /libs/kobject.c
+            kobject_del() {                    //in /libs/kobject.c
               calls
-              kset_uevent() {                // in /lib/kobject.c
+              kobject_uevent() {               // in /libs/kobject.c
                 calls
-                kset->uevent_ops->uevent()   // which is really just
-                a call to
-                dev_uevent() {               // in /drivers/base/core.c
+                kset_uevent() {                // in /lib/kobject.c
                   calls
-                  dev->bus->uevent() which is really just a call to
-                  pci_uevent () {            // in drivers/pci/hotplug.c
-                    which prints device name, etc....
+                  kset->uevent_ops->uevent()   // which is really just
+                  a call to
+                  dev_uevent() {               // in /drivers/base/core.c
+                    calls
+                    dev->bus->uevent() which is really just a call to
+                    pci_uevent () {            // in drivers/pci/hotplug.c
+                      which prints device name, etc....
+                   }
                  }
-               }
-               then kobject_uevent() sends a netlink uevent to userspace
-               --> userspace uevent
-               (during early boot, nobody listens to netlink events and
-               kobject_uevent() executes uevent_helper[], which runs the
-               event process /sbin/hotplug)
+                 then kobject_uevent() sends a netlink uevent to userspace
+                 --> userspace uevent
+                 (during early boot, nobody listens to netlink events and
+                 kobject_uevent() executes uevent_helper[], which runs the
+                 event process /sbin/hotplug)
+             }
            }
-         }
-         kobject_del() then calls sysfs_remove_dir(), which would
-         trigger any user-space daemon that was watching /sysfs,
-         and notice the delete event.
+           kobject_del() then calls sysfs_remove_dir(), which would
+           trigger any user-space daemon that was watching /sysfs,
+           and notice the delete event.
 
 
 Pro's and Con's of the Current Design
@@ -299,12 +303,12 @@ individual device drivers, so that the current design throws a wide net.
 The biggest negative of the design is that it potentially disturbs
 network daemons and file systems that didn't need to be disturbed.
 
--- A minor complaint is that resetting the network card causes
+-  A minor complaint is that resetting the network card causes
    user-space back-to-back ifdown/ifup burps that potentially disturb
    network daemons, that didn't need to even know that the pci
    card was being rebooted.
 
--- A more serious concern is that the same reset, for SCSI devices,
+-  A more serious concern is that the same reset, for SCSI devices,
    causes havoc to mounted file systems.  Scripts cannot post-facto
    unmount a file system without flushing pending buffers, but this
    is impossible, because I/O has already been stopped.  Thus,
@@ -322,7 +326,7 @@ network daemons and file systems that didn't need to be disturbed.
    from the block layer.  It would be very natural to add an EEH
    reset into this chain of events.
 
--- If a SCSI error occurs for the root device, all is lost unless
+-  If a SCSI error occurs for the root device, all is lost unless
    the sysadmin had the foresight to run /bin, /sbin, /etc, /var
    and so on, out of ramdisk/tmpfs.
 
@@ -330,5 +334,3 @@ network daemons and file systems that didn't need to be disturbed.
 Conclusions
 -----------
 There's forward progress ...
-
-
diff --git a/Documentation/powerpc/firmware-assisted-dump.txt b/Documentation/powerpc/firmware-assisted-dump.rst
similarity index 80%
rename from Documentation/powerpc/firmware-assisted-dump.txt
rename to Documentation/powerpc/firmware-assisted-dump.rst
index 10e7f4d16c14..9ca12830a48e 100644
--- a/Documentation/powerpc/firmware-assisted-dump.txt
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -1,7 +1,8 @@
+======================
+Firmware-Assisted Dump
+======================
 
-                   Firmware-Assisted Dump
-                   ------------------------
-                       July 2011
+July 2011
 
 The goal of firmware-assisted dump is to enable the dump of
 a crashed system, and to do so from a fully-reset system, and
@@ -27,11 +28,11 @@ in production use.
 Comparing with kdump or other strategies, firmware-assisted
 dump offers several strong, practical advantages:
 
--- Unlike kdump, the system has been reset, and loaded
+-  Unlike kdump, the system has been reset, and loaded
    with a fresh copy of the kernel.  In particular,
    PCI and I/O devices have been reinitialized and are
    in a clean, consistent state.
--- Once the dump is copied out, the memory that held the dump
+-  Once the dump is copied out, the memory that held the dump
    is immediately available to the running kernel. And therefore,
    unlike kdump, fadump doesn't need a 2nd reboot to get back
    the system to the production configuration.
@@ -40,17 +41,18 @@ The above can only be accomplished by coordination with,
 and assistance from the Power firmware. The procedure is
 as follows:
 
--- The first kernel registers the sections of memory with the
+-  The first kernel registers the sections of memory with the
    Power firmware for dump preservation during OS initialization.
    These registered sections of memory are reserved by the first
    kernel during early boot.
 
--- When a system crashes, the Power firmware will save
+-  When a system crashes, the Power firmware will save
    the low memory (boot memory of size larger of 5% of system RAM
    or 256MB) of RAM to the previous registered region. It will
    also save system registers, and hardware PTE's.
 
-   NOTE: The term 'boot memory' means size of the low memory chunk
+   NOTE:
+         The term 'boot memory' means size of the low memory chunk
          that is required for a kernel to boot successfully when
          booted with restricted memory. By default, the boot memory
          size will be the larger of 5% of system RAM or 256MB.
@@ -64,12 +66,12 @@ as follows:
          as fadump uses a predefined offset to reserve memory
          for boot memory dump preservation in case of a crash.
 
--- After the low memory (boot memory) area has been saved, the
+-  After the low memory (boot memory) area has been saved, the
    firmware will reset PCI and other hardware state.  It will
    *not* clear the RAM. It will then launch the bootloader, as
    normal.
 
--- The freshly booted kernel will notice that there is a new
+-  The freshly booted kernel will notice that there is a new
    node (ibm,dump-kernel) in the device tree, indicating that
    there is crash data available from a previous boot. During
    the early boot OS will reserve rest of the memory above
@@ -77,17 +79,18 @@ as follows:
    size. This will make sure that the second kernel will not
    touch any of the dump memory area.
 
--- User-space tools will read /proc/vmcore to obtain the contents
+-  User-space tools will read /proc/vmcore to obtain the contents
    of memory, which holds the previous crashed kernel dump in ELF
    format. The userspace tools may copy this info to disk, or
    network, nas, san, iscsi, etc. as desired.
 
--- Once the userspace tool is done saving dump, it will echo
+-  Once the userspace tool is done saving dump, it will echo
    '1' to /sys/kernel/fadump_release_mem to release the reserved
    memory back to general use, except the memory required for
    next firmware-assisted dump registration.
 
-   e.g.
+   e.g.::
+
      # echo 1 > /sys/kernel/fadump_release_mem
 
 Please note that the firmware-assisted dump feature
@@ -95,7 +98,7 @@ is only available on Power6 and above systems with recent
 firmware versions.
 
 Implementation details:
-----------------------
+-----------------------
 
 During boot, a check is made to see if firmware supports
 this feature on that particular machine. If it does, then
@@ -121,7 +124,7 @@ Allocator (CMA) for memory reservation if CMA is configured for kernel.
 With CMA reservation this memory will be available for applications to
 use it, while kernel is prevented from using it. With this fadump will
 still be able to capture all of the kernel memory and most of the user
-space memory except the user pages that were present in CMA region.
+space memory except the user pages that were present in CMA region::
 
   o Memory Reservation during first kernel
 
@@ -166,7 +169,7 @@ The tools to examine the dump will be same as the ones
 used for kdump.
 
 How to enable firmware-assisted dump (fadump):
--------------------------------------
+----------------------------------------------
 
 1. Set config option CONFIG_FA_DUMP=y and build kernel.
 2. Boot into linux kernel with 'fadump=on' kernel cmdline option.
@@ -177,19 +180,20 @@ How to enable firmware-assisted dump (fadump):
    to specify size of the memory to reserve for boot memory dump
    preservation.
 
-NOTE: 1. 'fadump_reserve_mem=' parameter has been deprecated. Instead
-         use 'crashkernel=' to specify size of the memory to reserve
-         for boot memory dump preservation.
-      2. If firmware-assisted dump fails to reserve memory then it
-         will fallback to existing kdump mechanism if 'crashkernel='
-         option is set at kernel cmdline.
-      3. if user wants to capture all of user space memory and ok with
-         reserved memory not available to production system, then
-         'fadump=nocma' kernel parameter can be used to fallback to
-         old behaviour.
+NOTE:
+     1. 'fadump_reserve_mem=' parameter has been deprecated. Instead
+        use 'crashkernel=' to specify size of the memory to reserve
+        for boot memory dump preservation.
+     2. If firmware-assisted dump fails to reserve memory then it
+        will fallback to existing kdump mechanism if 'crashkernel='
+        option is set at kernel cmdline.
+     3. if user wants to capture all of user space memory and ok with
+        reserved memory not available to production system, then
+        'fadump=nocma' kernel parameter can be used to fallback to
+        old behaviour.
 
 Sysfs/debugfs files:
-------------
+--------------------
 
 Firmware-assisted dump feature uses sysfs file system to hold
 the control files and debugfs file to display memory reserved region.
@@ -197,20 +201,20 @@ the control files and debugfs file to display memory reserved region.
 Here is the list of files under kernel sysfs:
 
  /sys/kernel/fadump_enabled
-
     This is used to display the fadump status.
-    0 = fadump is disabled
-    1 = fadump is enabled
+
+    - 0 = fadump is disabled
+    - 1 = fadump is enabled
 
     This interface can be used by kdump init scripts to identify if
     fadump is enabled in the kernel and act accordingly.
 
  /sys/kernel/fadump_registered
-
     This is used to display the fadump registration status as well
     as to control (start/stop) the fadump registration.
-    0 = fadump is not registered.
-    1 = fadump is registered and ready to handle system crash.
+
+    - 0 = fadump is not registered.
+    - 1 = fadump is registered and ready to handle system crash.
 
     To register fadump echo 1 > /sys/kernel/fadump_registered and
     echo 0 > /sys/kernel/fadump_registered for un-register and stop the
@@ -219,13 +223,12 @@ Here is the list of files under kernel sysfs:
     easily integrated with kdump service start/stop.
 
  /sys/kernel/fadump_release_mem
-
     This file is available only when fadump is active during
     second kernel. This is used to release the reserved memory
     region that are held for saving crash dump. To release the
-    reserved memory echo 1 to it:
+    reserved memory echo 1 to it::
 
-    echo 1  > /sys/kernel/fadump_release_mem
+	echo 1  > /sys/kernel/fadump_release_mem
 
     After echo 1, the content of the /sys/kernel/debug/powerpc/fadump_region
     file will change to reflect the new memory reservations.
@@ -238,38 +241,39 @@ Here is the list of files under powerpc debugfs:
 (Assuming debugfs is mounted on /sys/kernel/debug directory.)
 
  /sys/kernel/debug/powerpc/fadump_region
-
     This file shows the reserved memory regions if fadump is
     enabled otherwise this file is empty. The output format
-    is:
-    <region>: [<start>-<end>] <reserved-size> bytes, Dumped: <dump-size>
+    is::
+
+      <region>: [<start>-<end>] <reserved-size> bytes, Dumped: <dump-size>
 
     e.g.
-    Contents when fadump is registered during first kernel
+    Contents when fadump is registered during first kernel::
 
-    # cat /sys/kernel/debug/powerpc/fadump_region
-    CPU : [0x0000006ffb0000-0x0000006fff001f] 0x40020 bytes, Dumped: 0x0
-    HPTE: [0x0000006fff0020-0x0000006fff101f] 0x1000 bytes, Dumped: 0x0
-    DUMP: [0x0000006fff1020-0x0000007fff101f] 0x10000000 bytes, Dumped: 0x0
+      # cat /sys/kernel/debug/powerpc/fadump_region
+      CPU : [0x0000006ffb0000-0x0000006fff001f] 0x40020 bytes, Dumped: 0x0
+      HPTE: [0x0000006fff0020-0x0000006fff101f] 0x1000 bytes, Dumped: 0x0
+      DUMP: [0x0000006fff1020-0x0000007fff101f] 0x10000000 bytes, Dumped: 0x0
 
-    Contents when fadump is active during second kernel
+    Contents when fadump is active during second kernel::
 
-    # cat /sys/kernel/debug/powerpc/fadump_region
-    CPU : [0x0000006ffb0000-0x0000006fff001f] 0x40020 bytes, Dumped: 0x40020
-    HPTE: [0x0000006fff0020-0x0000006fff101f] 0x1000 bytes, Dumped: 0x1000
-    DUMP: [0x0000006fff1020-0x0000007fff101f] 0x10000000 bytes, Dumped: 0x10000000
-        : [0x00000010000000-0x0000006ffaffff] 0x5ffb0000 bytes, Dumped: 0x5ffb0000
+      # cat /sys/kernel/debug/powerpc/fadump_region
+      CPU : [0x0000006ffb0000-0x0000006fff001f] 0x40020 bytes, Dumped: 0x40020
+      HPTE: [0x0000006fff0020-0x0000006fff101f] 0x1000 bytes, Dumped: 0x1000
+      DUMP: [0x0000006fff1020-0x0000007fff101f] 0x10000000 bytes, Dumped: 0x10000000
+          : [0x00000010000000-0x0000006ffaffff] 0x5ffb0000 bytes, Dumped: 0x5ffb0000
 
-NOTE: Please refer to Documentation/filesystems/debugfs.txt on
+NOTE:
+      Please refer to Documentation/filesystems/debugfs.txt on
       how to mount the debugfs filesystem.
 
 
 TODO:
 -----
- o Need to come up with the better approach to find out more
+ - Need to come up with the better approach to find out more
    accurate boot memory size that is required for a kernel to
    boot successfully when booted with restricted memory.
- o The fadump implementation introduces a fadump crash info structure
+ - The fadump implementation introduces a fadump crash info structure
    in the scratch area before the ELF core header. The idea of introducing
    this structure is to pass some important crash info data to the second
    kernel which will help second kernel to populate ELF core header with
@@ -277,7 +281,9 @@ TODO:
    design implementation does not address a possibility of introducing
    additional fields (in future) to this structure without affecting
    compatibility. Need to come up with the better approach to address this.
+
    The possible approaches are:
+
 	1. Introduce version field for version tracking, bump up the version
 	whenever a new field is added to the structure in future. The version
 	field can be used to find out what fields are valid for the current
@@ -285,8 +291,11 @@ TODO:
 	2. Reserve the area of predefined size (say PAGE_SIZE) for this
 	structure and have unused area as reserved (initialized to zero)
 	for future field additions.
+
    The advantage of approach 1 over 2 is we don't need to reserve extra space.
----
+
 Author: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
+
 This document is based on the original documentation written for phyp
+
 assisted dump by Linas Vepstas and Manish Ahuja.
diff --git a/Documentation/powerpc/hvcs.txt b/Documentation/powerpc/hvcs.rst
similarity index 91%
rename from Documentation/powerpc/hvcs.txt
rename to Documentation/powerpc/hvcs.rst
index a730ca5a07f8..6808acde672f 100644
--- a/Documentation/powerpc/hvcs.txt
+++ b/Documentation/powerpc/hvcs.rst
@@ -1,19 +1,22 @@
-===========================================================================
-				   HVCS
-	IBM "Hypervisor Virtual Console Server" Installation Guide
-			  for Linux Kernel 2.6.4+
-		    Copyright (C) 2004 IBM Corporation
+===============================================================
+HVCS IBM "Hypervisor Virtual Console Server" Installation Guide
+===============================================================
 
-===========================================================================
-NOTE:Eight space tabs are the optimum editor setting for reading this file.
-===========================================================================
+for Linux Kernel 2.6.4+
 
-	       Author(s) :  Ryan S. Arnold <rsa@us.ibm.com>
-		       Date Created: March, 02, 2004
-		       Last Changed: August, 24, 2004
+Copyright (C) 2004 IBM Corporation
 
----------------------------------------------------------------------------
-Table of contents:
+.. ===========================================================================
+.. NOTE:Eight space tabs are the optimum editor setting for reading this file.
+.. ===========================================================================
+
+
+Author(s): Ryan S. Arnold <rsa@us.ibm.com>
+
+Date Created: March, 02, 2004
+Last Changed: August, 24, 2004
+
+.. Table of contents:
 
 	1.  Driver Introduction:
 	2.  System Requirements
@@ -27,8 +30,8 @@ Table of contents:
 	8.  Questions & Answers:
 	9.  Reporting Bugs:
 
----------------------------------------------------------------------------
 1. Driver Introduction:
+=======================
 
 This is the device driver for the IBM Hypervisor Virtual Console Server,
 "hvcs".  The IBM hvcs provides a tty driver interface to allow Linux user
@@ -38,8 +41,8 @@ ppc64 system.  Physical hardware consoles per partition are not practical
 on this hardware so system consoles are accessed by this driver using
 firmware interfaces to virtual terminal devices.
 
----------------------------------------------------------------------------
 2. System Requirements:
+=======================
 
 This device driver was written using 2.6.4 Linux kernel APIs and will only
 build and run on kernels of this version or later.
@@ -52,8 +55,8 @@ Sysfs must be mounted on the system so that the user can determine which
 major and minor numbers are associated with each vty-server.  Directions
 for sysfs mounting are outside the scope of this document.
 
----------------------------------------------------------------------------
 3. Build Options:
+=================
 
 The hvcs driver registers itself as a tty driver.  The tty layer
 dynamically allocates a block of major and minor numbers in a quantity
@@ -65,11 +68,11 @@ If the default number of device entries is adequate then this driver can be
 built into the kernel.  If not, the default can be over-ridden by inserting
 the driver as a module with insmod parameters.
 
----------------------------------------------------------------------------
 3.1 Built-in:
+-------------
 
 The following menuconfig example demonstrates selecting to build this
-driver into the kernel.
+driver into the kernel::
 
 	Device Drivers  --->
 		Character devices  --->
@@ -77,11 +80,11 @@ driver into the kernel.
 
 Begin the kernel make process.
 
----------------------------------------------------------------------------
 3.2 Module:
+-----------
 
 The following menuconfig example demonstrates selecting to build this
-driver as a kernel module.
+driver as a kernel module::
 
 	Device Drivers  --->
 		Character devices  --->
@@ -89,11 +92,11 @@ driver as a kernel module.
 
 The make process will build the following kernel modules:
 
-	hvcs.ko
-	hvcserver.ko
+	- hvcs.ko
+	- hvcserver.ko
 
 To insert the module with the default allocation execute the following
-commands in the order they appear:
+commands in the order they appear::
 
 	insmod hvcserver.ko
 	insmod hvcs.ko
@@ -103,7 +106,7 @@ be inserted first, otherwise the hvcs module will not find some of the
 symbols it expects.
 
 To override the default use an insmod parameter as follows (requesting 4
-tty devices as an example):
+tty devices as an example)::
 
 	insmod hvcs.ko hvcs_parm_num_devs=4
 
@@ -115,31 +118,31 @@ source file before building.
 NOTE: The length of time it takes to insmod the driver seems to be related
 to the number of tty interfaces the registering driver requests.
 
-In order to remove the driver module execute the following command:
+In order to remove the driver module execute the following command::
 
 	rmmod hvcs.ko
 
 The recommended method for installing hvcs as a module is to use depmod to
 build a current modules.dep file in /lib/modules/`uname -r` and then
-execute:
+execute::
 
-modprobe hvcs hvcs_parm_num_devs=4
+	modprobe hvcs hvcs_parm_num_devs=4
 
 The modules.dep file indicates that hvcserver.ko needs to be inserted
 before hvcs.ko and modprobe uses this file to smartly insert the modules in
 the proper order.
 
 The following modprobe command is used to remove hvcs and hvcserver in the
-proper order:
+proper order::
 
-modprobe -r hvcs
+	modprobe -r hvcs
 
----------------------------------------------------------------------------
 4. Installation:
+================
 
 The tty layer creates sysfs entries which contain the major and minor
 numbers allocated for the hvcs driver.  The following snippet of "tree"
-output of the sysfs directory shows where these numbers are presented:
+output of the sysfs directory shows where these numbers are presented::
 
 	sys/
 	|-- *other sysfs base dirs*
@@ -164,7 +167,7 @@ output of the sysfs directory shows where these numbers are presented:
 	|-- *other sysfs base dirs*
 
 For the above examples the following output is a result of cat'ing the
-"dev" entry in the hvcs directory:
+"dev" entry in the hvcs directory::
 
 	Pow5:/sys/class/tty/hvcs0/ # cat dev
 	254:0
@@ -184,7 +187,7 @@ systems running hvcs will already have the device entries created or udev
 will do it automatically.
 
 Given the example output above, to manually create a /dev/hvcs* node entry
-mknod can be used as follows:
+mknod can be used as follows::
 
 	mknod /dev/hvcs0 c 254 0
 	mknod /dev/hvcs1 c 254 1
@@ -195,15 +198,15 @@ Using mknod to manually create the device entries makes these device nodes
 persistent.  Once created they will exist prior to the driver insmod.
 
 Attempting to connect an application to /dev/hvcs* prior to insertion of
-the hvcs module will result in an error message similar to the following:
+the hvcs module will result in an error message similar to the following::
 
 	"/dev/hvcs*: No such device".
 
 NOTE: Just because there is a device node present doesn't mean that there
 is a vty-server device configured for that node.
 
----------------------------------------------------------------------------
 5. Connection
+=============
 
 Since this driver controls devices that provide a tty interface a user can
 interact with the device node entries using any standard tty-interactive
@@ -249,7 +252,7 @@ vty-server adapter is associated with which /dev/hvcs* node a special sysfs
 attribute has been added to each vty-server sysfs entry.  This entry is
 called "index" and showing it reveals an integer that refers to the
 /dev/hvcs* entry to use to connect to that device.  For instance cating the
-index attribute of vty-server adapter 30000004 shows the following.
+index attribute of vty-server adapter 30000004 shows the following::
 
 	Pow5:/sys/bus/vio/drivers/hvcs/30000004 # cat index
 	2
@@ -262,8 +265,8 @@ system the /dev/hvcs* entry that interacts with a particular vty-server
 adapter is not guaranteed to remain the same across system reboots.  Look
 in the Q & A section for more on this issue.
 
----------------------------------------------------------------------------
 6. Disconnection
+================
 
 As a security feature to prevent the delivery of stale data to an
 unintended target the Power5 system firmware disables the fetching of data
@@ -305,7 +308,7 @@ connection between the vty-server and target vty ONLY if the vterm_state
 previously read '1'.  The write directive is ignored if the vterm_state
 read '0' or if any value other than '0' was written to the vterm_state
 attribute.  The following example will show the method used for verifying
-the vty-server connection status and disconnecting a vty-server connection.
+the vty-server connection status and disconnecting a vty-server connection::
 
 	Pow5:/sys/bus/vio/drivers/hvcs/30000004 # cat vterm_state
 	1
@@ -318,12 +321,12 @@ the vty-server connection status and disconnecting a vty-server connection.
 All vty-server connections are automatically terminated when the device is
 hotplug removed and when the module is removed.
 
----------------------------------------------------------------------------
 7. Configuration
+================
 
 Each vty-server has a sysfs entry in the /sys/devices/vio directory, which
 is symlinked in several other sysfs tree directories, notably under the
-hvcs driver entry, which looks like the following example:
+hvcs driver entry, which looks like the following example::
 
 	Pow5:/sys/bus/vio/drivers/hvcs # ls
 	.  ..  30000003  30000004  rescan
@@ -344,7 +347,7 @@ completed or was never executed.
 
 Vty-server entries in this directory are a 32 bit partition unique unit
 address that is created by firmware.  An example vty-server sysfs entry
-looks like the following:
+looks like the following::
 
 	Pow5:/sys/bus/vio/drivers/hvcs/30000004 # ls
 	.   current_vty   devspec       name          partner_vtys
@@ -352,21 +355,21 @@ looks like the following:
 
 Each entry is provided, by default with a "name" attribute.  Reading the
 "name" attribute will reveal the device type as shown in the following
-example:
+example::
 
 	Pow5:/sys/bus/vio/drivers/hvcs/30000003 # cat name
 	vty-server
 
 Each entry is also provided, by default, with a "devspec" attribute which
 reveals the full device specification when read, as shown in the following
-example:
+example::
 
 	Pow5:/sys/bus/vio/drivers/hvcs/30000004 # cat devspec
 	/vdevice/vty-server@30000004
 
 Each vty-server sysfs dir is provided with two read-only attributes that
 provide lists of easily parsed partner vty data: "partner_vtys" and
-"partner_clcs".
+"partner_clcs"::
 
 	Pow5:/sys/bus/vio/drivers/hvcs/30000004 # cat partner_vtys
 	30000000
@@ -396,7 +399,7 @@ A vty-server can only be connected to a single vty at a time.  The entry,
 read.
 
 The current_vty can be changed by writing a valid partner clc to the entry
-as in the following example:
+as in the following example::
 
 	Pow5:/sys/bus/vio/drivers/hvcs/30000004 # echo U5112.428.10304
 	8A-V4-C0 > current_vty
@@ -408,9 +411,9 @@ currently open connection is freed.
 Information on the "vterm_state" attribute was covered earlier on the
 chapter entitled "disconnection".
 
----------------------------------------------------------------------------
 8. Questions & Answers:
-===========================================================================
+=======================
+
 Q: What are the security concerns involving hvcs?
 
 A: There are three main security concerns:
@@ -429,6 +432,7 @@ A: There are three main security concerns:
 	partition) will experience the previously logged in session.
 
 ---------------------------------------------------------------------------
+
 Q: How do I multiplex a console that I grab through hvcs so that other
 people can see it:
 
@@ -440,6 +444,7 @@ term type "screen" to others.  This means that curses based programs may
 not display properly in screen sessions.
 
 ---------------------------------------------------------------------------
+
 Q: Why are the colors all messed up?
 Q: Why are the control characters acting strange or not working?
 Q: Why is the console output all strange and unintelligible?
@@ -455,6 +460,7 @@ disconnect from the console.  This will ensure that the next user gets
 their own TERM type set when they login.
 
 ---------------------------------------------------------------------------
+
 Q: When I try to CONNECT kermit to an hvcs device I get:
 "Sorry, can't open connection: /dev/hvcs*"What is happening?
 
@@ -490,6 +496,7 @@ A: There is not a corresponding vty-server device that maps to an existing
 /dev/hvcs* entry.
 
 ---------------------------------------------------------------------------
+
 Q: When I try to CONNECT kermit to an hvcs device I get:
 "Sorry, write access to UUCP lockfile directory denied."
 
@@ -497,6 +504,7 @@ A: The /dev/hvcs* entry you have specified doesn't exist where you said it
 does?  Maybe you haven't inserted the module (on systems with udev).
 
 ---------------------------------------------------------------------------
+
 Q: If I already have one Linux partition installed can I use hvcs on said
 partition to provide the console for the install of a second Linux
 partition?
@@ -505,6 +513,7 @@ A: Yes granted that your are connected to the /dev/hvcs* device using
 kermit or cu or some other program that doesn't provide terminal emulation.
 
 ---------------------------------------------------------------------------
+
 Q: Can I connect to more than one partition's console at a time using this
 driver?
 
@@ -512,6 +521,7 @@ A: Yes.  Of course this means that there must be more than one vty-server
 configured for this partition and each must point to a disconnected vty.
 
 ---------------------------------------------------------------------------
+
 Q: Does the hvcs driver support dynamic (hotplug) addition of devices?
 
 A: Yes, if you have dlpar and hotplug enabled for your system and it has
@@ -519,6 +529,7 @@ been built into the kernel the hvcs drivers is configured to dynamically
 handle additions of new devices and removals of unused devices.
 
 ---------------------------------------------------------------------------
+
 Q: For some reason /dev/hvcs* doesn't map to the same vty-server adapter
 after a reboot.  What happened?
 
@@ -533,6 +544,7 @@ on how to determine which vty-server goes with which /dev/hvcs* node.
 Hint; look at the sysfs "index" attribute for the vty-server.
 
 ---------------------------------------------------------------------------
+
 Q: Can I use /dev/hvcs* as a conduit to another partition and use a tty
 device on that partition as the other end of the pipe?
 
@@ -554,7 +566,9 @@ read or write to /dev/hvcs*.  Now you have a tty conduit between two
 partitions.
 
 ---------------------------------------------------------------------------
+
 9. Reporting Bugs:
+==================
 
 The proper channel for reporting bugs is either through the Linux OS
 distribution company that provided your OS or by posting issues to the
diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
new file mode 100644
index 000000000000..549b1cdd77ae
--- /dev/null
+++ b/Documentation/powerpc/index.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======
+powerpc
+=======
+
+.. toctree::
+    :maxdepth: 1
+
+    bootwrapper
+    cpu_families
+    cpu_features
+    cxl
+    cxlflash
+    dawr-power9
+    dscr
+    eeh-pci-error-recovery
+    firmware-assisted-dump
+    hvcs
+    isa-versions
+    mpc52xx
+    pci_iov_resource_on_powernv
+    pmu-ebb
+    ptrace
+    qe_firmware
+    syscall64-abi
+    transactional_memory
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
index 66c24140ebf1..a363d8c1603c 100644
--- a/Documentation/powerpc/isa-versions.rst
+++ b/Documentation/powerpc/isa-versions.rst
@@ -1,13 +1,12 @@
-:orphan:
-
+==========================
 CPU to ISA Version Mapping
 ==========================
 
 Mapping of some CPU versions to relevant ISA versions.
 
-========= ====================
+========= ====================================================================
 CPU       Architecture version
-========= ====================
+========= ====================================================================
 Power9    Power ISA v3.0B
 Power8    Power ISA v2.07
 Power7    Power ISA v2.06
@@ -24,7 +23,7 @@ PPC970    - PowerPC User Instruction Set Architecture Book I v2.01
           - PowerPC Virtual Environment Architecture Book II v2.01
           - PowerPC Operating Environment Architecture Book III v2.01
           - Plus Altivec/VMX ~= 2.03
-========= ====================
+========= ====================================================================
 
 
 Key Features
@@ -60,9 +59,9 @@ Power5     No
 PPC970     No
 ========== ====
 
-========== ====================
+========== ====================================
 CPU        Transactional Memory
-========== ====================
+========== ====================================
 Power9     Yes (* see transactional_memory.txt)
 Power8     Yes
 Power7     No
@@ -73,4 +72,4 @@ Power5++   No
 Power5+    No
 Power5     No
 PPC970     No
-========== ====================
+========== ====================================
diff --git a/Documentation/powerpc/mpc52xx.txt b/Documentation/powerpc/mpc52xx.rst
similarity index 91%
rename from Documentation/powerpc/mpc52xx.txt
rename to Documentation/powerpc/mpc52xx.rst
index 0d540a31ea1a..8676ac63e077 100644
--- a/Documentation/powerpc/mpc52xx.txt
+++ b/Documentation/powerpc/mpc52xx.rst
@@ -1,11 +1,13 @@
+=============================
 Linux 2.6.x on MPC52xx family
------------------------------
+=============================
 
 For the latest info, go to http://www.246tNt.com/mpc52xx/
 
 To compile/use :
 
-  - U-Boot:
+  - U-Boot::
+
      # <edit Makefile to set ARCH=ppc & CROSS_COMPILE=... ( also EXTRAVERSION
         if you wish to ).
      # make lite5200_defconfig
@@ -16,7 +18,8 @@ To compile/use :
      => tftpboot 400000 pRamdisk
      => bootm 200000 400000
 
-  - DBug:
+  - DBug::
+
      # <edit Makefile to set ARCH=ppc & CROSS_COMPILE=... ( also EXTRAVERSION
         if you wish to ).
      # make lite5200_defconfig
@@ -28,7 +31,8 @@ To compile/use :
      DBug> dn -i zImage.initrd.lite5200
 
 
-Some remarks :
+Some remarks:
+
  - The port is named mpc52xxx, and config options are PPC_MPC52xx. The MGT5100
    is not supported, and I'm not sure anyone is interesting in working on it
    so. I didn't took 5xxx because there's apparently a lot of 5xxx that have
diff --git a/Documentation/powerpc/pci_iov_resource_on_powernv.txt b/Documentation/powerpc/pci_iov_resource_on_powernv.rst
similarity index 97%
rename from Documentation/powerpc/pci_iov_resource_on_powernv.txt
rename to Documentation/powerpc/pci_iov_resource_on_powernv.rst
index b55c5cd83f8d..f5a5793e1613 100644
--- a/Documentation/powerpc/pci_iov_resource_on_powernv.txt
+++ b/Documentation/powerpc/pci_iov_resource_on_powernv.rst
@@ -1,6 +1,13 @@
+===================================================
+PCI Express I/O Virtualization Resource on Powerenv
+===================================================
+
 Wei Yang <weiyang@linux.vnet.ibm.com>
+
 Benjamin Herrenschmidt <benh@au1.ibm.com>
+
 Bjorn Helgaas <bhelgaas@google.com>
+
 26 Aug 2014
 
 This document describes the requirement from hardware for PCI MMIO resource
@@ -10,6 +17,7 @@ Endpoints and the implementation on P8 (IODA2). The next two sections talks
 about considerations on enabling SRIOV on IODA2.
 
 1. Introduction to Partitionable Endpoints
+==========================================
 
 A Partitionable Endpoint (PE) is a way to group the various resources
 associated with a device or a set of devices to provide isolation between
@@ -35,6 +43,7 @@ is a completely separate HW entity that replicates the entire logic, so has
 its own set of PEs, etc.
 
 2. Implementation of Partitionable Endpoints on P8 (IODA2)
+==========================================================
 
 P8 supports up to 256 Partitionable Endpoints per PHB.
 
@@ -149,6 +158,7 @@ P8 supports up to 256 Partitionable Endpoints per PHB.
     sense, but we haven't done it yet.
 
 3. Considerations for SR-IOV on PowerKVM
+========================================
 
   * SR-IOV Background
 
@@ -224,7 +234,7 @@ P8 supports up to 256 Partitionable Endpoints per PHB.
   IODA supports 256 PEs, so segmented windows contain 256 segments, so if
   total_VFs is less than 256, we have the situation in Figure 1.0, where
   segments [total_VFs, 255] of the M64 window may map to some MMIO range on
-  other devices:
+  other devices::
 
      0      1                     total_VFs - 1
      +------+------+-     -+------+------+
@@ -243,7 +253,7 @@ P8 supports up to 256 Partitionable Endpoints per PHB.
 		Figure 1.0 Direct map VF(n) BAR space
 
   Our current solution is to allocate 256 segments even if the VF(n) BAR
-  space doesn't need that much, as shown in Figure 1.1:
+  space doesn't need that much, as shown in Figure 1.1::
 
      0      1                     total_VFs - 1                255
      +------+------+-     -+------+------+-      -+------+------+
@@ -269,6 +279,7 @@ P8 supports up to 256 Partitionable Endpoints per PHB.
   responds to segments [total_VFs, 255].
 
 4. Implications for the Generic PCI Code
+========================================
 
 The PCIe SR-IOV spec requires that the base of the VF(n) BAR space be
 aligned to the size of an individual VF BAR.
diff --git a/Documentation/powerpc/pmu-ebb.txt b/Documentation/powerpc/pmu-ebb.rst
similarity index 99%
rename from Documentation/powerpc/pmu-ebb.txt
rename to Documentation/powerpc/pmu-ebb.rst
index 73cd163dbfb8..4f474758eb55 100644
--- a/Documentation/powerpc/pmu-ebb.txt
+++ b/Documentation/powerpc/pmu-ebb.rst
@@ -1,3 +1,4 @@
+========================
 PMU Event Based Branches
 ========================
 
diff --git a/Documentation/powerpc/ptrace.rst b/Documentation/powerpc/ptrace.rst
new file mode 100644
index 000000000000..864d4b6dddd1
--- /dev/null
+++ b/Documentation/powerpc/ptrace.rst
@@ -0,0 +1,156 @@
+======
+Ptrace
+======
+
+GDB intends to support the following hardware debug features of BookE
+processors:
+
+4 hardware breakpoints (IAC)
+2 hardware watchpoints (read, write and read-write) (DAC)
+2 value conditions for the hardware watchpoints (DVC)
+
+For that, we need to extend ptrace so that GDB can query and set these
+resources. Since we're extending, we're trying to create an interface
+that's extendable and that covers both BookE and server processors, so
+that GDB doesn't need to special-case each of them. We added the
+following 3 new ptrace requests.
+
+1. PTRACE_PPC_GETHWDEBUGINFO
+============================
+
+Query for GDB to discover the hardware debug features. The main info to
+be returned here is the minimum alignment for the hardware watchpoints.
+BookE processors don't have restrictions here, but server processors have
+an 8-byte alignment restriction for hardware watchpoints. We'd like to avoid
+adding special cases to GDB based on what it sees in AUXV.
+
+Since we're at it, we added other useful info that the kernel can return to
+GDB: this query will return the number of hardware breakpoints, hardware
+watchpoints and whether it supports a range of addresses and a condition.
+The query will fill the following structure provided by the requesting process::
+
+  struct ppc_debug_info {
+       unit32_t version;
+       unit32_t num_instruction_bps;
+       unit32_t num_data_bps;
+       unit32_t num_condition_regs;
+       unit32_t data_bp_alignment;
+       unit32_t sizeof_condition; /* size of the DVC register */
+       uint64_t features; /* bitmask of the individual flags */
+  };
+
+features will have bits indicating whether there is support for::
+
+  #define PPC_DEBUG_FEATURE_INSN_BP_RANGE		0x1
+  #define PPC_DEBUG_FEATURE_INSN_BP_MASK		0x2
+  #define PPC_DEBUG_FEATURE_DATA_BP_RANGE		0x4
+  #define PPC_DEBUG_FEATURE_DATA_BP_MASK		0x8
+  #define PPC_DEBUG_FEATURE_DATA_BP_DAWR		0x10
+
+2. PTRACE_SETHWDEBUG
+
+Sets a hardware breakpoint or watchpoint, according to the provided structure::
+
+  struct ppc_hw_breakpoint {
+        uint32_t version;
+  #define PPC_BREAKPOINT_TRIGGER_EXECUTE  0x1
+  #define PPC_BREAKPOINT_TRIGGER_READ     0x2
+ #define PPC_BREAKPOINT_TRIGGER_WRITE    0x4
+        uint32_t trigger_type;       /* only some combinations allowed */
+  #define PPC_BREAKPOINT_MODE_EXACT               0x0
+  #define PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE     0x1
+  #define PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE     0x2
+  #define PPC_BREAKPOINT_MODE_MASK                0x3
+        uint32_t addr_mode;          /* address match mode */
+
+  #define PPC_BREAKPOINT_CONDITION_MODE   0x3
+  #define PPC_BREAKPOINT_CONDITION_NONE   0x0
+  #define PPC_BREAKPOINT_CONDITION_AND    0x1
+  #define PPC_BREAKPOINT_CONDITION_EXACT  0x1	/* different name for the same thing as above */
+  #define PPC_BREAKPOINT_CONDITION_OR     0x2
+  #define PPC_BREAKPOINT_CONDITION_AND_OR 0x3
+  #define PPC_BREAKPOINT_CONDITION_BE_ALL 0x00ff0000	/* byte enable bits */
+  #define PPC_BREAKPOINT_CONDITION_BE(n)  (1<<((n)+16))
+        uint32_t condition_mode;     /* break/watchpoint condition flags */
+
+        uint64_t addr;
+        uint64_t addr2;
+        uint64_t condition_value;
+  };
+
+A request specifies one event, not necessarily just one register to be set.
+For instance, if the request is for a watchpoint with a condition, both the
+DAC and DVC registers will be set in the same request.
+
+With this GDB can ask for all kinds of hardware breakpoints and watchpoints
+that the BookE supports. COMEFROM breakpoints available in server processors
+are not contemplated, but that is out of the scope of this work.
+
+ptrace will return an integer (handle) uniquely identifying the breakpoint or
+watchpoint just created. This integer will be used in the PTRACE_DELHWDEBUG
+request to ask for its removal. Return -ENOSPC if the requested breakpoint
+can't be allocated on the registers.
+
+Some examples of using the structure to:
+
+- set a breakpoint in the first breakpoint register::
+
+    p.version         = PPC_DEBUG_CURRENT_VERSION;
+    p.trigger_type    = PPC_BREAKPOINT_TRIGGER_EXECUTE;
+    p.addr_mode       = PPC_BREAKPOINT_MODE_EXACT;
+    p.condition_mode  = PPC_BREAKPOINT_CONDITION_NONE;
+    p.addr            = (uint64_t) address;
+    p.addr2           = 0;
+    p.condition_value = 0;
+
+- set a watchpoint which triggers on reads in the second watchpoint register::
+
+    p.version         = PPC_DEBUG_CURRENT_VERSION;
+    p.trigger_type    = PPC_BREAKPOINT_TRIGGER_READ;
+    p.addr_mode       = PPC_BREAKPOINT_MODE_EXACT;
+    p.condition_mode  = PPC_BREAKPOINT_CONDITION_NONE;
+    p.addr            = (uint64_t) address;
+    p.addr2           = 0;
+    p.condition_value = 0;
+
+- set a watchpoint which triggers only with a specific value::
+
+    p.version         = PPC_DEBUG_CURRENT_VERSION;
+    p.trigger_type    = PPC_BREAKPOINT_TRIGGER_READ;
+    p.addr_mode       = PPC_BREAKPOINT_MODE_EXACT;
+    p.condition_mode  = PPC_BREAKPOINT_CONDITION_AND | PPC_BREAKPOINT_CONDITION_BE_ALL;
+    p.addr            = (uint64_t) address;
+    p.addr2           = 0;
+    p.condition_value = (uint64_t) condition;
+
+- set a ranged hardware breakpoint::
+
+    p.version         = PPC_DEBUG_CURRENT_VERSION;
+    p.trigger_type    = PPC_BREAKPOINT_TRIGGER_EXECUTE;
+    p.addr_mode       = PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE;
+    p.condition_mode  = PPC_BREAKPOINT_CONDITION_NONE;
+    p.addr            = (uint64_t) begin_range;
+    p.addr2           = (uint64_t) end_range;
+    p.condition_value = 0;
+
+- set a watchpoint in server processors (BookS)::
+
+    p.version         = 1;
+    p.trigger_type    = PPC_BREAKPOINT_TRIGGER_RW;
+    p.addr_mode       = PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE;
+    or
+    p.addr_mode       = PPC_BREAKPOINT_MODE_EXACT;
+
+    p.condition_mode  = PPC_BREAKPOINT_CONDITION_NONE;
+    p.addr            = (uint64_t) begin_range;
+    /* For PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE addr2 needs to be specified, where
+     * addr2 - addr <= 8 Bytes.
+     */
+    p.addr2           = (uint64_t) end_range;
+    p.condition_value = 0;
+
+3. PTRACE_DELHWDEBUG
+
+Takes an integer which identifies an existing breakpoint or watchpoint
+(i.e., the value returned from PTRACE_SETHWDEBUG), and deletes the
+corresponding breakpoint or watchpoint..
diff --git a/Documentation/powerpc/ptrace.txt b/Documentation/powerpc/ptrace.txt
deleted file mode 100644
index 99c5ce88d0fe..000000000000
--- a/Documentation/powerpc/ptrace.txt
+++ /dev/null
@@ -1,151 +0,0 @@
-GDB intends to support the following hardware debug features of BookE
-processors:
-
-4 hardware breakpoints (IAC)
-2 hardware watchpoints (read, write and read-write) (DAC)
-2 value conditions for the hardware watchpoints (DVC)
-
-For that, we need to extend ptrace so that GDB can query and set these
-resources. Since we're extending, we're trying to create an interface
-that's extendable and that covers both BookE and server processors, so
-that GDB doesn't need to special-case each of them. We added the
-following 3 new ptrace requests.
-
-1. PTRACE_PPC_GETHWDEBUGINFO
-
-Query for GDB to discover the hardware debug features. The main info to
-be returned here is the minimum alignment for the hardware watchpoints.
-BookE processors don't have restrictions here, but server processors have
-an 8-byte alignment restriction for hardware watchpoints. We'd like to avoid
-adding special cases to GDB based on what it sees in AUXV.
-
-Since we're at it, we added other useful info that the kernel can return to
-GDB: this query will return the number of hardware breakpoints, hardware
-watchpoints and whether it supports a range of addresses and a condition.
-The query will fill the following structure provided by the requesting process:
-
-struct ppc_debug_info {
-       unit32_t version;
-       unit32_t num_instruction_bps;
-       unit32_t num_data_bps;
-       unit32_t num_condition_regs;
-       unit32_t data_bp_alignment;
-       unit32_t sizeof_condition; /* size of the DVC register */
-       uint64_t features; /* bitmask of the individual flags */
-};
-
-features will have bits indicating whether there is support for:
-
-#define PPC_DEBUG_FEATURE_INSN_BP_RANGE		0x1
-#define PPC_DEBUG_FEATURE_INSN_BP_MASK		0x2
-#define PPC_DEBUG_FEATURE_DATA_BP_RANGE		0x4
-#define PPC_DEBUG_FEATURE_DATA_BP_MASK		0x8
-#define PPC_DEBUG_FEATURE_DATA_BP_DAWR		0x10
-
-2. PTRACE_SETHWDEBUG
-
-Sets a hardware breakpoint or watchpoint, according to the provided structure:
-
-struct ppc_hw_breakpoint {
-        uint32_t version;
-#define PPC_BREAKPOINT_TRIGGER_EXECUTE  0x1
-#define PPC_BREAKPOINT_TRIGGER_READ     0x2
-#define PPC_BREAKPOINT_TRIGGER_WRITE    0x4
-        uint32_t trigger_type;       /* only some combinations allowed */
-#define PPC_BREAKPOINT_MODE_EXACT               0x0
-#define PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE     0x1
-#define PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE     0x2
-#define PPC_BREAKPOINT_MODE_MASK                0x3
-        uint32_t addr_mode;          /* address match mode */
-
-#define PPC_BREAKPOINT_CONDITION_MODE   0x3
-#define PPC_BREAKPOINT_CONDITION_NONE   0x0
-#define PPC_BREAKPOINT_CONDITION_AND    0x1
-#define PPC_BREAKPOINT_CONDITION_EXACT  0x1	/* different name for the same thing as above */
-#define PPC_BREAKPOINT_CONDITION_OR     0x2
-#define PPC_BREAKPOINT_CONDITION_AND_OR 0x3
-#define PPC_BREAKPOINT_CONDITION_BE_ALL 0x00ff0000	/* byte enable bits */
-#define PPC_BREAKPOINT_CONDITION_BE(n)  (1<<((n)+16))
-        uint32_t condition_mode;     /* break/watchpoint condition flags */
-
-        uint64_t addr;
-        uint64_t addr2;
-        uint64_t condition_value;
-};
-
-A request specifies one event, not necessarily just one register to be set.
-For instance, if the request is for a watchpoint with a condition, both the
-DAC and DVC registers will be set in the same request.
-
-With this GDB can ask for all kinds of hardware breakpoints and watchpoints
-that the BookE supports. COMEFROM breakpoints available in server processors
-are not contemplated, but that is out of the scope of this work.
-
-ptrace will return an integer (handle) uniquely identifying the breakpoint or
-watchpoint just created. This integer will be used in the PTRACE_DELHWDEBUG
-request to ask for its removal. Return -ENOSPC if the requested breakpoint
-can't be allocated on the registers.
-
-Some examples of using the structure to:
-
-- set a breakpoint in the first breakpoint register
-
-  p.version         = PPC_DEBUG_CURRENT_VERSION;
-  p.trigger_type    = PPC_BREAKPOINT_TRIGGER_EXECUTE;
-  p.addr_mode       = PPC_BREAKPOINT_MODE_EXACT;
-  p.condition_mode  = PPC_BREAKPOINT_CONDITION_NONE;
-  p.addr            = (uint64_t) address;
-  p.addr2           = 0;
-  p.condition_value = 0;
-
-- set a watchpoint which triggers on reads in the second watchpoint register
-
-  p.version         = PPC_DEBUG_CURRENT_VERSION;
-  p.trigger_type    = PPC_BREAKPOINT_TRIGGER_READ;
-  p.addr_mode       = PPC_BREAKPOINT_MODE_EXACT;
-  p.condition_mode  = PPC_BREAKPOINT_CONDITION_NONE;
-  p.addr            = (uint64_t) address;
-  p.addr2           = 0;
-  p.condition_value = 0;
-
-- set a watchpoint which triggers only with a specific value
-
-  p.version         = PPC_DEBUG_CURRENT_VERSION;
-  p.trigger_type    = PPC_BREAKPOINT_TRIGGER_READ;
-  p.addr_mode       = PPC_BREAKPOINT_MODE_EXACT;
-  p.condition_mode  = PPC_BREAKPOINT_CONDITION_AND | PPC_BREAKPOINT_CONDITION_BE_ALL;
-  p.addr            = (uint64_t) address;
-  p.addr2           = 0;
-  p.condition_value = (uint64_t) condition;
-
-- set a ranged hardware breakpoint
-
-  p.version         = PPC_DEBUG_CURRENT_VERSION;
-  p.trigger_type    = PPC_BREAKPOINT_TRIGGER_EXECUTE;
-  p.addr_mode       = PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE;
-  p.condition_mode  = PPC_BREAKPOINT_CONDITION_NONE;
-  p.addr            = (uint64_t) begin_range;
-  p.addr2           = (uint64_t) end_range;
-  p.condition_value = 0;
-
-- set a watchpoint in server processors (BookS)
-
-  p.version         = 1;
-  p.trigger_type    = PPC_BREAKPOINT_TRIGGER_RW;
-  p.addr_mode       = PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE;
-  or
-  p.addr_mode       = PPC_BREAKPOINT_MODE_EXACT;
-
-  p.condition_mode  = PPC_BREAKPOINT_CONDITION_NONE;
-  p.addr            = (uint64_t) begin_range;
-  /* For PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE addr2 needs to be specified, where
-   * addr2 - addr <= 8 Bytes.
-   */
-  p.addr2           = (uint64_t) end_range;
-  p.condition_value = 0;
-
-3. PTRACE_DELHWDEBUG
-
-Takes an integer which identifies an existing breakpoint or watchpoint
-(i.e., the value returned from PTRACE_SETHWDEBUG), and deletes the
-corresponding breakpoint or watchpoint..
diff --git a/Documentation/powerpc/qe_firmware.txt b/Documentation/powerpc/qe_firmware.rst
similarity index 95%
rename from Documentation/powerpc/qe_firmware.txt
rename to Documentation/powerpc/qe_firmware.rst
index e7ac24aec4ff..42f5103140c9 100644
--- a/Documentation/powerpc/qe_firmware.txt
+++ b/Documentation/powerpc/qe_firmware.rst
@@ -1,23 +1,23 @@
-	   Freescale QUICC Engine Firmware Uploading
-	   -----------------------------------------
+=========================================
+Freescale QUICC Engine Firmware Uploading
+=========================================
 
 (c) 2007 Timur Tabi <timur at freescale.com>,
     Freescale Semiconductor
 
-Table of Contents
-=================
+.. Table of Contents
 
-  I - Software License for Firmware
+   I - Software License for Firmware
 
-  II - Microcode Availability
+   II - Microcode Availability
 
-  III - Description and Terminology
+   III - Description and Terminology
 
-  IV - Microcode Programming Details
+   IV - Microcode Programming Details
 
-  V - Firmware Structure Layout
+   V - Firmware Structure Layout
 
-  VI - Sample Code for Creating Firmware Files
+   VI - Sample Code for Creating Firmware Files
 
 Revision Information
 ====================
@@ -39,7 +39,7 @@ http://opensource.freescale.com.  For other firmware files, please contact
 your Freescale representative or your operating system vendor.
 
 III - Description and Terminology
-================================
+=================================
 
 In this document, the term 'microcode' refers to the sequence of 32-bit
 integers that compose the actual QE microcode.
@@ -89,7 +89,7 @@ being fixed in the RAM package utilizing they should be activated.  This data
 structure signals the microcode which of these virtual traps is active.
 
 This structure contains 6 words that the application should copy to some
-specific been defined.  This table describes the structure.
+specific been defined.  This table describes the structure::
 
 	---------------------------------------------------------------
 	| Offset in |                  | Destination Offset | Size of |
@@ -119,7 +119,7 @@ Extended Modes
 This is a double word bit array (64 bits) that defines special functionality
 which has an impact on the software drivers.  Each bit has its own impact
 and has special instructions for the s/w associated with it.  This structure is
-described in this table:
+described in this table::
 
 	-----------------------------------------------------------------------
 	| Bit #  |     Name     |   Description                               |
@@ -220,7 +220,8 @@ The 'model' field is a 16-bit number that matches the actual SOC. The
 'major' and 'minor' fields are the major and minor revision numbers,
 respectively, of the SOC.
 
-For example, to match the 8323, revision 1.0:
+For example, to match the 8323, revision 1.0::
+
      soc.model = 8323
      soc.major = 1
      soc.minor = 0
@@ -273,10 +274,10 @@ library and available to any driver that calles qe_get_firmware_info().
 	'reserved'.
 
 After the last microcode is a 32-bit CRC.  It can be calculated using
-this algorithm:
+this algorithm::
 
-u32 crc32(const u8 *p, unsigned int len)
-{
+  u32 crc32(const u8 *p, unsigned int len)
+  {
 	unsigned int i;
 	u32 crc = 0;
 
@@ -286,7 +287,7 @@ u32 crc32(const u8 *p, unsigned int len)
 		   crc = (crc >> 1) ^ ((crc & 1) ? 0xedb88320 : 0);
 	}
 	return crc;
-}
+  }
 
 VI - Sample Code for Creating Firmware Files
 ============================================
diff --git a/Documentation/powerpc/syscall64-abi.txt b/Documentation/powerpc/syscall64-abi.rst
similarity index 82%
rename from Documentation/powerpc/syscall64-abi.txt
rename to Documentation/powerpc/syscall64-abi.rst
index fa716a0d88bd..e49f69f941b9 100644
--- a/Documentation/powerpc/syscall64-abi.txt
+++ b/Documentation/powerpc/syscall64-abi.rst
@@ -5,12 +5,12 @@ Power Architecture 64-bit Linux system call ABI
 syscall
 =======
 
-syscall calling sequence[*] matches the Power Architecture 64-bit ELF ABI
+syscall calling sequence\ [1]_ matches the Power Architecture 64-bit ELF ABI
 specification C function calling sequence, including register preservation
 rules, with the following differences.
 
-[*] Some syscalls (typically low-level management functions) may have
-    different calling sequences (e.g., rt_sigreturn).
+.. [1] Some syscalls (typically low-level management functions) may have
+       different calling sequences (e.g., rt_sigreturn).
 
 Parameters and return value
 ---------------------------
@@ -33,12 +33,14 @@ Register preservation rules
 Register preservation rules match the ELF ABI calling sequence with the
 following differences:
 
-r0:         Volatile.   (System call number.)
-r3:         Volatile.   (Parameter 1, and return value.)
-r4-r8:      Volatile.   (Parameters 2-6.)
-cr0:        Volatile    (cr0.SO is the return error condition)
-cr1, cr5-7: Nonvolatile.
-lr:         Nonvolatile.
+=========== ============= ========================================
+r0          Volatile      (System call number.)
+r3          Volatile      (Parameter 1, and return value.)
+r4-r8       Volatile      (Parameters 2-6.)
+cr0         Volatile      (cr0.SO is the return error condition)
+cr1, cr5-7  Nonvolatile
+lr          Nonvolatile
+=========== ============= ========================================
 
 All floating point and vector data registers as well as control and status
 registers are nonvolatile.
@@ -90,9 +92,12 @@ The vsyscall may or may not use the caller's stack frame save areas.
 
 Register preservation rules
 ---------------------------
-r0: Volatile.
-cr1, cr5-7: Volatile.
-lr: Volatile.
+
+=========== ========
+r0          Volatile
+cr1, cr5-7  Volatile
+lr          Volatile
+=========== ========
 
 Invocation
 ----------
diff --git a/Documentation/powerpc/transactional_memory.txt b/Documentation/powerpc/transactional_memory.rst
similarity index 93%
rename from Documentation/powerpc/transactional_memory.txt
rename to Documentation/powerpc/transactional_memory.rst
index 52c023e14f26..09955103acb4 100644
--- a/Documentation/powerpc/transactional_memory.txt
+++ b/Documentation/powerpc/transactional_memory.rst
@@ -1,3 +1,4 @@
+============================
 Transactional Memory support
 ============================
 
@@ -17,29 +18,29 @@ instructions are presented to delimit transactions; transactions are
 guaranteed to either complete atomically or roll back and undo any partial
 changes.
 
-A simple transaction looks like this:
+A simple transaction looks like this::
 
-begin_move_money:
-  tbegin
-  beq   abort_handler
+  begin_move_money:
+    tbegin
+    beq   abort_handler
 
-  ld    r4, SAVINGS_ACCT(r3)
-  ld    r5, CURRENT_ACCT(r3)
-  subi  r5, r5, 1
-  addi  r4, r4, 1
-  std   r4, SAVINGS_ACCT(r3)
-  std   r5, CURRENT_ACCT(r3)
+    ld    r4, SAVINGS_ACCT(r3)
+    ld    r5, CURRENT_ACCT(r3)
+    subi  r5, r5, 1
+    addi  r4, r4, 1
+    std   r4, SAVINGS_ACCT(r3)
+    std   r5, CURRENT_ACCT(r3)
 
-  tend
+    tend
 
-  b     continue
+    b     continue
 
-abort_handler:
-  ... test for odd failures ...
+  abort_handler:
+    ... test for odd failures ...
 
-  /* Retry the transaction if it failed because it conflicted with
-   * someone else: */
-  b     begin_move_money
+    /* Retry the transaction if it failed because it conflicted with
+     * someone else: */
+    b     begin_move_money
 
 
 The 'tbegin' instruction denotes the start point, and 'tend' the end point.
@@ -123,7 +124,7 @@ Transaction-aware signal handlers can read the transactional register state
 from the second ucontext.  This will be necessary for crash handlers to
 determine, for example, the address of the instruction causing the SIGSEGV.
 
-Example signal handler:
+Example signal handler::
 
     void crash_handler(int sig, siginfo_t *si, void *uc)
     {
@@ -133,9 +134,9 @@ Example signal handler:
       if (ucp_link) {
         u64 msr = ucp->uc_mcontext.regs->msr;
         /* May have transactional ucontext! */
-#ifndef __powerpc64__
+  #ifndef __powerpc64__
         msr |= ((u64)transactional_ucp->uc_mcontext.regs->msr) << 32;
-#endif
+  #endif
         if (MSR_TM_ACTIVE(msr)) {
            /* Yes, we crashed during a transaction.  Oops. */
    fprintf(stderr, "Transaction to be restarted at 0x%llx, but "
@@ -176,6 +177,7 @@ Failure cause codes used by kernel
 These are defined in <asm/reg.h>, and distinguish different reasons why the
 kernel aborted a transaction:
 
+ ====================== ================================
  TM_CAUSE_RESCHED       Thread was rescheduled.
  TM_CAUSE_TLBI          Software TLB invalid.
  TM_CAUSE_FAC_UNAV      FP/VEC/VSX unavailable trap.
@@ -184,6 +186,7 @@ kernel aborted a transaction:
  TM_CAUSE_MISC          Currently unused.
  TM_CAUSE_ALIGNMENT     Alignment fault.
  TM_CAUSE_EMULATE       Emulation that touched memory.
+ ====================== ================================
 
 These can be checked by the user program's abort handler as TEXASR[0:7].  If
 bit 7 is set, it indicates that the error is consider persistent.  For example
@@ -203,7 +206,7 @@ POWER9
 ======
 
 TM on POWER9 has issues with storing the complete register state. This
-is described in this commit:
+is described in this commit::
 
     commit 4bb3c7a0208fc13ca70598efd109901a7cd45ae7
     Author: Paul Mackerras <paulus@ozlabs.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 3eee1d3e9fdf..b3a5c72f3298 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4468,7 +4468,7 @@ F:	arch/powerpc/platforms/powernv/pci-cxl.c
 F:	drivers/misc/cxl/
 F:	include/misc/cxl*
 F:	include/uapi/misc/cxl.h
-F:	Documentation/powerpc/cxl.txt
+F:	Documentation/powerpc/cxl.rst
 F:	Documentation/ABI/testing/sysfs-class-cxl
 
 CXLFLASH (IBM Coherent Accelerator Processor Interface CAPI Flash) SCSI DRIVER
@@ -4479,7 +4479,7 @@ L:	linux-scsi@vger.kernel.org
 S:	Supported
 F:	drivers/scsi/cxlflash/
 F:	include/uapi/scsi/cxlflash_ioctl.h
-F:	Documentation/powerpc/cxlflash.txt
+F:	Documentation/powerpc/cxlflash.rst
 
 CYBERPRO FB DRIVER
 M:	Russell King <linux@armlinux.org.uk>
@@ -12353,7 +12353,7 @@ F:	Documentation/PCI/pci-error-recovery.rst
 F:	drivers/pci/pcie/aer.c
 F:	drivers/pci/pcie/dpc.c
 F:	drivers/pci/pcie/err.c
-F:	Documentation/powerpc/eeh-pci-error-recovery.txt
+F:	Documentation/powerpc/eeh-pci-error-recovery.rst
 F:	arch/powerpc/kernel/eeh*.c
 F:	arch/powerpc/platforms/*/eeh*.c
 F:	arch/powerpc/include/*/eeh*.h
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index eee5bef736c8..6ba3cc2ef8ab 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1531,7 +1531,7 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
  *
  * Call convention:
  *
- * syscall register convention is in Documentation/powerpc/syscall64-abi.txt
+ * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
  *
  * For hypercalls, the register convention is as follows:
  * r0 volatile
diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 62c6ba17991a..c9519e62308c 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -419,7 +419,7 @@ static void qe_upload_microcode(const void *base,
 /*
  * Upload a microcode to the I-RAM at a specific address.
  *
- * See Documentation/powerpc/qe_firmware.txt for information on QE microcode
+ * See Documentation/powerpc/qe_firmware.rst for information on QE microcode
  * uploading.
  *
  * Currently, only version 1 is supported, so the 'version' field must be
diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index cb4db1b3ca3c..5fb214e67d73 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -47,7 +47,7 @@
  * using the 2.6 Linux kernel kref construct.
  *
  * For direction on installation and usage of this driver please reference
- * Documentation/powerpc/hvcs.txt.
+ * Documentation/powerpc/hvcs.rst.
  */
 
 #include <linux/device.h>
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index 3f9d6b6a5691..c1036d16ed03 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -259,7 +259,7 @@ static inline int qe_alive_during_sleep(void)
 
 /* Structure that defines QE firmware binary files.
  *
- * See Documentation/powerpc/qe_firmware.txt for a description of these
+ * See Documentation/powerpc/qe_firmware.rst for a description of these
  * fields.
  */
 struct qe_firmware {
-- 
2.21.0

