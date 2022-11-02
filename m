Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 195E3615754
	for <lists+linux-doc@lfdr.de>; Wed,  2 Nov 2022 03:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiKBCIc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Nov 2022 22:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiKBCIb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Nov 2022 22:08:31 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0230713D6D
        for <linux-doc@vger.kernel.org>; Tue,  1 Nov 2022 19:08:30 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N29FM20xczpW8G;
        Wed,  2 Nov 2022 10:04:55 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 10:08:28 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 10:08:27 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-doc@vger.kernel.org>
CC:     Yang Yingliang <yangyingliang@huawei.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation: devres: add missing REGULATOR helper
Date:   Wed, 2 Nov 2022 10:07:16 +0800
Message-ID: <20221102020716.1397449-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add missing devm_regulator_bulk_get_const() to devres.rst, it's introduced
by commit 1de452a0edda ("regulator: core: Allow drivers to define their init
data as const").

Fixes: 1de452a0edda ("regulator: core: Allow drivers to define their init data as const")
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 687adb58048e..ff8158274fb3 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -408,6 +408,7 @@ PWM
 REGULATOR
   devm_regulator_bulk_register_supply_alias()
   devm_regulator_bulk_get()
+  devm_regulator_bulk_get_const()
   devm_regulator_bulk_get_enable()
   devm_regulator_bulk_put()
   devm_regulator_get()
-- 
2.25.1

