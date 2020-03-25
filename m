Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E288A192370
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2020 09:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgCYI4Q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 25 Mar 2020 04:56:16 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:52691 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727566AbgCYI4P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Mar 2020 04:56:15 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0110751-0.00073836-0.988187;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03307;MF=liaoweixiong@allwinnertech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.H50xpyL_1585126516;
Received: from PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com fp:SMTPD_---.H50xpyL_1585126516)
          by smtp.aliyun-inc.com(10.147.42.241);
          Wed, 25 Mar 2020 16:55:36 +0800
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
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v3 11/11] mtd: new support oops logger based on pstore/blk
Date:   Wed, 25 Mar 2020 16:55:06 +0800
Message-Id: <1585126506-18635-12-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It's the last one of a series of patches to adapt to MTD device.

The mtdpstore is similar to mtdoops but more powerful. It bases on
pstore/blk, aims to store panic and oops logs to a flash partition,
where it can be read back as files after mounting pstore filesystem.

The pstore/blk is designed for block device at the very beginning,
but now, compatible to non-block device like MTD device.

To make mtdpstore work, "blkdev" of pstore/blk should be set as MTD
device name or MTD device number. Please refer to document at:
    Documentation/admin-guide/pstore-block.rst

Why do we need mtdpstore?
1. repetitive jobs between pstore and mtdoops
   Both of pstore and mtdoops do the same jobs that store panic/oops log.
   They have much similar logic that register to kmsg dumper and store
   log to several chunks one by one.
2. do what a driver should do
   To me, a driver should provide methods instead of policies. What MTD
   should do is to provide read/write/erase operations, geting rid of codes
   about chunk management, kmsg dumper and configuration.
3. enhanced feature
   Not only store log, but also show it as files.
   Not only log, but also trigger time and trigger count.
   Not only panic/oops log, but also log recorder for pmsg, console and
   ftrace in the future.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
---
 Documentation/admin-guide/pstore-block.rst |   9 +-
 drivers/mtd/Kconfig                        |  10 +
 drivers/mtd/Makefile                       |   1 +
 drivers/mtd/mtdpstore.c                    | 564 +++++++++++++++++++++++++++++
 4 files changed, 582 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/mtdpstore.c

diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
index a31155b36e62..464efb0db932 100644
--- a/Documentation/admin-guide/pstore-block.rst
+++ b/Documentation/admin-guide/pstore-block.rst
@@ -43,9 +43,9 @@ blkdev
 ~~~~~~
 
 The block device to use. Most of the time, it is a partition of block device.
-It's required for pstore/blk.
+It's required for pstore/blk. It is also used for MTD device.
 
-It accepts the following variants:
+It accepts the following variants for block device:
 
 1. <hex_major><hex_minor> device number in hexadecimal represents itself; no
    leading 0x, for example b302.
@@ -64,6 +64,11 @@ It accepts the following variants:
    partition with a known unique id.
 #. <major>:<minor> major and minor number of the device separated by a colon.
 
+It accepts the following variants for MTD device:
+
+1. <device name> MTD device name. "pstore" is recommended.
+#. <device number> MTD device number.
+
 oops_size
 ~~~~~~~~~
 
diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 42d401ea60ee..6ddab796216d 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -170,6 +170,16 @@ config MTD_OOPS
 	  buffer in a flash partition where it can be read back at some
 	  later point.
 
+config MTD_PSTORE
+	tristate "Log panic/oops to an MTD buffer based on pstore"
+	depends on PSTORE_BLK
+	help
+	  This enables panic and oops messages to be logged to a circular
+	  buffer in a flash partition where it can be read back as files after
+	  mounting pstore filesystem.
+
+	  If unsure, say N.
+
 config MTD_SWAP
 	tristate "Swap on MTD device support"
 	depends on MTD && SWAP
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 56cc60ccc477..593d0593a038 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_RFD_FTL)		+= rfd_ftl.o
 obj-$(CONFIG_SSFDC)		+= ssfdc.o
 obj-$(CONFIG_SM_FTL)		+= sm_ftl.o
 obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
