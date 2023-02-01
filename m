Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4BF67FE59
	for <lists+linux-doc@lfdr.de>; Sun, 29 Jan 2023 11:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjA2Ktz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 29 Jan 2023 05:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234887AbjA2Kty (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 29 Jan 2023 05:49:54 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDFE420D02
        for <linux-doc@vger.kernel.org>; Sun, 29 Jan 2023 02:49:51 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.204])
        by gateway (Coremail) with SMTP id _____8Bx7epOT9ZjUk8JAA--.19554S3;
        Sun, 29 Jan 2023 18:49:50 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.108.204])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxB71MT9ZjQxokAA--.6041S3;
        Sun, 29 Jan 2023 18:49:49 +0800 (CST)
Message-ID: <45acb94a-27d2-81a1-d832-5b8ccefa84b6@loongson.cn>
Date:   Sun, 29 Jan 2023 18:49:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] docs/zh_CN: add damon lru_sort translation
To:     Zang Leigang <zangleigang@hisilicon.com>, alexs@kernel.org,
        corbet@lwn.net
Cc:     rppt@kernel.org, linux-doc@vger.kernel.org
References: <20230120012859.29356-1-zangleigang@hisilicon.com>
Content-Language: en-US
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <20230120012859.29356-1-zangleigang@hisilicon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxB71MT9ZjQxokAA--.6041S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvAXoW3ur4ruw4DAr1kur1fGryUZFb_yoW8JrW5Ao
        Z0vw4Y9rnrAF45J34UAr4rXw47KF48CrsxGwnxWrnFkr1UtF1Fyry8Ja9rGr4Svry5GF13
        tF13AF43Ga13Aa45n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
        J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
        UUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
        0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4
        xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8
        JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8w
        CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
        6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64
        vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_
        Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
        vEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_50,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 1/20/23 09:28, Zang Leigang 写道:
> Translate .../admin-guide/mm/damon/lru_sort.rst into Chinese.
>
> Signed-off-by: Zang Leigang <zangleigang@hisilicon.com>
> ---
>   .../zh_CN/admin-guide/mm/damon/index.rst      |   1 +
>   .../zh_CN/admin-guide/mm/damon/lru_sort.rst   | 263 ++++++++++++++++++
>   2 files changed, 264 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
>
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
> index 30c69e1f44fe..6f8676a50b38 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
> @@ -22,6 +22,7 @@
>      start
>      usage
>      reclaim
> +   lru_sort
>   
>   
>   
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
> new file mode 100644
> index 000000000000..359984660d9d
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
> @@ -0,0 +1,263 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/admin-guide/mm/damon/lru_sort.rst
> +
> +:翻译:
> +
> + 臧雷刚 Leigang Zang <zangleigang@hisilicon.com>
> +
> +:校译:
> +
> +==================
> +基于DAMON的LRU排序
> +==================
> +
> +基于DAMON的LRU排序是一个静态的内核模块，旨在用于以主动的、轻量级的数据访问模型
> +为基础的页面优先级处理的LRU链表上，以使得LRU上的数据访问模型更为可信。
> +
> +哪里需要主动的LRU排序
> +=====================
> +
> +在一个大型系统中，以页为粒度的访问检测会有比较显著的开销，LRU通常不会主动去排序，
> +而是对部分特殊事件进行部分的、响应式的排序，例如：特殊的用户请求，系统调用或者
> +内存压力。这导致，在有些场景下，LRU不能够完美的作为一个可信的数据访问模型，比如
> +在内存压力下对目标内存进行回收。
> +
> +因为DAMON能够尽可能准确的识别数据访问模型，同时只引起用户指定范围的开销，主动的
> +执行DAMON_LRU_SORT让LRU变得更为可信是有帮助的，而且这只需要较少和可控的开销。
How about 主动的执行DAMON_LRU_SORT让LRU变得更为可信是有益的?
> +
> +这是如何工作的
> +==============
> +
> +DAMON_LRU_SORT使用DAMON寻找热页（范围内的页面访问频率高于用户指定的阈值）和冷页
> +（范围内的页面在超过用户指定的时间无访问），并提高热页和降低冷页在LRU中的优先级。
> +为了避免在排序过程消耗过多的CPU，可以设置一个CPU占用时间的约束值。在约束下，分

How about 消耗过多的CPU -> 占用更多的CPU计算资源？

