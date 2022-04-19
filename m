Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB18850618F
	for <lists+linux-doc@lfdr.de>; Tue, 19 Apr 2022 03:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239259AbiDSBNJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Apr 2022 21:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236531AbiDSBNI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Apr 2022 21:13:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B3713D18;
        Mon, 18 Apr 2022 18:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=ur1GxSEI3xLj6jrLzz3uREYLPjnw1iq8rIvwhb0NSds=; b=OIIZMY4Du6Pj0w0apAFw9omzvA
        TU7XLtZDBTSx4PdgA6w3FgNbuO8NzG6gv2Fm2b3KMQ4wiwEpRWWfYzdpQaglajo8xnak7oj9f/6yA
        x2/VX7/kxzE4IH8P1X6ZCzrRRdwLuBI0d1GqiNQxU2GG38czEfnGIpZcATGpIOgloDkzlYTyPMRMn
        jBxpfIV4sLLqqPubgQCWdh1x5mM67+ajEFNLVwn86aKkPiIjDyLvF0g8ZAybvbRNX1uvwP9LX8ml5
        nKa6KT2oYoKlyWXlAekL3IMg5u12fMR+GTQ2Gda1mepV6EGG8zpnXZHe8cxg0ziWAWPlKspwfvBqr
        Jvh5ZTjA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ngcNr-0011W6-0I; Tue, 19 Apr 2022 01:10:23 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        linux-ide@vger.kernel.org, linux-block@vger.kernel.org
Subject: [PATCH] Drop Documentation/ide/
Date:   Mon, 18 Apr 2022 18:10:21 -0700
Message-Id: <20220419011021.15527-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Drop all Documentation/ide/ since IDE support was deleted by
Christoph Hellwig <hch@lst.de>, Jun 16 2021.

Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: linux-ide@vger.kernel.org
Cc: linux-block@vger.kernel.org
---
 Documentation/ide/ChangeLog.ide-cd.1994-2004  | 268 ------------------
 .../ide/ChangeLog.ide-floppy.1996-2002        |  63 ----
 .../ide/ChangeLog.ide-tape.1995-2002          | 257 -----------------
 Documentation/ide/changelogs.rst              |  17 --
 Documentation/ide/ide-tape.rst                |  68 -----
 Documentation/ide/ide.rst                     | 265 -----------------
 Documentation/ide/index.rst                   |  21 --
 Documentation/ide/warm-plug-howto.rst         |  18 --
 Documentation/index.rst                       |   1 -
 9 files changed, 978 deletions(-)
 delete mode 100644 Documentation/ide/ChangeLog.ide-cd.1994-2004
 delete mode 100644 Documentation/ide/ChangeLog.ide-floppy.1996-2002
 delete mode 100644 Documentation/ide/ChangeLog.ide-tape.1995-2002
 delete mode 100644 Documentation/ide/changelogs.rst
 delete mode 100644 Documentation/ide/ide-tape.rst
 delete mode 100644 Documentation/ide/ide.rst
 delete mode 100644 Documentation/ide/index.rst
 delete mode 100644 Documentation/ide/warm-plug-howto.rst

