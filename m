Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A97D7572FA
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jul 2023 06:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjGRE5H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Jul 2023 00:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjGRE5G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Jul 2023 00:57:06 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41A3AD;
        Mon, 17 Jul 2023 21:57:04 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-635f48814b4so23451916d6.1;
        Mon, 17 Jul 2023 21:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689656224; x=1692248224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AhZtM4OMt6o7599l1/0NMVnInKAbK6B7fnvu1ECUNA=;
        b=S0aGp8XTMYZmLQTKU2tQVEKbR8fC2dSzdvNcvj+4H58hsuilYdT5HlU+uCdGslxKvL
         QU3RKnvKyyiG3kaJd6/guKNp3J3+VJ7V/P0wS9PYxlfX3aaU/jSHGRyU8Bs1yv1kp0ei
         xz+Om2nbavHFM0thOE/6CwhwF00K6WNI9q8QfcXyPRtGSpCo2UVI3YLvo0s/6LGn7j8b
         y2lW46kxDaxz9FA7pwvJWOKNftAUiUxAGpjiKDEIRLeFG2Og22aFghQc5CBBXt/Ef5Kq
         gMKm16hiylZw7Vof3wP94CZSvdSWLBqidwS3Woz+tIYEJWLvZG7M4fuYehYyAABd1Fwn
         T4eQ==
X-Gm-Message-State: ABy/qLbFHCycMtBVv/waETOs8skSNAFlXo7x/T4lwimLgbmAtn3dXtkK
        Rb2f2dRXzbYbrM7IanCLu28=
X-Google-Smtp-Source: APBJJlGkqe3Lz591t11y2dYqm4sK9Ry50tZouGCDJ9NZypddKx/XyD6aY4cUfVFKbr94nfQaPkktrg==
X-Received: by 2002:a05:620a:2225:b0:761:fbb5:7421 with SMTP id n5-20020a05620a222500b00761fbb57421mr10643950qkh.77.1689656223635;
        Mon, 17 Jul 2023 21:57:03 -0700 (PDT)
Received: from costa-tp.bos2.lab ([5.29.20.9])
        by smtp.gmail.com with ESMTPSA id j6-20020a05620a146600b0076745f352adsm332914qkl.59.2023.07.17.21.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 21:57:03 -0700 (PDT)
From:   Costa Shulyupin <costa.shul@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Kim Phillips <kim.phillips@amd.com>,
        Yantengsi <siyanteng@loongson.cn>,
        Costa Shulyupin <costa.shul@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Kirti Wankhede <kwankhede@nvidia.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Mikhail Zaslonko <zaslonko@linux.ibm.com>,
        Eric DeVolder <eric.devolder@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list),
        linux-s390@vger.kernel.org (open list:S390 ARCHITECTURE),
        kvm@vger.kernel.org (open list:S390 VFIO-CCW DRIVER)
Subject: [PATCH] docs: move s390 under arch
Date:   Tue, 18 Jul 2023 07:55:02 +0300
Message-ID: <20230718045550.495428-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

and fix all in-tree references.

