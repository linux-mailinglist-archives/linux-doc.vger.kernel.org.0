Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5551CC0A7
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2020 13:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgEILOz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 9 May 2020 07:14:55 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:59364 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725920AbgEILOy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 07:14:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0326913-0.000123543-0.967185;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03310;MF=liaoweixiong@allwinnertech.com;NM=1;PH=DS;RN=20;RT=20;SR=0;TI=SMTPD_---.HVopGr-_1589022874;
Received: from PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com fp:SMTPD_---.HVopGr-_1589022874)
          by smtp.aliyun-inc.com(10.147.44.129);
          Sat, 09 May 2020 19:14:43 +0800
From:   WeiXiong Liao <liaoweixiong@allwinnertech.com>
To:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v5 03/12] pstore/blk: Introduce backend for block devices
Date:   Sat,  9 May 2020 19:14:05 +0800
Message-Id: <1589022854-19821-4-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589022854-19821-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1589022854-19821-1-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

pstore/blk is similar to pstore/ram, but uses a block device as the
storage rather than persistent ram.

The pstore/blk backend solves two common use-cases that used to preclude
using pstore/ram:
- not all devices have a battery that could be used to persist
  regular RAM across power failures.
- most embedded intelligent equipment have no persistent ram, which
  increases costs, instead preferring cheaper solutions, like block
  devices.

pstore/blk provides separate configurations for the end user and for the
block drivers. User configuration determines how pstore/blk operates, such
as record sizes, max kmsg dump reasons, etc. These can be set by Kconfig
and/or module parameters, but module parameter have priority over Kconfig.
Driver configuration covers all the details about the target block device,
such as total size of the device and how to perform read/write operations.
These are provided by block drivers, calling pstore_register_blkdev(),
including an optional panic_write callback used to bypass regular IO
APIs in an effort to avoid potentially destabilized kernel code during
a panic.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-3-git-send-email-liaoweixiong@allwinnertech.com
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/Kconfig          |  64 +++++++
 fs/pstore/Makefile         |   3 +
 fs/pstore/blk.c            | 426 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pstore_blk.h |  27 +++
 4 files changed, 520 insertions(+)
 create mode 100644 fs/pstore/blk.c
 create mode 100644 include/linux/pstore_blk.h

diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index 98d2457bdd9f..92ba73bd0b62 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -160,3 +160,67 @@ config PSTORE_ZONE
 	help
 	  The common layer for pstore/blk (and pstore/ram in the future)
 	  to manage storage in zones.
+
+config PSTORE_BLK
+	tristate "Log panic/oops to a block device"
+	depends on PSTORE
+	depends on BLOCK
+	select PSTORE_ZONE
+	default n
+	help
+	  This enables panic and oops message to be logged to a block dev
+	  where it can be read back at some later point.
+
+	  If unsure, say N.
+
+config PSTORE_BLK_BLKDEV
+	string "block device identifier"
+	depends on PSTORE_BLK
+	default ""
+	help
+	  Which block device should be used for pstore/blk.
+
+	  It accept the following variants:
+	  1) <hex_major><hex_minor> device number in hexadecimal represents
+	     itself no leading 0x, for example b302.
+	  2) /dev/<disk_name> represents the device number of disk
+	  3) /dev/<disk_name><decimal> represents the device number
+	     of partition - device number of disk plus the partition number
+	  4) /dev/<disk_name>p<decimal> - same as the above, this form is
+	     used when disk name of partitioned disk ends with a digit.
+	  5) PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing the
+	     unique id of a partition if the partition table provides it.
+	     The UUID may be either an EFI/GPT UUID, or refer to an MSDOS
+	     partition using the format SSSSSSSS-PP, where SSSSSSSS is a zero-
+	     filled hex representation of the 32-bit "NT disk signature", and PP
+	     is a zero-filled hex representation of the 1-based partition number.
+	  6) PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation
+	     to a partition with a known unique id.
+	  7) <major>:<minor> major and minor number of the device separated by
+	     a colon.
+
+	  NOTE that, both Kconfig and module parameters can configure
+	  pstore/blk, but module parameters have priority over Kconfig.
+
+config PSTORE_BLK_KMSG_SIZE
+	int "Size in Kbytes of kmsg dump log to store"
+	depends on PSTORE_BLK
+	default 64
+	help
+	  This just sets size of kmsg dump (oops, panic, etc) log for
+	  pstore/blk. The size is in KB and must be a multiple of 4.
+
+	  NOTE that, both Kconfig and module parameters can configure
+	  pstore/blk, but module parameters have priority over Kconfig.
+
+config PSTORE_BLK_MAX_REASON
+	int "Maximum kmsg dump reason to store"
+	depends on PSTORE_BLK
+	default 2
+	help
+	  The maximum reason for kmsg dumps to store. The default is
+	  2 (KMSG_DUMP_OOPS), see include/linux/kmsg_dump.h's
+	  enum kmsg_dump_reason for more details.
+
+	  NOTE that, both Kconfig and module parameters can configure
+	  pstore/blk, but module parameters have priority over Kconfig.
diff --git a/fs/pstore/Makefile b/fs/pstore/Makefile
index 58a967cbe4af..c270467aeece 100644
--- a/fs/pstore/Makefile
+++ b/fs/pstore/Makefile
@@ -15,3 +15,6 @@ obj-$(CONFIG_PSTORE_RAM)	+= ramoops.o
 
 pstore_zone-objs += zone.o
 obj-$(CONFIG_PSTORE_ZONE)	+= pstore_zone.o
