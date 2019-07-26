Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4733476643
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2019 14:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbfGZMvm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jul 2019 08:51:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39896 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfGZMvm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 08:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
        To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=za6QOtbUP/u3w0Fp76v1uozWwIFho3lyw3+3ALnceBI=; b=GrARJ2cRQU0krrKhYtlIRW9iyn
        gIJrg+ad2FYF+UlAjpIK1vcd/WyXG3k1kUg3Wm/wG0I+S3hpagHcP5ddX4FPZEI3XjyU43kPtb0em
        19ZRIdoZRg/J3hD8UNd1TVUO2txIWrtv9pPwYQr2x5uGKXa4nZCQM7tAqzwxhlQl0G86w1pKfoWoJ
        9xRTG+hChh33qgytV9bwXyHIxEnPeafVYnkZjFiJHWFTcNYaegCVDF2oDmiCbG6QOEpBVD3Pjg9xl
        U+8jjxMZFoF/IOLc8EFCA33SYJ/eptQe2AI6+BHfn01w6UaL3nHULAYPtrGEXZ/zmrzZ+c4c30+zS
        64aQ6Auw==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqzhE-0006Ac-Fh; Fri, 26 Jul 2019 12:51:40 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqzhC-0005aq-7X; Fri, 26 Jul 2019 09:51:38 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 12/26] docs: README.buddha: convert to ReST and add to m68k book
Date:   Fri, 26 Jul 2019 09:51:22 -0300
Message-Id: <cd4bebda7552ea7df60a12b7a8f06fffd4a0d924.1564145354.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564145354.git.mchehab+samsung@kernel.org>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adjust the file for it to be properly parsed by Sphinx, adding
it to the index of the book it belongs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 .../m68k/{README.buddha => buddha-driver.rst} | 95 +++++++++----------
 Documentation/m68k/index.rst                  |  1 +
 2 files changed, 48 insertions(+), 48 deletions(-)
 rename Documentation/m68k/{README.buddha => buddha-driver.rst} (73%)

diff --git a/Documentation/m68k/README.buddha b/Documentation/m68k/buddha-driver.rst
similarity index 73%
rename from Documentation/m68k/README.buddha
rename to Documentation/m68k/buddha-driver.rst
index 3ea9827ba3c7..20e401413991 100644
--- a/Documentation/m68k/README.buddha
+++ b/Documentation/m68k/buddha-driver.rst
@@ -1,3 +1,6 @@
+=====================================
+Amiga Buddha and Catweasel IDE Driver
+=====================================
 
 The Amiga Buddha and Catweasel IDE Driver (part of ide.c) was written by
 Geert Uytterhoeven based on the following specifications:
@@ -12,12 +15,12 @@ described  in  their  manuals, no tricks have been used (for
 example leaving some address lines out of the equations...).
 If you want to configure the board yourself (for example let
 a  Linux  kernel  configure the card), look at the Commodore
-Docs.  Reading the nibbles should give this information:
+Docs.  Reading the nibbles should give this information::
 
-Vendor number: 4626 ($1212)
-product number: 0 (42 for Catweasel Z-II)
-Serial number: 0
-Rom-vector: $1000
+  Vendor number: 4626 ($1212)
+  product number: 0 (42 for Catweasel Z-II)
+  Serial number: 0
+  Rom-vector: $1000
 
 The  card  should be a Z-II board, size 64K, not for freemem
 list, Rom-Vektor is valid, no second Autoconfig-board on the
@@ -34,6 +37,7 @@ otherwise your chance is only 1:16 to find the board :-).
 
 The local memory-map is even active when mapped to $e8:
 
+==============  ===========================================
 $0-$7e		Autokonfig-space, see Z-II docs.
 
 $80-$7fd	reserved
@@ -50,50 +54,51 @@ $a00-$aff	IDE-Select 2 (Port 1, Register set 0)
 $b00-$bff	IDE-Select 3 (Port 1, Register set 1)
 
 $c00-$cff	IDE-Select 4 (Port 2, Register set 0,
-                          Catweasel only!)
+                Catweasel only!)
 
 $d00-$dff	IDE-Select 5 (Port 3, Register set 1,
-			      Catweasel only!)
+		Catweasel only!)
 
-$e00-$eff	local expansion port, on Catweasel Z-II the 
+$e00-$eff	local expansion port, on Catweasel Z-II the
 		Catweasel registers are also mapped here.
 		Never touch, use multidisk.device!
-		
-$f00		read only, Byte-access: Bit 7 shows the 
-		level of the IRQ-line of IDE port 0. 
+
+$f00		read only, Byte-access: Bit 7 shows the
+		level of the IRQ-line of IDE port 0.
 
 $f01-$f3f	mirror of $f00
 
-$f40		read only, Byte-access: Bit 7 shows the 
-		level of the IRQ-line of IDE port 1. 
+$f40		read only, Byte-access: Bit 7 shows the
+		level of the IRQ-line of IDE port 1.
 
 $f41-$f7f	mirror of $f40
 
-$f80		read only, Byte-access: Bit 7 shows the 
-		level of the IRQ-line of IDE port 2. 
+$f80		read only, Byte-access: Bit 7 shows the
+		level of the IRQ-line of IDE port 2.
 		(Catweasel only!)
 
 $f81-$fbf	mirror of $f80
 
 $fc0		write-only: Writing any value to this
