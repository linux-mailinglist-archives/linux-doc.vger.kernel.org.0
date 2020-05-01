Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CF21C1885
	for <lists+linux-doc@lfdr.de>; Fri,  1 May 2020 16:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730298AbgEAOre (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 1 May 2020 10:47:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:52490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729495AbgEAOpJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 May 2020 10:45:09 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED43C24983;
        Fri,  1 May 2020 14:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588344306;
        bh=/e0U6N64qZMC83ZexFcghGI7FQ8B/YdWG/XnvZHOen8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PK3u1s4C7LwnCde9M4MJXaFpbqBO9wuUW3eCkU50h/ybXfnUxwbQ/BWj2jNtSRUEM
         LEoN0Ftwmoc0hVVCehFvmEIKyPTCtr6tEcX5zyXG7XxCYxaKBS6HKk/5oYD08vTdCA
         Pc6T26h1JBYDd/UMw0duGOi5ZZFWzF9v8606txQg=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jUWuT-00FCdu-Ld; Fri, 01 May 2020 16:45:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Subject: [PATCH 17/37] docs: networking: device drivers: convert cirrus/cs89x0.txt to ReST
Date:   Fri,  1 May 2020 16:44:39 +0200
Message-Id: <4d5b3b5cb577aaebf89db8caffb4a301fb5c37f3.1588344146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588344146.git.mchehab+huawei@kernel.org>
References: <cover.1588344146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- add SPDX header;
- adjust title markup;
- mark code blocks and literals as such;
- adjust identation, whitespaces and blank lines where needed;
- add to networking/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../cirrus/{cs89x0.txt => cs89x0.rst}         | 557 +++++++++---------
 .../networking/device_drivers/index.rst       |   1 +
 drivers/net/ethernet/cirrus/Kconfig           |   2 +-
 3 files changed, 292 insertions(+), 268 deletions(-)
 rename Documentation/networking/device_drivers/cirrus/{cs89x0.txt => cs89x0.rst} (61%)

diff --git a/Documentation/networking/device_drivers/cirrus/cs89x0.txt b/Documentation/networking/device_drivers/cirrus/cs89x0.rst
similarity index 61%
rename from Documentation/networking/device_drivers/cirrus/cs89x0.txt
rename to Documentation/networking/device_drivers/cirrus/cs89x0.rst
index 0e190180eec8..e5c283940ac5 100644
--- a/Documentation/networking/device_drivers/cirrus/cs89x0.txt
+++ b/Documentation/networking/device_drivers/cirrus/cs89x0.rst
@@ -1,79 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0
 
-NOTE
-----
+================================================
+Cirrus Logic LAN CS8900/CS8920 Ethernet Adapters
+================================================
 
-This document was contributed by Cirrus Logic for kernel 2.2.5.  This version
-has been updated for 2.3.48 by Andrew Morton.
+.. note::
+
+   This document was contributed by Cirrus Logic for kernel 2.2.5.  This version
+   has been updated for 2.3.48 by Andrew Morton.
+
+   Still, this is too outdated! A major cleanup is needed here.
 
 Cirrus make a copy of this driver available at their website, as
 described below.  In general, you should use the driver version which
 comes with your Linux distribution.
 
 
-
-CIRRUS LOGIC LAN CS8900/CS8920 ETHERNET ADAPTERS
 Linux Network Interface Driver ver. 2.00 <kernel 2.3.48>
-===============================================================================
- 
-
-TABLE OF CONTENTS
-
-1.0 CIRRUS LOGIC LAN CS8900/CS8920 ETHERNET ADAPTERS
-    1.1 Product Overview 
-    1.2 Driver Description
-	1.2.1 Driver Name
-	1.2.2 File in the Driver Package
-    1.3 System Requirements
-    1.4 Licensing Information
-
-2.0 ADAPTER INSTALLATION and CONFIGURATION
-    2.1 CS8900-based Adapter Configuration
-    2.2 CS8920-based Adapter Configuration 
-
-3.0 LOADING THE DRIVER AS A MODULE
-
-4.0 COMPILING THE DRIVER
-    4.1 Compiling the Driver as a Loadable Module
-    4.2 Compiling the driver to support memory mode
-    4.3 Compiling the driver to support Rx DMA 
-
-5.0 TESTING AND TROUBLESHOOTING
-    5.1 Known Defects and Limitations
-    5.2 Testing the Adapter
-        5.2.1 Diagnostic Self-Test
-        5.2.2 Diagnostic Network Test
-    5.3 Using the Adapter's LEDs
-    5.4 Resolving I/O Conflicts
-
-6.0 TECHNICAL SUPPORT
-    6.1 Contacting Cirrus Logic's Technical Support
-    6.2 Information Required Before Contacting Technical Support
-    6.3 Obtaining the Latest Driver Version
-    6.4 Current maintainer
-    6.5 Kernel boot parameters
-
-
-1.0 CIRRUS LOGIC LAN CS8900/CS8920 ETHERNET ADAPTERS
-===============================================================================
-
-
-1.1 PRODUCT OVERVIEW
-
-The CS8900-based ISA Ethernet Adapters from Cirrus Logic follow 
-IEEE 802.3 standards and support half or full-duplex operation in ISA bus 
-computers on 10 Mbps Ethernet networks.  The adapters are designed for operation 
-in 16-bit ISA or EISA bus expansion slots and are available in 
-10BaseT-only or 3-media configurations (10BaseT, 10Base2, and AUI for 10Base-5 
-or fiber networks).  
-
-CS8920-based adapters are similar to the CS8900-based adapter with additional 
-features for Plug and Play (PnP) support and Wakeup Frame recognition.  As 
-such, the configuration procedures differ somewhat between the two types of 
-adapters.  Refer to the "Adapter Configuration" section for details on 
+
+
+.. TABLE OF CONTENTS
+
+   1.0 CIRRUS LOGIC LAN CS8900/CS8920 ETHERNET ADAPTERS
+	1.1 Product Overview
+	1.2 Driver Description
+	    1.2.1 Driver Name
+	    1.2.2 File in the Driver Package
+	1.3 System Requirements
+	1.4 Licensing Information
+
+   2.0 ADAPTER INSTALLATION and CONFIGURATION
+	2.1 CS8900-based Adapter Configuration
+	2.2 CS8920-based Adapter Configuration
+
+   3.0 LOADING THE DRIVER AS A MODULE
+
+   4.0 COMPILING THE DRIVER
+	4.1 Compiling the Driver as a Loadable Module
+	4.2 Compiling the driver to support memory mode
+	4.3 Compiling the driver to support Rx DMA
+
+   5.0 TESTING AND TROUBLESHOOTING
+	5.1 Known Defects and Limitations
+	5.2 Testing the Adapter
+	    5.2.1 Diagnostic Self-Test
+	    5.2.2 Diagnostic Network Test
+	5.3 Using the Adapter's LEDs
+	5.4 Resolving I/O Conflicts
+
+   6.0 TECHNICAL SUPPORT
+	6.1 Contacting Cirrus Logic's Technical Support
+	6.2 Information Required Before Contacting Technical Support
+	6.3 Obtaining the Latest Driver Version
+	6.4 Current maintainer
+	6.5 Kernel boot parameters
+
+
+1. Cirrus Logic LAN CS8900/CS8920 Ethernet Adapters
+===================================================
+
+
+1.1. Product Overview
+=====================
+
+The CS8900-based ISA Ethernet Adapters from Cirrus Logic follow
+IEEE 802.3 standards and support half or full-duplex operation in ISA bus
+computers on 10 Mbps Ethernet networks.  The adapters are designed for operation
+in 16-bit ISA or EISA bus expansion slots and are available in
+10BaseT-only or 3-media configurations (10BaseT, 10Base2, and AUI for 10Base-5
+or fiber networks).
+
+CS8920-based adapters are similar to the CS8900-based adapter with additional
+features for Plug and Play (PnP) support and Wakeup Frame recognition.  As
+such, the configuration procedures differ somewhat between the two types of
+adapters.  Refer to the "Adapter Configuration" section for details on
 configuring both types of adapters.
 
 
-1.2 DRIVER DESCRIPTION
+1.2. Driver Description
+=======================
 
 The CS8900/CS8920 Ethernet Adapter driver for Linux supports the Linux
 v2.3.48 or greater kernel.  It can be compiled directly into the kernel
@@ -85,22 +90,25 @@ or loaded at run-time as a device driver module.
 
 The files in the driver at Cirrus' website include:
 
-  readme.txt         - this file
-  build              - batch file to compile cs89x0.c.
-  cs89x0.c           - driver C code
-  cs89x0.h           - driver header file
-  cs89x0.o           - pre-compiled module (for v2.2.5 kernel)
-  config/Config.in   - sample file to include cs89x0 driver in the kernel.
-  config/Makefile    - sample file to include cs89x0 driver in the kernel.
-  config/Space.c     - sample file to include cs89x0 driver in the kernel.
+  ===================  ====================================================
+  readme.txt           this file
+  build                batch file to compile cs89x0.c.
+  cs89x0.c             driver C code
+  cs89x0.h             driver header file
+  cs89x0.o             pre-compiled module (for v2.2.5 kernel)
+  config/Config.in     sample file to include cs89x0 driver in the kernel.
+  config/Makefile      sample file to include cs89x0 driver in the kernel.
+  config/Space.c       sample file to include cs89x0 driver in the kernel.
+  ===================  ====================================================
 
 
 
-1.3 SYSTEM REQUIREMENTS
+1.3. System Requirements
+------------------------
 
 The following hardware is required:
 
-   * Cirrus Logic LAN (CS8900/20-based) Ethernet ISA Adapter   
+   * Cirrus Logic LAN (CS8900/20-based) Ethernet ISA Adapter
 
    * IBM or IBM-compatible PC with:
      * An 80386 or higher processor
@@ -118,20 +126,21 @@ The following software is required:
 
    * LINUX kernel sources for your kernel (if compiling into kernel)
 
-   * GNU Toolkit (gcc and make) v2.6 or above (if compiling into kernel 
-     or a module)   
+   * GNU Toolkit (gcc and make) v2.6 or above (if compiling into kernel
+     or a module)
 
 
 
-1.4 LICENSING INFORMATION
+1.4. Licensing Information
+--------------------------
 
 This program is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License as published by the Free Software
 Foundation, version 1.
 
 This program is distributed in the hope that it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for 
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 more details.
 
 For a full copy of the GNU General Public License, write to the Free Software
@@ -139,28 +148,29 @@ Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 
 
 
-2.0 ADAPTER INSTALLATION and CONFIGURATION
-===============================================================================
+2. Adapter Installation and Configuration
+=========================================
 
-Both the CS8900 and CS8920-based adapters can be configured using parameters 
-stored in an on-board EEPROM. You must use the DOS-based CS8900/20 Setup 
-Utility if you want to change the adapter's configuration in EEPROM.  
+Both the CS8900 and CS8920-based adapters can be configured using parameters
+stored in an on-board EEPROM. You must use the DOS-based CS8900/20 Setup
+Utility if you want to change the adapter's configuration in EEPROM.
 
-When loading the driver as a module, you can specify many of the adapter's 
-configuration parameters on the command-line to override the EEPROM's settings 
-or for interface configuration when an EEPROM is not used. (CS8920-based 
+When loading the driver as a module, you can specify many of the adapter's
+configuration parameters on the command-line to override the EEPROM's settings
+or for interface configuration when an EEPROM is not used. (CS8920-based
 adapters must use an EEPROM.) See Section 3.0 LOADING THE DRIVER AS A MODULE.
 
-Since the CS8900/20 Setup Utility is a DOS-based application, you must install 
-and configure the adapter in a DOS-based system using the CS8900/20 Setup 
-Utility before installation in the target LINUX system.  (Not required if 
+Since the CS8900/20 Setup Utility is a DOS-based application, you must install
+and configure the adapter in a DOS-based system using the CS8900/20 Setup
+Utility before installation in the target LINUX system.  (Not required if
 installing a CS8900-based adapter and the default configuration is acceptable.)
-     
 
-2.1 CS8900-BASED ADAPTER CONFIGURATION
 
-CS8900-based adapters shipped from Cirrus Logic have been configured 
-with the following "default" settings:
+2.1. CS8900-based Adapter Configuration
+---------------------------------------
+
+CS8900-based adapters shipped from Cirrus Logic have been configured
+with the following "default" settings::
 
   Operation Mode:      Memory Mode
   IRQ:                 10
@@ -169,15 +179,16 @@ with the following "default" settings:
   Optimization:	       DOS Client
   Transmission Mode:   Half-duplex
   BootProm:            None
-  Media Type:	       Autodetect (3-media cards) or 
-                       10BASE-T (10BASE-T only adapter)
+  Media Type:	       Autodetect (3-media cards) or
+		       10BASE-T (10BASE-T only adapter)
 
-You should only change the default configuration settings if conflicts with 
-another adapter exists. To change the adapter's configuration, run the 
-CS8900/20 Setup Utility. 
+You should only change the default configuration settings if conflicts with
+another adapter exists. To change the adapter's configuration, run the
+CS8900/20 Setup Utility.
 
 
-2.2 CS8920-BASED ADAPTER CONFIGURATION
+2.2. CS8920-based Adapter Configuration
+---------------------------------------
 
 CS8920-based adapters are shipped from Cirrus Logic configured as Plug
 and Play (PnP) enabled.  However, since the cs89x0 driver does NOT
@@ -185,82 +196,83 @@ support PnP, you must install the CS8920 adapter in a DOS-based PC and
 run the CS8900/20 Setup Utility to disable PnP and configure the
 adapter before installation in the target Linux system.  Failure to do
 this will leave the adapter inactive and the driver will be unable to
-communicate with the adapter.  
+communicate with the adapter.
 
+::
 
-        **************************************************************** 
-        *                    CS8920-BASED ADAPTERS:                    *
-        *                                                              * 
-        * CS8920-BASED ADAPTERS ARE PLUG and PLAY ENABLED BY DEFAULT.  * 
-        * THE CS89X0 DRIVER DOES NOT SUPPORT PnP. THEREFORE, YOU MUST  *
-        * RUN THE CS8900/20 SETUP UTILITY TO DISABLE PnP SUPPORT AND   *
-        * TO ACTIVATE THE ADAPTER.                                     *
-        ****************************************************************
+	****************************************************************
+	*                    CS8920-BASED ADAPTERS:                    *
+	*                                                              *
+	* CS8920-BASED ADAPTERS ARE PLUG and PLAY ENABLED BY DEFAULT.  *
+	* THE CS89X0 DRIVER DOES NOT SUPPORT PnP. THEREFORE, YOU MUST  *
+	* RUN THE CS8900/20 SETUP UTILITY TO DISABLE PnP SUPPORT AND   *
+	* TO ACTIVATE THE ADAPTER.                                     *
+	****************************************************************
 
 
 
 
-3.0 LOADING THE DRIVER AS A MODULE
-===============================================================================
+3. Loading the Driver as a Module
+=================================
 
 If the driver is compiled as a loadable module, you can load the driver module
-with the 'modprobe' command.  Many of the adapter's configuration parameters can 
-be specified as command-line arguments to the load command.  This facility 
-provides a means to override the EEPROM's settings or for interface 
+with the 'modprobe' command.  Many of the adapter's configuration parameters can
+be specified as command-line arguments to the load command.  This facility
+provides a means to override the EEPROM's settings or for interface
 configuration when an EEPROM is not used.
 
-Example:
+Example::
 
     insmod cs89x0.o io=0x200 irq=0xA media=aui
 
 This example loads the module and configures the adapter to use an IO port base
 address of 200h, interrupt 10, and use the AUI media connection.  The following
-configuration options are available on the command line:
+configuration options are available on the command line::
 
-* io=###               - specify IO address (200h-360h)
-* irq=##               - specify interrupt level
-* use_dma=1            - Enable DMA
-* dma=#                - specify dma channel (Driver is compiled to support
-                         Rx DMA only)
-* dmasize=# (16 or 64) - DMA size 16K or 64K.  Default value is set to 16.
-* media=rj45           - specify media type
+  io=###               - specify IO address (200h-360h)
+  irq=##               - specify interrupt level
+  use_dma=1            - Enable DMA
+  dma=#                - specify dma channel (Driver is compiled to support
+			 Rx DMA only)
+  dmasize=# (16 or 64) - DMA size 16K or 64K.  Default value is set to 16.
+  media=rj45           - specify media type
    or media=bnc
    or media=aui
    or media=auto
-* duplex=full          - specify forced half/full/autonegotiate duplex
+  duplex=full          - specify forced half/full/autonegotiate duplex
    or duplex=half
    or duplex=auto
-* debug=#              - debug level (only available if the driver was compiled
-                         for debugging)
+  debug=#              - debug level (only available if the driver was compiled
+			 for debugging)
 
