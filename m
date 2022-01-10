Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5DE488EB7
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jan 2022 03:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237100AbiAJCoM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 9 Jan 2022 21:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238212AbiAJCoL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 21:44:11 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC77C06173F
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 18:44:11 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id i8-20020a17090a138800b001b3936fb375so5191720pja.1
        for <linux-doc@vger.kernel.org>; Sun, 09 Jan 2022 18:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5TkKM0CFqeBKoVjW0LMSmrxQY9L/ZRtvlcrQTdH7JGU=;
        b=i7Ef/k4H8UlN/NBTUEznLP8w/SY/VmCd8MLHhHVsbWaLfgVAtvjHYvqc/ekor9yc2e
         JbD7+tgA73MUXXuJGg44BxcrXJKVznnYVqsOXMsEYabdAd9Q8zsRkr3UD7OmA2ilosuT
         251eu5CWtQw/bHJ5UdnXLR/jobofvkcq+JJQrsuqtt3wnxssOFS7yKUUZjSSCp+lXF9J
         H5ICvt1d9t8VhHU5iYujOlKnOBsgyKbyG7SZyw92h+NBHpdi9QTvRtY/gCd8UPLwkxtJ
         SkpokM7L3gB837H73WMhvDlVlN4MUXNl/Pvlim/xIKRR7tycLay/jmT2yaN8nUC0YlbE
         5h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5TkKM0CFqeBKoVjW0LMSmrxQY9L/ZRtvlcrQTdH7JGU=;
        b=lpsnEg01ckf31uOXUfjm3GSR3QjTMcn+ehIDMc/nIKHZKZqWJ5JRHXmMFEPyK5p7GJ
         AERZQD9n98jmK8D4Qr0VMSPxQpLLVG/XpRUel3A5bfFb+nq0ZKckvNeTmUQUT6ibLVpI
         xD2lnAg3pwsfD9nndzTk7/u4de5x6Hy60aFSWJk1gsGqMXtLDWgWXyWDO/jynFvsK0O0
         6epqoyZ1Ec8WZQedFVhPytyGiMTW9WmbfwmLJeQ00XDVn3lngs3LuDi4wau0rpAd8UZZ
         tKrGXwG8ppDxlxdAf1S3lzl4LP37OqMo45JrGmS99EUy+a/ZPgpDDGbsp53Grq2Si+3z
         VAeA==
X-Gm-Message-State: AOAM532TRxCpGG8F5weM37PxlH/zC/tYYlyDEmsCJit2wTIclysbJp0/
        vlH7mUE5BF/+OVLmJ9QfYJQ=
X-Google-Smtp-Source: ABdhPJwb4AvogtFVCGTY4gAQ4rzzOCrqWJ/ZR9lcj5/o/0A6AL3EOFLgzmgc+ABMC79e4VJo0Y1krA==
X-Received: by 2002:a17:902:8498:b0:14a:1b37:9f2b with SMTP id c24-20020a170902849800b0014a1b379f2bmr7766621plo.85.1641782651055;
        Sun, 09 Jan 2022 18:44:11 -0800 (PST)
Received: from localhost.localdomain (pcd454193.netvigator.com. [203.218.244.193])
        by smtp.gmail.com with ESMTPSA id u5sm4711511pfk.67.2022.01.09.18.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 18:44:10 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 3/3] docs/zh_CN: add balance translation
Date:   Mon, 10 Jan 2022 10:40:53 +0800
Message-Id: <b0ade8762e0bf0be2a38b4c37c3cae656962254b.1641782124.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1641782124.git.siyanteng@loongson.cn>
References: <cover.1641782124.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../vm/balance.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/balance.rst         | 81 +++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/balance.rst

