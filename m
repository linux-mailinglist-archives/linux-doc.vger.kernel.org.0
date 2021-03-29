Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D4734C2E8
	for <lists+linux-doc@lfdr.de>; Mon, 29 Mar 2021 07:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhC2FQn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Mar 2021 01:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhC2FQd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 01:16:33 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E698FC061574;
        Sun, 28 Mar 2021 22:16:32 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id i19so8542312qtv.7;
        Sun, 28 Mar 2021 22:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJ2pIQAj6hNXQlF9+MJ6ryyJO1pRdPWWHyrGxsZ/BqQ=;
        b=qgiRlnK6qh0wyTWfdAlQX8zYu9IZTlENDvczzSnFMbYzzelwabB8J/3h3RGAY/4WPh
         ySXXxuBLKJFsb+H0kSp5nCREgXWrYBfSX7cFhwCoRhStrQzg8aMrtPWBU6frxmeOE3T+
         fFItbYJ+CQ87BkEvlilP/lvupOD/vMDC4PdGEFHNiqGr8WqIwJM5crRR4XzTOVZlZIEK
         Zb8SycLq4Na1d+KPE+QatQ9CYwmSY6kntbIjwlD2glOI2fv3HL34fymmjoeE6OV3Ijq6
         6YWG4JWzXCRWuNO6++0iof2g3UPwuIqBYagie4SumfNsYsVIruJuauvBFhDZ8zUxt+6C
         fjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJ2pIQAj6hNXQlF9+MJ6ryyJO1pRdPWWHyrGxsZ/BqQ=;
        b=mVz7KItUS1RAUakCcZbgLcRcYw3prFETsaoboubFX0zqu7kg6vaZTjUsZs+uj9lJ9N
         WzsfGNvdEkYJtm6e1oEE5NV+WdVB4V0x2aBBdXlZCbCRXJK1iYDclkwpf0Q3oMb/80YD
         dMI2bOCIt5V57yo84hbqJntOltGsD0jr8ciJLB8ILfKWkFMGqX+7a4vhfWz93ynyy0JH
         iqYrzftwLwTCZZvxhw+cSRzy05RKPFxAYpkFgXRj4zl6hlZjS8HDIjF060ggxRXpec/q
         Knn9FAUMnBgeWto8vJSC1uNY5jqvjekb4ZKdRehIwzFKoNt75FiMEi7gFDl2/13H+3oE
         ztPw==
X-Gm-Message-State: AOAM532nPH0WWX5+GoHILdWFJNaGyF1uzm8SvMGML+HaDqEmLlllSh3u
        FdTDFKEzNAui1r0p4ybuceY=
X-Google-Smtp-Source: ABdhPJy5DituB/NQxsNqYqP5IzM7gnpwJs0z4CEEE53fUGDCU9PSsBg1Hmh2I+s4nAgJyEpHxbtAPw==
X-Received: by 2002:ac8:5e8d:: with SMTP id r13mr22183088qtx.138.1616994991751;
        Sun, 28 Mar 2021 22:16:31 -0700 (PDT)
Received: from localhost.localdomain ([156.146.37.195])
        by smtp.gmail.com with ESMTPSA id z124sm12993181qke.36.2021.03.28.22.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 22:16:31 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, rdunlap@infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 19/23] scsi: ChangeLog.ncr53c8xx: Quite a few spello fixes
Date:   Mon, 29 Mar 2021 10:42:55 +0530
Message-Id: <161a19e9e3ef1faaab73b3e44acd621106c7dba6.1616992679.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616992679.git.unixbhaskar@gmail.com>
References: <cover.1616992679.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Few trivial spelling fixes.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Few lines have done self modification, means they eliminate and added
 themselves. I have no clue why that happen.

 Documentation/scsi/ChangeLog.ncr53c8xx | 260 ++++++++++++-------------
 1 file changed, 130 insertions(+), 130 deletions(-)

diff --git a/Documentation/scsi/ChangeLog.ncr53c8xx b/Documentation/scsi/ChangeLog.ncr53c8xx
index 9288e3d8974a..0dacfeef22a5 100644
--- a/Documentation/scsi/ChangeLog.ncr53c8xx
+++ b/Documentation/scsi/ChangeLog.ncr53c8xx
@@ -9,8 +9,8 @@ Mon Feb 12 22:30 2001 Gerard Roudier (groudier@club-internet.fr)
 	- Call pci_enable_device() as AC wants this to be done.
 	- Get both the BAR cookies actual and PCI BAR values.
 	  (see Changelog.sym53c8xx rev. 1.7.3 for details)
