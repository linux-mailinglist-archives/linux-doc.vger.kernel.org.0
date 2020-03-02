Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D9317559F
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2020 09:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbgCBISE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Mar 2020 03:18:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:57096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727159AbgCBIQV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Mar 2020 03:16:21 -0500
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D4C1246C4;
        Mon,  2 Mar 2020 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583136979;
        bh=dfDnmwYQtS1gFi80gMuISybB4qFpZBjZOytk4JVftMk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U3dqy1GBWYTMWEr+6/9djJgRBZi7E1BL2xpFwK2LFKQvdRpJMGIxPuJi7JkLir3OK
         0Kf21wAfY4RPpnKypPGaNiekB79xOE4sn7Ztyr3Fwm/1J4lMogLjKWqP78qlq2PsJq
         rLUeoL04vnHazZFWddFPAI8ECBm2lGiLr2x+ZcbI=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j8gFN-0003xD-6x; Mon, 02 Mar 2020 09:16:17 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Hannes Reinecke <hare@suse.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org
Subject: [PATCH 08/42] docs: scsi: convert aic7xxx.txt to ReST
Date:   Mon,  2 Mar 2020 09:15:41 +0100
Message-Id: <dc2b1ffe4bf64cfc4b32328740704a30e8d38a79.1583136624.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <cover.1583136624.git.mchehab+huawei@kernel.org>
References: <cover.1583136624.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../scsi/{aic7xxx.txt => aic7xxx.rst}         | 446 ++++++++++--------
 Documentation/scsi/index.rst                  |   1 +
 Documentation/scsi/scsi-parameters.txt        |   2 +-
 drivers/scsi/aic7xxx/Kconfig.aic7xxx          |   2 +-
 4 files changed, 258 insertions(+), 193 deletions(-)
 rename Documentation/scsi/{aic7xxx.txt => aic7xxx.rst} (49%)

diff --git a/Documentation/scsi/aic7xxx.txt b/Documentation/scsi/aic7xxx.rst
similarity index 49%
rename from Documentation/scsi/aic7xxx.txt
rename to Documentation/scsi/aic7xxx.rst
index 7c5d0223d444..bad0e5567b21 100644
--- a/Documentation/scsi/aic7xxx.txt
+++ b/Documentation/scsi/aic7xxx.rst
@@ -1,8 +1,11 @@
-====================================================================
-=    Adaptec Aic7xxx Fast -> Ultra160 Family Manager Set v7.0      =
-=                            README for                            =
-=                     The Linux Operating System                   =
-====================================================================
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+========================================================
+Adaptec Aic7xxx Fast -> Ultra160 Family Manager Set v7.0
+========================================================
+
+README for The Linux Operating System
 
 The following information is available in this file:
 
@@ -12,13 +15,15 @@ The following information is available in this file:
   4. Contacting Adaptec
 
 1. Supported Hardware
+=====================
 
    The following Adaptec SCSI Chips and Host Adapters are supported by
-   the aic7xxx driver. 
+   the aic7xxx driver.
 
-   Chip    MIPS  Host Bus  MaxSync  MaxWidth  SCBs  Notes
-   ---------------------------------------------------------------
-   aic7770  10    EISA/VL   10MHz    16Bit      4   1
+   ======== ===== ========= ======== ========= ===== ===============
+   Chip     MIPS  Host Bus  MaxSync  MaxWidth  SCBs  Notes
+   ======== ===== ========= ======== ========= ===== ===============
+   aic7770  10    EISA/VL   10MHz    16Bit      4    1
    aic7850  10    PCI/32    10MHz    8Bit       3
    aic7855  10    PCI/32    10MHz    8Bit       3
    aic7856  10    PCI/32    10MHz    8Bit       3
@@ -28,12 +33,13 @@ The following information is available in this file:
    aic7880  10    PCI/32    20MHz    16Bit      16
    aic7890  20    PCI/32    40MHz    16Bit      16      3 4 5 6 7 8
    aic7891  20    PCI/64    40MHz    16Bit      16      3 4 5 6 7 8