> +别提升或者降低更多的热页和冷页。系统管理员也可以配置三个内存水线以控制在何种条
> +件下自动激活或者停止这种机制。
> +
> +冷热阈值和CPU约束的默认值是比较保持的。这意味着，在默认参数下，模块可以广泛且无
比较保持 -> 比较保守？
> +负作用的使用在常见环境中，同时在只消耗一小部分CPU时间的情况下，给有内存压力的系
> +统提供一定水平的冷热识别。
> +
> +接口：模块参数
> +==============
> +
> +使用此特性，你首先需要确认你的系统中运行的内核在编译时带上了

带上了 -> 启用了。


> +``CONFIG_DAMON_LRU_SORT=y``.
> +
> +为了让系统管理员打开或者关闭并且调节指定的系统，DAMON_LRU_SORT设计了模块参数。
> +这意味着，你可以添加 ``damon_lru_sort.<parameter>=<value>`` 到内核的启动命令行
> +参数，或者在 ``/sys/modules/damon_lru_sort/parameters/<parameter>`` 写入正确的
> +值。
> +
> +下边是每个参数的描述
> +
> +enabled
> +-------
> +
> +打开或者关闭DAMON_LRU_SORT.
> +
> +你可以通过设置这个参数为 ``Y`` 来打开DAMON_LRU_SORT。设置为 ``N`` 关闭
> +DAMON_LRU_SORT。注意，在基于水线的激活的情况下，DAMON_LRU_SORT有可能不会真正去

水线 -> 水位？

We have a glossary now :)

see <Documentation/translations/zh_CN/glossary.rst>

> +监测或者做LRU排序。对这种情况，参考下方关于水线的描述。
> +
> +commit_inputs
> +-------------
> +
> +让DAMON_LRU_SORT再次读取输入参数，除了 ``enabled`` 。
> +
> +在DAMON_LRU_SORT运行时，新的输入参数不会默认被应用。一旦这个参数被设置为 ``Y``
默认不会被应用？
> +，DAMON_LRU_SORT会再次读取除了 ``enabled`` 之外的参数。读取完成后，这个参数会被
> +设置为 ``N`` 。如果在读取时发现有无效参数，DAMON_LRU_SORT会被关闭。
> +
> +hot_thres_access_freq
> +---------------------
> +
> +热点内存区域的访问频率阈值，千分比。
冷/热内存区？
> +
> +如果一个内存区域的访问频率大于等于这个值，DAMON_LRU_SORT把这个区域看作热区，并
ditto
> +在LRU上把这个区域标记为已访问，因些在内存压力下这部分内存不会被回收。默认为50%。
> +
> +cold_min_age
> +------------
> +
> +用于识别冷内存区域的时间阈值，微秒。
单位是微秒
> +
> +如果一个内存区域在这个时间内未被访问过，DAMON_LRU_SORT把这个区域看作冷区，并在
> +LRU上把这个区域标记为未访问，因此在内存压力下这些内存会首先被回收。默认值为120
> +秒。
> +
> +quota_ms
> +--------
> +
> +尝试LRU链表排序的时间限制，毫秒。
ditto
> +
> +DAMON_LRU_SORT在一个时间窗口内（quota_reset_interval_ms）内最多尝试这么长时间来
> +对LRU进行排序。这个可以用来作为CPU消耗的约束。如果值为0，则表示无限制。
In line with above.

CPU消耗的约束

