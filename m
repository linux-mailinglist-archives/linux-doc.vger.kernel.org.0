Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58DF6744826
	for <lists+linux-doc@lfdr.de>; Sat,  1 Jul 2023 11:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjGAJMI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 1 Jul 2023 05:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjGAJMH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Jul 2023 05:12:07 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E179CBB;
        Sat,  1 Jul 2023 02:12:04 -0700 (PDT)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QtRFD2wsdzMn1v;
        Sat,  1 Jul 2023 17:08:48 +0800 (CST)
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
Subject: [PATCH -next v6 0/2] support allocating crashkernel above 4G explicitly on riscv
Date:   Sat, 1 Jul 2023 17:11:36 +0000
Message-ID: <20230701171138.1491206-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
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

On riscv, the current crash kernel allocation logic is trying to
allocate within 32bit addressible memory region by default, if
failed, try to allocate without 4G restriction.

In need of saving DMA zone memory while allocating a relatively large
crash kernel region, allocating the reserved memory top down in
high memory, without overlapping the DMA zone, is a mature solution.
Hence this patchset introduces the parameter option crashkernel=X,[high,low].

One can reserve the crash kernel from high memory above DMA zone range
by explicitly passing "crashkernel=X,high"; or reserve a memory range
below 4G with "crashkernel=X,low". Besides, there are few rules need
to take notice:
1. "crashkernel=X,[high,low]" will be ignored if "crashkernel=size"
   is specified.
2. "crashkernel=X,low" is valid only when "crashkernel=X,high" is passed
   and there is enough memory to be allocated under 4G.
3. When allocating crashkernel above 4G and no "crashkernel=X,low" is
   specified, a 128M low memory will be allocated automatically for
   swiotlb bounce buffer.
See Documentation/admin-guide/kernel-parameters.txt for more information.

To verify loading the crashkernel, adapted kexec-tools is attached below:
https://github.com/chenjh005/kexec-tools/tree/build-test-riscv-v2

Following test cases have been performed as expected:
1) crashkernel=256M                          //low=256M
2) crashkernel=1G                            //low=1G
3) crashkernel=4G                            //high=4G, low=128M(default)
4) crashkernel=4G crashkernel=256M,high      //high=4G, low=128M(default), high is ignored
5) crashkernel=4G crashkernel=256M,low       //high=4G, low=128M(default), low is ignored
6) crashkernel=4G,high                       //high=4G, low=128M(default)
7) crashkernel=256M,low                      //low=0M, invalid
8) crashkernel=4G,high crashkernel=256M,low  //high=4G, low=256M
9) crashkernel=4G,high crashkernel=4G,low    //high=0M, low=0M, invalid
10) crashkernel=512M@0xd0000000              //low=512M

Changes since [v6]:
1. Introduce the "high" flag to mark whether "crashkernel=X,high"
   is passed. Fix the retrying logic between "crashkernel=X,high"
   case and others when the first allocation attempt fails.

Changes since [v5]:
1. Update the crashkernel allocation logic when crashkernel=X,high
   is specified. In this case, region above 4G will directly get
   reserved as crashkernel, rather than trying lower 32bit allocation
   first.

Changes since [v4]:
1. Update some imprecise code comments for cmdline parsing.

Changes since [v3]:
1. Update to print warning and return explicitly on failure when
   crashkernel=size@offset is specified. Not changing the result
   in this case but making the logic more straightforward.
2. Some minor cleanup.

Changes since [v2]:
1. Update the allocation logic to ensure the high crashkernel
   region is reserved strictly above dma32_phys_limit.
2. Clean up some minor format problems.

Chen Jiahao (2):
  riscv: kdump: Implement crashkernel=X,[high,low]
  docs: kdump: Update the crashkernel description for riscv

 .../admin-guide/kernel-parameters.txt         | 15 ++--
 arch/riscv/kernel/setup.c                     |  5 ++
 arch/riscv/mm/init.c                          | 84 +++++++++++++++++--
 3 files changed, 90 insertions(+), 14 deletions(-)

-- 
2.34.1

