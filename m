Return-Path: <linux-doc+bounces-34070-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA13A03062
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jan 2025 20:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31B323A3BA3
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jan 2025 19:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9F01DF25F;
	Mon,  6 Jan 2025 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDik4k7G"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AE81DE8B7;
	Mon,  6 Jan 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736191189; cv=none; b=BPP/GY5flJH/SxQ51gn13CFjvQFLiDWun8vNovnKVKQei56JuzQi+tWqZwyMyRGmOrsUooQnR+uwCs/nsEJMKxJiPmaluyvMitrOD+pc1LfPxXr8DAzAXkiE4piIN1Gqp8vP840tn3+1sUYKRsWacnEXp5zyiF8INil9R+bQi6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736191189; c=relaxed/simple;
	bh=9V+EqxRF3fSqCTXZ4fHT5H9Y8Tf3qlr3hLwSVyp4pho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AhUf0udM63dTmMAVI3xlsstibT9oHx5E4Wdgu2IY3ZUPxr/9hPpFijID7e1bQNW7YpStlzun70HFT/1qLiKT8FyD808WSop6o7SiQb2EiY90tIXBO2SH1uPQEQG8mdyDe2CVnqzd+3eAmV2aqwi3V30lDo7kNt/Q/eiH2evLgJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDik4k7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638EDC4CED2;
	Mon,  6 Jan 2025 19:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736191188;
	bh=9V+EqxRF3fSqCTXZ4fHT5H9Y8Tf3qlr3hLwSVyp4pho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JDik4k7GykB8StuOnhNgrwBRMGJEDmRdMTxFEdwAqbUhL7LvcWD8VVbKLqFlkYD0t
	 eiY/PnRI7CeV15N/DwN6T/8zi9V2fGMsHwkSenMZfwvJAFZXeCT3Af3zm2Rv5Vb5DK
	 G/J8gtrzM6LwTrWBUc7LmbbrFK02YCEr6hB7fuPy4E6e4oP6dqwqDRTMZ19rpAmRhW
	 kiCgULWj2xOCUSjPpxd6vTEDZaLyx7GFzeYlia1sxTtqvQ4VsYX35365AbDIpAwZp9
	 NfC27kh2hcVJm6qpHgC0sfEFR7hpl1je31VIyUV0MPW9COeblj161/NwWVi6PgGTtk
	 S3iFiCe94p7Ow==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Yanteng Si <si.yanteng@linux.dev>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/8] Docs/translations/*/admin-guide/mm/damon/usage: remove DAMON debugfs interface documentation
Date: Mon,  6 Jan 2025 11:19:34 -0800
Message-Id: <20250106191941.107070-2-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250106191941.107070-1-sj@kernel.org>
References: <20250106191941.107070-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's time to remove DAMON debugfs interface, which has deprecated long
before in February 2023.  Read the cover letter of this patch sereis for
more details.

Remove DAMON debugfs interface usage documentation and references to it
from translations, to avoid confusing users with documents for already
removed things.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 248 +-----------------
 .../zh_TW/admin-guide/mm/damon/usage.rst      | 248 +-----------------
 2 files changed, 2 insertions(+), 494 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
index 50f6f0b6bf11..9d7cb51be493 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
@@ -26,12 +26,7 @@ DAMON 为不同的用户提供了下面这些接口。
   使用它，用户可以通过读取和写入特殊的sysfs文件来使用DAMON的主要功能。因此，你可以编写和使
   用你个性化的DAMON sysfs包装程序，代替你读/写sysfs文件。  `DAMON用户空间工具
   <https://github.com/damonitor/damo>`_ 就是这种程序的一个例子  它同时支持虚拟和物理地址
-  空间的监测。注意，这个界面只提供简单的监测结果 :ref:`统计 <damos_stats>`。对于详细的监测
-  结果，DAMON提供了一个:ref:`跟踪点 <tracepoint>`。
-- *debugfs interface.*
-  :ref:`这 <debugfs_interface>` 几乎与:ref:`sysfs interface <sysfs_interface>` 接
-  口相同。这将在下一个LTS内核发布后被移除，所以用户应该转移到
-  :ref:`sysfs interface <sysfs_interface>`。
+  空间的监测。
 - *内核空间编程接口。*
   :doc:`这 </mm/damon/api>` 这是为内核空间程序员准备的。使用它，用户可以通过为你编写内
   核空间的DAMON应用程序，最灵活有效地利用DAMON的每一个功能。你甚至可以为各种地址空间扩展DAMON。
@@ -335,247 +330,6 @@ tried_regions/<N>/
 请注意，我们强烈建议使用用户空间的工具，如 `damo <https://github.com/damonitor/damo>`_ ，
 而不是像上面那样手动读写文件。以上只是一个例子。
 
-debugfs接口
-===========
-
-.. note::
-
-  DAMON debugfs接口将在下一个LTS内核发布后被移除，所以用户应该转移到
-  :ref:`sysfs接口<sysfs_interface>`。
-
-DAMON导出了八个文件, ``attrs``, ``target_ids``, ``init_regions``,
-``schemes``, ``monitor_on_DEPRECATED``, ``kdamond_pid``, ``mk_contexts`` 和
-``rm_contexts`` under its debugfs directory, ``<debugfs>/damon/``.
-
-
-属性
-----
-
-用户可以通过读取和写入 ``attrs`` 文件获得和设置 ``采样间隔`` 、 ``聚集间隔`` 、 ``更新间隔``
-以及监测目标区域的最小/最大数量。要详细了解监测属性，请参考 `:doc:/mm/damon/design` 。例如，
-下面的命令将这些值设置为5ms、100ms、1000ms、10和1000，然后再次检查::
-
-    # cd <debugfs>/damon
-    # echo 5000 100000 1000000 10 1000 > attrs
-    # cat attrs
-    5000 100000 1000000 10 1000
-
-
-目标ID
-------
-
-一些类型的地址空间支持多个监测目标。例如，虚拟内存地址空间的监测可以有多个进程作为监测目标。用户
-可以通过写入目标的相关id值来设置目标，并通过读取 ``target_ids`` 文件来获得当前目标的id。在监
-测虚拟地址空间的情况下，这些值应该是监测目标进程的pid。例如，下面的命令将pid为42和4242的进程设
-为监测目标，并再次检查::
-
-    # cd <debugfs>/damon
-    # echo 42 4242 > target_ids
-    # cat target_ids
-    42 4242
-
-用户还可以通过在文件中写入一个特殊的关键字 "paddr\n" 来监测系统的物理内存地址空间。因为物理地
-址空间监测不支持多个目标，读取文件会显示一个假值，即 ``42`` ，如下图所示::
-
-    # cd <debugfs>/damon
-    # echo paddr > target_ids
-    # cat target_ids
-    42
-
-请注意，设置目标ID并不启动监测。
-
-
-初始监测目标区域
-----------------
-
-在虚拟地址空间监测的情况下，DAMON自动设置和更新监测的目标区域，这样就可以覆盖目标进程的整个
-内存映射。然而，用户可能希望将监测区域限制在特定的地址范围内，如堆、栈或特定的文件映射区域。
-或者，一些用户可以知道他们工作负载的初始访问模式，因此希望为“自适应区域调整”设置最佳初始区域。
-
-相比之下，DAMON在物理内存监测的情况下不会自动设置和更新监测目标区域。因此，用户应该自己设置
-监测目标区域。
-
-在这种情况下，用户可以通过在 ``init_regions`` 文件中写入适当的值，明确地设置他们想要的初
-始监测目标区域。输入应该是一个由三个整数组成的队列，用空格隔开，代表一个区域的形式如下::
-
-    <target idx> <start address> <end address>
-
-目标idx应该是 ``target_ids`` 文件中目标的索引，从 ``0`` 开始，区域应该按照地址顺序传递。
-例如，下面的命令将设置几个地址范围， ``1-100`` 和 ``100-200`` 作为pid 42的初始监测目标
-区域，这是 ``target_ids`` 中的第一个（索引 ``0`` ），另外几个地址范围， ``20-40`` 和
-``50-100`` 作为pid 4242的地址，这是 ``target_ids`` 中的第二个（索引 ``1`` ）::
-
-    # cd <debugfs>/damon
-    # cat target_ids
-    42 4242
-    # echo "0   1       100 \
-            0   100     200 \
-            1   20      40  \
-            1   50      100" > init_regions
-
-请注意，这只是设置了初始的监测目标区域。在虚拟内存监测的情况下，DAMON会在一个 ``更新间隔``
-后自动更新区域的边界。因此，在这种情况下，如果用户不希望更新的话，应该把 ``更新间隔`` 设
-置得足够大。
-
-
-方案
-----
-
-对于通常的基于DAMON的数据访问感知的内存管理优化，用户只是希望系统对特定访问模式的内存区域应用内
-存管理操作。DAMON从用户那里接收这种形式化的操作方案，并将这些方案应用到目标进程中。
-
-用户可以通过读取和写入 ``scheme`` debugfs文件来获得和设置这些方案。读取该文件还可以显示每个
-方案的统计数据。在文件中，每一个方案都应该在每一行中以下列形式表示出来::
-
-    <target access pattern> <action> <quota> <watermarks>
-
-你可以通过简单地在文件中写入一个空字符串来禁用方案。
-
-目标访问模式
-~~~~~~~~~~~~
-
-``<目标访问模式>`` 是由三个范围构成的，形式如下::
-
-    min-size max-size min-acc max-acc min-age max-age
-
-具体来说，区域大小的字节数（ `min-size` 和 `max-size` ），访问频率的每聚合区间的监测访问次
-数（ `min-acc` 和 `max-acc` ），区域年龄的聚合区间数（ `min-age` 和 `max-age` ）都被指定。
-请注意，这些范围是封闭区间。
-
-动作
-~~~~
-
-``<action>`` 是一个预定义的内存管理动作的整数，DAMON将应用于具有目标访问模式的区域。支持
-的数字和它们的含义如下::
-
- - 0: Call ``madvise()`` for the region with ``MADV_WILLNEED``
- - 1: Call ``madvise()`` for the region with ``MADV_COLD``
- - 2: Call ``madvise()`` for the region with ``MADV_PAGEOUT``
- - 3: Call ``madvise()`` for the region with ``MADV_HUGEPAGE``
- - 4: Call ``madvise()`` for the region with ``MADV_NOHUGEPAGE``
- - 5: Do nothing but count the statistics
-
-配额
-~~~~
-
-每个 ``动作`` 的最佳 ``目标访问模式`` 取决于工作负载，所以不容易找到。更糟糕的是，将某个
-动作的方案设置得过于激进会导致严重的开销。为了避免这种开销，用户可以通过下面表格中的 ``<quota>``
-来限制方案的时间和大小配额::
-
-    <ms> <sz> <reset interval> <priority weights>
-
-这使得DAMON在 ``<reset interval>`` 毫秒内，尽量只用 ``<ms>`` 毫秒的时间对 ``目标访
-问模式`` 的内存区域应用动作，并在 ``<reset interval>`` 内只对最多<sz>字节的内存区域应
-用动作。将 ``<ms>`` 和 ``<sz>`` 都设置为零，可以禁用配额限制。
-
-当预计超过配额限制时，DAMON会根据 ``目标访问模式`` 的大小、访问频率和年龄，对发现的内存
-区域进行优先排序。为了实现个性化的优先级，用户可以在 ``<优先级权重>`` 中设置这三个属性的
-权重，具体形式如下::
-
-    <size weight> <access frequency weight> <age weight>
-
-水位
-~~~~
-
-有些方案需要根据系统特定指标的当前值来运行，如自由内存比率。对于这种情况，用户可以为该条
-件指定水位。::
-
-    <metric> <check interval> <high mark> <middle mark> <low mark>
-
-``<metric>`` 是一个预定义的整数，用于要检查的度量。支持的数字和它们的含义如下。
-
- - 0: 忽视水位
- - 1: 系统空闲内存率 (千分比)
-
-每隔 ``<检查间隔>`` 微秒检查一次公制的值。
-
-如果该值高于 ``<高标>`` 或低于 ``<低标>`` ，该方案被停用。如果该值低于 ``<中标>`` ，
-该方案将被激活。
-
-统计数据
-~~~~~~~~
-
-它还统计每个方案被尝试应用的区域的总数量和字节数，每个方案被成功应用的区域的两个数量，以
-及超过配额限制的总数量。这些统计数据可用于在线分析或调整方案。
-
-统计数据可以通过读取方案文件来显示。读取该文件将显示你在每一行中输入的每个 ``方案`` ，
-统计的五个数字将被加在每一行的末尾。
-
-例子
-~~~~
-
-下面的命令应用了一个方案：”如果一个大小为[4KiB, 8KiB]的内存区域在[10, 20]的聚合时间
-间隔内显示出每一个聚合时间间隔[0, 5]的访问量，请分页出该区域。对于分页，每秒最多只能使
-用10ms，而且每秒分页不能超过1GiB。在这一限制下，首先分页出具有较长年龄的内存区域。另外，
-每5秒钟检查一次系统的可用内存率，当可用内存率低于50%时开始监测和分页，但如果可用内存率
-大于60%，或低于30%，则停止监测“::
-
-    # cd <debugfs>/damon
-    # scheme="4096 8192  0 5    10 20    2"  # target access pattern and action
-    # scheme+=" 10 $((1024*1024*1024)) 1000" # quotas
-    # scheme+=" 0 0 100"                     # prioritization weights
-    # scheme+=" 1 5000000 600 500 300"       # watermarks
-    # echo "$scheme" > schemes
-
-
-开关
-----
-
-除非你明确地启动监测，否则如上所述的文件设置不会产生效果。你可以通过写入和读取 ``monitor_on_DEPRECATED``
-文件来启动、停止和检查监测的当前状态。写入 ``on`` 该文件可以启动对有属性的目标的监测。写入
-``off`` 该文件则停止这些目标。如果每个目标进程被终止，DAMON也会停止。下面的示例命令开启、关
-闭和检查DAMON的状态::
-
-    # cd <debugfs>/damon
-    # echo on > monitor_on_DEPRECATED
-    # echo off > monitor_on_DEPRECATED
-    # cat monitor_on_DEPRECATED
-    off
-
-请注意，当监测开启时，你不能写到上述的debugfs文件。如果你在DAMON运行时写到这些文件，将会返
-回一个错误代码，如 ``-EBUSY`` 。
-
-
-监测线程PID
------------
-
-DAMON通过一个叫做kdamond的内核线程来进行请求监测。你可以通过读取 ``kdamond_pid`` 文件获
-得该线程的 ``pid`` 。当监测被 ``关闭`` 时，读取该文件不会返回任何信息::
-
-    # cd <debugfs>/damon
-    # cat monitor_on_DEPRECATED
-    off
-    # cat kdamond_pid
-    none
-    # echo on > monitor_on_DEPRECATED
-    # cat kdamond_pid
-    18594
-
-
-使用多个监测线程
-----------------
-
-每个监测上下文都会创建一个 ``kdamond`` 线程。你可以使用 ``mk_contexts`` 和 ``rm_contexts``
-文件为多个 ``kdamond`` 需要的用例创建和删除监测上下文。
-
-将新上下文的名称写入 ``mk_contexts`` 文件，在 ``DAMON debugfs`` 目录上创建一个该名称的目录。
-该目录将有该上下文的 ``DAMON debugfs`` 文件::
-
-    # cd <debugfs>/damon
-    # ls foo
-    # ls: cannot access 'foo': No such file or directory
-    # echo foo > mk_contexts
-    # ls foo
-    # attrs  init_regions  kdamond_pid  schemes  target_ids
-
-如果不再需要上下文，你可以通过把上下文的名字放到 ``rm_contexts`` 文件中来删除它和相应的目录::
-
-    # echo foo > rm_contexts
-    # ls foo
-    # ls: cannot access 'foo': No such file or directory
-
-注意， ``mk_contexts`` 、 ``rm_contexts`` 和 ``monitor_on_DEPRECATED`` 文件只在根目录下。
-
 
 监测结果的监测点
 ================
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
index fbbbbad59ee4..d3fd4f850793 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
@@ -26,12 +26,7 @@ DAMON 爲不同的用戶提供了下面這些接口。
   使用它，用戶可以通過讀取和寫入特殊的sysfs文件來使用DAMON的主要功能。因此，你可以編寫和使
   用你個性化的DAMON sysfs包裝程序，代替你讀/寫sysfs文件。  `DAMON用戶空間工具
   <https://github.com/damonitor/damo>`_ 就是這種程序的一個例子  它同時支持虛擬和物理地址
-  空間的監測。注意，這個界面只提供簡單的監測結果 :ref:`統計 <damos_stats>`。對於詳細的監測
-  結果，DAMON提供了一個:ref:`跟蹤點 <tracepoint>`。
-- *debugfs interface.*
-  :ref:`這 <debugfs_interface>` 幾乎與:ref:`sysfs interface <sysfs_interface>` 接
-  口相同。這將在下一個LTS內核發佈後被移除，所以用戶應該轉移到
-  :ref:`sysfs interface <sysfs_interface>`。
+  空間的監測。
 - *內核空間編程接口。*
   :doc:`這 </mm/damon/api>` 這是爲內核空間程序員準備的。使用它，用戶可以通過爲你編寫內
   核空間的DAMON應用程序，最靈活有效地利用DAMON的每一個功能。你甚至可以爲各種地址空間擴展DAMON。
@@ -335,247 +330,6 @@ tried_regions/<N>/
 請注意，我們強烈建議使用用戶空間的工具，如 `damo <https://github.com/damonitor/damo>`_ ，
 而不是像上面那樣手動讀寫文件。以上只是一個例子。
 
-debugfs接口
-===========
-
-.. note::
-
-  DAMON debugfs接口將在下一個LTS內核發佈後被移除，所以用戶應該轉移到
-  :ref:`sysfs接口<sysfs_interface>`。
-
-DAMON導出了八個文件, ``attrs``, ``target_ids``, ``init_regions``,
-``schemes``, ``monitor_on_DEPRECATED``, ``kdamond_pid``, ``mk_contexts`` 和
-``rm_contexts`` under its debugfs directory, ``<debugfs>/damon/``.
-
-
-屬性
-----
-
-用戶可以通過讀取和寫入 ``attrs`` 文件獲得和設置 ``採樣間隔`` 、 ``聚集間隔`` 、 ``更新間隔``
-以及監測目標區域的最小/最大數量。要詳細瞭解監測屬性，請參考 `:doc:/mm/damon/design` 。例如，
-下面的命令將這些值設置爲5ms、100ms、1000ms、10和1000，然後再次檢查::
-
-    # cd <debugfs>/damon
-    # echo 5000 100000 1000000 10 1000 > attrs
-    # cat attrs
-    5000 100000 1000000 10 1000
-
-
-目標ID
-------
-
-一些類型的地址空間支持多個監測目標。例如，虛擬內存地址空間的監測可以有多個進程作爲監測目標。用戶
-可以通過寫入目標的相關id值來設置目標，並通過讀取 ``target_ids`` 文件來獲得當前目標的id。在監
-測虛擬地址空間的情況下，這些值應該是監測目標進程的pid。例如，下面的命令將pid爲42和4242的進程設
-爲監測目標，並再次檢查::
-
-    # cd <debugfs>/damon
-    # echo 42 4242 > target_ids
-    # cat target_ids
-    42 4242
-
-用戶還可以通過在文件中寫入一個特殊的關鍵字 "paddr\n" 來監測系統的物理內存地址空間。因爲物理地
-址空間監測不支持多個目標，讀取文件會顯示一個假值，即 ``42`` ，如下圖所示::
-
-    # cd <debugfs>/damon
-    # echo paddr > target_ids
-    # cat target_ids
-    42
-
-請注意，設置目標ID並不啓動監測。
-
-
-初始監測目標區域
-----------------
-
-在虛擬地址空間監測的情況下，DAMON自動設置和更新監測的目標區域，這樣就可以覆蓋目標進程的整個
-內存映射。然而，用戶可能希望將監測區域限制在特定的地址範圍內，如堆、棧或特定的文件映射區域。
-或者，一些用戶可以知道他們工作負載的初始訪問模式，因此希望爲“自適應區域調整”設置最佳初始區域。
-
-相比之下，DAMON在物理內存監測的情況下不會自動設置和更新監測目標區域。因此，用戶應該自己設置
-監測目標區域。
-
-在這種情況下，用戶可以通過在 ``init_regions`` 文件中寫入適當的值，明確地設置他們想要的初
-始監測目標區域。輸入應該是一個由三個整數組成的隊列，用空格隔開，代表一個區域的形式如下::
-
-    <target idx> <start address> <end address>
-
-目標idx應該是 ``target_ids`` 文件中目標的索引，從 ``0`` 開始，區域應該按照地址順序傳遞。
-例如，下面的命令將設置幾個地址範圍， ``1-100`` 和 ``100-200`` 作爲pid 42的初始監測目標
-區域，這是 ``target_ids`` 中的第一個（索引 ``0`` ），另外幾個地址範圍， ``20-40`` 和
-``50-100`` 作爲pid 4242的地址，這是 ``target_ids`` 中的第二個（索引 ``1`` ）::
-
-    # cd <debugfs>/damon
-    # cat target_ids
-    42 4242
-    # echo "0   1       100 \
-            0   100     200 \
-            1   20      40  \
-            1   50      100" > init_regions
-
-請注意，這只是設置了初始的監測目標區域。在虛擬內存監測的情況下，DAMON會在一個 ``更新間隔``
-後自動更新區域的邊界。因此，在這種情況下，如果用戶不希望更新的話，應該把 ``更新間隔`` 設
-置得足夠大。
-
-
-方案
-----
-
-對於通常的基於DAMON的數據訪問感知的內存管理優化，用戶只是希望系統對特定訪問模式的內存區域應用內
-存管理操作。DAMON從用戶那裏接收這種形式化的操作方案，並將這些方案應用到目標進程中。
-
-用戶可以通過讀取和寫入 ``scheme`` debugfs文件來獲得和設置這些方案。讀取該文件還可以顯示每個
-方案的統計數據。在文件中，每一個方案都應該在每一行中以下列形式表示出來::
-
-    <target access pattern> <action> <quota> <watermarks>
-
-你可以通過簡單地在文件中寫入一個空字符串來禁用方案。
-
-目標訪問模式
-~~~~~~~~~~~~
-
-``<目標訪問模式>`` 是由三個範圍構成的，形式如下::
-
-    min-size max-size min-acc max-acc min-age max-age
-
-具體來說，區域大小的字節數（ `min-size` 和 `max-size` ），訪問頻率的每聚合區間的監測訪問次
-數（ `min-acc` 和 `max-acc` ），區域年齡的聚合區間數（ `min-age` 和 `max-age` ）都被指定。
-請注意，這些範圍是封閉區間。
-
-動作
-~~~~
-
-``<action>`` 是一個預定義的內存管理動作的整數，DAMON將應用於具有目標訪問模式的區域。支持
-的數字和它們的含義如下::
-
- - 0: Call ``madvise()`` for the region with ``MADV_WILLNEED``
- - 1: Call ``madvise()`` for the region with ``MADV_COLD``
- - 2: Call ``madvise()`` for the region with ``MADV_PAGEOUT``
- - 3: Call ``madvise()`` for the region with ``MADV_HUGEPAGE``
- - 4: Call ``madvise()`` for the region with ``MADV_NOHUGEPAGE``
- - 5: Do nothing but count the statistics
-
-配額
-~~~~
-
-每個 ``動作`` 的最佳 ``目標訪問模式`` 取決於工作負載，所以不容易找到。更糟糕的是，將某個
-動作的方案設置得過於激進會導致嚴重的開銷。爲了避免這種開銷，用戶可以通過下面表格中的 ``<quota>``
-來限制方案的時間和大小配額::
-
-    <ms> <sz> <reset interval> <priority weights>
-
-這使得DAMON在 ``<reset interval>`` 毫秒內，儘量只用 ``<ms>`` 毫秒的時間對 ``目標訪
-問模式`` 的內存區域應用動作，並在 ``<reset interval>`` 內只對最多<sz>字節的內存區域應
-用動作。將 ``<ms>`` 和 ``<sz>`` 都設置爲零，可以禁用配額限制。
-
-當預計超過配額限制時，DAMON會根據 ``目標訪問模式`` 的大小、訪問頻率和年齡，對發現的內存
-區域進行優先排序。爲了實現個性化的優先級，用戶可以在 ``<優先級權重>`` 中設置這三個屬性的
-權重，具體形式如下::
-
-    <size weight> <access frequency weight> <age weight>
-
-水位
-~~~~
-
-有些方案需要根據系統特定指標的當前值來運行，如自由內存比率。對於這種情況，用戶可以爲該條
-件指定水位。::
-
-    <metric> <check interval> <high mark> <middle mark> <low mark>
-
-``<metric>`` 是一個預定義的整數，用於要檢查的度量。支持的數字和它們的含義如下。
-
- - 0: 忽視水位
- - 1: 系統空閒內存率 (千分比)
-
-每隔 ``<檢查間隔>`` 微秒檢查一次公制的值。
-
-如果該值高於 ``<高標>`` 或低於 ``<低標>`` ，該方案被停用。如果該值低於 ``<中標>`` ，
-該方案將被激活。
-
-統計數據
-~~~~~~~~
-
-它還統計每個方案被嘗試應用的區域的總數量和字節數，每個方案被成功應用的區域的兩個數量，以
-及超過配額限制的總數量。這些統計數據可用於在線分析或調整方案。
-
-統計數據可以通過讀取方案文件來顯示。讀取該文件將顯示你在每一行中輸入的每個 ``方案`` ，
-統計的五個數字將被加在每一行的末尾。
-
-例子
-~~~~
-
-下面的命令應用了一個方案：”如果一個大小爲[4KiB, 8KiB]的內存區域在[10, 20]的聚合時間
-間隔內顯示出每一個聚合時間間隔[0, 5]的訪問量，請分頁出該區域。對於分頁，每秒最多隻能使
-用10ms，而且每秒分頁不能超過1GiB。在這一限制下，首先分頁出具有較長年齡的內存區域。另外，
-每5秒鐘檢查一次系統的可用內存率，當可用內存率低於50%時開始監測和分頁，但如果可用內存率
-大於60%，或低於30%，則停止監測“::
-
-    # cd <debugfs>/damon
-    # scheme="4096 8192  0 5    10 20    2"  # target access pattern and action
-    # scheme+=" 10 $((1024*1024*1024)) 1000" # quotas
-    # scheme+=" 0 0 100"                     # prioritization weights
-    # scheme+=" 1 5000000 600 500 300"       # watermarks
-    # echo "$scheme" > schemes
-
-
-開關
-----
-
-除非你明確地啓動監測，否則如上所述的文件設置不會產生效果。你可以通過寫入和讀取 ``monitor_on_DEPRECATED``
-文件來啓動、停止和檢查監測的當前狀態。寫入 ``on`` 該文件可以啓動對有屬性的目標的監測。寫入
-``off`` 該文件則停止這些目標。如果每個目標進程被終止，DAMON也會停止。下面的示例命令開啓、關
-閉和檢查DAMON的狀態::
-
-    # cd <debugfs>/damon
-    # echo on > monitor_on_DEPRECATED
-    # echo off > monitor_on_DEPRECATED
-    # cat monitor_on_DEPRECATED
-    off
-
-請注意，當監測開啓時，你不能寫到上述的debugfs文件。如果你在DAMON運行時寫到這些文件，將會返
-回一個錯誤代碼，如 ``-EBUSY`` 。
-
-
-監測線程PID
------------
-
-DAMON通過一個叫做kdamond的內核線程來進行請求監測。你可以通過讀取 ``kdamond_pid`` 文件獲
-得該線程的 ``pid`` 。當監測被 ``關閉`` 時，讀取該文件不會返回任何信息::
-
-    # cd <debugfs>/damon
-    # cat monitor_on_DEPRECATED
-    off
-    # cat kdamond_pid
-    none
-    # echo on > monitor_on_DEPRECATED
-    # cat kdamond_pid
-    18594
-
-
-使用多個監測線程
-----------------
-
-每個監測上下文都會創建一個 ``kdamond`` 線程。你可以使用 ``mk_contexts`` 和 ``rm_contexts``
-文件爲多個 ``kdamond`` 需要的用例創建和刪除監測上下文。
-
-將新上下文的名稱寫入 ``mk_contexts`` 文件，在 ``DAMON debugfs`` 目錄上創建一個該名稱的目錄。
-該目錄將有該上下文的 ``DAMON debugfs`` 文件::
-
-    # cd <debugfs>/damon
-    # ls foo
-    # ls: cannot access 'foo': No such file or directory
-    # echo foo > mk_contexts
-    # ls foo
-    # attrs  init_regions  kdamond_pid  schemes  target_ids
-
-如果不再需要上下文，你可以通過把上下文的名字放到 ``rm_contexts`` 文件中來刪除它和相應的目錄::
-
-    # echo foo > rm_contexts
-    # ls foo
-    # ls: cannot access 'foo': No such file or directory
-
-注意， ``mk_contexts`` 、 ``rm_contexts`` 和 ``monitor_on_DEPRECATED`` 文件只在根目錄下。
-
 
 監測結果的監測點
 ================
-- 
2.39.5

