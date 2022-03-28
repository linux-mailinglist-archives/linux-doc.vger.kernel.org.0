Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27CC34E96F6
	for <lists+linux-doc@lfdr.de>; Mon, 28 Mar 2022 14:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242623AbiC1MtW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Mar 2022 08:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239014AbiC1MtV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 08:49:21 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9038E4D9D6
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:47:40 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mj15-20020a17090b368f00b001c637aa358eso18575035pjb.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OzLOTE0/KUKrtLSCJ/jW8V9QffJQDYwPLcU1Nf8zspA=;
        b=hLMDZTq5LR3svuB1bbi1W+tJSR7XJQ1Nok0s8NsuzmCsiG62fcHyoWT4RZOukrZaHX
         m4MrA5tspBstre25eb7MB3Q+EPwbpEqwwCPZZSKD8sKABi4y3j0/OdXeVrUYY299fKB4
         grOqsVUPNxm356wXwZ/1uA5bRqkcAuDU4b0aTHNu5jwrIHcMCV0YjvUrZbzvq8HDAnWh
         YY3/if1TFCrg9m9SmP3kwc16S6g9zaI5f9CguOPzk4egn5gOEYScY8kl1YU1UfWjADa/
         wnbSoKtQpyy95oLuA/jI/QojQvqZJqiFPK7vF+tThQ9KDGZ3jf1EmxpuQev/8zWF6QZO
         AtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OzLOTE0/KUKrtLSCJ/jW8V9QffJQDYwPLcU1Nf8zspA=;
        b=vhi1gueBLVPDK0ZFsfZn72KSi21Vf5s1nsR8Ug8aCeLphMR2931znO7DTqOESgxhi3
         kNoJuGmSecknUiDRm2ST4aTYINdRrjXJOwhtTJbSvOg7dBPxV6IlT4ADGCGjAolyWoMg
         xvYmMf+D9WFkIO0stH6zW74Z51dDH4BC8KXuRbaga9JZb3GAqbB5iroSXy/asHZ9sYIE
         3GsIee1+1NxR4qp7NYLYxWpugz1DG3sVHpd2wNxtf6Z68kiuqB5+hW+ewRLTmNrM3kmU
         SzbZIa6T2LRZaBxJS5ZO2F0iWSaT/oVXYqeXVsEHiSaPsCfcYASBWIpBx11zp1Rsn+CX
         dSLw==
X-Gm-Message-State: AOAM533MS0pbHnP2TIPrgXUkN3udCSsgw1OyHPqep80zVrI+ERvPTSmE
        1lnylskhHtfLFpb5YxRYvGxed+uNccuINPcT
X-Google-Smtp-Source: ABdhPJwPHV+v0OFmdz6i0PZ9Q/SIUQQc8GddCSaDoDyqpllP8+F15UTsCU90o5aBxhGVQS00RXBG+g==
X-Received: by 2002:a17:902:cf05:b0:156:2aa:6e13 with SMTP id i5-20020a170902cf0500b0015602aa6e13mr7897186plg.137.1648471659598;
        Mon, 28 Mar 2022 05:47:39 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id ck13-20020a056a00328d00b004fb1414476bsm11339079pfb.200.2022.03.28.05.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 05:47:39 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 2/3] docs/zh_CN/damon: add sysfs interface
Date:   Mon, 28 Mar 2022 20:48:34 +0800
Message-Id: <a992f6d6203cc15677d58ce9dcdf7679434629ff.1648471647.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648471647.git.siyanteng@loongson.cn>
References: <cover.1648471647.git.siyanteng@loongson.cn>
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

