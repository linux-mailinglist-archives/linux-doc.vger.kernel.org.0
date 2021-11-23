Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346C745A320
	for <lists+linux-doc@lfdr.de>; Tue, 23 Nov 2021 13:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236886AbhKWMwh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Nov 2021 07:52:37 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:28093 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236766AbhKWMwf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Nov 2021 07:52:35 -0500
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hz3mt67tvz1DJfG;
        Tue, 23 Nov 2021 20:46:54 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 23 Nov 2021 20:49:25 +0800
Received: from thunder-town.china.huawei.com (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 23 Nov 2021 20:49:24 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
        <linux-kernel@vger.kernel.org>, Dave Young <dyoung@redhat.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        <kexec@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <devicetree@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Chen Zhou <dingguo.cz@antgroup.com>
Subject: [PATCH v16 03/11] x86: kdump: use macro CRASH_ADDR_LOW_MAX in functions reserve_crashkernel()
Date:   Tue, 23 Nov 2021 20:46:38 +0800
Message-ID: <20211123124646.1995-4-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20211123124646.1995-1-thunder.leizhen@huawei.com>
References: <20211123124646.1995-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Chen Zhou <chenzhou10@huawei.com>

To make the functions reserve_crashkernel() as generic,
replace some hard-coded numbers with macro CRASH_ADDR_LOW_MAX.

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/kernel/setup.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index a31352d8c404f6c..2330dcb83e8f06a 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -489,8 +489,9 @@ static void __init reserve_crashkernel(void)
 	if (!crash_base) {
 		/*
 		 * Set CRASH_ADDR_LOW_MAX upper bound for crash memory,
-		 * crashkernel=x,high reserves memory over 4G, also allocates
-		 * 256M extra low memory for DMA buffers and swiotlb.
+		 * crashkernel=x,high reserves memory over CRASH_ADDR_LOW_MAX,
+		 * also allocates 256M extra low memory for DMA buffers
+		 * and swiotlb.
 		 * But the extra memory is not required for all machines.
 		 * So try low memory first and fall back to high memory
 		 * unless "crashkernel=size[KMG],high" is specified.
@@ -518,7 +519,7 @@ static void __init reserve_crashkernel(void)
 		}
 	}
 
-	if (crash_base >= (1ULL << 32) && reserve_crashkernel_low()) {
+	if (crash_base >= CRASH_ADDR_LOW_MAX && reserve_crashkernel_low()) {
 		memblock_phys_free(crash_base, crash_size);
 		return;
 	}
-- 
2.25.1

