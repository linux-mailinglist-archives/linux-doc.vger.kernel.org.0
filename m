Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93F534E6D7
	for <lists+linux-doc@lfdr.de>; Tue, 30 Mar 2021 13:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhC3Lsd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Mar 2021 07:48:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46628 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232238AbhC3Lro (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 30 Mar 2021 07:47:44 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxzcjSD2NgLF4CAA--.2278S5;
        Tue, 30 Mar 2021 19:47:34 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 3/8] docs/zh_CN: add cpu-freq cpufreq-stats.rst translation
Date:   Tue, 30 Mar 2021 19:47:23 +0800
Message-Id: <20210330114728.2680-4-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330114728.2680-1-siyanteng@loongson.cn>
References: <20210330114728.2680-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxzcjSD2NgLF4CAA--.2278S5
X-Coremail-Antispam: 1UD129KBjvJXoW3XFyxCw17GryxAry8KrWkXrb_yoW7WFW7pr
        n2gFWxKF4xJFyDAanxKr4UKw1UJFn7A3W7GrWxJrnxtr4UJr4Yq3WYkFyUtFW3W3yDuFy5
        ZrsYyry09rW5Kw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUbHKZJUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documention/cpu-freq/cpufreq-stats.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/cpu-freq/cpufreq-stats.rst          | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst

diff --git a/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
new file mode 100644
index 000000000000..d21a317d9659
--- /dev/null
+++ b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
@@ -0,0 +1,130 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../cpu-freq/cpufreq-stats`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_cpufreq-stats.rst:
+
+
+==========================================
+sysfs CPUFreq Stats的一般说明
+==========================================
+
+用户信息
+
+
+作者: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
+
+.. Contents
+
+   1. 简介
+   2. 提供的统计数据(举例说明)
+   3. 配置cpufreq-stats
+
+
+1. 简介
+===============
+
+cpufreq-stats是一个为每个CPU提供CPU频率统计的驱动。
+这些统计数据在/sysfs中以一堆只读接口的形式提供。这个接口（在配置好后）将出现在
+/sysfs（<sysfs root>/devices/system/cpu/cpuX/cpufreq/stats/）中cpufreq下的一个单
+独的目录中，提供给每个CPU。
+各种统计数据将在此目录下形成只读文件。
+
+此驱动是独立于任何可能运行在你所用CPU上的特定cpufreq_driver而设计的。因此，它将与所有
+cpufreq_driver一起工作。
+
+
+2. 提供的统计数据(举例说明)
+=====================================
+
+cpufreq stats提供了以下统计数据（在下面详细解释）。
+
+-  time_in_state
+-  total_trans
+-  trans_table
+
+所有的统计数据将从统计驱动被载入的时间（或统计被重置的时间）开始，到某一统计数据被读取的时间为止。
+显然，统计驱动不会有任何关于统计驱动载入之前的频率转换信息。
+
+::
+
+    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # ls -l
+    total 0
+    drwxr-xr-x  2 root root    0 May 14 16:06 .
+    drwxr-xr-x  3 root root    0 May 14 15:58 ..
+    --w-------  1 root root 4096 May 14 16:06 reset
+    -r--r--r--  1 root root 4096 May 14 16:06 time_in_state
+    -r--r--r--  1 root root 4096 May 14 16:06 total_trans
+    -r--r--r--  1 root root 4096 May 14 16:06 trans_table
+
+- **reset**
+
+只写属性，可用于重置统计计数器。这对于评估不同调节器下的系统行为非常有用，且无需重启。
+
+
+- **time_in_state**
+
+此项给出了这个CPU所支持的每个频率所花费的时间。cat输出的每一行都会有"<frequency>
+<time>"对，表示这个CPU在<frequency>上花费了<time>个usertime单位的时间。这里的
+usertime单位是10mS（类似于/proc中输出的其他时间）。
+
+::
+
+    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # cat time_in_state
+    3600000 2089
+    3400000 136
+    3200000 34
+    3000000 67
+    2800000 172488
+
+
+- **total_trans**
+
+给出了这个CPU上频率转换的总次数。cat的输出将有一个单一的计数，这就是频率转换的总数。
+
+::
+
+    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # cat total_trans
+    20
+
+- **trans_table**
+
+这将提供所有CPU频率转换的细粒度信息。这里的cat输出是一个二维矩阵，其中一个条目<i, j>（第
+i行，第j列）代表从Freq_i到Freq_j的转换次数。Freq_i行和Freq_j列遵循驱动最初提供给cpufreq
+核的频率表的排序顺序，因此可以排序（升序或降序）或不排序。 这里的输出也包含了每行每列的实际
+频率值，以便更好地阅读。
+
+如果转换表大于PAGE_SIZE，读取时将返回一个-EFBIG错误。
+
+::
+
+    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # cat trans_table
+    From  :    To
+	    :   3600000   3400000   3200000   3000000   2800000
+    3600000:         0         5         0         0         0
+    3400000:         4         0         2         0         0
+    3200000:         0         1         0         2         0
+    3000000:         0         0         1         0         3
+    2800000:         0         0         0         2         0
+
+3. 配置cpufreq-stats
+============================
+
+要在你的内核中配置cpufreq-stats::
+
+	Config Main Menu
+		Power management options (ACPI, APM)  --->
+			CPU Frequency scaling  --->
+				[*] CPU Frequency scaling
+				[*]   CPU frequency translation statistics
+
+
+"CPU Frequency scaling" (CONFIG_CPU_FREQ) 应该被启用以配置cpufreq-stats。
+
+"CPU frequency translation statistics" (CONFIG_CPU_FREQ_STAT)提供了包括
+time_in_state、total_trans和trans_table的统计数据。
+
+一旦启用了这个选项，并且你的CPU支持cpufrequency，你就可以在/sysfs中看到CPU频率统计。
-- 
2.25.1