-		register enables IRQs to be passed from the 
-		IDE ports to the Zorro bus. This mechanism 
-		has been implemented to be compatible with 
+		register enables IRQs to be passed from the
+		IDE ports to the Zorro bus. This mechanism
+		has been implemented to be compatible with
 		harddisks that are either defective or have
-		a buggy firmware and pull the IRQ line up 
-		while starting up. If interrupts would 
-		always be passed to the bus, the computer 
-		might not start up. Once enabled, this flag 
-		can not be disabled again. The level of the 
-		flag can not be determined by software 
+		a buggy firmware and pull the IRQ line up
+		while starting up. If interrupts would
+		always be passed to the bus, the computer
+		might not start up. Once enabled, this flag
+		can not be disabled again. The level of the
+		flag can not be determined by software
 		(what for? Write to me if it's necessary!).
 
 $fc1-$fff	mirror of $fc0
 
 $1000-$ffff	Buddha-Rom with offset $1000 in the rom
-		chip. The addresses $0 to $fff of the rom 
+		chip. The addresses $0 to $fff of the rom
 		chip cannot be read. Rom is Byte-wide and
 		mapped to even addresses.
+==============  ===========================================
 
 The  IDE ports issue an INT2.  You can read the level of the
 IRQ-lines  of  the  IDE-ports by reading from the three (two
@@ -128,7 +133,8 @@ must  always  be set to 1 to be compatible with later Buddha
 versions  (if  I'll  ever  update this one).  I presume that
 I'll  never use the lower four bits, but they have to be set
 to 1 by definition.
-  The  values in this table have to be shifted 5 bits to the
+
+The  values in this table have to be shifted 5 bits to the
 left and or'd with $1f (this sets the lower 5 bits).
 
 All  the timings have in common:  Select and IOR/IOW rise at
@@ -138,44 +144,36 @@ values  are no multiple of 71.  One clock-cycle is 71ns long
 (exactly 70,5 at 14,18 Mhz on PAL systems).
 
 value 0 (Default after reset)
-
-497ns Select (7 clock cycles) , IOR/IOW after 172ns (2 clock cycles)
-(same timing as the Amiga 1200 does on it's IDE port without
-accelerator card)
+  497ns Select (7 clock cycles) , IOR/IOW after 172ns (2 clock cycles)
+  (same timing as the Amiga 1200 does on it's IDE port without
+  accelerator card)
 
 value 1
-
-639ns Select (9 clock cycles), IOR/IOW after 243ns (3 clock cycles)
+  639ns Select (9 clock cycles), IOR/IOW after 243ns (3 clock cycles)
 
 value 2
-
-781ns Select (11 clock cycles), IOR/IOW after 314ns (4 clock cycles)
+  781ns Select (11 clock cycles), IOR/IOW after 314ns (4 clock cycles)
 
 value 3
-
-355ns Select (5 clock cycles), IOR/IOW after 101ns (1 clock cycle)
+  355ns Select (5 clock cycles), IOR/IOW after 101ns (1 clock cycle)
 
 value 4
-
-355ns Select (5 clock cycles), IOR/IOW after 172ns (2 clock cycles)
+  355ns Select (5 clock cycles), IOR/IOW after 172ns (2 clock cycles)
 
 value 5
-
-355ns Select (5 clock cycles), IOR/IOW after 243ns (3 clock cycles)
+  355ns Select (5 clock cycles), IOR/IOW after 243ns (3 clock cycles)
 
 value 6
-
-1065ns Select (15 clock cycles), IOR/IOW after 314ns (4 clock cycles)
+  1065ns Select (15 clock cycles), IOR/IOW after 314ns (4 clock cycles)
 
 value 7
-
-355ns Select, (5 clock cycles), IOR/IOW after 101ns (1 clock cycle)
+  355ns Select, (5 clock cycles), IOR/IOW after 101ns (1 clock cycle)
 
 When accessing IDE registers with A6=1 (for example $84x),
 the timing will always be mode 0 8-bit compatible, no matter
 what you have selected in the speed register:
 
-781ns select, IOR/IOW after 4 clock cycles (=314ns) aktive. 
+781ns select, IOR/IOW after 4 clock cycles (=314ns) aktive.
 
 All  the  timings with a very short select-signal (the 355ns
 fast  accesses)  depend  on the accelerator card used in the
@@ -204,7 +202,8 @@ always  shows a "no IRQ here" on the Buddha, and accesses to
 the  third  IDE  port  are  going into data's Nirwana on the
 Buddha.
 
-			    Jens Schönfeld february 19th, 1997
-					updated may 27th, 1997
-			     eMail: sysop@nostlgic.tng.oche.de
+Jens Schönfeld february 19th, 1997
 
+updated may 27th, 1997
+
+eMail: sysop@nostlgic.tng.oche.de
diff --git a/Documentation/m68k/index.rst b/Documentation/m68k/index.rst
index 3a5ba7fe1703..b89cb6a86d9b 100644
--- a/Documentation/m68k/index.rst
+++ b/Documentation/m68k/index.rst
@@ -8,6 +8,7 @@ m68k Architecture
    :maxdepth: 2
 
    kernel-options
+   buddha-driver
 
 .. only::  subproject and html
 
-- 
2.21.0

