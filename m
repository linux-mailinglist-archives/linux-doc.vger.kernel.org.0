Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77D804D1175
	for <lists+linux-doc@lfdr.de>; Tue,  8 Mar 2022 09:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344731AbiCHIDF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Mar 2022 03:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344739AbiCHIDD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 03:03:03 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CAD3E5E6
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 00:02:06 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id t19so12795465plr.5
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 00:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ekd/xN/CAMqlsjRdRgshA/nuApjXxhIITrzRGQLRnxM=;
        b=IhEQyD17rnnVi45gts1ErSwOUQHanNoAlXxafs8YAsh5bEb433t2hOQh+aDpBBeti6
         CgMWZNtI+qkVg7/TLBH5kusaM/Ozf6DjP5ETAvKm9PLzZeGnR15weeSWdHteDXpMlSzp
         FiWHSet8uK/2YgRRkM8UMtSKasorqGaH2yqWKE4B0CXzTe5Qlw9SU5p07hLRdj+HwAHY
         OZ5D7jYs2ra6ftMw9uJM6By3mUhFcC/a+8NupReGdkJgO6968XPXDsdfT1+fFbWCa0Kj
         akpqaVXRl4vm5WgJ/t5hDXfDoeRlbGc8tDjmpqT7lTmOZBFabWuAHUmCgDzwdeQAAozM
         BX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ekd/xN/CAMqlsjRdRgshA/nuApjXxhIITrzRGQLRnxM=;
        b=RVBbohVOuI7WzaUhckupc7EAU+M3FKkYd+oj9clsoN1A6AClK5aqB/9roCO6KAJNY3
         cCH4YDthXlFgb1wNyMFH7fxh1gM6UzjNKnPrj7/iWqntTi9BhOU96NAu97HcfwONreQ4
         cQEv7HzptWCOyjSf6PzSR45EtR6oBiSnizK/OGtzXTwVYgJp4hdrTMABPOHYXBFYc3Sw
         lEoiANO7gf3RlRe2CkWceiSOHY+5kVVTKulZ9CCf85Oso58GsKm0maGqWoxl/3LgtdG1
         cO2pk79F7tlvSWbixdFP5zQxBzi8/akWdQLAUjHRe+nJfuC0BOENG7gzcNZvB7TN0YCJ
         uD8g==
X-Gm-Message-State: AOAM530yuoeerolHaNrF6yUqB9p4a8OU32+J2uS41pI0/FC+vrO7Kpzp
        TfbuuuCEpUVfBOxlyAeYTrM=
X-Google-Smtp-Source: ABdhPJzqhYf9/RmwzIuuS2ZyAtY7USzoHc27QHcvGZeCsGWVZfpwDGa557tI+t/EPA1FeIBJsc1jXg==
X-Received: by 2002:a17:902:a9cb:b0:151:f21c:2432 with SMTP id b11-20020a170902a9cb00b00151f21c2432mr6888926plr.158.1646726525805;
        Tue, 08 Mar 2022 00:02:05 -0800 (PST)
Received: from localhost.localdomain (111-250-33-204.dynamic-ip.hinet.net. [111.250.33.204])
        by smtp.gmail.com with ESMTPSA id q8-20020a056a00088800b004bca31c8e56sm19282401pfj.115.2022.03.08.00.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:02:05 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     xu xin <xu.xin16@zte.com.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yang Yang <yang.yang29@zte.com.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v6 1/3] Add Chinese translation for vm/ksm.rst
Date:   Tue,  8 Mar 2022 16:03:22 +0800
Message-Id: <5c1d9b95b570cc3412b6bf87fdcc35046b3ce606.1646723502.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646723502.git.siyanteng@loongson.cn>
References: <cover.1646723502.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: xu xin <xu.xin16@zte.com.cn>

Translate Documentation/vm/ksm.rst into Chinese.
Update Documentation/translations/zh_CN/vm/index.rst.

Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  1 +
 Documentation/translations/zh_CN/vm/ksm.rst   | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 2f9834eb9475..a1d2f0356cc1 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -26,6 +26,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    damon/index
    free_page_reporting
    highmem
