Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B157142131
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2020 02:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbgATBEM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 19 Jan 2020 20:04:12 -0500
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:60272 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729123AbgATBEL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Jan 2020 20:04:11 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.06712966|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.241667-0.0180241-0.740309;DS=CONTINUE|ham_system_inform|0.0778515-0.000343831-0.921805;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03297;MF=liaoweixiong@allwinnertech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.Gf.OYKf_1579482234;
Received: from PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com fp:SMTPD_---.Gf.OYKf_1579482234)
          by smtp.aliyun-inc.com(10.147.42.16);
          Mon, 20 Jan 2020 09:04:06 +0800
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
Subject: [PATCH v1 07/11] pstore/blk: skip broken zone for mtd device
Date:   Mon, 20 Jan 2020 09:03:49 +0800
Message-Id: <1579482233-2672-8-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It's one of a series of patches for adaptive to MTD device.

MTD device is not block device. As the block of flash (MTD device) will
be broken, it's necessary for pstore/blk to skip the broken block
(bad block).

If device drivers return -ENEXT, pstore/blk will try next zone of dmesg.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
---
 Documentation/admin-guide/pstore-block.rst |  3 +-
 fs/pstore/blkzone.c                        | 74 +++++++++++++++++++++++-------
 include/linux/blkoops.h                    |  4 +-
 include/linux/pstore_blk.h                 |  4 ++
 4 files changed, 66 insertions(+), 19 deletions(-)

diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
index 58418d429c55..aea6d2664a22 100644
--- a/Documentation/admin-guide/pstore-block.rst
+++ b/Documentation/admin-guide/pstore-block.rst
@@ -185,7 +185,8 @@ The parameter @offset is the relative position of the device.
 Normally the number of bytes read/written should be returned, while for error,
 negative number will be returned. The following return numbers mean more:
 
--EBUSY: pstore/blk should try again later.
+1. -EBUSY: pstore/blk should try again later.
+#. -ENEXT: this zone is used or broken, pstore/blk should try next one.
 
 panic_write (for non-block device)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/fs/pstore/blkzone.c b/fs/pstore/blkzone.c
