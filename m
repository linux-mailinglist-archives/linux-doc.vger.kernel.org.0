Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78DE55BB827
	for <lists+linux-doc@lfdr.de>; Sat, 17 Sep 2022 14:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiIQMTl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 17 Sep 2022 08:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIQMTj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Sep 2022 08:19:39 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D380BE2F;
        Sat, 17 Sep 2022 05:19:38 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MV8zB61xMzlVlS;
        Sat, 17 Sep 2022 20:15:34 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 17 Sep 2022 20:19:36 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 17 Sep
 2022 20:19:36 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-doc@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC:     <corbet@lwn.net>, <broonie@kernel.org>
Subject: [PATCH -next] Documentation: devres: add missing SPI helper
Date:   Sat, 17 Sep 2022 20:26:39 +0800
Message-ID: <20220917122639.1896965-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add devm_spi_alloc_master() and devm_spi_alloc_slave() to devres.rst.
They are introduced by commit 5e844cc37a5c ("spi: Introduce device-managed
SPI controller allocation").

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 Documentation/driver-api/driver-model/devres.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 76cc256c9e4f..1bd6f38dd7e3 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -437,6 +437,8 @@ SLAVE DMA ENGINE
 
 SPI
   devm_spi_register_master()
+  devm_spi_alloc_master()
+  devm_spi_alloc_slave()
 
 WATCHDOG
   devm_watchdog_register_device()
-- 
2.25.1

