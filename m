Return-Path: <linux-doc+bounces-2981-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0367F6398
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 17:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBE6B1C20D3E
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 16:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3ED3E483;
	Thu, 23 Nov 2023 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INRtnkVg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C72E1720
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 08:07:29 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9fa2714e828so135583366b.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 08:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700755648; x=1701360448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw19EneOvl15xcw9lKvZeuWKJUiOGeInqG4Pni2uM4Y=;
        b=INRtnkVgVYVKfIT+Ynq+Tj0ITNatDC5Tv4qvWH3sEeGEhxQvWqMlQSvawoG8RnwhVb
         A5HsWMoCKiHJKrxqYKcHCb5Awd3IXIaBFT2PUKGg7MvNN/VvyUt+8g+tfVZ2gpEiGe8a
         gt1D0kGQT/MqorYsSXNYxb5BJxgbFtxYrT8uoTnCpGKnkA/twkrOPixwmNA/igGAONEp
         xEaPwagDIYOfd/wgCdNoCdZtba0c6F8qA01kI+Y6LBY7HNogHPTw2UgIPwyOLIKMHj1x
         nIyAccU4uNmEwRAnCexqolWnfGfU4pLmHTmmLYV00tbW2pVcSQjL9C1hxP8zQ6ZoeDVt
         dK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755648; x=1701360448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw19EneOvl15xcw9lKvZeuWKJUiOGeInqG4Pni2uM4Y=;
        b=lZoOiBun/bzPQDEQQgUxVO/wT0SSNypO2pQd82arer/SzHPQqdmmEqpf+U+vTL+NxW
         yjcjRbUxRSmWhJ3hg0GB3sUwQZmwcT4MPDfX0n4X9rWHdiTKHlnrmRh1MoDmi7Goo09z
         35jIowcbFlHZWEzN3u9K1EDLcgPcYaZaGpqxt5SY3z1q4mAQuQF2tPsLpvdj8DtokCmq
         VQL5wC466lXam5UTPs1NBi67Rbqr/nGoeTlnd4S947HaWFmpaGGtp9u9RSCNdqKv54Bb
         3P/LKY7+6vz/MxUZusBPr7WNJVaaUkObGiVTcKxDrYupA6QwAJq6LOn4J+cMCH1kEfnq
         EiHQ==
X-Gm-Message-State: AOJu0Yw5JYvKOddAN/E+OfyaFxlLjPRbw1BxG9euNFkzXHOUuCuGvIOA
	jFfYGBw33fDaqf0C9jUzLhHV5A==
X-Google-Smtp-Source: AGHT+IF2N2I0cXWlHK5aPXgZ5PccCroi8u77gr7FyE5tsNn9D1Pn4q33flQUSGotugZMkJqf++EB5w==
X-Received: by 2002:a17:907:920f:b0:a03:cdd6:993c with SMTP id ka15-20020a170907920f00b00a03cdd6993cmr3883015ejb.34.1700755648337;
        Thu, 23 Nov 2023 08:07:28 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id h21-20020a1709070b1500b00a0180de2797sm941490ejl.74.2023.11.23.08.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:07:27 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc
Cc: linux-mtd@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/2] docs: mtd: spi-nor: add sections about flash additions and testing
Date: Thu, 23 Nov 2023 18:07:20 +0200
Message-Id: <20231123160721.64561-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123160721.64561-1-tudor.ambarus@linaro.org>
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7815; i=tudor.ambarus@linaro.org; h=from:subject; bh=HAfRCxN94zoLhY8ac3G4VEePoF7G/WPmD2YPRKwst9k=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlX3i4R1qkgh8DpiumUzt9U5Dqv1ksv7daUnVZT lx2zpwXSbGJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZV94uAAKCRBLVU9HpY0U 6b0IB/46Z/ZwtgpldssgfGkh6MPZV9n2/yA8n4YKcEt3uuCA0X0+dU3f8nQ+hw88cmZY9ndBDvw Lvd1tNllaxa/6FCnDimAdyXSOV5CVCjNs2hfu91E4gX1tRnS99TihQOfuw/GwYgnTY/HZYaeh3j iqd3kaWvNx0m9UxfCHs801GBAm1YUss2N1nUXKu/9I8iXH9T0gyGin0Voztt/EvuxK3wMTTTF+i +GALjcqpakMtvg0dOfW9Gsc6f8xHlHPZx4TBA0mHXudnoHt+bWPK315QmU1K7dqCsyrVaDImiC8 b98Do61E7p8QdOapKGNpbF1ru4/i/BBgxNf02tOnZI3l9Ndx
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit

