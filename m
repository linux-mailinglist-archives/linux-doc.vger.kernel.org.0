Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9161B464ED9
	for <lists+linux-doc@lfdr.de>; Wed,  1 Dec 2021 14:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232512AbhLANgw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Dec 2021 08:36:52 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:16332 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238984AbhLANgu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Dec 2021 08:36:50 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J40QD1nc2z91NC;
        Wed,  1 Dec 2021 21:32:52 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 21:33:25 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 21:33:24 +0800
Subject: Re: [PATCH] doc/zh-CN: Update cpu-freq/core.rst to make it more
 readable
To:     Alex Shi <seakeel@gmail.com>
CC:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, <zhengbin13@huawei.com>
References: <20211130153400.6409-1-tangyizhou@huawei.com>
 <CAJy-Amk1iYsJQcerQG+JCE-ARyyvtUYGLminhZhW6aBj1vfSNQ@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <4ace4916-9cd2-1f18-7fb0-2a2e9feee667@huawei.com>
Date:   Wed, 1 Dec 2021 21:33:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAJy-Amk1iYsJQcerQG+JCE-ARyyvtUYGLminhZhW6aBj1vfSNQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/12/1 16:31, Alex Shi wrote:
> On Tue, Nov 30, 2021 at 11:06 PM Tang Yizhou <tangyizhou@huawei.com> wrote:
>>
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> ---
>>  .../translations/zh_CN/cpu-freq/core.rst      | 20 +++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_CN/cpu-freq/core.rst b/Documentation/translations/zh_CN/cpu-freq/core.rst
>> index 0c6fd447ced6..bf83cad70b68 100644
>> --- a/Documentation/translations/zh_CN/cpu-freq/core.rst
>> +++ b/Documentation/translations/zh_CN/cpu-freq/core.rst
>> @@ -29,10 +29,10 @@ CPUFreq核心和CPUFreq通知器的通用说明
>>  ======================
>>
>>  cpufreq核心代码位于drivers/cpufreq/cpufreq.c中。这些cpufreq代码为CPUFreq架构的驱
>> -动程序（那些操作硬件切换频率的代码）以及 "通知器 "提供了一个标准化的接口。
>> -这些是设备驱动程序或需要了解策略变化的其它内核部分（如 ACPI 热量管理）或所有频率更改（除
>> -计时代码外），甚至需要强制确定速度限制的通知器（如 ARM 架构上的 LCD 驱动程序）。
>> -此外， 内核 "常数" loops_per_jiffy会根据频率变化而更新。
>> +动程序（那些执行硬件频率切换的代码）以及 "通知器" 提供了一个标准化的接口。
>> +包括设备驱动程序；需要了解策略变化（如 ACPI 热量管理），或所有频率变化（如计时代码），
>> +甚至需要强制限制为指定频率（如 ARM 架构上的 LCD 驱动程序）的其它内核组件。
>> +此外，内核 "常数" loops_per_jiffy 会根据频率变化而更新。
>>
>>  cpufreq策略的引用计数由 cpufreq_cpu_get 和 cpufreq_cpu_put 来完成，以确保 cpufreq 驱
>>  动程序被正确地注册到核心中，并且驱动程序在 cpufreq_put_cpu 被调用之前不会被卸载。这也保证
>> @@ -41,7 +41,7 @@ cpufreq策略的引用计数由 cpufreq_cpu_get 和 cpufreq_cpu_put 来完成，
>>  2. CPUFreq 通知器
>>  ====================
>>
>> -CPUFreq通知器符合标准的内核通知器接口。
>> +CPUFreq通知器遵循标准的内核通知器接口。
>>  关于通知器的细节请参阅 linux/include/linux/notifier.h。
>>
>>  这里有两个不同的CPUfreq通知器 - 策略通知器和转换通知器。
>> @@ -69,20 +69,20 @@ CPUFreq通知器符合标准的内核通知器接口。
>>
>>  第三个参数是一个包含如下值的结构体cpufreq_freqs：
>>
>> -=====  ====================
>> -cpu    受影响cpu的编号
>> +====== ===============================
> 
> LGTM,
> Reviewed-by: Alex Shi <alexs@kernel.org>
> 
> BTW, please make sure the '=' count is right. -- I didn't count them. :)

I have checked the HTML page. There is no problem. Thanks.

> 
>> +policy 指向struct cpufreq_policy的指针
>>  old    旧频率
>>  new    新频率
>>  flags  cpufreq驱动的标志
>> -=====  ====================
>> +====== ===============================
>>
>>  3. 含有Operating Performance Point (OPP)的CPUFreq表的生成
>>  ==================================================================
>>  关于OPP的细节请参阅 Documentation/power/opp.rst
>>
>>  dev_pm_opp_init_cpufreq_table -
>> -       这个功能提供了一个随时可用的转换程序，用来将OPP层关于可用频率的内部信息翻译成一种容易提供给
>> -       cpufreq的格式。
>> +       这个函数提供了一个随时可用的转换例程，用来将OPP层关于可用频率的内部信息翻译成一种
>> +       cpufreq易于理解格式。
>>
>>         .. Warning::
>>
>> --
>> 2.17.1
>>

Tang