-	- Merge changes for linux-2.4 that declare the host template
-	  in the driver object also when the driver is statically
+	- Merge changes for linux-2.4 that declare the host template
+	  in the driver object also when the driver is statically
 	  linked with the kernel.

 Sun Sep 24 21:30 2000 Gerard Roudier (groudier@club-internet.fr)
@@ -25,34 +25,34 @@ Wed Jul 26 23:30 2000 Gerard Roudier (groudier@club-internet.fr)
 Sun Jul 09 16:30 2000 Gerard Roudier (groudier@club-internet.fr)
 	* version ncr53c8xx-3.4.0
 	- Remove the PROFILE C and SCRIPTS code.
-	  This facility was not this useful and thus was not longer
+	  This facility was not this useful and thus was not longer
 	  desirable given the increasing complexity of the driver code.
 	- Merges from FreeBSD sym-1.6.2 driver:
-	  * Clarify memory barriers needed by the driver for architectures
+	  * Clarify memory barriers needed by the driver for architectures
 	    that implement a weak memory ordering.
 	- General cleanup:
-	  Move definitions for barriers and IO/MMIO operations to the
-	  sym53c8xx_defs.h header files. They are now shared by the
+	  Move definitions for barriers and IO/MMIO operations to the
+	  sym53c8xx_defs.h header files. They are now shared by the
 	  both drivers.
 	  Use SCSI_NCR_IOMAPPED instead of NCR_IOMAPPED.

 Thu May 11   12:30 2000 Pam Delaney (pam.delaney@lsil.com)
 	* revision 3.3b
-
+
 Mon Apr 24 12:00 2000 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.2i
 	- Return value 1 (instead of 0) from the driver setup routine.
