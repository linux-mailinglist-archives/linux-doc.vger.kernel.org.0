Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190135B96DC
	for <lists+linux-doc@lfdr.de>; Thu, 15 Sep 2022 11:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiIOJB6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Sep 2022 05:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiIOJBv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Sep 2022 05:01:51 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6CD4DB65;
        Thu, 15 Sep 2022 02:01:49 -0700 (PDT)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MSrh92LPqzmVPx;
        Thu, 15 Sep 2022 16:58:01 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 17:01:47 +0800
From:   Zhao Gongyi <zhaogongyi@huawei.com>
To:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>
CC:     <akinobu.mita@gmail.com>, <corbet@lwn.net>, <david@redhat.com>,
        <osalvador@suse.de>, <shuah@kernel.org>,
        Zhao Gongyi <zhaogongyi@huawei.com>
Subject: [PATCH -next v2 1/5] docs: notifier-error-inject: fix non-working usage of negative values
Date:   Thu, 15 Sep 2022 16:57:53 +0800
Message-ID: <20220915085757.258608-2-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220915085757.258608-1-zhaogongyi@huawei.com>
References: <20220915085757.258608-1-zhaogongyi@huawei.com>
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

Fault injection uses debugfs in a way that the provided values via
sysfs are interpreted as u64. Providing negative numbers results in
an error:

  # cd sys/kernel/debug/notifier-error-inject/memory
  #  echo -12 > actions/MEM_GOING_ONLINE/error
  -bash: echo: write error: Invalid argument

Update the docs and examples to use "printf %#x <val>" in these cases.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../fault-injection/notifier-error-inject.rst          | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/fault-injection/notifier-error-inject.rst b/Documentation/fault-injection/notifier-error-inject.rst
index 1668b6e48d3a..0e2790122166 100644
--- a/Documentation/fault-injection/notifier-error-inject.rst
+++ b/Documentation/fault-injection/notifier-error-inject.rst
@@ -11,6 +11,10 @@ modules that can be used to test the following notifiers.
  * powerpc pSeries reconfig notifier
  * Netdevice notifier

+Note that the interface only accepts unsigned values. So, if you want
+to use a negative errno, you'd better use 'printf' instead of 'echo', e.g.:
+$ printf %#x -12 > actions/PM_SUSPEND_PREPARE/error
+
 PM notifier error injection module
 ----------------------------------
 This feature is controlled through debugfs interface
@@ -26,7 +30,7 @@ Possible PM notifier events to be failed are:
 Example: Inject PM suspend error (-12 = -ENOMEM)::

 	# cd /sys/kernel/debug/notifier-error-inject/pm/
-	# echo -12 > actions/PM_SUSPEND_PREPARE/error
+	# printf %#x -12 > actions/PM_SUSPEND_PREPARE/error
 	# echo mem > /sys/power/state
 	bash: echo: write error: Cannot allocate memory

@@ -44,7 +48,7 @@ Possible memory notifier events to be failed are:
 Example: Inject memory hotplug offline error (-12 == -ENOMEM)::

 	# cd /sys/kernel/debug/notifier-error-inject/memory
-	# echo -12 > actions/MEM_GOING_OFFLINE/error
+	# printf %#x -12 > actions/MEM_GOING_OFFLINE/error
 	# echo offline > /sys/devices/system/memory/memoryXXX/state
 	bash: echo: write error: Cannot allocate memory

@@ -82,7 +86,7 @@ Netdevice notifier events which can be failed are:
 Example: Inject netdevice mtu change error (-22 == -EINVAL)::

 	# cd /sys/kernel/debug/notifier-error-inject/netdev
-	# echo -22 > actions/NETDEV_CHANGEMTU/error
+	# printf %#x -22 > actions/NETDEV_CHANGEMTU/error
 	# ip link set eth0 mtu 1024
 	RTNETLINK answers: Invalid argument

--
2.17.1

