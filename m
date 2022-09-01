Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB265A98E8
	for <lists+linux-doc@lfdr.de>; Thu,  1 Sep 2022 15:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbiIANeS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 1 Sep 2022 09:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234574AbiIANdp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 09:33:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCDE550B5
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 06:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662039036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=IcHCrvjCE7qtALGNStawEUH+LGJ9Jmkk8BL/jOwlOco=;
        b=hG/OaTPg21VmwVeu300fy+P80ELcB7yuxzSBGRf+ivtfCUw68BOxRXElfR18PfZ/4Zinjg
        09/G6Fmtn0PKYLXWTeNWgSYHgppSdKGbSQ/ZnlQhlrZ6QfBt3QbUdqzMop0lbJLBtdXIS8
        tvFHAmNZkRMOnorIZmZbchynGoyVXe0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-5i7otMifODK8a_DEazubhA-1; Thu, 01 Sep 2022 09:30:34 -0400
X-MC-Unique: 5i7otMifODK8a_DEazubhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E9AF8037AE;
        Thu,  1 Sep 2022 13:30:33 +0000 (UTC)
Received: from localhost (ovpn-8-28.pek2.redhat.com [10.72.8.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B603A2166B26;
        Thu,  1 Sep 2022 13:30:31 +0000 (UTC)
From:   Ming Lei <ming.lei@redhat.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        Ming Lei <ming.lei@redhat.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Richard W . M . Jones" <rjones@redhat.com>,
        ZiyangZhang <ZiyangZhang@linux.alibaba.com>,
        Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>,
        Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH V3 1/1] Docs: ublk: add ublk document
Date:   Thu,  1 Sep 2022 21:30:22 +0800
Message-Id: <20220901133022.698343-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add documentation for ublk subsystem. It was supposed to be documented when
merging the driver, but missing at that time.

Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Richard W.M. Jones <rjones@redhat.com>
Cc: ZiyangZhang <ZiyangZhang@linux.alibaba.com>
Cc: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
V3:
    - add more words on UBLK_IO_NEED_GET_DATA, from Ziyang
    - improve grammar & fix warning on 'make htmldocs', from Bagas Sanjaya
    - other trivial change, suggested by Richard W.M. Jones
V2:
    - integrate all kinds of cleanup from Bagas Sanjaya
    - add 'why useful' paragraph from Stefan
    - replace ublksrv with ublksrv for representing generic ublk
      userspace for convenience of reference, as suggested by Stefan
    - add entry to block/index.rst for removing ktest waring
    - add MAINTAINER entry
    - add more references, such as zero copy and nbdublk
    - thanks review/suggestion from Bagas Sanjaya, Richard W.M. Jones, Stefan Hajnoczi
    and ZiyangZhang

 Documentation/block/index.rst |   1 +
 Documentation/block/ublk.rst  | 253 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   1 +
 3 files changed, 255 insertions(+)
 create mode 100644 Documentation/block/ublk.rst

diff --git a/Documentation/block/index.rst b/Documentation/block/index.rst
index 68f115f2b1c6..c4c73db748a8 100644
--- a/Documentation/block/index.rst
+++ b/Documentation/block/index.rst
@@ -23,3 +23,4 @@ Block
    stat
    switching-sched
    writeback_cache_control
+   ublk
diff --git a/Documentation/block/ublk.rst b/Documentation/block/ublk.rst
new file mode 100644
index 000000000000..a102f4c1ab2e
--- /dev/null
+++ b/Documentation/block/ublk.rst
@@ -0,0 +1,253 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================
+Userspace block device driver (ublk driver)
+===========================================
+
+Overview
+========
+
+ublk is a generic framework for implementing block device logic from userspace.
+The motivation behind it is moving virtual block drivers into userspace,
+such as loop, nbd and similar can be very helpful. It can help to implement
+new virtual block device such as ublk-qcow2 (there was several attempts of
+implementing qcow2 driver in kernel).
+
+Userspace block devices are attractive because:
+
+- They can be written many programming languages.
+- They can use libraries that are not available in the kernel.
+- They can be debugged with tools familiar to application developers.
+- Crashes do not kernel panic the machine.
+- Bugs are likely to have a lower security impact than bugs in kernel
+  code.
+- They can be installed and updated independently of the kernel.
+- They can be used to simulate block device easily with user specified
+  parameters/setting for test/debug purpose
+
+ublk block device (``/dev/ublkb*``) is added by ublk driver. Any IO request
+on the device will be forwarded to ublk userspace program. For convenience,
+in this document, ``ublk server`` refers to generic ublk userspace
+program. ``ublksrv`` [#userspace]_ is one of such implementation. It
+provides ``libublksrv`` [#userspace_lib]_ library for developing specific
+user block device conveniently, while also generic type block device is
+included, such as loop and null. Richard W.M. Jones wrote userspace nbd device
+``nbdublk`` [#userspace_nbdublk]_  based on ``libublksrv`` [#userspace_lib]_.
+
+After the IO is handled by userspace, the result is committed back to the
+driver, thus completing the request cycle. This way, any specific IO handling
+logic is totally done by userspace, such as loop's IO handling, NBD's IO
+communication, or qcow2's IO mapping.
+
+``/dev/ublkb*`` is driven by blk-mq request-based driver. Each request is
+assigned by one queue wide unique tag. ublk server assigns unique tag to each
+IO too, which is 1:1 mapped with IO of ``/dev/ublkb*``.
+
+Both the IO request forward and IO handling result committing are done via
+``io_uring`` passthrough command; that is why ublk is also one io_uring based
+block driver. It has been observed that using io_uring passthrough command can
+give better IOPS than block IO; which is why ublk is one of high performance
+implementation of userspace block device: not only IO request communication is
+done by io_uring, but also the preferred IO handling in ublk server is io_uring
+based approach too.
+
+ublk provides control interface to set/get ublk block device parameters.
+The interface is extendable and kabi compatible: basically any ublk request
+queue's parameter or ublk generic feature parameters can be set/get via the
+interface. Thus, ublk is generic userspace block device framework.
+For example, it is easy to setup a ublk device with specified block
+parameters from userspace.
+
+Using ublk
+==========
+
+ublk requires userspace ublk server to handle real block device logic.
+
+Below is example of using ``ublksrv`` to provide ublk-based loop device.
+
+- add a device::
+
+     ublk add -t loop -f ublk-loop.img
+
+- format with xfs, then use it::
+
+     mkfs.xfs /dev/ublkb0
+     mount /dev/ublkb0 /mnt
+     # do anything. all IOs are handled by io_uring
+     ...
+     umount /mnt
+
+- list the devices with their info::
+
+     ublk list
+
+- delete the device::
+
+     ublk del -a
+     ublk del -n $ublk_dev_id
+
+See usage details in README of ``ublksrv`` [#userspace_readme]_.
+
+Design
+======
+
+Control plane
+-------------
+
+ublk driver provides global misc device node (``/dev/ublk-control``) for
+managing and controlling ublk devices with help of several control commands:
+
+- ``UBLK_CMD_ADD_DEV``
+
+  Add a ublk char device (``/dev/ublkc*``) which is talked with ublk server
+  WRT IO command communication. Basic device info is sent together with this
+  command. It sets UAPI structure of ``ublksrv_ctrl_dev_info``,
+  such as ``nr_hw_queues``, ``queue_depth``, and max IO request buffer size,
+  for which the info is negotiated with the driver and sent back to the server.
+  When this command is completed, the basic device info is immutable.
+
+- ``UBLK_CMD_SET_PARAMS`` / ``UBLK_CMD_GET_PARAMS``
+
+  Set or get parameters of the device, which can be either generic feature
+  related, or request queue limit related, but can't be IO logic specific,
+  because the driver does not handle any IO logic. This command has to be
+  sent before sending ``UBLK_CMD_START_DEV``.
+
+- ``UBLK_CMD_START_DEV``
+
+  After the server prepares userspace resources (such as creating per-queue
+  pthread & io_uring for handling ublk IO), this command is sent to the
+  driver for allocating & exposing ``/dev/ublkb*``. Parameters set via
+  ``UBLK_CMD_SET_PARAMS`` are applied for creating the device.
+
+- ``UBLK_CMD_STOP_DEV``
+
+  Halt IO on ``/dev/ublkb*`` and remove the device. When this command returns,
+  ublk server will release resources (such as destroying per-queue pthread &
+  io_uring).
+
+- ``UBLK_CMD_DEL_DEV``
+
+  Remove ``/dev/ublkc*``. When this command returns, the allocated ublk device
+  number can be reused.
+
+- ``UBLK_CMD_GET_QUEUE_AFFINITY``
+
+  When ``/dev/ublkc`` is added, the driver creates block layer tagset, so
+  that each queue's affinity info is available. The server sends
+  ``UBLK_CMD_GET_QUEUE_AFFINITY`` to retrieve queue affinity info. It can
+  set up the per-queue context efficiently, such as bind affine CPUs with IO
+  pthread and try to allocate buffers in IO thread context.
+
+- ``UBLK_CMD_GET_DEV_INFO``
+
+  For retrieving device info via ``ublksrv_ctrl_dev_info``. It is the server's
+  responsibility to save IO target specific info in userspace.
+
+Data plane
+----------
+
+ublk server needs to create per-queue IO pthread & io_uring for handling IO
+commands via io_uring passthrough. The per-queue IO pthread
+focuses on IO handling and shouldn't handle any control & management
+tasks.
+
+The's IO is assigned by a unique tag, which is 1:1 mapping with IO
+request of ``/dev/ublkb*``.
+
+UAPI structure of ``ublksrv_io_desc`` is defined for describing each IO from
+ublk driver. A fixed mmaped area (array) on ``/dev/ublkc*`` is provided for
+exporting IO info to the server; such as IO offset, length, OP/flags and
+buffer address. Each ``ublksrv_io_desc`` instance can be indexed via queue id
+and IO tag directly.
+
+The following IO commands are communicated via io_uring passthrough command,
+and each command is only for forwarding ublk IO and committing IO result
+with specified IO tag in the command data:
+
+- ``UBLK_IO_FETCH_REQ``
+
+  Sent from the server IO pthread for fetching future incoming IO requests
+  destined to ``/dev/ublkb*``. This command is sent only once from the server
+  IO pthread for ublk driver to setup IO forward environment.
+
+- ``UBLK_IO_COMMIT_AND_FETCH_REQ``
+
+  When an IO request is destined to ``/dev/ublkb*``, the driver stores
+  the IO's ``ublksrv_io_desc`` to the specified mapped area; then the
+  previous received IO command of this IO tag (either ``UBLK_IO_FETCH_REQ``
+  or ``UBLK_IO_COMMIT_AND_FETCH_REQ)`` is completed, so the server gets
+  the IO notification via io_uring.
+
+  After the server handles the IO, its result is committed back to the
+  driver by sending ``UBLK_IO_COMMIT_AND_FETCH_REQ`` back. Once ublkdrv
+  received this command, it parses the result and complete the request to
+  ``/dev/ublkb*``. In the meantime setup environment for fetching future
+  requests with the same IO tag. That is, ``UBLK_IO_COMMIT_AND_FETCH_REQ``
+  is reused for both fetching request and committing back IO result.
+
+- ``UBLK_IO_NEED_GET_DATA``
+
+  With ``UBLK_F_NEED_GET_DATA`` enabled, the WRITE request will be firstly
+  issued to ublk server without data copy. Then, IO backend of ublk server
+  receives the request and it can allocate data buffer and embed its addr
+  inside this new io command. After the kernel driver gets the command,
+  data copy is done from request pages to this backend's buffer. Finally,
+  backend receives the request again with data to be written and it can
+  truly handle the request.
+
+  ``UBLK_IO_NEED_GET_DATA`` adds one additional round-trip and one
+  io_uring_enter() syscall. Any user thinks that it may lower performance
+  should not enable UBLK_F_NEED_GET_DATA. ublk server pre-allocates IO
+  buffer for each IO by default. Any new project should try to use this
+  buffer to communicate with ublk driver. However, existing project may
+  break or not able to consume the new buffer interface; that's why this
+  command is added for backwards compatibility so that existing projects
+  can still consume existing buffers.
+
+- data copy between ublk server IO buffer and ublk block IO request
+
+  The driver needs to copy the block IO request pages into the server buffer
+  (pages) first for WRITE before notifying the server of the coming IO, so
+  that the server can handle WRITE request.
+
+  When the server handles READ request and sends
+  ``UBLK_IO_COMMIT_AND_FETCH_REQ`` to the server, ublkdrv needs to copy
+  the server buffer (pages) read to the IO request pages.
+
+Future development
+==================
+
+Container-aware ublk deivice
+----------------------------
+
+ublk driver doesn't handle any IO logic. Its function is well defined
+for now and very limited userspace interfaces are needed, which is also
+well defined too. It is possible to make ublk devices container-aware block
+devices in future as Stefan Hajnoczi suggested [#stefan]_, by removing
+ADMIN privilege.
+
+Zero copy
+---------
+
+Zero copy is a generic requirement for nbd, fuse or similar drivers. A
+problem [#xiaoguang]_ Xiaoguang mentioned is that pages mapped to userspace
+can't be remapped any more in kernel with existing mm interfaces. This can
+occurs when destining direct IO to ``/dev/ublkb*``. Also he reported that
+big requests (>= 256 KB IO) may benefit a lot from zero copy.
+
+
+References
+==========
+
+.. [#userspace] https://github.com/ming1/ubdsrv
+
+.. [#userspace_lib] https://github.com/ming1/ubdsrv/tree/master/lib
+
+.. [#userspace_nbdublk] https://gitlab.com/rwmjones/libnbd/-/tree/nbdublk
+
+.. [#userspace_readme] https://github.com/ming1/ubdsrv/blob/master/README
+
+.. [#stefan] https://lore.kernel.org/linux-block/YoOr6jBfgVm8GvWg@stefanha-x1.localdomain/
+
+.. [#xiaoguang] https://lore.kernel.org/linux-block/YoOr6jBfgVm8GvWg@stefanha-x1.localdomain/
diff --git a/MAINTAINERS b/MAINTAINERS
index f512b430c7cb..08a5c465a160 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20760,6 +20760,7 @@ UBLK USERSPACE BLOCK DRIVER
 M:	Ming Lei <ming.lei@redhat.com>
 L:	linux-block@vger.kernel.org
 S:	Maintained
+F:	Documentation/block/index.rst
 F:	drivers/block/ublk_drv.c
 F:	include/uapi/linux/ublk_cmd.h
 
-- 
2.31.1