Architecture-specific documentation is being moved into Documentation/arch/
as a way of cleaning up the top-level documentation directory and making
the docs hierarchy more closely match the source hierarchy.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt   | 4 ++--
 Documentation/arch/index.rst                      | 2 +-
 Documentation/{ => arch}/s390/3270.ChangeLog      | 0
 Documentation/{ => arch}/s390/3270.rst            | 4 ++--
 Documentation/{ => arch}/s390/cds.rst             | 2 +-
 Documentation/{ => arch}/s390/common_io.rst       | 2 +-
 Documentation/{ => arch}/s390/config3270.sh       | 0
 Documentation/{ => arch}/s390/driver-model.rst    | 0
 Documentation/{ => arch}/s390/features.rst        | 0
 Documentation/{ => arch}/s390/index.rst           | 0
 Documentation/{ => arch}/s390/monreader.rst       | 0
 Documentation/{ => arch}/s390/pci.rst             | 2 +-
 Documentation/{ => arch}/s390/qeth.rst            | 0
 Documentation/{ => arch}/s390/s390dbf.rst         | 0
 Documentation/{ => arch}/s390/text_files.rst      | 0
 Documentation/{ => arch}/s390/vfio-ap-locking.rst | 0
 Documentation/{ => arch}/s390/vfio-ap.rst         | 0
 Documentation/{ => arch}/s390/vfio-ccw.rst        | 2 +-
 Documentation/{ => arch}/s390/zfcpdump.rst        | 0
 Documentation/driver-api/s390-drivers.rst         | 4 ++--
 MAINTAINERS                                       | 8 ++++----
 arch/s390/Kconfig                                 | 4 ++--
 arch/s390/include/asm/debug.h                     | 4 ++--
 drivers/s390/char/zcore.c                         | 2 +-
 kernel/Kconfig.kexec                              | 2 +-
 25 files changed, 21 insertions(+), 21 deletions(-)
 rename Documentation/{ => arch}/s390/3270.ChangeLog (100%)
 rename Documentation/{ => arch}/s390/3270.rst (99%)
 rename Documentation/{ => arch}/s390/cds.rst (99%)
 rename Documentation/{ => arch}/s390/common_io.rst (98%)
 rename Documentation/{ => arch}/s390/config3270.sh (100%)
 rename Documentation/{ => arch}/s390/driver-model.rst (100%)
 rename Documentation/{ => arch}/s390/features.rst (100%)
 rename Documentation/{ => arch}/s390/index.rst (100%)
 rename Documentation/{ => arch}/s390/monreader.rst (100%)
 rename Documentation/{ => arch}/s390/pci.rst (99%)
 rename Documentation/{ => arch}/s390/qeth.rst (100%)
 rename Documentation/{ => arch}/s390/s390dbf.rst (100%)
 rename Documentation/{ => arch}/s390/text_files.rst (100%)
 rename Documentation/{ => arch}/s390/vfio-ap-locking.rst (100%)
 rename Documentation/{ => arch}/s390/vfio-ap.rst (100%)
 rename Documentation/{ => arch}/s390/vfio-ccw.rst (99%)
 rename Documentation/{ => arch}/s390/zfcpdump.rst (100%)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a921507e7c32..aa8389262e31 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -553,7 +553,7 @@
 			others).
 
 	ccw_timeout_log	[S390]
-			See Documentation/s390/common_io.rst for details.
+			See Documentation/arch/s390/common_io.rst for details.
 
 	cgroup_disable=	[KNL] Disable a particular controller or optional feature
 			Format: {name of the controller(s) or feature(s) to disable}
@@ -598,7 +598,7 @@
 			Setting checkreqprot to 1 is deprecated.
 
 	cio_ignore=	[S390]
-			See Documentation/s390/common_io.rst for details.
+			See Documentation/arch/s390/common_io.rst for details.
 
 	clearcpuid=X[,X...] [X86]
 			Disable CPUID feature X for the kernel. See
diff --git a/Documentation/arch/index.rst b/Documentation/arch/index.rst
index 4b6b1beebad6..d39504fae12c 100644
--- a/Documentation/arch/index.rst
+++ b/Documentation/arch/index.rst
@@ -21,7 +21,7 @@ implementation.
    parisc/index
    ../powerpc/index
    ../riscv/index
-   ../s390/index
+   s390/index
    sh/index
    sparc/index
    x86/index
diff --git a/Documentation/s390/3270.ChangeLog b/Documentation/arch/s390/3270.ChangeLog
similarity index 100%
rename from Documentation/s390/3270.ChangeLog
rename to Documentation/arch/s390/3270.ChangeLog
diff --git a/Documentation/s390/3270.rst b/Documentation/arch/s390/3270.rst
similarity index 99%
rename from Documentation/s390/3270.rst
rename to Documentation/arch/s390/3270.rst
index e09e77954238..467eace91473 100644
--- a/Documentation/s390/3270.rst
+++ b/Documentation/arch/s390/3270.rst
@@ -116,7 +116,7 @@ Here are the installation steps in detail:
 	as a 3270, not a 3215.
 
 	5. Run the 3270 configuration script config3270.  It is