+obj-$(CONFIG_MTD_PSTORE)	+= mtdpstore.o
 obj-$(CONFIG_MTD_SWAP)		+= mtdswap.o
 
 nftl-objs		:= nftlcore.o nftlmount.o
diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
new file mode 100644
index 000000000000..e6fdaed6d1d3
--- /dev/null
+++ b/drivers/mtd/mtdpstore.c
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define dev_fmt(fmt) "mtdoops-pstore: " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pstore_blk.h>
+#include <linux/mtd/mtd.h>
+#include <linux/bitops.h>
+
+static struct mtdpstore_context {
+	int index;
+	struct psblk_info info;
+	struct psblk_device dev;
+	struct mtd_info *mtd;
+	unsigned long *rmmap;		/* removed bit map */
+	unsigned long *usedmap;		/* used bit map */
+	/*
+	 * used for panic write
+	 * As there are no block_isbad for panic case, we should keep this
+	 * status before panic to ensure panic_write not failed.
+	 */
+	unsigned long *badmap;		/* bad block bit map */
+} oops_cxt;
+
+static int mtdpstore_block_isbad(struct mtdpstore_context *cxt, loff_t off)
+{
+	int ret;
+	struct mtd_info *mtd = cxt->mtd;
+	u64 blknum = div_u64(off, mtd->erasesize);
+
+	if (test_bit(blknum, cxt->badmap))
+		return true;
+	ret = mtd_block_isbad(mtd, off);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "mtd_block_isbad failed, aborting\n");
+		return ret;
+	} else if (ret > 0) {
+		set_bit(blknum, cxt->badmap);
+		return true;
+	}
+	return false;
+}
+
+static inline int mtdpstore_panic_block_isbad(struct mtdpstore_context *cxt,
+		loff_t off)
+{
+	struct mtd_info *mtd = cxt->mtd;
+	u64 blknum = div_u64(off, mtd->erasesize);
+
+	return test_bit(blknum, cxt->badmap);
+}
+
+static inline void mtdpstore_mark_used(struct mtdpstore_context *cxt,
+		loff_t off)
+{
+	struct mtd_info *mtd = cxt->mtd;
+	u64 zonenum = div_u64(off, cxt->info.oops_size);
+
+	dev_dbg(&mtd->dev, "mark zone %llu used\n", zonenum);
+	set_bit(zonenum, cxt->usedmap);
+}
+
+static inline void mtdpstore_mark_unused(struct mtdpstore_context *cxt,
+		loff_t off)
+{
+	struct mtd_info *mtd = cxt->mtd;
+	u64 zonenum = div_u64(off, cxt->info.oops_size);
+
+	dev_dbg(&mtd->dev, "mark zone %llu unused\n", zonenum);
+	clear_bit(zonenum, cxt->usedmap);
+}
+
+static inline void mtdpstore_block_mark_unused(struct mtdpstore_context *cxt,
+		loff_t off)
+{
+	struct mtd_info *mtd = cxt->mtd;
+	u64 zonenum = div_u64(off, cxt->info.oops_size);
+	u32 zonecnt = cxt->mtd->erasesize / cxt->info.oops_size;
+
+	while (zonecnt > 0) {
+		dev_dbg(&mtd->dev, "mark zone %llu unused\n", zonenum);
+		clear_bit(zonenum, cxt->usedmap);
+		zonenum++;
+		zonecnt--;
+	}
+}
+
+static inline int mtdpstore_is_used(struct mtdpstore_context *cxt, loff_t off)
+{
+	u64 zonenum = div_u64(off, cxt->info.oops_size);
+	u64 blknum = div_u64(off, cxt->mtd->erasesize);
+
+	if (test_bit(blknum, cxt->badmap))
+		return true;
+	return test_bit(zonenum, cxt->usedmap);
+}
+
+static int mtdpstore_block_is_used(struct mtdpstore_context *cxt,
+		loff_t off)
+{
+	u64 zonenum = div_u64(off, cxt->info.oops_size);
+	u32 zonecnt = cxt->mtd->erasesize / cxt->info.oops_size;
+
+	while (zonecnt > 0) {
+		if (test_bit(zonenum, cxt->usedmap))
+			return true;
+		zonenum++;
+		zonecnt--;
+	}
+	return false;
+}
+
+static int mtdpstore_is_empty(struct mtdpstore_context *cxt, char *buf,
+		size_t size)
+{
+	struct mtd_info *mtd = cxt->mtd;
+	size_t sz;
+	int i;
+
+	sz = min_t(uint32_t, size, mtd->writesize / 4);
+	for (i = 0; i < sz; i++) {
+		if (buf[i] != (char)0xFF)
+			return false;
+	}
+	return true;
+}
+
+static void mtdpstore_mark_removed(struct mtdpstore_context *cxt, loff_t off)
+{
+	struct mtd_info *mtd = cxt->mtd;
+	u64 zonenum = div_u64(off, cxt->info.oops_size);
+
+	dev_dbg(&mtd->dev, "mark zone %llu removed\n", zonenum);
+	set_bit(zonenum, cxt->rmmap);
+}
+
+static void mtdpstore_block_clear_removed(struct mtdpstore_context *cxt,
+		loff_t off)
+{
+	u64 zonenum = div_u64(off, cxt->info.oops_size);
+	u32 zonecnt = cxt->mtd->erasesize / cxt->info.oops_size;
+
+	while (zonecnt > 0) {
+		clear_bit(zonenum, cxt->rmmap);
+		zonenum++;
+		zonecnt--;
+	}
+}
+
+static int mtdpstore_block_is_removed(struct mtdpstore_context *cxt,
+		loff_t off)
+{
+	u64 zonenum = div_u64(off, cxt->info.oops_size);
+	u32 zonecnt = cxt->mtd->erasesize / cxt->info.oops_size;
+
+	while (zonecnt > 0) {
+		if (test_bit(zonenum, cxt->rmmap))
+			return true;
+		zonenum++;
+		zonecnt--;
+	}
+	return false;
+}
+
+static int mtdpstore_erase_do(struct mtdpstore_context *cxt, loff_t off)
+{
+	struct mtd_info *mtd = cxt->mtd;
+	struct erase_info erase;
+	int ret;
+
+	dev_dbg(&mtd->dev, "try to erase off 0x%llx\n", off);
+	erase.len = cxt->mtd->erasesize;
+	erase.addr = off;
+	ret = mtd_erase(cxt->mtd, &erase);
+	if (!ret)
+		mtdpstore_block_clear_removed(cxt, off);
+	else
+		dev_err(&mtd->dev, "erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
+		       (unsigned long long)erase.addr,
+		       (unsigned long long)erase.len, cxt->info.device);
+	return ret;
+}
+
+/*
+ * called while removing file
+ *
+ * Avoiding over erasing, do erase block only when the whole block is unused.
+ * If the block contains valid log, do erase lazily on flush_removed() when
+ * unregister.
+ */
+static ssize_t mtdpstore_erase(size_t size, loff_t off)
+{
+	struct mtdpstore_context *cxt = &oops_cxt;
+
+	if (mtdpstore_block_isbad(cxt, off))
+		return -EIO;
+
+	mtdpstore_mark_unused(cxt, off);
+
+	/* If the block still has valid data, mtdpstore do erase lazily */
+	if (likely(mtdpstore_block_is_used(cxt, off))) {
+		mtdpstore_mark_removed(cxt, off);
+		return 0;
+	}
+
+	/* all zones are unused, erase it */
+	off = ALIGN_DOWN(off, cxt->mtd->erasesize);
+	return mtdpstore_erase_do(cxt, off);
+}
+
+/*
+ * What is security for mtdpstore?
+ * As there is no erase for panic case, we should ensure at least one zone
+ * is writable. Otherwise, panic write will fail.
+ * If zone is used, write operation will return -ENOMSG, which means that
+ * pstore/blk will try one by one until gets an empty zone. So, it is not
+ * needed to ensure the next zone is empty, but at least one.
+ */
+static int mtdpstore_security(struct mtdpstore_context *cxt, loff_t off)
+{
+	int ret = 0, i;
+	struct mtd_info *mtd = cxt->mtd;
+	u32 zonenum = (u32)div_u64(off, cxt->info.oops_size);
+	u32 zonecnt = (u32)div_u64(cxt->mtd->size, cxt->info.oops_size);
+	u32 blkcnt = (u32)div_u64(cxt->mtd->size, cxt->mtd->erasesize);
+	u32 erasesize = cxt->mtd->erasesize;
+
+	for (i = 0; i < zonecnt; i++) {
+		u32 num = (zonenum + i) % zonecnt;
+
+		/* found empty zone */
+		if (!test_bit(num, cxt->usedmap))
+			return 0;
+	}
+
+	/* If there is no any empty zone, we have no way but to do erase */
+	off = ALIGN_DOWN(off, erasesize);
+	while (blkcnt--) {
+		div64_u64_rem(off + erasesize, cxt->mtd->size, (u64 *)&off);
+
+		if (mtdpstore_block_isbad(cxt, off))
+			continue;
+
+		ret = mtdpstore_erase_do(cxt, off);
+		if (!ret) {
+			mtdpstore_block_mark_unused(cxt, off);
+			break;
+		}
+	}
+
+	if (ret)
+		dev_err(&mtd->dev, "all blocks bad!\n");
+	dev_dbg(&mtd->dev, "end security\n");
+	return ret;
+}
+
+static ssize_t mtdpstore_write(const char *buf, size_t size, loff_t off)
+{
+	struct mtdpstore_context *cxt = &oops_cxt;
+	struct mtd_info *mtd = cxt->mtd;
+	size_t retlen;
+	int ret;
+
+	if (mtdpstore_block_isbad(cxt, off))
+		return -ENOMSG;
+
+	/* zone is used, please try next one */
+	if (mtdpstore_is_used(cxt, off))
+		return -ENOMSG;
+
+	dev_dbg(&mtd->dev, "try to write off 0x%llx size %zu\n", off, size);
+	ret = mtd_write(cxt->mtd, off, size, &retlen, (u_char *)buf);
+	if (ret < 0 || retlen != size) {
+		dev_err(&mtd->dev, "write failure at %lld (%zu of %zu written), err %d\n",
+				off, retlen, size, ret);
+		return -EIO;
+	}
+	mtdpstore_mark_used(cxt, off);
+
+	mtdpstore_security(cxt, off);
+	return retlen;
+}
+
+static inline bool mtdpstore_is_io_error(int ret)
+{
+	return ret < 0 && !mtd_is_bitflip(ret) && !mtd_is_eccerr(ret);
+}
+
+/*
+ * All zones will be read as pstore/blk will read zone one by one when do
+ * recover.
+ */
+static ssize_t mtdpstore_read(char *buf, size_t size, loff_t off)
+{
+	struct mtdpstore_context *cxt = &oops_cxt;
+	struct mtd_info *mtd = cxt->mtd;
+	size_t retlen, done;
+	int ret;
+
+	if (mtdpstore_block_isbad(cxt, off))
+		return -ENOMSG;
+
+	dev_dbg(&mtd->dev, "try to read off 0x%llx size %zu\n", off, size);
+	for (done = 0, retlen = 0; done < size; done += retlen) {
+		retlen = 0;
+
+		ret = mtd_read(cxt->mtd, off + done, size - done, &retlen,
+				(u_char *)buf + done);
+		if (mtdpstore_is_io_error(ret)) {
+			dev_err(&mtd->dev, "read failure at %lld (%zu of %zu read), err %d\n",
+					off + done, retlen, size - done, ret);
+			/* the zone may be broken, try next one */
+			return -ENOMSG;
+		}
+
+		/*
+		 * ECC error. The impact on log data is so small. Maybe we can
+		 * still read it and try to understand. So mtdpstore just hands
+		 * over what it gets and user can judge whether the data is
+		 * valid or not.
+		 */
+		if (mtd_is_eccerr(ret)) {
+			dev_err(&mtd->dev, "ecc error at %lld (%zu of %zu read), err %d\n",
+					off + done, retlen, size - done, ret);
+			/* driver may not set retlen when ecc error */
+			retlen = retlen == 0 ? size - done : retlen;
+		}
+	}
+
+	if (mtdpstore_is_empty(cxt, buf, size))
+		mtdpstore_mark_unused(cxt, off);
+	else
+		mtdpstore_mark_used(cxt, off);
+
+	mtdpstore_security(cxt, off);
+	return retlen;
+}
+
+static ssize_t mtdpstore_panic_write(const char *buf, size_t size, loff_t off)
+{
+	struct mtdpstore_context *cxt = &oops_cxt;
+	struct mtd_info *mtd = cxt->mtd;
+	size_t retlen;
+	int ret;
+
+	if (mtdpstore_panic_block_isbad(cxt, off))
+		return -ENOMSG;
+
+	/* zone is used, please try next one */
+	if (mtdpstore_is_used(cxt, off))
+		return -ENOMSG;
+
+	ret = mtd_panic_write(cxt->mtd, off, size, &retlen, (u_char *)buf);
+	if (ret < 0 || size != retlen) {
+		dev_err(&mtd->dev, "panic write failure at %lld (%zu of %zu read), err %d\n",
+				off, retlen, size, ret);
+		return -EIO;
+	}
+	mtdpstore_mark_used(cxt, off);
+
+	return retlen;
+}
+
+static void mtdpstore_notify_add(struct mtd_info *mtd)
+{
+	int ret;
+	struct mtdpstore_context *cxt = &oops_cxt;
+	struct psblk_info *info = &cxt->info;
+	unsigned long longcnt;
+
+	if (!strcmp(mtd->name, info->device))
+		cxt->index = mtd->index;
+
+	if (mtd->index != cxt->index || cxt->index < 0)
+		return;
+
+	dev_dbg(&mtd->dev, "found matching MTD device %s\n", mtd->name);
+
+	if (mtd->size < info->oops_size * 2) {
+		dev_err(&mtd->dev, "MTD partition %d not big enough\n",
+				mtd->index);
+		return;
+	}
+	/*
+	 * oops_size must be aligned to 4096 Bytes, which is limited by
+	 * psblk. The default value of oops_size is 64KB. If oops_size
+	 * is larger than erasesize, some errors will occur since mtdpsotre
+	 * is designed on it.
+	 */
+	if (mtd->erasesize < info->oops_size) {
+		dev_err(&mtd->dev, "eraseblock size of MTD partition %d too small\n",
+				mtd->index);
+		return;
+	}
+	if (unlikely(info->oops_size % mtd->writesize)) {
+		dev_err(&mtd->dev, "record size %lu KB must align to write size %d KB\n",
+				info->oops_size / 1024,
+				mtd->writesize / 1024);
+		return;
+	}
+
+	longcnt = BITS_TO_LONGS(div_u64(mtd->size, info->oops_size));
+	cxt->rmmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
+	cxt->usedmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
+
+	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
+	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
+
+	cxt->dev.total_size = mtd->size;
+	/* just support dmesg right now */
+	cxt->dev.flags = PSTORE_FLAGS_DMESG;
+	cxt->dev.read = mtdpstore_read;
+	cxt->dev.write = mtdpstore_write;
+	cxt->dev.erase = mtdpstore_erase;
+	cxt->dev.panic_write = mtdpstore_panic_write;
+
+	ret = psblk_register_device(&cxt->dev);
+	if (ret) {
+		dev_err(&mtd->dev, "mtd%d register to psblk failed\n",
+				mtd->index);
+		return;
+	}
+	cxt->mtd = mtd;
+	dev_info(&mtd->dev, "Attached to MTD device %d\n", mtd->index);
+}
+
+static int mtdpstore_flush_removed_do(struct mtdpstore_context *cxt,
+		loff_t off, size_t size)
+{
+	struct mtd_info *mtd = cxt->mtd;
+	u_char *buf;
+	int ret;
+	size_t retlen;
+	struct erase_info erase;
+
+	buf = kmalloc(mtd->erasesize, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* 1st. read to cache */
+	ret = mtd_read(mtd, off, mtd->erasesize, &retlen, buf);
+	if (mtdpstore_is_io_error(ret))
+		goto free;
+
+	/* 2nd. erase block */
+	erase.len = mtd->erasesize;
+	erase.addr = off;
+	ret = mtd_erase(mtd, &erase);
+	if (ret)
+		goto free;
+
+	/* 3rd. write back */
+	while (size) {
+		unsigned int zonesize = cxt->info.oops_size;
+
+		/* there is valid data on block, write back */
+		if (mtdpstore_is_used(cxt, off)) {
+			ret = mtd_write(mtd, off, zonesize, &retlen, buf);
+			if (ret)
+				dev_err(&mtd->dev, "write failure at %lld (%zu of %u written), err %d\n",
+						off, retlen, zonesize, ret);
+		}
+
+		off += zonesize;
+		size -= min_t(unsigned int, zonesize, size);
+	}
+
+free:
+	kfree(buf);
+	return ret;
+}
+
+/*
+ * What does mtdpstore_flush_removed() do?
+ * When user remove any log file on pstore filesystem, mtdpstore should do
+ * something to ensure log file removed. If the whole block is no longer used,
+ * it's nice to erase the block. However if the block still contains valid log,
+ * what mtdpstore can do is to erase and write the valid log back.
+ */
+static int mtdpstore_flush_removed(struct mtdpstore_context *cxt)
+{
+	struct mtd_info *mtd = cxt->mtd;
+	int ret;
+	loff_t off;
+	u32 blkcnt = (u32)div_u64(mtd->size, mtd->erasesize);
+
+	for (off = 0; blkcnt > 0; blkcnt--, off += mtd->erasesize) {
+		ret = mtdpstore_block_isbad(cxt, off);
+		if (ret)
+			continue;
+
+		ret = mtdpstore_block_is_removed(cxt, off);
+		if (!ret)
+			continue;
+
+		ret = mtdpstore_flush_removed_do(cxt, off, mtd->erasesize);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static void mtdpstore_notify_remove(struct mtd_info *mtd)
+{
+	struct mtdpstore_context *cxt = &oops_cxt;
+
+	if (mtd->index != cxt->index || cxt->index < 0)
+		return;
+
+	mtdpstore_flush_removed(cxt);
+
+	psblk_unregister_device(&cxt->dev);
+	kfree(cxt->badmap);
+	kfree(cxt->usedmap);
+	kfree(cxt->rmmap);
+	cxt->mtd = NULL;
+	cxt->index = -1;
+}
+
+static struct mtd_notifier mtdpstore_notifier = {
+	.add	= mtdpstore_notify_add,
+	.remove	= mtdpstore_notify_remove,
+};
+
+static int __init mtdpstore_init(void)
+{
+	int ret;
+	struct mtdpstore_context *cxt = &oops_cxt;
+	struct mtd_info *mtd = cxt->mtd;
+	struct psblk_info *info = &cxt->info;
+
+	ret = psblk_usr_info(info);
+	if (unlikely(ret))
+		return ret;
+
+	if (strlen(info->device) == 0) {
+		dev_err(&mtd->dev, "mtd device must be supplied\n");
+		return -EINVAL;
+	}
+	if (!info->oops_size) {
+		dev_err(&mtd->dev, "no recorder enabled\n");
+		return -EINVAL;
+	}
+
+	/* Setup the MTD device to use */
+	ret = kstrtoint((char *)info->device, 0, &cxt->index);
+	if (ret)
+		cxt->index = -1;
+
+	register_mtd_user(&mtdpstore_notifier);
+	return 0;
+}
+module_init(mtdpstore_init);
+
+static void __exit mtdpstore_exit(void)
+{
+	unregister_mtd_user(&mtdpstore_notifier);
+}
+module_exit(mtdpstore_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("WeiXiong Liao <liaoweixiong@allwinnertech.com>");
+MODULE_DESCRIPTION("MTD Oops/Panic console logger/driver");
-- 
1.9.1