-   aic7892  20   PCI/64-66  80MHz    16Bit      16      3 4 5 6 7 8
+   aic7892  20    PCI/64-66 80MHz    16Bit      16      3 4 5 6 7 8
    aic7895  15    PCI/32    20MHz    16Bit      16    2 3 4 5
    aic7895C 15    PCI/32    20MHz    16Bit      16    2 3 4 5     8
    aic7896  20    PCI/32    40MHz    16Bit      16    2 3 4 5 6 7 8
    aic7897  20    PCI/64    40MHz    16Bit      16    2 3 4 5 6 7 8
-   aic7899  20   PCI/64-66  80MHz    16Bit      16    2 3 4 5 6 7 8
+   aic7899  20    PCI/64-66 80MHz    16Bit      16    2 3 4 5 6 7 8
+   ======== ===== ========= ======== ========= ===== ===============
 
    1.   Multiplexed Twin Channel Device - One controller servicing two
         busses.
@@ -44,15 +50,16 @@ The following information is available in this file:
         for all possible target/lun combinations.
    5.   Block Move Instruction Support - Doubles the speed of certain
         sequencer operations.
-   6.   `Bayonet' style Scatter Gather Engine - Improves S/G prefetch
+   6.   'Bayonet' style Scatter Gather Engine - Improves S/G prefetch
         performance.
    7.   Queuing Registers - Allows queuing of new transactions without
         pausing the sequencer.
    8.   Multiple Target IDs - Allows the controller to respond to selection
         as a target on multiple SCSI IDs.
 
+   ============== ======= =========== =============== =============== =========
    Controller      Chip   Host-Bus    Int-Connectors  Ext-Connectors  Notes
-   --------------------------------------------------------------------------
+   ============== ======= =========== =============== =============== =========
    AHA-274X[A]    aic7770   EISA         SE-50M         SE-HD50F
    AHA-274X[A]W   aic7770   EISA         SE-HD68F       SE-HD68F
                                          SE-50M
@@ -73,7 +80,7 @@ The following information is available in this file:
    AHA-2915C      aic7860   PCI/32       SE-50M
    AHA-2940AU/CN  aic7860   PCI/32       SE-50M         SE-HD50F
    AHA-2944W      aic7870   PCI/32     HVD-HD68F        HVD-HD68F
-                                        HVD-50M
+                                       HVD-50M
    AHA-3940W      aic7870   PCI/32     2 X SE-HD68F     SE-HD68F        2
    AHA-2940UW     aic7880   PCI/32       SE-HD68F
                                          SE-50M         SE-HD68F
@@ -85,12 +92,12 @@ The following information is available in this file:
    AHA-3940UWD    aic7880   PCI/32     2 X SE-HD68F   2 X SE-VHD68F       3
    AHA-3940U      aic7880   PCI/32     2 X SE-50M       SE-HD50F          3
    AHA-2944UW     aic7880   PCI/32      HVD-HD68F       HVD-HD68F
-                                         HVD-50M
+                                        HVD-50M
    AHA-3944UWD    aic7880   PCI/32     2 X HVD-HD68F  2 X HVD-VHD68F      3
    AHA-4944UW     aic7880   PCI/32
    AHA-2930UW     aic7880   PCI/32
    AHA-2940UW Pro aic7880   PCI/32      SE-HD68F        SE-HD68F            4
-                                         SE-50M
+                                        SE-50M
    AHA-2940UW/CN  aic7880   PCI/32
    AHA-2940UDual  aic7895   PCI/32
    AHA-2940UWDual aic7895   PCI/32
@@ -102,27 +109,28 @@ The following information is available in this file:
    AHA-2940U2B    aic7890   PCI/32      LVD-HD68F       LVD-HD68F
    AHA-2940U2 OEM aic7891   PCI/64
    AHA-2940U2W    aic7890   PCI/32      LVD-HD68F       LVD-HD68F
-                                        SE-HD68F 
-                                         SE-50M
+                                        SE-HD68F
+                                        SE-50M
    AHA-2950U2B    aic7891   PCI/64      LVD-HD68F       LVD-HD68F
    AHA-2930U2     aic7890   PCI/32      LVD-HD68F       SE-HD50F
-                                         SE-50M 
+                                        SE-50M
    AHA-3950U2B    aic7897   PCI/64
    AHA-3950U2D    aic7897   PCI/64
    AHA-29160      aic7892   PCI/64-66
    AHA-29160 CPQ  aic7892   PCI/64-66
    AHA-29160N     aic7892   PCI/32      LVD-HD68F       SE-HD50F
-                                         SE-50M
+                                        SE-50M
    AHA-29160LP    aic7892   PCI/64-66
    AHA-19160      aic7892   PCI/64-66
    AHA-29150LP    aic7892   PCI/64-66
    AHA-29130LP    aic7892   PCI/64-66
    AHA-3960D      aic7899   PCI/64-66  2 X LVD-HD68F  2 X LVD-VHD68F
-                                         LVD-50M
+                                       LVD-50M
    AHA-3960D CPQ  aic7899   PCI/64-66  2 X LVD-HD68F  2 X LVD-VHD68F
-                                         LVD-50M
+                                       LVD-50M
    AHA-39160      aic7899   PCI/64-66  2 X LVD-HD68F  2 X LVD-VHD68F
-                                         LVD-50M
+                                       LVD-50M
+   ============== ======= =========== =============== =============== =========
 
    1. No BIOS support
    2. DEC21050 PCI-PCI bridge with multiple controller chips on secondary bus
@@ -131,11 +139,14 @@ The following information is available in this file:
       SCSI "stub" effects.
 
 2. Version History
-   7.0	  (4th August, 2005)
+==================
+
+   * 7.0	  (4th August, 2005)
 	- Updated driver to use SCSI transport class infrastructure
 	- Upported sequencer and core fixes from last adaptec released
 	  version of the driver.
-   6.2.36 (June 3rd, 2003)
+
+   * 6.2.36 (June 3rd, 2003)
         - Correct code that disables PCI parity error checking.
         - Correct and simplify handling of the ignore wide residue
           message.  The previous code would fail to report a residual
@@ -153,18 +164,18 @@ The following information is available in this file:
           by some other driver probe that occurred before we
           claimed the controller.
 
-   6.2.35 (May 14th, 2003)
+   * 6.2.35 (May 14th, 2003)
         - Fix a few GCC 3.3 compiler warnings.
         - Correct operation on EISA Twin Channel controller.
         - Add support for 2.5.X's scsi_report_device_reset().
 
-   6.2.34 (May 5th, 2003)
+   * 6.2.34 (May 5th, 2003)
         - Fix locking regression introduced in 6.2.29 that
           could cause a lock order reversal between the io_request_lock
           and our per-softc lock.  This was only possible on RH9,
           SuSE, and kernel.org 2.4.X kernels.
 
-   6.2.33 (April 30th, 2003)
+   * 6.2.33 (April 30th, 2003)
         - Dynamically disable PCI parity error reporting after
           10 errors are reported to the user.  These errors are
           the result of some other device issuing PCI transactions
@@ -172,172 +183,224 @@ The following information is available in this file:
           problem, continuing to report the errors just degrades
           our performance.
 
-   6.2.32 (March 28th, 2003)
+   * 6.2.32 (March 28th, 2003)
         - Dynamically sized S/G lists to avoid SCSI malloc
           pool fragmentation and SCSI mid-layer deadlock.
 
-   6.2.28 (January 20th, 2003)
+   * 6.2.28 (January 20th, 2003)
         - Domain Validation Fixes
         - Add ability to disable PCI parity error checking.
         - Enhanced Memory Mapped I/O probe
 
-   6.2.20 (November 7th, 2002)
+   * 6.2.20 (November 7th, 2002)
         - Added Domain Validation.
 
 3. Command Line Options
+=======================
 
-        WARNING: ALTERING OR ADDING THESE DRIVER PARAMETERS
+
+    .. Warning::
+
+                 ALTERING OR ADDING THESE DRIVER PARAMETERS
                  INCORRECTLY CAN RENDER YOUR SYSTEM INOPERABLE.
-                 USE THEM WITH CAUTION. 
+                 USE THEM WITH CAUTION.
 
    Put a .conf file in the /etc/modprobe.d directory and add/edit a
-   line containing 'options aic7xxx aic7xxx=[command[,command...]]' where
-   'command' is one or more of the following:
-   -----------------------------------------------------------------
-              Option: verbose
-          Definition: enable additional informative messages during
-                      driver operation.
-     Possible Values: This option is a flag
-       Default Value: disabled
-   -----------------------------------------------------------------
-              Option: debug:[value]
-          Definition: Enables various levels of debugging information
-     Possible Values: 0x0000 = no debugging, 0xffff = full debugging
-       Default Value: 0x0000
-   -----------------------------------------------------------------
-              Option: no_probe
-              Option: probe_eisa_vl
-          Definition: Do not probe for EISA/VLB controllers.
-                      This is a toggle.  If the driver is compiled
-                      to not probe EISA/VLB controllers by default,
-                      specifying "no_probe" will enable this probing.
-                      If the driver is compiled to probe EISA/VLB
-                      controllers by default, specifying "no_probe"
-                      will disable this probing.
-     Possible Values: This option is a toggle
-       Default Value: EISA/VLB probing is disabled by default.
-   -----------------------------------------------------------------
-              Option: pci_parity
-          Definition: Toggles the detection of PCI parity errors.
-                      On many motherboards with VIA chipsets,
-                      PCI parity is not generated correctly on the
-                      PCI bus.  It is impossible for the hardware to
-                      differentiate between these "spurious" parity
-                      errors and real parity errors.  The symptom of
-                      this problem is a stream of the message:
-    "scsi0: Data Parity Error Detected during address or write data phase"
-                      output by the driver.
-     Possible Values: This option is a toggle
-       Default Value: PCI Parity Error reporting is disabled
-   -----------------------------------------------------------------
-              Option: no_reset
-          Definition: Do not reset the bus during the initial probe
-                      phase
-     Possible Values: This option is a flag
-       Default Value: disabled
-   -----------------------------------------------------------------
-              Option: extended
-          Definition: Force extended translation on the controller
-     Possible Values: This option is a flag
-       Default Value: disabled
-   -----------------------------------------------------------------
-              Option: periodic_otag
-          Definition: Send an ordered tag periodically to prevent
-                      tag starvation.  Needed for some older devices
-     Possible Values: This option is a flag
-       Default Value: disabled
-   -----------------------------------------------------------------
-              Option: reverse_scan
-          Definition: Probe the scsi bus in reverse order, starting
-                      with target 15
-     Possible Values: This option is a flag
-       Default Value: disabled
-   -----------------------------------------------------------------
-              Option: global_tag_depth:[value]
-          Definition: Global tag depth for all targets on all busses.
-                      This option sets the default tag depth which
-                      may be selectively overridden vi the tag_info
-                      option.
-     Possible Values: 1 - 253
-       Default Value: 32
-   -----------------------------------------------------------------
-              Option: tag_info:{{value[,value...]}[,{value[,value...]}...]}
-          Definition: Set the per-target tagged queue depth on a
-                      per controller basis.  Both controllers and targets
-                      may be omitted indicating that they should retain
-                      the default tag depth.
-            Examples: tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}
-                        On Controller 0
-                          specifies a tag depth of 16 for target 0
-                          specifies a tag depth of 64 for target 3
-                          specifies a tag depth of 8 for targets 4 and 5
-                          leaves target 6 at the default
-                          specifies a tag depth of 32 for targets 1,2,7-15
-                        All other targets retain the default depth.
-
-                      tag_info:{{},{32,,32}}
-                        On Controller 1
-                          specifies a tag depth of 32 for targets 0 and 2
-                        All other targets retain the default depth.
-                        
-     Possible Values: 1 - 253
-       Default Value: 32
-   -----------------------------------------------------------------
-              Option: seltime:[value]
-          Definition: Specifies the selection timeout value
-     Possible Values: 0 = 256ms, 1 = 128ms, 2 = 64ms, 3 = 32ms
-       Default Value: 0
-   -----------------------------------------------------------------
-              Option: dv: {value[,value...]} 
-          Definition: Set Domain Validation Policy on a per-controller basis.
-                      Controllers may be omitted indicating that
-                      they should retain the default read streaming setting.
-             Example: dv:{-1,0,,1,1,0}
-                        On Controller 0 leave DV at its default setting.
-                        On Controller 1 disable DV.
-                        Skip configuration on Controller 2.
-                        On Controllers 3 and 4 enable DV.
-                        On Controller 5 disable DV.
-
-     Possible Values: < 0 Use setting from serial EEPROM.
-                      0 Disable DV
-                      > 0 Enable DV
-
-       Default Value: SCSI-Select setting on controllers with a SCSI Select
-                      option for DV.  Otherwise, on for controllers supporting
-                      U160 speeds and off for all other controller types.
-   -----------------------------------------------------------------
-
-   Example:
-   'options aic7xxx aic7xxx=verbose,no_probe,tag_info:{{},{,,10}},seltime:1'
-        enables verbose logging, Disable EISA/VLB probing,
-        and set tag depth on Controller 1/Target 2 to 10 tags.
+   line containing ``options aic7xxx aic7xxx=[command[,command...]]`` where
+   ``command`` is one or more of the following:
+
+verbose
+
+    :Definition: enable additional informative messages during driver operation.
+    :Possible Values: This option is a flag
+    :Default Value: disabled
+
+
+debug:[value]
+
+    :Definition: Enables various levels of debugging information
+    :Possible Values: 0x0000 = no debugging, 0xffff = full debugging
+    :Default Value: 0x0000
+
+no_probe
+
+probe_eisa_vl
+
+    :Definition: Do not probe for EISA/VLB controllers.
+		 This is a toggle.  If the driver is compiled
+		 to not probe EISA/VLB controllers by default,
+		 specifying "no_probe" will enable this probing.
+		 If the driver is compiled to probe EISA/VLB
+		 controllers by default, specifying "no_probe"
+		 will disable this probing.
+
+    :Possible Values: This option is a toggle
+    :Default Value: EISA/VLB probing is disabled by default.
+
+pci_parity
+
+    :Definition: Toggles the detection of PCI parity errors.
+		 On many motherboards with VIA chipsets,
+		 PCI parity is not generated correctly on the
+		 PCI bus.  It is impossible for the hardware to
+		 differentiate between these "spurious" parity
+		 errors and real parity errors.  The symptom of
+		 this problem is a stream of the message::
+
+		    "scsi0:	Data Parity Error Detected during address or write data phase"
+
+		 output by the driver.
+
+    :Possible Values: This option is a toggle
+    :Default Value: PCI Parity Error reporting is disabled
+
+no_reset
+
+    :Definition: Do not reset the bus during the initial probe
+		 phase
+
+    :Possible Values: This option is a flag
+    :Default Value: disabled
+
+extended
+
+    :Definition: Force extended translation on the controller
+    :Possible Values: This option is a flag
+    :Default Value: disabled
+
+periodic_otag
+
+    :Definition: Send an ordered tag periodically to prevent
+		 tag starvation.  Needed for some older devices
+
+    :Possible Values: This option is a flag
+    :Default Value: disabled
+
+reverse_scan
+
+    :Definition: Probe the scsi bus in reverse order, starting
+		with target 15
+
+    :Possible Values: This option is a flag
+    :Default Value: disabled
+
+global_tag_depth:[value]
+
+    :Definition: Global tag depth for all targets on all busses.
+		 This option sets the default tag depth which
+		 may be selectively overridden vi the tag_info
+		 option.
+
+    :Possible Values: 1 - 253
+    :Default Value: 32
+
+tag_info:{{value[,value...]}[,{value[,value...]}...]}
+
+    :Definition: Set the per-target tagged queue depth on a
+		 per controller basis.  Both controllers and targets
+		 may be omitted indicating that they should retain
+		 the default tag depth.
+
+    :Possible Values: 1 - 253
+    :Default Value: 32
+
+    Examples:
+
+	    ::
+
+	        tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}
+
+	    On Controller 0:
+
+		- specifies a tag depth of 16 for target 0
+		- specifies a tag depth of 64 for target 3
+		- specifies a tag depth of 8 for targets 4 and 5
+		- leaves target 6 at the default
+		- specifies a tag depth of 32 for targets 1,2,7-15
+		- All other targets retain the default depth.
+
+	    ::
+
+                tag_info:{{},{32,,32}}
+
+	    On Controller 1:
+
+		- specifies a tag depth of 32 for targets 0 and 2
+		- All other targets retain the default depth.
+
+seltime:[value]
+
+    :Definition: Specifies the selection timeout value
+    :Possible Values: 0 = 256ms, 1 = 128ms, 2 = 64ms, 3 = 32ms
+    :Default Value: 0
+
+dv: {value[,value...]}
+
+    :Definition: Set Domain Validation Policy on a per-controller basis.
+		 Controllers may be omitted indicating that
+		 they should retain the default read streaming setting.
+
+    :Possible Values:
+
+		      ==== ===============================
+		       < 0 Use setting from serial EEPROM.
+                         0 Disable DV
+		       > 0 Enable DV
+		      ==== ===============================
+
+
+    :Default Value: SCSI-Select setting on controllers with a SCSI Select
+		    option for DV.  Otherwise, on for controllers supporting
+		    U160 speeds and off for all other controller types.
+
+    Example:
+
+	    ::
+
+		dv:{-1,0,,1,1,0}
+
+	   - On Controller 0 leave DV at its default setting.
+	   - On Controller 1 disable DV.
+	   - Skip configuration on Controller 2.
+	   - On Controllers 3 and 4 enable DV.
+	   - On Controller 5 disable DV.
+
+Example::
+
+    options aic7xxx aic7xxx=verbose,no_probe,tag_info:{{},{,,10}},seltime:1
+
+enables verbose logging, Disable EISA/VLB probing,
+and set tag depth on Controller 1/Target 2 to 10 tags.
 
 4. Adaptec Customer Support
+===========================
 
-   A Technical Support Identification (TSID) Number is required for 
+   A Technical Support Identification (TSID) Number is required for
    Adaptec technical support.
+
     - The 12-digit TSID can be found on the white barcode-type label
-      included inside the box with your product.  The TSID helps us 
-      provide more efficient service by accurately identifying your 
+      included inside the box with your product.  The TSID helps us
+      provide more efficient service by accurately identifying your
       product and support status.
 
    Support Options
     - Search the Adaptec Support Knowledgebase (ASK) at
       http://ask.adaptec.com for articles, troubleshooting tips, and
       frequently asked questions about your product.
-    - For support via Email, submit your question to Adaptec's 
+    - For support via Email, submit your question to Adaptec's
       Technical Support Specialists at http://ask.adaptec.com/.
-     
+
    North America
     - Visit our Web site at http://www.adaptec.com/.
     - For information about Adaptec's support options, call
       408-957-2550, 24 hours a day, 7 days a week.
     - To speak with a Technical Support Specialist,
+
       * For hardware products, call 408-934-7274,
         Monday to Friday, 3:00 am to 5:00 pm, PDT.
       * For RAID and Fibre Channel products, call 321-207-2000,
         Monday to Friday, 3:00 am to 5:00 pm, PDT.
+
       To expedite your service, have your computer with you.
     - To order Adaptec products, including accessories and cables,
       call 408-957-7274.  To order cables online go to
@@ -346,49 +409,50 @@ The following information is available in this file:
    Europe
     - Visit our Web site at http://www.adaptec.com/en-US/_common/world_index.
     - To speak with a Technical Support Specialist, call, or email,
+
       * German:  +49 89 4366 5522, Monday-Friday, 9:00-17:00 CET,
         http://ask-de.adaptec.com/.
       * French:  +49 89 4366 5533, Monday-Friday, 9:00-17:00 CET,
 	http://ask-fr.adaptec.com/.
       * English: +49 89 4366 5544, Monday-Friday, 9:00-17:00 GMT,
 	http://ask.adaptec.com/.
+
     - You can order Adaptec cables online at
       http://www.adaptec.com/buy-cables/.
 
    Japan
     - Visit our web site at http://www.adaptec.co.jp/.
-    - To speak with a Technical Support Specialist, call 
+    - To speak with a Technical Support Specialist, call
       +81 3 5308 6120, Monday-Friday, 9:00 a.m. to 12:00 p.m.,
       1:00 p.m. to 6:00 p.m.
 
--------------------------------------------------------------------
-/*
- * Copyright (c) 2003 Adaptec Inc. 691 S. Milpitas Blvd., Milpitas CA 95035 USA.
- * All rights reserved.
- *
- * You are permitted to redistribute, use and modify this README file in whole
- * or in part in conjunction with redistribution of software governed by the
- * General Public License, provided that the following conditions are met:
- * 1. Redistributions of README file must retain the above copyright
- *    notice, this list of conditions, and the following disclaimer,
- *    without modification.
- * 2. The name of the author may not be used to endorse or promote products
- *    derived from this software without specific prior written permission.
- * 3. Modifications or new contributions must be attributed in a copyright
- *    notice identifying the author ("Contributor") and added below the
- *    original copyright notice. The copyright notice is for purposes of
- *    identifying contributors and should not be deemed as permission to alter
- *    the permissions given by Adaptec.
- *
- * THIS README FILE IS PROVIDED BY ADAPTEC AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, ANY
- * WARRANTIES OF NON-INFRINGEMENT OR THE IMPLIED WARRANTIES OF MERCHANTABILITY
- * AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
- * ADAPTEC OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
- * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS README
- * FILE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
+Copyright |copy| 2003 Adaptec Inc. 691 S. Milpitas Blvd., Milpitas CA 95035 USA.
+
+All rights reserved.
+
+You are permitted to redistribute, use and modify this README file in whole
+or in part in conjunction with redistribution of software governed by the
+General Public License, provided that the following conditions are met:
+
+1. Redistributions of README file must retain the above copyright
+   notice, this list of conditions, and the following disclaimer,
+   without modification.
+2. The name of the author may not be used to endorse or promote products
+   derived from this software without specific prior written permission.
+3. Modifications or new contributions must be attributed in a copyright
+   notice identifying the author ("Contributor") and added below the
+   original copyright notice. The copyright notice is for purposes of
+   identifying contributors and should not be deemed as permission to alter
+   the permissions given by Adaptec.
+
+THIS README FILE IS PROVIDED BY ADAPTEC AND CONTRIBUTORS ``AS IS`` AND
+ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, ANY
+WARRANTIES OF NON-INFRINGEMENT OR THE IMPLIED WARRANTIES OF MERCHANTABILITY
+AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
+ADAPTEC OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
+TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS README
+FILE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/Documentation/scsi/index.rst b/Documentation/scsi/index.rst
index b7fdfc0cb956..c0b66763515f 100644
--- a/Documentation/scsi/index.rst
+++ b/Documentation/scsi/index.rst
@@ -12,5 +12,6 @@ Linux SCSI Subsystem
    advansys
    aha152x
    aic79xx
+   aic7xxx
 
    scsi_transport_srp/figures
diff --git a/Documentation/scsi/scsi-parameters.txt b/Documentation/scsi/scsi-parameters.txt
index 8ed9c662a1d4..266fd3b2398a 100644
--- a/Documentation/scsi/scsi-parameters.txt
+++ b/Documentation/scsi/scsi-parameters.txt
@@ -22,7 +22,7 @@ parameters may be changed at runtime by the command
 			Format: <portbase>[,<buson>,<busoff>[,<dmaspeed>]]
 
 	aic7xxx=	[HW,SCSI]
-			See Documentation/scsi/aic7xxx.txt.
+			See Documentation/scsi/aic7xxx.rst.
 
 	aic79xx=	[HW,SCSI]
 			See Documentation/scsi/aic79xx.rst.
diff --git a/drivers/scsi/aic7xxx/Kconfig.aic7xxx b/drivers/scsi/aic7xxx/Kconfig.aic7xxx
index 3546b8cc401f..9d027549d698 100644
--- a/drivers/scsi/aic7xxx/Kconfig.aic7xxx
+++ b/drivers/scsi/aic7xxx/Kconfig.aic7xxx
@@ -37,7 +37,7 @@ config AIC7XXX_CMDS_PER_DEVICE
 	on some devices.  The upper bound is 253.  0 disables tagged queueing.
 
 	Per device tag depth can be controlled via the kernel command line
-	"tag_info" option.  See Documentation/scsi/aic7xxx.txt for details.
+	"tag_info" option.  See Documentation/scsi/aic7xxx.rst for details.
 
 config AIC7XXX_RESET_DELAY_MS
 	int "Initial bus reset delay in milli-seconds"
-- 
2.21.1