-	distributed in this same directory, Documentation/s390, as
+	distributed in this same directory, Documentation/arch/s390, as
 	config3270.sh.  Inspect the output script it produces,
 	/tmp/mkdev3270, and then run that script.  This will create the
 	necessary character special device files and make the necessary
@@ -125,7 +125,7 @@ Here are the installation steps in detail:
 	Then notify /sbin/init that /etc/inittab has changed, by issuing
 	the telinit command with the q operand::
 
-		cd Documentation/s390
+		cd Documentation/arch/s390
 		sh config3270.sh
 		sh /tmp/mkdev3270
 		telinit q
diff --git a/Documentation/s390/cds.rst b/Documentation/arch/s390/cds.rst
similarity index 99%
rename from Documentation/s390/cds.rst
rename to Documentation/arch/s390/cds.rst
index 7006d8209d2e..bcad2a14244a 100644
--- a/Documentation/s390/cds.rst
+++ b/Documentation/arch/s390/cds.rst
@@ -39,7 +39,7 @@ some of them are ESA/390 platform specific.
 
 Note:
   In order to write a driver for S/390, you also need to look into the interface
-  described in Documentation/s390/driver-model.rst.
+  described in Documentation/arch/s390/driver-model.rst.
 
 Note for porting drivers from 2.4:
 
diff --git a/Documentation/s390/common_io.rst b/Documentation/arch/s390/common_io.rst
similarity index 98%
rename from Documentation/s390/common_io.rst
rename to Documentation/arch/s390/common_io.rst
index 846485681ce7..6dcb40cb7145 100644
--- a/Documentation/s390/common_io.rst
+++ b/Documentation/arch/s390/common_io.rst
@@ -136,5 +136,5 @@ debugfs entries
 
   The level of logging can be changed to be more or less verbose by piping to
   /sys/kernel/debug/s390dbf/cio_*/level a number between 0 and 6; see the
-  documentation on the S/390 debug feature (Documentation/s390/s390dbf.rst)
+  documentation on the S/390 debug feature (Documentation/arch/s390/s390dbf.rst)
   for details.
diff --git a/Documentation/s390/config3270.sh b/Documentation/arch/s390/config3270.sh
similarity index 100%
rename from Documentation/s390/config3270.sh
rename to Documentation/arch/s390/config3270.sh
diff --git a/Documentation/s390/driver-model.rst b/Documentation/arch/s390/driver-model.rst
similarity index 100%
rename from Documentation/s390/driver-model.rst
rename to Documentation/arch/s390/driver-model.rst
diff --git a/Documentation/s390/features.rst b/Documentation/arch/s390/features.rst
similarity index 100%
rename from Documentation/s390/features.rst
rename to Documentation/arch/s390/features.rst
diff --git a/Documentation/s390/index.rst b/Documentation/arch/s390/index.rst
similarity index 100%
rename from Documentation/s390/index.rst
rename to Documentation/arch/s390/index.rst
diff --git a/Documentation/s390/monreader.rst b/Documentation/arch/s390/monreader.rst
similarity index 100%
rename from Documentation/s390/monreader.rst
rename to Documentation/arch/s390/monreader.rst
diff --git a/Documentation/s390/pci.rst b/Documentation/arch/s390/pci.rst
similarity index 99%
rename from Documentation/s390/pci.rst
rename to Documentation/arch/s390/pci.rst
index a1a72a47dc96..d5755484d8e7 100644
--- a/Documentation/s390/pci.rst
+++ b/Documentation/arch/s390/pci.rst
@@ -40,7 +40,7 @@ For example:
   Change the level of logging to be more or less verbose by piping
   a number between 0 and 6 to  /sys/kernel/debug/s390dbf/pci_*/level. For
   details, see the documentation on the S/390 debug feature at
-  Documentation/s390/s390dbf.rst.
+  Documentation/arch/s390/s390dbf.rst.
 
 Sysfs entries
 =============