index 66ae8e2a924b..3f58ff85f49c 100644
--- a/fs/pstore/blkzone.c
+++ b/fs/pstore/blkzone.c
@@ -223,6 +223,9 @@ static int blkz_zone_write(struct blkz_zone *zone,
 
 	return 0;
 set_dirty:
+	/* no need to mark dirty if going to try next zone */
+	if (wcnt == -ENEXT)
+		return -ENEXT;
 	atomic_set(&zone->dirty, true);
 	/* flush dirty zones nicely */
 	if (wcnt == -EBUSY && !is_on_panic())
@@ -376,7 +379,11 @@ static int blkz_recover_dmesg_meta(struct blkz_context *cxt)
 			return -EINVAL;
 
 		rcnt = info->read((char *)buf, len, zone->off);
-		if (rcnt != len) {
+		if (rcnt == -ENEXT) {
+			pr_debug("%s with id %lu may be broken, skip\n",
+					zone->name, i);
+			continue;
+		} else if (rcnt != len) {
 			pr_err("read %s with id %lu failed\n", zone->name, i);
 			return (int)rcnt < 0 ? (int)rcnt : -EIO;
 		}
@@ -666,24 +673,58 @@ static void blkz_write_kmsg_hdr(struct blkz_zone *zone,
 		hdr->counter = 0;
 }
 
+/*
+ * In case zone is broken, which may occur to MTD device, we try each zones,
+ * start at cxt->dmesg_write_cnt.
+ */
 static inline int notrace blkz_dmesg_write_do(struct blkz_context *cxt,
 		struct pstore_record *record)
 {
+	int ret = -EBUSY;
 	size_t size, hlen;
 	struct blkz_zone *zone;
-	unsigned int zonenum;
+	unsigned int i;
 
-	zonenum = cxt->dmesg_write_cnt;
-	zone = cxt->dbzs[zonenum];
-	if (unlikely(!zone))
-		return -ENOSPC;
-	cxt->dmesg_write_cnt = (zonenum + 1) % cxt->dmesg_max_cnt;
+	for (i = 0; i < cxt->dmesg_max_cnt; i++) {
+		unsigned int zonenum, len;
+
+		zonenum = (cxt->dmesg_write_cnt + i) % cxt->dmesg_max_cnt;
+		zone = cxt->dbzs[zonenum];
+		if (unlikely(!zone))
+			return -ENOSPC;
 
-	pr_debug("write %s to zone id %d\n", zone->name, zonenum);
-	blkz_write_kmsg_hdr(zone, record);
-	hlen = sizeof(struct blkz_dmesg_header);
-	size = min_t(size_t, record->size, zone->buffer_size - hlen);
-	return blkz_zone_write(zone, FLUSH_ALL, record->buf, size, hlen);
+		/* avoid destorying old data, allocate a new one */
+		len = zone->buffer_size + sizeof(*zone->buffer);
+		zone->oldbuf = zone->buffer;
+		zone->buffer = kzalloc(len, GFP_KERNEL);
+		if (!zone->buffer) {
+			zone->buffer = zone->oldbuf;
+			return -ENOMEM;
+		}
+		zone->buffer->sig = zone->oldbuf->sig;
+
+		pr_debug("write %s to zone id %d\n", zone->name, zonenum);
+		blkz_write_kmsg_hdr(zone, record);
+		hlen = sizeof(struct blkz_dmesg_header);
+		size = min_t(size_t, record->size, zone->buffer_size - hlen);
+		ret = blkz_zone_write(zone, FLUSH_ALL, record->buf, size, hlen);
+		if (likely(!ret || ret != -ENEXT)) {
+			cxt->dmesg_write_cnt = zonenum + 1;
+			cxt->dmesg_write_cnt %= cxt->dmesg_max_cnt;
+			/* no need to try next zone, free last zone buffer */
+			kfree(zone->oldbuf);
+			zone->oldbuf = NULL;
+			return ret;
+		}
+
+		pr_debug("zone %u may be broken, try next dmesg zone\n",
+				zonenum);
+		kfree(zone->buffer);
+		zone->buffer = zone->oldbuf;
+		zone->oldbuf = NULL;
+	}
+
+	return -EBUSY;
 }
 
 static int notrace blkz_dmesg_write(struct blkz_context *cxt,
@@ -807,7 +848,6 @@ static int notrace blkz_pstore_write(struct pstore_record *record)
 	}
 }
 
-#define READ_NEXT_ZONE ((ssize_t)(-1024))
 static struct blkz_zone *blkz_read_next_zone(struct blkz_context *cxt)
 {
 	struct blkz_zone *zone = NULL;
@@ -868,7 +908,7 @@ static ssize_t blkz_dmesg_read(struct blkz_zone *zone,
 	if (blkz_read_dmesg_hdr(zone, record)) {
 		atomic_set(&zone->buffer->datalen, 0);
 		atomic_set(&zone->dirty, 0);
-		return READ_NEXT_ZONE;
+		return -ENEXT;
 	}
 	size -= sizeof(struct blkz_dmesg_header);
 
@@ -893,7 +933,7 @@ static ssize_t blkz_dmesg_read(struct blkz_zone *zone,
 	if (unlikely(blkz_zone_read(zone, record->buf + hlen, size,
 				sizeof(struct blkz_dmesg_header)) < 0)) {
 		kfree(record->buf);
-		return READ_NEXT_ZONE;
+		return -ENEXT;
 	}
 
 	return size + hlen;
@@ -907,7 +947,7 @@ static ssize_t blkz_record_read(struct blkz_zone *zone,
 
 	buf = (struct blkz_buffer *)zone->oldbuf;
 	if (!buf)
-		return READ_NEXT_ZONE;
+		return -ENEXT;
 
 	size = atomic_read(&buf->datalen);
 	start = atomic_read(&buf->start);
@@ -959,7 +999,7 @@ static ssize_t blkz_pstore_read(struct pstore_record *record)
 	}
 
 	ret = readop(zone, record);
-	if (ret == READ_NEXT_ZONE)
+	if (ret == -ENEXT)
 		goto next_zone;
 	return ret;
 }
diff --git a/include/linux/blkoops.h b/include/linux/blkoops.h
index 8f40f225545d..71c596fd4cc8 100644
--- a/include/linux/blkoops.h
+++ b/include/linux/blkoops.h
@@ -27,6 +27,7 @@
  *	On error, negative number should be returned. The following returning
  *	number means more:
  *	  -EBUSY: pstore/blk should try again later.
+ *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
  * @panic_write:
  *	The write operation only used for panic.
  *
@@ -45,7 +46,8 @@ struct blkoops_device {
 
 /*
  * Panic write for block device who should write alignmemt to SECTOR_SIZE.
- * On success, zero should be returned. Others mean error.
+ * On success, zero should be returned. Others mean error except that -ENEXT
+ * means the zone is used or broken, pstore/blk should try next one.
  */
 typedef int (*blkoops_blk_panic_write_op)(const char *buf, sector_t start_sect,
 		sector_t sects);
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index 77704c1b404a..bbbe4fe37f7c 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -6,6 +6,9 @@
 #include <linux/types.h>
 #include <linux/blkdev.h>
 
+/* read/write function return -ENEXT means try next zone */
+#define ENEXT ((ssize_t)(1024))
+
 /**
  * struct blkz_info - backend blkzone driver structure
  *
@@ -42,6 +45,7 @@
  *	On error, negative number should be returned. The following returning
  *	number means more:
  *	  -EBUSY: pstore/blk should try again later.
+ *	  -ENEXT: this zone is used or broken, pstore/blk should try next one.
  * @panic_write:
  *	The write operation only used for panic. It's optional if you do not
  *	care panic record. If panic occur but blkzone do not recover yet, the
-- 
1.9.1