-	- Let the driver also attach controllers that have been set to
+	- Let the driver also attach controllers that have been set to
 	  OFF in the NVRAM as it did prior to revision 3.2g.

 Sat Apr 1  12:00 2000 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.2h
 	- Fix a compilation problem on Alpha introduced in version 3.2g.
           (`port' changed to `base_io').
-	- Move from `sym' to this driver a tiny change for __sparc__ that
+	- Move from `sym' to this driver a tiny change for __sparc__ that
 	  applies to cache line size (? Probably from David S Miller).
-	- Make sure no data transfer will happen for Scsi_Cmnd requests
-	  that supply SCSI_DATA_NONE direction (this avoids some BUG()
+	- Make sure no data transfer will happen for Scsi_Cmnd requests
+	  that supply SCSI_DATA_NONE direction (this avoids some BUG()
 	  statement in the PCI code when a data buffer is also supplied).

 Thu Mar 16   9:30 2000 Pam Delaney (pam.delaney@lsil.com)
@@ -62,10 +62,10 @@ Thu Mar 16   9:30 2000 Pam Delaney (pam.delaney@lsil.com)

 Mon March 6  23:15 2000 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.2g
-	- Add the file sym53c8xx_comm.h that collects code that should
-	  be shared by sym53c8xx and ncr53c8xx drivers. For now, it is
-	  a header file that is only included by the ncr53c8xx driver,
-	  but things will be cleaned up later. This code addresses
+	- Add the file sym53c8xx_comm.h that collects code that should
+	  be shared by sym53c8xx and ncr53c8xx drivers. For now, it is
+	  a header file that is only included by the ncr53c8xx driver,
+	  but things will be cleaned up later. This code addresses
 	  notably:
 	  * Chip detection and PCI related initialisations
 	  * NVRAM detection and reading
@@ -74,7 +74,7 @@ Mon March 6  23:15 2000 Gerard Roudier (groudier@club-internet.fr)
 	  * And some other ...
 	- Add support for the new dynamic dma mapping kernel interface.
 	  Requires Linux-2.3.47 (tested with pre-2.3.47-6).
-	- Get data transfer direction from the scsi command structure
+	- Get data transfer direction from the scsi command structure
 	  (Scsi_Cmnd) when this information is available.

 Mon March 6  23:15 2000 Gerard Roudier (groudier@club-internet.fr)
@@ -96,12 +96,12 @@ Mon March 6  23:15 2000 Gerard Roudier (groudier@club-internet.fr)

 Fri Jan 14 14:00 2000 Pam Delaney (pam.delaney@lsil.com)
 	* revision pre-3.3b-1
-	- Merge parallel driver series 3.31 and 3.2e
+	- Merge parallel driver series 3.31 and 3.2e

 Tue Jan 11 14:00 2000 Pam Delaney (pam.delaney@lsil.com)
 	* revision 3.31
 	- Added support for mounting disks on wide-narrow-wide
-	  scsi configurations.
+	  scsi configurations.
 	- Built off of version 3.30

 Mon Jan 10 13:30 2000 Pam Delaney (pam.delaney@lsil.com)
@@ -119,24 +119,24 @@ Sat Jan 8  22:00 2000 Gerard Roudier (groudier@club-internet.fr)

 Mon Dec 6  22:00 1999 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.2d
-	- Change messages written by the driver at initialisation and
+	- Change messages written by the driver at initialisation and
 	  through the /proc FS (rather cosmetic changes that consist in
 	  printing out the PCI bus number and device/function).
-	- Get rid of the old PCI bios interface, but preserve kernel 2.0
+	- Get rid of the old PCI bios interface, but preserve kernel 2.0
 	  compatibility from a simple wrapper.
-	- Remove the compilation condition about having to acquire the
+	- Remove the compilation condition about having to acquire the
 	  io_request_lock since it seems to be a definite feature now.:)
 	- proc_dir structure no longer needed for kernel >= 2.3.27.
-	- Change the driver detection code by the sym53c8xx one, modulo
-	  some minor changes. The driver can now attach any number of
-	  controllers (>40) and does no longer hoger stack space at
+	- Change the driver detection code by the sym53c8xx one, modulo
+	  some minor changes. The driver can now attach any number of
+	  controllers (>40) and does no longer hoger stack space at
 	  initialisation.
-	- Definitely disable overlapped PCI arbitration for all dual
-	  function chips, since I cannot make sure for what chip revisions
+	- Definitely disable overlapped PCI arbitration for all dual
+	  function chips, since I cannot make sure for what chip revisions
 	  it is actually safe.
 	- Add support for the SYM53C1510D.
 	- Update the poor Tekram sync factor table.
-	- Remove the compilation condition about having to acquire the
+	- Remove the compilation condition about having to acquire the
 	  io_request_lock since it seems to be a definite feature now.:)
 	- proc_dir structure no longer needed for kernel >= 2.3.27.

@@ -145,25 +145,25 @@ Sat Sep 11  18:00 1999 Gerard Roudier (groudier@club-internet.fr)
 	- Handle correctly (hopefully) jiffies wrap-around.
 	- Restore the entry used to detect 875 until revision 0xff.
 	  (I removed it inadvertently, it seems :) )
-	- Replace __initfunc() which is deprecated stuff by __init which
+	- Replace __initfunc() which is deprecated stuff by __init which
 	  is not yet so. ;-)
 	- Add support of some 'resource handling' for linux-2.3.13.
-	  Basically the BARs have been changed to something more complex
+	  Basically the BARs have been changed to something more complex
 	  in the pci_dev structure.
 	- Remove some deprecated code.

 Sat May 10  11:00 1999 Gerard Roudier (groudier@club-internet.fr)
 	* revision pre-3.2b-1
 	- Support for the 53C895A by Pamela Delaney <pam.delaney@lsil.com>
-	  The 53C895A contains all of the features of the 896 but has only
-	  one channel and has a 32 bit PCI bus. It does 64 bit PCI addressing
+	  The 53C895A contains all of the features of the 896 but has only
+	  one channel and has a 32 bit PCI bus. It does 64 bit PCI addressing
 	  using dual cycle PCI data transfers.
 	- Miscellaneous minor fixes.
 	- Some additions to the README.ncr53c8xx file.

 Sun Apr 11  10:00 1999 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.2a
-	- Add 'hostid:#id' boot option. This option allows to change the
+	- Add 'hostid:#id' boot option. This option allows to change the
 	  default SCSI id the driver uses for controllers.
 	- Remove nvram layouts and driver set-up structures from the C source,
 	  and use the one defined in sym53c8xx_defs.h file.