+
+pstore_blk-objs += blk.o
+obj-$(CONFIG_PSTORE_BLK)	+= pstore_blk.o
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
new file mode 100644
index 000000000000..e249b22ff55f
--- /dev/null
+++ b/fs/pstore/blk.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define MODNAME "pstore-blk"
+#define pr_fmt(fmt) MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "../../block/blk.h"
+#include <linux/blkdev.h>
+#include <linux/string.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pstore_blk.h>
+#include <linux/mount.h>
+#include <linux/uio.h>
+
+static long kmsg_size = CONFIG_PSTORE_BLK_KMSG_SIZE;
+module_param(kmsg_size, long, 0400);
+MODULE_PARM_DESC(kmsg_size, "kmsg dump record size in kbytes");
+
+static int max_reason = CONFIG_PSTORE_BLK_MAX_REASON;
+module_param(max_reason, int, 0400);
+MODULE_PARM_DESC(max_reason,
+		 "maximum reason for kmsg dump (default 2: Oops and Panic)");
+
+/*
+ * blkdev - The block device to use.
+ *
+ * Most of the time, it is a partition of block device.
+ *
+ * blkdev accepts the following variants:
+ * 1) <hex_major><hex_minor> device number in hexadecimal represents itself
+ *    no leading 0x, for example b302.
+ * 2) /dev/<disk_name> represents the device number of disk
+ * 3) /dev/<disk_name><decimal> represents the device number
+ *    of partition - device number of disk plus the partition number
+ * 4) /dev/<disk_name>p<decimal> - same as the above, that form is
+ *    used when disk name of partitioned disk ends on a digit.
+ * 5) PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing the
+ *    unique id of a partition if the partition table provides it.
+ *    The UUID may be either an EFI/GPT UUID, or refer to an MSDOS
+ *    partition using the format SSSSSSSS-PP, where SSSSSSSS is a zero-
+ *    filled hex representation of the 32-bit "NT disk signature", and PP
+ *    is a zero-filled hex representation of the 1-based partition number.
+ * 6) PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation to
+ *    a partition with a known unique id.
+ * 7) <major>:<minor> major and minor number of the device separated by
+ *    a colon.
+ */
+static char blkdev[80] = CONFIG_PSTORE_BLK_BLKDEV;
+module_param_string(blkdev, blkdev, 80, 0400);
+MODULE_PARM_DESC(blkdev, "the block device for general read/write");
+
+static DEFINE_MUTEX(psz_lock);
+static struct block_device *psblk_bdev;
+static struct pstore_zone_info *pstore_zone_info;
+static psblk_panic_write_op blkdev_panic_write;
+static struct bdev_info {
+	dev_t devt;
+	sector_t nr_sects;
+	sector_t start_sect;
+} g_bdev_info;
+
+/**
+ * struct psblk_device - back-end pstore/blk driver structure.
+ *
+ * @total_size: The total size in bytes pstore/blk can use. It must be greater
+ *		than 4096 and be multiple of 4096.
+ * @read:	The general read operation. Both of the function parameters
+ *		@size and @offset are relative value to bock device (not the
+ *		whole disk).
+ *		On success, the number of bytes should be returned, others
+ *		means error.
+ * @write:	The same as @read.
+ * @panic_write:The write operation only used for panic case. It's optional
+ *		if you do not care panic log. The parameters and return value
+ *		are the same as @read.
+ */
+struct psblk_device {
+	unsigned long total_size;
+	psz_read_op read;
+	psz_write_op write;
+	psz_write_op panic_write;
+};
+
+static int psblk_register_do(struct psblk_device *dev)
+{
+	int ret;
+
+	if (!dev || !dev->total_size || !dev->read || !dev->write)
+		return -EINVAL;
+
+	mutex_lock(&psz_lock);
+
+	/* someone already registered before */
+	if (pstore_zone_info) {
+		mutex_unlock(&psz_lock);
+		return -EBUSY;
+	}
+	pstore_zone_info = kzalloc(sizeof(struct pstore_zone_info), GFP_KERNEL);
+	if (!pstore_zone_info) {
+		mutex_unlock(&psz_lock);
+		return -ENOMEM;
+	}
+
+#define verify_size(name, alignsize) {					\
+		long _##name_ = (name);					\
+		_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
+		if (_##name_ & ((alignsize) - 1)) {			\
+			pr_info(#name " must align to %d\n",		\
+					(alignsize));			\
+			_##name_ = ALIGN(name, (alignsize));		\
+		}							\
+		name = _##name_ / 1024;					\
+		pstore_zone_info->name = _##name_;			\
+	}
+
+	verify_size(kmsg_size, 4096);
+#undef verify_size
+
+	pstore_zone_info->total_size = dev->total_size;
+	pstore_zone_info->max_reason = max_reason;
+	pstore_zone_info->read = dev->read;
+	pstore_zone_info->write = dev->write;
+	pstore_zone_info->panic_write = dev->panic_write;
+	pstore_zone_info->name = MODNAME;
+	pstore_zone_info->owner = THIS_MODULE;
+
+	ret = register_pstore_zone(pstore_zone_info);
+	if (ret) {
+		kfree(pstore_zone_info);
+		pstore_zone_info = NULL;
+	}
+	mutex_unlock(&psz_lock);
+	return ret;
+}
+
+static void psblk_unregister_do(struct psblk_device *dev)
+{
+	mutex_lock(&psz_lock);
+	if (pstore_zone_info && pstore_zone_info->read == dev->read) {
+		unregister_pstore_zone(pstore_zone_info);
+		kfree(pstore_zone_info);
+		pstore_zone_info = NULL;
+	}
+	mutex_unlock(&psz_lock);
+}
+
+/**
+ * psblk_get_bdev() - open block device
+ * @holder: exclusive holder identifier
+ *
+ * Return: pointer to block device on success and others on error.
+ *
+ * On success, the returned block_device has reference count of one.
+ */
+static struct block_device *psblk_get_bdev(void *holder)
+{
+	struct block_device *bdev = ERR_PTR(-ENODEV);
+	fmode_t mode = FMODE_READ | FMODE_WRITE;
+
+	if (!blkdev[0])
+		return ERR_PTR(-ENODEV);
+
+	mutex_lock(&psz_lock);
+	if (pstore_zone_info)
+		goto out;
+	if (holder)
+		mode |= FMODE_EXCL;
+	bdev = blkdev_get_by_path(blkdev, mode, holder);
+	if (IS_ERR(bdev)) {
+		dev_t devt;
+
+		devt = name_to_dev_t(blkdev);
+		if (devt == 0) {
+			bdev = ERR_PTR(-ENODEV);
+			goto out;
+		}
+		bdev = blkdev_get_by_dev(devt, mode, holder);
+	}
+out:
+	mutex_unlock(&psz_lock);
+	return bdev;
+}
+
+static void psblk_put_bdev(struct block_device *bdev, void *holder)
+{
+	fmode_t mode = FMODE_READ | FMODE_WRITE;
+
+	if (!bdev)
+		return;
+
+	mutex_lock(&psz_lock);
+	if (holder)
+		mode |= FMODE_EXCL;
+	blkdev_put(bdev, mode);
+	mutex_unlock(&psz_lock);
+}
+
+static ssize_t psblk_generic_blk_read(char *buf, size_t bytes, loff_t pos)
+{
+	struct block_device *bdev = psblk_bdev;
+	struct file file;
+	struct kiocb kiocb;
+	struct iov_iter iter;
+	struct kvec iov = {.iov_base = buf, .iov_len = bytes};
+
+	if (!bdev)
+		return -ENODEV;
+
+	memset(&file, 0, sizeof(struct file));
+	file.f_mapping = bdev->bd_inode->i_mapping;
+	file.f_flags = O_DSYNC | __O_SYNC | O_NOATIME;
+	file.f_inode = bdev->bd_inode;
+	file_ra_state_init(&file.f_ra, file.f_mapping);
+
+	init_sync_kiocb(&kiocb, &file);
+	kiocb.ki_pos = pos;
+	iov_iter_kvec(&iter, READ, &iov, 1, bytes);
+
+	return generic_file_read_iter(&kiocb, &iter);
+}
+
+static ssize_t psblk_generic_blk_write(const char *buf, size_t bytes,
+		loff_t pos)
+{
+	struct block_device *bdev = psblk_bdev;
+	struct iov_iter iter;
+	struct kiocb kiocb;
+	struct file file;
+	ssize_t ret;
+	struct kvec iov = {.iov_base = (void *)buf, .iov_len = bytes};
+
+	if (!bdev)
+		return -ENODEV;
+
+	/* Console/Ftrace backend may handle buffer until flush dirty zones */
+	if (in_interrupt() || irqs_disabled())
+		return -EBUSY;
+
+	memset(&file, 0, sizeof(struct file));
+	file.f_mapping = bdev->bd_inode->i_mapping;
+	file.f_flags = O_DSYNC | __O_SYNC | O_NOATIME;
+	file.f_inode = bdev->bd_inode;
+
+	init_sync_kiocb(&kiocb, &file);
+	kiocb.ki_pos = pos;
+	iov_iter_kvec(&iter, WRITE, &iov, 1, bytes);
+
+	inode_lock(bdev->bd_inode);
+	ret = generic_write_checks(&kiocb, &iter);
+	if (ret > 0)
+		ret = generic_perform_write(&file, &iter, pos);
+	inode_unlock(bdev->bd_inode);
+
+	if (likely(ret > 0)) {
+		const struct file_operations f_op = {.fsync = blkdev_fsync};
+
+		file.f_op = &f_op;
+		kiocb.ki_pos += ret;
+		ret = generic_write_sync(&kiocb, ret);
+	}
+	return ret;
+}
+
+static inline unsigned long psblk_bdev_size(struct block_device *bdev)
+{
+	return (unsigned long)part_nr_sects_read(bdev->bd_part) << SECTOR_SHIFT;
+}
+
+static ssize_t psblk_blk_panic_write(const char *buf, size_t size,
+		loff_t off)
+{
+	int ret;
+
+	if (!blkdev_panic_write)
+		return -EOPNOTSUPP;
+
+	/* size and off must align to SECTOR_SIZE for block device */
+	ret = blkdev_panic_write(buf, off >> SECTOR_SHIFT,
+			size >> SECTOR_SHIFT);
+	return ret ? -EIO : size;
+}
+
+static struct bdev_info *psblk_get_bdev_info(void)
+{
+	struct bdev_info *info = &g_bdev_info;
+	struct block_device *bdev;
+
+	if (info->devt)
+		return info;
+
+	bdev = psblk_get_bdev(NULL);
+	if (IS_ERR(bdev))
+		return ERR_CAST(bdev);
+
+	info->devt = bdev->bd_dev;
+	info->nr_sects = part_nr_sects_read(bdev->bd_part);
+	info->start_sect = get_start_sect(bdev);
+
+	if (!psblk_bdev_size(bdev)) {
+		pr_err("not enough space to '%s'\n", blkdev);
+		info = ERR_PTR(-ENOSPC);
+	}
+
+	psblk_put_bdev(bdev, NULL);
+	return info;
+}
+
+/**
+ * psblk_register_blkdev() - register block device to pstore/blk
+ *
+ * @major: the major device number of registering device
+ * @panic_write: the interface for panic case.
+ *
+ * Only the matching major to @blkdev can register.
+ *
+ * If block device do not support panic write, @panic_write can be NULL.
+ *
+ * Return:
+ * * 0		- OK
+ * * Others	- something error.
+ */
+int psblk_register_blkdev(unsigned int major, psblk_panic_write_op panic_write)
+{
+	struct block_device *bdev;
+	struct psblk_device dev = {0};
+	struct bdev_info *binfo;
+	int ret = -ENODEV;
+	void *holder = blkdev;
+
+	binfo = psblk_get_bdev_info();
+	if (IS_ERR(binfo))
+		return PTR_ERR(binfo);
+
+	/* only allow driver matching the @blkdev */
+	if (!binfo->devt || MAJOR(binfo->devt) != major) {
+		pr_debug("invalid major %u (expect %u)\n",
+				major, MAJOR(binfo->devt));
+		return -ENODEV;
+	}
+
+	/* hold bdev exclusively */
+	bdev = psblk_get_bdev(holder);
+	if (IS_ERR(bdev)) {
+		pr_err("failed to open '%s'!\n", blkdev);
+		return PTR_ERR(bdev);
+	}
+
+	/* psblk_bdev must be assigned before register to pstore/blk */
+	psblk_bdev = bdev;
+	blkdev_panic_write = panic_write;
+
+	dev.total_size = psblk_bdev_size(bdev);
+	dev.panic_write = panic_write ? psblk_blk_panic_write : NULL;
+	dev.read = psblk_generic_blk_read;
+	dev.write = psblk_generic_blk_write;
+
+	ret = psblk_register_do(&dev);
+	if (ret)
+		goto err_put_bdev;
+
+	pr_info("using '%s'\n", blkdev);
+	return 0;
+
+err_put_bdev:
+	psblk_bdev = NULL;
+	blkdev_panic_write = NULL;
+	psblk_put_bdev(bdev, holder);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(psblk_register_blkdev);
+
+/**
+ * psblk_unregister_blkdev() - unregister block device from pstore/blk
+ *
+ * @major: the major device number of device
+ */
+void psblk_unregister_blkdev(unsigned int major)
+{
+	struct psblk_device dev = {.read = psblk_generic_blk_read};
+	void *holder = blkdev;
+
+	if (psblk_bdev && MAJOR(psblk_bdev->bd_dev) == major) {
+		psblk_unregister_do(&dev);
+		psblk_put_bdev(psblk_bdev, holder);
+		blkdev_panic_write = NULL;
+		psblk_bdev = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(psblk_unregister_blkdev);
+
+/**
+ * psblk_blkdev_info() - get information of @blkdev
+ *
+ * @devt: the block device num of @blkdev
+ * @nr_sects: the sector count of @blkdev
+ * @start_sect: the start sector of @blkdev
+ *
+ * Block driver needs the follow information for @panic_write.
+ *
+ * Return: 0 on success, others on failure.
+ */
+int psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect)
+{
+	struct bdev_info *binfo;
+
+	binfo = psblk_get_bdev_info();
+	if (IS_ERR(binfo))
+		return PTR_ERR(binfo);
+
+	if (devt)
+		*devt = binfo->devt;
+	if (nr_sects)
+		*nr_sects = binfo->nr_sects;
+	if (start_sect)
+		*start_sect = binfo->start_sect;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(psblk_blkdev_info);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("WeiXiong Liao <liaoweixiong@allwinnertech.com>");
+MODULE_DESCRIPTION("pstore backend for block devices");
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
new file mode 100644
index 000000000000..5ff465e3953e
--- /dev/null
+++ b/include/linux/pstore_blk.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __PSTORE_BLK_H_
+#define __PSTORE_BLK_H_
+
+#include <linux/types.h>
+#include <linux/pstore_zone.h>
+
+/**
+ * typedef psblk_panic_write_op - panic write operation to block device
+ *
+ * @buf: the data to write
+ * @start_sect: start sector to block device
+ * @sects: sectors count on buf
+ *
+ * Return: On success, zero should be returned. Others mean error.
+ *
+ * Panic write to block device must be aligned to SECTOR_SIZE.
+ */
+typedef int (*psblk_panic_write_op)(const char *buf, sector_t start_sect,
+		sector_t sects);
+
+int  psblk_register_blkdev(unsigned int major, psblk_panic_write_op panic_write);
+void psblk_unregister_blkdev(unsigned int major);
+int  psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect);
+
+#endif
-- 
1.9.1

