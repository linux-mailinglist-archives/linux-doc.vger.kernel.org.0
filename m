Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94B285A3BD9
	for <lists+linux-doc@lfdr.de>; Sun, 28 Aug 2022 06:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbiH1Eu0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 28 Aug 2022 00:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiH1EuZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Aug 2022 00:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976AECE1E
        for <linux-doc@vger.kernel.org>; Sat, 27 Aug 2022 21:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661662221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Z4N2mShU2F+NTcI5qBpG9QMqojL5Q+6p5Bhy7zouWtE=;
        b=CwSAUUmrYmrWD6eO17i293Oq2+cvhFjDezpe0sD2N1YAyoCu4l5k5Sy/EsnKMzdW9Nj1bA
        9WPYqztpgJrKM38znj9W94utnvCftd6w65yfE70UwGAcIzgX6I7XdKPP9uPPg9b6N08jjo
        64D5YQuMND9pOE+Xye2qVAqyg2OpQT0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-NuFv7WgBMoatckQ8KlYUqw-1; Sun, 28 Aug 2022 00:50:17 -0400
X-MC-Unique: NuFv7WgBMoatckQ8KlYUqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 650581824634;
        Sun, 28 Aug 2022 04:50:17 +0000 (UTC)
Received: from localhost (ovpn-8-19.pek2.redhat.com [10.72.8.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4FC09492C3B;
        Sun, 28 Aug 2022 04:50:15 +0000 (UTC)
From:   Ming Lei <ming.lei@redhat.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-doc@vger.kernel.org, linux-block@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>, Ming Lei <ming.lei@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Richard W . M . Jones" <rjones@redhat.com>,
        ZiyangZhang <ZiyangZhang@linux.alibaba.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Subject: [PATCH] Docs: ublk: add ublk document
Date:   Sun, 28 Aug 2022 12:50:03 +0800
Message-Id: <20220828045003.537131-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ublk document is missed when merging ublk driver, so add it now.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Richard W.M. Jones <rjones@redhat.com>
Cc: ZiyangZhang <ZiyangZhang@linux.alibaba.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 Documentation/block/ublk.rst | 203 +++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)
 create mode 100644 Documentation/block/ublk.rst

diff --git a/Documentation/block/ublk.rst b/Documentation/block/ublk.rst
new file mode 100644
index 000000000000..9e8f7ba518a3
--- /dev/null
+++ b/Documentation/block/ublk.rst
@@ -0,0 +1,203 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================================
+Userspace block device driver(ublk driver)
+==========================================
+
+Overview
+========
+
+ublk is one generic framework for implementing block device logic from
+userspace. It is very helpful to move virtual block drivers into userspace,
+such as loop, nbd and similar block drivers. It can help to implement new
+virtual block device, such as ublk-qcow2, and there was several attempts
+of implementing qcow2 driver in kernel.
+
+ublk block device(``/dev/ublkb*``) is added by ublk driver. Any IO request
+submitted to ublk device will be forwarded to ublk's userspace part(
+ublksrv [1]), and after the IO is handled by ublksrv, the result is
+committed back to ublk driver, then ublk IO request can be completed. With
+this way, any specific IO handling logic is totally done inside ublksrv,
+and ublk driver doe _not_ handle any device specific IO logic, such as
+loop's IO handling, NBD's IO communication, or qcow2's IO mapping, ...
+
+/dev/ublkbN is driven by blk-mq request based driver, each request is
+assigned by one queue wide unique tag. ublksrv assigns unique tag to each
+IO too, which is 1:1 mapped with IO of /dev/ublkb*.
+
+Both the IO request forward and IO handling result committing are done via
+io_uring passthrough command, that is why ublk is also one io_uring based
+block driver. It has been observed that io_uring passthrough command can get
+better IOPS than block IO. So ublk is one high performance implementation
+of userspace block device. Not only IO request communication is done by
+io_uring, but also the preferred IO handling in ublksrv is io_uring based
+approach too.
+
+ublk provides control interface to set/get ublk block device parameters, and
+the interface is extendable and kabi compatible, so basically any ublk request
+queue's parameter or ublk generic feature parameters can be set/get via this
+extendable interface. So ublk is generic userspace block device framework, such
+as, it is easy to setup one ublk device with specified block parameters from
+userspace.
+
+How to use ublk
+===============
+
+After building ublksrv[1], ublk block device(``/dev/ublkb*``) can be added
+and deleted by the utility, then existed block IO applications can talk with
+it.
+
+See usage details in README[2] of ublksrv, for example of ublk-loop:
+
+- add ublk device:
+  ublk add -t loop -f ublk-loop.img
+
+- use it:
+  mkfs.xfs /dev/ublkb0
+  mount /dev/ublkb0 /mnt
+  ....                     # all IOs are handled by io_uring!!!
+  umount /mnt
+
+- get ublk dev info:
+  ublk list
+
+- delete ublk device
+  ublk del -a
+  ublk del -n $ublk_dev_id
+
+Design
+======
+
+Control plane
+-------------
+
+ublk driver provides global misc device node(``/dev/ublk-control``) for
+managing and controlling ublk devices with help of several control commands:
+
+- UBLK_CMD_ADD_DEV
+  Add one ublk char device(``/dev/ublkc*``) which is talked with ublksrv wrt.
+  IO command communication. Basic device info is sent together with this
+  command, see UAPI structure of ublksrv_ctrl_dev_info, such as nr_hw_queues,
+  queue_depth, and max IO request buffer size, which info is negotiated with
+  ublk driver and sent back to ublksrv. After this command is completed, the
+  basic device info can't be changed any more.
+
+- UBLK_CMD_SET_PARAMS / UBLK_CMD_GET_PARAMS
+  Set or get ublk device's parameters, which can be generic feature related,
+  or request queue limit related, but can't be IO logic specific, cause ublk
+  driver does not handle any IO logic. This command has to be sent before
+  sending UBLK_CMD_START_DEV.
+
+- UBLK_CMD_START_DEV
+  After ublksrv prepares userspace resource such as, creating per-queue
+  pthread & io_ruing for handling ublk IO, this command is set for ublk
+  driver to allocate & expose /dev/ublkb*. Parameters set via
+  UBLK_CMD_SET_PARAMS are applied for creating /dev/ublkb*.
+
+- UBLK_CMD_STOP_DEV
+  Quiesce IO on /dev/ublkb* and delete the disk. After this command returns,
+  ublksrv can release resource, such as destroy per-queue pthread & io_uring
+  for handling io command.
+
+- UBLK_CMD_DEL_DEV
+  Delete /dev/ublkc*. After this command returns, the allocated ublk device
+  number can be reused.
+
+- UBLK_CMD_GET_QUEUE_AFFINITY
+  After /dev/ublkc is added, ublk driver creates block layer tagset, so each
+  queue's affinity info is available, ublksrv sends UBLK_CMD_GET_QUEUE_AFFINITY
+  to retrieve queue affinity info, so ublksrv can setup the per-queue context
+  efficiently, such as bind affine CPUs with IO pthread, and try to allocate
+  buffers in IO thread context.
+
+- UBLK_CMD_GET_DEV_INFO
+  For retrieve device info of ublksrv_ctrl_dev_info. And it is ublksrv's
+  responsibility to save IO target specific info in userspace.
+
+Data plane
+----------
+
+ublksrv needs to create per-queue IO pthread & io_uring for handling IO
+command (io_uring passthrough command), and the per-queue IO pthread
+focuses on IO handling and shouldn't handle any control & management
+task.
+
+ublksrv's IO is assigned by one unique tag, which is 1:1 mapping with IO
+request of /dev/ublkb*.
+
+UAPI structure of ublksrv_io_desc is defined for describing each IO from
+ublk driver. One fixed mmaped area(array) on /dev/ublkc* is provided for
+exporting IO info to ublksrv, such as IO offset, length, OP/flags and
+buffer address. Each ublksrv_io_desc instance can be indexed via queue id
+and IO tag directly.
+
+Following IO commands are communicated via io_uring passthrough command,
+and each command is only for forwarding ublk IO and committing IO result
+with specified IO tag in the command data:
+
+- UBLK_IO_FETCH_REQ
+  Sent from ublksrv IO pthread for fetching future coming IO request
+  issued to /dev/ublkb*. This command is just sent once from ublksrv IO
+  pthread for ublk driver to setup IO forward environment.
+
+- UBLK_IO_COMMIT_AND_FETCH_REQ
+  After one IO request is issued to /dev/ublkb*, ublk driver stores this
+  IO's ublksrv_io_desc to the specified mapped area, then the previous
+  received IO command of this IO tag, either UBLK_IO_FETCH_REQ or
+  UBLK_IO_COMMIT_AND_FETCH_REQ, is completed, so ulksrv gets the IO
+  notification via io_uring.
+
+  After ublksrv handles this IO, this IO's result is committed back to ublk
+  driver by sending UBLK_IO_COMMIT_AND_FETCH_REQ back. Once ublkdrv received
+  this command, it parses the IO result and complete the IO request to
+  /dev/ublkb*. Meantime setup environment for fetching future IO request
+  with this IO tag. So UBLK_IO_COMMIT_AND_FETCH_REQ is reused for both
+  fetching request and committing back IO result.
+
+- UBLK_IO_NEED_GET_DATA
+  ublksrv pre-allocates IO buffer for each IO at default, any new project
+  should use this IO buffer to communicate with ublk driver. But existed
+  project may not work or be changed to in this way, so add this command
+  to provide chance for userspace to use its existed buffer for handling
+  IO.
+
+- data copy between ublkserv IO buffer and ublk block IO request
+  ublk driver needs to copy ublk block IO request pages into ublksrv buffer
+  (pages) first for WRITE before notifying ublksrv of the coming IO, so
+  ublksrv can hanldle WRITE request.
+
+  After ublksrv handles READ request and sends UBLK_IO_COMMIT_AND_FETCH_REQ
+  to ublksrv, ublkdrv needs to copy read ublksrv buffer(pages) to the ublk
+  IO request pages.
+
+Future development
+==================
+
+Container-ware ublk deivice
+---------------------------
+
+ublk driver doesn't handle any IO logic, and its function is well defined
+so far, and very limited userspace interfaces are needed, and each one is
+well defined too, then it is very likely to make ublk device one
+container-ware block device in future, as Stefan Hajnoczi suggested[3], by
+removing ADMIN privilege.
+
+Zero copy
+---------
+
+Wrt. zero copy support, it is one generic requirement for nbd, fuse or
+similar drivers, one problem Xiaoguang mentioned is that pages mapped to
+userspace can't be remapped any more in kernel with existed mm interfaces,
+and it can be involved when submitting direct IO to /dev/ublkb*. Also
+Xiaoguang reported that big request may benefit from zero copy a lot,
+such as >= 256KB IO.
+
+
+References
+==========
+
+[1] https://github.com/ming1/ubdsrv
+
+[2] https://github.com/ming1/ubdsrv/blob/master/README
+
+[3] https://lore.kernel.org/linux-block/YoOr6jBfgVm8GvWg@stefanha-x1.localdomain/
-- 
2.31.1

