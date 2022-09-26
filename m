Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C0B5EA8D3
	for <lists+linux-doc@lfdr.de>; Mon, 26 Sep 2022 16:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234518AbiIZOp2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Sep 2022 10:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbiIZOoQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 10:44:16 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AB640E06;
        Mon, 26 Sep 2022 06:07:32 -0700 (PDT)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mbjc43ykJzlXPD;
        Mon, 26 Sep 2022 21:03:16 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 21:07:30 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>
CC:     <akinobu.mita@gmail.com>, <corbet@lwn.net>, <david@redhat.com>,
        <osalvador@suse.de>, <shuah@kernel.org>,
        Zhao Gongyi <zhaogongyi@huawei.com>
Subject: [PATCH -next v3 0/3] Optimize and bugfix for memory-hotplug
Date:   Mon, 26 Sep 2022 21:03:38 +0800
Message-ID: <20220926130341.253039-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

1. Add checking after online or offline
2. Restore memory before exit
3. Correct test's name

Changes in v3:
  - Remove 2 obselute patches

Zhao Gongyi (3):
  selftests/memory-hotplug: Add checking after online or offline
  selftests/memory-hotplug: Restore memory before exit
  docs: notifier-error-inject: Correct test's name

 .../fault-injection/notifier-error-inject.rst |  4 +--
 .../memory-hotplug/mem-on-off-test.sh         | 29 +++++++++++++++----
 2 files changed, 26 insertions(+), 7 deletions(-)

--
2.17.1

