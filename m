Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F180A3998BA
	for <lists+linux-doc@lfdr.de>; Thu,  3 Jun 2021 05:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhFCDxf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Jun 2021 23:53:35 -0400
Received: from mail-pj1-f42.google.com ([209.85.216.42]:55986 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhFCDxf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jun 2021 23:53:35 -0400
Received: by mail-pj1-f42.google.com with SMTP id k7so2840302pjf.5;
        Wed, 02 Jun 2021 20:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Zhv/kv60wLkKjOJjvzuebyPqY1fU6OnFnwgpEtB4rnI=;
        b=WH2Qt9oxBs6zf9jIElEgrFk8n6JOOahmJkAy76SiA217PFNT8tMj1KvXNTYIRN0MdJ
         bfDMO7sVQEMbXraVHtcg669m26pmtTcUfqloE6qRaXnQtdtZGwqB3VW/yPYejl4GYhkk
         1vqk3qr7FYnhJiqv0fx9vdpHBLFY4b2Mbnp9QZ/vgY3R7GJxm4NtymcUeJOJlP+Ln2rp
         fAD6+MtEZSAzQH0zL8CZXaWVoK1xkE9rEj5V+Cz51xwXW0Pgupy9J3YrnjTH9mivM9+J
         J2ankcxFPR8ys9RPnfUSJAZn0rtAHOn50qYqlGzR+myTdNcmaPgQMsyym20DVAyB1hMx
         1pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zhv/kv60wLkKjOJjvzuebyPqY1fU6OnFnwgpEtB4rnI=;
        b=Hiql2GqIy68vzPqqOZ+vucEyYLldy5z8L4KLYWy0IEHfamlYSd3c53/WbX9tPazuNt
         T3uhUjisjpUz4NThDVI3YF5oQKKA5GygYXL3AxWEeEnsDSSVAwPqP9i+L22RiudQF5Vu
         KY8hMb9M1OyM1d3XehYn07mLB7jfc7gVGJE3QmFYEkzeDi9Fy0vKVgWJhh/GNvjAay4C
         mxNkIkbmu6XbDllwRTW8YIF2jBXElZmLptZOzh7UKvqHOq/stOqEdISl4Lc6KdE1JzBv
         xoD54oDTWwvMF94SmmF5kSp1VhSeR/LOyxHcDdf+bi4A7bMxlqamlvcwvEGHlXQ1yRi9
         zkUQ==
X-Gm-Message-State: AOAM533UYbs+tcNp1R77aUD3/R6RY1jfdKdp1TCYUKmPpRf992+TsNXl
        loIICzSWwAp92hO1dDVZC9I=
X-Google-Smtp-Source: ABdhPJxd9Tid/CK1pOlw8A5qtR1f13v580cv+htGSfUz9pjIc46+Z5g6a2ewUMyUMdmgfQ9/+6MmCg==
X-Received: by 2002:a17:90a:bf15:: with SMTP id c21mr11681172pjs.206.1622692237404;
        Wed, 02 Jun 2021 20:50:37 -0700 (PDT)
Received: from [172.28.99.179] ([139.226.50.128])
        by smtp.gmail.com with ESMTPSA id f3sm799042pjo.3.2021.06.02.20.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 20:50:36 -0700 (PDT)
Subject: Re: [PATCH] [v2] docs/zh_CN: add translations in
 zh_CN/dev-tools/kasan
To:     Wan Jiabing <wanjiabing@vivo.com>, Alex Shi <alexs@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Wu XiangCheng <bobwxc@email.cn>,
        Fangrui Song <maskray@google.com>,
        Bernard Zhao <bernard@vivo.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        clang-built-linux@googlegroups.com
References: <1622638607-12314-1-git-send-email-wanjiabing@vivo.com>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <69008e54-003a-eeb5-75f8-96e03f37d2df@gmail.com>
Date:   Thu, 3 Jun 2021 11:50:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622638607-12314-1-git-send-email-wanjiabing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi Jiabing,

Thanks for translation! The contents are generally fine. 
I tried the patch with scripts/checkpatch.pl found there are lots errors

---
...
ERROR: DOS line endings
#552: FILE: Documentation/translations/zh_CN/dev-tools/kasan.rst:430:
+^M$

ERROR: trailing whitespace
#553: FILE: Documentation/translations/zh_CN/dev-tools/kasan.rst:431:
+.. _KUnit: https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html^M$

total: 432 errors, 1 warnings, 445 lines checked
---

and the lines in the patch are not aligned on 80 chars, (40 chars for Chinese,
since one Chinese char could take 2 positions. )


Thanks
Alex

On 2021/6/2 下午8:56, Wan Jiabing wrote:
> Add new zh translations
> * zh_CN/dev-tools/kasan.rst
> and link it to zh_CN/dev-tools/index.rst
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
> Changelog:
> v2:
> - Delete spaces surround with English words.
> ---
>  .../translations/zh_CN/dev-tools/index.rst         |   2 +-
>  .../translations/zh_CN/dev-tools/kasan.rst         | 431 +++++++++++++++++++++
>  2 files changed, 432 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/dev-tools/kasan.rst
> 
> diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst b/Documentation/translations/zh_CN/dev-tools/index.rst
> index fd73c47..e6c99f2 100644
> --- a/Documentation/translations/zh_CN/dev-tools/index.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/index.rst
> @@ -19,13 +19,13 @@
>     :maxdepth: 2
>  
>     gcov
> +   kasan
>  
>  Todolist:
>  
>   - coccinelle
>   - sparse
>   - kcov
> - - kasan
>   - ubsan
>   - kmemleak
>   - kcsan
> diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> new file mode 100644
> index 0000000..00add1d
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> @@ -0,0 +1,431 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/dev-tools/kasan.rst
> +:Translator: 万家兵 Wan Jiabing <wanjiabing@vivo.com>
> +
> +内核地址消毒剂(KASAN)
> +======================
> +
> +概述
> +----
> +
> +KernelAddressSANitizer(KASAN)是一种动态内存安全错误检测工具，
> +主要功能是检查内存越界访问和使用已释放内存的问题。KASAN有三种模式:
> +
> +1. 通用KASAN（与用户空间的ASan类似）
> +2. 基于软件标签的KASAN（与用户空间的HWASan类似）
> +3. 基于硬件标签的KASAN（基于硬件内存标签）
> +
> +由于通用KASAN的内存开销较大，通用KASAN主要用于调试。
> +基于软件标签的KASAN可用于dogfood测试，因为它具有较低的内存开销，
> +并允许将其用于实际工作量。
> +基于硬件标签的KASAN具有较低的内存和性能开销，因此可用于生产。
> +同时可用于检测现场内存问题或作为安全缓解措施。
> +
> +软件KASAN模式（#1和#2）使用编译时工具在每次内存访问之前插入有效性检查，
> +因此需要一个支持它的编译器版本。
> +
> +通用KASAN在GCC和Clang受支持。GCC需要8.3.0或更高版本。任何受支持的
> +Clang版本都是兼容的，但从Clang 11才开始支持检测全局变量的越界访问。
> +
> +基于软件标签的KASAN模式仅在Clang中受支持。
> +
> +硬件KASAN模式（#3）依赖硬件来执行检查，但仍需要支持内存标签指令的
> +编译器版本。GCC 10+和Clang 11+支持此模式。
> +
> +两种软件KASAN模式都适用于SLUB和SLAB内存分配器，
> +而基于硬件标签的KASAN目前仅支持SLUB。
> +
> +目前x86_64、arm、arm64、xtensa、s390、riscv架构支持通用KASAN模式，
> +仅arm64架构支持基于标签的KASAN模式。
> +
> +用法
> +----
> +
> +要启用KASAN，请使用以下命令配置内核::
> +
> +	  CONFIG_KASAN=y
> +
> +同时在 ``CONFIG_KASAN_GENERIC`` (启用通用KASAN模式)，
> +``CONFIG_KASAN_SW_TAGS`` (启用基于硬件标签的KASAN模式)，
> +和 ``CONFIG_KASAN_HW_TAGS`` (启用基于硬件标签的KASAN模式)之间进行选择。
> +
> +对于软件模式，还可以在 ``CONFIG_KASAN_OUTLINE`` 和
> +``CONFIG_KASAN_INLINE`` 之间进行选择。outline和inline是编译器检测类型。
> +前者产生较小的二进制文件，而后者快1.1-2倍。
> +
> +要将受影响的slab对象的alloc和free堆栈跟踪包含到报告中，
> +请启用``CONFIG_STACKTRACE`` 。要包括受影响物理页面的分配和释放堆栈跟踪的话，
> +请启用 ``CONFIG_PAGE_OWNER`` 并使用 ``page_owner=on`` 进行引导。
> +
> +错误报告
> +~~~~~~~~
> +
> +典型的KASAN报告如下所示::
> +
> +    ==================================================================
> +    BUG: KASAN: slab-out-of-bounds in kmalloc_oob_right+0xa8/0xbc [test_kasan]
> +    Write of size 1 at addr ffff8801f44ec37b by task insmod/2760
> +
> +    CPU: 1 PID: 2760 Comm: insmod Not tainted 4.19.0-rc3+ #698
> +    Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
> +    Call Trace:
> +     dump_stack+0x94/0xd8
> +     print_address_description+0x73/0x280
> +     kasan_report+0x144/0x187
> +     __asan_report_store1_noabort+0x17/0x20
> +     kmalloc_oob_right+0xa8/0xbc [test_kasan]
> +     kmalloc_tests_init+0x16/0x700 [test_kasan]
> +     do_one_initcall+0xa5/0x3ae
> +     do_init_module+0x1b6/0x547
> +     load_module+0x75df/0x8070
> +     __do_sys_init_module+0x1c6/0x200
> +     __x64_sys_init_module+0x6e/0xb0
> +     do_syscall_64+0x9f/0x2c0
> +     entry_SYSCALL_64_after_hwframe+0x44/0xa9
> +    RIP: 0033:0x7f96443109da
> +    RSP: 002b:00007ffcf0b51b08 EFLAGS: 00000202 ORIG_RAX: 00000000000000af
> +    RAX: ffffffffffffffda RBX: 000055dc3ee521a0 RCX: 00007f96443109da
> +    RDX: 00007f96445cff88 RSI: 0000000000057a50 RDI: 00007f9644992000
> +    RBP: 000055dc3ee510b0 R08: 0000000000000003 R09: 0000000000000000
> +    R10: 00007f964430cd0a R11: 0000000000000202 R12: 00007f96445cff88
> +    R13: 000055dc3ee51090 R14: 0000000000000000 R15: 0000000000000000
> +
> +    Allocated by task 2760:
> +     save_stack+0x43/0xd0
> +     kasan_kmalloc+0xa7/0xd0
> +     kmem_cache_alloc_trace+0xe1/0x1b0
> +     kmalloc_oob_right+0x56/0xbc [test_kasan]
> +     kmalloc_tests_init+0x16/0x700 [test_kasan]
> +     do_one_initcall+0xa5/0x3ae
> +     do_init_module+0x1b6/0x547
> +     load_module+0x75df/0x8070
> +     __do_sys_init_module+0x1c6/0x200
> +     __x64_sys_init_module+0x6e/0xb0
> +     do_syscall_64+0x9f/0x2c0
> +     entry_SYSCALL_64_after_hwframe+0x44/0xa9
> +
> +    Freed by task 815:
> +     save_stack+0x43/0xd0
> +     __kasan_slab_free+0x135/0x190
> +     kasan_slab_free+0xe/0x10
> +     kfree+0x93/0x1a0
> +     umh_complete+0x6a/0xa0
> +     call_usermodehelper_exec_async+0x4c3/0x640
> +     ret_from_fork+0x35/0x40
> +
> +    The buggy address belongs to the object at ffff8801f44ec300
> +     which belongs to the cache kmalloc-128 of size 128
> +    The buggy address is located 123 bytes inside of
> +     128-byte region [ffff8801f44ec300, ffff8801f44ec380)
> +    The buggy address belongs to the page:
> +    page:ffffea0007d13b00 count:1 mapcount:0 mapping:ffff8801f7001640 index:0x0
> +    flags: 0x200000000000100(slab)
> +    raw: 0200000000000100 ffffea0007d11dc0 0000001a0000001a ffff8801f7001640
> +    raw: 0000000000000000 0000000080150015 00000001ffffffff 0000000000000000
> +    page dumped because: kasan: bad access detected
> +
> +    Memory state around the buggy address:
> +     ffff8801f44ec200: fc fc fc fc fc fc fc fc fb fb fb fb fb fb fb fb
> +     ffff8801f44ec280: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> +    >ffff8801f44ec300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03
> +                                                                    ^
> +     ffff8801f44ec380: fc fc fc fc fc fc fc fc fb fb fb fb fb fb fb fb
> +     ffff8801f44ec400: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> +    ==================================================================
> +
> +报告标题总结了发生的错误类型以及导致该错误的访问类型。
> +紧随其后的是错误访问的堆栈跟踪、所访问内存分配位置的堆栈跟踪
> +（对于访问了slab对象的情况）以及对象被释放的位置的堆栈跟踪
> +（对于访问已释放内存的问题报告）。接下来是对访问的slab对象
> +的描述以及关于访问的内存页的信息。
> +
> +最后，报告展示了访问地址周围的内存状态。在内部，
> +KASAN单独跟踪每个内存颗粒的内存状态，根据KASAN模式分为8或16个对齐字节。
> +报告的内存状态部分中的每个数字都显示了围绕访问地址的其中一个内存颗粒的状态。
> +
> +对于通用KASAN，每个内存颗粒的大小为8个字节。每个颗粒的状态被编码在一个影子字节中。
> +这8个字节可以是可访问的，部分访问的，已释放的或成为Redzone的一部分。
> +KASAN对每个影子字节使用以下编码:00表示对应内存区域的所有8个字节都可以访问；
> +数字N (1 <= N <= 7)表示前N个字节可访问，其他(8 - N)个字节不可访问；
> +任何负值都表示无法访问整个8字节。KASAN使用不同的负值来区分不同类型的不可访问内存，
> +如redzones或已释放的内存（参见 mm/kasan/kasan.h）。
> +
> +在上面的报告中，箭头指向影子字节 ``03``，表示访问的地址是部分可访问的。
> +
> +对于基于标签的KASAN模式，报告最后的部分显示了访问地址周围的内存标签
> +(参考 `实施细则`_ 章节)。
> +
> +请注意，KASAN错误标题（如 ``slab-out-of-bounds`` 或 ``use-after-free`` ）
> +是尽量接近的:KASAN根据其拥有的有限信息打印出最可能的错误类型。
> +错误的实际类型可能会有所不同。
> +
> +通用KASAN还报告两个辅助调用堆栈跟踪。这些堆栈跟踪指向代码
> +中与对象交互但不直接出现在错误访问堆栈跟踪中的位置。
> +目前，这包括 call_rcu() 和排队的工作队列。
> +
> +启动参数
> +~~~~~~~~
> +
> +KASAN受通用 ``panic_on_warn`` 命令行参数的影响。
> +启用该功能后，KASAN在打印错误报告后会引起内核恐慌。
> +
> +默认情况下，KASAN只为第一次无效内存访问打印错误报告。使用 ``kasan_multi_shot`` ，
> +KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告的 ``panic_on_warn`` 。
> +
> +基于硬件标签的KASAN模式（请参阅下面有关各种模式的部分）旨在在生产中用作安全缓解措施。
> +因此，它支持允许禁用KASAN或控制其功能的引导参数。
> +
> +- ``kasan=off`` 或 ``=on`` 控制KASAN是否启用 (默认: ``on`` )。
> +
> +- ``kasan.mode=sync`` 或 ``=async`` 控制KASAN是否配置为同步
> +  或异步执行模式(默认: ``sync`` )。
> +  同步模式：当标签检查错误发生时，立即检测到错误访问。
> +  异步模式：延迟错误访问检测。当标签检查错误发生时，信息存储在硬件中
> +  （在arm64的TFSR_EL1寄存器中）。内核会定期检查硬件，并且仅在这些检查期间报告标签错误。
> +
> +- ``kasan.stacktrace=off`` 或 ``=on`` 禁用或启用alloc和free堆栈跟踪收集(默认: ``on`` )。
> +
> +- ``kasan.fault=report`` 或 ``=panic`` 控制是只打印KASAN报告还是同时使内核恐慌
> +  (默认: ``report`` )。即使启用了 ``kasan_multi_shot``，也会发生内核恐慌。
> +
> +实施细则
> +---------
> +
> +通用KASAN
> +~~~~~~~~~~
> +
> +软件KASAN模式使用影子内存来记录每个内存字节是否可以安全访问，
> +并使用编译时工具在每次内存访问之前插入影子内存检查。
> +
> +通用KASAN将1/8的内核内存专用于其影子内存（16TB以覆盖x86_64上的 128TB），
> +并使用具有比例和偏移量的直接映射将内存地址转换为其相应的影子地址。
> +
> +这是将地址转换为其相应影子地址的函数::
> +
> +    static inline void *kasan_mem_to_shadow(const void *addr)
> +    {
> +	return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
> +		+ KASAN_SHADOW_OFFSET;
> +    }
> +
> +在这里 ``KASAN_SHADOW_SCALE_SHIFT = 3``。
> +
> +编译时工具用于插入内存访问检查。编译器在每次访问大小为
> +1、2、4、8或16的内存之前插入函数调用
> +(``__asan_load*(addr)``, ``__asan_store*(addr)``)。
> +这些函数通过检查相应的影子内存来检查内存访问是否有效。
> +
> +使用inline检测，编译器不进行函数调用，而是直接插入代码
> +来检查影子内存。此选项显著地增大了内核体积，
> +但与outline检测内核相比，它提供了x1.1-x2的性能提升。
> +
> +通用KASAN是唯一一种通过隔离延迟重新使用已释放对象的模式
> +（参见 mm/kasan/quarantine.c 以了解实现）。
> +
> +基于软件标签的KASAN模式
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +基于软件标签的KASAN使用软件内存标签方法来检查访问有效性。
> +目前仅针对arm64架构实现。
> +
> +基于软件标签的KASAN使用arm64 CPU的顶部字节忽略(TBI)
> +特性在内核指针的顶部字节中存储一个指针标签。
> +它使用影子内存来存储与每个16字节内存单元相关的内存标签
> +(因此，它将内核内存的1/16专用于影子内存)。
> +
> +在每次内存分配时，基于软件标签的KASAN都会生成一个随机标签，
> +用这个标签标记分配的内存，并将相同的标签嵌入到返回的指针中。
> +
> +基于软件标签的KASAN使用编译时工具在每次内存访问之前插入检查。
> +这些检查确保正在访问的内存的标签等于用于访问该内存的指针的标签。
> +如果标签不匹配，基于软件标签的KASAN会打印错误报告。
> +
> +基于软件标签的KASAN也有两种检测模式（outline，
> +发出回调来检查内存访问；inline，执行内联的影子内存检查）。
> +使用outline检测模式，会从执行访问检查的函数打印错误报告。
> +使用inline检测，编译器会发出 ``brk`` 指令，并使用专用的
> +``brk`` 处理程序来打印错误报告。
> +
> +基于软件标签的KASAN使用0xFF作为匹配所有指针标签
> +（不检查通过带有0xFF指针标签的指针进行的访问）。
> +值0xFE当前保留用于标记已释放的内存区域。
> +
> +基于软件标签的KASAN目前仅支持对Slab和page_alloc内存进行标记。
> +
> +基于硬件标签的KASAN模式
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +基于硬件标签的KASAN在概念上类似于软件模式，
> +但它是使用硬件内存标签作为支持而不是编译器检测和影子内存。
> +
> +基于硬件标签的KASAN目前仅针对arm64架构实现，并且基于ARMv8.5
> +指令集架构中引入的arm64内存标记扩展(MTE)和最高字节忽略(TBI)。
> +
> +特殊的arm64指令用于为每次内存分配指定内存标签。
> +相同的标签被指定给指向这些分配的指针。在每次内存访问时，
> +硬件确保正在访问的内存的标签等于用于访问该内存的指针的标签。
> +如果标签不匹配，则会生成故障并打印报告。
> +
> +基于硬件标签的KASAN使用0xFF作为匹配所有指针标签
> +（不检查通过带有0xFF指针标签的指针进行的访问）。
> +值0xFE当前保留用于标记已释放的内存区域。
> +
> +基于硬件标签的KASAN目前仅支持对Slab和page_alloc内存进行标记。
> +
> +如果硬件不支持MTE（ARMv8.5之前），则不会启用基于硬件标签的KASAN。
> +在这种情况下，所有KASAN引导参数都将被忽略。
> +
> +请注意，启用CONFIG_KASAN_HW_TAGS始终会导致启用内核中的TBI。
> +即使提供了 ``kasan.mode=off`` 或硬件不支持MTE（但支持TBI）。
> +
> +基于硬件标签的KASAN只报告第一个发现的错误。之后，MTE标签检查将被禁用。
> +
> +影子内存
> +--------
> +
> +内核将内存映射到地址空间的几个不同部分。内核虚拟地址的范围很大：
> +没有足够的真实内存来支持内核可以访问的每个地址的真实影子区域。
> +因此，KASAN只为地址空间的某些部分映射真实的影子。
> +
> +默认行为
> +~~~~~~~~
> +
> +默认情况下，体系结构仅将实际内存映射到用于线性映射的阴影区域
> +（以及可能的其他小区域）。对于所有其他区域 —— 例如vmalloc和vmemmap空间 ——
> +一个只读页面被映射到阴影区域上。这个只读的影子页面声明所有内存访问都是允许的。
> +
> +这给模块带来了一个问题：它们不存在于线性映射中，而是存在于专用的模块空间中。
> +通过连接模块分配器，KASAN临时映射真实的影子内存以覆盖它们。
> +例如，这允许检测对模块全局变量的无效访问。
> +
> +这也造成了与 ``VMAP_STACK`` 的不兼容：如果堆栈位于vmalloc空间中，
> +它将被分配只读页面的影子内存，并且内核在尝试为堆栈变量设置影子数据时会出错。
> +
> +CONFIG_KASAN_VMALLOC
> +~~~~~~~~~~~~~~~~~~~~
> +
> +使用 ``CONFIG_KASAN_VMALLOC`` ，KASAN可以以更大的内存使用
> +为代价覆盖vmalloc空间。目前，这在x86、riscv、s390和powerpc上受支持。
> +
> +这通过连接到vmalloc和vmap并动态分配真实的影子内存来支持映射。
> +
> +vmalloc空间中的大多数映射都很小，需要不到一整页的阴影空间。
> +因此，为每个映射分配一个完整的影子页面将是一种浪费。
> +此外，为了确保不同的映射使用不同的影子页面，映射必须与
> +``KASAN_GRANULE_SIZE * PAGE_SIZE`` 对齐。
> +
> +相反，KASAN跨多个映射共享后备空间。当vmalloc空间中的映射使用
> +影子区域的特定页面时，它会分配一个后备页面。
> +此页面稍后可以由其他vmalloc映射共享。
> +
> +KASAN连接到vmap基础架构以懒清理未使用的影子内存。
> +
> +为了避免交换映射的困难，KASAN预测覆盖vmalloc空间的阴影区域部分将不会被
> +早期的阴影页面覆盖，但是将不会被映射。这将需要更改特定于arch的代码。
> +
> +这允许在x86上支持 ``VMAP_STACK`` ，并且可以简化对没有固定模块区域的架构的支持。
> +
> +对于开发者
> +----------
> +
> +忽略访问
> +~~~~~~~~
> +
> +软件KASAN模式使用编译器检测来插入有效性检查。
> +此类检测可能与内核的某些部分不兼容，因此需要禁用。
> +
> +内核的其他部分可能会访问已分配对象的元数据。通常，KASAN会检测并报告此类访问，
> +但在某些情况下（例如，在内存分配器中），这些访问是有效的。
> +
> +对于软件KASAN模式，要禁用特定文件或目录的检测，
> +请将​​ ``KASAN_SANITIZE`` 添加到相应的内核Makefile中:
> +
> +- 对于单个文件(例如，main.o)::
> +
> +    KASAN_SANITIZE_main.o := n
> +
> +- 对于一个目录下的所有文件::
> +
> +    KASAN_SANITIZE := n
> +
> +对于软件KASAN模式，要在每个函数的基础上禁用检测，请使用KASAN
> +特定的 ``__no_sanitize_address`` 函数属性或某个通用的 ``noinstr`` 。
> +
> +请注意，禁用编译器检测（基于每个文件或每个函数）会使KASAN忽略在
> +软件KASAN模式的代码中直接发生的访问。当访问是间接发生的（通过调用检测函数）
> +或使用没有编译器检测的基于硬件标签的模式时，它没有帮助。
> +
> +对于软件KASAN模式，要在当前任务的一部分内核代码中禁用KASAN报告，
> +请使用 ``kasan_disable_current()``/``kasan_enable_current()``
> +部分注释这部分代码。这也会禁用通过函数调用发生的间接访问的报告。
> +
> +对于基于标签的KASAN模式（包括硬件模式），要禁用访问检查，
> +请使用 ``kasan_reset_tag()`` 或 ``page_kasan_tag_reset()`` 。
> +请注意，通过 ``page_kasan_tag_reset()`` 临时禁用访问检查需要通过
> +``page_kasan_tag``/``page_kasan_tag_set`` 保存和恢复每页KASAN标签。
> +
> +测试
> +~~~~
> +
> +有一些KASAN测试可以验证KASAN是否正常工作并可以检测某些类型的内存损坏。
> +测试由两部分组成:
> +
> +1. 与KUnit测试框架集成的测试。使用 ``CONFIG_KASAN_KUNIT_TEST`` 启用。
> +这些测试可以通过几种不同的方式自动运行和部分验证；请参阅下面的说明。
> +
> +2. 与KUnit不兼容的测试。使用 ``CONFIG_KASAN_MODULE_TEST``
> +启用并且只能作为模块运行。这些测试只能通过加载内核模块并检查内核
> +日志以获取KASAN报告来手动验证。
> +
> +如果检测到错误，每个KUnit兼容的KASAN测试都会打印多个KASAN报告之一，
> +然后测试打印其编号和状态。
> +
> +当测试通过::
> +
> +        ok 28 - kmalloc_double_kzfree
> +
> +当由于 ``kmalloc`` 失败而导致测试失败时::
> +
> +        # kmalloc_large_oob_right: ASSERTION FAILED at lib/test_kasan.c:163
> +        Expected ptr is not null, but is
> +        not ok 4 - kmalloc_large_oob_right
> +
> +当由于缺少KASAN报告而导致测试失败时::
> +
> +        # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:629
> +        Expected kasan_data->report_expected == kasan_data->report_found, but
> +        kasan_data->report_expected == 1
> +        kasan_data->report_found == 0
> +        not ok 28 - kmalloc_double_kzfree
> +
> +最后打印所有KASAN测试的累积状态。成功::
> +
> +        ok 1 - kasan
> +
> +或者，如果其中一项测试失败::
> +
> +        not ok 1 - kasan
> +
> +有几种方法可以运行与KUnit兼容的KASAN测试。
> +
> +1. 可加载模块
> +
> +   启用 ``CONFIG_KUNIT`` 后，KASAN-KUnit测试可以构建为可加载模块，
> +   并通过使用 ``insmod`` 或 ``modprobe`` 加载 ``test_kasan.ko`` 来运行。
> +
> +2. 内置
> +
> +   通过内置 ``CONFIG_KUNIT`` ，也可以内置KASAN-KUnit测试。
> +   在这种情况下，测试将在启动时作为后期初始化调用运行。
> +
> +3. 使用kunit_tool
> +
> +   通过内置 ``CONFIG_KUNIT`` 和 ``CONFIG_KASAN_KUNIT_TEST`` ，
> +   还可以使用 ``kunit_tool`` 以更易读的方式查看KUnit测试的结果。
> +   这不会打印通过测试的KASAN报告。有关 ``kunit_tool`` 的更多最新信息，
> +   请参阅 `KUnit文档 <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html>`_ 。
> +
> +.. _KUnit: https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
> 
