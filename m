Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D34937A04F
	for <lists+linux-doc@lfdr.de>; Tue, 11 May 2021 09:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhEKHIC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 May 2021 03:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhEKHH7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 May 2021 03:07:59 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A7DC061574
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 00:06:52 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id z6-20020a17090a1706b0290155e8a752d8so773050pjd.4
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 00:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hu2H3K/YP0uwOyPEXR6H6CtQZAqrMV/bnr2t4Q6259A=;
        b=bGj25UEQBRcrkjsPLejwybA59ZN8A9f90YRY/LfdObmbanRwpfxh5ZBRrG4FKLlH2t
         N0dBbRvULdRM6CHnAUqZI3yXPgq/mS3JRUnFvdaJnyict/o0kyPBXkorqw14C0j87XNM
         1ICVEyegp1NQZGwGQWe+RZvNozZk/xGnYzL3DShXHl59/CaoQG7DYlNXODp2SW0uByga
         x1OdJ7vhru7rcf/uKplvmWi+xl4KsBef8MyrxI4eptAf4RkESP4Le4vzE34BfDnP+f3Z
         EqWXcwpi4zCRRpstvc0AePRHqcyqvsHQStouxUrFnhfdN9v57oOg3AiLaj9Vp7IksUjw
         Z71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hu2H3K/YP0uwOyPEXR6H6CtQZAqrMV/bnr2t4Q6259A=;
        b=iFSfuc8cv6/XpV2/CBWlbaNlbu8NvEyBKKR1q1531mmtI8JC18uGinonNXHIyBguKa
         5JeVSUMmq2sN09RL9s+6YxsN/G5mgvJJ4wE6sZSo5M/94ytseG5nXdcMhqmeRcF51dO5
         oVjXyGi6NjcWLj3982AOTDUvJyq7s0BSRFJ3W839Bv6lPeRLdILnVptgYWyTCKU1IH4L
         sM7AGojzinwQunwcpnxI0STjGLtIYq7+sKZtZSMDKtcSoyqlWQj2lrISk+bZJpTnFFiC
         Gc/QCvh96lyvpgA61gQiv8FBYAynJtyrxoOhstwjK2lYDxGb4wPUcSDytwv5GDJj462n
         /O6Q==
X-Gm-Message-State: AOAM530CX6gjbP5wWQANsRpdN1uL6P0mL1xWrTbDk6v32YFzcbqQlU/D
        mZsA1KQ6IXWIBfZTRL5HAoI=
X-Google-Smtp-Source: ABdhPJwTwNpQHZSRo2swXYtdSG1qumvHpmYp8Z4v8WVwX8XPcG8GOcJ6HwYVE7pYnm0WTffZHBIyWg==
X-Received: by 2002:a17:902:7b8e:b029:ec:982d:7a7e with SMTP id w14-20020a1709027b8eb02900ec982d7a7emr28808333pll.55.1620716811527;
        Tue, 11 May 2021 00:06:51 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id g15sm12322066pfv.127.2021.05.11.00.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 00:06:50 -0700 (PDT)
Subject: Re: [PATCH v2] docs/zh_CN: add core-api workqueue.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
References: <20210510015938.1590715-1-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <484d5646-b9be-cc53-8316-9e742fca8487@gmail.com>
Date:   Tue, 11 May 2021 15:06:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210510015938.1590715-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kenrel.org>

