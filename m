Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA2F62786F
	for <lists+linux-doc@lfdr.de>; Mon, 14 Nov 2022 10:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236670AbiKNJC4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Nov 2022 04:02:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236706AbiKNJCy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Nov 2022 04:02:54 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A921109;
        Mon, 14 Nov 2022 01:02:52 -0800 (PST)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N9jxf6wqqzmVyd;
        Mon, 14 Nov 2022 17:02:30 +0800 (CST)
Received: from dggpeml500002.china.huawei.com (7.185.36.158) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 17:02:50 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500002.china.huawei.com (7.185.36.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 17:02:50 +0800
From:   Junhao He <hejunhao3@huawei.com>
To:     <mathieu.poirier@linaro.org>, <suzuki.poulose@arm.com>,
        <mike.leach@linaro.org>, <leo.yan@linaro.org>,
        <jonathan.cameron@huawei.com>, <john.garry@huawei.com>
CC:     <coresight@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <lpieralisi@kernel.org>,
        <linuxarm@huawei.com>, <yangyicong@huawei.com>,
        <liuqi115@huawei.com>, <f.fangjian@huawei.com>,
        <prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH v13 0/2] Add support for UltraSoc System Memory Buffer
Date:   Mon, 14 Nov 2022 17:03:14 +0800
Message-ID: <20221114090316.63157-1-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500002.china.huawei.com (7.185.36.158)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support for UltraSoc System Memory Buffer.

Change since v12:
- Modify the code style and add "#ifdef CONFIG_ACPI" according to Jonathan's comment.
- Address the comments from Yicong.
- Link: https://lore.kernel.org/lkml/20221109135008.9485-1-hejunhao3@huawei.com/

Change since v11:
- Modify the code style and rename the macro according to Jonathan's comment.
- Link: https://lore.kernel.org/lkml/20221107130624.59886-1-hejunhao3@huawei.com/

Change since v10:
- Rebase onto v6.1-rc4, included similar sysfs register accessors (as same as James's patch)
- Link: https://lore.kernel.org/lkml/20221022115929.7503-1-hejunhao3@huawei.com/

Change since v9:
- Update the Contact tag in SMB document. 
- Replace the spinlock with mutex.
- Do some clean-ups in "smb_enable()" and "smb_release()".
- Use classic memory mapped interface.
- Link: https://lore.kernel.org/linux-arm-kernel/20220818132231.28240-1-hejunhao3@huawei.com/

Change since v8:
- Insert a blank line at the end of the config tag in Kconfig according to Randy's comment.
- Link: https://lore.kernel.org/linux-arm-kernel/20220816131634.38195-1-hejunhao3@huawei.com/

Change since v7:
- Use the macros for register bit flags and numbers of resource.
- Cleanup punctuation.
- Update the Date tag and the KernelVersion tag in the document.
- Link: https://lore.kernel.org/lkml/20220712091353.34540-1-hejunhao3@huawei.com/

Change since v6:
- Modify the code style and driver description according to Suzuki's comment.
- Modify configuration of "drvdata->reading", to void problems in open/read
  concurrency scenario.
- Rename the macro of "SMB_FLOW_MASK".
- Use the "handle->head" to determine the page number and offset.
- Link: https://lore.kernel.org/linux-arm-kernel/20220606130223.57354-1-liuqi115@huawei.com/

  Change since v5:
- Address the comments from Suzuki, add some comments in SMB document, and modify
  configuration of "drvdata->reading", to void problems in multi-core concurrency scenario
- Link: https://lore.kernel.org/linux-arm-kernel/20220416083953.52610-1-liuqi115@huawei.com/

Change since v4:
- Add a simple document of SMB driver according to Suzuki's comment.
- Address the comments from Suzuki.
- Link: https://lore.kernel.org/linux-arm-kernel/20220128061755.31909-1-liuqi115@huawei.com/

Change since v3:
- Modify the file header according to community specifications.
- Address the comments from Mathieu.
- Link: https://lore.kernel.org/linux-arm-kernel/20211118110016.40398-1-liuqi115@huawei.com/

Change since v2:
- Move ultrasoc driver to drivers/hwtracing/coresight by Mathieu's comment.
- Link: https://lists.linaro.org/pipermail/coresight/2021-November/007310.html

Change since v1:
- Drop the document of UltraSoc according to Mathieu's comment.
- Add comments to explain some private hardware settings.
- Address the comments from Mathieu.
- Link: https://lists.linaro.org/pipermail/coresight/2021-August/006842.html

Change since RFC:
- Move driver to drivers/hwtracing/coresight/ultrasoc.
- Remove ultrasoc-axi-com.c, as AXI-COM doesn't need to be configured in
  basic tracing function.
- Remove ultrasoc.c as SMB does not need to register with the ultrasoc core.
- Address the comments from Mathieu and Suzuki.
- Link: https://lists.linaro.org/pipermail/coresight/2021-June/006535.html

Qi Liu (2):
  drivers/coresight: Add UltraSoc System Memory Buffer driver
  Documentation: Add document for UltraSoc SMB drivers

 .../sysfs-bus-coresight-devices-ultra_smb     |  31 +
 .../trace/coresight/ultrasoc-smb.rst          |  82 +++
 drivers/hwtracing/coresight/Kconfig           |  11 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/ultrasoc-smb.c    | 646 ++++++++++++++++++
 drivers/hwtracing/coresight/ultrasoc-smb.h    | 120 ++++
 6 files changed, 891 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ultra_smb
 create mode 100644 Documentation/trace/coresight/ultrasoc-smb.rst
 create mode 100644 drivers/hwtracing/coresight/ultrasoc-smb.c
 create mode 100644 drivers/hwtracing/coresight/ultrasoc-smb.h

-- 
2.33.0