@@ -172,20 +172,20 @@ Sun Apr 11  10:00 1999 Gerard Roudier (groudier@club-internet.fr)

 Thu Mar 11  23:00 1999 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.2	  (8xx-896 driver bundle)
-	- Only define the host template in ncr53c8xx.h and include the
+	- Only define the host template in ncr53c8xx.h and include the
 	  sym53c8xx_defs.h file.
-	- Declare static all symbols that do not need to be visible from
+	- Declare static all symbols that do not need to be visible from
 	  outside the driver code.
-	- Add 'excl' boot command option that allows to pass to the driver
+	- Add 'excl' boot command option that allows to pass to the driver
 	  io address of devices not to attach.
-	- Add info() function called from the host template to print
+	- Add info() function called from the host template to print
 	  driver/host information.
 	- Minor documentation additions.

 Sat Mar 6  11:00 1999 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.1h
-	- Fix some oooold bug that hangs the bus if a device rejects a
-	  negotiation. Btw, the corresponding stuff also needed some cleanup
+	- Fix some oooold bug that hangs the bus if a device rejects a
+	  negotiation. Btw, the corresponding stuff also needed some cleanup
 	  and thus the change is a bit larger than it could have been.
 	- Still some typo that made compilation fail for 64 bit (trivial fix).

@@ -193,14 +193,14 @@ Sun Feb  14:00 1999 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.1g
 	- Deal correctly with 64 bit PCI address registers on Linux 2.2.
 	  Pointed out by Leonard Zubkoff.
-	- Allow to tune request_irq() flags from the boot command line using
+	- Allow to tune request_irq() flags from the boot command line using
 	  ncr53c8xx=irqm:??, as follows:
 	  a) If bit 0x10 is set in irqm, IRQF_SHARED flag is not used.
 	  b) If bit 0x20 is set in irqm, IRQF_DISABLED flag is not used.
 	  By default the driver uses both IRQF_SHARED and IRQF_DISABLED.
-	  Option 'ncr53c8xx=irqm:0x20' may be used when an IRQ is shared by
+	  Option 'ncr53c8xx=irqm:0x20' may be used when an IRQ is shared by
 	  a 53C8XX adapter and a network board.
-	- Tiny misspelling fixed (ABORT instead of ABRT). Was fortunately
+	- Tiny misspelling fixed (ABORT instead of ABRT). Was fortunately
 	  harmless.
 	- Negotiate SYNC data transfers with CCS devices.

@@ -214,12 +214,12 @@ Sat Jan 16  17:30 1999 Gerard Roudier (groudier@club-internet.fr)
 Sun Dec 13  18:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.1e
 	- Same work-around as for the 53c876 rev <= 0x15 for 53c896 rev 1:
-	  Disable overlapped arbitration. This will not make difference
+	  Disable overlapped arbitration. This will not make difference
 	  since the chip has on-chip RAM.

 Thu Nov 26  22:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.1d
-	- The SISL RAID change requires now remap_pci_mem() stuff to be
+	- The SISL RAID change requires now remap_pci_mem() stuff to be
 	  compiled for __i386__ when normal IOs are used.
 	- Minor spelling fixes in doc files.

@@ -228,9 +228,9 @@ Sat Nov 21  18:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	- Ignore chips that are driven by SISL RAID (DAC 960).
 	  Change sent by Leonard Zubkoff and slightly reworked.
 	- Still a buglet in the tags initial settings that needed to be fixed.
-	  It was not possible to disable TGQ at system startup for devices
-	  that claim TGQ support. The driver used at least 2 for the queue
-	  depth but did'nt keep track of user settings for tags depth lower
+	  It was not possible to disable TGQ at system startup for devices
+	  that claim TGQ support. The driver used at least 2 for the queue
+	  depth but didn't keep track of user settings for tags depth lower
 	  than 2.

 Wed Nov 11  10:00 1998 Gerard Roudier (groudier@club-internet.fr)
@@ -244,54 +244,54 @@ Wed Oct 21 21:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	- Changes from Eddie Dost for Sparc and Alpha:
 	  ioremap/iounmap support for Sparc.
 	  pcivtophys changed to bus_dvma_to_phys.