On 2021/5/10 上午9:59, Yanteng Si wrote:
> v2:
> 
> Some bad translations have been modified as suggested by Alex.Thank you for your review.
> https://lore.kernel.org/linux-doc/CAEensMwq=i+nek6sNeqOJJMY648Q9ZF8cTKpXdJVuqdQQnMWUw@mail.gmail.com/T/#t
> 
> v1:
> 
> This patch translates Documentation/core-api/workqueue.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   5 +
>  .../translations/zh_CN/core-api/workqueue.rst | 336 ++++++++++++++++++
>  2 files changed, 341 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/workqueue.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index f1fa71e45c77..fb79ebe10823 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -19,6 +19,11 @@
>  来的大量 kerneldoc 信息；有朝一日，若有人有动力的话，应当把它们拆分
>  出来。
>  
> +.. toctree::
> +   :maxdepth: 1
> +
> +   workqueue
> +
>  Todolist:
>  
>     kernel-api
> diff --git a/Documentation/translations/zh_CN/core-api/workqueue.rst b/Documentation/translations/zh_CN/core-api/workqueue.rst
> new file mode 100644
> index 000000000000..832514830e0b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/workqueue.rst
> @@ -0,0 +1,336 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/workqueue.rst
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_workqueue.rst:
> +
> +
> +=========================
> +并发管理的工作队列 (cmwq)
> +=========================
> +
> +:日期: September, 2010
> +:作者: Tejun Heo <tj@kernel.org>
> +:作者: Florian Mickler <florian@mickler.org>
> +
> +
> +简介
> +====
> +
> +在很多情况下，需要一个异步进程的执行环境，工作队列（wq）API是这种情况下
> +最常用的机制。
> +
> +当需要这样一个异步执行上下文时，一个描述将要执行的函数的工作项（work，
> +即一个待执行的任务）被放在队列中。一个独立的线程作为异步执行环境。该队
> +列被称为workqueue，线程被称为工作者（worker，即执行这一队列的线程）。
> +
> +当工作队列上有工作项时，工作者会一个接一个地执行与工作项相关的函数。当
> +工作队列中没有任何工作项时，工作者就会变得空闲。当一个新的工作项被排入
> +队列时，工作者又开始执行。
> +
> +
> +为什么要cmwq?
> +=============
> +
> +在最初的wq实现中，多线程（MT）wq在每个CPU上有一个工作者线程，而单线程
> +（ST）wq在全系统有一个工作者线程。一个MT wq需要保持与CPU数量相同的工
> +作者数量。这些年来，内核增加了很多MT wq的用户，随着CPU核心数量的不断
> +增加，一些系统刚启动就达到了默认的32k PID的饱和空间。
> +
> +尽管MT wq浪费了大量的资源，但所提供的并发性水平却不能令人满意。这个限
> +制在ST和MT wq中都有，只是在MT中没有那么严重。每个wq都保持着自己独立的
> +工作者池。一个MT wq只能为每个CPU提供一个执行环境，而一个ST wq则为整个
> +系统提供一个。工作项必须竞争这些非常有限的执行上下文，从而导致各种问题，
> +包括在单一执行上下文周围容易发生死锁。
> +
> +(MT wq)所提供的并发性水平和资源使用之间的矛盾也迫使其用户做出不必要的权衡，比
> +如libata选择使用ST wq来轮询PIO，并接受一个不必要的限制，即没有两个轮
> +询PIO可以同时进行。由于MT wq并没有提供更好的并发性，需要更高层次的并
> +发性的用户，如async或fscache，不得不实现他们自己的线程池。
> +
> +并发管理工作队列（cmwq）是对wq的重新实现，重点是以下目标。
> +
> +* 保持与原始工作队列API的兼容性。
> +
> +* 使用由所有wq共享的每CPU统一的工作者池，在不浪费大量资源的情况下按
> +* 需提供灵活的并发水平。
> +
> +* 自动调节工作者池和并发水平，使API用户不需要担心这些细节。
> +
> +
> +设计
> +====
> +
> +为了简化函数的异步执行，引入了一个新的抽象概念，即工作项。
> +
> +一个工作项是一个简单的结构，它持有一个指向将被异步执行的函数的指针。
> +每当一个驱动程序或子系统希望一个函数被异步执行时，它必须建立一个指
> +向该函数的工作项，并在工作队列中排队等待该工作项。（就是挂到workqueue
> +队列里面去）
> +
> +特定目的线程，称为工作线程（工作者），一个接一个地执行队列中的功能。
> +如果没有工作项排队，工作者线程就会闲置。这些工作者线程被管理在所谓
> +的工作者池中。
> +
> +cmwq设计区分了面向用户的工作队列，子系统和驱动程序在上面排队工作，
> +以及管理工作者池和处理排队工作项的后端机制。
> +
> +每个可能的CPU都有两个工作者池，一个用于正常的工作项，另一个用于高
> +优先级的工作项，还有一些额外的工作者池，用于服务未绑定工作队列的工
> +作项目——这些后备池的数量是动态的。
> +
> +当他们认为合适的时候，子系统和驱动程序可以通过特殊的
> +``workqueue API`` 函数创建和排队工作项。他们可以通过在工作队列上
> +设置标志来影响工作项执行方式的某些方面，他们把工作项放在那里。这些
> +标志包括诸如CPU定位、并发限制、优先级等等。要获得详细的概述，请参
> +考下面的 ``alloc_workqueue()`` 的 API 描述。
> +
> +当一个工作项被排入一个工作队列时，目标工作池将根据队列参数和工作队
> +列属性确定，并被附加到工作池的共享工作列表上。例如，除非特别重写，
> +否则一个绑定的工作队列的工作项将被排在与发起线程运行的CPU相关的普
> +通或高级工作工作者池的工作项列表中。
> +
> +对于任何工作者池的实施，管理并发水平（有多少执行上下文处于活动状
> +态）是一个重要问题。最低水平是为了节省资源，而饱和水平是指系统被
> +充分使用。
> +
> +每个与实际CPU绑定的worker-pool通过钩住调度器来实现并发管理。每当
> +一个活动的工作者被唤醒或睡眠时，工作者池就会得到通知，并跟踪当前可
> +运行的工作者的数量。一般来说，工作项不会占用CPU并消耗很多周期。这
> +意味着保持足够的并发性以防止工作处理停滞应该是最优的。只要CPU上有
> +一个或多个可运行的工作者，工作者池就不会开始执行新的工作，但是，当
> +最后一个运行的工作者进入睡眠状态时，它会立即安排一个新的工作者，这
> +样CPU就不会在有待处理的工作项目时闲置。这允许在不损失执行带宽的情
> +况下使用最少的工作者。
> +
> +除了kthreads的内存空间外，保留空闲的工作者并没有其他成本，所以cmwq
> +在杀死它们之前会保留一段时间的空闲。
> +
> +对于非绑定的工作队列，后备池的数量是动态的。可以使用
> +``apply_workqueue_attrs()`` 为非绑定工作队列分配自定义属性，
> +workqueue将自动创建与属性相匹配的后备工作者池。调节并发水平的责任在
> +用户身上。也有一个标志可以将绑定的wq标记为忽略并发管理。
> +详情请参考API部分。
> +
> +前进进度的保证依赖于当需要更多的执行上下文时可以创建工作者，这也是
> +通过使用救援工作者来保证的。所有可能在处理内存回收的代码路径上使用
> +的工作项都需要在wq上排队，wq上保留了一个救援工作者，以便在内存有压
> +力的情况下下执行。否则，工作者池就有可能出现死锁，等待执行上下文释
> +放出来。
> +
> +
> +应用程序编程接口 (API)
> +======================
> +
> +``alloc_workqueue()`` 分配了一个wq。原来的 ``create_*workqueue()``
> +函数已被废弃，并计划删除。 ``alloc_workqueue()`` 需要三个
> +参数 - ``@name`` , ``@flags`` 和 ``@max_active`` 。
> +``@name`` 是wq的名称，如果有的话，也用作救援线程的名称。
> +
> +一个wq不再管理执行资源，而是作为前进进度保证、刷新(flush)和
> +工作项属性的域。 ``@flags`` 和 ``@max_active`` 控制着工作
> +项如何被分配执行资源、安排和执行。
> +
> +
> +``flags``
> +---------
> +
> +``WQ_UNBOUND``
> +  排队到非绑定wq的工作项由特殊的工作者池提供服务，这些工作者不
> +  绑定在任何特定的CPU上。这使得wq表现得像一个简单的执行环境提
> +  供者，没有并发管理。非绑定工作者池试图尽快开始执行工作项。非
> +  绑定的wq牺牲了局部性，但在以下情况下是有用的。
> +
> +  * 预计并发水平要求会有很大的波动，使用绑定的wq最终可能会在不
> +    同的CPU上产生大量大部分未使用的工作者，因为发起线程在不同
> +    的CPU上跳转。
> +
> +  * 长期运行的CPU密集型工作负载，可以由系统调度器更好地管理。
> +
> +``WQ_FREEZABLE``
> +  一个可冻结的wq参与了系统暂停操作的冻结阶段。wq上的工作项被
> +  排空，在解冻之前没有新的工作项开始执行。
> +
> +``WQ_MEM_RECLAIM``
> +  所有可能在内存回收路径中使用的wq都必须设置这个标志。无论内
> +  存压力如何，wq都能保证至少有一个执行上下文。
> +
> +``WQ_HIGHPRI``
> +  高优先级wq的工作项目被排到目标cpu的高优先级工作者池中。高
> +  优先级的工作者池由具有较高级别的工作者线程提供服务。
> +
> +  请注意，普通工作者池和高优先级工作者池之间并不相互影响。他
> +  们各自维护其独立的工作者池，并在其工作者之间实现并发管理。
> +
> +``WQ_CPU_INTENSIVE``
> +  CPU密集型wq的工作项对并发水平没有贡献。换句话说，可运行的
> +  CPU密集型工作项不会阻止同一工作者池中的其他工作项开始执行。
> +  这对于那些预计会占用CPU周期的绑定工作项很有用，这样它们的
> +  执行就会受到系统调度器的监管。
> +
> +  尽管CPU密集型工作项不会对并发水平做出贡献，但它们的执行开
> +  始仍然受到并发管理的管制，可运行的非CPU密集型工作项会延迟
> +  CPU密集型工作项的执行。
> +
> +  这个标志对于未绑定的wq来说是没有意义的。
> +
> +请注意，标志 ``WQ_NON_REENTRANT`` 不再存在，因为现在所有的工作
> +队列都是不可逆的——任何工作项都保证在任何时间内最多被整个系统的一
> +个工作者执行。
> +
> +
> +``max_active``
> +--------------
> +
> +``@max_active`` 决定了每个CPU可以分配给wq的工作项的最大执行上
> +下文数量。例如，如果 ``@max_active为16`` ，每个CPU最多可以同
> +时执行16个wq的工作项。
> +
> +目前，对于一个绑定的wq， ``@max_active`` 的最大限制是512，当指
> +定为0时使用的默认值是256。对于非绑定的wq，其限制是512和
> +4 * ``num_possible_cpus()`` 中的较高值。这些值被选得足够高，所
> +以它们不是限制性因素，同时会在失控情况下提供保护。
> +
> +一个wq的活动工作项的数量通常由wq的用户来调节，更具体地说，是由用
> +户在同一时间可以排列多少个工作项来调节。除非有特定的需求来控制活动
> +工作项的数量，否则建议指定 为"0"。
> +
> +一些用户依赖于ST wq的严格执行顺序。 ``@max_active`` 为1和 ``WQ_UNBOUND``
> +的组合用来实现这种行为。这种wq上的工作项目总是被排到未绑定的工作池
> +中，并且在任何时候都只有一个工作项目处于活动状态，从而实现与ST wq相
> +同的排序属性。
> +
> +在目前的实现中，上述配置只保证了特定NUMA节点内的ST行为。相反，
> +``alloc_ordered_queue()`` 应该被用来实现全系统的ST行为。
> +
> +
> +执行场景示例
> +============
> +
> +下面的示例执行场景试图说明cmwq在不同配置下的行为。
> +
> + 工作项w0、w1、w2被排到同一个CPU上的一个绑定的wq q0上。w0
> + 消耗CPU 5ms，然后睡眠10ms，然后在完成之前再次消耗CPU 5ms。
> +
> +忽略所有其他的任务、工作和处理开销，并假设简单的FIFO调度，
> +下面是一个高度简化的原始wq的可能事件序列的版本。::
> +
> + TIME IN MSECS	EVENT
> + 0		w0 starts and burns CPU
> + 5		w0 sleeps
> + 15		w0 wakes up and burns CPU
> + 20		w0 finishes
> + 20		w1 starts and burns CPU
> + 25		w1 sleeps
> + 35		w1 wakes up and finishes
> + 35		w2 starts and burns CPU
> + 40		w2 sleeps
> + 50		w2 wakes up and finishes
> +
> +And with cmwq with ``@max_active`` >= 3, ::
> +
> + TIME IN MSECS	EVENT
> + 0		w0 starts and burns CPU
> + 5		w0 sleeps
> + 5		w1 starts and burns CPU
> + 10		w1 sleeps
> + 10		w2 starts and burns CPU
> + 15		w2 sleeps
> + 15		w0 wakes up and burns CPU
> + 20		w0 finishes
> + 20		w1 wakes up and finishes
> + 25		w2 wakes up and finishes
> +
> +如果 ``@max_active`` == 2, ::
> +
> + TIME IN MSECS	EVENT
> + 0		w0 starts and burns CPU
> + 5		w0 sleeps
> + 5		w1 starts and burns CPU
> + 10		w1 sleeps
> + 15		w0 wakes up and burns CPU
> + 20		w0 finishes
> + 20		w1 wakes up and finishes
> + 20		w2 starts and burns CPU
> + 25		w2 sleeps
> + 35		w2 wakes up and finishes
> +
> +现在，我们假设w1和w2被排到了不同的wq q1上，这个wq q1
> +有 ``WQ_CPU_INTENSIVE`` 设置::
> +
> + TIME IN MSECS	EVENT
> + 0		w0 starts and burns CPU
> + 5		w0 sleeps
> + 5		w1 and w2 start and burn CPU
> + 10		w1 sleeps
> + 15		w2 sleeps
> + 15		w0 wakes up and burns CPU
> + 20		w0 finishes
> + 20		w1 wakes up and finishes
> + 25		w2 wakes up and finishes
> +
> +
> +指南
> +====
> +
> +* 如果一个wq可能处理在内存回收期间使用的工作项目，请不
> +  要忘记使用 ``WQ_MEM_RECLAIM`` 。每个设置了
> +  ``WQ_MEM_RECLAIM`` 的wq都有一个为其保留的执行环境。
> +  如果在内存回收过程中使用的多个工作项之间存在依赖关系，
> +  它们应该被排在不同的wq中，每个wq都有 ``WQ_MEM_RECLAIM`` 。
> +
> +* 除非需要严格排序，否则没有必要使用ST wq。
> +
> +* 除非有特殊需要，建议使用0作为@max_active。在大多数使用情
> +  况下，并发水平通常保持在默认限制之下。
> +
> +* 一个wq作为前进进度保证（WQ_MEM_RECLAIM，冲洗（flush）和工
> +  作项属性的域。不涉及内存回收的工作项，不需要作为工作项组的一
> +  部分被刷新，也不需要任何特殊属性，可以使用系统中的一个wq。使
> +  用专用wq和系统wq在执行特性上没有区别。
> +
> +* 除非工作项预计会消耗大量的CPU周期，否则使用绑定的wq通常是有
> +  益的，因为wq操作和工作项执行中的定位水平提高了。
> +
> +
> +调试
> +====
> +
> +因为工作函数是由通用的工作者线程执行的，所以需要一些手段来揭示一些行为不端的工作队列用户。
> +
> +工作者线程在进程列表中显示为: ::
> +
> +  root      5671  0.0  0.0      0     0 ?        S    12:07   0:00 [kworker/0:1]
> +  root      5672  0.0  0.0      0     0 ?        S    12:07   0:00 [kworker/1:2]
> +  root      5673  0.0  0.0      0     0 ?        S    12:12   0:00 [kworker/0:0]
> +  root      5674  0.0  0.0      0     0 ?        S    12:13   0:00 [kworker/1:0]
> +
> +如果kworkers失控了（使用了太多的cpu），有两类可能的问题:
> +
> +	1. 正在迅速调度的事情
> +	2. 一个消耗大量cpu周期的工作项。
> +
> +第一个可以用追踪的方式进行跟踪: ::
> +
> +	$ echo workqueue:workqueue_queue_work > /sys/kernel/debug/tracing/set_event
> +	$ cat /sys/kernel/debug/tracing/trace_pipe > out.txt
> +	(wait a few secs)
> +	^C
> +
> +如果有什么东西在工作队列上忙着做循环，它就会主导输出，可以用工作项函数确定违规者。
> +
> +对于第二类问题，应该可以只检查违规工作者线程的堆栈跟踪。 ::
> +
> +	$ cat /proc/THE_OFFENDING_KWORKER/stack
> +
> +工作项函数在堆栈追踪中应该是微不足道的。
> +
> +
> +内核内联文档参考
> +================
> +
> +.. kernel-doc:: include/linux/workqueue.h
> +
> +.. kernel-doc:: kernel/workqueue.c
> 
