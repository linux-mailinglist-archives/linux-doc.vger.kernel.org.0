Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C789359BD7
	for <lists+linux-doc@lfdr.de>; Fri,  9 Apr 2021 12:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbhDIKVM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Apr 2021 06:21:12 -0400
Received: from [43.250.32.171] ([43.250.32.171]:61265 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S234282AbhDIKTm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 06:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=ATOCRfEFQloTejRwJM4wB7gJv17hL+md9ONjn
        PtYr1M=; b=O0RtPINqdnMTq8KciOxttB4CqENdiJbQbYH4JtzyiEwl7ueJ20qO7
        JhKIt4ul+oRyH3qahr4oKSpzmH97Jg94lfnL5Sbxa3EUU4QAyAvFTtsQNTwh6Td6
        U3332T4yh0wMPV7Z3nK78LFV91yxGpd1RIgOsVThvr2ZJzwbjFwz58=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnWdAhKnBg0vFTAA--.57842S2;
        Fri, 09 Apr 2021 18:19:15 +0800 (CST)
Date:   Fri, 9 Apr 2021 18:19:13 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 03/11] docs/zh_CN: add core-api/irq/irq-domain.rst
 translation
Message-ID: <20210409101912.GB22786@bobwxc.top>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-4-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210409091013.2493988-4-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDnWdAhKnBg0vFTAA--.57842S2
X-Coremail-Antispam: 1UD129KBjvAXoW3uryUZFWUJr43Kw4fJF1DWrg_yoW8GrW7Co
        WSk3s8CrWrAr45J348tFWDG3yUurs5Grs7A3Z7Wr12yr1jkwnYka17Ja47JFs3A3y5Za15
        J3W8u34F9FW7Zanxn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5_7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262
        IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx2
        6F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWx
        Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
        80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
        I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
        k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jHpBfUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 09, 2021 at 05:10:05PM +0800, Yanteng Si wrote:
