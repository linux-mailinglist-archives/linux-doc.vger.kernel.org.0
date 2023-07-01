Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694A8744824
	for <lists+linux-doc@lfdr.de>; Sat,  1 Jul 2023 11:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjGAJMH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 1 Jul 2023 05:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjGAJMG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Jul 2023 05:12:06 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B64BC;
        Sat,  1 Jul 2023 02:12:05 -0700 (PDT)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QtRFj4111ztQSN;
        Sat,  1 Jul 2023 17:09:13 +0800 (CST)
Received: from huawei.com (10.67.174.205) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 1 Jul
 2023 17:12:00 +0800
From:   Chen Jiahao <chenjiahao16@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>
CC:     <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <conor.dooley@microchip.com>, <guoren@kernel.org>,
        <heiko@sntech.de>, <bjorn@rivosinc.com>, <alex@ghiti.fr>,
        <akpm@linux-foundation.org>, <atishp@rivosinc.com>,
        <bhe@redhat.com>, <thunder.leizhen@huawei.com>, <horms@kernel.org>
Subject: [PATCH -next v6 2/2] docs: kdump: Update the crashkernel description for riscv
Date:   Sat, 1 Jul 2023 17:11:38 +0000
Message-ID: <20230701171138.1491206-3-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230701171138.1491206-1-chenjiahao16@huawei.com>
References: <20230701171138.1491206-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.174.205]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now "crashkernel=" parameter on riscv has been updated to support
crashkernel=X,[high,low]. Through which we can reserve memory region
above/within 32bit addressible DMA zone.

Here update the parameter description accordingly.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 24477a616cd2..991f436ee39d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -862,7 +862,7 @@
 			memory region [offset, offset + size] for that kernel
 			image. If '@offset' is omitted, then a suitable offset
 			is selected automatically.
-			[KNL, X86-64, ARM64] Select a region under 4G first, and
+			[KNL, X86-64, ARM64, RISCV] Select a region under 4G first, and
 			fall back to reserve region above 4G when '@offset'
 			hasn't been specified.
 			See Documentation/admin-guide/kdump/kdump.rst for further details.
@@ -875,14 +875,14 @@
 			Documentation/admin-guide/kdump/kdump.rst for an example.
 
 	crashkernel=size[KMG],high
-			[KNL, X86-64, ARM64] range could be above 4G. Allow kernel
-			to allocate physical memory region from top, so could
-			be above 4G if system have more than 4G ram installed.
-			Otherwise memory region will be allocated below 4G, if
-			available.
+			[KNL, X86-64, ARM64, RISCV] range could be above 4G.
+			Allow kernel to allocate physical memory region from top,
+			so could be above 4G if system have more than 4G ram
+			installed. Otherwise memory region will be allocated
+			below 4G, if available.
 			It will be ignored if crashkernel=X is specified.
 	crashkernel=size[KMG],low
-			[KNL, X86-64, ARM64] range under 4G. When crashkernel=X,high
+			[KNL, X86-64, ARM64, RISCV] range under 4G. When crashkernel=X,high
 			is passed, kernel could allocate physical memory region
 			above 4G, that cause second kernel crash on system
 			that require some amount of low memory, e.g. swiotlb
@@ -893,6 +893,7 @@
 			size is	platform dependent.
 			  --> x86: max(swiotlb_size_or_default() + 8MiB, 256MiB)
 			  --> arm64: 128MiB
+			  --> riscv: 128MiB
 			This one lets the user specify own low range under 4G
 			for second kernel instead.
 			0: to disable low allocation.
-- 
2.34.1

