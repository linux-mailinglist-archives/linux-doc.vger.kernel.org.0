Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147B0142140
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2020 02:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgATBEL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 19 Jan 2020 20:04:11 -0500
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:50872 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729092AbgATBEL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Jan 2020 20:04:11 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.06712966|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.327359-0.0310154-0.641626;DS=CONTINUE|ham_system_inform|0.0227784-0.00108693-0.976135;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=liaoweixiong@allwinnertech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.Gf.OYKf_1579482234;
Received: from PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com fp:SMTPD_---.Gf.OYKf_1579482234)
          by smtp.aliyun-inc.com(10.147.42.16);
          Mon, 20 Jan 2020 09:04:05 +0800
From:   WeiXiong Liao <liaoweixiong@allwinnertech.com>
To:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: [PATCH v1 06/11] Documentation: pstore/blk: blkoops: create document for pstore_blk
Date:   Mon, 20 Jan 2020 09:03:48 +0800
Message-Id: <1579482233-2672-7-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The document, at Documentation/admin-guide/pstore-block.rst, tells us
how to use pstore/blk and blkoops.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
---
 Documentation/admin-guide/pstore-block.rst | 278 +++++++++++++++++++++++++++++
 MAINTAINERS                                |   1 +
 fs/pstore/Kconfig                          |   2 +
 3 files changed, 281 insertions(+)
 create mode 100644 Documentation/admin-guide/pstore-block.rst

diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
new file mode 100644
index 000000000000..58418d429c55
--- /dev/null
+++ b/Documentation/admin-guide/pstore-block.rst
@@ -0,0 +1,278 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Pstore block oops/panic logger
+==============================
+
+Introduction
+------------
+
+Pstore block (pstore/blk) is an oops/panic logger that writes its logs to a
+block device before the system crashes. It also supports non-block devices such
+as mtd device.
+
+There is a trapper named blkoops for pstore/blk, which makes pstore/blk be
+nicer to device drivers.
+
+Pstore block concepts
+---------------------
+
+Pstore/blk works as a zone manager as it cuts the block device or partition
+into several zones and stores data for different recorders. What device driver
+should do is to provide read/write APIs.
+
+Pstore/blk begins at function ``blkz_register``. Besides, blkoops, a wrapper of
+pstore/blk, begins at function ``blkoops_register_blkdev`` for block device and
+``blkoops_register_device`` for non-block device, which is recommended instead
+of directly using pstore/blk.
+
+Blkoops provides efficient configuration mothod for pstore/blk, which divides
+all configurations of pstore/blk into two parts, configurations for user and
+configurations for driver.
+
+Configurations for user determine how pstore/blk works, such as pmsg_size,
+dmesg_size and so on. All of them support both kconfig and module parameters,
+but module parameters have priority over kconfig.
+
+Configurations for driver are all about block/non-block device, such as
+total_size of device and read/write operations. Device driver transfers a
+structure ``blkoops_device`` defined in *linux/blkoops.h*.
+
+Configurations for user
+-----------------------
+
+All of these configurations support both kconfig and module parameters, but
+module parameters have priority over kconfig.
+Here is an example for module parameters::
+
+        blkoops.blkdev=179:7 blkoops.dmesg_size=64 blkoops.dump_oops=1
+
+The detail of each configurations may be of interest to you.
+
+blkdev
+~~~~~~
+
+The block device to use. Most of the time, it is a partition of block device.
+It's fine to ignore it if you are not block device.
+
+It accepts the following variants:
+
+1. <hex_major><hex_minor> device number in hexadecimal represents itself; no
+   leading 0x, for example b302.
+#. /dev/<disk_name> represents the device number of disk
+#. /dev/<disk_name><decimal> represents the device number of partition - device
+   number of disk plus the partition number
+#. /dev/<disk_name>p<decimal> - same as the above; this form is used when disk
+   name of partitioned disk ends with a digit.
+#. PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing the unique id of
+   a partition if the partition table provides it. The UUID may be either an
+   EFI/GPT UUID, or refer to an MSDOS partition using the format SSSSSSSS-PP,
+   where SSSSSSSS is a zero-filled hex representation of the 32-bit
+   "NT disk signature", and PP is a zero-filled hex representation of the
+   1-based partition number.
+#. PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation to a
+   partition with a known unique id.
+#. <major>:<minor> major and minor number of the device separated by a colon.
+
+dmesg_size
+~~~~~~~~~~
+
+The chunk size in bytes for dmesg(oops/panic). It **MUST** be a multiple of
+4096. If you don't need it, safely set it 0 or ignore it.
+
+NOTE that, the remaining space, except ``pmsg_size``, ``console_size``` and
+others, belongs to dmesg. It means that there are multiple chunks for dmesg.
+
+Pstore/blk will log to dmesg chunks one by one, and always overwrite the oldest
+chunk if there is no more free chunks.
+
+pmsg_size
+~~~~~~~~~
+
+The chunk size in bytes for pmsg. It **MUST** be a multiple of 4096. If you
+do not need it, safely set it 0 or ignore it.
+
+There is only one chunk for pmsg.
+
+Pmsg is a user space accessible pstore object. Writes to */dev/pmsg0* are
+appended to the chunk. On reboot the contents are available in
+/sys/fs/pstore/pmsg-pstore-blk-0.
+
+console_size
+~~~~~~~~~~~~
+
+The chunk size in bytes for console. It **MUST** be a multiple of 4096. If you
+do not need it, safely set it 0 or ignore it.
+
+There is only one chunk for console.
+
+All log of console will be appended to the chunk. On reboot the contents are
+available in /sys/fs/pstore/console-pstore-blk-0.
+
+ftrace_size
+~~~~~~~~~~~
+
+The chunk size in bytes for ftrace. It **MUST** be a multiple of 4096. If you
+do not need it, safely set it 0 or ignore it.
+
+There may be several chunks for ftrace, according to how many processors on
+your CPU. Each chunk size is equal to (ftrace_size / processors_count).
+
+All log of ftrace will be appended to the chunk. On reboot the contents are
+available in /sys/fs/pstore/ftrace-pstore-blk-[N], where N is the processor
+number.
+
+Persistent function tracing might be useful for debugging software or hardware
+related hangs. Here is an example of usage::
+
+ # mount -t pstore pstore /sys/fs/pstore
+ # mount -t debugfs debugfs /sys/kernel/debug/
+ # echo 1 > /sys/kernel/debug/pstore/record_ftrace
+ # reboot -f
+ [...]
+ # mount -t pstore pstore /sys/fs/pstore
+ # tail /sys/fs/pstore/ftrace-pstore-blk-0
+ CPU:0 ts:109860 c03a4310  c0063ebc  cpuidle_select <- cpu_startup_entry+0x1a8/0x1e0
+ CPU:0 ts:109861 c03a5878  c03a4324  menu_select <- cpuidle_select+0x24/0x2c
+ CPU:0 ts:109862 c00670e8  c03a589c  pm_qos_request <- menu_select+0x38/0x4cc
+ CPU:0 ts:109863 c0092bbc  c03a5960  tick_nohz_get_sleep_length <- menu_select+0xfc/0x4cc
+ CPU:0 ts:109865 c004b2f4  c03a59d4  get_iowait_load <- menu_select+0x170/0x4cc
+ CPU:0 ts:109868 c0063b60  c0063ecc  call_cpuidle <- cpu_startup_entry+0x1b8/0x1e0
+ CPU:0 ts:109869 c03a433c  c0063b94  cpuidle_enter <- call_cpuidle+0x44/0x48
+ CPU:0 ts:109871 c03a4000  c03a4350  cpuidle_enter_state <- cpuidle_enter+0x24/0x28
+ CPU:0 ts:109873 c0063ba8  c03a4090  sched_idle_set_state <- cpuidle_enter_state+0xa4/0x314
+ CPU:0 ts:109874 c03a605c  c03a40b4  arm_enter_idle_state <- cpuidle_enter_state+0xc8/0x314
+
+dump_oops
+~~~~~~~~~
+
+Dumping both oopses and panics can be done by setting 1 (not zero) in the
+``dump_oops`` member while setting 0 in that variable dumps only the panics.
+
+Configurations for driver
+-------------------------
+
+Only device driver would care these configurations. Block device driver
+refers ``blkoops_register_blkdev`` while ``blkoops_register_device`` for
+non-block device.
+
+The parameters of these two APIs may be of interest to you.
+
+major
+~~~~~
+
+It is only requested by block device which is registered by
+``blkoops_register_blkdev``.  It's the major device number of registered
+devices, by which blkoops can get the matching driver for @blkdev.
+
+total_size
+~~~~~~~~~~
+
+It is only requested by non-block device which is registered by
+``blkoops_register_device``.  It tells pstore/blk that the total size
+pstore/blk can use. It **MUST** be greater than 4096 and a multiple of 4096.
+
+If block device, blkoops can get size of block device/partition automatically.
+
+read/write
+~~~~~~~~~~
+
+It's generic read/write APIs for pstore/blk, which are requested by non-block
+device. The generic APIs are used for almost all data but except panic data,
+such as pmsg, console, oops and ftrace.
+
+The parameter @offset is the relative position of the device.
+
+Normally the number of bytes read/written should be returned, while for error,
+negative number will be returned. The following return numbers mean more:
+
+-EBUSY: pstore/blk should try again later.
+
+panic_write (for non-block device)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+It's a interface for panic recorder and will be used only when panic occurs.
+Non-block device driver registers it by ``blkoops_register_device``. If panic
+log is unnecessary, it's fine to ignore it.
+
+Note that pstore/blk will recover data from device while mounting pstore
+filesystem by default. If panic occurs but pstore/blk does not recover yet, the
+first zone of dmesg will be used.
+
+The parameter @offset is the relative position of the device.
+
+Normally the number of bytes written should be returned, while for error,
+negative number should be returned.
+
+panic_write (for block device)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+It's much similar to panic_write for non-block device, but panic_write for
+block device writes alignment to SECTOR_SIZE, that's why the parameters are
+@sects and @start_sect. Block device driver should register it by
+``blkoops_register_blkdev``.
+
+The parameter @start_sect is the relative position of the block device and
+partition. If block driver requires absolute position for panic_write,
+``blkoops_blkdev_info`` will be helpful, which can provide the absolute
+position of the block device (or partition) on the whole disk/flash.
+
+Normally zero should be returned, otherwise it indicates an error.
+
+Compression and header
+----------------------
+
+Block device is large enough for uncompressed dmesg data. Actually we do not
+recommend data compression because pstore/blk will insert some information into
+the first line of dmesg data. For example::
+
+        Panic: Total 16 times
+
+It means that it's the 16th times panic log since the first booting. Sometimes
+the oops|panic occurs since burning is very important for embedded device to
+judge whether the system is stable.
+
+The following line is inserted by pstore filesystem. For example::
+
+        Oops#2 Part1
+
+It means that it's the 2nd times oops log on last booting.
+
+Reading the data
+----------------
+
+The dump data can be read from the pstore filesystem. The format for these
+files is ``dmesg-pstore-blk-[N]`` for dmesg(oops|panic), ``pmsg-pstore-blk-0``
+for pmsg and so on, where N is the record number. To delete a stored
+record from block device, simply unlink the respective pstore file. The
+timestamp of the dump file records the trigger time.
+
+Attentions in panic read/write APIs
+-----------------------------------
+
+If on panic, the kernel is not going to run for much longer. The tasks will not
+be scheduled and the most kernel resources will be out of service. It
+looks like a single-threaded program running on a single-core computer.
+
+The following points require special attention for panic read/write APIs:
+
+1. Can **NOT** allocate any memory.
+   If you need memory, just allocate while the block driver is initializing
+   rather than waiting until the panic.
+#. Must be polled, **NOT** interrupt driven.
+   No task schedule any more. The block driver should delay to ensure the write
+   succeeds, but NOT sleep.
+#. Can **NOT** take any lock.
+   There is no other task, nor any share resource; you are safe to break all
+   locks.
+#. Just use CPU to transfer.
+   Do not use DMA to transfer unless you are sure that DMA will not keep lock.
+#. Operate register directly.
+   Try not to use Linux kernel resources. Do I/O map while initializing rather
+   than waiting until the panic.
+#. Reset your block device and controller if necessary.
+   If you are not sure the state of you block device and controller when panic,
+   you are safe to stop and reset them.
+
+Blkoops supports blkoops_blkdev_info(), which is defined in *linux/blkoops.h*,
+to get information of block device, such as the device number, sector count and
+start sector of the whole disk.
diff --git a/MAINTAINERS b/MAINTAINERS
index e4ba97130560..a5122e3aaf76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13380,6 +13380,7 @@ F:	include/linux/pstore*
 F:	drivers/firmware/efi/efi-pstore.c
 F:	drivers/acpi/apei/erst.c
 F:	Documentation/admin-guide/ramoops.rst
+F:	Documentation/admin-guide/pstore-block.rst
 F:	Documentation/devicetree/bindings/reserved-memory/ramoops.txt
 K:	\b(pstore|ramoops|blkoops)
 
diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index 5649218d2821..24232e96a98a 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -162,6 +162,8 @@ config PSTORE_BLK
 	  This enables panic and oops message to be logged to a block dev
 	  where it can be read back at some later point.
 
+	  For more information, see Documentation/admin-guide/pstore-block.rst.
+
 	  If unsure, say N.
 
 config PSTORE_BLKOOPS
-- 
1.9.1

