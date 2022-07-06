Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3AF5687D4
	for <lists+linux-doc@lfdr.de>; Wed,  6 Jul 2022 14:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbiGFMK6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Jul 2022 08:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiGFMK5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 08:10:57 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57FB28E11;
        Wed,  6 Jul 2022 05:10:56 -0700 (PDT)
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LdJJF2PH9z6GDCP;
        Wed,  6 Jul 2022 20:09:49 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 6 Jul 2022 14:10:54 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 6 Jul 2022 13:10:48 +0100
From:   John Garry <john.garry@huawei.com>
To:     <axboe@kernel.dk>, <damien.lemoal@opensource.wdc.com>,
        <bvanassche@acm.org>, <hch@lst.de>, <jejb@linux.ibm.com>,
        <martin.petersen@oracle.com>, <hare@suse.de>, <satishkh@cisco.com>,
        <sebaddel@cisco.com>, <kartilak@cisco.com>
CC:     <linux-doc@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-nvme@lists.infradead.org>,
        <linux-s390@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <mpi3mr-linuxdrv.pdl@broadcom.com>, <linux-block@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <nbd@other.debian.org>,
        John Garry <john.garry@huawei.com>
Subject: [PATCH v3 0/6] blk-mq: Add a flag for reserved requests series
Date:   Wed, 6 Jul 2022 20:03:48 +0800
Message-ID: <1657109034-206040-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jens,

Can you please consider this series? Thanks

---

In [0] I included "blk-mq: Add a flag for reserved requests" to identify
if a request is 'reserved' for special handling. Doing this is easier than
passing a 'reserved' arg to the blk_mq_ops callbacks. Indeed, only 1x
timeout implementation or blk-mq iter function actually uses the
'reserved' arg (or 3x if you count SCSI core and FNIC SCSI driver). So
this series drops the 'reserved' arg for these timeout and iter functions.
Christoph suggested that I try to upstream now.

Differences to v2:
- Rebase
- Apply more RB tags (thanks!)

Differences to v1:
- Use "scsi_timeout" as name for SCSI timeout function and update docs
- Add RB tags (thanks!)
- Split out patch to drop local variables for 'reserved', as requested by
  Bart

Based on following:
e55cf7981405 (block/for-5.20/block) blk-cgroup: factor out blkcg_free_all_cpd()

[0] https://lore.kernel.org/linux-scsi/1654770559-101375-1-git-send-email-john.garry@huawei.com/T/#m22aa9f89e55835edc2e650d43f7e3219a3a1a324

John Garry (6):
  scsi: core: Remove reserved request time-out handling
  blk-mq: Add a flag for reserved requests
  blk-mq: Drop blk_mq_ops.timeout 'reserved' arg
  scsi: fnic: Drop reserved request handling
  blk-mq: Drop 'reserved' arg of busy_tag_iter_fn
  blk-mq: Drop local variable for reserved tag

 Documentation/scsi/scsi_eh.rst          |  3 +--
 Documentation/scsi/scsi_mid_low_api.rst |  2 +-
 block/blk-mq-debugfs.c                  |  2 +-
 block/blk-mq-tag.c                      | 13 +++++--------
 block/blk-mq.c                          | 22 +++++++++++++---------
 block/bsg-lib.c                         |  2 +-
 drivers/block/mtip32xx/mtip32xx.c       |  9 ++++-----
 drivers/block/nbd.c                     |  5 ++---
 drivers/block/null_blk/main.c           |  2 +-
 drivers/infiniband/ulp/srp/ib_srp.c     |  3 +--
 drivers/mmc/core/queue.c                |  3 +--
 drivers/nvme/host/apple.c               |  3 +--
 drivers/nvme/host/core.c                |  2 +-
 drivers/nvme/host/fc.c                  |  6 ++----
 drivers/nvme/host/nvme.h                |  2 +-
 drivers/nvme/host/pci.c                 |  2 +-
 drivers/nvme/host/rdma.c                |  3 +--
 drivers/nvme/host/tcp.c                 |  3 +--
 drivers/s390/block/dasd.c               |  2 +-
 drivers/s390/block/dasd_int.h           |  2 +-
 drivers/scsi/aacraid/comminit.c         |  2 +-
 drivers/scsi/aacraid/linit.c            |  2 +-
 drivers/scsi/fnic/fnic_scsi.c           | 14 ++++----------
 drivers/scsi/hosts.c                    | 14 ++++++--------
 drivers/scsi/mpi3mr/mpi3mr_os.c         | 16 ++++------------
 drivers/scsi/scsi_error.c               |  6 +++---
 drivers/scsi/scsi_lib.c                 |  8 --------
 drivers/scsi/scsi_priv.h                |  2 +-
 include/linux/blk-mq.h                  | 10 ++++++++--
 include/scsi/scsi_host.h                |  2 +-
 30 files changed, 70 insertions(+), 97 deletions(-)

-- 
2.35.3