> +
> +默认10毫秒。
> +
> +quota_reset_interval_ms
> +-----------------------
> +
> +配额计时重置周期，毫秒。
> +
> +配额计时重置周期。即，在quota_reset_interval_ms毫秒内，DAMON_LRU_SORT对LRU进行
> +排序不会超过quota_ms或者quota_sz。
> +
> +默认1秒。
> +
> +wmarks_interval
> +---------------
> +
> +核查时间周期的水母，微秒。
Wrong translation.
> +
> +当DAMON_LRU_SORT使能但是由于水线而不活跃时检查水线前最小的等待时间。默认值5秒。
> +
> +wmarks_high
> +-----------
> +
> +空闲内存高水线，千分比。
> +
> +如果空闲内存水线高于这个值，DAMON_LRU_SORT停止工作，不做任何事，除了周期性的检
> +查水线。默认200(20%)。
> +
> +wmarks_mid
> +----------
> +
> +空闲内存中间水线，千分比。
> +
> +如果空闲内存水线在这个值与低水线之间，DAMON_LRU_SORT开始工作，开始检测并对LRU链
> +表进行排序。默认150(15%)。
> +
> +wmarks_low
> +----------
> +
> +空闲内存低水线，千分比。
> +
> +如果空闲内存小于这个值，DAMON_LRU_SORT不再工作，不做任何事，除了周期性的检查水
> +线。默认50(5%)。
> +
> +sample_interval
> +---------------
> +
> +监测的采样周期，微秒。
> +
> +DAMON对冷内存监测的采样周期。更多细节请参考DAMON文档 (:doc:`usage`) 。默认5
> +毫秒。
> +
> +aggr_interval
> +-------------
> +
> +监测的收集周期，微秒。
> +
> +DAMON对冷内存进行收集的时间周期。更多细节请参考DAMON文档 (:doc:`usage`) 。默认
> +100毫秒。
> +
> +min_nr_regions
> +--------------
> +
> +最小监测区域数量。
> +
> +对冷内存区域监测的最小数量。这个值可以作为监测质量的下限。不过，这个值设置的过
> +大会增加开销。更多细节请参考DAMON文档 (:doc:`usage`) 。默认值为10。
> +
> +max_nr_regions
> +--------------
> +
> +最大监测区域数量。
> +
> +对冷内存区域监测的最大数量。这个值可以作为监测质量的上限。然而，这个值设置的过
> +低会导致监测结果变差。更多细节请参考DAMON文档 (:doc:`usage`) 。默认值为1000。
> +
> +monitor_region_start
> +--------------------
> +
> +目标内存区域的起始物理地址。
> +
> +DAMON_LRU_SORT要处理的目标内存区域的起始物理地址。默认，使用系统最大内存。
> +
> +monitor_region_end
> +------------------
> +
> +目标内存区域的结束物理地址。
> +
> +DAMON_LRU_SORT要处理的目标内存区域的结束物理地址。默认，使用系统最大内存。
> +
> +kdamond_pid
> +-----------
> +
> +DAMON线程的PID。
> +
> +如果DAMON_LRU_SORT是使能的，这个表示任务线程的PID。其它情况为-1。
> +
> +nr_lru_sort_tried_hot_regions
> +-----------------------------
> +
> +被尝试进行LRU排序的热内存区域的数量。
> +
> +bytes_lru_sort_tried_hot_regions
> +--------------------------------
> +
> +被尝试进行LRU排序的热内存区域的大小（字节）。
> +
> +nr_lru_sorted_hot_regions
> +-------------------------
> +
> +成功进行LRU排序的热内存区域的数量。
> +
> +bytes_lru_sorted_hot_regions
> +----------------------------
> +
> +成功进行LRU排序的热内存区域的大小（字节）。
> +
> +nr_hot_quota_exceeds
> +--------------------
> +
> +热区域时间约束超过限制的次数。
> +
> +nr_lru_sort_tried_cold_regions
> +------------------------------
> +
> +被尝试进行LRU排序的冷内存区域的数量。
> +
> +bytes_lru_sort_tried_cold_regions
> +---------------------------------
> +
> +被尝试进行LRU排序的冷内存区域的大小（字节）。
> +
> +nr_lru_sorted_cold_regions
> +--------------------------
> +
> +成功进行LRU排序的冷内存区域的数量。
> +
> +bytes_lru_sorted_cold_regions
> +-----------------------------
> +
> +成功进行LRU排序的冷内存区域的大小（字节）。
> +
> +nr_cold_quota_exceeds
> +---------------------
> +
> +冷区域时间约束超过限制的次数。
> +
> +Example
> +=======
> +
> +如下是一个运行时的命令示例，使DAMON_LRU_SORT查找访问频率超过50%的区域并对其进行
> +LRU的优先级的提升，同时降低那些超过120秒无人访问的内存区域的优先级。优先级的处
> +理被限制在最多1%的CPU以避免DAMON_LRU_SORT消费过多CPU时间。在系统空闲内存超过50%
> +时DAMON_LRU_SORT停止工作，并在低于40%时重新开始工作。如果DAMON_RECLAIM没有取得
> +进展且空闲内存低于20%，再次让DAMON_LRU_SORT停止工作，以此回退到以LRU链表为基础
> +以页面为单位的内存回收上。
> +
> +    # cd /sys/modules/damon_lru_sort/parameters
> +    # echo 500 > hot_thres_access_freq
> +    # echo 120000000 > cold_min_age
> +    # echo 10 > quota_ms
> +    # echo 1000 > quota_reset_interval_ms
> +    # echo 500 > wmarks_high
> +    # echo 400 > wmarks_mid
> +    # echo 200 > wmarks_low
> +    # echo Y > enabled


Good job!


Thanks,

Yanteng