Add sections about how to propose a new flash addition and about the
minimum testing requirements.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/driver-api/mtd/spi-nor.rst | 189 +++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index c22f8c0f7950..cc8e81e09544 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -63,3 +63,192 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
 initialize the necessary fields for spi_nor{}. Please see
 drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
 when you want to write a new driver for a SPI NOR controller.
+
+How to propose a new flash addition
+-----------------------------------
+
+Most SPI NOR flashes comply with the JEDEC JESD216
+Serial Flash Discoverable Parameter (SFDP) standard. SFDP describes
+the functional and feature capabilities of serial flash devices in a
+standard set of internal read-only parameter tables.
+
+The SPI NOR driver queries the SFDP tables in order to determine the
+flash's parameters and settings. If the flash defines the SFDP tables
+it's likely that you won't need a flash entry at all, and instead
+rely on the generic flash driver which probes the flash solely based
+on its SFDP data. All one has to do is to specify the "jedec,spi-nor"
+compatible in the device tree.
+
+There are cases however where you need to define an explicit flash
+entry. This typically happens when the flash has settings or support
+that is not covered by the SFDP tables (e.g. Block Protection), or
+when the flash contains mangled SFDP data. If the later, one needs
+to implement the ``spi_nor_fixups`` hooks in order to amend the SFDP
+parameters with the correct values.
+
+Minimum testing requirements
+-----------------------------
+
+Do all the tests from below and paste them in the commit's comments
+section, after the ``---`` marker.
+
+1/ Specify the controller that you used to test the flash and specify
+the frequency at which the flash was operated::
+
+    E.g. This flash is populated on the X board and was tested at Y
+    frequency using the Z (put compatible) SPI controller.
+
+2/ Dump the sysfs entries and print the md5/sha1/sha256 SFDP checksum::
+
+    root@1:~#  cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
+    sst26vf064b
+    root@1:~#  cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
+    bf2643
+    root@1:~#  cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer
+    sst
+    root@1:~# hexdump -C  /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
+    00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
+    00000010  81 00 01 06 00 01 00 ff  bf 00 01 18 00 02 00 01  |................|
+    00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
+    00000030  fd 20 f1 ff ff ff ff 03  44 eb 08 6b 08 3b 80 bb  |. ......D..k.;..|
+    00000040  fe ff ff ff ff ff 00 ff  ff ff 44 0b 0c 20 0d d8  |..........D.. ..|
+    00000050  0f d8 10 d8 20 91 48 24  80 6f 1d 81 ed 0f 77 38  |.... .H$.o....w8|
+    00000060  30 b0 30 b0 f7 ff ff ff  29 c2 5c ff f0 30 c0 80  |0.0.....).\..0..|
+    00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
+    *
+    00000100  ff 00 04 ff f3 7f 00 00  f5 7f 00 00 f9 ff 7d 00  |..............}.|
+    00000110  f5 7f 00 00 f3 7f 00 00  ff ff ff ff ff ff ff ff  |................|
+    00000120  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
+    *
+    00000200  bf 26 43 ff b9 5f fd ff  30 f2 60 f3 32 ff 0a 12  |.&C.._..0.`.2...|
+    00000210  23 46 ff 0f 19 32 0f 19  19 ff ff ff ff ff ff ff  |#F...2..........|
+    00000220  00 66 99 38 ff 05 01 35  06 04 02 32 b0 30 72 42  |.f.8...5...2.0rB|
+    00000230  8d e8 98 88 a5 85 c0 9f  af 5a ff ff 06 ec 06 0c  |.........Z......|
+    00000240  00 03 08 0b ff ff ff ff  ff 07 ff ff 02 02 ff 06  |................|
+    00000250  03 00 fd fd 04 07 00 fc  03 00 fe fe 02 02 07 0e  |................|
+    00000260
+    root@1:~# sha256sum /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
+    428f34d0461876f189ac97f93e68a05fa6428c6650b3b7baf736a921e5898ed1  /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
+
+3/ Dump debugfs data::
+
+    root@1:~# cat /sys/kernel/debug/spi-nor/spi1.0/capabilities
+    Supported read modes by the flash
+     1S-1S-1S
+      opcode		0x03
+      mode cycles	0
+      dummy cycles	0
+     1S-1S-1S (fast read)
+      opcode		0x0b
+      mode cycles	0
+      dummy cycles	8
+     1S-1S-2S
+      opcode		0x3b
+      mode cycles	0
+      dummy cycles	8
+     1S-2S-2S
+      opcode		0xbb
+      mode cycles	4
+      dummy cycles	0
+     1S-1S-4S
+      opcode		0x6b
+      mode cycles	0
+      dummy cycles	8
+     1S-4S-4S
+      opcode		0xeb
+      mode cycles	2
+      dummy cycles	4
+     4S-4S-4S
+      opcode		0x0b
+      mode cycles	2
+      dummy cycles	4
+    
+    Supported page program modes by the flash
+     1S-1S-1S
+      opcode	0x02
+    
+    root@1:~# cat /sys/kernel/debug/spi-nor/spi1.0/params
+    name		sst26vf064b
+    id			bf 26 43 bf 26 43
+    size		8.00 MiB
+    write size		1
+    page size		256
+    address nbytes	3
+    flags		HAS_LOCK | HAS_16BIT_SR | SOFT_RESET | SWP_IS_VOLATILE
+    
+    opcodes
+     read		0xeb
+      dummy cycles	6
+     erase		0x20
+     program		0x02
+     8D extension	none
+    
+    protocols
+     read		1S-4S-4S
+     write		1S-1S-1S
+     register		1S-1S-1S
+    
+    erase commands
+     20 (4.00 KiB) [0]
+     d8 (8.00 KiB) [1]
+     d8 (32.0 KiB) [2]
+     d8 (64.0 KiB) [3]
+     c7 (8.00 MiB)
+    
+    sector map
+     region (in hex)   | erase mask | flags
+     ------------------+------------+----------
+     00000000-00007fff |     [01  ] |
+     00008000-0000ffff |     [0 2 ] |
+     00010000-007effff |     [0  3] |
+     007f0000-007f7fff |     [0 2 ] |
+     007f8000-007fffff |     [01  ] |
+
+4/ Use `mtd-utils <https://git.infradead.org/mtd-utils.git>`__
+and verify that erase, read and page program operations work fine.
+
+a/ Generate a 2 MB file::
+
+    root@1:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
+    2+0 records in
+    2+0 records out
+    2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.848566 s, 2.5 MB/s
+
+b/ Verify erase::
+
+    root@1:~# mtd_debug write /dev/mtd1 0 2097152 spi_test
+    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+
+    root@1:~# mtd_debug erase /dev/mtd1 0 2097152
+    Erased 2097152 bytes from address 0x00000000 in flash
+
+    root@1:~# mtd_debug read /dev/mtd1 0 2097152 spi_read
+    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+
+    root@1:~# hexdump -C spi_read
+    00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
+    *
+    00200000
+
+c/ Write, read back and compare::
+
+    root@1:~# mtd_debug write /dev/mtd1 0 2097152 spi_test
+    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+
+    root@1:~# mtd_debug read /dev/mtd1 0 2097152 spi_read
+    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+
+    root@1:~# sha1sum spi_*
+    51eeddc316a4121cf96e76e526d94d638283ec22  spi_read
+    51eeddc316a4121cf96e76e526d94d638283ec22  spi_test
+
+d/ Dump mtd_info data::
+
+    root@1:~# mtd_debug info /dev/mtd1
+    mtd.type = MTD_NORFLASH
+    mtd.flags = MTD_CAP_NORFLASH
+    mtd.size = 8388608 (8M)
+    mtd.erasesize = 4096 (4K)
+    mtd.writesize = 1
+    mtd.oobsize = 0
+    regions = 0
-- 
2.34.1