+   ksm
 
 TODOLIST:
 * arch_pgtable_helpers
diff --git a/Documentation/translations/zh_CN/vm/ksm.rst b/Documentation/translations/zh_CN/vm/ksm.rst
new file mode 100644
index 000000000000..83b0c73984da
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/ksm.rst
@@ -0,0 +1,70 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/ksm.rst
+
+:翻译:
+
+   徐鑫 xu xin <xu.xin16@zte.com.cn>
+
+============
+内核同页合并
+============
+
+KSM 是一种节省内存的数据去重功能，由CONFIG_KSM=y启用，并在2.6.32版本时被添加
+到Linux内核。详见 ``mm/ksm.c`` 的实现，以及http://lwn.net/Articles/306704和
+https://lwn.net/Articles/330589
+
+KSM的用户空间的接口在Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
+文档中有描述。
+
+设计
+====
+
+概述
+----
+
+概述内容请见mm/ksm.c文档中的“DOC: Overview”
+
+逆映射
+------
+KSM维护着稳定树中的KSM页的逆映射信息。
+
+当KSM页面的共享数小于 ``max_page_sharing`` 的虚拟内存区域(VMAs)时，则代表了
+KSM页的稳定树其中的节点指向了一个rmap_item结构体类型的列表。同时，这个KSM页
+的 ``page->mapping`` 指向了该稳定树节点。
+
+如果共享数超过了阈值，KSM将给稳定树添加第二个维度。稳定树就变成链接一个或多
+个稳定树"副本"的"链"。每个副本都保留KSM页的逆映射信息，其中 ``page->mapping``
+指向该"副本"。
+
+每个链以及链接到该链中的所有"副本"强制不变的是，它们代表了相同的写保护内存
+内容，尽管任中一个"副本"是由同一片内存区的不同的KSM复制页所指向的。
+
+这样一来，相比与无限的逆映射链表，稳定树的查找计算复杂性不受影响。但在稳定树
+本身中不能有重复的KSM页面内容仍然是强制要求。
+
+由 ``max_page_sharing`` 强制决定的数据去重限制是必要的，以此来避免虚拟内存
+rmap链表变得过大。rmap的遍历具有O(N)的复杂度，其中N是共享页面的rmap_项（即
+虚拟映射）的数量，而这个共享页面的节点数量又被 ``max_page_sharing`` 所限制。
+因此，这有效地将线性O(N)计算复杂度从rmap遍历中分散到不同的KSM页面上。ksmd进
+程在稳定节点"链"上的遍历也是O(N)，但这个N是稳定树"副本"的数量，而不是rmap项
+的数量，因此它对ksmd性能没有显著影响。实际上，最佳稳定树"副本"的候选节点将
+保留在"副本"列表的开头。
+
+``max_page_sharing`` 的值设置得高了会促使更快的内存合并（因为将有更少的稳定
+树副本排队进入稳定节点chain->hlist）和更高的数据去重系数，但代价是在交换、压
+缩、NUMA平衡和页面迁移过程中可能导致KSM页的最大rmap遍历速度较慢。
+
+``stable_node_dups/stable_node_chains`` 的比值还受 ``max_page_sharing`` 调控
+的影响，高比值可能意味着稳定节点dup中存在碎片，这可以通过在ksmd中引入碎片算
+法来解决，该算法将rmap项从一个稳定节点dup重定位到另一个稳定节点dup，以便释放
+那些仅包含极少rmap项的稳定节点"dup"，但这可能会增加ksmd进程的CPU使用率，并可
+能会减慢应用程序在KSM页面上的只读计算。
+
+KSM会定期扫描稳定节点"链"中链接的所有稳定树"副本"，以便删减过时了的稳定节点。
+这种扫描的频率由 ``stable_node_chains_prune_millisecs`` 这个sysfs 接口定义。
+
+参考
+====
+内核代码请见mm/ksm.c。
+涉及的函数(mm_slot  ksm_scan  stable_node  rmap_item)。
-- 
2.27.0