> This patch translates Documentation/core-api/irq/irq-domain.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/irq/irq-domain.rst         | 227 ++++++++++++++++++
>  1 file changed, 227 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> 
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> new file mode 100644
> index 000000000000..03d3b7953e08
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> @@ -0,0 +1,227 @@
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../../core-api/irq/irq-domain`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_irq-domain.rst:
> +
> +
> +===============================================
> +irq_domain 中断号映射库
> +===============================================
> +
> +目前Linux内核的设计使用了一个巨大的数字空间，每个独立的IRQ源都被分配了一个不
> +同的数字。
> +当只有一个中断控制器时，这很简单，但在有多个中断控制器的系统中，内核必须确保每
> +个中断控制器都能得到非重复的Linux IRQ号（数字）分配。
> +
> +注册为唯一的irqchips的中断控制器编号呈现出上升的趋势：例如GPIO控制器等不同
> +种类的子驱动程序通过将其中断处理程序建模为irqchips，即实际上是级联中断控制器，
> +避免了重新实现与IRQ核心系统相同的回调机制。
> +
> +在这里，中断号与硬件中断号离散了所有种类的对应关系：而在过去，IRQ号可以选择，
> +使它们与硬件IRQ线进入根中断控制器（即实际向CPU发射中断线的组件）相匹配，现
> +在这个编号仅仅是一个数字。
> +
> +出于这个原因，我们需要一种机制将控制器本地中断号（即硬件irq编号）与Linux IRQ
> +号分开。
> +
> +irq_alloc_desc*() 和 irq_free_desc*() API 提供了对irq号的分配，但它们不
> +提供任何对控制器本地IRQ(hwirq)号到Linux IRQ号空间的反向映射的支持。
> +
> +irq_domain 库在 irq_alloc_desc*() API 的基础上增加了 hwirq 和 IRQ 号码
> +之间的映射。 相比于中断控制器驱动开放编码自己的反向映射方案，我们更喜欢用
> +irq_domain来管理映射。
> +
> +irq_domain还实现了从抽象的irq_fwspec结构体到hwirq号的转换（到目前为止是
> +Device Tree和ACPI GSI），并且可以很容易地扩展以支持其它IRQ拓扑数据源。
> +
> +irq_domain的用法
> +================
> +
> +中断控制器驱动程序通过以下方式创建并注册一个irq_domain。调用
> +irq_domain_add_*() 或 irq_domain_create_*()函数之一（每个映射方法都有不
> +同的分配器函数，后面会详细介绍）。 函数成功后会返回一个指向irq_domain的指针。
> +调用者必须向分配器函数提供一个irq_domain_ops结构体。
> +
> +在大多数情况下，irq_domain在开始时是空的，没有任何hwirq和IRQ号之间的映射。
> +通过调用irq_create_mapping()将映射添加到irq_domain中，该函数接受
> +irq_domain和一个hwirq号作为参数。 如果hwirq的映射还不存在，那么它将分配
> +一个新的Linux irq_desc，将其与hwirq关联起来，并调用.map()回调，这样驱动
> +程序就可以执行任何必要的硬件设置。
> +
> +当接收到一个中断时，应该使用irq_find_mapping()函数从hwirq号中找到
> +Linux IRQ号。
> +
> +在调用irq_find_mapping()之前，至少要调用一次irq_create_mapping()函数，
> +以免描述符不能被分配。
> +
> +如果驱动程序有Linux的IRQ号或irq_data指针，并且需要知道相关的hwirq号（比
> +如在irq_chip回调中），那么可以直接从irq_data->hwirq中获得。
> +
> +irq_domain映射的类型
> +============================
> +
> +从hwirq到Linux irq的反向映射有几种机制，每种机制使用不同的分配函数。应该
> +使用哪种反向映射类型取决于用例。 下面介绍每一种反向映射类型：
> +
> +线性映射
> +----------
> +
> +::
> +
> +	irq_domain_add_linear()
> +	irq_domain_create_linear()
> +
> +线性反向映射维护了一个固定大小的表，该表以hwirq号为索引。 当一个hwirq被映射
> +时，会给hwirq分配一个irq_desc，并将irq号存储在表中。
> +
> +当最大的hwirq号固定且数量相对较少时，线性图是一个很好的选择（~<256）。 这种
> +映射的优点是固定时间查找IRQ号，而且irq_descs只分配给在用的IRQ。 缺点是该表
> +必须尽可能大的hwirq号。
> +
> +irq_domain_add_linear()和irq_domain_create_linear()在功能上是等价的，
> +除了第一个参数不同--前者接受一个Open Firmware特定的 'struct device_node' 而
> +后者接受一个更通用的抽象 'struct fwnode_handle' 。
> +
> +大多数驱动应该使用线性映射
> +
> +树状映射
> +----------
> +
> +::
> +
> +	irq_domain_add_tree()
> +	irq_domain_create_tree()
> +
> +irq_domain维护着从hwirq号到Linux IRQ的radix的树状映射。 当一个hwirq被映射时，
> +一个irq_desc被分配，hwirq被用作radix树的查找键。
> +
> +如果hwirq号可以非常大，树状映射是一个很好的选择，因为它不需要分配一个和最大hwirq
> +号一样大的表。 缺点是，hwirq到IRQ号的查找取决于表中有多少条目。
> +
> +irq_domain_add_tree()和irq_domain_create_tree()在功能上是等价的，除了第一
> +个参数不同——前者接受一个Open Firmware特定的 'struct device_node' ，而后者接受
> +一个更通用的抽象 'struct fwnode_handle' 。
> +
> +很少有驱动应该需要这个映射。
> +
> +无映射
> +--------
> +
> +::
> +
> +	irq_domain_add_nomap()
> +
> +当硬件中的hwirq号是可编程的时候，就可以采用无映射类型。 在这种情况下，最好将
> +Linux IRQ号编入硬件本身，这样就不需要映射了。 调用irq_create_direct_mapping()
> +会分配一个Linux IRQ号，并调用.map()回调，这样驱动就可以将Linux IRQ号编入硬件中。
> +
> +大多数驱动程序不能使用这个映射。
> +
> +传统映射类型
> +--------------
> +
> +::
> +
> +	irq_domain_add_simple()
> +	irq_domain_add_legacy()
> +	irq_domain_add_legacy_isa()
> +	irq_domain_create_simple()
> +	irq_domain_create_legacy()
> +
> +传统映射是已经为 hwirqs 分配了一系列 irq_descs 的驱动程序的特殊情况。 当驱动程
> +序不能立即转换为使用线性映射时，就会使用它。 例如，许多嵌入式系统板卡支持文件使用
> +一组用于IRQ号的定义（#define），这些定义被传递给struct设备注册。 在这种情况下，
> +不能动态分配Linux IRQ号，应该使用传统映射。
> +
> +传统映射假设已经为控制器分配了一个连续的IRQ号范围，并且可以通过向hwirq号添加一
> +个固定的偏移来计算IRQ号，反之亦然。 缺点是需要中断控制器管理IRQ分配，并且需要为每
> +个hwirq分配一个irq_desc，即使它没有被使用。
> +
> +只有在必须支持固定的IRQ映射时，才应使用传统映射。 例如，ISA控制器将使用传统映射来
> +映射Linux IRQ 0-15，这样现有的ISA驱动程序就能得到正确的IRQ号。
> +
> +大多数使用传统映射的用户应该使用irq_domain_add_simple()或
> +irq_domain_create_simple()，只有在系统提供IRQ范围时才会使用传统域，否则将使用
> +线性域映射。这个调用的语义是这样的：如果指定了一个IRQ范围，那么 描述符将被即时分配
> +给它，如果没有范围被分配，它将不会执行 irq_domain_add_linear() 或
> +irq_domain_create_linear()，这意味着 *no* irq 描述符将被分配。
> +
> +一个简单域的典型用例是，irqchip供应商同时支持动态和静态IRQ分配。
> +
> +为了避免最终出现使用线性域而没有描述符被分配的情况，确保使用简单域的驱动程序在任何
> +irq_find_mapping()之前调用irq_create_mapping()是非常重要的，因为后者实际上
> +将用于静态IRQ分配情况。
> +
> +irq_domain_add_simple()和irq_domain_create_simple()以及
> +irq_domain_add_legacy()和irq_domain_create_legacy()在功能上是等价的，只
> +是第一个参数不同--前者接受Open Firmware特定的 'struct device_node' ，而后者
> +接受一个更通用的抽象 'struct fwnode_handle' 。
> +
> +IRQ域层级结构
> +--------------------
> +
> +在某些架构上，可能有多个中断控制器参与将一个中断从设备传送到目标CPU。
> +让我们来看看x86平台上典型的中断传递路径吧
> +::
> +
> +  Device --> IOAPIC -> Interrupt remapping Controller -> Local APIC -> CPU
> +
> +涉及到的中断控制器有三个:
> +
> +1) IOAPIC 控制器
> +2) 中断重映射控制器
> +3) Local APIC 控制器
> +
> +为了支持这样的硬件拓扑结构，使软件架构与硬件架构相匹配，为每个中断控制器建立一
> +个irq_domain数据结构，并将这些irq_domain组织成层次结构。
> +
> +在建立irq_domain层次结构时，靠近设备的irq_domain为子域，靠近CPU的
> +irq_domain为父域。所以在上面的例子中，将建立如下的层次结构。
> +::
> +
> +	CPU Vector irq_domain (root irq_domain to manage CPU vectors)
> +		^
> +		|
> +	Interrupt Remapping irq_domain (manage irq_remapping entries)
> +		^
> +		|
> +	IOAPIC irq_domain (manage IOAPIC delivery entries/pins)
> +
> +使用irq_domain层次结构的主要接口有四个:
> +
> +1) irq_domain_alloc_irqs(): 分配IRQ描述符和与中断控制器相关的资源来传递这些中断。
> +2) irq_domain_free_irqs(): 释放IRQ描述符和与这些中断相关的中断控制器资源。
> +3) irq_domain_activate_irq(): 激活中断控制器硬件以传递中断。
> +4) irq_domain_deactivate_irq(): 停用中断控制器硬件，停止传递中断。
> +
> +为了支持irq_domain层次结构，需要做如下修改:
> +
> +1) 一个新的字段 'parent' 被添加到irq_domain结构中；它用于维护irq_domain的层次信息。
> +2) 一个新的字段 'parent_data' 被添加到irq_data结构中；它用于建立层次结构irq_data以
> +   匹配irq_domain层次结构。irq_data用于存储irq_domain指针和硬件irq号。
> +3) 新的回调被添加到irq_domain_ops结构中，以支持层次结构的irq_domain操作。
> +
> +在支持分层irq_domain和分层irq_data准备就绪后，为每个中断控制器建立一个irq_domain结
> +构，并为每个与IRQ相关联的irq_domain分配一个irq_data结构。现在我们可以再进一步支持堆
> +栈式(层次结构)的irq_chip。也就是说，一个irq_chip与层次结构中的每个irq_data相关联。
> +一个子irq_chip可以自己或通过与它的父irq_chip合作来实现一个所需的操作。
> +
> +通过堆栈式的irq_chip，中断控制器驱动只需要处理自己管理的硬件，在需要的时候可以向其父
> +irq_chip请求服务。所以我们可以实现更简洁的软件架构。
> +
> +为了让中断控制器驱动程序支持irq_domain层次结构，它需要做到以下几点:
> +
> +1) 实现 irq_domain_ops.alloc 和 irq_domain_ops.free
> +2) 可选择地实现 irq_domain_ops.activate 和 irq_domain_ops.deactivate.
> +3) 可选择地实现一个irq_chip来管理中断控制器硬件。
> +4) 不需要实现irq_domain_ops.map和irq_domain_ops.unmap，它们在层次结构
> +   irq_domain中是不用的。
> +
> +irq_domain层次结构绝不是x86特有的，大量用于支持其他架构，如ARM、ARM64等。
> +
> +调试功能
> +=========
> +
> +打开CONFIG_GENERIC_IRQ_DEBUGFS on.ping，可让IRQ子系统的大部分内部结构都在debugfs中暴露出来。

Please fix "on.ping".

> -- 
> 2.27.0

Thanks!

Wu X.C.