diff --git a/Documentation/s390/qeth.rst b/Documentation/arch/s390/qeth.rst
similarity index 100%
rename from Documentation/s390/qeth.rst
rename to Documentation/arch/s390/qeth.rst
diff --git a/Documentation/s390/s390dbf.rst b/Documentation/arch/s390/s390dbf.rst
similarity index 100%
rename from Documentation/s390/s390dbf.rst
rename to Documentation/arch/s390/s390dbf.rst
diff --git a/Documentation/s390/text_files.rst b/Documentation/arch/s390/text_files.rst
similarity index 100%
rename from Documentation/s390/text_files.rst
rename to Documentation/arch/s390/text_files.rst
diff --git a/Documentation/s390/vfio-ap-locking.rst b/Documentation/arch/s390/vfio-ap-locking.rst
similarity index 100%
rename from Documentation/s390/vfio-ap-locking.rst
rename to Documentation/arch/s390/vfio-ap-locking.rst
diff --git a/Documentation/s390/vfio-ap.rst b/Documentation/arch/s390/vfio-ap.rst
similarity index 100%
rename from Documentation/s390/vfio-ap.rst
rename to Documentation/arch/s390/vfio-ap.rst
diff --git a/Documentation/s390/vfio-ccw.rst b/Documentation/arch/s390/vfio-ccw.rst
similarity index 99%
rename from Documentation/s390/vfio-ccw.rst
rename to Documentation/arch/s390/vfio-ccw.rst
index 37026fa18179..42960b7b0d70 100644
--- a/Documentation/s390/vfio-ccw.rst
+++ b/Documentation/arch/s390/vfio-ccw.rst
@@ -440,6 +440,6 @@ Reference
 1. ESA/s390 Principles of Operation manual (IBM Form. No. SA22-7832)
 2. ESA/390 Common I/O Device Commands manual (IBM Form. No. SA22-7204)
 3. https://en.wikipedia.org/wiki/Channel_I/O
-4. Documentation/s390/cds.rst
+4. Documentation/arch/s390/cds.rst
 5. Documentation/driver-api/vfio.rst
 6. Documentation/driver-api/vfio-mediated-device.rst
diff --git a/Documentation/s390/zfcpdump.rst b/Documentation/arch/s390/zfcpdump.rst
similarity index 100%
rename from Documentation/s390/zfcpdump.rst
rename to Documentation/arch/s390/zfcpdump.rst
diff --git a/Documentation/driver-api/s390-drivers.rst b/Documentation/driver-api/s390-drivers.rst
index 5158577bc29b..8c0845c4eee7 100644
--- a/Documentation/driver-api/s390-drivers.rst
+++ b/Documentation/driver-api/s390-drivers.rst
@@ -27,7 +27,7 @@ not strictly considered I/O devices. They are considered here as well,
 although they are not the focus of this document.
 
 Some additional information can also be found in the kernel source under
-Documentation/s390/driver-model.rst.
+Documentation/arch/s390/driver-model.rst.
 
 The css bus
 ===========
@@ -38,7 +38,7 @@ into several categories:
 * Standard I/O subchannels, for use by the system. They have a child
   device on the ccw bus and are described below.
 * I/O subchannels bound to the vfio-ccw driver. See
-  Documentation/s390/vfio-ccw.rst.
+  Documentation/arch/s390/vfio-ccw.rst.
 * Message subchannels. No Linux driver currently exists.
 * CHSC subchannels (at most one). The chsc subchannel driver can be used
   to send asynchronous chsc commands.
diff --git a/MAINTAINERS b/MAINTAINERS
index b68512f1b65f..2649dffe9f46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18642,7 +18642,7 @@ L:	linux-s390@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git
 F:	Documentation/driver-api/s390-drivers.rst
-F:	Documentation/s390/
+F:	Documentation/arch/s390/
 F:	arch/s390/
 F:	drivers/s390/
 F:	drivers/watchdog/diag288_wdt.c
@@ -18703,7 +18703,7 @@ M:	Niklas Schnelle <schnelle@linux.ibm.com>
 M:	Gerald Schaefer <gerald.schaefer@linux.ibm.com>
 L:	linux-s390@vger.kernel.org
 S:	Supported
