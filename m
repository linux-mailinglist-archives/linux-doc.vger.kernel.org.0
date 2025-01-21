Return-Path: <linux-doc+bounces-35758-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE65A17641
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 04:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AA2416A3B6
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 03:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294962745C;
	Tue, 21 Jan 2025 03:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="WUZ1WrGx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-m3279.qiye.163.com (mail-m3279.qiye.163.com [220.197.32.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AD926281
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 03:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737430290; cv=none; b=bE6CdeJAMnolxerZG6NTZVPCWzsYztyXPsneSTZwsg7utf5stvOYV53Z4Ti2xDXKq854TW3WWv/hJnCd6qLE+03fUn7OEL88ZEc0rityS5Gbnw+/Mc4hOqB6eZqxP+CwVItSgaUlh256oHkZ6mzGWYNOpjaNZ43hoJ0YvLmjgUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737430290; c=relaxed/simple;
	bh=Ez0fqdYMHckfKijuPzuSxPDX/eHYUrRefRRW8YkC/nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFaekbuFTuhymXEy72znM4F0PMN3AcZ6qmdwHolYFu5+smQqB9baPhJxkGA9PCqM4WijePk6T6sSM3DHtwpQM1WNvLMDmsRwMobEW5fxNZgWHTtLzcLCArxgsBLcCF4KQ5BOi12MSL6QpiW+UwDVpGgc5/YcBf8sTIcpfcoHNkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=WUZ1WrGx; arc=none smtp.client-ip=220.197.32.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Received: from [192.168.5.122] (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 940ad84e;
	Tue, 21 Jan 2025 11:26:14 +0800 (GMT+08:00)
Message-ID: <65d276e8-6a16-4ea0-b968-3faff6f73fac@cqsoftware.com.cn>
Date: Tue, 21 Jan 2025 11:26:15 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: zhangwei@cqsoftware.com.cn
Subject: Re: [PATCH] docs/zh_CN: Add self-protection index Chinese translation
To: =?UTF-8?B?5q+b546J6LSk?= <maoyuxian@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
References: <20250120101350.198697-1-zhangwei@cqsoftware.com.cn>
 <6f2427b5-06c4-4cda-8022-25a80946817b@cqsoftware.com.cn>
From: =?UTF-8?B?5byg5beN?= <zhangwei@cqsoftware.com.cn>
In-Reply-To: <6f2427b5-06c4-4cda-8022-25a80946817b@cqsoftware.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGElOVkhCHUoZSElMSRlDGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTEpVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a9486e57cdc03abkunm940ad84e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6DRw6TjILLDQuHEsDKjk5
	LCsKFD1VSlVKTEhMT0lCQkxOSUJNVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUpOTExKNwY+
DKIM-Signature:a=rsa-sha256;
	b=WUZ1WrGx0jg8iERoU6je0ULzjMILzGSb7vAsuG7n4sdNpl4RZdFv4zVM6VCusZI/yqQy/lF9e6AUp6uF9fPm2p2IQqpMfaJ0bzm8AR9MSDzmmGUa7Itg01dbgobkQowgeEODgTG8GwRckg1TSter70D0xC9+tUFhdAM3bWlPpHw=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=fo1Q2e6hMUAD2IH5Eh4L7nlMZvWrRK/4FV6fVLls35U=;
	h=date:mime-version:subject:message-id:from;


在 2025/1/21 11:20, 毛玉贤 写道:
>
> 在 2025/1/20 18:13, zhangwei 写道:
>> Translate lwn/Documentation/security/self-protection.rst into Chinese.
>>
>> Update the translation through commit b080e52110ea
>> ("docs: update self-protection __ro_after_init status")
>>
>> Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
>> ---
>>
>> Patche are dependent on cover.1737354981.git.zhaoshuo@cqsoftware.com.cn
>>
>>   .../translations/zh_CN/security/index.rst     |   2 +-
>>   .../zh_CN/security/self-protection.rst        | 279 ++++++++++++++++++
>>   2 files changed, 280 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> Documentation/translations/zh_CN/security/self-protection.rst
>>
>> diff --git a/Documentation/translations/zh_CN/security/index.rst 
>> b/Documentation/translations/zh_CN/security/index.rst
>> index 0aacecabf0c0..9a6345dd90b8 100644
>> --- a/Documentation/translations/zh_CN/security/index.rst
>> +++ b/Documentation/translations/zh_CN/security/index.rst
>> @@ -18,6 +18,7 @@
>>      credentials
>>      lsm
>>      sak
>> +   self-protection
>>      siphash
>>      tpm/index
>>      digsig
>> @@ -29,6 +30,5 @@ TODOLIST:
>>   * keys/index
>>   * lsm-development
>>   * SCTP
>> -* self-protection
>>   * secrets/index
>>   * ipe
>> diff --git 
>> a/Documentation/translations/zh_CN/security/self-protection.rst 
>> b/Documentation/translations/zh_CN/security/self-protection.rst
>> new file mode 100644
>> index 000000000000..283153fd781d
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/security/self-protection.rst
>> @@ -0,0 +1,279 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +:Original: Documentation/security/self-protection.rst
>> +
>> +:翻译:
>> +
>> + 张巍 zhangwei <zhangwei@cqsoftware.com.cn>
>> +
>> +============
>> +内核自我保护
>> +============
>> +
>> +内核自我保护是指在Linux内核中设计与实现的各种系统与结构
>> +以防止内核本身的安全漏洞问题。它涵盖了广泛问题，包括去除
>> +整个类的漏洞，阻止安全漏洞利用方法，以及主动检测攻击尝
>> +试。并非所有的话题都在本文中涉及，但它应该为了解内核自我
>> +保护提供一个合理的起点，并解答常见的问题。（当然，欢迎提
>> +交补丁！）
>> +
>> +在最坏的情况下，我们假设一个非特权的本地攻击者对内核内存
>> +有任意读写访问权限。虽然在许多情况下，漏洞被利用时并不会
>> +提供此级别的访问权限，但如果我们能防御最坏情况，也能应对
>> +权限较低的攻击。一个更高的标准，且需要牢记的是保护内核免
>> +受具有特权的本地攻击者的攻击，因为root用户可以有更多权限。
>> +（尤其是当他们能够加载任意内核模块时）
>> +
>> +成功的自我保护的目标是：有效、默认开启、不需要开发者主动
>> +选择、没有性能影响、不妨碍内核调试、并且没有测试。虽然很
>> +难满足所有的这些目标，但明确提到这些目标非常重要，因为这
>> +些方面需要被探索、解决或接受。
>> +
>> +==========
>> +攻击面缩减
>> +==========
>> +
>> +防止安全漏洞最基本的防御方式是减少可以被用来重定向执行的
>> +内核区域。这包括限制用户公开使用的API、使内核API更难被错
>> +误使用、最小化可写内核内存区域等。
>> +
>> +严格的内核内存权限
>> +-------------------
>> +
>> +当所有内核内存都是可写的，攻击者可以轻松地重定向执行流。
>> +为了减少这种攻击目标的可用性，内核需要更严格的权限集来
>> +保护其内存。
>> +
>> +可执行代码和只读数据必须不可写
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +任何具有可执行内存的区域必须不可写，显然这也包括内核文本
>> +本身。我们还必须考虑其他地方：内核模块、JIT内存等，（在
>> +某些情况下，为了支持像指令替代、断点、kprobes等功能，这些
>> +区域会暂时被设置为可写。如果这些功能必须存在于内核中，它
>> +们的实现方式是：在更新期间将内存临时设置可写，然后再恢复
>> +为原始权限。）
>> +
>> +为了支持这一点，CONFIG_STRICT_KERNEL_RWX 和
>> +CONFIG_STRICT_MODULE_RWX 的设计旨在确保代码不可写，数据不
>> +可执行，以及只读数据既不可写也不可执行。
>> +
>> +大多数架构默认支持这些选项，且用户无法选择。对于一些像arm
>> +这种希望能够选择这些选项的架构，可以在架构Kconfig中选择
>> +ARCH_OPTIONAL_KERNEL_RWX以启用Kconfig提示。
>> +CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT决定在启用
>> +ARCH_OPTIONAL_KERNEL_RWX时的默认设置。
>> +
>> +函数指针和敏感变量必须不可写
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +内核内存中有大量的函数指针，这些指针被内核查找并用于继续执行
>> +（例如，描述符/向量表、文件/网络等操作结构等）。这些变量的数
>> +量必须减少到最低限度
>> +
>> +许多像这样的变量可以通过设置为"const"来实现只读，从而使它们
>> +存放在内核的.rodata段而非.data段，从而获得内核严格内存权限的
>> +保护。
>> +
>> +对于在_init是仅初始化一次的变量，可以使用_ro_after_init属性
>> +进行标记。
>> +
>> +剩下的变量通常是那些更新频率较低的（例如GDT）。这些变量需要另
>> +一个机制（类似于上述提到的对内核代码所做的临时例外），以便在
>> +其余生命周期内保持只读状态。（例如，在进行更新时，只有执行
>> +更新的CPU线程会被授予对内存的不可中断写入访问权限。）
>> +
>> +将内核内存与用户空间内存分隔开
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +内核绝对不可以执行用户空间内存，同时，内核也不得在没有明确预
>> +期的情况下访问用户内存空间。这些规则可以通过一些硬件限制来支
>> +持（如x86的SMEP/SMAP，ARM的PXN/PAN）或通过仿真（如ARM的内存
>> +域）来强制执行。通过这种方式阻止用户空间内存的访问，攻击者就
>> +无法将执行和数据解析转移到易于控制的用户空间内存，从而迫使攻
>> +击完全在内核中进行。
>> +
>> +减少对系统调用的访问
>> +--------------------
>> +
>> +对于64位系统，一种消除许多系统调用最简单的方法是构建时不启用
>> +CONFIG_CONPAT。然而，这种情况通常不可行。
>> +
>> +“seccomp”系统为用户空间提供了一种可选功能，提供了一种减少可供
>> +运行中进程使用内核入口点数量的方法。这限制了可以访问内核代码
>> +的范围，可能降低了某个特定漏洞被攻击者利用的可能性。
>> +
>> +一个改进的方向是创建有效的方法，仅允许受信任的进程访问例如兼
>> +容模式、用户命名空间、BPF创建和性能分析等功能。这将把内核入口
>> +点范围限制在通常可以被非特权用户空间进程访问的较常见集合中
>> +
>> +限制对内核模块的访问
>> +--------------------
>> +
>> +内核绝不应允许非特权用户加载特定的内核模块，因为这可能为攻击者
>> +提供一个意外扩展的可用攻击面的方法。（通过已预定义子系统按需加
>> +载模块，如MODULE_ALIAS_*，被认为是“预期的”，但即便如此，也应对
>> +这些情况给予更多的关注。）例如，通过非特权的套接字API加载文件
>> +系统模块是没有意义的：只有root用户或物理本地用户应该触发文件系
>> +统模块的加载。（在某些情况下，这甚至可能存在争议。）
>> +
>> +为了防止特权用户的攻击，系统可能需要完全禁止模块加载（例如，通
>> +过单体内核构建或modules_disabled sysctl），或者使用签名模块（例
>> +如，CONFIG_MODULE_SIG_FORCE或通过LoadPin保护的dm-crypt），以防
>> +止root用户通过模块加载器加载任意内核代码。
>> +
>> +内存完整性
>> +----------
>> +
>> +内核中有许多内存结构在攻击过程中被定期泛滥用以获取执行控制，迄今
>> +为止，最常见的是堆栈缓冲区溢出，在这种攻击中，堆栈上存储的返回地
>> +址被覆盖。除此之外，还有许多其他类型的攻击，防护措施也应运而生。
>> +
>> +堆栈缓冲区溢出
>> +--------------
>> +
>> +经典的堆栈缓冲区溢出攻击是指超出栈上分配的变量预期大小，从而将一
>> +个受控值写入栈帧的返回地址。最常见的防御措施是堆栈保护
>> +（CONFIG_STACKPROTECTOR），它在函数返回前会验证栈上的“stack canary”。
>> +其他防御措施还包括影子堆栈等。
>> +
>> +堆栈深度溢出
>> +------------
>> +
>> +一个不太容易被理解的攻击方式是利用bug触发内核通过深度函数调用或
>> +大的堆栈分配来消耗堆栈内存。通过这种攻击，攻击者可以将数据写入内
>> +核预分配堆栈空间之外的敏感结构。为了更好的防护这种攻击，必须进行
>> +两项重要的更改：将敏感的线程信息结构转移到其他地方，并在堆栈底部
>> +添加一个故障内存洞，以捕获这些溢出
>> +
>> +栈内存完整性
>> +------------
>> +
>> +用于跟踪堆空闲列表的结构可以在分配和释放时进行完整性检查，以确保它
>> +们不会被用来操作其它内存区域。
>> +
>> +计算器完整性
>> +------------
>> +
>> +内核中的许多地方使用原子计数器来跟踪对象引用或执行类似的生命周期管
>> +理。当这些计数器可能发生溢出时（无论是上溢还是下溢），这通常会暴露
>> +出使用后释放（use-after-free）漏洞。通过捕捉原子计数器溢出，这类漏
>> +洞就可以消失。
>> +
>> +大小计算溢出检测
>> +----------------
>> +
>> +与计算器溢出类似，整数溢出（通常是大小计算）需要在运行时进行检测，
>> +以防止这类在传统上会导致能够写入内核缓冲区末尾之外的漏洞。
>> +
>> +概率性防御
>> +----------
>> +
>> +尽管许多防御措施可以被认定是确定的（例如，只读内存不能写入），但
>> +有些确保措施仅提供统计防御，即攻击者必须收集足够的关于运行系统的
>> +信息才能突破防御。尽管这些防御并不完美，但它们确实提供了有意义的
>> +保护。
>> +
>> +栈保护、迷惑技术和其他秘密
>> +--------------------------
>> +
>> +值得注意的是，像之前讨论的栈保护这样的技术，从技术上来说是统计性防
>> +御，因为它们依赖于一个秘密值，而这样的值可能会通过信息泄露漏洞而被
>> +发现。
>> +
>> +对于想JIT（及时翻译器）这样的情况，其中可执行内容可能部分由用户空间
>> +控制，也需要类似的秘密之来迷惑。
>> +
>> +至关重要的是，所使用的秘密值必须是独立的（例如，每个栈使用不同的栈
>> +保护值），并且具有高熵（例如，随机数生成器（RNG）是否正常工作？），
>> +以最大限度地提高其成功率。
>> +
>> +内核地址空间布局随机化（KASLR）
>> +-------------------------------
>> +
>> +由于内核内存的位置几乎总是攻击成功的关键因素，因此使内核内存位置变
>> +得非确定性会增加攻击的难度。（请注意，这反过来提高了信息泄露的价
>> +值，因为泄露的信息可以用来发现目标内存位置。）
>> +
>> +文本和模块基址
>> +--------------
>> +
>> +通过在启动时重新设定内核的物理基地址和虚拟基地址
>> +（CONFIG_RANDOMIZE_BASE）,那些需要利用内核代码的攻击将会受阻。此外
>> +通过偏移模块加载基地址，意味着即使系统每次启动时按相同顺序加载同一
>> +组模块，这些模块也不会与内核文本的其余部分公用一个基地址。
>> +
>> +堆栈基地址
>> +----------
>> +
>> +如果进程之间内核堆栈的基地址不相同，甚至在不同系统调用之间也不相同，
>> +那么栈上或超出栈的目标位置就会变得更加难以确定。
>> +
>> +动态内存基址
>> +------------
>> +
>> +很多内核的动态内存（例如kmalloc，vmalloc等）由于早期启动初始化的顺
>> +序，最终布局是相对确定的。如果这些区域的基地址在启动之间不相同，攻
>> +击者就无法轻易定位它们，必须依赖于针对该区域的信息泄露才能成功。
>> +
>> +结构布局
>> +--------
>> +
>> +通过在每次构建时对敏感结构的布局进行随机化处理，攻击这必须将攻击调
>> +节到已知的内核版本，或者泄露足够的内核内存来确定结构布局，然后才能
>> +对其进行操作。
>> +
>> +防止信息泄露
>> +------------
>> +
>> +由于敏感结构的位置是攻击的主要目标，因此防止内核内存地址和内核内存
>> +内容泄露非常重要（因为它们可能包含内核地址或者其他敏感数据，例如
>> +栈保护值）。
>> +
>> +内核地址
>> +--------
>> +
>> +将内核地址打印到用户空间会泄露有关内核内存布局的敏感信息。在使用任
>> +何打印符号打印原始地址时，目前%px,%p[ad]（和在某些情况下的%p[sSb]）
>> +时。使用这些格式符写入的文件需要限制为只有特权进程可读。
>> +
>> +在4.14及以前的内核版本中，使用%p格式符打印的是原始地址。从4.15-rcl
>> +版本开始，使用%p格式符打印的地址会在打印前进行哈希处理。
>> +
>> +[*]如果启用KALLSYMS并且符号查找失败，则打印原始地址；如果没有启用
>> +KALLSYSM，则会直接打印原始地址。
>> +
>> +唯一标识符
>> +----------
>> +
>> +内核内存地址绝不可能用作向用户空间公开的标识符。相反，应该使用原子
>> +计数器，IDR（ID映射表）或类似的唯一标识符。
>> +
>> +内存初始化
>> +----------
>> +
>> +复制到用户空间的内存必须始终被完全初始化，如果没有显式地使用memset()
>> +函数进行初始化，那就需要修改编译器，确保清除结构中的空洞。
>> +
>> +内存清除
>> +--------
>> +
>> +在释放内存时，最好对内存内容进行清除处理，以防止攻击者重用内存中以前
>> +的内容。例如，在系统调用返回时清除堆栈（CONFIG_GCC_PLUGIN_STACKLEAK）,
>> +在释放堆内容是清除其内容。这有助于防止许多未初始化变量攻击、堆栈内容
>> +泄露、堆内容泄露以及使用后释放攻击（user-after-free）。
>> +
>> +目标追踪
>> +--------
>> +
>> +为了帮助消除导致内核地址被写入用户空间的各种错误，需要跟踪写入的目标。
>> +如果缓冲区的目标是用户空间（例如，基于seq_file的/proc文件），则应该自
>> +动审查敏感值。
>> +
>> +
>> +
>> +
>> +
>> +
>> +
>> +
>
> *Please remove the unnecessary blank lines.*
>
> *BTW, *
>
> *The patch contains whitespace characters,**please modify them before 
> submitting the patch.*
> Thanks,
> Yuxian
>
Ok, I'll fix them and resubmit

Thanks,

Zhangwei

>
>
>