-	- Add the 53c876 description to the chip table. This is only useful
+	- Add the 53c876 description to the chip table. This is only useful
 	  for printing the right name of the controller.
 	- DEL-441 Item 2 work-around for the 53c876 rev <= 5 (0x15).
 	- Add additional checking of INQUIRY data:
-	  Check INQUIRY data received length is at least 7. Byte 7 of
-	  inquiry data contains device features bits and the driver might
+	  Check INQUIRY data received length is at least 7. Byte 7 of
+	  inquiry data contains device features bits and the driver might
 	  be confused by garbage. Also check peripheral qualifier.
 	- Cleanup of the SCSI tasks management:
-	  Remove the special case for 32 tags. Now the driver only uses the
+	  Remove the special case for 32 tags. Now the driver only uses the
 	  scheme that allows up to 64 tags per LUN.
 	  Merge some code from the 896 driver.
-	  Use a 1,3,5,...MAXTAGS*2+1 tag numbering. Previous driver could
-	  use any tag number from 1 to 253 and some non conformant devices
+	  Use a 1,3,5,...MAXTAGS*2+1 tag numbering. Previous driver could
+	  use any tag number from 1 to 253 and some non conformant devices
 	  might have problems with large tag numbers.
-	- 'no_sync' changed to 'no_disc' in the README file. This is an old
-	  and trivial mistake that seems to demonstrate the README file is
+	- 'no_sync' changed to 'no_disc' in the README file. This is an old
+	  and trivial mistake that seems to demonstrate the README file is
 	  not often read. :)

 Sun Oct  4 14:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.0i
-	- Cosmetic changes for sparc (but not for the driver) that needs
+	- Cosmetic changes for sparc (but not for the driver) that needs
 	  __irq_itoa() to be used for printed IRQ value to be understandable.
-	- Some problems with the driver that didn't occur using driver 2.5f
-	  were due to a SCSI selection problem triggered by a clearly
-	  documented feature that in fact seems not to work: (53C8XX chips
-	  are claimed by the manuals to be able to execute SCSI scripts just
-	  after abitration while the SCSI core is performing SCSI selection).
+	- Some problems with the driver that didn't occur using driver 2.5f
+	  were due to a SCSI selection problem triggered by a clearly
+	  documented feature that in fact seems not to work: (53C8XX chips
+	  are claimed by the manuals to be able to execute SCSI scripts just
+	  after arbitration while the SCSI core is performing SCSI selection).
 	  This optimization is broken and has been removed.
-	- Some broken scsi devices are confused when a negotiation is started
-	  on a LUN that does not correspond to a real device. According to
-	  SCSI specs, this is a device firmware bug. This has been worked
-	  around by only starting negotiation if the LUN has previously be
+	- Some broken scsi devices are confused when a negotiation is started
+	  on a LUN that does not correspond to a real device. According to
+	  SCSI specs, this is a device firmware bug. This has been worked
+	  around by only starting negotiation if the LUN has previously be
 	  used for at least 1 successful SCSI command.
-	- The 'last message sent' printed out on M_REJECT message reception
-	  was read from the SFBR i/o register after the previous message had
-	  been sent.
-	  This was not correct and affects all previous driver versions and
-	  the original FreeBSD one as well. The SCSI scripts has been fixed
+	- The 'last message sent' printed out on M_REJECT message reception
+	  was read from the SFBR i/o register after the previous message had
+	  been sent.
+	  This was not correct and affects all previous driver versions and
+	  the original FreeBSD one as well. The SCSI scripts has been fixed
 	  so that it now provides the right information to the C code.

 Sat Jul 18 13:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.0g
 	- Preliminary fixes for Big Endian (sent by Eddie C. Dost).
 	  Big Endian architectures should work again with the driver.
-	  Eddie's patch has been partially applied since current 2.1.109
+	  Eddie's patch has been partially applied since current 2.1.109
 	  does not have all the Sparc changes of the vger tree.
 	- Use of BITS_PER_LONG instead of (~0UL == 0xffffffffUL) has fixed
-	  the problem observed when the driver was compiled using EGCS or
+	  the problem observed when the driver was compiled using EGCS or
 	  PGCC.

 Mon Jul 13 20:00 1998 Gerard Roudier (groudier@club-internet.fr)
@@ -299,19 +299,19 @@ Mon Jul 13 20:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	- Some spelling fixes.
 	- linux/config.h misplaced in ncr53c8xx.h
 	- MODULE_PARM stuff added for linux 2.1.
