Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5545C4B8494
	for <lists+linux-doc@lfdr.de>; Wed, 16 Feb 2022 10:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbiBPJie (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Feb 2022 04:38:34 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiBPJid (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Feb 2022 04:38:33 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4990111C03
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 01:38:20 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id u16so1665356pfg.12
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 01:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+74cODfRgyiomA0mwQ4meBxewGikgJhpPLFXd+7txUA=;
        b=hV+UUx6VhLRgH7JOmwtc2w7do1Jt0rLDmp1YBalY4QckY+tJE42+z9BXOTqJZNuJKj
         PPpxjcnhF/19GqVqB1MmWAzMopRwCR2GfxK2kgqPSTbrbCyCjV004BWXssmFAHmAd7/8
         i33UIfE76+WHVQ9cCiIZ1D/epwFTxATRyBjzh+BZFw1/gH2sm2eKwqgDV7fxaNUG6QlM
         lNPBDVNhDzqnxkpw0SKk2ZnRASOHpjkB0NaoxbJVJSueoOOe48yjSJeRFEB6XhPaAK2W
         05OzfCIt7jRogYMzb4p1qMQIrzWpXwuHg55EV32OYioIJTY0qHo4+YJT+L8IxHsjdw4+
         E8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+74cODfRgyiomA0mwQ4meBxewGikgJhpPLFXd+7txUA=;
        b=j9/3UHkQ1r9yX4W2OVDevFEDn+w/AwsTYmMEcFBiCioXpsX6BeUWdtBm3KyasglDLm
         II+nvx+CDRt+SrVqP+hxaKrOocf7m9AyPoCMGw+aFvnS4+fynSvgvuR4FXwZ0hsiNT0o
         83ZB9gNaUXFw1C4QAu96wwaYfbXCOnpWYLgrb7W1kugW6fqPA3ooX6YPOf52u5YoInp8
         +uGQ49e0+x4aou+aIVg/TTJWjiceU4wuWUyXu70IQnzXWuOfj+av+ytP4/VaJDcsSjnO
         QvIzvkV3TmSZmPg+t+aP99QBHgufj7NneURlczYncZKbNHazOGjL9HVqj/R2H0h/EMjc
         qhGg==
X-Gm-Message-State: AOAM531dIiGOfJR3vQd4vXLg2aAPqaiiR3frQyHnkUFAwJmXyqUP49sx
        Z70530fFenc+9YUSgJ9V0ozwnW8D50vJBOZd
X-Google-Smtp-Source: ABdhPJykPSBYI4+HgplSd5NMzxURFDsdbcqqk+XBpw3DgFBXPzmbUxQkqBdG3drG8GH20qxZD130zA==
X-Received: by 2002:a63:e84b:0:b0:372:a079:302 with SMTP id a11-20020a63e84b000000b00372a0790302mr1587174pgk.272.1645004299598;
        Wed, 16 Feb 2022 01:38:19 -0800 (PST)
Received: from localhost.localdomain ([211.109.233.153])
        by smtp.gmail.com with ESMTPSA id 11sm19251289pja.36.2022.02.16.01.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 01:38:19 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 5/5] docs/zh_CN: add damon reclaim translation
Date:   Wed, 16 Feb 2022 17:34:46 +0800
Message-Id: <1c54a43475ade4745a60276e6b69cedce93b63cd.1645003763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645003763.git.siyanteng@loongson.cn>
References: <cover.1645003763.git.siyanteng@loongson.cn>
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

Translate .../admin-guide/mm/damon/reclaim.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/admin-guide/mm/damon/index.rst      |   4 +-
 .../zh_CN/admin-guide/mm/damon/reclaim.rst    | 232 ++++++++++++++++++
 2 files changed, 234 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
index bd1f1a551f0f..0c8276109fc0 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
@@ -21,8 +21,8 @@
 
    start
    usage
+   reclaim
+
 
-Todolist:
 
 
-*   reclaim
diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
new file mode 100644
index 000000000000..5408d84118c7
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
@@ -0,0 +1,232 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../../disclaimer-zh_CN.rst
+
+:Original: Documentation/admin-guide/mm/damon/reclaim.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+===============
+基于DAMON的回收
+===============
+
+基于DAMON的回收（DAMON_RECLAIM）是一个静态的内核模块，旨在用于轻度内存压力下的主动和轻
+量级的回收。它的目的不是取代基于LRU列表的页面回收，而是有选择地用于不同程度的内存压力和要
+求。
+
+哪些地方需要主动复回收？
+========================
+
+在一般的内存过度分配（over-committed systems，虚拟化相关术语）的系统上，主动回收冷页
+有助于节省内存和减少延迟高峰，这些延迟是由直接回收进程或kswapd的CPU消耗引起的，同时只产
+生最小的性能下降 [1]_ [2]_ 。
+
+基于空闲页报告 [3]_ 的内存过度承诺的虚拟化系统就是很好的例子。在这样的系统中，客户虚拟机
+向主机报告他们的空闲内存，而主机则将报告的内存重新分配给其他客户。因此，系统的内存得到了充
+分的利用。然而，客户可能不那么节省内存，主要是因为一些内核子系统和用户空间应用程序被设计为
+使用尽可能多的内存。然后，客户可能只向主机报告少量的内存是空闲的，导致系统的内存利用率下降。
+在客户中运行主动回收可以缓解这个问题。
+
+它是如何工作的？
+================
+
+DAMON_RECLAIM找到在特定时间内没有被访问的内存区域并分页。为了避免它在分页操作中消耗过多
+的CPU，可以配置一个速度限制。在这个速度限制下，它首先分页出那些没有被访问过的内存区域。系
+统管理员还可以配置在什么情况下这个方案应该自动激活和停用三个内存压力水位。
+
+接口: 模块参数
+==============
+
+要使用这个功能，你首先要确保你的系统运行在一个以 ``CONFIG_DAMON_RECLAIM=y`` 构建的内
+核上。
+
+为了让系统管理员启用或禁用它，并为给定的系统进行调整，DAMON_RECLAIM利用了模块参数。也就
+是说，你可以把 ``damon_reclaim.<parameter>=<value>`` 放在内核启动命令行上，或者把
+适当的值写入 ``/sys/modules/damon_reclaim/parameters/<parameter>`` 文件。
+
+注意，除 ``启用`` 外的参数值只在DAMON_RECLAIM启动时应用。因此，如果你想在运行时应用新
+的参数值，而DAMON_RECLAIM已经被启用，你应该通过 ``启用`` 的参数文件禁用和重新启用它。
+在重新启用之前，应将新的参数值写入适当的参数值中。
+
+下面是每个参数的描述。
+
+启用
+----
+
+启用或禁用DAMON_RECLAIM。
+
+你可以通过把这个参数的值设置为 ``Y`` 来启用DAMON_RCLAIM，把它设置为 ``N`` 可以禁用
+DAMON_RECLAIM。注意，由于基于水位的激活条件，DAMON_RECLAIM不能进行真正的监测和回收。
+这一点请参考下面关于水位参数的描述。
+
+min_age
+-------
+
+识别冷内存区域的时间阈值，单位是微秒。
+
+如果一个内存区域在这个时间或更长的时间内没有被访问，DAMON_RECLAIM会将该区域识别为冷的，
+并回收它。
+
+默认为120秒。
+
+quota_ms
+--------
+
+回收的时间限制，以毫秒为单位。
+
+DAMON_RECLAIM 试图在一个时间窗口（quota_reset_interval_ms）内只使用到这个时间，以
+尝试回收冷页。这可以用来限制DAMON_RECLAIM的CPU消耗。如果该值为零，则该限制被禁用。
+
+默认为10ms。
+
+quota_sz
+--------
+
+回收的内存大小限制，单位为字节。
+
+DAMON_RECLAIM 收取在一个时间窗口（quota_reset_interval_ms）内试图回收的内存量，并
+使其不超过这个限制。这可以用来限制CPU和IO的消耗。如果该值为零，则限制被禁用。
+
+默认情况下是128 MiB。
+
+quota_reset_interval_ms
+-----------------------
+
+时间/大小配额收取重置间隔，单位为毫秒。
+
+时间（quota_ms）和大小（quota_sz）的配额的目标重置间隔。也就是说，DAMON_RECLAIM在
+quota_ms毫秒内不尝试回收超过quota_ms毫秒或quota_sz字节。
+
+默认为1秒。
+
+wmarks_interval
+---------------
+
+当DAMON_RECLAIM被启用但由于其水位规则而不活跃时，在检查水位之前的最小等待时间。
+
+wmarks_high
+-----------
+
+高水位的可用内存率（每千字节）。
+
+如果系统的可用内存（以每千字节为单位）高于这个数值，DAMON_RECLAIM就会变得不活跃，所以
+它什么也不做，只是定期检查水位。
+
+wmarks_mid
+----------
+
+中间水位的可用内存率（每千字节）。
+
+如果系统的空闲内存（以每千字节为单位）在这个和低水位线之间，DAMON_RECLAIM就会被激活，
+因此开始监测和回收。
+
+wmarks_low
+----------
+
+低水位的可用内存率（每千字节）。
+
+如果系统的空闲内存（以每千字节为单位）低于这个数值，DAMON_RECLAIM就会变得不活跃，所以
+它除了定期检查水位外什么都不做。在这种情况下，系统会退回到基于LRU列表的页面粒度回收逻辑。
+
+sample_interval
+---------------
+
+监测的采样间隔，单位是微秒。
+
+DAMON用于监测冷内存的采样间隔。更多细节请参考DAMON文档 (:doc:`usage`) 。
+
+aggr_interval
+-------------
+
+监测的聚集间隔，单位是微秒。
+
+DAMON对冷内存监测的聚集间隔。更多细节请参考DAMON文档 (:doc:`usage`)。
+
+min_nr_regions
+--------------
+
+监测区域的最小数量。
+
+DAMON用于冷内存监测的最小监测区域数。这可以用来设置监测质量的下限。但是，设
+置的太高可能会导致监测开销的增加。更多细节请参考DAMON文档 (:doc:`usage`) 。
+
+max_nr_regions
+--------------
+
+监测区域的最大数量。
+
+DAMON用于冷内存监测的最大监测区域数。这可以用来设置监测开销的上限值。但是，
+设置得太低可能会导致监测质量不好。更多细节请参考DAMON文档 (:doc:`usage`) 。
+
+monitor_region_start
+--------------------
+
+目标内存区域的物理地址起点。
+
+DAMON_RECLAIM将对其进行工作的内存区域的起始物理地址。也就是说，DAMON_RECLAIM
+将在这个区域中找到冷的内存区域并进行回收。默认情况下，最大的系统RAM被用作该区域。
+
+monitor_region_end
+------------------
+
+目标内存区域的物理地址结束。
+
+DAMON_RECLAIM将对其进行工作的内存区域的末端物理地址。也就是说，DAMON_RECLAIM将
+在这个区域内找到冷的内存区域并进行回收。默认情况下，最大的系统RAM被用作该区域。
+
+kdamond_pid
+-----------
+
+DAMON线程的PID。
+
+如果DAMON_RECLAIM被启用，这将成为工作线程的PID。否则，为-1。
+
+nr_reclaim_tried_regions
+------------------------
+
+试图通过DAMON_RECLAIM回收的内存区域的数量。
+
+bytes_reclaim_tried_regions
+---------------------------
+
+试图通过DAMON_RECLAIM回收的内存区域的总字节数。
+
+nr_reclaimed_regions
+--------------------
+
+通过DAMON_RECLAIM成功回收的内存区域的数量。
+
+bytes_reclaimed_regions
+-----------------------
+
+通过DAMON_RECLAIM成功回收的内存区域的总字节数。
+
+nr_quota_exceeds
+----------------
+
+超过时间/空间配额限制的次数。
+
+例子
+====
+
+下面的运行示例命令使DAMON_RECLAIM找到30秒或更长时间没有访问的内存区域并分页出来。
+为了避免DAMON_RECLAIM在分页操作中消耗过多的CPU时间，回收被限制在每秒1GiB以内。
+它还要求DAMON_RECLAIM在系统的可用内存率超过50%时不做任何事情，但如果它低于40%时
+就开始真正的工作。如果DAMON_RECLAIM没有取得进展，因此空闲内存率低于20%，它会要求
+DAMON_RECLAIM再次什么都不做，这样我们就可以退回到基于LRU列表的页面粒度回收了::
+
+    # cd /sys/modules/damon_reclaim/parameters
+    # echo 30000000 > min_age
+    # echo $((1 * 1024 * 1024 * 1024)) > quota_sz
+    # echo 1000 > quota_reset_interval_ms
+    # echo 500 > wmarks_high
+    # echo 400 > wmarks_mid
+    # echo 200 > wmarks_low
+    # echo Y > enabled
+
+.. [1] https://research.google/pubs/pub48551/
+.. [2] https://lwn.net/Articles/787611/
+.. [3] https://www.kernel.org/doc/html/latest/vm/free_page_reporting.html
-- 
2.27.0