-NOTES:
+**Notes:**
 
 a) If an EEPROM is present, any specified command-line parameter
    will override the corresponding configuration value stored in
    EEPROM.
 
-b) The "io" parameter must be specified on the command-line.  
+b) The "io" parameter must be specified on the command-line.
 
 c) The driver's hardware probe routine is designed to avoid
    writing to I/O space until it knows that there is a cs89x0
    card at the written addresses.  This could cause problems
    with device probing.  To avoid this behaviour, add one
-   to the `io=' module parameter.  This doesn't actually change
+   to the ``io=`` module parameter.  This doesn't actually change
    the I/O address, but it is a flag to tell the driver
    to partially initialise the hardware before trying to
    identify the card.  This could be dangerous if you are
    not sure that there is a cs89x0 card at the provided address.
 
    For example, to scan for an adapter located at IO base 0x300,
-   specify an IO address of 0x301.  
+   specify an IO address of 0x301.
 
 d) The "duplex=auto" parameter is only supported for the CS8920.
 
 e) The minimum command-line configuration required if an EEPROM is
    not present is:
 
-   io 
-   irq 
+   io
+   irq
    media type (no autodetect)
 
 f) The following additional parameters are CS89XX defaults (values
@@ -282,13 +294,13 @@ h) Many Linux distributions use the 'modprobe' command to load
    module when it is loaded.  All the configuration options which are
    described above may be placed within /etc/conf.modules.
 
-   For example:
+   For example::
 
-   > cat /etc/conf.modules
-   ...
-   alias eth0 cs89x0
-   options cs89x0 io=0x0200 dma=5 use_dma=1
-   ...
+     > cat /etc/conf.modules
+     ...
+     alias eth0 cs89x0
+     options cs89x0 io=0x0200 dma=5 use_dma=1
+     ...
 
    In this example we are telling the module system that the
    ethernet driver for this machine should use the cs89x0 driver.  We
@@ -305,9 +317,9 @@ j) The cs89x0 supports DMA for receiving only.  DMA mode is
 
 k) If your Linux kernel was compiled with inbuilt plug-and-play
    support you will be able to find information about the cs89x0 card
-   with the command
+   with the command::
 
-   cat /proc/isapnp
+     cat /proc/isapnp
 
 l) If during DMA operation you find erratic behavior or network data
    corruption you should use your PC's BIOS to slow the EISA bus clock.
@@ -321,11 +333,11 @@ n) If the cs89x0 driver is compiled directly into the kernel, DMA
    mode may be selected by providing the kernel with a boot option
    'cs89x0_dma=N' where 'N' is the desired DMA channel number (5, 6 or 7).
 
-   Kernel boot options may be provided on the LILO command line:
+   Kernel boot options may be provided on the LILO command line::
 
 	LILO boot: linux cs89x0_dma=5
 
-   or they may be placed in /etc/lilo.conf:
+   or they may be placed in /etc/lilo.conf::
 
 	image=/boot/bzImage-2.3.48
 	  append="cs89x0_dma=5"
@@ -337,237 +349,246 @@ n) If the cs89x0 driver is compiled directly into the kernel, DMA
    (64k mode is not available).
 
 
-4.0 COMPILING THE DRIVER
-===============================================================================
+4. Compiling the Driver
+=======================
 
 The cs89x0 driver can be compiled directly into the kernel or compiled into
 a loadable device driver module.
 
+Just use the standard way to configure the driver and compile the Kernel.
 
-4.1 COMPILING THE DRIVER AS A LOADABLE MODULE
 
-To compile the driver into a loadable module, use the following command 
-(single command line, without quotes):
-
-"gcc -D__KERNEL__ -I/usr/src/linux/include -I/usr/src/linux/net/inet -Wall 
--Wstrict-prototypes -O2 -fomit-frame-pointer -DMODULE -DCONFIG_MODVERSIONS 
--c cs89x0.c"
-
-4.2 COMPILING THE DRIVER TO SUPPORT MEMORY MODE
-
-Support for memory mode was not carried over into the 2.3 series kernels.
-
-4.3 COMPILING THE DRIVER TO SUPPORT Rx DMA
+4.1. Compiling the Driver to Support Rx DMA
+-------------------------------------------
 
 The compile-time optionality for DMA was removed in the 2.3 kernel
 series.  DMA support is now unconditionally part of the driver.  It is
 enabled by the 'use_dma=1' module option.
 
 
-5.0 TESTING AND TROUBLESHOOTING
-===============================================================================
+5. Testing and Troubleshooting
+==============================
 
-5.1 KNOWN DEFECTS and LIMITATIONS
+5.1. Known Defects and Limitations
+----------------------------------
 
-Refer to the RELEASE.TXT file distributed as part of this archive for a list of 
+Refer to the RELEASE.TXT file distributed as part of this archive for a list of
 known defects, driver limitations, and work arounds.
 
 
-5.2 TESTING THE ADAPTER
+5.2. Testing the Adapter
+------------------------
 
-Once the adapter has been installed and configured, the diagnostic option of 
-the CS8900/20 Setup Utility can be used to test the functionality of the 
+Once the adapter has been installed and configured, the diagnostic option of
+the CS8900/20 Setup Utility can be used to test the functionality of the
 adapter and its network connection.  Use the diagnostics 'Self Test' option to
 test the functionality of the adapter with the hardware configuration you have
 assigned. You can use the diagnostics 'Network Test' to test the ability of the
-adapter to communicate across the Ethernet with another PC equipped with a 
-CS8900/20-based adapter card (it must also be running the CS8900/20 Setup 
+adapter to communicate across the Ethernet with another PC equipped with a
+CS8900/20-based adapter card (it must also be running the CS8900/20 Setup
 Utility).
 
-         NOTE: The Setup Utility's diagnostics are designed to run in a
-         DOS-only operating system environment.  DO NOT run the diagnostics 
-         from a DOS or command prompt session under Windows 95, Windows NT, 
-         OS/2, or other operating system.
+.. note::
+
+	 The Setup Utility's diagnostics are designed to run in a
+	 DOS-only operating system environment.  DO NOT run the diagnostics
+	 from a DOS or command prompt session under Windows 95, Windows NT,
+	 OS/2, or other operating system.
 
 To run the diagnostics tests on the CS8900/20 adapter:
 
-   1.) Boot DOS on the PC and start the CS8900/20 Setup Utility.
+   1.  Boot DOS on the PC and start the CS8900/20 Setup Utility.
 
-   2.) The adapter's current configuration is displayed.  Hit the ENTER key to
+   2.  The adapter's current configuration is displayed.  Hit the ENTER key to
        get to the main menu.
 
-   4.) Select 'Diagnostics' (ALT-G) from the main menu.  
+   4.  Select 'Diagnostics' (ALT-G) from the main menu.
        * Select 'Self-Test' to test the adapter's basic functionality.
        * Select 'Network Test' to test the network connection and cabling.
 
 
-5.2.1 DIAGNOSTIC SELF-TEST
+5.2.1. Diagnostic Self-test
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-The diagnostic self-test checks the adapter's basic functionality as well as 
-its ability to communicate across the ISA bus based on the system resources 
+The diagnostic self-test checks the adapter's basic functionality as well as
+its ability to communicate across the ISA bus based on the system resources
 assigned during hardware configuration.  The following tests are performed:
 
    * IO Register Read/Write Test
-     The IO Register Read/Write test insures that the CS8900/20 can be 
+
+     The IO Register Read/Write test insures that the CS8900/20 can be
      accessed in IO mode, and that the IO base address is correct.
 
    * Shared Memory Test
-     The Shared Memory test insures the CS8900/20 can be accessed in memory 
-     mode and that the range of memory addresses assigned does not conflict 
+
+     The Shared Memory test insures the CS8900/20 can be accessed in memory
+     mode and that the range of memory addresses assigned does not conflict
      with other devices in the system.
 
    * Interrupt Test
+
      The Interrupt test insures there are no conflicts with the assigned IRQ
      signal.
 
    * EEPROM Test
+
      The EEPROM test insures the EEPROM can be read.
 
    * Chip RAM Test
+
      The Chip RAM test insures the 4K of memory internal to the CS8900/20 is
      working properly.
 
    * Internal Loop-back Test
-     The Internal Loop Back test insures the adapter's transmitter and 
-     receiver are operating properly.  If this test fails, make sure the 
-     adapter's cable is connected to the network (check for LED activity for 
+
+     The Internal Loop Back test insures the adapter's transmitter and
+     receiver are operating properly.  If this test fails, make sure the
+     adapter's cable is connected to the network (check for LED activity for
      example).
 
    * Boot PROM Test
+
      The Boot PROM  test insures the Boot PROM is present, and can be read.
      Failure indicates the Boot PROM  was not successfully read due to a
      hardware problem or due to a conflicts on the Boot PROM address
      assignment. (Test only applies if the adapter is configured to use the
      Boot PROM option.)
 
-Failure of a test item indicates a possible system resource conflict with 
-another device on the ISA bus.  In this case, you should use the Manual Setup 
+Failure of a test item indicates a possible system resource conflict with
+another device on the ISA bus.  In this case, you should use the Manual Setup
 option to reconfigure the adapter by selecting a different value for the system
 resource that failed.
 
 
-5.2.2 DIAGNOSTIC NETWORK TEST
+5.2.2. Diagnostic Network Test
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-The Diagnostic Network Test verifies a working network connection by 
-transferring data between two CS8900/20 adapters installed in different PCs 
-on the same network. (Note: the diagnostic network test should not be run 
-between two nodes across a router.) 
+The Diagnostic Network Test verifies a working network connection by
+transferring data between two CS8900/20 adapters installed in different PCs
+on the same network. (Note: the diagnostic network test should not be run
+between two nodes across a router.)
 
 This test requires that each of the two PCs have a CS8900/20-based adapter
-installed and have the CS8900/20 Setup Utility running.  The first PC is 
-configured as a Responder and the other PC is configured as an Initiator.  
-Once the Initiator is started, it sends data frames to the Responder which 
+installed and have the CS8900/20 Setup Utility running.  The first PC is
+configured as a Responder and the other PC is configured as an Initiator.
+Once the Initiator is started, it sends data frames to the Responder which
 returns the frames to the Initiator.
 
-The total number of frames received and transmitted are displayed on the 
-Initiator's display, along with a count of the number of frames received and 
-transmitted OK or in error.  The test can be terminated anytime by the user at 
+The total number of frames received and transmitted are displayed on the
+Initiator's display, along with a count of the number of frames received and
+transmitted OK or in error.  The test can be terminated anytime by the user at
 either PC.
 
 To setup the Diagnostic Network Test:
 
-    1.) Select a PC with a CS8900/20-based adapter and a known working network
-        connection to act as the Responder.  Run the CS8900/20 Setup Utility 
-        and select 'Diagnostics -> Network Test -> Responder' from the main 
-        menu.  Hit ENTER to start the Responder.
+    1.  Select a PC with a CS8900/20-based adapter and a known working network
+	connection to act as the Responder.  Run the CS8900/20 Setup Utility
+	and select 'Diagnostics -> Network Test -> Responder' from the main
+	menu.  Hit ENTER to start the Responder.
 
-    2.) Return to the PC with the CS8900/20-based adapter you want to test and
-        start the CS8900/20 Setup Utility. 
+    2.  Return to the PC with the CS8900/20-based adapter you want to test and
+	start the CS8900/20 Setup Utility.
+
+    3.  From the main menu, Select 'Diagnostic -> Network Test -> Initiator'.
+	Hit ENTER to start the test.
 
-    3.) From the main menu, Select 'Diagnostic -> Network Test -> Initiator'.
-        Hit ENTER to start the test.
- 
 You may stop the test on the Initiator at any time while allowing the Responder
-to continue running.  In this manner, you can move to additional PCs and test 
-them by starting the Initiator on another PC without having to stop/start the 
+to continue running.  In this manner, you can move to additional PCs and test
+them by starting the Initiator on another PC without having to stop/start the
 Responder.
- 
 
 
-5.3 USING THE ADAPTER'S LEDs
 
-The 2 and 3-media adapters have two LEDs visible on the back end of the board 
-located near the 10Base-T connector.  
+5.3. Using the Adapter's LEDs
+-----------------------------
 
-Link Integrity LED: A "steady" ON of the green LED indicates a valid 10Base-T 
+The 2 and 3-media adapters have two LEDs visible on the back end of the board
+located near the 10Base-T connector.
+
+Link Integrity LED: A "steady" ON of the green LED indicates a valid 10Base-T
 connection.  (Only applies to 10Base-T.  The green LED has no significance for
 a 10Base-2 or AUI connection.)
 
-TX/RX LED: The yellow LED lights briefly each time the adapter transmits or 
+TX/RX LED: The yellow LED lights briefly each time the adapter transmits or
 receives data. (The yellow LED will appear to "flicker" on a typical network.)
 
 
-5.4 RESOLVING I/O CONFLICTS
+5.4. Resolving I/O Conflicts
+----------------------------
 
-An IO conflict occurs when two or more adapter use the same ISA resource (IO 
-address, memory address or IRQ).  You can usually detect an IO conflict in one 
+An IO conflict occurs when two or more adapter use the same ISA resource (IO
+address, memory address or IRQ).  You can usually detect an IO conflict in one
 of four ways after installing and or configuring the CS8900/20-based adapter:
 
-    1.) The system does not boot properly (or at all).
+    1.  The system does not boot properly (or at all).
 
-    2.) The driver cannot communicate with the adapter, reporting an "Adapter
-        not found" error message.
+    2.  The driver cannot communicate with the adapter, reporting an "Adapter
+	not found" error message.
 
-    3.) You cannot connect to the network or the driver will not load.
+    3.  You cannot connect to the network or the driver will not load.
 
-    4.) If you have configured the adapter to run in memory mode but the driver
-        reports it is using IO mode when loading, this is an indication of a
-        memory address conflict.
+    4.  If you have configured the adapter to run in memory mode but the driver
+	reports it is using IO mode when loading, this is an indication of a
+	memory address conflict.
 
-If an IO conflict occurs, run the CS8900/20 Setup Utility and perform a 
-diagnostic self-test.  Normally, the ISA resource in conflict will fail the 
-self-test.  If so, reconfigure the adapter selecting another choice for the 
-resource in conflict.  Run the diagnostics again to check for further IO 
+If an IO conflict occurs, run the CS8900/20 Setup Utility and perform a
+diagnostic self-test.  Normally, the ISA resource in conflict will fail the
+self-test.  If so, reconfigure the adapter selecting another choice for the
+resource in conflict.  Run the diagnostics again to check for further IO
 conflicts.
 
 In some cases, such as when the PC will not boot, it may be necessary to remove
-the adapter and reconfigure it by installing it in another PC to run the 
-CS8900/20 Setup Utility.  Once reinstalled in the target system, run the 
-diagnostics self-test to ensure the new configuration is free of conflicts 
+the adapter and reconfigure it by installing it in another PC to run the
+CS8900/20 Setup Utility.  Once reinstalled in the target system, run the
+diagnostics self-test to ensure the new configuration is free of conflicts
 before loading the driver again.
 
-When manually configuring the adapter, keep in mind the typical ISA system 
+When manually configuring the adapter, keep in mind the typical ISA system
 resource usage as indicated in the tables below.
 
-I/O Address    	Device                        IRQ      Device
------------    	--------                      ---      --------
- 200-20F       	Game I/O adapter               3       COM2, Bus Mouse
- 230-23F       	Bus Mouse                      4       COM1
- 270-27F       	LPT3: third parallel port      5       LPT2
- 2F0-2FF       	COM2: second serial port       6       Floppy Disk controller
- 320-32F       	Fixed disk controller          7       LPT1
-                                      	       8       Real-time Clock
-                                                 9       EGA/VGA display adapter    
-                                                12       Mouse (PS/2)                              
-Memory Address  Device                          13       Math Coprocessor
---------------  ---------------------           14       Hard Disk controller
-A000-BFFF	EGA Graphics Adapter
-A000-C7FF	VGA Graphics Adapter
-B000-BFFF	Mono Graphics Adapter
-B800-BFFF	Color Graphics Adapter
-E000-FFFF	AT BIOS
+::
 
+  I/O Address    	Device                        IRQ      Device
+  -----------    	--------                      ---      --------
+     200-20F       	Game I/O adapter               3       COM2, Bus Mouse
+     230-23F       	Bus Mouse                      4       COM1
+     270-27F       	LPT3: third parallel port      5       LPT2
+     2F0-2FF       	COM2: second serial port       6       Floppy Disk controller
+     320-32F       	Fixed disk controller          7       LPT1
+							 8       Real-time Clock
+						     9       EGA/VGA display adapter
+						    12       Mouse (PS/2)
+  Memory Address  Device                          13       Math Coprocessor
+  --------------  ---------------------           14       Hard Disk controller
+  A000-BFFF	EGA Graphics Adapter
+  A000-C7FF	VGA Graphics Adapter
+  B000-BFFF	Mono Graphics Adapter
+  B800-BFFF	Color Graphics Adapter
+  E000-FFFF	AT BIOS
 
 
 
-6.0 TECHNICAL SUPPORT
-===============================================================================
 
-6.1 CONTACTING CIRRUS LOGIC'S TECHNICAL SUPPORT
+6. Technical Support
+====================
 
-Cirrus Logic's CS89XX Technical Application Support can be reached at:
+6.1. Contacting Cirrus Logic's Technical Support
+------------------------------------------------
 
-Telephone  :(800) 888-5016 (from inside U.S. and Canada)
-           :(512) 442-7555 (from outside the U.S. and Canada)
-Fax        :(512) 912-3871
-Email      :ethernet@crystal.cirrus.com
-WWW        :http://www.cirrus.com
+Cirrus Logic's CS89XX Technical Application Support can be reached at::
 
+  Telephone  :(800) 888-5016 (from inside U.S. and Canada)
+	     :(512) 442-7555 (from outside the U.S. and Canada)
+  Fax        :(512) 912-3871
+  Email      :ethernet@crystal.cirrus.com
+  WWW        :http://www.cirrus.com
 
-6.2 INFORMATION REQUIRED BEFORE CONTACTING TECHNICAL SUPPORT
 
-Before contacting Cirrus Logic for technical support, be prepared to provide as 
-Much of the following information as possible. 
+6.2. Information Required before Contacting Technical Support
+-------------------------------------------------------------
+
+Before contacting Cirrus Logic for technical support, be prepared to provide as
+Much of the following information as possible.
 
 1.) Adapter type (CRD8900, CDB8900, CDB8920, etc.)
 
@@ -575,7 +596,7 @@ Much of the following information as possible.
 
     * IO Base, Memory Base, IO or memory mode enabled, IRQ, DMA channel
     * Plug and Play enabled/disabled (CS8920-based adapters only)
-    * Configured for media auto-detect or specific media type (which type).    
+    * Configured for media auto-detect or specific media type (which type).
 
 3.) PC System's Configuration
 
@@ -590,35 +611,37 @@ Much of the following information as possible.
 
     * CS89XX driver and version
     * Your network operating system and version
-    * Your system's OS version 
+    * Your system's OS version
     * Version of all protocol support files
 
 5.) Any Error Message displayed.
 
 
 
-6.3 OBTAINING THE LATEST DRIVER VERSION
+6.3 Obtaining the Latest Driver Version
+---------------------------------------
 
-You can obtain the latest CS89XX drivers and support software from Cirrus Logic's 
+You can obtain the latest CS89XX drivers and support software from Cirrus Logic's
 Web site.  You can also contact Cirrus Logic's Technical Support (email:
-ethernet@crystal.cirrus.com) and request that you be registered for automatic 
+ethernet@crystal.cirrus.com) and request that you be registered for automatic
 software-update notification.
 
 Cirrus Logic maintains a web page at http://www.cirrus.com with the
 latest drivers and technical publications.
 
 
-6.4 Current maintainer
+6.4. Current maintainer
+-----------------------
 
 In February 2000 the maintenance of this driver was assumed by Andrew
 Morton.
 
 6.5 Kernel module parameters
+----------------------------
 
 For use in embedded environments with no cs89x0 EEPROM, the kernel boot
-parameter `cs89x0_media=' has been implemented.  Usage is:
+parameter ``cs89x0_media=`` has been implemented.  Usage is::
 
 	cs89x0_media=rj45    or
 	cs89x0_media=aui     or
 	cs89x0_media=bnc
-
diff --git a/Documentation/networking/device_drivers/index.rst b/Documentation/networking/device_drivers/index.rst
index 23c4ec9c9125..0b39342e2a1f 100644
--- a/Documentation/networking/device_drivers/index.rst
+++ b/Documentation/networking/device_drivers/index.rst
@@ -32,6 +32,7 @@ Contents:
    amazon/ena
    aquantia/atlantic
    chelsio/cxgb
+   cirrus/cs89x0
 
 .. only::  subproject and html
 
diff --git a/drivers/net/ethernet/cirrus/Kconfig b/drivers/net/ethernet/cirrus/Kconfig
index 48f3198381bc..8d845f5ee0c5 100644
--- a/drivers/net/ethernet/cirrus/Kconfig
+++ b/drivers/net/ethernet/cirrus/Kconfig
@@ -24,7 +24,7 @@ config CS89x0
 	---help---
 	  Support for CS89x0 chipset based Ethernet cards. If you have a
 	  network (Ethernet) card of this type, say Y and read the file
-	  <file:Documentation/networking/device_drivers/cirrus/cs89x0.txt>.
+	  <file:Documentation/networking/device_drivers/cirrus/cs89x0.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called cs89x0.
-- 
2.25.4