-	- check INQUIRY response data format is exactly 2.
-	- use BITS_PER_LONG if defined.
+	- check INQUIRY response data format is exactly 2.
+	- use BITS_PER_LONG if defined.

 Sun Jun 28 12:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.0e
-	- Some cleanup, spelling fixes, version checks, documentations
+	- Some cleanup, spelling fixes, version checks, documentations
 	  changes, etc ...

 Sat Jun 20 20:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.0c
-	- Add a boot setup option that allows to set up device queue depths
-	  at boot-up. This option is very useful since Linux does not
-	  allow to change scsi device queue depth once the system has been
+	- Add a boot setup option that allows to set up device queue depths
+	  at boot-up. This option is very useful since Linux does not
+	  allow to change scsi device queue depth once the system has been
 	  booted up.

 Sun Jun 15 23:00 1998 Gerard Roudier (groudier@club-internet.fr)
@@ -319,25 +319,25 @@ Sun Jun 15 23:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	- Support for up to 64 TAGS per LUN.
 	- Rewrite the TARGET vs LUN capabilities management.
 	  CmdQueue is now handled as a LUN capability as it shall be.
-	  This also fixes a bug triggered when disabling tagged command
+	  This also fixes a bug triggered when disabling tagged command
 	  queuing for a device that had this feature enabled.
-	- Remove the ncr_opennings() stuff that was useless under Linux
+	- Remove the ncr_opennings() stuff that was useless under Linux
 	  and hard to understand to me.
-	- Add "setverbose" procfs driver command. It allows to tune
-	  verbose level after boot-up. Setting this level to zero, for
+	- Add "setverbose" procfs driver command. It allows to tune
+	  verbose level after boot-up. Setting this level to zero, for
 	  example avoid flooding the syslog file.
 	- Add KERN_XXX to some printk's.

 Tue Jun 10 23:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 3.0
 	- Linux config changes for 2.0.34:
-	  Remove NVRAM detection config option. This option is now enabled
+	  Remove NVRAM detection config option. This option is now enabled
 	  by default but can be disabled by editing the driver header file.
 	  Add a PROFILE config option.
 	- Update Configure.help
-	- Add calls to new function mdelay() for milli-seconds delay if
+	- Add calls to new function mdelay() for milli-seconds delay if
 	  kernel version >= 2.1.105.
-	- Replace all printf(s) by printk(s). After all, the ncr53c8xx is
+	- Replace all printf(s) by printk(s). After all, the ncr53c8xx is
 	  a driver for Linux.
 	- Perform auto-sense on COMMAND TERMINATED. Not sure it is useful.
 	- Some other minor changes.
@@ -347,40 +347,40 @@ Tue Jun 4 23:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	- Code cleanup and simplification:
 	  Remove kernel 1.2.X and 1.3.X support.
 	  Remove the _old_ target capabilities table.
-	  Remove the error recovery code that have'nt been really useful.
-	  Use a single alignment boundary (CACHE_LINE_SIZE) for data
+	  Remove the error recovery code that haven't been really useful.
+	  Use a single alignment boundary (CACHE_LINE_SIZE) for data
 	  structures.
 	- Several aggressive SCRIPTS optimizations and changes:
 	  Reselect SCRIPTS code rewritten.
 	  Support for selection/reselection without ATN.
 	  And some others.
-	- Miscallaneous changes in the C code:
+	- Miscellaneous changes in the C code:
 	  Count actual number of CCB queued to the controller (future use).
 	  Lots of other minor changes.

 Wed May 13 20:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 2.6m
-	- Problem of missed SCSI bus reset with the 53C895 fixed by
-	  Richard Waltham. The 53C895 needs about 650 us for the bus
-	  mode to settle. Delays used while resetting the controller
+	- Problem of missed SCSI bus reset with the 53C895 fixed by
+	  Richard Waltham. The 53C895 needs about 650 us for the bus
+	  mode to settle. Delays used while resetting the controller
 	  and the bus have been adjusted. Thanks Richard!
 	- Some simplification for 64 bit arch done ccb address testing.
 	- Add a check of the MSG_OUT phase after Selection with ATN.
