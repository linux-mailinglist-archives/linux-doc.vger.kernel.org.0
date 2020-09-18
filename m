Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8E226F4A3
	for <lists+linux-doc@lfdr.de>; Fri, 18 Sep 2020 05:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgIRDS2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Sep 2020 23:18:28 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:34862 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726201AbgIRDS1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Sep 2020 23:18:27 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 75CFB92D4AECFBF39F52;
        Fri, 18 Sep 2020 11:18:22 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 11:18:16 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <corbet@lwn.net>, <keescook@chromium.org>, <anton@enomsg.org>,
        <ccross@android.com>, <tony.luck@intel.com>, <paulmck@kernel.org>,
        <tglx@linutronix.de>, <akpm@linux-foundation.org>, <bp@suse.de>,
        <mchehab+huawei@kernel.org>, <pawan.kumar.gupta@linux.intel.com>,
        <rdunlap@infradead.org>, <mike.kravetz@oracle.com>,
        <oneukum@suse.com>, <gpiccoli@canonical.com>,
        <linux-doc@vger.kernel.org>
CC:     <linuxarm@huawei.com>
Subject: [PATCH] Documentation: arm64 supports cma
Date:   Fri, 18 Sep 2020 11:15:53 +0800
Message-ID: <1600398953-55893-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

arm64 also supports cma, updated documentation.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7ebe3be..38a1602 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,7 +591,7 @@
 			some critical bits.
 
 	cma=nn[MG]@[start[MG][-end[MG]]]
-			[ARM,X86,KNL]
+			[ARM,ARM64,X86,KNL]
 			Sets the size of kernel global memory area for
 			contiguous memory allocations and optionally the
 			placement constraint by the physical address range of
-- 
2.7.4