diff --git a/Documentation/ide/ChangeLog.ide-cd.1994-2004 b/Documentation/ide/ChangeLog.ide-cd.1994-2004
deleted file mode 100644
index 4cc3ad99f39b..000000000000
--- a/Documentation/ide/ChangeLog.ide-cd.1994-2004
+++ /dev/null
@@ -1,268 +0,0 @@
-/*
- * 1.00  Oct 31, 1994 -- Initial version.
- * 1.01  Nov  2, 1994 -- Fixed problem with starting request in
- *                       cdrom_check_status.
- * 1.03  Nov 25, 1994 -- leaving unmask_intr[] as a user-setting (as for disks)
- * (from mlord)       -- minor changes to cdrom_setup()
- *                    -- renamed ide_dev_s to ide_drive_t, enable irq on command
- * 2.00  Nov 27, 1994 -- Generalize packet command interface;
- *                       add audio ioctls.
- * 2.01  Dec  3, 1994 -- Rework packet command interface to handle devices
- *                       which send an interrupt when ready for a command.
- * 2.02  Dec 11, 1994 -- Cache the TOC in the driver.
- *                       Don't use SCMD_PLAYAUDIO_TI; it's not included
- *                       in the current version of ATAPI.
- *                       Try to use LBA instead of track or MSF addressing
- *                       when possible.
- *                       Don't wait for READY_STAT.
- * 2.03  Jan 10, 1995 -- Rewrite block read routines to handle block sizes
- *                       other than 2k and to move multiple sectors in a
- *                       single transaction.
- * 2.04  Apr 21, 1995 -- Add work-around for Creative Labs CD220E drives.
- *                       Thanks to Nick Saw <cwsaw@pts7.pts.mot.com> for
- *                       help in figuring this out.  Ditto for Acer and
- *                       Aztech drives, which seem to have the same problem.
- * 2.04b May 30, 1995 -- Fix to match changes in ide.c version 3.16 -ml
- * 2.05  Jun  8, 1995 -- Don't attempt to retry after an illegal request
- *                        or data protect error.
- *                       Use HWIF and DEV_HWIF macros as in ide.c.
- *                       Always try to do a request_sense after
- *                        a failed command.
- *                       Include an option to give textual descriptions
- *                        of ATAPI errors.
- *                       Fix a bug in handling the sector cache which
- *                        showed up if the drive returned data in 512 byte
- *                        blocks (like Pioneer drives).  Thanks to
- *                        Richard Hirst <srh@gpt.co.uk> for diagnosing this.
- *                       Properly supply the page number field in the
- *                        MODE_SELECT command.
- *                       PLAYAUDIO12 is broken on the Aztech; work around it.
- * 2.05x Aug 11, 1995 -- lots of data structure renaming/restructuring in ide.c
- *                       (my apologies to Scott, but now ide-cd.c is independent)
- * 3.00  Aug 22, 1995 -- Implement CDROMMULTISESSION ioctl.
- *                       Implement CDROMREADAUDIO ioctl (UNTESTED).
- *                       Use input_ide_data() and output_ide_data().
- *                       Add door locking.
- *                       Fix usage count leak in cdrom_open, which happened
- *                        when a read-write mount was attempted.
- *                       Try to load the disk on open.
- *                       Implement CDROMEJECT_SW ioctl (off by default).
- *                       Read total cdrom capacity during open.
- *                       Rearrange logic in cdrom_decode_status.  Issue
- *                        request sense commands for failed packet commands
- *                        from here instead of from cdrom_queue_packet_command.
- *                        Fix a race condition in retrieving error information.
- *                       Suppress printing normal unit attention errors and
- *                        some drive not ready errors.
- *                       Implement CDROMVOLREAD ioctl.
- *                       Implement CDROMREADMODE1/2 ioctls.
- *                       Fix race condition in setting up interrupt handlers
- *                        when the `serialize' option is used.
- * 3.01  Sep  2, 1995 -- Fix ordering of reenabling interrupts in
- *                        cdrom_queue_request.
- *                       Another try at using ide_[input,output]_data.
- * 3.02  Sep 16, 1995 -- Stick total disk capacity in partition table as well.
- *                       Make VERBOSE_IDE_CD_ERRORS dump failed command again.
- *                       Dump out more information for ILLEGAL REQUEST errs.
- *                       Fix handling of errors occurring before the
- *                        packet command is transferred.
- *                       Fix transfers with odd bytelengths.
- * 3.03  Oct 27, 1995 -- Some Creative drives have an id of just `CD'.
- *                       `DCI-2S10' drives are broken too.
- * 3.04  Nov 20, 1995 -- So are Vertos drives.
- * 3.05  Dec  1, 1995 -- Changes to go with overhaul of ide.c and ide-tape.c
- * 3.06  Dec 16, 1995 -- Add support needed for partitions.
- *                       More workarounds for Vertos bugs (based on patches
- *                        from Holger Dietze <dietze@aix520.informatik.uni-leipzig.de>).
- *                       Try to eliminate byteorder assumptions.
- *                       Use atapi_cdrom_subchnl struct definition.
- *                       Add STANDARD_ATAPI compilation option.
- * 3.07  Jan 29, 1996 -- More twiddling for broken drives: Sony 55D,
- *                        Vertos 300.
- *                       Add NO_DOOR_LOCKING configuration option.
- *                       Handle drive_cmd requests w/NULL args (for hdparm -t).
- *                       Work around sporadic Sony55e audio play problem.
- * 3.07a Feb 11, 1996 -- check drive->id for NULL before dereferencing, to fix
- *                        problem with "hde=cdrom" with no drive present.  -ml
- * 3.08  Mar  6, 1996 -- More Vertos workarounds.
- * 3.09  Apr  5, 1996 -- Add CDROMCLOSETRAY ioctl.
- *                       Switch to using MSF addressing for audio commands.
- *                       Reformat to match kernel tabbing style.
- *                       Add CDROM_GET_UPC ioctl.
- * 3.10  Apr 10, 1996 -- Fix compilation error with STANDARD_ATAPI.
- * 3.11  Apr 29, 1996 -- Patch from Heiko Eißfeldt <heiko@colossus.escape.de>
- *                       to remove redundant verify_area calls.
- * 3.12  May  7, 1996 -- Rudimentary changer support.  Based on patches
- *                        from Gerhard Zuber <zuber@berlin.snafu.de>.
- *                       Let open succeed even if there's no loaded disc.
- * 3.13  May 19, 1996 -- Fixes for changer code.
- * 3.14  May 29, 1996 -- Add work-around for Vertos 600.
- *                        (From Hennus Bergman <hennus@sky.ow.nl>.)
- * 3.15  July 2, 1996 -- Added support for Sanyo 3 CD changers
- *                        from Ben Galliart <bgallia@luc.edu> with
- *                        special help from Jeff Lightfoot
- *                        <jeffml@pobox.com>
- * 3.15a July 9, 1996 -- Improved Sanyo 3 CD changer identification
- * 3.16  Jul 28, 1996 -- Fix from Gadi to reduce kernel stack usage for ioctl.
- * 3.17  Sep 17, 1996 -- Tweak audio reads for some drives.
- *                       Start changing CDROMLOADFROMSLOT to CDROM_SELECT_DISC.
- * 3.18  Oct 31, 1996 -- Added module and DMA support.
- *
- * 4.00  Nov 5, 1996   -- New ide-cd maintainer,
- *                                 Erik B. Andersen <andersee@debian.org>
- *                     -- Newer Creative drives don't always set the error
- *                          register correctly.  Make sure we see media changes
- *                          regardless.
- *                     -- Integrate with generic cdrom driver.
- *                     -- CDROMGETSPINDOWN and CDROMSETSPINDOWN ioctls, based on
- *                          a patch from Ciro Cattuto <>.
- *                     -- Call set_device_ro.
- *                     -- Implement CDROMMECHANISMSTATUS and CDROMSLOTTABLE
- *                          ioctls, based on patch by Erik Andersen
- *                     -- Add some probes of drive capability during setup.
- *
- * 4.01  Nov 11, 1996  -- Split into ide-cd.c and ide-cd.h
- *                     -- Removed CDROMMECHANISMSTATUS and CDROMSLOTTABLE
- *                          ioctls in favor of a generalized approach
- *                          using the generic cdrom driver.
- *                     -- Fully integrated with the 2.1.X kernel.
- *                     -- Other stuff that I forgot (lots of changes)
- *
- * 4.02  Dec 01, 1996  -- Applied patch from Gadi Oxman <gadio@netvision.net.il>
- *                          to fix the drive door locking problems.
- *
- * 4.03  Dec 04, 1996  -- Added DSC overlap support.
- * 4.04  Dec 29, 1996  -- Added CDROMREADRAW ioclt based on patch
- *                          by Ales Makarov (xmakarov@sun.felk.cvut.cz)
- *
- * 4.05  Nov 20, 1997  -- Modified to print more drive info on init
- *                        Minor other changes
- *                        Fix errors on CDROMSTOP (If you have a "Dolphin",
- *                          you must define IHAVEADOLPHIN)
- *                        Added identifier so new Sanyo CD-changer works
- *                        Better detection if door locking isn't supported
- *
- * 4.06  Dec 17, 1997  -- fixed endless "tray open" messages  -ml
- * 4.07  Dec 17, 1997  -- fallback to set pc->stat on "tray open"
- * 4.08  Dec 18, 1997  -- spew less noise when tray is empty
- *                     -- fix speed display for ACER 24X, 18X
- * 4.09  Jan 04, 1998  -- fix handling of the last block so we return
- *                         an end of file instead of an I/O error (Gadi)
- * 4.10  Jan 24, 1998  -- fixed a bug so now changers can change to a new
- *                         slot when there is no disc in the current slot.
- *                     -- Fixed a memory leak where info->changer_info was
- *                         malloc'ed but never free'd when closing the device.
- *                     -- Cleaned up the global namespace a bit by making more
- *                         functions static that should already have been.
- * 4.11  Mar 12, 1998  -- Added support for the CDROM_SELECT_SPEED ioctl
- *                         based on a patch for 2.0.33 by Jelle Foks
- *                         <jelle@scintilla.utwente.nl>, a patch for 2.0.33
- *                         by Toni Giorgino <toni@pcape2.pi.infn.it>, the SCSI
- *                         version, and my own efforts.  -erik
- *                     -- Fixed a stupid bug which egcs was kind enough to
- *                         inform me of where "Illegal mode for this track"
- *                         was never returned due to a comparison on data
- *                         types of limited range.
- * 4.12  Mar 29, 1998  -- Fixed bug in CDROM_SELECT_SPEED so write speed is
- *                         now set ionly for CD-R and CD-RW drives.  I had
- *                         removed this support because it produced errors.
- *                         It produced errors _only_ for non-writers. duh.
- * 4.13  May 05, 1998  -- Suppress useless "in progress of becoming ready"
- *                         messages, since this is not an error.
- *                     -- Change error messages to be const
- *                     -- Remove a "\t" which looks ugly in the syslogs
- * 4.14  July 17, 1998 -- Change to pointing to .ps version of ATAPI spec
- *                         since the .pdf version doesn't seem to work...
- *                     -- Updated the TODO list to something more current.
- *
- * 4.15  Aug 25, 1998  -- Updated ide-cd.h to respect machine endianness,
- *                         patch thanks to "Eddie C. Dost" <ecd@skynet.be>
- *
- * 4.50  Oct 19, 1998  -- New maintainers!
- *                         Jens Axboe <axboe@image.dk>
- *                         Chris Zwilling <chris@cloudnet.com>
- *
- * 4.51  Dec 23, 1998  -- Jens Axboe <axboe@image.dk>
- *                      - ide_cdrom_reset enabled since the ide subsystem
- *                         handles resets fine now. <axboe@image.dk>
- *                      - Transfer size fix for Samsung CD-ROMs, thanks to
- *                        "Ville Hallik" <ville.hallik@mail.ee>.
- *                      - other minor stuff.
- *
- * 4.52  Jan 19, 1999  -- Jens Axboe <axboe@image.dk>
- *                      - Detect DVD-ROM/RAM drives
- *
- * 4.53  Feb 22, 1999   - Include other model Samsung and one Goldstar
- *                         drive in transfer size limit.
- *                      - Fix the I/O error when doing eject without a medium
- *                         loaded on some drives.
- *                      - CDROMREADMODE2 is now implemented through
- *                         CDROMREADRAW, since many drives don't support
- *                         MODE2 (even though ATAPI 2.6 says they must).
- *                      - Added ignore parameter to ide-cd (as a module), eg
- *                         	insmod ide-cd ignore='hda hdb'
- *                         Useful when using ide-cd in conjunction with
- *                         ide-scsi. TODO: non-modular way of doing the
- *                         same.
- *
- * 4.54  Aug 5, 1999	- Support for MMC2 class commands through the generic
- *			  packet interface to cdrom.c.
- *			- Unified audio ioctl support, most of it.
- *			- cleaned up various deprecated verify_area().
- *			- Added ide_cdrom_packet() as the interface for
- *			  the Uniform generic_packet().
- *			- bunch of other stuff, will fill in logs later.
- *			- report 1 slot for non-changers, like the other
- *			  cd-rom drivers. don't report select disc for
- *			  non-changers as well.
- *			- mask out audio playing, if the device can't do it.
- *
- * 4.55  Sep 1, 1999	- Eliminated the rest of the audio ioctls, except
- *			  for CDROMREADTOC[ENTRY|HEADER]. Some of the drivers
- *			  use this independently of the actual audio handling.
- *			  They will disappear later when I get the time to
- *			  do it cleanly.
- *			- Minimize the TOC reading - only do it when we
- *			  know a media change has occurred.
- *			- Moved all the CDROMREADx ioctls to the Uniform layer.
- *			- Heiko Eißfeldt <heiko@colossus.escape.de> supplied
- *			  some fixes for CDI.
- *			- CD-ROM leaving door locked fix from Andries
- *			  Brouwer <Andries.Brouwer@cwi.nl>
- *			- Erik Andersen <andersen@xmission.com> unified
- *			  commands across the various drivers and how
- *			  sense errors are handled.
- *
- * 4.56  Sep 12, 1999	- Removed changer support - it is now in the
- *			  Uniform layer.
- *			- Added partition based multisession handling.
- *			- Mode sense and mode select moved to the
- *			  Uniform layer.
- *			- Fixed a problem with WPI CDS-32X drive - it
- *			  failed the capabilities
- *
- * 4.57  Apr 7, 2000	- Fixed sense reporting.
- *			- Fixed possible oops in ide_cdrom_get_last_session()
- *			- Fix locking mania and make ide_cdrom_reset relock
- *			- Stop spewing errors to log when magicdev polls with
- *			  TEST_UNIT_READY on some drives.
- *			- Various fixes from Tobias Ringstrom:
- *			  tray if it was locked prior to the reset.
- *			  - cdrom_read_capacity returns one frame too little.
- *			  - Fix real capacity reporting.
- *
- * 4.58  May 1, 2000	- Clean up ACER50 stuff.
- *			- Fix small problem with ide_cdrom_capacity
- *
- * 4.59  Aug 11, 2000	- Fix changer problem in cdrom_read_toc, we weren't
- *			  correctly sensing a disc change.
- *			- Rearranged some code
- *			- Use extended sense on drives that support it for
- *			  correctly reporting tray status -- from
- *			  Michael D Johnson <johnsom@orst.edu>
- * 4.60  Dec 17, 2003	- Add mt rainier support
- *			- Bump timeout for packet commands, matches sr
- *			- Odd stuff
- * 4.61  Jan 22, 2004	- support hardware sector sizes other than 2kB,
- *			  Pascal Schmidt <der.eremit@email.de>
- */
diff --git a/Documentation/ide/ChangeLog.ide-floppy.1996-2002 b/Documentation/ide/ChangeLog.ide-floppy.1996-2002
deleted file mode 100644
index 46c19ef32a9e..000000000000
--- a/Documentation/ide/ChangeLog.ide-floppy.1996-2002
+++ /dev/null
@@ -1,63 +0,0 @@
-/*
- * Many thanks to Lode Leroy <Lode.Leroy@www.ibase.be>, who tested so many
- * ALPHA patches to this driver on an EASYSTOR LS-120 ATAPI floppy drive.
- *
- * Ver 0.1   Oct 17 96   Initial test version, mostly based on ide-tape.c.
- * Ver 0.2   Oct 31 96   Minor changes.
- * Ver 0.3   Dec  2 96   Fixed error recovery bug.
- * Ver 0.4   Jan 26 97   Add support for the HDIO_GETGEO ioctl.
- * Ver 0.5   Feb 21 97   Add partitions support.
- *                       Use the minimum of the LBA and CHS capacities.
- *                       Avoid hwgroup->rq == NULL on the last irq.
- *                       Fix potential null dereferencing with DEBUG_LOG.
- * Ver 0.8   Dec  7 97   Increase irq timeout from 10 to 50 seconds.
- *                       Add media write-protect detection.
- *                       Issue START command only if TEST UNIT READY fails.
- *                       Add work-around for IOMEGA ZIP revision 21.D.
- *                       Remove idefloppy_get_capabilities().
- * Ver 0.9   Jul  4 99   Fix a bug which might have caused the number of
- *                        bytes requested on each interrupt to be zero.
- *                        Thanks to <shanos@es.co.nz> for pointing this out.
- * Ver 0.9.sv Jan 6 01   Sam Varshavchik <mrsam@courier-mta.com>
- *                       Implement low level formatting.  Reimplemented
- *                       IDEFLOPPY_CAPABILITIES_PAGE, since we need the srfp
- *                       bit.  My LS-120 drive barfs on
- *                       IDEFLOPPY_CAPABILITIES_PAGE, but maybe it's just me.
- *                       Compromise by not reporting a failure to get this
- *                       mode page.  Implemented four IOCTLs in order to
- *                       implement formatting.  IOCTls begin with 0x4600,
- *                       0x46 is 'F' as in Format.
- *            Jan 9 01   Userland option to select format verify.
- *                       Added PC_SUPPRESS_ERROR flag - some idefloppy drives
- *                       do not implement IDEFLOPPY_CAPABILITIES_PAGE, and
- *                       return a sense error.  Suppress error reporting in
- *                       this particular case in order to avoid spurious
- *                       errors in syslog.  The culprit is
- *                       idefloppy_get_capability_page(), so move it to
- *                       idefloppy_begin_format() so that it's not used
- *                       unless absolutely necessary.
- *                       If drive does not support format progress indication
- *                       monitor the dsc bit in the status register.
- *                       Also, O_NDELAY on open will allow the device to be
- *                       opened without a disk available.  This can be used to
- *                       open an unformatted disk, or get the device capacity.
- * Ver 0.91  Dec 11 99   Added IOMEGA Clik! drive support by
- *     		   <paul@paulbristow.net>
- * Ver 0.92  Oct 22 00   Paul Bristow became official maintainer for this
- *           		   driver.  Included Powerbook internal zip kludge.
- * Ver 0.93  Oct 24 00   Fixed bugs for Clik! drive
- *                        no disk on insert and disk change now works
- * Ver 0.94  Oct 27 00   Tidied up to remove strstr(Clik) everywhere
- * Ver 0.95  Nov  7 00   Brought across to kernel 2.4
- * Ver 0.96  Jan  7 01   Actually in line with release version of 2.4.0
- *                       including set_bit patch from Rusty Russell
- * Ver 0.97  Jul 22 01   Merge 0.91-0.96 onto 0.9.sv for ac series
- * Ver 0.97.sv Aug 3 01  Backported from 2.4.7-ac3
- * Ver 0.98  Oct 26 01   Split idefloppy_transfer_pc into two pieces to
- *                        fix a lost interrupt problem. It appears the busy
- *                        bit was being deasserted by my IOMEGA ATAPI ZIP 100
- *                        drive before the drive was actually ready.
- * Ver 0.98a Oct 29 01   Expose delay value so we can play.
- * Ver 0.99  Feb 24 02   Remove duplicate code, modify clik! detection code
- *                        to support new PocketZip drives
- */
diff --git a/Documentation/ide/ChangeLog.ide-tape.1995-2002 b/Documentation/ide/ChangeLog.ide-tape.1995-2002
deleted file mode 100644
index 877fac8770b3..000000000000
--- a/Documentation/ide/ChangeLog.ide-tape.1995-2002
+++ /dev/null
@@ -1,257 +0,0 @@
-/*
- * Ver 0.1   Nov  1 95   Pre-working code :-)
- * Ver 0.2   Nov 23 95   A short backup (few megabytes) and restore procedure
- *                        was successful ! (Using tar cvf ... on the block
- *                        device interface).
- *                       A longer backup resulted in major swapping, bad
- *                        overall Linux performance and eventually failed as
- *                        we received non serial read-ahead requests from the
- *                        buffer cache.
- * Ver 0.3   Nov 28 95   Long backups are now possible, thanks to the
- *                        character device interface. Linux's responsiveness
- *                        and performance doesn't seem to be much affected
- *                        from the background backup procedure.
- *                       Some general mtio.h magnetic tape operations are
- *                        now supported by our character device. As a result,
- *                        popular tape utilities are starting to work with
- *                        ide tapes :-)
- *                       The following configurations were tested:
- *                       1. An IDE ATAPI TAPE shares the same interface
- *                        and irq with an IDE ATAPI CDROM.
- *                       2. An IDE ATAPI TAPE shares the same interface
- *                        and irq with a normal IDE disk.
- *                        Both configurations seemed to work just fine !
- *                        However, to be on the safe side, it is meanwhile
- *                        recommended to give the IDE TAPE its own interface
- *                        and irq.
- *                       The one thing which needs to be done here is to
- *                        add a "request postpone" feature to ide.c,
- *                        so that we won't have to wait for the tape to finish
- *                        performing a long media access (DSC) request (such
- *                        as a rewind) before we can access the other device
- *                        on the same interface. This effect doesn't disturb
- *                        normal operation most of the time because read/write
- *                        requests are relatively fast, and once we are
- *                        performing one tape r/w request, a lot of requests
- *                        from the other device can be queued and ide.c will
- *			  service all of them after this single tape request.
- * Ver 1.0   Dec 11 95   Integrated into Linux 1.3.46 development tree.
- *                       On each read / write request, we now ask the drive
- *                        if we can transfer a constant number of bytes
- *                        (a parameter of the drive) only to its buffers,
- *                        without causing actual media access. If we can't,
- *                        we just wait until we can by polling the DSC bit.
- *                        This ensures that while we are not transferring
- *                        more bytes than the constant referred to above, the
- *                        interrupt latency will not become too high and
- *                        we won't cause an interrupt timeout, as happened
- *                        occasionally in the previous version.
- *                       While polling for DSC, the current request is
- *                        postponed and ide.c is free to handle requests from
- *                        the other device. This is handled transparently to
- *                        ide.c. The hwgroup locking method which was used
- *                        in the previous version was removed.
- *                       Use of new general features which are provided by
- *                        ide.c for use with atapi devices.
- *                        (Programming done by Mark Lord)
- *                       Few potential bug fixes (Again, suggested by Mark)
- *                       Single character device data transfers are now
- *                        not limited in size, as they were before.
- *                       We are asking the tape about its recommended
- *                        transfer unit and send a larger data transfer
- *                        as several transfers of the above size.
- *                        For best results, use an integral number of this
- *                        basic unit (which is shown during driver
- *                        initialization). I will soon add an ioctl to get
- *                        this important parameter.
- *                       Our data transfer buffer is allocated on startup,
- *                        rather than before each data transfer. This should
- *                        ensure that we will indeed have a data buffer.
- * Ver 1.1   Dec 14 95   Fixed random problems which occurred when the tape
- *                        shared an interface with another device.
- *                        (poll_for_dsc was a complete mess).
- *                       Removed some old (non-active) code which had
- *                        to do with supporting buffer cache originated
- *                        requests.
- *                       The block device interface can now be opened, so
- *                        that general ide driver features like the unmask
- *                        interrupts flag can be selected with an ioctl.
- *                        This is the only use of the block device interface.
- *                       New fast pipelined operation mode (currently only on
- *                        writes). When using the pipelined mode, the
- *                        throughput can potentially reach the maximum
- *                        tape supported throughput, regardless of the
- *                        user backup program. On my tape drive, it sometimes
- *                        boosted performance by a factor of 2. Pipelined
- *                        mode is enabled by default, but since it has a few
- *                        downfalls as well, you may want to disable it.
- *                        A short explanation of the pipelined operation mode
- *                        is available below.
- * Ver 1.2   Jan  1 96   Eliminated pipelined mode race condition.
- *                       Added pipeline read mode. As a result, restores
- *                        are now as fast as backups.
- *                       Optimized shared interface behavior. The new behavior
- *                        typically results in better IDE bus efficiency and
- *                        higher tape throughput.
- *                       Pre-calculation of the expected read/write request
- *                        service time, based on the tape's parameters. In
- *                        the pipelined operation mode, this allows us to
- *                        adjust our polling frequency to a much lower value,
- *                        and thus to dramatically reduce our load on Linux,
- *                        without any decrease in performance.
- *                       Implemented additional mtio.h operations.
- *                       The recommended user block size is returned by
- *                        the MTIOCGET ioctl.
- *                       Additional minor changes.
- * Ver 1.3   Feb  9 96   Fixed pipelined read mode bug which prevented the
- *                        use of some block sizes during a restore procedure.
- *                       The character device interface will now present a
- *                        continuous view of the media - any mix of block sizes
- *                        during a backup/restore procedure is supported. The
- *                        driver will buffer the requests internally and
- *                        convert them to the tape's recommended transfer
- *                        unit, making performance almost independent of the
- *                        chosen user block size.
- *                       Some improvements in error recovery.
- *                       By cooperating with ide-dma.c, bus mastering DMA can
- *                        now sometimes be used with IDE tape drives as well.
- *                        Bus mastering DMA has the potential to dramatically
- *                        reduce the CPU's overhead when accessing the device,
- *                        and can be enabled by using hdparm -d1 on the tape's
- *                        block device interface. For more info, read the
- *                        comments in ide-dma.c.
- * Ver 1.4   Mar 13 96   Fixed serialize support.
- * Ver 1.5   Apr 12 96   Fixed shared interface operation, broken in 1.3.85.
- *                       Fixed pipelined read mode inefficiency.
- *                       Fixed nasty null dereferencing bug.
- * Ver 1.6   Aug 16 96   Fixed FPU usage in the driver.
- *                       Fixed end of media bug.
- * Ver 1.7   Sep 10 96   Minor changes for the CONNER CTT8000-A model.
- * Ver 1.8   Sep 26 96   Attempt to find a better balance between good
- *                        interactive response and high system throughput.
- * Ver 1.9   Nov  5 96   Automatically cross encountered filemarks rather
- *                        than requiring an explicit FSF command.
- *                       Abort pending requests at end of media.
- *                       MTTELL was sometimes returning incorrect results.
- *                       Return the real block size in the MTIOCGET ioctl.
- *                       Some error recovery bug fixes.
- * Ver 1.10  Nov  5 96   Major reorganization.
- *                       Reduced CPU overhead a bit by eliminating internal
- *                        bounce buffers.
- *                       Added module support.
- *                       Added multiple tape drives support.
- *                       Added partition support.
- *                       Rewrote DSC handling.
- *                       Some portability fixes.
- *                       Removed ide-tape.h.
- *                       Additional minor changes.
- * Ver 1.11  Dec  2 96   Bug fix in previous DSC timeout handling.
- *                       Use ide_stall_queue() for DSC overlap.
- *                       Use the maximum speed rather than the current speed
- *                        to compute the request service time.
- * Ver 1.12  Dec  7 97   Fix random memory overwriting and/or last block data
- *                        corruption, which could occur if the total number
- *                        of bytes written to the tape was not an integral
- *                        number of tape blocks.
- *                       Add support for INTERRUPT DRQ devices.
- * Ver 1.13  Jan  2 98   Add "speed == 0" work-around for HP COLORADO 5GB
- * Ver 1.14  Dec 30 98   Partial fixes for the Sony/AIWA tape drives.
- *                       Replace cli()/sti() with hwgroup spinlocks.
- * Ver 1.15  Mar 25 99   Fix SMP race condition by replacing hwgroup
- *                        spinlock with private per-tape spinlock.
- * Ver 1.16  Sep  1 99   Add OnStream tape support.
- *                       Abort read pipeline on EOD.
- *                       Wait for the tape to become ready in case it returns
- *                        "in the process of becoming ready" on open().
- *                       Fix zero padding of the last written block in
- *                        case the tape block size is larger than PAGE_SIZE.
- *                       Decrease the default disconnection time to tn.
- * Ver 1.16e Oct  3 99   Minor fixes.
- * Ver 1.16e1 Oct 13 99  Patches by Arnold Niessen,
- *                          niessen@iae.nl / arnold.niessen@philips.com
- *                   GO-1)  Undefined code in idetape_read_position
- *				according to Gadi's email
- *                   AJN-1) Minor fix asc == 11 should be asc == 0x11
- *                               in idetape_issue_packet_command (did effect
- *                               debugging output only)
- *                   AJN-2) Added more debugging output, and
- *                              added ide-tape: where missing. I would also
- *				like to add tape->name where possible
- *                   AJN-3) Added different debug_level's
- *                              via /proc/ide/hdc/settings
- *				"debug_level" determines amount of debugging output;
- *				can be changed using /proc/ide/hdx/settings
- *				0 : almost no debugging output
- *				1 : 0+output errors only
- *				2 : 1+output all sensekey/asc
- *				3 : 2+follow all chrdev related procedures
- *				4 : 3+follow all procedures
- *				5 : 4+include pc_stack rq_stack info
- *				6 : 5+USE_COUNT updates
- *                   AJN-4) Fixed timeout for retension in idetape_queue_pc_tail
- *				from 5 to 10 minutes
- *                   AJN-5) Changed maximum number of blocks to skip when
- *                              reading tapes with multiple consecutive write
- *                              errors from 100 to 1000 in idetape_get_logical_blk
- *                   Proposed changes to code:
- *                   1) output "logical_blk_num" via /proc
- *                   2) output "current_operation" via /proc
- *                   3) Either solve or document the fact that `mt rewind' is
- *                      required after reading from /dev/nhtx to be
- *			able to rmmod the idetape module;
- *			Also, sometimes an application finishes but the
- *			device remains `busy' for some time. Same cause ?
- *                   Proposed changes to release-notes:
- *		     4) write a simple `quickstart' section in the
- *                      release notes; I volunteer if you don't want to
- *		     5) include a pointer to video4linux in the doc
- *                      to stimulate video applications
- *                   6) release notes lines 331 and 362: explain what happens
- *			if the application data rate is higher than 1100 KB/s;
- *			similar approach to lower-than-500 kB/s ?
- *		     7) 6.6 Comparison; wouldn't it be better to allow different
- *			strategies for read and write ?
- *			Wouldn't it be better to control the tape buffer
- *			contents instead of the bandwidth ?
- *		     8) line 536: replace will by would (if I understand
- *			this section correctly, a hypothetical and unwanted situation
- *			 is being described)
- * Ver 1.16f Dec 15 99   Change place of the secondary OnStream header frames.
- * Ver 1.17  Nov 2000 / Jan 2001  Marcel Mol, marcel@mesa.nl
- *			- Add idetape_onstream_mode_sense_tape_parameter_page
- *			  function to get tape capacity in frames: tape->capacity.
- *			- Add support for DI-50 drives( or any DI- drive).
- *			- 'workaround' for read error/blank block around block 3000.
- *			- Implement Early warning for end of media for Onstream.
- *			- Cosmetic code changes for readability.
- *			- Idetape_position_tape should not use SKIP bit during
- *			  Onstream read recovery.
- *			- Add capacity, logical_blk_num and first/last_frame_position
- *			  to /proc/ide/hd?/settings.
- *			- Module use count was gone in the Linux 2.4 driver.
- * Ver 1.17a Apr 2001 Willem Riede osst@riede.org
- *			- Get drive's actual block size from mode sense block descriptor
- *			- Limit size of pipeline
- * Ver 1.17b Oct 2002   Alan Stern <stern@rowland.harvard.edu>
- *			Changed IDETAPE_MIN_PIPELINE_STAGES to 1 and actually used
- *			 it in the code!
- *			Actually removed aborted stages in idetape_abort_pipeline
- *			 instead of just changing the command code.
- *			Made the transfer byte count for Request Sense equal to the
- *			 actual length of the data transfer.
- *			Changed handling of partial data transfers: they do not
- *			 cause DMA errors.
- *			Moved initiation of DMA transfers to the correct place.
- *			Removed reference to unallocated memory.
- *			Made __idetape_discard_read_pipeline return the number of
- *			 sectors skipped, not the number of stages.
- *			Replaced errant kfree() calls with __idetape_kfree_stage().
- *			Fixed off-by-one error in testing the pipeline length.
- *			Fixed handling of filemarks in the read pipeline.
- *			Small code optimization for MTBSF and MTBSFM ioctls.
- *			Don't try to unlock the door during device close if is
- *			 already unlocked!
- *			Cosmetic fixes to miscellaneous debugging output messages.
- *			Set the minimum /proc/ide/hd?/settings values for "pipeline",
- *			 "pipeline_min", and "pipeline_max" to 1.
- */
diff --git a/Documentation/ide/changelogs.rst b/Documentation/ide/changelogs.rst
deleted file mode 100644
index fdf9d0fb8027..000000000000
--- a/Documentation/ide/changelogs.rst
+++ /dev/null
@@ -1,17 +0,0 @@
-Changelog for ide cd
---------------------
-
- .. include:: ChangeLog.ide-cd.1994-2004
-    :literal:
-
-Changelog for ide floppy
-------------------------
-
- .. include:: ChangeLog.ide-floppy.1996-2002
-    :literal:
-
-Changelog for ide tape
-----------------------
-
- .. include:: ChangeLog.ide-tape.1995-2002
-    :literal:
diff --git a/Documentation/ide/ide-tape.rst b/Documentation/ide/ide-tape.rst
deleted file mode 100644
index 3e061d9c0e38..000000000000
--- a/Documentation/ide/ide-tape.rst
+++ /dev/null
@@ -1,68 +0,0 @@
-===============================
-IDE ATAPI streaming tape driver
-===============================
-
-This driver is a part of the Linux ide driver.
-
-The driver, in co-operation with ide.c, basically traverses the
-request-list for the block device interface. The character device
-interface, on the other hand, creates new requests, adds them
-to the request-list of the block device, and waits for their completion.
-
-The block device major and minor numbers are determined from the
-tape's relative position in the ide interfaces, as explained in ide.c.
-
-The character device interface consists of the following devices::
-
-  ht0		major 37, minor 0	first  IDE tape, rewind on close.
-  ht1		major 37, minor 1	second IDE tape, rewind on close.
-  ...
-  nht0		major 37, minor 128	first  IDE tape, no rewind on close.
-  nht1		major 37, minor 129	second IDE tape, no rewind on close.
-  ...
-
-The general magnetic tape commands compatible interface, as defined by
-include/linux/mtio.h, is accessible through the character device.
-
-General ide driver configuration options, such as the interrupt-unmask
-flag, can be configured by issuing an ioctl to the block device interface,
-as any other ide device.
-
-Our own ide-tape ioctl's can be issued to either the block device or
-the character device interface.
-
-Maximal throughput with minimal bus load will usually be achieved in the
-following scenario:
-
-     1.	ide-tape is operating in the pipelined operation mode.
-     2.	No buffering is performed by the user backup program.
-
-Testing was done with a 2 GB CONNER CTMA 4000 IDE ATAPI Streaming Tape Drive.
-
-Here are some words from the first releases of hd.c, which are quoted
-in ide.c and apply here as well:
-
-* Special care is recommended.  Have Fun!
-
-Possible improvements
-=====================
-
-1. Support for the ATAPI overlap protocol.
-
-In order to maximize bus throughput, we currently use the DSC
-overlap method which enables ide.c to service requests from the
-other device while the tape is busy executing a command. The
-DSC overlap method involves polling the tape's status register
-for the DSC bit, and servicing the other device while the tape
-isn't ready.
-
-In the current QIC development standard (December 1995),
-it is recommended that new tape drives will *in addition*
-implement the ATAPI overlap protocol, which is used for the
-same purpose - efficient use of the IDE bus, but is interrupt
-driven and thus has much less CPU overhead.
-
-ATAPI overlap is likely to be supported in most new ATAPI
-devices, including new ATAPI cdroms, and thus provides us
-a method by which we can achieve higher throughput when
-sharing a (fast) ATA-2 disk with any (slow) new ATAPI device.
diff --git a/Documentation/ide/ide.rst b/Documentation/ide/ide.rst
deleted file mode 100644
index 88bdcba92f7d..000000000000
--- a/Documentation/ide/ide.rst
+++ /dev/null
@@ -1,265 +0,0 @@
-============================================
-Information regarding the Enhanced IDE drive
-============================================
-
-   The hdparm utility can be used to control various IDE features on a
-   running system. It is packaged separately.  Please Look for it on popular
-   linux FTP sites.
-
--------------------------------------------------------------------------------
-
-.. important::
-
-   BUGGY IDE CHIPSETS CAN CORRUPT DATA!!
-
-    PCI versions of the CMD640 and RZ1000 interfaces are now detected
-    automatically at startup when PCI BIOS support is configured.
-
-    Linux disables the "prefetch" ("readahead") mode of the RZ1000
-    to prevent data corruption possible due to hardware design flaws.
-
-    For the CMD640, linux disables "IRQ unmasking" (hdparm -u1) on any
-    drive for which the "prefetch" mode of the CMD640 is turned on.
-    If "prefetch" is disabled (hdparm -p8), then "IRQ unmasking" can be
-    used again.
-
-    For the CMD640, linux disables "32bit I/O" (hdparm -c1) on any drive
-    for which the "prefetch" mode of the CMD640 is turned off.
-    If "prefetch" is enabled (hdparm -p9), then "32bit I/O" can be
-    used again.
-
-    The CMD640 is also used on some Vesa Local Bus (VLB) cards, and is *NOT*
-    automatically detected by Linux.  For safe, reliable operation with such
-    interfaces, one *MUST* use the "cmd640.probe_vlb" kernel option.
-
-    Use of the "serialize" option is no longer necessary.
-
--------------------------------------------------------------------------------
-
-Common pitfalls
-===============
-
-- 40-conductor IDE cables are capable of transferring data in DMA modes up to
-  udma2, but no faster.
-
-- If possible devices should be attached to separate channels if they are
-  available. Typically the disk on the first and CD-ROM on the second.
-
-- If you mix devices on the same cable, please consider using similar devices
-  in respect of the data transfer mode they support.
-
-- Even better try to stick to the same vendor and device type on the same
-  cable.
-
-This is the multiple IDE interface driver, as evolved from hd.c
-===============================================================
-
-It supports up to 9 IDE interfaces per default, on one or more IRQs (usually
-14 & 15).  There can be up to two drives per interface, as per the ATA-6 spec.::
-
-  Primary:    ide0, port 0x1f0; major=3;  hda is minor=0; hdb is minor=64
-  Secondary:  ide1, port 0x170; major=22; hdc is minor=0; hdd is minor=64
-  Tertiary:   ide2, port 0x1e8; major=33; hde is minor=0; hdf is minor=64
-  Quaternary: ide3, port 0x168; major=34; hdg is minor=0; hdh is minor=64
-  fifth..     ide4, usually PCI, probed
-  sixth..     ide5, usually PCI, probed
-
-To access devices on interfaces > ide0, device entries please make sure that
-device files for them are present in /dev.  If not, please create such
-entries, by using /dev/MAKEDEV.
-
-This driver automatically probes for most IDE interfaces (including all PCI
-ones), for the drives/geometries attached to those interfaces, and for the IRQ
-lines being used by the interfaces (normally 14, 15 for ide0/ide1).
-
-Any number of interfaces may share a single IRQ if necessary, at a slight
-performance penalty, whether on separate cards or a single VLB card.
-The IDE driver automatically detects and handles this.  However, this may
-or may not be harmful to your hardware.. two or more cards driving the same IRQ
-can potentially burn each other's bus driver, though in practice this
-seldom occurs.  Be careful, and if in doubt, don't do it!
-
-Drives are normally found by auto-probing and/or examining the CMOS/BIOS data.
-For really weird situations, the apparent (fdisk) geometry can also be specified
-on the kernel "command line" using LILO.  The format of such lines is::
-
-	ide_core.chs=[interface_number.device_number]:cyls,heads,sects
-
-or::
-
-	ide_core.cdrom=[interface_number.device_number]
-
-For example::
-
-	ide_core.chs=1.0:1050,32,64  ide_core.cdrom=1.1
-
-The results of successful auto-probing may override the physical geometry/irq
-specified, though the "original" geometry may be retained as the "logical"
-geometry for partitioning purposes (fdisk).
-
-If the auto-probing during boot time confuses a drive (ie. the drive works
-with hd.c but not with ide.c), then an command line option may be specified
-for each drive for which you'd like the drive to skip the hardware
-probe/identification sequence.  For example::
-
-	ide_core.noprobe=0.1
-
-or::
-
-	ide_core.chs=1.0:768,16,32
-	ide_core.noprobe=1.0
-
-Note that when only one IDE device is attached to an interface, it should be
-jumpered as "single" or "master", *not* "slave".  Many folks have had
-"trouble" with cdroms because of this requirement, so the driver now probes
-for both units, though success is more likely when the drive is jumpered
-correctly.
-
-Courtesy of Scott Snyder and others, the driver supports ATAPI cdrom drives
-such as the NEC-260 and the new MITSUMI triple/quad speed drives.
-Such drives will be identified at boot time, just like a hard disk.
-
-If for some reason your cdrom drive is *not* found at boot time, you can force
-the probe to look harder by supplying a kernel command line parameter
-via LILO, such as:::
-
-	ide_core.cdrom=1.0	/* "master" on second interface (hdc) */
-
-or::
-
-	ide_core.cdrom=1.1	/* "slave" on second interface (hdd) */
-
-For example, a GW2000 system might have a hard drive on the primary
-interface (/dev/hda) and an IDE cdrom drive on the secondary interface
-(/dev/hdc).  To mount a CD in the cdrom drive, one would use something like::
-
-	ln -sf /dev/hdc /dev/cdrom
-	mkdir /mnt/cdrom
-	mount /dev/cdrom /mnt/cdrom -t iso9660 -o ro
-
-If, after doing all of the above, mount doesn't work and you see
-errors from the driver (with dmesg) complaining about `status=0xff`,
-this means that the hardware is not responding to the driver's attempts
-to read it.  One of the following is probably the problem:
-
-  - Your hardware is broken.
-
-  - You are using the wrong address for the device, or you have the
-    drive jumpered wrong.  Review the configuration instructions above.
-
-  - Your IDE controller requires some nonstandard initialization sequence
-    before it will work properly.  If this is the case, there will often
-    be a separate MS-DOS driver just for the controller.  IDE interfaces
-    on sound cards usually fall into this category.  Such configurations
-    can often be made to work by first booting MS-DOS, loading the
-    appropriate drivers, and then warm-booting linux (without powering
-    off).  This can be automated using loadlin in the MS-DOS autoexec.
-
-If you always get timeout errors, interrupts from the drive are probably
-not making it to the host.  Check how you have the hardware jumpered
-and make sure it matches what the driver expects (see the configuration
-instructions above).  If you have a PCI system, also check the BIOS
-setup; I've had one report of a system which was shipped with IRQ 15
-disabled by the BIOS.
-
-The kernel is able to execute binaries directly off of the cdrom,
-provided it is mounted with the default block size of 1024 (as above).
-
-Please pass on any feedback on any of this stuff to the maintainer,
-whose address can be found in linux/MAINTAINERS.
-
-The IDE driver is modularized.  The high level disk/CD-ROM/tape/floppy
-drivers can always be compiled as loadable modules, the chipset drivers
-can only be compiled into the kernel, and the core code (ide.c) can be
-compiled as a loadable module provided no chipset support is needed.
-
-When using ide.c as a module in combination with kmod, add::
-
-	alias block-major-3 ide-probe
-
-to a configuration file in /etc/modprobe.d/.
-
-When ide.c is used as a module, you can pass command line parameters to the
-driver using the "options=" keyword to insmod, while replacing any ',' with
-';'.
-
-
-Summary of ide driver parameters for kernel command line
-========================================================
-
-For legacy IDE VLB host drivers (ali14xx/dtc2278/ht6560b/qd65xx/umc8672)
-you need to explicitly enable probing by using "probe" kernel parameter,
-i.e. to enable probing for ALI M14xx chipsets (ali14xx host driver) use:
-
-* "ali14xx.probe" boot option when ali14xx driver is built-in the kernel
-
-* "probe" module parameter when ali14xx driver is compiled as module
-  ("modprobe ali14xx probe")
-
-Also for legacy CMD640 host driver (cmd640) you need to use "probe_vlb"
-kernel paremeter to enable probing for VLB version of the chipset (PCI ones
-are detected automatically).
-
-You also need to use "probe" kernel parameter for ide-4drives driver
-(support for IDE generic chipset with four drives on one port).
-
-To enable support for IDE doublers on Amiga use "doubler" kernel parameter
-for gayle host driver (i.e. "gayle.doubler" if the driver is built-in).
-
-To force ignoring cable detection (this should be needed only if you're using
-short 40-wires cable which cannot be automatically detected - if this is not
-a case please report it as a bug instead) use "ignore_cable" kernel parameter:
-
-* "ide_core.ignore_cable=[interface_number]" boot option if IDE is built-in
-  (i.e. "ide_core.ignore_cable=1" to force ignoring cable for "ide1")
-
-* "ignore_cable=[interface_number]" module parameter (for ide_core module)
-  if IDE is compiled as module
-
-Other kernel parameters for ide_core are:
-
-* "nodma=[interface_number.device_number]" to disallow DMA for a device
-
-* "noflush=[interface_number.device_number]" to disable flush requests
-
-* "nohpa=[interface_number.device_number]" to disable Host Protected Area
-
-* "noprobe=[interface_number.device_number]" to skip probing
-
-* "nowerr=[interface_number.device_number]" to ignore the WRERR_STAT bit
-
-* "cdrom=[interface_number.device_number]" to force device as a CD-ROM
-
-* "chs=[interface_number.device_number]" to force device as a disk (using CHS)
-
-
-Some Terminology
-================
-
-IDE
-  Integrated Drive Electronics, meaning that each drive has a built-in
-  controller, which is why an "IDE interface card" is not a "controller card".
-
-ATA
-  AT (the old IBM 286 computer) Attachment Interface, a draft American
-  National Standard for connecting hard drives to PCs.  This is the official
-  name for "IDE".
-
-  The latest standards define some enhancements, known as the ATA-6 spec,
-  which grew out of vendor-specific "Enhanced IDE" (EIDE) implementations.
-
-ATAPI
-  ATA Packet Interface, a new protocol for controlling the drives,
-  similar to SCSI protocols, created at the same time as the ATA2 standard.
-  ATAPI is currently used for controlling CDROM, TAPE and FLOPPY (ZIP or
-  LS120/240) devices, removable R/W cartridges, and for high capacity hard disk
-  drives.
-
-mlord@pobox.com
-
-
-Wed Apr 17 22:52:44 CEST 2002 edited by Marcin Dalecki, the current
-maintainer.
-
-Wed Aug 20 22:31:29 CEST 2003 updated ide boot options to current ide.c
-comments at 2.6.0-test4 time. Maciej Soltysiak <solt@dns.toxicfilms.tv>
diff --git a/Documentation/ide/index.rst b/Documentation/ide/index.rst
deleted file mode 100644
index 813dfe611a31..000000000000
--- a/Documentation/ide/index.rst
+++ /dev/null
@@ -1,21 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-==================================
-Integrated Drive Electronics (IDE)
-==================================
-
-.. toctree::
-    :maxdepth: 1
-
-    ide
-    ide-tape
-    warm-plug-howto
-
-    changelogs
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/ide/warm-plug-howto.rst b/Documentation/ide/warm-plug-howto.rst
deleted file mode 100644
index c245242ef2f1..000000000000
--- a/Documentation/ide/warm-plug-howto.rst
+++ /dev/null
@@ -1,18 +0,0 @@
-===================
-IDE warm-plug HOWTO
-===================
-
-To warm-plug devices on a port 'idex'::
-
-	# echo -n "1" > /sys/class/ide_port/idex/delete_devices
-
-unplug old device(s) and plug new device(s)::
-
-	# echo -n "1" > /sys/class/ide_port/idex/scan
-
-done
-
-NOTE: please make sure that partitions are unmounted and that there are
-no other active references to devices before doing "delete_devices" step,
-also do not attempt "scan" step on devices currently in use -- otherwise
-results may be unpredictable and lead to data loss if you're unlucky
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 1988c19d9daf..6b7e45348558 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -103,7 +103,6 @@ needed).
    block/index
    cdrom/index
    cpu-freq/index
-   ide/index
    fb/index
    fpga/index
    hid/index
-- 
2.34.1