-	- The new tagged queue stuff seems ok, so some informationnal
-	  message have been conditionned by verbose >= 3.
-	- Donnot reset if a SBMC interrupt reports the same bus mode.
-	- Print out the whole driver set-up. Some options were missing and
+	- The new tagged queue stuff seems ok, so some informational
+	  message have been conditioned by verbose >= 3.
+	- Don not reset if a SBMC interrupt reports the same bus mode.
+	- Print out the whole driver set-up. Some options were missing and
 	  the print statement was misplaced for modules.
-	- Ignore a SCSI parity interrupt if the chip is not connected to
+	- Ignore a SCSI parity interrupt if the chip is not connected to
 	  the SCSI bus.

 Sat May 1 16:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 2.6l
-	- Add CCB done queue support for Alpha and perhaps some other
+	- Add CCB done queue support for Alpha and perhaps some other
 	  architectures.
-	- Add some barriers to enforce memory ordering for x86 and
+	- Add some barriers to enforce memory ordering for x86 and
 	  Alpha architectures.
-	- Fix something that looks like an old bug in the nego SIR
+	- Fix something that looks like an old bug in the nego SIR
 	  interrupt code in case of negotiation failure.

 Sat Apr 25 21:00 1998 Gerard Roudier (groudier@club-internet.fr)
@@ -388,11 +388,11 @@ Sat Apr 25 21:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	- Remove all accesses to the on-chip RAM from the C code:
 	  Use SCRIPTS to load the on-chip RAM.
 	  Use SCRIPTS to repair the start queue on selection timeout.
-	  Use the copy of script in main memory to calculate the chip
+	  Use the copy of script in main memory to calculate the chip
 	  context on phase mismatch.
-	- The above allows now to use the on-chip RAM without requiring
-	  to get access to the on-chip RAM from the C code. This makes
-	  on-chip RAM useable for linux-1.2.13 and for Linux-Alpha for
+	- The above allows now to use the on-chip RAM without requiring
+	  to get access to the on-chip RAM from the C code. This makes
+	  on-chip RAM useable for linux-1.2.13 and for Linux-Alpha for
 	  instance.
 	- Some simplifications and cleanups in the SCRIPTS and C code.
 	- Buglet fixed in parity error recovery SCRIPTS (never tested).
@@ -402,28 +402,28 @@ Wed Apr 15 21:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 2.6j
 	- Incorporate changes from linux-2.1.95 ncr53c8xx driver version.
 	- Add SMP support for linux-2.1.95 and above.
-	- Fix a bug when QUEUE FULL is returned and no commands are
-	  disconnected. This happens with Atlas I / L912 and may happen
+	- Fix a bug when QUEUE FULL is returned and no commands are
+	  disconnected. This happens with Atlas I / L912 and may happen
 	  with Atlas II / LXY4.
-	- Nail another one on CHECK condition when requeuing the command
+	- Nail another one on CHECK condition when requeuing the command
 	  for auto-sense.
-	- Call scsi_done() for all completed commands after interrupt
+	- Call scsi_done() for all completed commands after interrupt
 	  handling.
 	- Increase the done queue to 24 entries.

 Sat Apr 4 20:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 2.6i
-	- CTEST0 is used by the 53C885 for Power Management and
+	- CTEST0 is used by the 53C885 for Power Management and
 	  priority setting between the 2 functions.
-	  Use SDID instead as actual target number. Just have had to
+	  Use SDID instead as actual target number. Just have had to
 	  overwrite it with SSID on reselection.
 	- Split DATA_IN and DATA_OUT scripts into 2 sub-scripts.
 	  64 segments are moved from on-chip RAM scripts.
-	  If more segments, a script in main memory is used for the
+	  If more segments, a script in main memory is used for the
 	  additional segments.
-	- Since the SCRIPTS processor continues SCRIPTS execution after
-	  having won arbitration, do some stuff prior to testing any SCSI
-	  phase on reselection. This should have the vertue to process
+	- Since the SCRIPTS processor continues SCRIPTS execution after
+	  having won arbitration, do some stuff prior to testing any SCSI
+	  phase on reselection. This should have the virtue to process
 	  scripts in parallel with the SCSI core performing selection.
 	- Increase the done queue to 12 entries.

@@ -436,21 +436,21 @@ Tue Mar 26 23:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	- New done queue. 8 entries by default (6 always useable).
 	  Can be increased if needed.
 	- Resources management using doubly linked queues.
