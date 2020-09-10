Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920DB2653F4
	for <lists+linux-doc@lfdr.de>; Thu, 10 Sep 2020 23:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbgIJVmb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Sep 2020 17:42:31 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:37380 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730596AbgIJMWV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Sep 2020 08:22:21 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id C02707340C5C77DDC16C;
        Thu, 10 Sep 2020 20:22:11 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Sep 2020 20:22:05 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <corbet@lwn.net>, <keescook@chromium.org>, <anton@enomsg.org>,
        <ccross@android.com>, <tony.luck@intel.com>, <paulmck@kernel.org>,
        <tglx@linutronix.de>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <mchehab+huawei@kernel.org>,
        <pawan.kumar.gupta@linux.intel.com>, <rdunlap@infradead.org>,
        <mike.kravetz@oracle.com>, <oneukum@suse.com>,
        <linux-doc@vger.kernel.org>
CC:     <linuxarm@huawei.com>
Subject: [PATCH] Documentation: arm64 also supports disable hugeiomap
Date:   Thu, 10 Sep 2020 20:19:46 +0800
Message-ID: <1599740386-47210-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

arm64 also supports disable hugeiomap,updated documentation.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5debfe2..86a5e37 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3206,7 +3206,7 @@
 			register save and restore. The kernel will only save
 			legacy floating-point registers on task switch.
 
-	nohugeiomap	[KNL,X86,PPC] Disable kernel huge I/O mappings.
+	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
 
 	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
-- 
2.7.4