-F:	Documentation/s390/pci.rst
+F:	Documentation/arch/s390/pci.rst
 F:	arch/s390/pci/
 F:	drivers/pci/hotplug/s390_pci_hpc.c
 
@@ -18720,7 +18720,7 @@ M:	Halil Pasic <pasic@linux.ibm.com>
 M:	Jason Herne <jjherne@linux.ibm.com>
 L:	linux-s390@vger.kernel.org
 S:	Supported
-F:	Documentation/s390/vfio-ap*
+F:	Documentation/arch/s390/vfio-ap*
 F:	drivers/s390/crypto/vfio_ap*
 
 S390 VFIO-CCW DRIVER
@@ -18730,7 +18730,7 @@ R:	Halil Pasic <pasic@linux.ibm.com>
 L:	linux-s390@vger.kernel.org
 L:	kvm@vger.kernel.org
 S:	Supported
-F:	Documentation/s390/vfio-ccw.rst
+F:	Documentation/arch/s390/vfio-ccw.rst
 F:	drivers/s390/cio/vfio_ccw*
 F:	include/uapi/linux/vfio_ccw.h
 
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 736548e4163e..286c1f9fb37c 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -264,9 +264,9 @@ config ARCH_SUPPORTS_KEXEC_PURGATORY
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 	help
-	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
+	  Refer to <file:Documentation/arch/s390/zfcpdump.rst> for more details on this.
 	  This option also enables s390 zfcpdump.
-	  See also <file:Documentation/s390/zfcpdump.rst>
+	  See also <file:Documentation/arch/s390/zfcpdump.rst>
 
 menu "Processor type and features"
 
diff --git a/arch/s390/include/asm/debug.h b/arch/s390/include/asm/debug.h
index ac665b9670c5..ccd4e148b5ed 100644
--- a/arch/s390/include/asm/debug.h
+++ b/arch/s390/include/asm/debug.h
@@ -222,7 +222,7 @@ static inline debug_entry_t *debug_text_event(debug_info_t *id, int level,
 
 /*
  * IMPORTANT: Use "%s" in sprintf format strings with care! Only pointers are
- * stored in the s390dbf. See Documentation/s390/s390dbf.rst for more details!
+ * stored in the s390dbf. See Documentation/arch/s390/s390dbf.rst for more details!
  */
 extern debug_entry_t *
 __debug_sprintf_event(debug_info_t *id, int level, char *string, ...)
@@ -350,7 +350,7 @@ static inline debug_entry_t *debug_text_exception(debug_info_t *id, int level,
 
 /*
  * IMPORTANT: Use "%s" in sprintf format strings with care! Only pointers are
- * stored in the s390dbf. See Documentation/s390/s390dbf.rst for more details!
+ * stored in the s390dbf. See Documentation/arch/s390/s390dbf.rst for more details!
  */
 extern debug_entry_t *
 __debug_sprintf_exception(debug_info_t *id, int level, char *string, ...)
diff --git a/drivers/s390/char/zcore.c b/drivers/s390/char/zcore.c
index 942c73a11ca3..bc3be0330f1d 100644
--- a/drivers/s390/char/zcore.c
+++ b/drivers/s390/char/zcore.c
@@ -3,7 +3,7 @@
  * zcore module to export memory content and register sets for creating system
  * dumps on SCSI/NVMe disks (zfcp/nvme dump).
  *
- * For more information please refer to Documentation/s390/zfcpdump.rst
+ * For more information please refer to Documentation/arch/s390/zfcpdump.rst
  *
  * Copyright IBM Corp. 2003, 2008
  * Author(s): Michael Holzheu
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index ff72e45cfaef..fa45726d5619 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -111,6 +111,6 @@ config CRASH_DUMP
 	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 	  For s390, this option also enables zfcpdump.
-	  See also <file:Documentation/s390/zfcpdump.rst>
+	  See also <file:Documentation/arch/s390/zfcpdump.rst>
 
 endmenu
-- 
2.41.0