-	- New auto-sense and QUEUE FULL handling that does not need to
+	- New auto-sense and QUEUE FULL handling that does not need to
 	  stall the NCR queue any more.
 	- New CCB starvation avoiding algorithm.
-	- Prepare CCBs for SCSI commands that cannot be queued, instead of
-	  inserting these commands into the waiting list. The waiting list
-	  is now only used while resetting and when memory for CCBs is not
+	- Prepare CCBs for SCSI commands that cannot be queued, instead of
+	  inserting these commands into the waiting list. The waiting list
+	  is now only used while resetting and when memory for CCBs is not
 	  yet available?

 Sun Feb 8 22:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	* revision 2.6f
-	- Some fixes in order to really support the 53C895, at least with
+	- Some fixes in order to really support the 53C895, at least with
 	  FAST-20 devices.
-	- Heavy changes in the target/lun resources management to allow
-	  the scripts to jump directly to the CCB on reselection instead
-	  of walking on the lun CCBs list. Up to 32 tags per lun are now
+	- Heavy changes in the target/lun resources management to allow
+	  the scripts to jump directly to the CCB on reselection instead
+	  of walking on the lun CCBs list. Up to 32 tags per lun are now
 	  supported without script processor and PCI traffic overhead.

 Sun Jan 11 22:00 1998 Gerard Roudier (groudier@club-internet.fr)
@@ -458,14 +458,14 @@ Sun Jan 11 22:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	- new (different ?) implementation of the start queue:
           Use a simple CALL to a launch script in the CCB.
 	- implement a minimal done queue (1 entry :-) ).
-          this avoid scanning all CCBs on INT FLY (Only scan all CCBs, on
-          overflow). Hit ratio is better than 99.9 % on my system, so no
+          this avoid scanning all CCBs on INT FLY (Only scan all CCBs, on
+          overflow). Hit ratio is better than 99.9 % on my system, so no
           need to have a larger done queue.
-	- generalization of the restart of CCB on special condition as
+	- generalization of the restart of CCB on special condition as
           Abort, QUEUE FULL, CHECK CONDITION.
           This has been called 'silly scheduler'.
-	- make all the profiling code conditionned by a config option.
-	  This spare some PCI traffic and C code when this feature is not
+	- make all the profiling code conditioned by a config option.
+	  This spare some PCI traffic and C code when this feature is not
           needed.
 	- handle more cleanly the situation where direction is unknown.
 	  The pointers patching is now performed by the SCRIPTS processor.
@@ -473,9 +473,9 @@ Sun Jan 11 22:00 1998 Gerard Roudier (groudier@club-internet.fr)

 	Ported from driver 2.5 series:
         ------------------------------
-	- Use FAST-5 instead of SLOW for slow scsi devices according to
+	- Use FAST-5 instead of SLOW for slow scsi devices according to
 	  new SPI-2 draft.
-	- Make some changes in order to accommodate with 875 rev <= 3
+	- Make some changes in order to accommodate with 875 rev <= 3
 	  device errata listing 397. Minor consequences are:
 	  . Leave use of PCI Write and Invalidate under user control.
 	    Now, by default the driver does not enable PCI MWI and option
@@ -484,12 +484,12 @@ Sun Jan 11 22:00 1998 Gerard Roudier (groudier@club-internet.fr)
 	  . Programmed burst length set to 64 DWORDS (instead of 128).
 	    (Note: SYMBIOS uses 32 DWORDS for the SDMS BIOS)
 	- Add 'buschk' boot option.
-	  This option enables checking of SCSI BUS data lines after SCSI
+	  This option enables checking of SCSI BUS data lines after SCSI
 	  RESET (set by default). (Submitted by Richard Waltham).
 	- Update the README file.
-	- Dispatch CONDITION MET and RESERVATION CONFLICT scsi status
+	- Dispatch CONDITION MET and RESERVATION CONFLICT scsi status
 	  as OK driver status.
-	- Update the README file and the Symbios NVRAM format definition
+	- Update the README file and the Symbios NVRAM format definition
 	  with removable media flags values (available with SDMS 4.09).
 	- Several PCI configuration registers fix-ups for powerpc.
 	  (Patch sent by Cort).
--
2.26.3