diff --git a/Documentation/translations/zh_CN/vm/balance.rst b/Documentation/translations/zh_CN/vm/balance.rst
new file mode 100644
index 000000000000..e98a47ef24a8
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/balance.rst
@@ -0,0 +1,81 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/balance.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+========
+内存平衡
+========
+
+2000年1月开始，作者：Kanoj Sarcar <kanoj@sgi.com>
+
+对于 !__GFP_HIGH 和 !__GFP_KSWAPD_RECLAIM 以及非 __GFP_IO 的分配，需要进行
+内存平衡。
+
+调用者避免回收的第一个原因是调用者由于持有自旋锁或处于中断环境中而无法睡眠。第二个
+原因可能是，调用者愿意在不产生页面回收开销的情况下分配失败。这可能发生在有0阶回退
+选项的机会主义高阶分配请求中。在这种情况下，调用者可能也希望避免唤醒kswapd。
+
+__GFP_IO分配请求是为了防止文件系统死锁。
+
+在没有非睡眠分配请求的情况下，做平衡似乎是有害的。页面回收可以被懒散地启动，也就是
+说，只有在需要的时候（也就是区域的空闲内存为0），而不是让它成为一个主动的过程。
+
+也就是说，内核应该尝试从直接映射池中满足对直接映射页的请求，而不是回退到dma池中，
+这样就可以保持dma池为dma请求（不管是不是原子的）所填充。类似的争论也适用于高内存
+和直接映射的页面。相反，如果有很多空闲的dma页，最好是通过从dma池中分配一个来满足
+常规的内存请求，而不是产生常规区域平衡的开销。
+
+在2.2中，只有当空闲页总数低于总内存的1/64时，才会启动内存平衡/页面回收。如果dma
+和常规内存的比例合适，即使dma区完全空了，也很可能不会进行平衡。2.2已经在不同内存
+大小的生产机器上运行，即使有这个问题存在，似乎也做得不错。在2.3中，由于HIGHMEM的
+存在，这个问题变得更加严重。
+
+在2.3中，区域平衡可以用两种方式之一来完成：根据区域的大小（可能是低级区域的大小），
+我们可以在初始化阶段决定在平衡任何区域时应该争取多少空闲页。好的方面是，在平衡的时
+候，我们不需要看低级区的大小，坏的方面是，我们可能会因为忽略低级区可能较低的使用率
+而做过于频繁的平衡。另外，只要对分配程序稍作修改，就有可能将memclass()宏简化为一
+个简单的等式。
+
+另一个可能的解决方案是，我们只在一个区 **和** 其所有低级区的空闲内存低于该区及其
+低级区总内存的1/64时进行平衡。这就解决了2.2的平衡问题，并尽可能地保持了与2.2行为
+的接近。另外，平衡算法在各种架构上的工作方式也是一样的，这些架构有不同数量和类型的
+内存区。如果我们想变得更花哨一点，我们可以在未来为不同区域的自由页面分配不同的权重。
+
+请注意，如果普通区的大小与dma区相比是巨大的，那么在决定是否平衡普通区的时候，考虑
+空闲的dma页就变得不那么重要了。那么第一个解决方案就变得更有吸引力。
+
+所附的补丁实现了第二个解决方案。它还 “修复”了两个问题：首先，在低内存条件下，kswapd
+被唤醒，就像2.2中的非睡眠分配。第二，HIGHMEM区也被平衡了，以便给replace_with_highmem()
+一个争取获得HIGHMEM页的机会，同时确保HIGHMEM分配不会落回普通区。这也确保了HIGHMEM
+页不会被泄露（例如，在一个HIGHMEM页在交换缓存中但没有被任何人使用的情况下）。
+
+kswapd还需要知道它应该平衡哪些区。kswapd主要是在无法进行平衡的情况下需要的，可能
+是因为所有的分配请求都来自中断上下文，而所有的进程上下文都在睡眠。对于2.3，
+kswapd并不真正需要平衡高内存区，因为中断上下文并不请求高内存页。kswapd看zone
+结构体中的zone_wake_kswapd字段来决定一个区是否需要平衡。
+
+如果从进程内存和shm中偷取页面可以减轻该页面节点中任何区的内存压力，而该区的内存压力
+已经低于其水位，则会进行偷取。
+
+watemark[WMARK_MIN/WMARK_LOW/WMARK_HIGH]/low_on_memory/zone_wake_kswapd：
+这些是每个区的字段，用于确定一个区何时需要平衡。当页面数低于水位[WMARK_MIN]时，
+hysteric 的字段low_on_memory被设置。这个字段会一直被设置，直到空闲页数变成水位
+[WMARK_HIGH]。当low_on_memory被设置时，页面分配请求将尝试释放该区域的一些页面（如果
+请求中设置了GFP_WAIT）。与此相反的是，决定唤醒kswapd以释放一些区的页。这个决定不是基于
+hysteresis 的，而是当空闲页的数量低于watermark[WMARK_LOW]时就会进行；在这种情况下，
+zone_wake_kswapd也被设置。
+
+
+我所听到的（超棒的）想法：
+
+1. 动态经历应该影响平衡：可以跟踪一个区的失败请求的数量，并反馈到平衡方案中（jalvo@mbay.net）。
+
+2. 实现一个类似于replace_with_highmem()的replace_with_regular()，以保留dma页面。
+   (lkd@tantalophile.demon.co.uk)
diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 5fcdb75d8682..fc39f0d60318 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -22,10 +22,10 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    :maxdepth: 1
 
    active_mm
+   balance
 
 TODOLIST:
 * arch_pgtable_helpers
-* balance
 * damon/index
 * free_page_reporting
 * frontswap
-- 
2.27.0