Since 3d029480f24e("Docs/admin-guide/mm/damon/usage: document DAMON sysfs
interface") add sysfs interface, let's sync update.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 285 +++++++++++++++++-
 1 file changed, 278 insertions(+), 7 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
index 10b9ac7664d3..eee0e8c5c368 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
@@ -13,7 +13,7 @@
 详细用法
 ========
 
-DAMON 为不同的用户提供了下面三种接口。
+DAMON 为不同的用户提供了下面这些接口。
 
 - *DAMON用户空间工具。*
   `这 <https://github.com/awslabs/damo>`_ 为有这特权的人， 如系统管理员，希望有一个刚好
@@ -21,19 +21,290 @@ DAMON 为不同的用户提供了下面三种接口。
   使用它，用户可以以人性化的方式使用DAMON的主要功能。不过，它可能不会为特殊情况进行高度调整。
   它同时支持虚拟和物理地址空间的监测。更多细节，请参考它的 `使用文档
   <https://github.com/awslabs/damo/blob/next/USAGE.md>`_。
-- *debugfs接口。*
-  :ref:`这 <debugfs_interface>` 是为那些希望更高级的使用DAMON的特权用户空间程序员准备的。
-  使用它，用户可以通过读取和写入特殊的debugfs文件来使用DAMON的主要功能。因此，你可以编写和使
-  用你个性化的DAMON debugfs包装程序，代替你读/写debugfs文件。  `DAMON用户空间工具
+- *sysfs接口。*
+  :ref:`这 <sysfs_interface>` 是为那些希望更高级的使用DAMON的特权用户空间程序员准备的。
+  使用它，用户可以通过读取和写入特殊的sysfs文件来使用DAMON的主要功能。因此，你可以编写和使
+  用你个性化的DAMON sysfs包装程序，代替你读/写sysfs文件。  `DAMON用户空间工具
   <https://github.com/awslabs/damo>`_ 就是这种程序的一个例子  它同时支持虚拟和物理地址
   空间的监测。注意，这个界面只提供简单的监测结果 :ref:`统计 <damos_stats>`。对于详细的监测
   结果，DAMON提供了一个:ref:`跟踪点 <tracepoint>`。
-
+- *debugfs interface.*
+  :ref:`这 <debugfs_interface>` 几乎与:ref:`sysfs interface <sysfs_interface>` 接
+  口相同。这将在下一个LTS内核发布后被移除，所以用户应该转移到
+  :ref:`sysfs interface <sysfs_interface>`。
 - *内核空间编程接口。*
-  :doc:`This </vm/damon/api>` 这是为内核空间程序员准备的。使用它，用户可以通过为你编写内
+  :doc:`这 </vm/damon/api>` 这是为内核空间程序员准备的。使用它，用户可以通过为你编写内
   核空间的DAMON应用程序，最灵活有效地利用DAMON的每一个功能。你甚至可以为各种地址空间扩展DAMON。
   详细情况请参考接口 :doc:`文件 </vm/damon/api>`。
 
+sysfs接口
+=========
+DAMON的sysfs接口是在定义 ``CONFIG_DAMON_SYSFS`` 时建立的。它在其sysfs目录下创建多
+个目录和文件， ``<sysfs>/kernel/mm/damon/`` 。你可以通过对该目录下的文件进行写入和
+读取来控制DAMON。
+
+对于一个简短的例子，用户可以监测一个给定工作负载的虚拟地址空间，如下所示::
+
+    # cd /sys/kernel/mm/damon/admin/
+    # echo 1 > kdamonds/nr && echo 1 > kdamonds/0/contexts/nr
+    # echo vaddr > kdamonds/0/contexts/0/operations
+    # echo 1 > kdamonds/0/contexts/0/targets/nr
+    # echo $(pidof <workload>) > kdamonds/0/contexts/0/targets/0/pid
+    # echo on > kdamonds/0/state
+
+文件层次结构
+------------
+
+DAMON sysfs接口的文件层次结构如下图所示。在下图中，父子关系用缩进表示，每个目录有
+``/`` 后缀，每个目录中的文件用逗号（","）分开。 ::
+
+    /sys/kernel/mm/damon/admin
+    │ kdamonds/nr_kdamonds
+    │ │ 0/state,pid
+    │ │ │ contexts/nr_contexts
+    │ │ │ │ 0/operations
+    │ │ │ │ │ monitoring_attrs/
+    │ │ │ │ │ │ intervals/sample_us,aggr_us,update_us
+    │ │ │ │ │ │ nr_regions/min,max
+    │ │ │ │ │ targets/nr_targets
+    │ │ │ │ │ │ 0/pid_target
+    │ │ │ │ │ │ │ regions/nr_regions
+    │ │ │ │ │ │ │ │ 0/start,end
+    │ │ │ │ │ │ │ │ ...
+    │ │ │ │ │ │ ...
+    │ │ │ │ │ schemes/nr_schemes
+    │ │ │ │ │ │ 0/action
+    │ │ │ │ │ │ │ access_pattern/
+    │ │ │ │ │ │ │ │ sz/min,max
+    │ │ │ │ │ │ │ │ nr_accesses/min,max
+    │ │ │ │ │ │ │ │ age/min,max
+    │ │ │ │ │ │ │ quotas/ms,bytes,reset_interval_ms
+    │ │ │ │ │ │ │ │ weights/sz_permil,nr_accesses_permil,age_permil
+    │ │ │ │ │ │ │ watermarks/metric,interval_us,high,mid,low
+    │ │ │ │ │ │ │ stats/nr_tried,sz_tried,nr_applied,sz_applied,qt_exceeds
+    │ │ │ │ │ │ ...
+    │ │ │ │ ...
+    │ │ ...
+
+根
+--
+
+DAMON sysfs接口的根是 ``<sysfs>/kernel/mm/damon/`` ，它有一个名为 ``admin`` 的
+目录。该目录包含特权用户空间程序控制DAMON的文件。拥有根权限的用户空间工具或deamons可以
+使用这个目录。
+
+kdamonds/
+---------
+
+与监测相关的信息包括请求规格和结果被称为DAMON上下文。DAMON用一个叫做kdamond的内核线程
+执行每个上下文，多个kdamonds可以并行运行。
+
+在 ``admin`` 目录下，有一个目录，即``kdamonds``，它有控制kdamonds的文件存在。在开始
+时，这个目录只有一个文件，``nr_kdamonds``。向该文件写入一个数字（``N``），就会创建名为
+``0`` 到 ``N-1`` 的子目录数量。每个目录代表每个kdamond。
+
+kdamonds/<N>/
+-------------
+
+在每个kdamond目录中，存在两个文件（``state`` 和 ``pid`` ）和一个目录( ``contexts`` )。
+
+读取 ``state`` 时，如果kdamond当前正在运行，则返回 ``on`` ，如果没有运行则返回 ``off`` 。
+写入 ``on`` 或 ``off`` 使kdamond处于状态。向 ``state`` 文件写 ``update_schemes_stats`` ，
+更新kdamond的每个基于DAMON的操作方案的统计文件的内容。关于统计信息的细节，请参考
+:ref:`stats section <sysfs_schemes_stats>`.
+
+如果状态为 ``on``，读取 ``pid`` 显示kdamond线程的pid。
+
+``contexts`` 目录包含控制这个kdamond要执行的监测上下文的文件。
+
+kdamonds/<N>/contexts/
+----------------------
+
+在开始时，这个目录只有一个文件，即 ``nr_contexts`` 。向该文件写入一个数字( ``N`` )，就会创
+建名为``0`` 到 ``N-1`` 的子目录数量。每个目录代表每个监测背景。目前，每个kdamond只支持
+一个上下文，所以只有 ``0`` 或 ``1`` 可以被写入文件。
+
+contexts/<N>/
+-------------
+
+在每个上下文目录中，存在一个文件(``operations``)和三个目录(``monitoring_attrs``,
+``targets``, 和 ``schemes``)。
+
+DAMON支持多种类型的监测操作，包括对虚拟地址空间和物理地址空间的监测。你可以通过向文件
+中写入以下关键词之一，并从文件中读取，来设置和获取DAMON将为上下文使用何种类型的监测操作。
+
+ - vaddr: 监测特定进程的虚拟地址空间
+ - paddr: 监视系统的物理地址空间
+
+contexts/<N>/monitoring_attrs/
+------------------------------
+
+用于指定监测属性的文件，包括所需的监测质量和效率，都在 ``monitoring_attrs`` 目录中。
+具体来说，这个目录下有两个目录，即 ``intervals`` 和 ``nr_regions`` 。
+
+在 ``intervals`` 目录下，存在DAMON的采样间隔(``sample_us``)、聚集间隔(``aggr_us``)
+和更新间隔(``update_us``)三个文件。你可以通过写入和读出这些文件来设置和获取微秒级的值。
+
+在 ``nr_regions`` 目录下，有两个文件分别用于DAMON监测区域的下限和上限（``min`` 和 ``max`` ），
+这两个文件控制着监测的开销。你可以通过向这些文件的写入和读出来设置和获取这些值。
+
+关于间隔和监测区域范围的更多细节，请参考设计文件 (:doc:`/vm/damon/design`)。
+
+contexts/<N>/targets/
+---------------------
+
+在开始时，这个目录只有一个文件 ``nr_targets`` 。向该文件写入一个数字(``N``)，就可以创建
+名为 ``0`` 到 ``N-1`` 的子目录的数量。每个目录代表每个监测目标。
+
+targets/<N>/
+------------
+
+在每个目标目录中，存在一个文件(``pid_target``)和一个目录(``regions``)。
+
+如果你把 ``vaddr`` 写到 ``contexts/<N>/operations`` 中，每个目标应该是一个进程。你
+可以通过将进程的pid写到 ``pid_target`` 文件中来指定DAMON的进程。
+
+targets/<N>/regions
+-------------------
+
+当使用 ``vaddr`` 监测操作集时（ ``vaddr`` 被写入 ``contexts/<N>/operations`` 文
+件），DAMON自动设置和更新监测目标区域，这样就可以覆盖目标进程的整个内存映射。然而，用户可
+能希望将初始监测区域设置为特定的地址范围。
+
+相反，当使用 ``paddr`` 监测操作集时，DAMON不会自动设置和更新监测目标区域（ ``paddr``
+被写入 ``contexts/<N>/operations`` 中）。因此，在这种情况下，用户应该自己设置监测目标
+区域。
+
+在这种情况下，用户可以按照自己的意愿明确设置初始监测目标区域，将适当的值写入该目录下的文件。
+
+开始时，这个目录只有一个文件， ``nr_regions`` 。向该文件写入一个数字(``N``)，就可以创
+建名为 ``0`` 到  ``N-1`` 的子目录。每个目录代表每个初始监测目标区域。
+
+regions/<N>/
+------------
+
+在每个区域目录中，你会发现两个文件（ ``start``  和  ``end`` ）。你可以通过向文件写入
+和从文件中读出，分别设置和获得初始监测目标区域的起始和结束地址。
+
+contexts/<N>/schemes/
+---------------------
+
+对于一版的基于DAMON的数据访问感知的内存管理优化，用户通常希望系统对特定访问模式的内存区
+域应用内存管理操作。DAMON从用户那里接收这种形式化的操作方案，并将这些方案应用于目标内存
+区域。用户可以通过读取和写入这个目录下的文件来获得和设置这些方案。
+
+在开始时，这个目录只有一个文件，``nr_schemes``。向该文件写入一个数字(``N``)，就可以
+创建名为``0``到``N-1``的子目录的数量。每个目录代表每个基于DAMON的操作方案。
+
+schemes/<N>/
+------------
+
+在每个方案目录中，存在四个目录(``access_pattern``, ``quotas``,``watermarks``,
+和 ``stats``)和一个文件(``action``)。
+
+``action`` 文件用于设置和获取你想应用于具有特定访问模式的内存区域的动作。可以写入文件
+和从文件中读取的关键词及其含义如下。
+
+ - ``willneed``: 对有 ``MADV_WILLNEED`` 的区域调用 ``madvise()`` 。
+ - ``cold``: 对具有 ``MADV_COLD`` 的区域调用 ``madvise()`` 。
+ - ``pageout``: 为具有 ``MADV_PAGEOUT`` 的区域调用 ``madvise()`` 。
+ - ``hugepage``: 为带有 ``MADV_HUGEPAGE`` 的区域调用 ``madvise()`` 。
+ - ``nohugepage``: 为带有 ``MADV_NOHUGEPAGE`` 的区域调用 ``madvise()``。
+ - ``stat``: 什么都不做，只计算统计数据
+
+schemes/<N>/access_pattern/
+---------------------------
+
+每个基于DAMON的操作方案的目标访问模式由三个范围构成，包括以字节为单位的区域大小、每个
+聚合区间的监测访问次数和区域年龄的聚合区间数。
+
+在 ``access_pattern`` 目录下，存在三个目录（ ``sz``, ``nr_accesses``, 和 ``age`` ），
+每个目录有两个文件（``min`` 和 ``max`` ）。你可以通过向  ``sz``, ``nr_accesses``, 和
+``age``  目录下的 ``min`` 和 ``max`` 文件分别写入和读取来设置和获取给定方案的访问模式。
+
+schemes/<N>/quotas/
+-------------------
+
+每个 ``动作`` 的最佳 ``目标访问模式`` 取决于工作负载，所以不容易找到。更糟糕的是，将某些动作
+的方案设置得过于激进会造成严重的开销。为了避免这种开销，用户可以为每个方案限制时间和大小配额。
+具体来说，用户可以要求DAMON尽量只使用特定的时间（``时间配额``）来应用行动，并且在给定的时间间
+隔（``重置间隔``）内，只对具有目标访问模式的内存区域应用行动，而不使用特定数量（``大小配额``）。
+
+当预计超过配额限制时，DAMON会根据 ``目标访问模式`` 的大小、访问频率和年龄，对找到的内存区域
+进行优先排序。为了进行个性化的优先排序，用户可以为这三个属性设置权重。
+
+在 ``quotas`` 目录下，存在三个文件（``ms``, ``bytes``, ``reset_interval_ms``）和一个
+目录(``weights``)，其中有三个文件(``sz_permil``, ``nr_accesses_permil``, 和
+``age_permil``)。
+
+你可以设置以毫秒为单位的 ``时间配额`` ，以字节为单位的 ``大小配额`` ，以及以毫秒为单位的 ``重
+置间隔`` ，分别向这三个文件写入数值。你还可以通过向 ``weights`` 目录下的三个文件写入数值来设
+置大小、访问频率和年龄的优先权，单位为千分之一。
+
+schemes/<N>/watermarks/
+-----------------------
+
+为了便于根据系统状态激活和停用每个方案，DAMON提供了一个称为水位的功能。该功能接收五个值，称为
+``度量`` 、``间隔`` 、``高`` 、``中`` 、``低`` 。``度量值`` 是指可以测量的系统度量值，如
+自由内存比率。如果系统的度量值 ``高`` 于memoent的高值或 ``低`` 于低值，则该方案被停用。如果
+该值低于 ``中`` ，则该方案被激活。
+
+在水位目录下，存在五个文件(``metric``, ``interval_us``,``high``, ``mid``, and ``low``)
+用于设置每个值。你可以通过向这些文件的写入来分别设置和获取这五个值。
+
+可以写入 ``metric`` 文件的关键词和含义如下。
+
+ - none: 忽略水位
+ - free_mem_rate: 系统的自由内存率（千分比）。
+
+``interval`` 应以微秒为单位写入。
+
+schemes/<N>/stats/
+------------------
+
+DAMON统计每个方案被尝试应用的区域的总数量和字节数，每个方案被成功应用的区域的两个数字，以及
+超过配额限制的总数量。这些统计数据可用于在线分析或调整方案。
+
+可以通过读取 ``stats`` 目录下的文件(``nr_tried``, ``sz_tried``, ``nr_applied``,
+``sz_applied``, 和 ``qt_exceeds``)）分别检索这些统计数据。这些文件不是实时更新的，所以
+你应该要求DAMON sysfs接口通过在相关的 ``kdamonds/<N>/state`` 文件中写入一个特殊的关键字
+``update_schemes_stats`` 来更新统计信息的文件内容。
+
+用例
+~~~~
+
+下面的命令应用了一个方案：”如果一个大小为[4KiB, 8KiB]的内存区域在[10, 20]的聚合时间间隔内
+显示出每一个聚合时间间隔[0, 5]的访问量，请分页该区域。对于分页，每秒最多只能使用10ms，而且每
+秒分页不能超过1GiB。在这一限制下，首先分页出具有较长年龄的内存区域。另外，每5秒钟检查一次系统
+的可用内存率，当可用内存率低于50%时开始监测和分页，但如果可用内存率大于60%，或低于30%，则停
+止监测。“ ::
+
+    # cd <sysfs>/kernel/mm/damon/admin
+    # # populate directories
+    # echo 1 > kdamonds/nr_kdamonds; echo 1 > kdamonds/0/contexts/nr_contexts;
+    # echo 1 > kdamonds/0/contexts/0/schemes/nr_schemes
+    # cd kdamonds/0/contexts/0/schemes/0
+    # # set the basic access pattern and the action
+    # echo 4096 > access_patterns/sz/min
+    # echo 8192 > access_patterns/sz/max
+    # echo 0 > access_patterns/nr_accesses/min
+    # echo 5 > access_patterns/nr_accesses/max
+    # echo 10 > access_patterns/age/min
+    # echo 20 > access_patterns/age/max
+    # echo pageout > action
+    # # set quotas
+    # echo 10 > quotas/ms
+    # echo $((1024*1024*1024)) > quotas/bytes
+    # echo 1000 > quotas/reset_interval_ms
+    # # set watermark
+    # echo free_mem_rate > watermarks/metric
+    # echo 5000000 > watermarks/interval_us
+    # echo 600 > watermarks/high
+    # echo 500 > watermarks/mid
+    # echo 300 > watermarks/low
+
+请注意，我们强烈建议使用用户空间的工具，如 `damo <https://github.com/awslabs/damo>`_ ，
+而不是像上面那样手动读写文件。以上只是一个例子。
 
 debugfs接口
 ===========
-- 
2.27.0

